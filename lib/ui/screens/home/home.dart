import 'package:flutter/material.dart';
import 'package:project_todo/ui/screens/add_bottomsheet/add_bottomsheet.dart';
import 'package:project_todo/ui/screens/tabs/list/list_tab.dart';
import 'package:project_todo/ui/screens/tabs/settings/settings_tab.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [const ListTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(221, 234, 217, 1.0),
      body: tabs[currentIndex],
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildbottomNavigationBar(),
    );
  }

  Widget buildbottomNavigationBar() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (tappedIndex) {
              currentIndex = tappedIndex;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "settings"),
            ]),
      );

  buildFab() => FloatingActionButton(
        onPressed: () {
          AddBottomsheet.show(context);
        },
        backgroundColor: AppColors.primary,
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.white, width: 3)),
        child: const Icon(Icons.add),
      );
}
