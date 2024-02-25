import 'package:flutter/material.dart';
import 'home.dart';
import 'map.dart';
import 'notification.dart';
import 'message.dart';
import 'alarm.dart';
import 'stats.dart';
import 'buttons.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromRGBO(51, 102, 255, 1.0),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 206, 203, 203),
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.map_sharp,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'Destinations',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.graphic_eq_sharp,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'Statistics',
          ),
          NavigationDestination(
            icon: Badge(
                label: Text('25'),
                child: Icon(
                  Icons.alarm_sharp,
                  color: Color.fromARGB(255, 206, 203, 203),
                )),
            label: 'Alarm',
          ),
          NavigationDestination(
            icon: Badge(
                child: Icon(
              Icons.notifications_sharp,
              color: Color.fromARGB(255, 206, 203, 203),
            )),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.messenger_sharp,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.switch_access_shortcut,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'Buttons',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const HomePage(),

        const MapPage(),

        const StatPage(),

        const AlarmPage(),

        // Notification Page
        const NotificationPage(),

        /// Messages page
        const MessagePage(),

        /// Button page
        const ButtonPage(),
      ][currentPageIndex],
    );
  }
}
