import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  bool isCreateTableVisible = false;
  bool isInviteFriendsVisible = false;
  bool isPlayerProfileVisible = false;

  bool get isCreateTableDialogVisible => isCreateTableVisible;
  bool get isInviteFriendsDialogVisible => isInviteFriendsVisible;
  bool get isPlayerProfileDialogVisible => isPlayerProfileVisible;
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


  void showPlayerProfileDialog() {
    isPlayerProfileVisible = true;
    notifyListeners();
  }

  void hideProfileDialogVisible() {
    isPlayerProfileVisible = false;
    notifyListeners();
  }
}