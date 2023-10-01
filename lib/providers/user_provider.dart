import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  String? _pin = '';
  String? _imagePath = '';
  final List<String> _documentImagePaths = [];

  String? get pin => _pin;
  String? get imagePath => _imagePath;
  List<String> get documentImagePaths => _documentImagePaths;

  void setData({
    String? pin,
  }) {
    _pin = pin;
    notifyListeners();
  }

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }

  void addDocumentImagePath(String imagePath) {
    _documentImagePaths.add(imagePath);
    notifyListeners();
  }
}