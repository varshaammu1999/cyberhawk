import 'package:flutter/material.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
      Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Text("Create Account",style: TextStyle(fontSize: 40,color: Colors.white),),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: (InputDecoration(
                border: OutlineInputBorder(),
              label: Text("Phone Number")
            )
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: (InputDecoration(
                border: OutlineInputBorder(),
                label: Text("password")
            )
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: (InputDecoration(
              border: OutlineInputBorder(),
                label: Text("role")

            )
            ),
          ),


          ],
      )
      ),
    );
  }
}
