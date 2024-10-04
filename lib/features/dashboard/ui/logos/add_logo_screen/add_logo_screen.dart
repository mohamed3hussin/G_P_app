import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../../../logic/dashBoardCubit/dashboard_state.dart';
import 'add_logo_form.dart';


class AddLogoScreen extends StatefulWidget {
  static const String routeName = 'add_logo';
  const AddLogoScreen({Key? key}) : super(key: key);

  @override
  State<AddLogoScreen> createState() => _AddLogoScreenState();
}

class _AddLogoScreenState extends State<AddLogoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Add Logo',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  AddLogoForm(
                    cubit: cubit,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
