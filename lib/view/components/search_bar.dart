import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchTextController,
    required this.onSubmit,
  });

  final TextEditingController searchTextController;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CTextField(
          textController: searchTextController,
          keyboardType: TextInputType.text,
          placeholder: "Search for chatter or message",
          prefix: SvgPicture.asset(
            "assets/icons/icon/interfaces/search.svg",
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }
}
