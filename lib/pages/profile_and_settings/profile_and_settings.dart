import 'package:flutter/material.dart';

class ProfileAndSetting extends StatefulWidget {
  const ProfileAndSetting({super.key});
  @override
  State<ProfileAndSetting> createState() => _ProfileAndSettingState();
}

class _ProfileAndSettingState extends State<ProfileAndSetting> {
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

enum ProfileAndSettings {
  profile,
  system,
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  ProfileAndSettings managementviewstate = ProfileAndSettings.profile;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ProfileAndSettings>(
      segments: const <ButtonSegment<ProfileAndSettings>>[
        ButtonSegment<ProfileAndSettings>(
          value: ProfileAndSettings.profile,
          label: Text('Profile'),
          //icon: Icon(Icons.calendar_view_day)
        ),
        ButtonSegment<ProfileAndSettings>(
          value: ProfileAndSettings.system,
          label: Text('System'),
          // icon: Icon(Icons.calendar_view_week)
        ),
      ],
      selected: <ProfileAndSettings>{managementviewstate},
      onSelectionChanged: (Set<ProfileAndSettings> newSelection) {
        setState(() {
          managementviewstate = newSelection.first;
        });
      },
    );
  }
}
