import 'package:flutter/material.dart';

class ParcelInventory extends StatefulWidget {
  const ParcelInventory({super.key});
  @override
  State<ParcelInventory> createState() => _ParcelInventoryState();
}

class _ParcelInventoryState extends State<ParcelInventory> {
  @override
  Widget build(BuildContext context) {
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
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            Text("Filter"),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  left: 5,
                                                ),
                                                child: Icon(
                                                  Icons.sort_rounded,
                                                  size: 15,
                                                ))
                                          ],
                                        )),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      child: SizedBox(
                                        width: 500,
                                        child: SearchBarApp(),
                                      ))
                                ],
                              ),
                            )),
                          )),
                    ],
                  )
                ],
              )),
          const Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 25,
                    right: 25,
                    bottom: 20,
                  ),
                  child: Card(
                      elevation: 2,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          child: SizedBox(
                            width: 500,
                            child: Text("Parcel Data"),
                          )))))
        ],
      ),
    );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});
  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          elevation: const MaterialStatePropertyAll(0),
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            Tooltip(
              message: 'Clear search',
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close_rounded),
                selectedIcon: const Icon(Icons.close_rounded),
              ),
            )
          ],
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
