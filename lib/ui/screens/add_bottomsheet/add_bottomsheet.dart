import 'package:flutter/material.dart';
import 'package:project_todo/ui/utils/assets_Style.dart';
import 'package:project_todo/ui/utils/date_time_extension.dart';

class AddBottomsheet extends StatefulWidget {
  AddBottomsheet({super.key});

  @override
  State<AddBottomsheet> createState() => _AddBottomsheetState();

  static void Show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddBottomsheet(),
            ));
  }
}

class _AddBottomsheetState extends State<AddBottomsheet> {
  DateTime selectedDate = DateTime.now();

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
          const TextField(
            decoration: InputDecoration(hintText: "Enter task title"),
          ),
          const SizedBox(
            height: 12,
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Enter task description"),
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
          ElevatedButton(onPressed: () {}, child: const Text("Add"))
        ],
      ),
    );
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
