import 'package:flutter/material.dart';

void NavigationTo(context,widget)=>Navigator.push(context,
  MaterialPageRoute(
    builder:(context)=>widget ,
  ),);

void NavigationAndFinish(context,widget)=>
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(
        builder:(context)=>widget ,
      ),
          (Route<dynamic>route)=>false,
    );