import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_flutter/components/custom_button.dart';
import 'package:water_flutter/components/custom_calender.dart';
import 'package:water_flutter/components/custom_clock.dart';
import 'package:water_flutter/constants.dart';
import 'package:water_flutter/screens/user-pages/components/custom_drawer.dart';
import 'package:water_flutter/screens/user-pages/survay_page.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: stone.withOpacity(.5),
                    blurRadius: 8,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => drawerKey.currentState!.openDrawer(),
                    child: const Icon(
                      Icons.menu,
                      color: black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage("images/icons/logo1.png"),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              margin: const EdgeInsets.only(
                  bottom: 2, left: 20, right: 20, top: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(0, 6),
                    color: stone.withOpacity(.5),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Our community and the environment at the forefront.\nWe're committing today to a better tomorrow.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Image(
                    image: AssetImage("/images/assetImages/image1.png"),
                  ),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              margin: const EdgeInsets.only(
                  bottom: 2, left: 20, right: 20, top: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(0, 6),
                    color: stone.withOpacity(.5),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 40),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          "Time of action",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        "Please set the date and time of your most recent actions.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomCalender(),
                const CustomClock(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: CustomButton(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurvayPage(),
                        ),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.track_changes,
                            color: white,
                          ),
                          Text(
                            "Enter Actions",
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ),
                )
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.only(
                  bottom: 20, left: 20, right: 20, top: 2),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                    color: stone.withOpacity(.5),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.watch_later,
                          color: black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Last time you recorded your actions",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(DateFormat("MMMM dd,yyyy | hh:mma")
                          .format(DateTime.now())),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("help & support"),
                  ),
                  const Image(
                    image: AssetImage("/images/icons/footer.png"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
