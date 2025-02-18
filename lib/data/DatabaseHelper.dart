import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databasehelper {
  // Sligleton: Garante que só haja uma instância do DatabaseHelper.
  static final Databasehelper _instance = Databasehelper._internal();
  factory Databasehelper() => _instance;
  static Database? _database;

  // Construtor privado para o singleton
  Databasehelper._internal();

  // Gestor para acessar o banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!; // Retorna o banco de dados se já estiver inicializado.
    _database = await _initDatabase(); // Inicializa o banco de dados se for a primeira vez.
    return _database!;
}

// Inicializa o baco de dados.
Future<Database> _initDatabase() async {
  // Define o caminho do banco de dados no sistema de arquivos.
  String path = join(await getDatabasesPath(), 'cuida_database.db');
  // Abre o banco de dados (ou cria se não existir)
  return await openDatabase(
    path, 
    version: 1,
    onCreate: _onCreate, // chama a função _onCreate para criar as tabelas.path
  );
}
// cria as tabelas no banco de dados.
Future<void> _onCreate(Database db, int version) async {
  // Cria a tabela de categorias.
  await db.execute('''
    CREATE TABLE categorias (
      id_categoria INTEGER PRIMARY KEY AUTOINCREMENT, // chave primária autoincremento
      categoria TEXT // Nome da categoria.)
  ''');

  // cria a tabela de usuários
  await db.execute('''
    CREATE TABLE users (
      id_user INTEGER PRIMARY KEY AUTOINCREMENT, // chave primária autoincrementada.
      user TEXT, // Nome do usuario
      email TEXT UNIQUE, // Email do usuario
      password TEXT // Senha do usuario (deve ser armazenada como hash).
      categoria_id INTEGER. // chave estrangeira para categoria do usuario
      logado_id INTEGER, // 1 se o usuario estiver logado, O caso contrario.
      FOREIGN KEY (categoria_id) REFERENCES categories(id) // relacionamento com a tabela de categorias.
  ''');

  // insere categorias padrão no banco de dados.
  await db.insert('categorias', {'categoria': 'idoso'});
  await db.insert('categorias', {'categoria': 'idoso com cuidador'});
  await db.insert('categorias', {'categoria': 'Cuidador'});
  }

  // metódo para inserir um usuário no banco de dados.
  Future<int> insertUser(Map<String,  dynamic> user) async {
    Database db = await database; // obtém a distancia do banco dados.
    return await db.query('users'); // retorna todos os registro da tabela 'users'.
  }

  // metodo para buscar um usuario pela e-mail
  Future<Map<String, dynamic>> gethUserByEmail(String email) async {
    Database db = await database; // obtém a distancia do banco dados.
    List<Map<String, dynamic, >> result = await db.query(
      'users',
      where: 'email = ?',//  filtra pelo e-mail
      whereArgs: [email], // passa o valor do e-mail ccomo argumento
    );
    return result.isNotEmpty ? result.first : null; // retorna o primeiro resultado ou null.
  }
// metodo para atualizar o status de login do usuario
Future<void> updateLoginStatus(int userId, bool isLoggedIn) async {
  Database db = await database; // obtém a distancia do banco dados.
  await db.update(
    'users',
    {'logado_in': isLoggedIn ? ' : 0'},// define o status de login.
    where: 'id_user = ?', // filtra pelo id do usuario
    whereArgs: [userId], // passa o id do usuario como argumento
    );
  }

  // metodo para inserir um item no marketplace
  Future<void> insertMarketplaceItem(Map<String, dynamic> item) async {
    Database db = await database; // obtém a distancia do banco dados.
    return await db.insert('marketplace', item);
  }

  // metodo para obter todos os itens do marketplace.
  Future<List<Map<String, dynamic>>> getMarketplaceItems() async {
    Database db = await database; // obtém a distancia do banco dados.
    return await db.query('marketplace');// retorne todos os registros da tabela 'marketplace'.
  }
}
  