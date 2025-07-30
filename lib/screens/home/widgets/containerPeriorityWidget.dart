import 'package:flutter/material.dart';

import '../../../core/constant/assets_constant.dart';
class ContainerPeriorityWidget extends StatelessWidget {
  const ContainerPeriorityWidget({super.key,  this.isSelected=false , required this.index, this.onTap});
  final bool isSelected;
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7
        ),
        decoration: BoxDecoration(
          color:isSelected? Color(0xff5F33E1):null,
            borderRadius: BorderRadius.circular(4),
            border:isSelected? null:  Border.all(
                color: Color(0xff6E6A7C),
                width: 1.3
            )
        ),
        child: Column(
          children: [
            ImageIcon(AssetImage(AssetsConstant.flagIcon),
              size: 24,
              color:isSelected?Colors.white: Color(0xff744DE5),
            ),
            Text(index.toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:isSelected?Colors.white: Color(0xff404147)
              ),
            )
          ],
        ),

      ),
    );
  }
}
