import 'package:flutter/material.dart';
import 'package:list_users/service.dart';
import 'package:list_users/user_model.dart';

class UserViewModel extends ChangeNotifier {
  final UserListService service = UserListService();
  List<UserModel> listOfUsers = [];
  bool isLoading = false;
  String? errorMessage;

  UserViewModel();

  Future<void> getUserList() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      listOfUsers = await service.fetchUser();
    } catch (e) {
      errorMessage = 'There was an error: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
