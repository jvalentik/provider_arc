import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../core/services/api_service.dart';
import '../core/services/authentication_service.dart';
import '../models/user.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(
    key: UniqueKey(),
    value: ApiService(),
  ),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<ApiService, AuthenticationService>(
    key: UniqueKey(),
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  )
];
List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  ),
];
