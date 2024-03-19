import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/WeatherController.dart';
import 'WeatherController.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Flutter Weather App'),
        ),
        body: Center(
          child: WeatherController.isLoading?SpinKitWave(
            color: Colors.amber,size: 100,
          ):Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: TextFormField(
                                    initialValue:WeatherController.cityName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    onChanged:WeatherController.updateCity,
                                    decoration: InputDecoration(
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: "Enter city name",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  width: 200,
                                ),
                                GestureDetector(
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      WeatherController.loadWeather();
                                    });

                                  },
                                )
                              ],
                            ),
                          ),
                          Text(
                            WeatherController. weatherData!=null?WeatherController.weatherData.name:"new york",
                            style: new TextStyle(color: Colors.white),
                          ),
                          Text(
                            WeatherController.weatherData!=null?WeatherController.weatherData.weather[0].main:'Rain',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 32.0),
                          ),
                          Text(
                            WeatherController.weatherData!=null? (WeatherController.weatherData.main.temp-273).toString():'72°F',
                            style: new TextStyle(color: Colors.white),
                          ),
                          // Image.network(
                              // 'https://openweathermap.org/img/w/01d.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}