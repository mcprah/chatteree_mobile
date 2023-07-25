import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/providers/film_provider.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:chatteree_mobile/view/screens/auth/sign_in.dart';
import 'package:chatteree_mobile/view/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => MessageProvider()),
        ChangeNotifierProvider(create: (_) => FilmProvider()),
      ],
      child: MaterialApp(
        title: 'Chatteree',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'GeneralSans',
          bottomSheetTheme: BottomSheetThemeData(
            modalBackgroundColor: Colors.transparent,
            modalBarrierColor: Colors.black.withOpacity(0.15),
            elevation: 0,
          ),
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
