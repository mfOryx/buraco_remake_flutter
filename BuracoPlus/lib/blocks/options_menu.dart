// options_data.dart
import 'dart:js';
import 'package:buracoplus/helpers/modal_helpers.dart';
import 'package:buracoplus/models/options_model.dart';
import 'package:flutter/foundation.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

final List<OptionGroup> optionGroups = [
  OptionGroup(
    title: Provider.of<TranslationManager>(context as BuildContext)
        .translate('txtGeneral'),
    options: [
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtDarkMode'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {},
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtLobby'),
        requireLoggedIn: true,
        onTap: (context) {
          ModalHelpers.showLanguagesMenu(context);
        },
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtLanguage'),
        requireLoggedIn: true,
        onTap: (context) {
          ModalHelpers.showLanguagesMenu(context);
        },
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtManualSorting'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Ordinamento manuale: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtCardRotation'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Rotazione carte: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtTopCardRotation'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Rotazione carte superiori: $val');
          }
        },
        onTap: (context) {},
      ),
    ],
  ),
  OptionGroup(
    title: Provider.of<TranslationManager>(context as BuildContext)
        .translate('txtNotifications'),
    options: [
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtNewMessages'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Nuovi messaggi: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtFriendRequests'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Richieste di amicizia: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtTournaments'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Tornei: $val');
          }
        },
        onTap: (context) {},
      ),
    ],
  ),
  OptionGroup(
    title: Provider.of<TranslationManager>(context as BuildContext)
        .translate('txtSounds'),
    options: [
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtSystemSounds'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Suoni di sistema: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtNudge'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Trillo: $val');
          }
        },
        onTap: (context) {},
      )
    ],
  ),
  OptionGroup(
    title: Provider.of<TranslationManager>(context as BuildContext)
        .translate('txtRestrictions'),
    options: [
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtFriendRequests'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Richieste di amicizia: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtClubInvites'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Inviti clubs: $val');
          }
        },
        onTap: (context) {},
      ),
      OptionItem(
        title: Provider.of<TranslationManager>(context as BuildContext)
            .translate('txtInvitesToTable'),
        isSwitch: true,
        switchValue: true,
        onSwitchChanged: (val) {
          if (kDebugMode) {
            print('Switch Inviti al tavolo: $val');
          }
        },
        onTap: (context) {},
      ),
    ],
  ),
];
