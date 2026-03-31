import 'package:flutter/material.dart';
import 'package:test5/app/components/ui/gap.dart';
import 'package:test5/theme.dart';

class deleteAccount extends StatefulWidget {
  const deleteAccount({super.key});

  @override
  State<deleteAccount> createState() => _deleteAccount();
}

class _deleteAccount extends State<deleteAccount> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.52,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  "Delete Account",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                const Spacer(),
                HGap.x2(),
                const SizedBox(width: 30),
              ],
            ),
          ),
          VGap.x10(),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// MAIN TEXT
                  Text(
                    "Are you sure you want to Delete your Account",
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colors.shadow,
                    ),
                  ),

                  VGap(height: 10,),

                  /// SUB TEXT
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colors.error.withOpacity(0.2), // light red/pink bg
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "This action cannot be undone and all your data will be permanently removed",
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  VGap.x10(),

                  /// Delete BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Delete Account",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
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
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                  ),

                  VGap.x4(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}