import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test5/theme.dart';
import '../app/components/Data/login_form_module.dart';
import '../app/components/form_input_feilds/form_input_feilds.dart';
import '../app/components/form_input_feilds/form_validators.dart';
import '../app/components/ui/gap.dart';
import '../app/router/app_navigator.dart';
import '../features/auth/auth_repository.dart';
//import '../app/network/secure_token_storage.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen>createState()=> _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{

  final LoginFormModel _formModel = LoginFormModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Stack(
        children: [
          /// TOP IMAGE
          SizedBox(
            height: 474,
            width: double.infinity,
            child: Image.asset(
              'assets/Frame.png',
              fit: BoxFit.cover,
            ),
          ),

          /// BOTTOM CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.58,
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(38),
                ),
              ),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                child: FormBuilder(
                  key: _formModel.formKey,
                  initialValue: _formModel.initialValue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      Text(
                        "Login",
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      VGap(height: 30,),

                      /// Email
                      Text(
                        "Email",
                        style: context.textTheme.labelLarge,
                      ),
                      VGap.x2(),
                      AppFormTextField(
                        name: LoginFormModel.email,
                        hintText: 'Enter your email',
                        prefixIcon: LucideIcons.user,//Icons.person_outline,
                        validator: AppValidators.email(),
                      ),

                      VGap.x6(),

                      /// PASSWORD
                      Text(
                        "Password",
                        style: context.textTheme.labelLarge,
                      ),
                      VGap.x2(),
                      AppFormTextField(
                        name: LoginFormModel.password,
                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock_outline,
                        isPassword: true,
                        validator: AppValidators.password(),
                      ),

                      VGap.x3(),

                      ///  InkWell
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap:
                            AppNavigator().navigateToForgotPasswordScreen,

                          child: Text(
                            "Forgot Password?",
                            style: context.textTheme.labelLarge?.copyWith(
                              color: context.colorScheme.scrim,
                            ),
                          ),
                        ),
                      ),
                      VGap.x6(),

                      Builder(
                        builder: (context) {
                          return SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: FilledButton(
                              onPressed: () async {
                                if (_formModel.saveAndValidate()) {
                                  final data = _formModel.payload;

                                  final email = data[LoginFormModel.email];
                                  final password = data[LoginFormModel.password];

                                  final repo = AuthRepository();
                                  final success = await repo.login(email, password);

                                  if (!context.mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        success
                                            ? "Login Successful "
                                            : "Invalid email or password ",
                                      ),
                                      backgroundColor:
                                      success ? Colors.green : Colors.red,
                                    ),
                                  );

                                  if (success) {
                                    AppNavigator().navigateToHomeScreen();
                                  }
                                }
                              },
                              child: Text("Login"),
                            ),
                          );
                        },
                      ),
                      VGap.x4(),

                      /// REGISTER ROW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: context.textTheme.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppNavigator().navigateToRegisterScreen();
                            },
                            child: Text(
                              "Register",
                              style: context.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),

                      VGap.x8(),

                      /// TERMS TEXT
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "By signing in, I accept the.\n",
                                style: context.textTheme.bodyMedium,
                              ),

                              /// Privacy Policy
                              TextSpan(
                                text: "Privacy Policy",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                               /* recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    AppNavigator().navigateToPrivacyPolicy();
                                  },*/
                              ),

                              /// &
                              TextSpan(
                                text: " & ",
                                style: context.textTheme.bodyMedium,
                              ),

                              /// Terms and Conditions
                              TextSpan(
                                text: "Terms and Conditions",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                                /*recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    AppNavigator().navigateToTermsScreen();
                                  },*/
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
        ],
      ),
    );
  }
}