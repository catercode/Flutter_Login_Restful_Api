import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userlogin/Views/controller.dart';
import 'package:userlogin/Views/signup.dart';
import 'package:userlogin/Views/welcome.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _key,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "<CATERCODE>",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "L O G I N",
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16 / 2,
            ),
            Text(
              "WITH REST API",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Please enter your email and password to login",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Email field required" : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Password field required" : null,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      await userController
                          .login(
                              phone: phoneController.text,
                              password: passwordController.text)
                          .then((response) => {
                                if (response.message == "Login Sucessfull")
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => WelcomePage(),
                                        ))
                                  }
                                else
                                  {showAlertDialog(context, "Login Failed")}
                              });
                    } else {
                      print("Form validation failed");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.login),
                        SizedBox(
                          width: 16,
                        ),
                        Text("L O G I N ")
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  )),
              child: const Text(
                "Register Now",
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: Text(
                "Powered By CaterCode",
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String info) {
    // set up the buttons
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Registration"),
      content: Text(
        info,
        style: const TextStyle(color: Colors.green),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
