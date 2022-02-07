import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:ticker/page/page_alerts.dart';
import 'package:ticker/page/page_dashboard.dart';
import 'package:ticker/page/page_more.dart';
import 'package:ticker/page/page_notifications.dart';
import 'package:ticker/page/page_settings.dart';
import 'package:ticker/settings/hive_cache.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  // initSettings().then((value) => runApp(const TickerApp()));
  initSettings().then(
    (value) => runApp(DevicePreview(
      enabled: false,
      builder: (context) => const TickerApp(), // Wrap your app
    )),
  );
}

Future<void> initSettings() async {
  await Settings.init(cacheProvider: HiveCache());
}

class TickerApp extends StatefulWidget {
  const TickerApp({Key? key}) : super(key: key);

  @override
  State<TickerApp> createState() => _TickerAppState();
}

class _TickerAppState extends State<TickerApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    AlertPage(),
    NotificationPage(),
    SettingsPage(),
    MorePage(),
  ];

  final Color _bgBarItemColor = const Color(0xFF2E71F0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) => MediaQuery(
        child: child!,
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'uni_neue', /*brightness: Brightness.dark,*/
      ),
      home: SafeArea(
        child: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFFF5F7F8),
            unselectedItemColor: const Color(0x80F5F7F8),
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard_outlined),
                activeIcon: const Icon(Icons.dashboard),
                label: 'Dashboard',
                backgroundColor: _bgBarItemColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications_none),
                activeIcon: const Icon(Icons.notifications),
                label: 'Alerts',
                backgroundColor: _bgBarItemColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.message_outlined),
                activeIcon: const Icon(Icons.message),
                label: 'Notifications',
                backgroundColor: _bgBarItemColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                activeIcon: const Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: _bgBarItemColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_outlined),
                activeIcon: const Icon(Icons.more),
                label: 'More',
                backgroundColor: _bgBarItemColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
