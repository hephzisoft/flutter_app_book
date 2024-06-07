import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/routes/route_constant.dart';
import '../../../common/utils/colors.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_field_widget.dart';
import '../../../common/utils/image_constant.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var previewPassword = false;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 80.h,
                    bottom: 12.h,
                  ),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'Welcome back! Log in to resume your reading journey.',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const TextFieldWidget(
                    label: "Email Address", hintText: "Email Address"),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWidget(
                  label: "Password",
                  hintText: 'Password',
                  isPasswordField: true,
                  suffixIcon: SizedBox(
                    width: 40.w,
                    child: IconButton(
                      icon: Icon(
                        previewPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          previewPassword = !previewPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: previewPassword,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text('Forget Password?'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteConstant.tab, (route) => false);
                    },
                    text: "Log in",
                    verticalPadding: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteConstant.signup);
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: primaryColor,
                      width: 157.w,
                      height: .7.h,
                    ),
                    const Text("OR"),
                    Container(
                      color: primaryColor,
                      height: .5.h,
                      width: 157.w,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  width: double.infinity,
                  child: ButtonWidgetWithIcon(
                    verticalPadding: 15,
                    onPressed: () {},
                    icon: Image.asset(
                      ImageConstant.google,
                    ),
                    side: const BorderSide(),
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.white,
                    text: "Sign in with Google",
                    textColor: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
