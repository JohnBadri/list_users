import 'package:flutter/material.dart';
import 'package:list_users/user_view_model.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late final UserViewModel _userViewModel;

  @override
  void initState() {
    super.initState();
    _userViewModel = UserViewModel();
    _userViewModel.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _userViewModel,
      builder: (BuildContext context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_userViewModel.isLoading)
              const CircularProgressIndicator.adaptive()
            else if (_userViewModel.errorMessage != null)
              Text(_userViewModel.errorMessage!)
            else if (_userViewModel.listOfUsers.isNotEmpty)
              ..._userViewModel.listOfUsers.map(
                (user) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('${user.id.toString()}: '), Text(user.name)],
                ),
              )
            else
              const Text('User list is currently empty'),
          ],
        );
      },
    );
  }
}
