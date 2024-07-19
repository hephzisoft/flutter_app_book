import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/routes/route_constant.dart';
import '../../../common/services/auth_validator.dart';
import '../../../common/utils/colors.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/text_field_widget.dart';
import '../../../common/utils/image_constant.dart';
import '../controller/register_controller.dart';
import '../provider/register_notifier.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  var previewPassword = false;

  late final TextEditingController? emailController;
  late final TextEditingController? passwordController;
  final _formKey = GlobalKey<FormState>();
  late final RegisterController _controller;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _controller = RegisterController();
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

  void register() {
    verifyForm();
    // saving both field to the login state
    ref
        .read(registerNotifierProvider.notifier)
        .updateEmail(emailController!.text);
    ref
        .read(registerNotifierProvider.notifier)
        .updatePassword(passwordController!.text);

    _controller.handleRegisterWithEmailAndPassword(ref);
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
                    'Create your account',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'Create an account and explore a tailored library of captivating storeis.',
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
                        label: "Email Address",
                        hintText: "Email Address",
                        inputType: TextInputType.emailAddress,
                        validator: emailValidator,
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldWidget(
                        label: "Password",
                        hintText: 'Password',
                        isPasswordField: true,
                        controller: passwordController,
                        validator: passwordValidator,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: loading
                      ? const CupertinoActivityIndicator(
                          color: primaryColor,
                        )
                      : ButtonWidget(
                          onPressed: () {
                            register();
                          },
                          text: "Create new account",
                          verticalPadding: 15,
                          fontWeight: FontWeight.w600,
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteConstant.login, (route) => false);
                      },
                      child: const Text('Login'),
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
                  child: loading
                      ? const CupertinoActivityIndicator(
                          color: primaryColor,
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
                          text: "Sign up with Google",
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
