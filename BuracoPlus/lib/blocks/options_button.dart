import 'package:buracoplus/blocks/lobby_option_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/helpers/modal_helpers.dart';
import 'package:buracoplus/models/options_model.dart';
import 'package:buracoplus/providers/theme_provider.dart';

class OptionsButton extends StatelessWidget {
  final VoidCallback toggleMenu;

  const OptionsButton({super.key, required this.toggleMenu});

  @override
  Widget build(BuildContext context) {
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
          const Text('Settings', style: TextStyle(color: Colors.white)),
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
                      child: const Row(
                        children: [
                          Icon(Icons.settings, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Settings',
                            style: TextStyle(
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

    return [
      OptionGroup(
        title: 'Generale',
        options: [
          OptionItem(
            title: 'Dark Mode',
            isSwitch: true,
            switchValue: true,
            onSwitchChanged: (val) {
              themeProvider.toggleTheme();
            },
            onTap: (context) {},
          ),
          OptionItem(
            title: 'Lobby',
            customWidget: const LobbyOptionItem(),
            onTap: (context) {},
          ),
          OptionItem(
            title: 'Lingua',
            requireLoggedIn: true,
            onTap: (context) {
              ModalHelpers.showLanguagesMenu(context);
            },
          ),
          OptionItem(
            title: 'Ordinamento manuale',
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
            title: 'Rotazione carte',
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
            title: 'Rotazione carte superiori',
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
        title: 'Notifiche',
        options: [
          OptionItem(
            title: 'Nuovi messaggi',
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
            title: 'Richieste di amicizia',
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
            title: 'Tornei',
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
        title: 'Suoni',
        options: [
          OptionItem(
            title: 'Suoni di sistema',
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
            title: 'Trillo',
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
        title: 'Restrizioni',
        options: [
          OptionItem(
            title: 'Richieste di amicizia',
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
            title: 'Inviti clubs',
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
            title: 'Inviti al tavolo',
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
