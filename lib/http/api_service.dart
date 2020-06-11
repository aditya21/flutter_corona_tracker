import 'package:chopper/chopper.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class ApiService extends ChopperService {
  @Get(path: '/data.json')
  Future getAll();

  @Get(path: '/v2/state_district_wise.json')
  Future getStates();

  static ApiService create() {
    final _client = ChopperClient(
      baseUrl: 'https://api.covid19india.org',
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(_client);
  }
}
