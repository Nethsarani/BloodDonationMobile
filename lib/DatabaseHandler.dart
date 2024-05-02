import 'package:sqflite/sqflite.dart';
import 'package:mssql_connection/mssql_connection.dart';
import	'package:path/path.dart';
import	'package:blood_donation_management_system/User.dart';
import 'package:sql_conn/sql_conn.dart';
import 'package:connect_to_sql_server_directly/connect_to_sql_server_directly.dart';

class	DatabaseHandler	{
  MssqlConnection mssqlConnection = MssqlConnection.getInstance();
  final _connectToSqlServerDirectlyPlugin = ConnectToSqlServerDirectly();
  Future<bool> init() async{
    /*bool isConnected = await SqlConn.connect(
      ip: '158.69.241.120',
      //ip: r'sql.bsite.net\MSSQL2016',
      port: '139',
      databaseName: 'nethsarani_BloodSystem',
      username: 'nethsarani_BloodSystem',
      password: 'neth1234',
      //timeoutInSeconds: 30,
    );
*/
    //_connectToSqlServerDirectlyPlugin.initializeConnection('158.69.241.120', 'nethsarani_BloodSystem', 'nethsarani_BloodSystem', 'neth1234', instance: r'sql.bsite.net\MSSQL2016');
return true;
    //return isConnected;
  }
  Future <String> Login(String username, String password) async
  {
    String command = "Select * From [DonorTable] Where Username='check1' and Password='pass1'";
    String result=await mssqlConnection.getData(command);
    return result;
    /*
    Donor temp = null;
    while (reader.Read())
    {
      temp = new Donor();
      temp.ID = reader.GetInt32(0);
      temp.Name = reader.GetString(1);
      temp.Gender = reader.GetString(2);
      temp.NIC = reader.GetString(3);
      string xml1 = reader.GetString(4);
      temp.Location= (Location)xmlToObject<Location>(xml1);
      temp.DOB=DateTime.Parse(reader.GetString(5));
      temp.ContactNo = reader.GetString(6);
      temp.Email = reader.GetString(7);
      temp.BloodType = reader.GetString(8);
      temp.health=(HealthCondition)xmlToObject<HealthCondition>(reader.GetString(9));
      temp.Username = reader.GetString(10);
      temp.Password = reader.GetString(11);
    }
    con.Close();
    return temp;
    */

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