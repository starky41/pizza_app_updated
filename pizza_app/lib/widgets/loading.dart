import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100.0,
              width: 100.0,
              child: const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Загрузка',
              style: TextStyle(fontSize: 20.0),
            ),
          ]),
    );
  }
}
