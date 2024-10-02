import 'package:post_app/models/event_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}/events.db';
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events (
        id TEXT PRIMARY KEY,
        title TEXT,
        description TEXT,
        userId TEXT,
        firstName TEXT,
        lastName TEXT,
        isVerified INTEGER,
        eventStartAt TEXT,
        eventEndAt TEXT,
        likes INTEGER,
        image TEXT
      )
    ''');
  }

  Future<List<Event>> getEvents() async {
    Database db = await instance.database;
    var events = await db.query('events');
    return events.isNotEmpty
        ? events.map((e) => Event.fromJson(e)).toList()
        : [];
  }

  Future<int> insertEvent(Event event) async {
    Database db = await instance.database;
    return await db.insert('events', event.toMap());
  }
}
