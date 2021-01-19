import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:googleapis/storage/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:io' as Io;
import 'package:path/path.dart';
import 'package:grpc/grpc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:http/http.dart' as http;
import 'package:newserverdemo/screens/health_data.dart';
import 'package:newserverdemo/screens/pie_chart.dart';
import 'dart:io';
import 'dart:math' as math;

const _SCOPES = const [StorageApi.DevstorageReadOnlyScope];

void main() {
  clientViaServiceAccount(_credentials, _SCOPES).then((http_client) {
    var storage = new StorageApi(http_client);
    storage.buckets.list('dart-on-cloud').then((buckets) {
      print("Received ${buckets.items.length} bucket names:");
      for (var file in buckets.items) {
        print(file.name);
      }
    });
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flow',
      theme: ThemeData(
          fontFamily: 'Google',
      ),
      home: HomeScreen(),
      // home: MyPainter()
    );
  }
}class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static final String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var _sides = 3.0;

  Animation<double> animation;
  AnimationController controller;

  Animation<double> animation2;
  AnimationController controller2;

  Animation<double> animation3;
  AnimationController controller3;

  Animation<double> animation4;
  AnimationController controller4;

  Animation<double> animation5;
  AnimationController controller5;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller4 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller5 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Tween<double> _lengthTween1 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween2 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween3 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween4 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween5 = Tween(begin: 0.0, end: 10);

    animation = _lengthTween1.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller.forward();
        }
      });

    animation2 = _lengthTween2.animate(controller2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller2.forward();
        }
      });

    animation3 = _lengthTween3.animate(controller3)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller4.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller3.forward();
        }
      });
    animation4 = _lengthTween4.animate(controller4)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller5.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller3.forward();
        }
      });
    animation5 = _lengthTween5.animate(controller5)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
        } else if (status == AnimationStatus.dismissed) {
          // controller3.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF260F41),
        body: CustomScrollView(
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
                child: Container(
                  width: width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('',
                      style: TextStyle(fontFamily: 'Google',
                          color: Color(0xffffffff),
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Move Minutes',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(53, 0.6, animation.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Steps',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(0.9, animation.value, animation3.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Energy Burned',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(1.4, animation.value, animation4.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Sleep',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(0.8, animation.value, animation5.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: PieChartSample()
            )
          ],
        ));
  }
}class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}class _MediaGridState extends State<MediaGrid> {
  List _mediaList = [];
  int currentPage = 0;
  int lastPage;

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }
  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success//load the album list
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList();
      List<AssetEntity> media = await albums[0].getAssetListPaged(currentPage, 60);
      List<String> imgs = [];
      List thumbBytes = [];
      var count = 0;
      // var key = "";
      // Process.run('gcloud', ['auth', 'application-default', 'print-access-token']).then((ProcessResult results) {
      //   key = results.stdout;
      // });
      // print(key);
      for (var asset in media) {
        String base64 = base64Encode(new List.from(await asset.thumbData));
        thumbBytes.add(await asset.thumbData);
        imgs.add(base64);

        var url = 'https://vision.googleapis.com/v1/images:annotate';
        var response = await http.post(url,
            headers: {
              "Authorization": "Bearer AUTH_CODE_HERE", "Content-Type": "application/json; charset=utf-8"
            },
            body: json.encode({"requests": [
              {
                "image": {
                  "content": base64
                },
                "features": [
                  {
                    "maxResults": 10,
                    "type": "FACE_DETECTION"
                  }
                ]
              }
            ]}));
        // list [% joy, % anger, % sorrow, % surprise]
        // print(response.body);
        if (json.decode(response.body).containsKey("responses") &&
            json.decode(response.body)["responses"].length > 0) {
          try {
            List out = [];
            // print(json.decode(response.body)["responses"][0]["faceAnnotations"][0]);
            out.add(json.decode(response
                .body)["responses"][0]["faceAnnotations"][0]["joyLikelihood"]);
            out.add(json.decode(response
                .body)["responses"][0]["faceAnnotations"][0]["angerLikelihood"]);
            out.add(json.decode(response
                .body)["responses"][0]["faceAnnotations"][0]["sorrowLikelihood"]);
            out.add(json.decode(response
                .body)["responses"][0]["faceAnnotations"][0]["surpriseLikelihood"]);
            var sum = 0.0;
            for (var i = 0; i < 4; i++) {
              // print(out[i]);
              if (out[i] == "VERY_UNLIKELY")
                out[i] = 0;
              else if (out[i] == "UNLIKELY")
                out[i] = 33;
              else if (out[i] == "POSSIBLE")
                out[i] = 50;
              else if (out[i] == "LIKELY")
                out[i] = 67;
              else if (out[i] == "VERY_LIKELY")
                out[i] = 100;
              else
                out[i] = 0;
              sum += out[i];
            }
            print(out);
            if (sum != 0) {
              for (var i = 0; i < 4; i++) {
                out[i] *= 100.0 / sum;
              }
              _mediaList.add(out);
              count++;
              if (count == 5) break;
            }
          } catch(e) {
            continue;
        }
        print(_mediaList);
      }
    }
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }@override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return;
      },
      child: GridView.builder(
          itemCount: _mediaList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return _mediaList[index];
          }),
    );
  }
}
class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> with TickerProviderStateMixin {
  var _sides = 3.0;

