import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_flutter/screens/auth-pages/login.dart';
import 'package:water_flutter/screens/auth-pages/register.dart';
import 'package:water_flutter/screens/user-pages/survay_page.dart';
import 'package:water_flutter/screens/user-pages/survey_end.dart';
import 'package:water_flutter/screens/user-pages/user_home.dart';
// import 'package:water_flutter/states/login_state.dart';
import 'package:flutter/foundation.dart';
import 'package:water_flutter/states/login_state.dart';

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
    return ChangeNotifierProvider<LoginState>(
      create: (context) => LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SydneWater',
        theme: ThemeData(
          fontFamily: "Roboto",
        ),
        routes: <String, WidgetBuilder>{
          "/login": (_) => Login(
                key: key,
              ),
          "/register": (_) => Register(
                key: key,
              ),
          "/home": (_) => UserHome(
                key: key,
              ),
          "/survayPage": (_) => SurvayPage(
                key: key,
              ),
          "/survayEnd": (_) => SurveyEnd(
                key: key,
              ),
        },
        home: UserHome(
          key: key,
        ),
      ),
    );
  }
}
