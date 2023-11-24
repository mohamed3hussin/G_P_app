import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginCubit.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginState.dart';
import 'package:g_p_app/features/registerScreen/registerScreenView.dart';

import '../../core/shared_widget/custom_button.dart';
import '../../core/shared_widget/custom_navigation.dart';
import '../../core/shared_widget/default_text.dart';

class LoginScreenView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> LoginCubit() ,
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state)
        {},
        builder: (context,state)
        {
          return Scaffold(
            backgroundColor: Color(0xFFFCFCFF),
            body: Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 40.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children:
                    [
                      Container(
                          height: 100.h,
                          child: Image(
                              image: AssetImage(AssetsData.loginImage))),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Text(
                        'Log In',
                        style: Styles.textStyle32.copyWith(color: Color(0xFF270008))
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        'Login now to design your shirt',
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: defaultTextField(
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          label: 'User Name',
                          prefix: IconBroken.Profile,
                          validate: (value)
                          {
                            if(value!.isEmpty)
                            {

                              return 'Email most not empty';
                            }
                            else{
                              return null;}
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.sp),
                        child: defaultTextField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: IconBroken.Lock,
                          suffix: LoginCubit.get(context).isPasswordShow? IconBroken.Show:IconBroken.Hide,
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
                            LoginCubit.get(context).PasswordShowed();
                          },
                          fieldSubmitted: (value)
                          {
                            if(formKey.currentState!.validate())
                            {

                            }
                          },
                          isObscure: LoginCubit.get(context).isPasswordShow,

                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(

                          onPressed: () {},
                          child: Text('Forget Password ?',style: Styles.textStyle12.copyWith(color: Color(0xFF44474E)),),),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      ConditionalBuilder(
                        condition: true,
                        builder:(context)=>CustomButton(
                          width: double.infinity,
                          height: 50.h,
                          backgroundColor: Color(0xFF1B72C0),
                          text: 'Log in',
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
                          'Or Log In With',
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
                        height: 25.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text('Don\'t have an account?',style: Styles.textStyle16.copyWith(color: Color(0xFF44474E)),),
                          TextButton(
                            onPressed: ()
                            {
                              NavigationTo(context, RegisterScreenView());
                            },
                            child: Text(
                              'Sign Up',
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