  Animation<double> animation;
  AnimationController controller;

  Animation<double> animation2;
  AnimationController controller2;

  Animation<double> animation3;
  AnimationController controller3;

  Animation<double> animation4;
  AnimationController controller4;

  Animation<double> animation5;
  AnimationController controller5;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller4 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    controller5 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Tween<double> _lengthTween1 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween2 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween3 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween4 = Tween(begin: 0.0, end: 10);
    Tween<double> _lengthTween5 = Tween(begin: 0.0, end: 10);

    animation = _lengthTween1.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller.forward();
        }
      });

    animation2 = _lengthTween2.animate(controller2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller2.forward();
        }
      });

    animation3 = _lengthTween3.animate(controller3)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller4.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller3.forward();
        }
      });
    animation4 = _lengthTween4.animate(controller4)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller5.forward();
        } else if (status == AnimationStatus.dismissed) {
          // controller3.forward();
        }
      });
    animation5 = _lengthTween5.animate(controller5)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
        } else if (status == AnimationStatus.dismissed) {
          // controller3.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF260F41),
        body: CustomScrollView(
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
                child: Container(
                  width: width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('',
                      style: TextStyle(fontFamily: 'Google',
                          color: Color(0xffffffff),
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Move Minutes',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(53, 0.6, animation.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Steps',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(0.9, animation.value, animation3.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Energy Burned',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(1.4, animation.value, animation4.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Sleep',
                  style: TextStyle(fontFamily: 'Google',
                      color: Color(0xffffffff),
                      fontSize: 24),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: 100,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: ShapePainter(0.8, animation.value, animation5.value),
                      size: Size(width, 100),
                    );
                  },
                ),
              ),
            ),

          ],
        ));
  }
}

// FOR PAINTING POLYGONS
class ShapePainter extends CustomPainter {
  final double amount;
  final double length;
  final double length2;

  ShapePainter(this.amount, this.length, this.length2);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFF3C235D)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    var paint2 = Paint()
      ..color = Color(0xFFE1B7FB)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    var prop = math.sin(this.length / 10 * math.pi / 2);
    var prop2 = math.sin(this.length2 / 10 * math.pi / 2);

    canvas.drawRect(
        new Rect.fromLTWH(center.dx - size.width / 2 + 20,
            center.dy - size.height / 2 + 10, prop * (size.width - 40), 40),
        paint);
    canvas.drawRect(
        new Rect.fromLTWH(center.dx - size.width / 2 + 20,
            center.dy - size.height / 2 + 10, prop2 * (size.width - 40) * (this.amount > 1 ? 1 : this.amount), 40),
        paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
