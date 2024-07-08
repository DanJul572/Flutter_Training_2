import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150.0,
            width: 150.0,
            child: ClipOval(
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          ),
          const SizedBox(
              height: 20.0
          ),
          const Text(
            'User Name',
            style: TextStyle(color: Colors.deepOrange, fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
