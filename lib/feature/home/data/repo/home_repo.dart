import 'package:hive_flutter/adapters.dart';

import '../../../../core/helper/app_string.dart';
import '../../../auth/data/models/user_model.dart';

class HomeRepo{

  static var box=Hive.box<UserModel>(AppString.userBox);


static UserModel?  getUserData(){
    return box.get(AppString.userKey);
  }

}