import 'package:flutter/material.dart';

import '../../../../../core/text_style/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Profile Screen',style: Styles.textStyle32,)
      ],
    );
  }
}