import 'package:flutter/material.dart';
import 'package:hello_flutter/dashboard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginForm(),
  ));
}

class LoginForm extends StatefulWidget {
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget _form(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                print(
                    "Email: ${emailController.text} password: ${passwordController.text}");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Dashboard(email: emailController.text)));
              },
              child: const Text("Login"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
        body: Builder(
          builder: (context) => _form(context),
        ),
      ),
    );
  }
}
