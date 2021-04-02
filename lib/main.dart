import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_navigationbar_color_example/widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'System Navigation Bar';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'Color Bar',
                  onClicked: setColorBar,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Black Bar',
                  onClicked: setBlackBar,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'White Bar',
                  onClicked: setWhiteBar,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Hide Bar',
                  onClicked: hideBar,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Show Bar',
                  onClicked: showBar,
                ),
              ],
            ),
          ),
        ),
      );

  Future setColorBar() async {
    final style = SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Colors.orange,
      systemNavigationBarColor: Colors.orange,
      systemNavigationBarIconBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  Future setBlackBar() async {
    final style = SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  Future setWhiteBar() async {
    final style = SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  Future hideBar() async =>
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

  Future showBar() async {
    setBlackBar();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}
