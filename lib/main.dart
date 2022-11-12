import 'package:flutter/material.dart';
import 'package:flutter_ticket_booking_apps/services/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Sign Up"),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                      "RaisaIzza@gmail.com",
                      "1234567",
                      "Jenny",
                      ["Action", "Horror", "Comedy", "Anime"],
                      "Indonesian");

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    result.user.toString();
                  }
                })
          ],
        )),
      ),
    );
  }
}
