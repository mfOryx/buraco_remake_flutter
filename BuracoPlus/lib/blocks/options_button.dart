import 'package:buracoplus/blocks/lobby_option_item.dart';
import 'package:buracoplus/common/settingsManager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:buracoplus/helpers/modal_helpers.dart';
import 'package:buracoplus/models/options_model.dart';
import 'package:buracoplus/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class OptionsButton extends StatelessWidget {
  final VoidCallback toggleMenu;

  const OptionsButton({
    required this.toggleMenu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    // load the values from shared preferences at start
    final settingsManager = Provider.of<SettingsManager>(context);
    settingsManager.loadSettingsFromSharedPreferences();
   // fetch the settings data from the server



    return Positioned(
      top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl ? 120 : null,
      right: Directionality.of(context) == TextDirection.rtl ? null : 120,
      width: 70,
      height: 70,
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => showOptionsPanel(context),
          ),
          const SizedBox(height: 1),
          Text(translationManager.translate('txtSettings').toUpperCase(),
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  void showOptionsPanel(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext sheetContext) {
        return Consumer<ThemeProvider>(
          builder: (_, themeProvider, __) {
            final colors = themeProvider.currentColors;

            final translationManager = Provider.of<TranslationManager>(context);
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                color: colors.popupBackground,
                height: MediaQuery.of(sheetContext).size.height < 550
                    ? MediaQuery.of(sheetContext).size.height - 60
                    : MediaQuery.of(sheetContext).size.height - 120,
                width: MediaQuery.of(sheetContext).size.width / 2,
                child: Column(
                  children: [
                    Container(
                      color: colors.popupTitleBackground,
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          const Icon(Icons.settings, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(
                            translationManager
                                .translate('txtSettings')
                                .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: colors.popupExternalBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors.popupBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListView(
                              children: _buildOptionGroups(sheetContext)
                                  .map((group) =>
                                      _buildGroup(sheetContext, group))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<OptionGroup> _buildOptionGroups(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);
    return [
      OptionGroup(
        title: translationManager.translate('txtGeneral'),
        options: [
          OptionItem(
            title: translationManager.translate('txtDarkMode'),
            isSwitch: true,
            switchValue: settingsManager.darkMode,
            onSwitchChanged: (val) {
              themeProvider.toggleTheme();
              settingsManager.setDarkMode(val);
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtLobby'),
            customWidget: const LobbyOptionItem(),
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtLanguage'),
            requireLoggedIn: true,
            onTap: (context) {
              ModalHelpers.showLanguagesMenu(context);
            },
          ),
          OptionItem(
            title: translationManager.translate('txtManualSorting'),
            isSwitch: true,
            switchValue: settingsManager.manualSorting,
            onSwitchChanged: (val) {
              settingsManager.setManualSorting(val);
              if (kDebugMode) {
                print('Switch Ordinamento manuale: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtCardRotation'),
            isSwitch: true,
            switchValue: settingsManager.cardRotation,
            onSwitchChanged: (val) {
              settingsManager.setCardRotation(val);
              if (kDebugMode) {
                print('Switch Rotazione carte: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtTopCardRotation'),
            isSwitch: true,
            switchValue: settingsManager.topCardRotation,
            onSwitchChanged: (val) {
              settingsManager.setTopCardRotation(val);
              if (kDebugMode) {
                print('Switch Rotazione carte superiori: $val');
              }
            },
            onTap: (context) {},
          ),
        ],
      ),
      OptionGroup(
        title: translationManager.translate('txtNotifications'),
        options: [
          OptionItem(
            title: translationManager.translate('txtNewMessages'),
            isSwitch: true,
            switchValue: settingsManager.newMessages,
            onSwitchChanged: (val) {
              settingsManager.setNewMessages(val);
              if (kDebugMode) {
                print('Switch Nuovi messaggi: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtFriendRequests'),
            isSwitch: true,
            switchValue: settingsManager.friendRequestsNotification,
            onSwitchChanged: (val) {
              settingsManager.setFriendRequestsNotification(val);
              if (kDebugMode) {
                print('Switch Richieste di amicizia: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtTournaments'),
            isSwitch: true,
            switchValue: settingsManager.tournaments,
            onSwitchChanged: (val) {
              settingsManager.setTournaments(val);
              if (kDebugMode) {
                print('Switch Tornei: $val');
              }
            },
            onTap: (context) {},
          ),
        ],
      ),
      OptionGroup(
        title: translationManager.translate('txtSounds'),
        options: [
          OptionItem(
            title: translationManager.translate('txtSystemSounds'),
            isSwitch: true,
            switchValue: settingsManager.systemSounds,
            onSwitchChanged: (val) {
              settingsManager.setSystemSounds(val);
              if (kDebugMode) {
                print('Switch Suoni di sistema: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtNudge'),
            isSwitch: true,
            switchValue: settingsManager.trill,
            onSwitchChanged: (val) {
              settingsManager.setTrill(val);
              if (kDebugMode) {
                print('Switch Trillo: $val');
              }
            },
            onTap: (context) {},
          )
        ],
      ),
      OptionGroup(
        title: translationManager.translate('txtRestrictions'),
        options: [
          OptionItem(
            title: translationManager.translate('txtFriendRequests'),
            isSwitch: true,
            switchValue: settingsManager.friendRequestsRestrictions,
            onSwitchChanged: (val) {
              settingsManager.setFriendRequestsRestrictions(val);
              if (kDebugMode) {
                print('Switch Richieste di amicizia: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtClubInvites'),
            isSwitch: true,
            switchValue: settingsManager.clubInvites,
            onSwitchChanged: (val) {
              settingsManager.setClubInvites(val);
              if (kDebugMode) {
                print('Switch Inviti clubs: $val');
              }
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: translationManager.translate('txtInvitesToTable'),
            isSwitch: true,
            switchValue: settingsManager.invitesToTable,
            onSwitchChanged: (val) {
              settingsManager.setInvitesToTable(val);
              if (kDebugMode) {
                print('Switch Inviti al tavolo: $val');
              }
            },
            onTap: (context) {},
          ),
        ],
      ),
    ];
  }

  Widget _buildGroup(BuildContext context, OptionGroup group) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final colors = themeProvider.currentColors;

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(99, 86, 134, 0.4), width: 0.5)),
        ),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 24),
        child: Text(group.title,
            style: TextStyle(
                color: colors.optionTextColor, fontWeight: FontWeight.bold)),
      ),
      children: group.options
          .map((option) => _buildOptionItem(context, option))
          .toList(),
    );
  }

  Widget _buildOptionItem(BuildContext context, OptionItem item) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final colors = themeProvider.currentColors;
    if (item.customWidget != null) {
      return item
          .customWidget!; // Restituisce direttamente il widget personalizzato
    }

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(99, 86, 134, 0.4), width: 0.5)),
        ),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 16.0),
        child:
            Text(item.title, style: TextStyle(color: colors.optionTextColor)),
      ),
      trailing: item.isSwitch
          ? Switch(value: item.switchValue, onChanged: item.onSwitchChanged)
          : null,
      onTap: () => item.onTap(context),
    );
  }
}
