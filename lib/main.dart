import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/ui/router.dart';
import 'package:provider_arc/utils/provider_setup.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...providers,
      ],
      child: MaterialApp(
        title: 'Flutter State management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
