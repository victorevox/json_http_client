import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../lib/client.dart';

class MockHttpClient extends Mock implements http.Client {}

class JsonHttpClientMock extends Mock implements JsonHttpClient {}
