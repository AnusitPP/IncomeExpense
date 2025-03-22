import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({super.key})
      : preferredSize = Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Color(0xFFFDFBEE),
      title: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wallet",
                  style: TextStyle(
                    color: Color(0xFF4F965E),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-vector/avatar-profile-icon-flat-style-male-user-profile-vector-illustration-isolated-background-man-profile-sign-business-concept_157943-38764.jpg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}