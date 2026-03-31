import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test5/app/components/ui/gap.dart';
import 'package:test5/theme.dart';

import '../../Services/user_local_service.dart';
import '../../app/components/Data/personal_infor_module.dart';
import '../../app/components/form_input_feilds/form_input_feilds.dart';

class EditProfileSheet extends StatefulWidget {
  const EditProfileSheet({super.key});

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  String selectedGender = "Male";
  final PersonalInfoFormModel _formModel = PersonalInfoFormModel();

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final user = await UserLocalService.getUser();

    setState(() {
      _formModel.initialValue.addAll({
        PersonalInfoFormModel.name: user['name'],
        PersonalInfoFormModel.username: user['username'],
        PersonalInfoFormModel.Phone_no: user['phone'],
        PersonalInfoFormModel.city: user['city'],
      });

      selectedGender = user['gender'] ?? "Male";
    });
  }
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
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
                        Icons.arrow_back_ios,
                        size: 20,
                        color: colors.onSurface,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Personal Information",
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),
                  const SizedBox(width: 30),
                ],
              ),
            ),

            VGap.x5(),

            /// FORM
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormBuilder(
                key: _formModel.formKey,
                initialValue: _formModel.initialValue,
                child: Column(
                  children: [

                    /// AVATAR
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                          Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: colors.primary, width: 2),
                          ),
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage:
                            AssetImage("assets/players/hassan.png"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: colors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, size: 14),
                        ),
                      ],
                    ),

                    VGap.x6(),

                    /// NAME
                    _label("Name"),
                    VGap.x1(),
                    AppFormTextField(
                      name: PersonalInfoFormModel.name,
                      hintText: 'Enter name',
                      prefixIcon: LucideIcons.user,
                      iconColor: colors.onSurface, // ✅ FIX
                    ),

                    VGap.x3(),

                    /// USERNAME
                    _label("Username"),
                    VGap.x1(),
                    AppFormTextField(
                      name: PersonalInfoFormModel.username,
                      hintText: 'Enter username',
                      prefixIcon: LucideIcons.user,
                      iconColor: colors.onSurface,
                    ),

                    VGap.x3(),

                    /// PHONE
                    _label("Phone no."),
                    VGap.x1(),
                    AppFormTextField(
                      name: PersonalInfoFormModel.Phone_no,
                      hintText: 'Enter phone',
                      prefixIcon: LucideIcons.phone,
                      iconColor: colors.onSurface,
                    ),

                    VGap.x3(),

                    /// CITY
                    _label("City"),
                    VGap.x1(),
                    AppFormTextField(
                      name: PersonalInfoFormModel.city,
                      hintText: 'Enter city',
                      prefixIcon: Icons.location_on_outlined,
                      iconColor: colors.onSurface,
                    ),

                    VGap.x4(),

                    /// GENDER
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: textTheme.bodyMedium,
                      ),
                    ),

                    VGap.x2(),

                    Row(
                      children: [
                        _gender(
                          "Male",
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedMale02,
                            size: 20,
                            strokeWidth: 1.5,
                            color: colors.onSurface,
                          ),
                        ),
                        _gender(
                          "Female",
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedFemale02,
                            size: 20,
                            strokeWidth: 1.5,
                            color: colors.onSurface,
                          ),
                        ),
                        _gender(
                          "Other",
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedFemaleSymbol,
                            size: 20,
                            strokeWidth: 1.5,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),

                    VGap.x6(),

                    /// BUTTONS (NOW INSIDE SCROLL)
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
                          final form = _formModel.formKey.currentState;

                          if (form?.saveAndValidate() ?? false) {
                            final data = form!.value;

                            await UserLocalService.saveUser(
                              name: data[PersonalInfoFormModel.name],
                              username: data[PersonalInfoFormModel.username],
                              phone: data[PersonalInfoFormModel.Phone_no],
                              city: data[PersonalInfoFormModel.city],
                              gender: selectedGender,
                            );

                            Navigator.pop(context, true); // return success
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

  Widget _gender(String text, Widget icon) {
    final isSelected = selectedGender == text;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.outline,
              width: isSelected ? 1.5 : 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            setState(() => selectedGender = text);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              HGap.x1(),
              Text(text, style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.scrim,
              )),
            ],
          ),
        ),
      ),
    );
  }
}