import 'package:flutter/material.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({Key key, @required AuthenticationService auth})
      : _authenticationService = auth;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    int userId = int.tryParse(userIdText);
    bool success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
