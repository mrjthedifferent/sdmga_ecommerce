import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

AppBar myAppBar() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    gapPadding: 10.0,
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide.none,
  );
  return AppBar(
    titleSpacing: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 16.0,),
      child: TextField(
        decoration: InputDecoration(
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          hintText: 'Search',
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    ),
    actions: [
      const SizedBox(
        width: 10,
      ),
      SizedBox(
        width: 50,
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Badge(
            badgeContent: Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.grey),
              onPressed: () {},
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      SizedBox(
        width: 50,
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Badge(
            badgeContent: Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.grey),
              onPressed: () {},
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 16,
      ),
    ],
  );
}
