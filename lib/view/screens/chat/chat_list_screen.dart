import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/providers/film_provider.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/chat/chat_list_header.dart';
import 'package:chatteree_mobile/view/components/chat/chat_list.dart';
import 'package:chatteree_mobile/view/components/commons/search_bar.dart';
import 'package:chatteree_mobile/view/components/film/user_film_list.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatListScreen> {
  TextEditingController textController = TextEditingController();
  late AuthenticationProvider authenticationProvider;
  late MessageProvider messageProvider;
  late FilmProvider filmProvider;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      messageProvider.setUserMessageList();
      filmProvider.setUserFilmList();
    });
  }

  Widget buildChatScreen({
    required AuthenticationProvider authenticationProvider,
    required MessageProvider messageProvider,
  }) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            child: SearchBar(
              searchTextController: textController,
              onSubmit: () {},
            ),
          ),
          SizedBox(
            width: constraint.maxWidth,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      print("Add new film");
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                                color: AppColors.secondaryLight2),
                            child: Center(
                              child: SvgPicture.asset(
                                  "assets/icons/icon/interfaces/add-item.svg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Add film",
                          style: cSmallBodyTextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const FilmList(),
                ],
              ),
            ),
          ),
          const Expanded(
            child: ChatList(),
          ),
        ],
      );
    });
  }

  Widget buildFirstTimeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/first-time-welcome.png",
          width: MediaQuery.of(context).size.height * 0.36,
        ),
        const SizedBox(
          height: 42,
        ),
        Text(
          "We hear say your mouth die hmmm",
          textAlign: TextAlign.center,
          style: cBodyTextStyle,
        ),
        const SizedBox(
          height: 42,
        ),
        CButton(
          text: "Start Chatting",
          onPressed: () {
            authenticationProvider.isFirstTimeUser = false;
          },
          type: CButtonType.ACCENT,
          prefixIcon: SvgPicture.asset(
            "assets/icons/icon/interfaces/edit-square-feather.svg",
          ),
        ),
        const SizedBox(
          height: 62,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    authenticationProvider = context.watch<AuthenticationProvider>();
    messageProvider = context.watch<MessageProvider>();
    filmProvider = context.watch<FilmProvider>();

    return DefaultLayout(
      screen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 24,
              right: 24,
            ),
            child: ChatListHeader(),
          ),
          Expanded(
            child: authenticationProvider.isFirstTimeUser ||
                    messageProvider.userMessageList.isEmpty
                ? buildFirstTimeScreen()
                : buildChatScreen(
                    authenticationProvider: authenticationProvider,
                    messageProvider: messageProvider,
                  ),
          ),
        ],
      ),
    );
  }
}
