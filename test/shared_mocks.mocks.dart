// Mocks generated by Mockito 5.0.14 from annotations
// in json_http_client/test/shared_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i2;
import 'dart:typed_data' as _i6;

import 'package:http/http.dart' as _i3;
import 'package:json_http_client/client.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEncoding_0 extends _i1.Fake implements _i2.Encoding {}

class _FakeResponse_1 extends _i1.Fake implements _i3.Response {}

class _FakeStreamedResponse_2 extends _i1.Fake implements _i3.StreamedResponse {
}

/// A class which mocks [JsonHttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockJsonHttpClient<T extends _i3.Client> extends _i1.Mock
    implements _i4.JsonHttpClient<T> {
  MockJsonHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Encoding get encoding => (super.noSuchMethod(Invocation.getter(#encoding),
      returnValue: _FakeEncoding_0()) as _i2.Encoding);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i5.Future<_i3.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i6.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i6.Uint8List>.value(_i6.Uint8List(0)))
          as _i5.Future<_i6.Uint8List>);
  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2()))
          as _i5.Future<_i3.StreamedResponse>);
  @override
  _i3.Response getResponseWithCustomDecoder(_i3.Response? response) =>
      (super.noSuchMethod(
          Invocation.method(#getResponseWithCustomDecoder, [response]),
          returnValue: _FakeResponse_1()) as _i3.Response);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i3.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i6.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i6.Uint8List>.value(_i6.Uint8List(0)))
          as _i5.Future<_i6.Uint8List>);
  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2()))
          as _i5.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}