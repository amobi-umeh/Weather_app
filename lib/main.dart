import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataservice = DataService();
  final _cityTextController = TextEditingController();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_response != null)
                      Column(
                        children: [
                          Image.network('${_response?.iconUrl}'),
                          Text(
                            '${_response?.tempinfo.temperature}º',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text('${_response?.weatherInfo.description}'),
                        ],
                      ),
                    TextField(
                      controller: _cityTextController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'City',
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _search,
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataservice.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
