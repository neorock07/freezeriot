import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CardCircle(BuildContext context, {
  IconData? icon,
  Color? color,
  Function()? func
}){
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: func,
      child: Container(
        height: 80.dm,
        width: 80.dm,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color:Color.fromRGBO(153, 51, 230, 1))
        ),
        child: Center(
          child:Icon(icon, color: Colors.white,)
        ),
      ),
    ),
  ) ;
}