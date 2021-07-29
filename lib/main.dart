import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/number_provider.dart';

void main() {
  runApp(MyApp());
}

// 1. Create UI
// 2. Create number_provider.dart
// 3. Add Consumer and ChangeNotifierProvider in MyApp
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<NumberProvider>(
        create: (context) => NumberProvider(),
        child: Scaffold(
            appBar: AppBar(
              // Consumer maksudnya untuk menandakan bahwa widget iniliah yang statenya akan berubah
              title: Consumer<NumberProvider>(
                  builder: (context, numberProvider, _) =>
                      Text(numberProvider.number.toString())),
            ),
            body: Center(
              // Consumer maksudnya untuk menandakan bahwa widget iniliah yang statenya akan berubah
              child: Consumer<NumberProvider>(
                builder: (context, numberProvider, _) => Text(
                  numberProvider.number.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            // Cara Pertama :
            // Consumer maksudnya untuk menandakan bahwa widget iniliah yang statenya akan berubah
            floatingActionButton: Consumer<NumberProvider>(
              builder: (context, numberProvider, _) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  numberProvider.number++;
                },
              ),
            )),
      ),
    );
  }
}

// Cara Kedua :
// class FloatingButton extends StatelessWidget {
//   const FloatingButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       child: Icon(Icons.add),
//       onPressed: () {
//         Provider.of<NumberProvider>(context, listen: false).number++;
//       },
//     );
//   }
// }
