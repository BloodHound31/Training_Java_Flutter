import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: const EdgeInsets.fromLTRB(0,240.0,0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  fixedSize: MaterialStateProperty.all<Size>(const Size(300.0, 150.0)),
                  //foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: (){Navigator.pushNamed(context, '/Login');},
                child: const Text(
                    'Login',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                fixedSize: MaterialStateProperty.all<Size>(const Size(300.0, 150.0)),
                //foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: (){Navigator.pushNamed(context, '/Register');},
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }//Build function
}//Class
