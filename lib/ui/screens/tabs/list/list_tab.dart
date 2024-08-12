import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/model/todo_dm.dart';
import 'package:project_todo/ui/screens/tabs/list/todo.dart';
import 'package:project_todo/ui/utils/assets_Style.dart';
import 'package:project_todo/ui/utils/assets_color.dart';
import 'package:project_todo/ui/utils/date_time_extension.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime selecedCalenderDate = DateTime.now();
  List<TodoDm> todosList = [];

  @override
  Widget build(BuildContext context) {
    getTodoListFromFireStore();
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          buildCalender(),
          Expanded(
            flex: 75,
            child: ListView.builder(
              itemCount: todosList.length,
              itemBuilder: (context, index) {
                return Todo(item: todosList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  void getTodoListFromFireStore() async {
    CollectionReference todoCollection =
        FirebaseFirestore.instance.collection(TodoDm.collectionName);
    QuerySnapshot querySnapshot = await todoCollection.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    todosList = documents.map((doc) {
      Map<String, dynamic> Json = doc.data() as Map<String, dynamic>;
      return TodoDm.fromJson(Json);
    }).toList();
    todosList = todosList
        .where((todo) =>
            todo.date.year == selecedCalenderDate.year &&
            todo.date.month == selecedCalenderDate.month &&
            todo.date.day == selecedCalenderDate.day)
        .toList();
  }

  buildCalender() {
    return Expanded(
      flex: 25,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.primary,
              )),
              Expanded(
                  child: Container(
                color: AppColors.bgColor,
              )),
            ],
          ),
          EasyInfiniteDateTimeLine(
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            focusDate: selecedCalenderDate,
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateChange: (selectedDate) {},
            itemBuilder: (context, date, inSelected, onDateTapped) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selecedCalenderDate = date;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.White,
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        date.dayName,
                        style: inSelected
                            ? AssetsStyle.selectedCalenderDayStyle
                            : AssetsStyle.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                      Text(
                        date.day.toString(),
                        style: inSelected
                            ? AssetsStyle.selectedCalenderDayStyle
                            : AssetsStyle.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void onDateTapped() {}
}
