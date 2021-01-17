import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newserverdemo/screens/home_screen.dart';
import 'package:newserverdemo/services/server_demo_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

String atSign;

class LoginScreen extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TODO: Instantiate variables
  bool showSpinner = false;
  TextEditingController _loginTextFieldController = TextEditingController();
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260F41),

      body: CustomScrollView(
        // TODO: Assign boolean to inAsyncCall
        slivers: <Widget>[
        SliverAppBar(
        pinned: true,
        backgroundColor: Color(0xffFF8AE7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: new Image(
            image: new AssetImage("pink_health.png"),

          ),
          title: Text('Flow',
            style: TextStyle(fontFamily: 'Google'),),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.only(top: 12.0),
      sliver:SliverToBoxAdapter(
        child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person_pin, size: 70),
                        title: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        subtitle: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(hintText: '@bob🛠'),
                          //TODO: Assign to controller
                          controller: _loginTextFieldController,
                          onChanged: (value) {
                            atSign = value;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: FlatButton(
                          child: Text('Log In'),
                          color: Color(0xFF260F81),
                          textColor: Colors.white,
                          // TODO: Assign function to onPressed
                          onPressed: _login,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }

  // TODO: Write _login method
  /// Use onboard() to authenticate via PKAM public/private keys.
  _login() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });

    String jsonData = _serverDemoService.encryptKeyPairs(atSign);
    if (atSign != null) {
      _serverDemoService.onboard().then((value) {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      });
    }
  }
}
