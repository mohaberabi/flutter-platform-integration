import 'package:flutter/src/services/binary_messenger.dart';
import 'package:flutter_channels/names_example.g.dart';

class PlatformNamesExample {
  final NamesStorage storage;

  const PlatformNamesExample(this.storage);

  Future<void> addName(String id, String name) async =>
      await storage.saveName(id, name);

  Future<String?> getName(String id) async => await storage.getName(id);

  Future<List<String>> getNames() async => await storage.getNames();
}
