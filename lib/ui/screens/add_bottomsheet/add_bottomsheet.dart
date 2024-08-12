import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/model/todo_dm.dart';
import 'package:project_todo/ui/utils/assets_Style.dart';
import 'package:project_todo/ui/utils/date_time_extension.dart';

class AddBottomsheet extends StatefulWidget {
  const AddBottomsheet({super.key});

  @override
  State<AddBottomsheet> createState() => _AddBottomsheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const AddBottomsheet(),
            ));
  }
}

class _AddBottomsheetState extends State<AddBottomsheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "add new task",
            textAlign: TextAlign.center,
            style: AssetsStyle.bottomSheetTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Enter task title"),
            controller: titleController,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration:
                const InputDecoration(hintText: "Enter task description"),
            controller: descriptionController,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "selected data",
            style: AssetsStyle.bottomSheetTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                showMyDatePidker();
              },
              child: Text(
                selectedDate.toformattedDate,
                style: AssetsStyle.normalGreyTextStyle,
                textAlign: TextAlign.center,
              )),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                addTodoToFireStore();
              },
              child: const Text("Add"))
        ],
      ),
    );
  }

  void addTodoToFireStore() {
    CollectionReference todosCollection =
        FirebaseFirestore.instance.collection(TodoDm.collectionName);
    DocumentReference doc = todosCollection.doc();
    TodoDm todoDM = TodoDm(
        id: doc.id,
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDate,
        isDone: false);
    doc.set(todoDM.toJson()).then((_) {
      ///this callback is called when future is completed
    }).onError((error, stackTrace) {
      ///this callback is called when the throws an exception
    }).timeout(const Duration(milliseconds: 500), onTimeout: () {
      ///this callback is called after duration you in first argument
      Navigator.pop(context);
    });
  }

  void showMyDatePidker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
