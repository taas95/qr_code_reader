import '../util/db/sqlite/sqlitehandler.dart';
// import '../models/user.dart';
import '../main.dart';
import '../models/user.dart';
import '../views/autenticationpage.dart';

Future actionsignup() async {
  User user = new User("001", "Facebook", "", "Ekpaye", "path",
      "refInformation", useremail, "_refWear",userpwd);

  var db = new SqlHandler();
  print('This is the long funtion');
  await db.saveUser(user);
}
