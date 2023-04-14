# JSON HTTP Client

A simple Flutter package for making HTTP requests with JSON content.

## Features

- Automatically sets `Content-Type` header to `application/json`
- Allows custom header configuration
- Handles response decoding with a custom decoder

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  json_http_client:
    git:
      url: https://github.com/victorevox/json_http_client.git
      ref: main
  http: ^0.13.5
```

Then, run `flutter pub get`.

## Usage

Import the package in your Dart code:

```dart
import 'package:json_http_client/json_http_client.dart';
```

Create a new instance of `JsonHttpClient`:

```dart
final jsonHttpClient = JsonHttpClient();
```

### Examples

#### GET request

```dart
Future<void> fetchData() async {
  final response = await jsonHttpClient.get('https://api.example.com/data');
  print(response.body);
}
```

#### POST request

```dart
Future<void> sendData(Map<String, dynamic> data) async {
  final response = await jsonHttpClient.post(
    'https://api.example.com/data',
    body: json.encode(data),
  );
  print(response.body);
}
```

### Custom Headers

You can set custom headers for your requests:

```dart
Future<void> fetchDataWithHeaders() async {
  final response = await jsonHttpClient.get(
    'https://api.example.com/data',
    headers: {
      'Authorization': 'Bearer your_token_here',
    },
  );
  print(response.body);
}
```

## API

The `JsonHttpClient` class implements the `http.Client` interface, so it provides the same methods:

- `delete`
- `get`
- `head`
- `patch`
- `post`
- `put`
- `read`
- `readBytes`
- `send`
- `close`

Refer to the [http package documentation](https://pub.dev/packages/http) for more information on using these methods.
