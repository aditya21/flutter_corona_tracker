// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future getAll() {
    final $url = '/data.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send($request);
  }

  Future getStates() {
    final $url = '/v2/state_district_wise.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send($request);
  }
}
