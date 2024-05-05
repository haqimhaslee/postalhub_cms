import 'package:flutter/material.dart';

class HubManagement extends StatefulWidget {
  const HubManagement({super.key});
  @override
  State<HubManagement> createState() => _HubManagementState();
}

class _HubManagementState extends State<HubManagement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      child: Column(
        children: [
          DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('TabBar Sample'),
                  bottom: const TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.cloud_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.beach_access_sharp),
                      ),
                      Tab(
                        icon: Icon(Icons.brightness_5_sharp),
                      ),
                    ],
                  ),
                ),
                body: const Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: Text("It's cloudy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's sunny here"),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
