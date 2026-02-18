import 'package:chats/page/home_screen.dart';
import 'package:chats/page/login_screen.dart';
import 'package:chats/shared/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'helper/helper_function.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb)
  {
    await Firebase.initializeApp
      (
        options: FirebaseOptions
          (
            apiKey: "AIzaSyDbxHSljgvseaiQKqbAz62PYR7xqOeEuA0",
            appId: "1:794127467640:android:334b4802f5d87e1830998d",
            messagingSenderId: "794127467640",
            projectId: "chatapp-ee4bf"
        )
    );

  }else
  {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isSignedIn  = false;

  @override
  void initState() {
    getuserLoggedInStatus();
    super.initState();
  }

  getuserLoggedInStatus() async
  {
    await HelperFunctions.getUserLoggedInStatus().then((value)
        {
          if(value!=null)
            {
             setState(() {
               _isSignedIn = value;
             });
            }
        });
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
      ),
     debugShowCheckedModeBanner: false,
      home: _isSignedIn?  HomePage() : LoginPage(),
    );
  }
}
