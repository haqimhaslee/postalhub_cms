import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      child: ListView(
        children: const [
          Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: 25,
                right: 25,
                bottom: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 5,
                      right: 5,
                      bottom: 20,
                    ),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
