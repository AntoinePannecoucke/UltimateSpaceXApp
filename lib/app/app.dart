import 'package:flutter/material.dart';
import 'package:ultimate_space_x_app/model/launch.dart';
import 'package:ultimate_space_x_app/view/company.dart';
import '../../view/home.dart';
import '../view/launch_details.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot Discovery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch (settings.name) {
          case CompanyPage.route:
            return MaterialPageRoute(builder: (_) => CompanyPage());
          case LaunchDetailsPage.route:
            if (arguments != null && arguments is LaunchDetailsArguments){
              return MaterialPageRoute(builder: (_) => LaunchDetailsPage(arguments.launch));
            }
            else {
              throw Exception("This route need one or more arguments, see ${(LaunchDetailsPage).toString()}");
            }

          default:
            return unknownRoute();
        }
      },
      home: const HomePage(),
    );
  }

  MaterialPageRoute unknownRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Unknown route")),
        ));
  }
}
