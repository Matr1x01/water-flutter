import 'package:flutter/material.dart';
import 'package:water_flutter/components/custom_button.dart';
import 'package:water_flutter/constants.dart';
import 'package:water_flutter/screens/user-pages/user_home.dart';

class SurveyEnd extends StatelessWidget {
  const SurveyEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserHome(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.clear,
                color: black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Image(
                image: AssetImage("assets/images/assetImages/image3.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Thanks",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Your actions are helping to reduce your use \n of energy and save money.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ((size.width * .7) / 2) - 20,
                vertical: 30,
              ),
              child: CustomButton(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserHome(),
                    ),
                  );
                },
                child: const Text(
                  "Back to home",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 40, bottom: 200),
              child: const Image(
                image: AssetImage("assets/images/icons/logo.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage("assets/images/icons/footer.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
