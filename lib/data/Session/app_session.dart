import 'package:easyrent/data/models/user_model.dart';

class AppSession {
  static final AppSession _instance = AppSession._internal();

  factory AppSession() {
    return _instance;
  }

  AppSession._internal();

  User? user;
}

