import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../generated/l10n.dart';  // Localization


class DatabaseHelper {
  static const _dbName = 'app.db';
  static const _dbVersion = 1;

  // App settings table
  static const _tableAppSettings = 'appSettings';
  static const columnId = '_id';
  static const columnServerURL = 'serverName';
  static const columnServerFingerprint = 'serverFingerprint'; // not used yet
  static const columnServerCertificate = 'serverCertificate'; // not used yet
  static const columnFirstRun = 'firstRun';
  static const columnLastRun = 'lastRun';
  static const columnLastSync = 'lastSync';
  static const columnNotifications = 'notifications';
  static const columnSyncInterval = 'syncInterval';
  static const columnSyncOnMobileData = 'syncOnMobileData';
  static const columnSyncOnWifi = 'syncOnWifi';
  static const columnPushNotifications = 'pushNotifications';
  static const columnPushServerURL = 'pushServerURL';
  static const columnPushServerFingerprint = 'pushServerFingerprint';
  static const columnPushServerCertificate = 'pushServerCertificate';
  static const columnTheme = 'theme';
  static const columnLanguage = 'language';
  static const loginUserid = 'loginUserid';
  static const loginDisplayName = 'loginDisplayName';
  static const loginDeviceUDID = 'loginDeviceUDID';
  static const columnAppVersion = 'appVersion';
  static const columnAppBuild = 'appBuild';
  static const columnAppBuildDate = 'appBuildDate';
  static const columnAppBuildIsDebug = 'appBuildIsDebug';


  // Making it a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database and create it if it doesn't exist.
  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableAppSettings (
            $columnId INTEGER PRIMARY KEY,
            $columnServerURL TEXT DEFAULT 'official',
            $columnServerFingerprint TEXT DEFAULT '',
            $columnServerCertificate TEXT DEFAULT '',
            $columnFirstRun INTEGER DEFAULT 0,
            $columnLastRun INTEGER DEFAULT 0,
            $columnLastSync INTEGER DEFAULT 0,
            $columnNotifications INTEGER DEFAULT 1,
            $columnSyncInterval INTEGER DEFAULT 60,
            $columnSyncOnMobileData INTEGER DEFAULT 1,
            $columnSyncOnWifi INTEGER DEFAULT 1,
            $columnPushNotifications INTEGER DEFAULT 1,
            $columnPushServerURL TEXT DEFAULT '',
            $columnPushServerFingerprint TEXT DEFAULT '',
            $columnPushServerCertificate TEXT DEFAULT '',
            $columnTheme TEXT DEFAULT 'system',
            $columnLanguage TEXT DEFAULT 'auto',
            $loginUserid TEXT DEFAULT '',
            $loginDisplayName TEXT DEFAULT '',
            $loginDeviceUDID TEXT DEFAULT '',
            $columnAppVersion TEXT DEFAULT '',
            $columnAppBuild TEXT DEFAULT '',
            $columnAppBuildDate TEXT DEFAULT '',
            $columnAppBuildIsDebug INTEGER DEFAULT 0          
          )
          ''');
  }

  // Ensure table exists, and if not, re-create it
  Future<void> _ensureTableExists(Database db) async {
    var tableExists = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$_tableAppSettings'");
    if (tableExists.isEmpty) {
      // Table does not exist, so recreate it
      await _onCreate(db, _dbVersion);
    }
  }

  // Helper methods:
  Future<int> setServerName(String serverName) async {
    Database db = await database; // Ensure the database is initialized
    await _ensureTableExists(db);  // Ensure table exists before querying

    return await db.insert(
        _tableAppSettings,
        {'_id': 1, 'serverName': serverName},
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  // Reads the first server name entry (assumes only one entry).
  Future<String?> getServerName() async {
    S s = S();
    Database db = await instance.database;
    await _ensureTableExists(db);  // Ensure table exists before querying

    List<Map> maps = await db.query(_tableAppSettings,
        columns: [columnServerURL],
        limit: 1);
    if (maps.isNotEmpty) {
      return maps.first[columnServerURL] as String?;
    }
    return s.officialServer;
  }

  // Delete all rows
  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete(_tableAppSettings);
  }
}