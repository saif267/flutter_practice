import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test5/app/components/Data/forgot_password_form_module.dart';
import 'package:test5/theme.dart';
import '../app/components/form_input_feilds/form_input_feilds.dart';
import '../app/components/form_input_feilds/form_validators.dart';
import '../app/components/ui/gap.dart';
import '../app/router/app_navigator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final ForgotPasswordFormModel _formModel = ForgotPasswordFormModel();

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Stack(
        children: [

          /// TOP IMAGE
          SizedBox(
            height: screenHeight * 0.65,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  'assets/Frame.png',
                  width: double.infinity,
                  height: screenHeight * 0.65,
                  fit: BoxFit.cover,
                ),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => AppNavigator().pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(48),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                color: cs.surface,
                child: SafeArea(
                  top: true,
                  child: FormBuilder(
                    key: _formModel.formKey,
                    initialValue: _formModel.initialValue,
                    child: Column(
                     mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Forgot Password",
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          )
                        ),

                        VGap.x6(),

                        Text(
                          "Email",
                          style: context.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          )
                        ),

                        VGap.x2(),

                        AppFormTextField(
                          name: ForgotPasswordFormModel.email,
                          hintText: 'Enter your email',
                          prefixIcon: Icons.email_outlined,
                          validator: AppValidators.email(),
                        ),

                        VGap.x6(),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: () {
                              if (_formModel.saveAndValidate()) {
                                final data = _formModel.payload;

                                if (kDebugMode) {
                                  print(data);
                                }

                                //AppNavigator().navigateToHomeScreen();
                              } else {
                                if (kDebugMode) {
                                  print("Validation Failed");
                                }
                              }
                            },
                            child: Text("Send Password Link",
                              style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              )
                            ),
                          ),
                        ),

                        VGap.x6(),

                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "By resetting you agree to our\n",
                                  style: context.textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: "Terms & Privacy Policy",
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}