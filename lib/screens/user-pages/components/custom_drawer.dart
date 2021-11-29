import 'package:flutter/material.dart';
import 'package:water_flutter/components/custom_tile.dart';
import 'package:water_flutter/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: stone,
              ),
            ),
            color: white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Spacer(),
            CustomListTile(
              onTap: () {},
              icon: Icon(
                Icons.person,
                color: black.withOpacity(.8),
              ),
              child: Column(
                children: const [
                  Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  Text(
                    "User Id",
                    style: TextStyle(fontSize: 12, color: stone),
                  )
                ],
              ),
            )
          ]),
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
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
