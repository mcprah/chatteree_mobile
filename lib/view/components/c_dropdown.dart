import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:flutter_svg/svg.dart';

class CDropdown extends StatelessWidget {
  final String? label;
  final String placeholder;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final List<String> dropdownItems;
  final String? selectedValue;

  final void Function(String?)? onChanged;

  const CDropdown({
    super.key,
    this.label,
    this.validator,
    required this.textController,
    required this.dropdownItems,
    this.selectedValue,
    this.onChanged,
    this.placeholder = "Enter text",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16),
            child: Text(
              label!,
              style: const TextStyle(
                  color: Colors.grey), // Use your custom style here
            ),
          ),
        DropdownButtonFormField(
          elevation: 0,
          icon: const SizedBox.shrink(),
          value: selectedValue!.isNotEmpty ? selectedValue : null,
          onChanged: (value) {
            return onChanged?.call(value);
          }, // Add your logic to handle dropdown changes
          validator: validator,
          decoration: cDefaultInputDecoration.copyWith(
            hintText: placeholder,
            suffixIcon: Padding(
              padding:
                  const EdgeInsets.all(8.0) + const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                'assets/icons/icon/arrow/chevron-down.svg',
                height: 24,
                width: 24,
              ),
            ),
          ),
          items: dropdownItems.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Define your buildAccentStadiumBorder and buildStadiumBorder methods here
}
