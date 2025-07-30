import 'package:flutter/material.dart';
import 'package:ttttttt/core/constant/assets_constant.dart';
import 'package:ttttttt/screens/auth/widgets/materialButtonWidget.dart';
import 'package:ttttttt/screens/home/widgets/containerPeriorityWidget.dart';
class AlertDailogWidget extends StatefulWidget {
   AlertDailogWidget({super.key, required this.ontap});
final void Function(int ) ontap;
  @override
  State<AlertDailogWidget> createState() => _AlertDailogWidgetState();
}

class _AlertDailogWidgetState extends State<AlertDailogWidget> {
  final List<int> index=[1,2,3,4,5,6,7,8,9,10];
  int selected=1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Task Priority",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff404147)
            ),),
          Divider(
            color: Color(0xff404147),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:index.map((index)=>ContainerPeriorityWidget(
              index:  index,
               isSelected:selected== index,
              onTap: (){
                selected=index;
                setState(() {

                });
              },
            )).toList(),
          )
        ],
      ),
      actions: [
       Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [
           Expanded(
             child: MaterialButtonWidget(
               title: "Save",
               ontap: (){
                 widget.ontap(selected);
                 Navigator.pop(context);
               },
             ),
           ),
           SizedBox(width: 10,),
           Expanded(
             child: MaterialButtonWidget(
               background: Colors.transparent,
               title: "Cancle",
               textColor:Color(0xff5F33E1) ,
               ontap: (){
                Navigator.of(context).pop();
               },

             ),
           ),
         ],
       )
      ],
    );
  }
}
