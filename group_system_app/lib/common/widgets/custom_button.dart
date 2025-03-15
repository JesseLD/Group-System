// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:group_system_app/common/constants/app_colors.dart';
import 'package:group_system_app/common/constants/app_text_styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  Widget child;
  void Function() onPressed;
  CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.onPressed();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
