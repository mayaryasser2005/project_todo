import 'package:flutter/material.dart';
import 'package:project_todo/ui/screens/add_bottomsheet/add_bottomsheet.dart';
import 'package:project_todo/ui/screens/tabs/list_tab.dart';
import 'package:project_todo/ui/screens/tabs/settings_tab.dart';
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
      appBar: AppBar(title: const Text("To Do List")),
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
          AddBottomsheet.Show(context);
        },
        backgroundColor: AppColors.primary,
        shape: const StadiumBorder(
            side: BorderSide(color: AppColors.White, width: 3)),
        child: const Icon(Icons.add),
      );
}
