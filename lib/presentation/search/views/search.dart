import 'package:easyrent/presentation/search/widgets/searcappbar.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppbar(),
    );
  }
}
