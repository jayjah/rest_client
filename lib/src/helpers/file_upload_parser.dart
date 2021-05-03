part of dart_backend_client;

class MultipartBodyParser {
  const MultipartBodyParser(this.boundary)
      : assert(
          boundary != null,
          'The boundary is empty. Please set it and keep on mind that it '
          ' MUST NOT appear inside any of the encapsulated parts.'
          ' Example: "sampleBoundary7da24f2e50046".',
        );

  final String? boundary;

  List<int> get encodedNonLastBoundary => ascii.encode('\r\n--$boundary\r\n');

  List<int> get encodedLastBoundary =>
      ascii.encode('\r\n--$boundary--\r\n\r\n');

  List<int> parse(List<_BodyPart>? parts) {
    if (parts == null || parts.isEmpty) {
      throw const BackendClientException(
        'Parts CAN NOT be empty. Please set at least one part of body.',
      );
    }
    var body = encodedNonLastBoundary;
    parts.forEach((part) {
      body += part.parse();
      if (parts.last != part) {
        body += encodedNonLastBoundary;
      }
    });
    return body += encodedLastBoundary;
  }
}

class TextBodyPart extends _BodyPart {
  TextBodyPart(String formFieldName, String? _content)
      : content = _content ?? '',
        super(
          _ContentDisposition(
            formFieldName,
            'form-data',
          ),
          const _ContentType(),
        );

  final String content;

  @override
  List<int> get encodedContent => ascii.encode(content);
}

class FileBodyPart extends _BodyPart {
  FileBodyPart(String formFieldName, this.fileName, this.file)
      : super(
          _ContentDisposition(
            formFieldName,
            'form-data',
            '; filename="$fileName"',
          ),
          const _ContentType('application/octet-stream'),
        );

  final dynamic file;
  final String fileName;

  @override
  List<int> get encodedContent {
    if (file is List<int>) {
      return file as List<int>;
    }
    if (file is File) {
      return (file as File).readAsBytesSync();
    }

    return <int>[];
  }
}

abstract class _BodyPart {
  const _BodyPart(this.contentDisposition, this.contentType)
      : assert(contentDisposition != null),
        assert(contentType != null);

  final _ContentDisposition? contentDisposition;
  final _ContentType? contentType;

  String get partHeader =>
      contentDisposition.toString() + contentType.toString();

  List<int> get encodedContent;

  List<int> parse() => (ascii.encode(partHeader)) + encodedContent;
}

class _ContentDisposition {
  const _ContentDisposition(this.formFieldName,
      [String? _formFieldType, String? _additionalParams])
      : formFieldType = _formFieldType ?? 'form-data',
        additionalParams = _additionalParams ?? '',
        assert(formFieldName != null);

  final String? formFieldName;
  final String formFieldType;
  final String additionalParams;

  @override
  String toString() =>
      'content-disposition: $formFieldType; name="$formFieldName"$additionalParams\r\n';
}

class _ContentType {
  const _ContentType([this.type = 'text/plain']) : assert(type != null);

  final String? type;

  @override
  String toString() => 'content-type: $type\r\n\r\n';
}
