import 'package:flutter/material.dart';
import 'package:notjusttodoapp/utilities/add_task_dialog.dart';
import 'package:notjusttodoapp/views/all_tasks_view.dart';
import 'package:notjusttodoapp/views/completed_tasks_view.dart';
import 'package:notjusttodoapp/views/pending_tasks_view.dart';
import 'package:notjusttodoapp/views/settings_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: _selectedIndex == 0
              ? const TabBar(tabs: [
                  Tab(
                    text: 'Completed',
                  ),
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'All',
                  )
                ])
              : null,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddTaskAlertDialog();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
        body: _buildPage(_selectedIndex),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildPage(int index) {
    switch (index) {
      case 0:
        return const TabBarView(children: [
          CompletedTaskView(),
          PendingTasksView(),
          AllTasksView()
        ]);

      case 1:
        return const SettingsView();
      default:
        const Text('Invalid');
    }
  }
}
