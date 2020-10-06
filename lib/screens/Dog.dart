import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, title TEXT, tache1 TEXT, tache2 TEXT, tache3 TEXT, tache4 TEXT, tache5 TEXT, tache6 TEXT, tache7 TEXT, tache8 TEXT, tache9 TEXT, tache10 TEXT, tache11 TEXT, tache12 TEXT, "
            "tache13 TEXT, tache14 TEXT, tache15 TEXT, tache16 TEXT,tache17 TEXT,tache18 TEXT,tache19 TEXT,tache20 TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        title: maps[i]['title'],
        tache1: maps[i]['tache1'],
        tache2: maps[i]['tache2'],
        tache3: maps[i]['tache3'],
        tache4: maps[i]['tache4'],
        tache5: maps[i]['tache5'],
        tache6: maps[i]['tache6'],
        tache7: maps[i]['tache7'],
        tache8: maps[i]['tache8'],
        tache9: maps[i]['tache9'],
        tache10: maps[i]['tache10'],
        tache11: maps[i]['tache11'],
        tache12: maps[i]['tache12'],
        tache13: maps[i]['tache13'],
        tache14: maps[i]['tache14'],
        tache15: maps[i]['tache15'],
        tache16: maps[i]['tache16'],
        tache17: maps[i]['tache17'],
        tache18: maps[i]['tache18'],
        tache19: maps[i]['tache19'],
        tache20: maps[i]['tache20'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }


  // Insert a dog into the database.

  // Print the list of dogs (only Fido for now).
  print(await dogs());


  // Print Fido's updated information.
  print(await dogs());

  // Delete Fido from the database.

  // Print the list of dogs (empty).
  print(await dogs());
}

class Dog {
  final int id;
  final String title;
  final String tache1;
  final String tache2;
  final String tache3;
  final String tache4;
  final String tache5;
  final String tache6;
  final String tache7;
  final String tache8;
  final String tache9;
  final String tache10;
  final String tache11;
  final String tache12;
  final String tache13;
  final String tache14;
  final String tache15;
  final String tache16;
  final String tache17;
  final String tache18;
  final String tache19;
  final String tache20;


  Dog({this.id, this.title, this.tache1, this.tache2, this.tache3, this.tache4,
      this.tache5, this.tache6, this.tache7, this.tache8, this.tache9,
      this.tache10, this.tache11, this.tache12, this.tache13, this.tache14,
      this.tache15, this.tache16, this.tache17, this.tache18, this.tache19,
      this.tache20,});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title': title,
      'tache1': tache1,
      'tache2': tache2,
      'tache3': tache3,
      'tache4': tache4,
      'tache5': tache5,
      'tache6': tache6,
      'tache7': tache7,
      'tache8': tache8,
      'tache9': tache9,
      'tache10': tache10,
      'tache11': tache11,
      'tache12': tache12,
      'tache13': tache13,
      'tache14': tache14,
      'tache15': tache15,
      'tache16': tache16,
      'tache17': tache17,
      'tache18': tache18,
      'tache19': tache19,
      'tache20': tache20,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, title: $title, tache1: $tache1, tache2: $tache2, tache3: $tache3, tache4: $tache4, tache5: $tache5, tache6: $tache6, tache7: $tache7, tache8: $tache8, tache9: $tache9, tache10: $tache10, tache11: $tache11, tache12: $tache12, tache13: $tache13, tache14: $tache14, tache15: $tache15, tache16: $tache16, tache17: $tache17, tache18: $tache18, tache19: $tache19, tache20: $tache20}';
  }

// Implement toString to make it easier to see information about
  // each dog when using the print statement.

}
