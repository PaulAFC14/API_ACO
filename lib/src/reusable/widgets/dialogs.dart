import 'package:flutter/material.dart';

class MyDialog {
  late BuildContext context;
  
  MyDialog(this.context);

  Future<void> LoginFailed() async{
    return showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          
          contentPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.only(top: 10),
          icon: Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 80,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Login Failed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })
      );
    
    
  }

  Future<void> SuccessfulLogin() async{
    return showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          
          contentPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.only(top: 10),
          icon: Icon(
            Icons.check_circle_rounded,
            size: 100,
            color: Colors.green,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 80,
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Successful Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })
      );
    
    
  }

}