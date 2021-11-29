import "package:flutter/material.dart";
import 'package:water_flutter/components/custom_button.dart';
import 'package:water_flutter/components/custom_password_field.dart';
import 'package:water_flutter/components/custom_text_field.dart';
import 'package:water_flutter/constants.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double padding = size.width * 0.1,
        width = size.width * 0.8,
        maxWidth = 720,
        maxHeight = 620;
    if (size.width > maxWidth) {
      width = maxWidth;
      padding = (size.width - maxWidth) / 2;
    } else {
      padding = size.width * 0.1;
      width = size.width * 0.8;
    }
    final _formKey = GlobalKey<FormState>();
    TextEditingController userId = TextEditingController();
    TextEditingController userPass = TextEditingController();
    TextEditingController userInv = TextEditingController();
    TextEditingController userConfPass = TextEditingController();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: padding,
                  right: padding,
                  top: size.height * 0.1,
                ),
                child: const Image(
                  image: AssetImage("images/icons/logo.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: padding,
                  right: padding,
                  top: 20,
                ),
                width: width,
                height: maxHeight,
                child: Column(children: [
                  CustomTextField(
                    controller: userId,
                    leadingIcon: Icons.email_outlined,
                    placeholder: "Work Email",
                    label: "Work Email",
                    pattern: "[a-zA-Z]",
                    onChange: (text) {},
                  ),
                  CustomTextField(
                    controller: userInv,
                    leadingIcon: Icons.all_out_outlined,
                    placeholder: "Invitation Code",
                    label: "Invitation Code",
                    pattern: "[0-9]",
                    onChange: (text) {},
                  ),
                  CustomPasswordField(
                    controller: userPass,
                    leadingIcon: Icons.lock_outlined,
                    placeholder: "Password",
                    label: "Password",
                    // pattern: "[a-zA-Z]",
                    onChange: (text) {},
                  ),
                  CustomPasswordField(
                    controller: userConfPass,
                    leadingIcon: Icons.lock_outlined,
                    placeholder: "Confirm Password",
                    label: "Confirm Password",
                    // pattern: "[a-zA-Z]",
                    onChange: (text) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onPress: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(userId.text +
                                    " " +
                                    userInv.text +
                                    " " +
                                    userPass.text +
                                    " " +
                                    userConfPass.text +
                                    " ")),
                          );
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: () {}, child: const Text("Log In"))
                    ],
                  )
                ]),
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
      ),
    );
  }
}
