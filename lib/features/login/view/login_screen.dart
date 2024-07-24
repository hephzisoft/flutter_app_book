import 'package:app_book/common/global_loader/global_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/routes/route_constant.dart';
import '../../../common/services/auth_validator.dart';
import '../../../common/utils/colors.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_field_widget.dart';
import '../../../common/utils/image_constant.dart';
import '../controller/login_controller.dart';
import '../provider/login_notifier.dart';
import '../../../common/extensions/theme_extensions.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var previewPassword = false;
  late final TextEditingController? emailController;
  late final TextEditingController? passwordController;
  final _formKey = GlobalKey<FormState>();
  late final LoginController _controller;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _controller = LoginController();
    super.initState();
  }

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  void verifyForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
  }

  void login() {
    verifyForm();
    // saving both field to the login state
    ref.read(loginNotifierProvider.notifier).updateEmail(emailController!.text);
    ref
        .read(loginNotifierProvider.notifier)
        .updatePassword(passwordController!.text);
    _controller.handleLoginWithEmailAndPassword(ref);
  }

  @override
  Widget build(BuildContext context) {
    var loading = ref.watch(globalLoaderProvider);
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        inputType: TextInputType.emailAddress,
                        label: "Email Address",
                        hintText: "Email Address",
                        controller: emailController,
                        validator: emailValidator,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      // Password field
                      TextFieldWidget(
                        label: "Password",
                        hintText: 'Password',
                        validator: passwordValidator,
                        controller: passwordController,
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
                            foregroundColor:
                                context.brightness == Brightness.light
                                    ? context.primaryColor
                                    : Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteConstant.forgetPassword);
                          },
                          child: const Text('Forget Password?'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: loading
                      ? CupertinoActivityIndicator(
                          color: context.primaryColor,
                        )
                      : ButtonWidget(
                          onPressed: () {
                            login();
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
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: context.primaryColor),
                      ),
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
                      color: context.primaryColor,
                      width: 157.w,
                      height: .7.h,
                    ),
                    const Text("OR"),
                    Container(
                      color: context.primaryColor,
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
                  child: loading
                      ? CupertinoActivityIndicator(
                          color: context.primaryColor,
                        )
                      : ButtonWidgetWithIcon(
                          verticalPadding: 15,
                          onPressed: () {
                            _controller.handleGoogleSignIn(ref);
                          },
                          icon: Image.asset(
                            ImageConstant.google,
                          ),
                          side: const BorderSide(),
                          fontWeight: FontWeight.w600,
                          backgroundColor: Colors.white,
                          text: "Sign in with Google",
                          textColor: context.primaryColor,
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
