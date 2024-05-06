import 'package:flutter/material.dart';
import 'package:postalhub_cms/pages/checkout/checkout.dart';
import 'package:postalhub_cms/pages/home/home.dart';
import 'package:postalhub_cms/pages/hub_management/hub_management.dart';
import 'package:postalhub_cms/pages/parcel%20inventory/parcel_inventory.dart';
import 'package:postalhub_cms/pages/profile_and_settings/profile_and_settings.dart';
import 'package:animations/animations.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key});
  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedIndex = 0;
  final List<Widget> _windgetOption = <Widget>[
    const Home(),
    const ParcelInventory(),
    const HubManagement(),
    const ProfileAndSetting(),
    const CheckOut(),
  ];
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Row(children: [
            Image.asset(
              'assets/images/postalhub_logo.jpg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const Text('  Postal Hub CMS'),
          ]),
          leading: width > 680
              ? IconButton(
                  icon: Icon(
                    Icons.menu_rounded,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  onPressed: null,
                )
              : null,
        ),
        drawer: NavigationDrawer(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.background,
          shadowColor: Theme.of(context).colorScheme.background,
          onDestinationSelected: (i) => setState(() => _selectedIndex = i),
          selectedIndex: _selectedIndex,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const NavigationDrawerDestination(
              label: Text("Home"),
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
            ),
            const NavigationDrawerDestination(
              label: Text("Parcel Inventory"),
              icon: Icon(Icons.inventory_2_outlined),
              selectedIcon: Icon(Icons.inventory_2_rounded),
            ),
            const NavigationDrawerDestination(
              label: Text("Hub Management"),
              icon: Icon(Icons.dns_outlined),
              selectedIcon: Icon(Icons.dns_rounded),
            ),
            const NavigationDrawerDestination(
              label: Text("Profile & Settings"),
              icon: Icon(Icons.manage_accounts_outlined),
              selectedIcon: Icon(Icons.manage_accounts_rounded),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),
            const NavigationDrawerDestination(
              label: Text("Checkout Parcel"),
              icon: Icon(Icons.output_outlined),
              selectedIcon: Icon(Icons.output_rounded),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),
          ],
        ),
        body: Row(
          mainAxisAlignment:
              width > 680 ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            width > 680
                ? SizedBox(
                    width: 200,
                    child: NavigationDrawer(
                      surfaceTintColor:
                          Theme.of(context).colorScheme.background,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      shadowColor: Theme.of(context).colorScheme.background,
                      onDestinationSelected: (i) =>
                          setState(() => _selectedIndex = i),
                      selectedIndex: _selectedIndex,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(28, 0, 16, 10),
                          child: Text(
                            ' ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const NavigationDrawerDestination(
                          label: Text("Home"),
                          icon: Icon(Icons.home_outlined),
                          selectedIcon: Icon(Icons.home_rounded),
                        ),
                        const NavigationDrawerDestination(
                          label: Text("Parcel Inventory"),
                          icon: Icon(Icons.inventory_2_outlined),
                          selectedIcon: Icon(Icons.inventory_2_rounded),
                        ),
                        const NavigationDrawerDestination(
                          label: Text("Hub Management"),
                          icon: Icon(Icons.dns_outlined),
                          selectedIcon: Icon(Icons.dns_rounded),
                        ),
                        const NavigationDrawerDestination(
                          label: Text("Profile & Settings"),
                          icon: Icon(Icons.manage_accounts_outlined),
                          selectedIcon: Icon(Icons.manage_accounts_rounded),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
                          child: Divider(),
                        ),
                        const NavigationDrawerDestination(
                          label: Text("Checkout Parcel"),
                          icon: Icon(Icons.output_outlined),
                          selectedIcon: Icon(Icons.output_rounded),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
                          child: Divider(),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      border:
                          Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: SizedBox(
                    height: width > 680 ? height - 100 : height - 20,
                    width: width > 680 ? width - 225 : width - 10,
                    child: PageTransitionSwitcher(
                      transitionBuilder:
                          (child, animation, secondaryAnimation) =>
                              SharedAxisTransition(
                        fillColor: const Color.fromARGB(0, 0, 0, 0),
                        transitionType: SharedAxisTransitionType.vertical,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      ),
                      child: _windgetOption.elementAt(_selectedIndex),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class NavigationDrawerElement extends StatefulWidget {
  const NavigationDrawerElement({super.key});
  @override
  State<NavigationDrawerElement> createState() =>
      _NavigationDrawerElementState();
}

class _NavigationDrawerElementState extends State<NavigationDrawerElement> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedIndex = 0;
  // ignore: unused_field
  final List<Widget> _windgetOption = <Widget>[
    const Home(),
    const ParcelInventory(),
    const HubManagement(),
    const ProfileAndSetting(),
  ];
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.background,
      onDestinationSelected: (i) => setState(() => _selectedIndex = i),
      selectedIndex: _selectedIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 10),
          child: Text(
            ' ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          label: Text("Home"),
          icon: Icon(Icons.hub_outlined),
          selectedIcon: Icon(Icons.hub_rounded),
        ),
        const NavigationDrawerDestination(
          label: Text("Parcel Inventory"),
          icon: Icon(Icons.info_outline_rounded),
          selectedIcon: Icon(Icons.info_rounded),
        ),
        const NavigationDrawerDestination(
          label: Text("Hub Management"),
          icon: Icon(Icons.info_outline_rounded),
          selectedIcon: Icon(Icons.info_rounded),
        ),
        const NavigationDrawerDestination(
          label: Text("Profile & Settings"),
          icon: Icon(Icons.info_outline_rounded),
          selectedIcon: Icon(Icons.info_rounded),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        SizedBox.fromSize(
          size: const Size(10, 55),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: Material(
              color: const Color.fromARGB(0, 255, 193, 7),
              child: InkWell(
                onTap: () => showLicensePage(
                  context: context,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Licenses",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
