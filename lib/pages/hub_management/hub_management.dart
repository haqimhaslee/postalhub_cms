import 'package:flutter/material.dart';

class HubManagement extends StatefulWidget {
  const HubManagement({super.key});
  @override
  State<HubManagement> createState() => _HubManagementState();
}

class _HubManagementState extends State<HubManagement> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                top: 0,
                left: 25,
                right: 25,
                bottom: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 0,
                            right: 0,
                            bottom: 20,
                          ),
                          child: Card(
                            elevation: 2,
                            child: SizedBox(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      child: SizedBox(
                                        width: width > 680 ? 300 : 300,
                                        child: const SegmentedButtonExample(),
                                      ))
                                ],
                              ),
                            )),
                          )),
                    ],
                  )
                ],
              )),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 25,
                    right: 25,
                    bottom: 20,
                  ),
                  child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: SizedBox(
                          height: width > 680 ? height - 100 : height - 20,
                          width: width > 680 ? width - 225 : width - 10,
                          child: ListView(
                            children: const [],
                          ),
                        ),
                      ))))
        ],
      ),
    );
  }
}

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

enum ManagementView { all, cms, user }

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  ManagementView managementviewstate = ManagementView.all;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ManagementView>(
      segments: const <ButtonSegment<ManagementView>>[
        ButtonSegment<ManagementView>(
          value: ManagementView.all,
          label: Text('All'),
          //icon: Icon(Icons.calendar_view_day)
        ),
        ButtonSegment<ManagementView>(
          value: ManagementView.cms,
          label: Text('CMS'),
          // icon: Icon(Icons.calendar_view_week)
        ),
        ButtonSegment<ManagementView>(
          value: ManagementView.user,
          label: Text('User'),
          //icon: Icon(Icons.calendar_view_month)
        ),
      ],
      selected: <ManagementView>{managementviewstate},
      onSelectionChanged: (Set<ManagementView> newSelection) {
        setState(() {
          managementviewstate = newSelection.first;
        });
      },
    );
  }
}
