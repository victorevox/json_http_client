import 'package:flutter_test/flutter_test.dart';
import 'package:json_http_client/client.dart';
import 'package:json_http_client/constants.dart';
import 'package:mockito/mockito.dart';
import './mocks.dart';

void main(){

  JsonHttpClient authClient;
  // We mockup a http client so that way we can spy on it
  MockHttpClient mockHttpClient;
  final String mockApiPath = "https://test.com/api";
  final expectedHeaders = {
    "Content-Type": "application/json"
  };

  setUp(() {
    mockHttpClient = MockHttpClient();
    authClient = JsonHttpClient(
      client: mockHttpClient
    );
  });

  group("Http client methods when authenticated", () {
    test("should set ${JsonHttpClientKeys.contentTypeHeader} Header To 'application/json", () {
      // act
      authClient.head(mockApiPath);
      authClient.get(mockApiPath);
      authClient.put(mockApiPath);
      authClient.post(mockApiPath);
      authClient.patch(mockApiPath);
      // assert
      verify(mockHttpClient.head(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.get(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.put(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.post(mockApiPath, headers: expectedHeaders));
      verify(mockHttpClient.patch(mockApiPath, headers: expectedHeaders));
    });

    test("should not set ${JsonHttpClientKeys.contentTypeHeader} Header if ${JsonHttpClientKeys.contentTypeHeader} header is set", () {
      // act
      authClient.head(mockApiPath, headers: {
        "${JsonHttpClientKeys.contentTypeHeader}": ""
      });
      authClient.get(mockApiPath, headers: {
        "${JsonHttpClientKeys.contentTypeHeader}": ""
      });
      authClient.put(mockApiPath, headers: {
        "${JsonHttpClientKeys.contentTypeHeader}": ""
      });
      authClient.post(mockApiPath, headers: {
        "${JsonHttpClientKeys.contentTypeHeader}": ""
      });
      authClient.patch(mockApiPath, headers: {
        "${JsonHttpClientKeys.contentTypeHeader}": ""
      });
      // assert
      final matcher = () => argThat(containsPair("Content-Type", ""), named: "headers");
      verify(mockHttpClient.head(mockApiPath, headers: matcher()));
      verify(mockHttpClient.get(mockApiPath, headers: matcher()));
      verify(mockHttpClient.put(mockApiPath, headers: matcher()));
      verify(mockHttpClient.post(mockApiPath, headers: matcher()));
      verify(mockHttpClient.patch(mockApiPath, headers: matcher()));
    });
  });

}
