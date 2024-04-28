import 'package:sqflite/sqflite.dart';
import 'package:mssql_connection/mssql_connection.dart';
import	'package:path/path.dart';
import	'package:blood_donation_management_system/User.dart';

class	DatabaseHandler	{
  MssqlConnection mssqlConnection = MssqlConnection.getInstance();

  Future<void> init() async{
    bool isConnected = await mssqlConnection.connect(
      ip: '212.104.228.18',
      port: '1433',
      databaseName: 'nethsarani_BloodSystem',
      username: 'nethsarani_BloodSystem',
      password: 'neth1234',
      timeoutInSeconds: 15,
    );
  }

  Future<void> retrieve() async{
    String query = 'SELECT * FROM your_table';
    String result = await mssqlConnection.getData(query);
  }

  Future<void> update() async{
    String query = 'UPDATE your_table SET column_name = "new_value" WHERE condition';
    String result = await mssqlConnection.writeData(query);
  }

  Future<void> disconnect() async{
    bool isDisconnected = await mssqlConnection.disconnect();
  }










  Future<Database>	initializeDB()	async	{
    String	path	=	await	getDatabasesPath();
    return	openDatabase(join(path,	'example.db'),
      onCreate:	(database,	version)	async	{
        await	database.execute("CREATE	TABLE	users(id	INTEGER	PRIMARY	KEY	AUTOINCREMENT,	name	TEXT	NOT	NULL,	username	TEXT	NOT	NULL,	password	TEXT NOT NULL)",);
      },
      version:	1,
    );
  }

  Future<int>	insertUser(List<User>	users)	async	{
    int	result	=	0;
    final	Database	db	=	await	initializeDB();
    for	(var	user	in	users)	{
      result	=	await	db.insert('users',	user.toMap());
    }
    return	result;
  }

  Future<List<User>>	retrieveUsers()	async	{
    final	Database	db	=	await	initializeDB();
    final	List<Map<String,	Object?>>	queryResult	=	await	db.query('users');
    return	queryResult.map((e)	=>	User.fromMap(e)).toList();
  }

  Future<void>	deleteUser(int	id)	async	{
    final	db	=	await	initializeDB();
    await	db.delete(
      'users',where:	"id	=	?",	whereArgs:	[id],
    );
  }
}