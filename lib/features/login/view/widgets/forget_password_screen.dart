
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/global_loader/global_loader.dart';
import '../../../../common/services/auth_validator.dart';
import '../../../../common/utils/colors.dart';
import '../../../../common/utils/image_constant.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../controller/login_controller.dart';
import '../../provider/login_notifier.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController? emailController;
  late final LoginController _controller;

  @override
  void initState() {
    _controller = LoginController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController!.dispose();
    super.dispose();
  }

  void verifyForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
  }

  void verifyPassword() {
    verifyForm();
    ref
        .watch(loginNotifierProvider.notifier)
        .updateEmail(emailController!.text);

    _controller.forgetPassword(ref);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var loading = ref.watch(globalLoaderProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.45,
                  child: SvgPicture.asset(
                    ImageConstant.forgotPassword,
                    // colorFilter: ,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Forget \nPassword?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  'Don\'t worry! It happens. Please enter the address associated with your account.',
                  style: TextStyle(
                    fontSize: 14.5.sp,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      const Icon(Icons.alternate_email_outlined),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                          decoration: const InputDecoration(
                            hintText: 'Email Address',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                                // width: 5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: double.infinity,
                  child: loading
                      ? const CupertinoActivityIndicator(
                          color: primaryColor,
                        )
                      : ButtonWidget(
                          text: 'Submit',
                          fontSize: 17,
                          // fontWeight: ,
                          verticalPadding: 15,
                          onPressed: verifyPassword,
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
