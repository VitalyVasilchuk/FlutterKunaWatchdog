import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SettingsContainer(
        children: [
          SettingsGroup(
            title: 'General',
            children: [
              DropDownSettingsTile(
                title: 'Sort list of tickers',
                values: const {
                  0: 'Base Unit',
                  1: 'Quote Unit',
                },
                settingKey: 'key_general_sort_list_of_tickers',
                selected: 0,
              ),
              DropDownSettingsTile(
                title: 'Chart frame of market',
                values: const {
                  0: '5 minutes (M5)',
                  1: '15 minutes (M15)',
                  2: '30 minutes (M30)',
                  3: 'Hour (H1)',
                  4: 'Day (D1)',
                  5: 'Week (W1)',
                },
                settingKey: 'key_general_chart_frame_of_market',
                selected: 3,
              ),
            ],
          ),
          SettingsGroup(
            title: 'CoinMarketCap',
            children: [
              TextInputSettingsTile(
                title: 'API key',
                settingKey: 'key_cmc_api_key',
                validator: (s) =>
                    s?.length == 36 ? null : 'API key can\'t be smaller than 36 letters',
              )
            ],
          ),
          SettingsGroup(
            title: 'Other',
            children: [
              SwitchSettingsTile(
                onChange: (v) {v? ThemeMode.dark : ThemeMode.light;},
                title: 'Dark theme',
                settingKey: 'key_other_dark_theme',
              ),
            ],
          ),
        ],
      );
}
