import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/components/form_input_feilds/form_input_feilds.dart';
import '../app/components/form_input_feilds/form_validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  void _onLogin() {

    if (_formKey.currentState!.saveAndValidate()) {
      final values = _formKey.currentState!.value;

      debugPrint('USERNAME: ${values['username1']}');
      debugPrint('PASSWORD: ${values['password']}');
      debugPrint('Email: ${values['email']}');
    } else {
      debugPrint("Validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: Stack(
        children: [
          /// TOP IMAGE
          SizedBox(
            height: 420,
            width: double.infinity,
            child: Image.asset(
              'assets/Frame.png',
              fit: BoxFit.cover,
            ),
          ),

          /// BOTTOM WHITE CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: double.infinity,
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
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 30),

                    /// USERNAME
                    const Text(
                      "Username/Phone no.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    AppFormTextField(
                      name: 'username1',
                      hintText: 'username or phone no',
                      prefixIcon: Icons.person_outline,
                      validator: AppValidators.username(),
                    ),

                    //const SizedBox(height: 10),

                    const SizedBox(height: 14),

                    /// PASSWORD
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),

                    AppFormTextField(
                      name: 'password',
                      hintText: 'enter your password',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validator: AppValidators.password(),
                    ),
                    const SizedBox(height: 12),

                    /*/// USERNAME
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    AppFormTextField(
                      name: 'email',
                      hintText: 'enter your professional email',
                      prefixIcon: Icons.person_outline,
                      validator: AppValidators.email(),
                    ),*/

                    /// FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: _onLogin,
                        child: const Text("Login"),
                      ),
                    ),

                    const SizedBox(height: 34),

                    /// TERMS TEXT
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "By Signing in, I accept the.\n",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                              "Privacy Policy & Terms and condition",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
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
        ],
      ),
    );
  }
}