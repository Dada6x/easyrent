import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/main.dart';
import 'package:flutter/material.dart';
import 'package:snappable_thanos/snappable_thanos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//! EXPERMENTING THE SNAPPable pkg
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<SnappableState> _snappableKey = GlobalKey<SnappableState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snap'),
      ),
      body: Column(
        children: <Widget>[
          Snappable(
              key: _snappableKey,
              snapOnTap: false,
              onSnapped: () => print("Snapped!"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: green,
                  subtitle: Text("DWAdwadawdawdasdwad"),
                  leading: Icon(Icons.favorite),
                  title: Text("data "),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ),
              )),
          ElevatedButton(
            child: const Text('Snap / Reverse'),
            onPressed: () {
              SnappableState state = _snappableKey.currentState!;
              if (state.isInProgress) {
                // do nothing
                debug.w("Animation is in progress, please wait!");
              } else if (state.isGone) {
                state.reset();
              } else {
                state.snap();
              }
            },
          )
        ],
      ),
    );
  }
}
