import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_http_client/client.dart';
import 'package:json_http_client/constants.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import './mocks.dart';

void main() {
  JsonHttpClient jsonClient;
  // We mockup a http client so that way we can spy on it
  MockHttpClient mockHttpClient;
  final String mockApiPath = "https://test.com/api";
  final expectedHeaders = {"Content-Type": "application/json"};

  setUp(() {
    mockHttpClient = MockHttpClient();
    jsonClient = JsonHttpClient(client: mockHttpClient);
    stbMethodsOf(mockHttpClient);
  });

  group("Http client methods when authenticated", () {
    test("should set ${JsonHttpClientKeys.contentTypeHeader} Header To 'application/json", () {
      // act
      jsonClient.head(mockApiPath);
      jsonClient.get(mockApiPath);
      jsonClient.put(mockApiPath);
      jsonClient.post(mockApiPath);
      jsonClient.patch(mockApiPath);
      // assert
      verify(mockHttpClient.head(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.get(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.put(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.post(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.patch(mockApiPath, headers: expectedHeaders));
    });

    test(
        "should not set ${JsonHttpClientKeys.contentTypeHeader} Header if ${JsonHttpClientKeys.contentTypeHeader} header is set",
        () {
      // act
      jsonClient.head(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      jsonClient.get(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      jsonClient.put(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      jsonClient.post(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      jsonClient.patch(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      // assert
      final matcher = () => argThat(containsPair("Content-Type", ""), named: "headers");
      verify(mockHttpClient.head(mockApiPath, headers: matcher()));
      verify(mockHttpClient.get(mockApiPath, headers: matcher()));
      verify(mockHttpClient.put(mockApiPath, headers: matcher()));
      verify(mockHttpClient.post(mockApiPath, headers: matcher()));
      verify(mockHttpClient.patch(mockApiPath, headers: matcher()));
    });

    test("decoding overrides", () async {
      final response = File('test/fixtures/response.json').readAsStringSync(encoding: latin1);
      stbMethodsOf(
        mockHttpClient,
        response,
      );

      final res = await jsonClient.head(
        mockApiPath,
        headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""},
      );
      final decoded = jsonDecode(res.body);
      expect(decoded["data"]["name"], "Víctor René García");
      await jsonClient.get(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      await jsonClient.put(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      await jsonClient.post(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
      await jsonClient.patch(mockApiPath, headers: {"${JsonHttpClientKeys.contentTypeHeader}": ""});
    });
  });
}

stbMethodsOf(http.Client client, [String body = ""]) {
  when(client.head(
    any,
    headers: anyNamed("headers"),
  )).thenAnswer((realInvocation) async => http.Response(body, 200));
  when(client.get(
    any,
    headers: anyNamed("headers"),
  )).thenAnswer((realInvocation) async => http.Response(body, 200));
  when(client.put(
    any,
    headers: anyNamed("headers"),
  )).thenAnswer((realInvocation) async => http.Response(body, 200));
  when(client.post(
    any,
    headers: anyNamed("headers"),
  )).thenAnswer((realInvocation) async => http.Response(body, 200));
  when(client.patch(
    any,
    headers: anyNamed("headers"),
  )).thenAnswer((realInvocation) async => http.Response(body, 200));
}
