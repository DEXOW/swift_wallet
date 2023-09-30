import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String? pin;

  UserData({
    required this.pin
  });

  void setData({
    String? pin,
  }) {
    this.pin = pin;
    notifyListeners();
  }
}

class UserDataProvider extends ChangeNotifier {
  final UserData _userData = UserData(
    pin: null
  );

  UserData get userData => _userData;

  void setData({
    String? pin,
  }) {
    _userData.setData(
      pin: pin,
    );
    notifyListeners();
  }
}