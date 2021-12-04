import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_flutter/screens/auth-pages/login.dart';
import 'package:water_flutter/screens/user-pages/user_home.dart';
import 'package:flutter/foundation.dart';
import 'package:water_flutter/states/user_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    // Provider added to this widget
    return ChangeNotifierProvider(
      create: (context) => UserState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SydneWater',
        theme: ThemeData(
          fontFamily: "Roboto",
        ),
        home: MainPage(
          key: key,
        ),
        // routes: <String, WidgetBuilder>{
        //   "/login": (context) => Login(
        //         key: key,
        //       ),
        //   "/register": (context) => Register(
        //         key: key,
        //       ),
        //   "/home": (context) => UserHome(
        //         key: key,
        //       ),
        //   "/survayPage": (context) => SurvayPage(
        //         key: key,
        //       ),
        //   "/survayEnd": (context) => SurveyEnd(
        //         key: key,
        //       ),
        //   "/": (context) => MainPage(
        //         key: key,
        //       ),
        // },
      ),
    );
  }
}

// Main page to display
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<UserState>(context, listen: true);

    return loginState.logedIn
        ? UserHome(key: widget.key)
        : Login(key: widget.key);
  }
}
