import 'package:flutter/material.dart';
import 'package:ttttttt/data/model/task_model.dart';

import '../../../core/constant/assets_constant.dart';
class ItemUpdateWidget extends StatelessWidget {
  const ItemUpdateWidget({super.key,  required this.title, required this.content, required this.icon});
final String title;
final String content;
final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        SizedBox(width: 8,),
        Text(title,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff24252C)
        ),),
        SizedBox(width: 8,),
        Text(content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff24252C)
        ),

        ),
        const Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
                "Today"
            ),
          ),
        )
      ],
    );
  }
}
