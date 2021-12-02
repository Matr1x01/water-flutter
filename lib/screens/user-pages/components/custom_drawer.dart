import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_flutter/components/custom_tile.dart';
import 'package:water_flutter/constants.dart';
import 'package:water_flutter/screens/user-pages/survay_page.dart';
import 'package:water_flutter/screens/user-pages/survey_end.dart';
import 'package:water_flutter/states/user_state.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final loginState = Provider.of<UserState>(context, listen: false);
    return Drawer(
        child: ListView(
      children: [
        Container(
          child: Column(children: [
            const Spacer(),
            CustomListTile(
              horizontalPadding: 25,
              onTap: () {},
              icon: Icon(
                Icons.person,
                color: black.withOpacity(.8),
              ),
              child: Column(
                children: [
                  Text(
                    loginState.getUserid(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  Text(
                    loginState.getUserid(),
                    style: const TextStyle(fontSize: 12, color: stone),
                  )
                ],
              ),
            ),
          ]),
          height: size.height * 0.25,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: stone,
              ),
            ),
          ),
        ),
        CustomListTile(
          horizontalPadding: 25,
          onTap: () {},
          icon: Icon(
            Icons.batch_prediction,
            color: black.withOpacity(.8),
          ),
          child: const Text(
            "Latest tips & message",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomListTile(
          horizontalPadding: 25,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SurvayPage(),
              ),
            );
          },
          icon: Icon(
            Icons.assessment,
            color: black.withOpacity(.8),
          ),
          child: const Text(
            "Fill up observation survey",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomListTile(
          horizontalPadding: 25,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SurveyEnd(),
              ),
            );
          },
          icon: Icon(
            Icons.chrome_reader_mode,
            color: black.withOpacity(.8),
          ),
          child: const Text(
            "End of trial survey",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomListTile(
          horizontalPadding: 25,
          onTap: () {
            final loginState = Provider.of<UserState>(context, listen: false);
            loginState.setLoginState(false);
          },
          icon: Icon(
            Icons.logout,
            color: black.withOpacity(.8),
          ),
          child: const Text(
            "Log Out",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ));
  }
}
