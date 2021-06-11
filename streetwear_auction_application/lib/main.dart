
import 'package:flutter/material.dart';
import 'app/dependencies.dart' as di;
import 'app/router.dart';

Future<void> main() async {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'san serif',
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 12),
              bodyText2: TextStyle(fontSize: 12)),
          primaryColor: Color.fromRGBO(117, 168, 255, 1),
          primarySwatch: Colors.lightBlue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        onGenerateRoute: createRoute,
      ),
    );
  }
}
