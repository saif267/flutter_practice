import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test5/app/components/ui/gap.dart';
import 'package:test5/theme.dart';
import '../../Services/service.dart';
import '../../app/components/form_input_feilds/form_input_feilds.dart';
import '../../app/components/form_input_feilds/form_validators.dart';


class ChangePasswordSheet extends StatefulWidget {
  const ChangePasswordSheet({super.key});

  @override
  State<ChangePasswordSheet> createState() => _ChangePasswordSheetState();
}

class _ChangePasswordSheetState extends State<ChangePasswordSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  String? savedPassword;

  @override
  void initState() {
    super.initState();
    loadPassword();
  }

  void loadPassword() async {
    savedPassword = await AuthService.getPassword();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.67,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [

            /// DRAG HANDLE
            VGap.x2(),
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: colors.outline,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            VGap.x3(),

            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.outline),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Change Password",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 30),
                ],
              ),
            ),

            VGap.x12(),

            /// FORM
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [

                    /// CURRENT PASSWORD
                    _label("Current Password"),
                    VGap.x1(),
                    AppFormTextField(
                      name: "current_password",
                      hintText: "Enter current password",
                      prefixIcon: LucideIcons.lock,
                      isPassword: true,
                      iconColor: colors.outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }

                        if (savedPassword != null && savedPassword!.isNotEmpty && value != savedPassword) {
                          return "Incorrect password";
                        }

                        return null;
                      },
                    ),

                    VGap(height: 10),

                    /// NEW PASSWORD
                    _label("New Password"),
                    VGap.x1(),
                    AppFormTextField(
                      name: "password",
                      hintText: "Enter new password",
                      prefixIcon: LucideIcons.lock,
                      isPassword: true,
                      iconColor: colors.outline,
                      validator: AppValidators.password(),
                    ),

                    VGap(height: 10),

                    /// CONFIRM PASSWORD
                    _label("Confirm Password"),
                    VGap.x1(),
                    AppFormTextField(
                      name: "confirm_password",
                      hintText: "Confirm password",
                      prefixIcon: LucideIcons.lock,
                      isPassword: true,
                      iconColor: colors.outline,
                      validator: (value) {
                        final password = _formKey
                            .currentState
                            ?.fields['password']
                            ?.value;

                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }

                        if (value != password) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),

                    VGap.x12(),

                    /// SAVE BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          final form = _formKey.currentState;

                          if (form?.saveAndValidate() ?? false) {
                            final newPassword = form!.value['password'];

                            await AuthService.savePassword(newPassword);

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Password updated"),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Save",
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    VGap.x3(),

                    /// CANCEL BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: colors.outline),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    VGap.x6(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: context.textTheme.titleSmall,
      ),
    );
  }
}