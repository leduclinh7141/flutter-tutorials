import 'package:flutter/widgets.dart';
import 'package:provider_architecture/core/services/authentication_sevice.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
}
