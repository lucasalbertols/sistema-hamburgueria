import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/item.dart';
import '../models/order.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'pedido.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pedidos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        customerName TEXT,
        items TEXT,
        total REAL,
        discount REAL,
        totalWithDiscount REAL
      )
    ''');
  }

  Future<void> insertOrder(Order order) async {
    final db = await database;

    await db.insert('pedidos', {
      'customerName': order.customerName,
      'items': order.items
          .map((e) => e.name)
          .join(', '), // salva nomes em texto
      'total': order.total,
      'discount': order.discount,
      'totalWithDiscount': order.totalWithDiscount,
    });
  }
}
