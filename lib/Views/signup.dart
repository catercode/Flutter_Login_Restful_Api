import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:userlogin/Views/controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _key,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "<CATERCODE>",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Create Accounts",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text("Please fill in your details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  label: Text("Email"),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Email field required" : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                    hintText: "Phone Number", label: Text("Phone Number")),
                validator: (value) =>
                    value!.isEmpty ? "Phone numbwe field required" : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password", label: Text("Password")),
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
                          .createAccout(
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text)
                          .then((response) => {
                                if (response.message ==
                                    "Account created successful")
                                  {
                                    showAlertDialog(
                                        context, "Account created successful")
                                  }
                                else
                                  {
                                    {
                                      showAlertDialog(
                                          context, 'Failed to create account')
                                    }
                                  }
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
                          width: 8,
                        ),
                        Text("Create Accounts")
                      ],
                    ),
                  )),
            )
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
