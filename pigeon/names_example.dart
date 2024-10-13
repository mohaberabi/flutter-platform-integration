import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
    dartOut: "lib/names_example.g.dart",
    kotlinOut:
        'android/app/src/main/kotlin/com/mohaberabi/flutterchannels/flutter_channels/NamesExample.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.mohaberabi.flutterchannels'),
    swiftOut: 'ios/Runner/NamesExample.g.swift',
    dartPackageName: "flutter_channels"))
@HostApi()
abstract class NamesStorage {
  List<String> getNames();

  String? getName(String id);

  void saveName(String id, String name);
}

//flutter pub run pigeon --input /Users/mohaberabi/Downloads/flutter_channels/pigeon/names_example.dart
