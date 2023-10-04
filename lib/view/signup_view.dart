import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/view/login_view.dart';
import 'package:provider/provider.dart';

import '../resources/componenets/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _obsecurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passFocusNode);
                },
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      focusNode: passFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          label: Text("Password"),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  );
                }),
            SizedBox(
              height: height * .03,
            ),
            RoundButton(
                title: "Sign Up",
                loading: authViewModel.signUpLoading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessages(
                        "Enter Email", "Email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessages(
                        "Enter Password", "Password", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessages(
                        "Password should be minimum 6 digit",
                        "Password",
                        context);
                  } else {
                    // Todo : Register API
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString(),
                    };

                    authViewModel.registerApi(data, context);

                  }
                }),
            SizedBox(
              height: height * .02,
            ),

            InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RoutesName.login);
                  // Todo : This navigator remove all previous screens
                  Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);

                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}

