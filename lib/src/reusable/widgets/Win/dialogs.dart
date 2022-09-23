import 'package:flutter/material.dart';

class WinDialog {
  late BuildContext context;

  WinDialog(this.context);

  Future<void> LoginFailed() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.error,
                      size: 100,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login Failed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> Welcome(String name) async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 125,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.front_hand_rounded,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Welcome back $name!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> SuccessfulLogin() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.check_circle_rounded,
                      size: 100,
                      color: Colors.green,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Successful Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> SuccessfullySent() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.send_rounded,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We have sent an email to your address, please check your mailbox',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
