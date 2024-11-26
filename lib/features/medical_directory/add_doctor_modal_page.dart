import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rephub/core/extensions/context_extensions.dart';
import 'package:rephub/core/extensions/wolt_extensions.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class AddDoctorModalPage extends SliverWoltModalSheetPage {
  AddDoctorModalPage(BuildContext context)
      : super(
          pageTitle: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'Add a new Doctor',
              style: context.textTheme.titleLarge,
            ),
          ),
          leadingNavBarWidget: AppBarButton(
            onTap: context.popModalPage,
            icon: HugeIcons.strokeRoundedArrowLeft02,
          ),
          trailingNavBarWidget: TextButton(
            onPressed: () => {
              context.popModalPage(),
            },
            child: const Text('Add Doctor'),
          ),
          mainContentSliversBuilder: (context) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    AppTextField(
                      onChanged: (value) {},
                      hintText: 'E.g John Doe',
                      labelText: 'Full name (DO NOT INCLUDE TITLE)',
                    ),
                    AppTextField(
                      onChanged: (value) {},
                      labelText: 'Specialty',
                      hintText: 'E.g Cardiologist',
                    ),
                    AppTextField(
                      onChanged: (value) {},
                      labelText: 'Phone',
                      hintText: 'E.g 123-456-7890',
                    ),
                    AppTextField(
                      onChanged: (value) {},
                      labelText: 'Facility',
                      hintText: 'E.g St. John Hospital',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hintText,
    required this.labelText,
    required this.onChanged,
    super.key,
  });

  final String hintText;
  final String labelText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: Colors.grey.shade400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    required this.icon,
    super.key,
    this.onTap,
    this.buttonColor = Colors.transparent,
  });

  final void Function()? onTap;
  final Color buttonColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Icon(icon, size: 30),
      ),
    );
  }
}
