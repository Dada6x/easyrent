import 'package:dartz/dartz.dart';
import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/core/services/api/errors/exceptions.dart';
import 'package:easyrent/data/models/user_model.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userrepo {
  Userrepo(this.api);
  final ApiConsumer api;

  //!-----------------------login---------------------------------->
  Future<Either<String, User>> loginUser(
      {required String number, required String password}) async {
    try {
      final response = await api.post(
        EndPoints.Login,
        data: {
          ApiKey.phone: number,
          ApiKey.password: password,
        },
      );
      if (response.statusCode == 200) {
        debug.i("Status Code is ${response.statusCode}");
        userPref?.setBool('isLoggedIn', true);
        Get.off(() => const HomeScreenNavigator());
        saveToken(response['token']);
      }
      debug.i("User Created");
      final user = User.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      debug.e("Exception $e");
      return Left(e.errorModel.message);
    }
  }

//!-----------------------Sign Up---------------------------------->
  Future<Either<String, User>> signUpUser({
    required String number,
    required String userName,
    required String password,
    required Map<String, double> latLang,
  }) async {
    try {
      final response = await api.post(
        EndPoints.registerUser,
        data: {
          ApiKey.phone: number,
          ApiKey.password: password,
          ApiKey.userName: userName,
          ApiKey.pointsDto: latLang,
        },
      );
      if (response.statusCode == 200) {
        debug.i("Status Code is ${response.statusCode}");
        saveToken(response['token']);
        userPref?.setBool('isLoggedIn', true);
        Get.off(() => const HomeScreenNavigator());
      }
      debug.i("New User Created ");
      final user = User.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      debug.e("Exception $e");
      return Left(e.errorModel.message);
    }
  }

//!-----------------------Log OUt ---------------------------------->
  Future<Either<String, String>> logoutUser() async {
    try {
      final response = await api.post(
        EndPoints.Logout,
      );
      if (response.statusCode == 200) {
        debug.i("Status Code is ${response.statusCode}");
        userPref?.setBool('isLoggedIn', false);
        Get.off(() => LoginPage());
        deleteToken();
      }
      debug.t("User Logged out ");
      // i need to remove the User 
      return const Right('User Logged Out');
    } on ServerException catch (e) {
      debug.e("Exception $e");

      return Left(e.errorModel.message);
    }
  }
}

// helper funs ... so funny hehehe :D (help)
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<void> deleteToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}

// what to save about user . 
// token , user name, theme , language , role . just
