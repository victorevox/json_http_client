import 'dart:convert';

import 'dart:typed_data';

import 'package:http/http.dart' as http;

const String CONTENT_TYPE_HEADER = "Content-Type";

class JsonHttpClient<T extends http.Client> implements http.Client {
  http.Client _httpClient;
  final Encoding encoding;

  JsonHttpClient({
    http.Client client,
    this.encoding = utf8,
  }) {
    _httpClient = client is http.Client ? client : http.Client();
  }

  @override
  void close() {
    _httpClient.close();
  }

  @override
  Future<http.Response> delete(url, {Map<String, String> headers}) {
    return _httpClient.delete(url, headers: _getCustomHeaders(headers)).then(getResponseWithCustomDecoder);
  }

  @override
  Future<http.Response> get(url, {Map<String, String> headers}) {
    return _httpClient.get(url, headers: _getCustomHeaders(headers)).then(getResponseWithCustomDecoder);
  }

  @override
  Future<http.Response> head(url, {Map<String, String> headers}) {
    return _httpClient.head(url, headers: _getCustomHeaders(headers)).then(getResponseWithCustomDecoder);
  }

  @override
  Future<http.Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _httpClient
        .patch(url, headers: _getCustomHeaders(headers), body: body, encoding: encoding)
        .then(getResponseWithCustomDecoder);
  }

  @override
  Future<http.Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _httpClient
        .post(url, headers: _getCustomHeaders(headers), body: body, encoding: encoding)
        .then(getResponseWithCustomDecoder);
  }

  @override
  Future<http.Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _httpClient
        .put(url, headers: _getCustomHeaders(headers), body: body, encoding: encoding)
        .then(getResponseWithCustomDecoder);
  }

  @override
  Future<String> read(url, {Map<String, String> headers}) {
    return _httpClient.read(url, headers: _getCustomHeaders(headers));
  }

  @override
  Future<Uint8List> readBytes(url, {Map<String, String> headers}) {
    return _httpClient.readBytes(url, headers: _getCustomHeaders(headers));
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _httpClient.send(request);
  }

  Map<String, String> _getCustomHeaders(Map<String, String> headers) {
    final Map<String, String> baseHeaders = headers is Map ? headers : {};
    baseHeaders.putIfAbsent(CONTENT_TYPE_HEADER, () => "application/json");
    return baseHeaders;
  }

  http.Response getResponseWithCustomDecoder(http.Response response) {
    String decoded;
    try {
      final codeUnits = response?.bodyBytes;
      decoded = encoding.decode(codeUnits);
    } catch (e) {
      decoded = response.body;
    }
    final newHeaders = response.headers.map((key, value) {
      if (RegExp(CONTENT_TYPE_HEADER, caseSensitive: false).hasMatch(key)) {
        String defaultContentType = value;
        final hasCharSet = RegExp("charset").hasMatch(defaultContentType ?? "");
        if (!hasCharSet) {
          return MapEntry(key, "$defaultContentType; charset=${encoding.name}");
        }
      }
      return MapEntry(key, value);
    });
    return http.Response(
      decoded,
      response.statusCode,
      headers: newHeaders,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
      request: response.request,
    );
  }
}
