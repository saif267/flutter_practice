import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/components/form_input_feilds/form_input_feilds.dart';
import '../app/components/form_input_feilds/form_validators.dart';
class RegitrationScreen extends StatelessWidget {
  RegitrationScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  void _onCreateAccount() {
    if (_formKey.currentState!.saveAndValidate()) {
      final values = _formKey.currentState!.value;

      debugPrint('USERNAME: ${values['username1']}');
      debugPrint('EMAIL: ${values['email']}');
      debugPrint('PHONE: ${values['phone']}');
      debugPrint('PASSWORD: ${values['password']}');
    }
  }

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
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Text(
                          "Create Account",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 20),

                        /// USERNAME
                        const Text("Username"),
                        const SizedBox(height: 10),
                        AppFormTextField(
                          name: 'username1',
                          hintText: 'username',
                          prefixIcon: Icons.person_outline,
                          validator: AppValidators.username(),
                        ),

                        const SizedBox(height: 16),

                        /// EMAIL
                        const Text("Email"),
                        const SizedBox(height: 10),
                        AppFormTextField(
                          name: 'email',
                          hintText: 'enter your professional email',
                          prefixIcon: Icons.email_outlined,
                          validator: AppValidators.email(),
                        ),

                        const SizedBox(height: 16),

                        /// PHONE
                        const Text("Phone"),
                        const SizedBox(height: 10),
                        AppFormTextField(
                          name: 'phone',
                          hintText: 'enter your current phone no.',
                          prefixIcon: Icons.phone_outlined,
                          validator: AppValidators.phone(),
                        ),

                        const SizedBox(height: 16),

                        /// PASSWORD
                        const Text("Password"),
                        const SizedBox(height: 10),
                        AppFormTextField(
                          name: 'password',
                          hintText: 'enter your password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validator: AppValidators.password(),
                        ),

                        const SizedBox(height: 16),

                        /// CONFIRM PASSWORD
                        const Text("Confirm Password"),
                        const SizedBox(height: 10),
                        AppFormTextField(
                          name: 'confirm_password',
                          hintText: 'enter your password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validator: AppValidators.password(),
                        ),

                        const SizedBox(height: 24),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: _onCreateAccount,
                            child: const Text("Create Account"),
                          ),
                        ),

                        const SizedBox(height: 28),

                        /// TERMS
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                  "By Signing up, I accept the.\n",
                                ),
                                TextSpan(
                                  text:
                                  "Privacy Policy & Terms and condition",
                                  style: const TextStyle(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
