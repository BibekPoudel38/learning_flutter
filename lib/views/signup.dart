import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/signup.dart';
import 'package:movie_app/models/profilemodel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obsecure = true;

  // declaring textcontroller for username and password
  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  TextEditingController confirmPasswordField = TextEditingController();

  GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<SignupController>(
          init: SignupController(),
          builder: (controller) {
            return Form(
              key: form,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Please fill form to signup",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: usernameField,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter Username",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailField,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter email address",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordField,
                      obscureText: obsecure,
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password should be at least 8 character long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter Password",
                        suffixIcon: IconButton(
                          icon: obsecure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPasswordField,
                      validator: (value) {
                        if (passwordField.text != confirmPasswordField.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "please Confirm password",
                        suffixIcon: IconButton(
                          icon: obsecure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        fixedSize: MaterialStateProperty.all(
                          const Size.fromWidth(200),
                        ),
                      ),
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          ProfileModel profile = ProfileModel(
                            id: "",
                            email: emailField.text,
                            username: usernameField.text,
                            password: passwordField.text,
                            profileImage: "",
                          );
                          controller.signup(profile);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: controller.isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Signup",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
