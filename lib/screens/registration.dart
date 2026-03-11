import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test5/app/components/Data/registration_form_module.dart';
import 'package:test5/theme.dart';
//import 'package:google_fonts/google_fonts.dart';
import '../app/components/form_input_feilds/form_input_feilds.dart';
import '../app/components/form_input_feilds/form_validators.dart';
import '../app/components/ui/gap.dart';
import '../app/router/app_navigator.dart';

class registrationScreen extends StatelessWidget {
  registrationScreen({super.key});

  final RegistrationFormModel _formModel = RegistrationFormModel();

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 320;

    return Scaffold(
      body: Stack(
        children: [

          /// TOP IMAGE
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Image.asset(
              'assets/Frame.png',
              fit: BoxFit.cover,
            ),
          ),

          /// SCROLLABLE CONTENT
          SingleChildScrollView(
            keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [

                /// SPACE FOR IMAGE
                const SizedBox(height: imageHeight - 40),

                /// WHITE CARD
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(38),
                    ),
                  ),
                  child: FormBuilder(
                    key: _formModel.formKey,
                    initialValue: _formModel.initialValue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// TITLE
                        Text(
                          "Create Account",
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,)
                        ),

                        VGap.x5(),

                        /// USERNAME
                        Text("Username",
                          style: context.theme.textTheme.labelLarge,),
                        VGap.x2(),
                        AppFormTextField(
                          name: RegistrationFormModel.username,
                          hintText: 'username',
                          prefixIcon: LucideIcons.user,
                          validator: AppValidators.username(),
                        ),

                        VGap.x4(),

                        /// EMAIL
                        Text("Email",
                          style: context.theme.textTheme.labelLarge,),
                        VGap.x2(),
                        AppFormTextField(
                          name: RegistrationFormModel.email,
                          hintText: 'enter your professional email',
                          prefixIcon: Icons.email_outlined,
                          validator: AppValidators.email(),
                        ),

                        VGap.x4(),

                        /// PHONE
                        Text("Phone",
                          style: context.theme.textTheme.labelLarge,),
                        VGap.x2(),
                        AppFormTextField(
                          name: RegistrationFormModel.phone,
                          hintText: 'enter your current phone no.',
                          prefixIcon: Icons.phone_outlined,
                          validator: AppValidators.phone(),
                        ),

                        VGap.x4(),

                        /// PASSWORD
                         Text("Password",
                          style: context.theme.textTheme.labelLarge,),
                        VGap.x2(),
                        AppFormTextField(
                          name: RegistrationFormModel.password,
                          hintText: 'enter your password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validator: AppValidators.password(),
                        ),

                        VGap.x4(),

                        /// CONFIRM PASSWORD
                        Text("Confirm Password",
                        style: context.theme.textTheme.labelLarge,
                        ),
                        VGap.x2(),
                        AppFormTextField(
                          name: RegistrationFormModel.password,
                          hintText: 'enter your password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validator: AppValidators.password(),
                        ),

                        VGap.x6(),

                        /// BUTTON
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

                                AppNavigator().navigateToHomeScreen();
                              } else {
                                if (kDebugMode) {
                                  print("Validation Failed");
                                }
                              }
                            },
                            child: Text(
                              "Create Account",
                              style: context.theme.textTheme.titleSmall,
                            ),
                          ),
                        ),

                        VGap.x4(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                            style: context.textTheme.bodyMedium ,
                            ),
                            GestureDetector(
                              onTap: () {
                                AppNavigator().navigateToLoginScreen();
                              },
                              child:  Text(
                                "Login",
                                style: context.theme.textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),

                        VGap.x7(),

                        /// TERMS
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                  "By signing in, I accept the.\n",
                                  style:
                                  context.textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text:
                                  "Privacy Policy & Terms and Conditions",
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    decoration:
                                    TextDecoration.underline,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}