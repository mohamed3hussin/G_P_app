import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/registerScreen/registerCubit/registerCubit.dart';
import 'package:g_p_app/features/registerScreen/registerCubit/registerState.dart';

import '../../core/shared_widget/default_text.dart';

class RegisterScreenView extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Color(0xFFFCFCFF),
            appBar: AppBar(
              leading: IconButton(onPressed: () { Navigator.pop(context); }, icon:Icon(IconBroken.Arrow___Left_2),),
              title: Text('Sign Up',style: Styles.textStyle24.copyWith(color: Color(0xFF001C38),fontWeight: FontWeight.w700),),
              centerTitle: true,
              actions: [
                Padding(
                  padding:  EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  child: Container(
                      height: 18.h,
                      child: Image(
                          image: AssetImage(AssetsData.loginImage))),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,vertical: 20.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: defaultTextField(
                          type: TextInputType.name,
                          controller: nameController,
                          label: 'Full Name',
                          prefix: IconBroken.User,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {

                              return 'name most not empty';
                            }
                            else{
                              return null;}
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: defaultTextField(
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          label: 'Email',
                          prefix: Icons.email,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {

                              return 'email most not empty';
                            }
                            else{
                              return null;}
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: defaultTextField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: IconBroken.Lock,
                          suffix: RegisterCubit.get(context).isPasswordShow? IconBroken.Show:IconBroken.Hide,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {

                              return 'Password most not empty';
                            }
                            else{
                              return null;}
                          },
                          pressed: ()
                          {
                            RegisterCubit.get(context).PasswordShowed();
                          },
                          fieldSubmitted: (value)
                          {
                            if(formKey.currentState!.validate())
                            {

                            }
                          },
                          isObscure: RegisterCubit.get(context).isPasswordShow,

                        ),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: defaultTextField(
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          label: 'Confirm Password',
                          prefix: IconBroken.Lock,
                          suffix: RegisterCubit.get(context).isConfirmPasswordShow? IconBroken.Show:IconBroken.Hide,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {

                              return 'Confirm Password most not empty';
                            }
                            else{
                              return null;}
                          },
                          pressed: ()
                          {
                            RegisterCubit.get(context).ConfirmPasswordShow();
                          },
                          fieldSubmitted: (value)
                          {
                            if(formKey.currentState!.validate())
                            {

                            }
                          },
                          isObscure: RegisterCubit.get(context).isConfirmPasswordShow,

                        ),
                      ),
                      SizedBox(
                        height: 40.0.h,
                      ),
                      ConditionalBuilder(
                        condition: true,
                        builder:(context)=>CustomButton(
                          width: double.infinity,
                          height: 50.h,
                          backgroundColor: Color(0xFF1B72C0),
                          text: 'Sign Up',
                          func: () {
                            if(formKey.currentState!.validate())
                            {

                            }
                          },
                        ),
                        fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                      ),
                      SizedBox(
                        height: 40.0.h,
                      ),
                      Text(
                          'Or Sign Up With',
                          style: Styles.textStyle16.copyWith(color: Color(0xFF1B72C0))
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          MaterialButton(
                            padding: EdgeInsetsDirectional.all(0),
                            minWidth: 0,
                            onPressed: (){},
                            child:SvgPicture.asset(
                              AssetsData.gmailImage,

                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsetsDirectional.all(0),
                            minWidth: 0,
                            onPressed: (){},
                            child:SvgPicture.asset(
                              AssetsData.facebookImage,

                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsetsDirectional.all(0),
                            minWidth: 0,
                            onPressed: (){},
                            child:SvgPicture.asset(
                              AssetsData.instaImage,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text('Already have an account',style: Styles.textStyle16.copyWith(color: Color(0xFF44474E)),),
                          TextButton(
                            onPressed: ()
                            {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Log in',
                              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w700,color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
