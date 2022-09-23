import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget{
  
  Widget generateInputForm(BuildContext context, {required TextEditingController controller, required bool hide, required String hint, required double width, required Color color}) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - 50;
    
    return Container(
      width: width == 0 || width >= wd  ? double.infinity : width,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(60)),
      child: TextFormField(
        controller: controller,
        obscureText: hide,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.send,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black),
        cursorColor: Theme.of(context).primaryColor,
        //cursorRadius: const Radius.circular(2),
        cursorWidth: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.all(20),
            /*enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.orange.shade900)),*/
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2.2),
            )),
      ),
    );
  }

  Widget EmptyLabel(BuildContext context, {required String label, required bool active}){
    
    if(active){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20),
        child: Text(
          label,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).errorColor
          ),
        )
      );
    }else{
      return Container();
    }
    
  }

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}
