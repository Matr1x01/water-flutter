import "package:flutter/material.dart";
import 'package:water_flutter/components/custom_button.dart';
import 'package:water_flutter/components/custom_password_field.dart';
import 'package:water_flutter/components/custom_text_field.dart';
import 'package:water_flutter/constants.dart';
import 'package:water_flutter/services/auth_service.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final AuthServices authServices = AuthServices();

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
                        if (_formKey.currentState!.validate()) {
                          if (authServices
                              .authInvCode(int.parse(userInv.text))) {
                            if (userPass == userConfPass) {
                              authServices.addUser(userId.text, userPass.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Register Successfull")),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Password and Confirm Password do not match")),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Invalid Invitation Code")),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Log In",
                            style: TextStyle(color: lightBlue),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
              const Padding(
                padding: EdgeInsets.all(50),
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
