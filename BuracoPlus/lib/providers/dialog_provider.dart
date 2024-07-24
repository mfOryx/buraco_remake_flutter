import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  bool isCreateTableVisible = false;
  bool isInviteFriendsVisible = false;

  bool get isCreateTableDialogVisible => isCreateTableVisible;
  bool get isInviteFriendsDialogVisible => isInviteFriendsVisible;

  void showCreateTableDialog() {
    isCreateTableVisible = true;
    notifyListeners();
  }

  void hideCreateTableDialog() {
    isCreateTableVisible = false;
    notifyListeners();
  }

  void showInviteFriendsDialog() {
    isInviteFriendsVisible = true;
    notifyListeners();
  }

  void hideInviteFriendsDialog() {
    isInviteFriendsVisible = false;
    notifyListeners();
  }
}