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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserHome(),
                    ),
                  );
                },
                child: const Icon(Icons.clear),
              ),
              height: 50,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.topRight,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Image(
                image: AssetImage("/images/assetImages/image3.png"),
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
                image: AssetImage("/images/icons/logo.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage("/images/icons/footer.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
