import 'package:flutter/material.dart';
import 'package:ttttttt/core/constant/assets_constant.dart';
import 'package:ttttttt/screens/update_screen/widgets/item_update_widget.dart';
import 'package:intl/intl.dart';
import '../../data/firebase/firebaseDatabase.dart';
import '../../data/model/task_model.dart';
import '../home/widgets/celendar_dialog.dart';
import '../home/widgets/showBottomSeeWidget.dart';

class DetailsTaskScreen extends StatefulWidget {
  const DetailsTaskScreen({super.key, required this.taskModel});
  static String routeName= "DetailsTaskScreen";
  final TaskModel taskModel;
  @override
  State<DetailsTaskScreen> createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen> {
  var titleTask=TextEditingController();
  var description=TextEditingController();
  bool isSelected = false;
  late TaskModel currentTask;

  @override
  void initState() {
    super.initState();
    currentTask = widget.taskModel;

  }
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            },
              icon: (Image.asset("assets/icons/Close.png")),),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: isSelected,
                      activeColor: Color(0xff5F33E1),
                      onChanged: (value) {
                        if(mounted) {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        }
                      },
                      //fillColor:MaterialState.selected,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              currentTask.title.toString(),
                            style:TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff24252C),
                            )
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currentTask.description??'',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight:FontWeight.w400,
                                color: Color(0xff6E6A7C)
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                    IconButton(onPressed: (){showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (context) {
                        final titleController = TextEditingController(text: currentTask.title);
                        final descriptionController = TextEditingController(text: currentTask.description);

                        return ShowBottomSheetWidget.ShowBottomSeeWidget(
                          funcName: "Update Task",
                          titleTask: titleController,
                          description: descriptionController,
                          onTapSend: () async {
                            final updatedTask = TaskModel(
                              id: currentTask.id,
                              title: titleController.text,
                              description: descriptionController.text,
                              data: currentTask.data,
                              priority: currentTask.priority,
                            );

                            await FirebaseDatabase.updateTask(updatedTask);
                            setState(() {
                              currentTask = updatedTask;
                            });
                            Navigator.pop(context);
                          },

                          onTapTimer: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomCalendarDialog(
                                selectedDate: DateTime.now(),
                                onDateSelected: (data) {
                                  setState(() {
                                    selectedDate=data;
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                    },
                      icon: Icon(Icons.edit, color: Color(0xff5F33E1)),
                    ),
                  ],


                ),
                SizedBox(height: 34),
                ItemUpdateWidget(title: "Task Time :",content: DateFormat('EEE-MM-dd').format(currentTask.data),
                    icon: AssetsConstant.timeIcon.toString()),
                SizedBox(height: 27),
                ItemUpdateWidget(title: "Periority ",content: currentTask.priority.toString(),icon: AssetsConstant.flagIcon),

                SizedBox(height: 95),
                InkWell(
                  onTap: (){
                    FirebaseDatabase.deleteTask(widget.taskModel);
                    Navigator.pop(context);
                    setState(() {

                    });
                  } ,
                  child: Row(
                    children: [
                      Icon(Icons.delete,color: Colors.red,),
                      Text(
                        'Delete Task',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red
                        )
                        ),
                    ],
                  ),
                ),
              ],
            ),
            ),
        );
    }
}
