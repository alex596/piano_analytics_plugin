import 'package:flutter/material.dart';
import 'package:piano_analytics_plugin/piano_analytics_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pianoAnalyticsPlugin = PianoAnalyticsPlugin();

  final String domaine = "YOUR_DOMAIN";
  final int site = 123456;

  final String eventName = "click.action";
  final Map<String, String> fakeData = {
    "click": "Click event",
    "status": "connected",
    "others_data": "N/A",
  };

  @override
  void initState() {
    super.initState();
    pianoAnalyticsPlugin.setConfiguration(collectDomain: domaine, site: site, privacyDefaultMode: 'exempt');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Piano Analytics'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Configuration : domaine: $domaine, site: $site",
              ),
              const Divider(),
              Text(
                "Event Name : $eventName",
              ),
              const SizedBox(height: 8,),
              Text(
                "Data : ${fakeData.toString()}",
              ),
              const SizedBox(height: 12,),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      color: Colors.lightBlueAccent,
                      child: const Text("Track event", style: TextStyle(color: Colors.white)),
                      onPressed: (){
                        pianoAnalyticsPlugin.sendEvent(eventName: eventName, data:fakeData)
                            .onError((error, stackTrace) => debugPrint(error.toString()));
                      }
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
