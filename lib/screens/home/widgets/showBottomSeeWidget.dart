import 'package:flutter/material.dart';
import 'package:ttttttt/core/constant/assets_constant.dart';
import 'package:ttttttt/screens/auth/widgets/textFormFieldWidget.dart';
class ShowBottomSheetWidget extends StatelessWidget {
   ShowBottomSheetWidget.ShowBottomSeeWidget({
     super.key,
     this.onTapTimer,
     this.onTapSend,
     this.onTapFlag,
     required this.titleTask,
     required this.description,
     required this.funcName
   });
  final void Function()? onTapTimer;
  final void Function()? onTapSend;
  final void Function()? onTapFlag;
  final TextEditingController titleTask;
  final TextEditingController description;
  final String funcName;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          left: 16.0,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          Text(funcName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xff404147)
            ),
          ),
          TextFormFieldWidget(
            controller: titleTask,
            hintText:"Enter Your Task..." ,),
          SizedBox(height: 14,),

          Text("Description",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff979797)
            ),
          ),
          TextFormFieldWidget(
            hintText:"Enter your description..." ,
            controller:description ,
          ),
          SizedBox(height: 14,),

          Row(
            children: [
              GestureDetector(
                  onTap: onTapTimer,
                  child: Image.asset(
                      AssetsConstant.timeIcon)),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: onTapFlag,
                  child: Image.asset(AssetsConstant.flagIcon)),
              const Spacer(),
              GestureDetector(
                  onTap: onTapSend,
                  child: Image.asset(AssetsConstant.sendIcon)),
            ],
          ),
          SizedBox(height: 25,),


        ],
      ),
    );
  }
}
