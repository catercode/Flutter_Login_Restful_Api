import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "WELCOME",
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
