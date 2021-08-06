import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import '../lib/client.dart';

@GenerateMocks([JsonHttpClient], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}