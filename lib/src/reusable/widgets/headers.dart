import 'package:flutter/material.dart';

class Headers {
  late BuildContext context;
  Headers(this.context);

  AppBar Custom1(String title){
    return AppBar(
      backgroundColor: Colors.white10,
      elevation: 0,
      foregroundColor: Color.fromARGB(255, 29, 28, 28),
      leading: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.menu_rounded)
      ),
      centerTitle: true,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.filter_center_focus_rounded)
        ),
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.search_rounded)
        ),
      ],
    );
  }

  AppBar Custom2(String title){
    return AppBar(
      backgroundColor: Colors.white10,
      elevation: 0,
      foregroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.menu_rounded)
      ),
      centerTitle: true,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.filter_center_focus_rounded)
        ),
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.candlestick_chart_outlined)
        ),
      ],
    );
  }


}