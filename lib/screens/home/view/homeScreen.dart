
import 'package:flutter/material.dart';
import 'package:ttttttt/core/constant/assets_constant.dart';
import 'package:ttttttt/core/utils/app_dailog.dart';
import 'package:ttttttt/data/firebase/firebaseDatabase.dart';
import 'package:ttttttt/screens/auth/login_screen.dart';
import 'package:ttttttt/screens/home/widgets/alertDialog.dart';
import 'package:ttttttt/screens/home/widgets/showBottomSeeWidget.dart';
import 'package:ttttttt/screens/home/widgets/taskItemWidget.dart';
import 'package:ttttttt/screens/update_screen/update_task_screen.dart';

import '../../../data/model/task_model.dart';
import '../widgets/celendar_dialog.dart';
import '../widgets/empty_scre_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var titleTask=TextEditingController();
  var description   =TextEditingController();
  int priority=0;
  DateTime? selectedDate;
  List<TaskModel> tasks=[];
  @override
  void initState() {
    super.initState();
    setState(() {
      getTasks();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset(AssetsConstant.logo),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  },
                    child: Image.asset(AssetsConstant.logout)),

              ],
              ),
              SizedBox(height: 43,),
              tasks.isEmpty? EmptyScreWidget():
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  )

                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Today"),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (context, index) =>InkWell(
                        onTap: ()async{
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>
                                  DetailsTaskScreen(taskModel: tasks[index],)
                            )
                          );
                          getTasks();
                        },
                          child: TaskItemWidget(taskModel: tasks[index])),
                  itemCount: tasks.length,
                  ),
              ),

            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => ShowBottomSheetWidget.ShowBottomSeeWidget(
              funcName: "Add Task",
              onTapTimer: (){
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
              description: description,
              titleTask: titleTask,
              onTapFlag:() {
                FocusManager.instance.primaryFocus?.unfocus();
               showDialog(
                context: context,
                builder:(context) => AlertDailogWidget(
                  ontap: (index){
                   priority= index;
                  },
                ),);
            },
              onTapSend: ()async{
                AppDialog.showDialogLoading(context);
                await FirebaseDatabase.addTask(
                    title: titleTask.text,
                    description: description.text,
                    date:selectedDate!,
                    periority: priority).then((_) async {
                      Navigator.of(context).pop();
                      titleTask.clear();
                      description.clear();
                      priority=0;
                      selectedDate=DateTime.now();
                      Navigator.of(context).pop();
                      await getTasks();
                }).catchError((error){
                  Navigator.of(context).pop();
                  AppDialog.showDialogError(context,error);
                 });
              },
            )
          );
        },
        backgroundColor: Color(0xff24252C),
        child: Icon(Icons.add,color: Color(0xff5F33E1),),
        shape: CircleBorder(),
      ),
    );
  }
  Future<void> getTasks()async{
    tasks=await FirebaseDatabase.getAllTasks();
    setState(() {
    });
  }
}
