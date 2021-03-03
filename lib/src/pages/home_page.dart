import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sist_prog_app/src/models/valores_model.dart';
import 'package:sist_prog_app/src/providers/valores_provider.dart';
import 'package:sist_prog_app/src/utility/responsive.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;
  var valor;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(Duration(milliseconds: 1500), (Timer t) => getValues());
  }

  void getValues() {
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    var titleSensor = TextStyle(
      fontWeight: FontWeight.bold,
    );
    var subtitleSensor = TextStyle(color: Colors.grey);
    var subtitleSensorAlert = TextStyle(color: Colors.redAccent);
    return DefaultTabController(
      length: 1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Lab Monitor",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(133, 122, 253, 1),
              labelColor: Colors.black,
              tabs: [
                Tab(text: "Lab. Química"),
              ],
            ),
          ),
          body: FutureBuilder(
            future: getValores(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var temperatura = double.parse(snapshot.data.temperatura);
                var gas = double.parse(snapshot.data.gas);
                var alcohol = double.parse(snapshot.data.alcohol);
                var presencia = int.parse(snapshot.data.presencia);
                return Center(
                  child: GridView.count(
                    padding: EdgeInsets.all(15.0),
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    crossAxisCount: 2,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5.0,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: responsive.height * .03,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: responsive.width * .045,
                                ),
                                Icon(
                                  FontAwesomeIcons.thermometerHalf,
                                  size: responsive.ip * .03,
                                ),
                                SizedBox(
                                  width: responsive.width * .2,
                                ),
                                Icon(
                                  Icons.warning,
                                  color: temperatura > 25
                                      ? Colors.red
                                      : Colors.white,
                                  size: responsive.ip * .03,
                                )
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .045,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                Text(
                                  "TEMPERATURA",
                                  style: titleSensor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .015,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                temperatura > 25
                                    ? Text(
                                        "${snapshot.data.temperatura} ºC",
                                        style: subtitleSensorAlert,
                                      )
                                    : Text(
                                        "${snapshot.data.temperatura} ºC",
                                        style: subtitleSensor,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: responsive.height * .03,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .045,
                                ),
                                Icon(
                                  FontAwesomeIcons.water,
                                  size: responsive.ip * .03,
                                ),
                                SizedBox(
                                  width: responsive.width * .2,
                                ),
                                Icon(
                                  Icons.warning,
                                  color: snapshot.data.agua == "0"
                                      ? Colors.red
                                      : Colors.white,
                                  size: responsive.ip * .03,
                                )
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .045,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                Text(
                                  "FUGA DE AGUA",
                                  style: titleSensor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .015,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                snapshot.data.agua == "1"
                                    ? Text(
                                        "Negativa",
                                        style: subtitleSensor,
                                      )
                                    : Text(
                                        "Detectada",
                                        style: subtitleSensorAlert,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: responsive.height * .03,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .045,
                                ),
                                Icon(
                                  FontAwesomeIcons.wind,
                                  size: responsive.ip * .03,
                                ),
                                SizedBox(
                                  width: responsive.width * .2,
                                ),
                                Icon(
                                  Icons.warning,
                                  color: gas > 10 ? Colors.red : Colors.white,
                                  size: responsive.ip * .03,
                                )
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .045,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                Text(
                                  "FUGA DE GAS",
                                  style: titleSensor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .015,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                gas > 10
                                    ? Text(
                                        "${snapshot.data.gas} ppm",
                                        style: subtitleSensorAlert,
                                      )
                                    : Text(
                                        "Negativa",
                                        style: subtitleSensor,
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5.0,
                          child: Column(
                            children: [
                              SizedBox(
                                height: responsive.height * .03,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: responsive.width * .045,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.tint,
                                    size: responsive.ip * .03,
                                  ),
                                  SizedBox(
                                    width: responsive.width * .2,
                                  ),
                                  Icon(
                                    Icons.warning,
                                    color: alcohol > 12
                                        ? Colors.red
                                        : Colors.white,
                                    size: responsive.ip * .03,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: responsive.height * .045,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: responsive.width * .05,
                                  ),
                                  Text(
                                    "DERRAME DE ALCOHOL",
                                    style: titleSensor,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: responsive.height * .015,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: responsive.width * .05,
                                  ),
                                  alcohol > 12
                                      ? Text(
                                          "${snapshot.data.alcohol} ppm",
                                          style: subtitleSensorAlert,
                                        )
                                      : Text(
                                          "Negativo",
                                          style: subtitleSensor,
                                        )
                                ],
                              ),
                            ],
                          )),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: responsive.height * .03,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .045,
                                ),
                                Icon(
                                  FontAwesomeIcons.walking,
                                  size: responsive.ip * .03,
                                ),
                                SizedBox(
                                  width: responsive.width * .2,
                                ),
                                Icon(
                                  Icons.warning,
                                  color:
                                      presencia < 8 ? Colors.red : Colors.white,
                                  size: responsive.ip * .03,
                                )
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .045,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                Text(
                                  "INTRUSO",
                                  style: titleSensor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.height * .015,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: responsive.width * .05,
                                ),
                                presencia < 8
                                    ? Text("Detectado",
                                        style: subtitleSensorAlert)
                                    : Text("No detectado",
                                        style: subtitleSensor)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: [Text("Cargando...")],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<ValoresModel> getValores() async {
    final resp = await http.get('http://192.168.1.202:3000/valores/get');
    return valoresModelFromJson(resp.body);
  }
}
