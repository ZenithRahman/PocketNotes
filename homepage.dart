import 'package:flutter/material.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:pocket_notes/differenciation_formulas.dart';
import 'package:pocket_notes/differenciation_notes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pocket_notes/experiment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Future.delayed(Duration(seconds: 2), () {
                EasyLoading.dismiss();
                Navigator.pop(context);
              });
            },
          ),
          title: const Text("Pocket Helper"),
          centerTitle: true,
          bottom: const TabBar(indicatorColor: Colors.amber, tabs: [
            Tab(
              text: "Formula",
            ),
            Tab(
              text: "Notes",
            ),
          ]),
        ),
        body: const TabBarView(children: [
          TeXViewDocumentExamples(),
          differenciation_notes(),
        ]),
      ),
    );
  }
}
