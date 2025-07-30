import 'package:flutter/material.dart';

import '../../../core/constant/assets_constant.dart';
class EmptyScreWidget extends StatelessWidget {
  const EmptyScreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 85,),
        Image.asset(AssetsConstant.empty),
        const SizedBox(height: 10,),
        Text("What do you want to do today?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xff24252c),
          ),
        ),
        SizedBox(height: 10,),
        Text("Tap + to add your tasks",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff24252c),
          ),
        ),
      ],
    );
  }
}
