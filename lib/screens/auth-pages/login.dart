import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:water_flutter/components/custom_button.dart';
import 'package:water_flutter/components/custom_password_field.dart';
import 'package:water_flutter/components/custom_text_field.dart';
import 'package:water_flutter/constants.dart';
import 'package:water_flutter/screens/auth-pages/register.dart';
import 'package:water_flutter/services/auth_service.dart';
import 'package:water_flutter/states/user_state.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final AuthServices authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double padding = size.width * 0.1,
        width = size.width * 0.8,
        maxWidth = 720,
        maxHeight = 370;
    if (size.width > maxWidth) {
      width = maxWidth;
      padding = (size.width - maxWidth) / 2;
    } else {
      padding = size.width * 0.1;
      width = size.width * 0.8;
    }

    TextEditingController userId = TextEditingController();
    TextEditingController userPass = TextEditingController();

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
                  child: Image.asset("assets/images/icons/logo.png")),
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
                    pattern: "[0-9]",
                    onChange: (text) {},
                  ),
                  CustomPasswordField(
                    controller: userPass,
                    leadingIcon: Icons.lock_outlined,
                    placeholder: "Password",
                    label: "Password",
                    onChange: (text) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          if (authServices.userAuth(
                              userId.text, userPass.text)) {
                            final loginState =
                                Provider.of<UserState>(context, listen: false);
                            loginState.setLoginState(true);
                            loginState.setUser(
                                int.parse(userId.text),
                                authServices
                                    .getUserNameById(int.parse(userId.text)),
                                userPass.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login successfull"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login Failed")),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Register",
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
                  image: AssetImage("assets/images/icons/footer.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
