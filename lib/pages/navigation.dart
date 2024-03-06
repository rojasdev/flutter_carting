import 'package:flutter/material.dart';
import 'home.dart';
import 'todo.dart';
import 'view.dart';
import 'employee.dart';
import 'quiz.dart';
import 'return.dart';

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
                Icons.list,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'List One',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.list,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text(''),
              child: Icon(
                Icons.list,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'JSON Driven',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text(''),
              child: Icon(
                Icons.quiz,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'JSON Local',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text(''),
              child: Icon(
                Icons.select_all,
                color: Color.fromARGB(255, 206, 203, 203),
              ),
            ),
            label: 'Data Return',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const HomePage(),

        const TodoPage(),

        const ViewPage(),

        const EmployeePage(),

        const QuizPage(),

        const ReturnScreen(),
      ][currentPageIndex],
    );
  }
}
