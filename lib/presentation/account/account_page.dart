import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
        child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar with shadow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/avatar/user1.png'),
              ),
            ),
            const SizedBox(height: 20),
            
            // Name
            Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            
            // Job title
            Text(
              'IT Specialist',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 40),

            // Logout Button
            SizedBox(
              width: 200, // button width
              height: 50, // button height
              child: ElevatedButton(
                onPressed: () {
                  // Add your logout logic here
                  print("Logout pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.redAccent.withOpacity(0.5),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Logout', style: TextStyle(color: Colors.white),),
              ),
            ),

            SizedBox(
              width: 200, // button width
              height: 50, // button height
              child: ElevatedButton(
                onPressed: () {
                  // Add your logout logic here
                  context.go('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.redAccent.withOpacity(0.5),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Go to Login', style: TextStyle(color: Colors.white),),
              ),
            ),

            SizedBox(
              width: 200, // button width
              height: 50, // button height
              child: ElevatedButton(
                onPressed: () {
                  // Add your logout logic here
                  context.go('/register');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.redAccent.withOpacity(0.5),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Go to Register', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),

      ),
    );
  }
}