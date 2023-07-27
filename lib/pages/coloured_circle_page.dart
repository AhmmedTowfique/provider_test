import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/coloured_circle_page_provider.dart';

class ColouredCirclePage extends StatelessWidget {
  const ColouredCirclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider test'),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<ColouredCirclePageProvider>(
          create: (context) => ColouredCirclePageProvider(),
          child: Consumer<ColouredCirclePageProvider>(
            builder: (context, provider, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: provider.color,
                    ),
                    ElevatedButton(
                      onPressed: () => provider.changeColorRandomly(),
                      child: Text('Change Color'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
