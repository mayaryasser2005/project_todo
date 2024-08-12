import 'package:flutter/material.dart';
import 'package:project_todo/model/todo_dm.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

import '../../../utils/assets_Style.dart';

class Todo extends StatelessWidget {
  final TodoDm item;

  const Todo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 26),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Row(
          children: [
            buidVerticalLine(context),
            const SizedBox(
              width: 25,
            ),
            buildTodoInfo(),
            buildTodosState()
          ],
        ));
  }

  buidVerticalLine(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
      );

  buildTodoInfo() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              item.title,
              maxLines: 1,
              style: AssetsStyle.bottomSheetTitle
                  .copyWith(color: AppColors.primary),
            ),
            const Spacer(),
            Text(
              item.description,
              style: AssetsStyle.bodyTextStyle,
            ),
            const Spacer(),
          ],
        ),
      );

  buildTodosState() => Container(
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: const Icon(Icons.done, color: Colors.white, size: 35),
      );
}
