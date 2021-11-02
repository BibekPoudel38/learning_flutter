import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/logincontroller.dart';
import 'package:movie_app/models/loginmode.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecure = true;

  // declaring textcontroller for username and password
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Login"),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (loginController) {
            return Form(
              key: form,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Please login to continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: emailField,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter email",
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
                          loginController.loginUser(
                            LoginModel(
                              email: emailField.text,
                              password: passwordField.text,
                            ),
                            context,
                          );
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   '/homepage',
                          //   (route) => false,
                          // );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: loginController.isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUp');
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
