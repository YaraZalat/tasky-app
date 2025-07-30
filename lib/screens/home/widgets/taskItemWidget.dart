
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttttttt/data/model/task_model.dart';

import 'containerPeriorityWidget.dart';
class TaskItemWidget extends StatefulWidget {
   TaskItemWidget({super.key,required this.taskModel});
  TaskModel taskModel;

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  bool? isSelected=false;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10 ),
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          )
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            activeColor: const Color(0xff5F33E1),
            onChanged: (value) {
              setState(() {
                isSelected = value!;
              });
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.taskModel.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff24252C)
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(  DateFormat('yyyy-MM-dd').format(widget.taskModel.data),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight:FontWeight.w400,
                      color: Color(0xff6E6A7C)
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          ContainerPeriorityWidget(index: widget.taskModel.priority,isSelected: false,)
        ],
      ),
    );
  }
}
