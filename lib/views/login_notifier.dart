import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/services/firebase_authentication.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier(this.locator);

  final Locator locator;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loginWithGoogle() async {
    _setLoading();
    await locator<Firebase_Authentication>().loginWithGoogle();
    _setNotLoading();
  }

  void _setLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _setNotLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
