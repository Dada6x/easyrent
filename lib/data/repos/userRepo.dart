import 'package:dartz/dartz.dart';
import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/core/services/errors/exceptions.dart';
import 'package:easyrent/data/models/user_model.dart';
import 'package:easyrent/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userrepo {
  Userrepo(this.api);
  final ApiConsumer api;

  //!-----------------------login---------------------------------->
  Future<Either<String, User>> loginUser(
      {required String number, required String password}) async {
    try {
      //chng to post and the endpoint also
      final response = await api.post(
        EndPoints.Login,
        data: {
          ApiKey.number: number,
          ApiKey.password: password,
        },
      );
// ! save Token      // idk if i should save it in the User
      saveToken(response['token']);
//! Call Profile
/*
  * if the request dosent return the info i need about the user in the login/signup response
  * ask for Profile info
*/
// final profileResponse = await api.get(
//   EndPoints.fetchAllProperties,
// );
//! making new User
      debug.i("User Created");
      final user = User.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

//!-----------------------Sign Up---------------------------------->
  Future<Either<String, User>> signUpUser({
    required String number,
    required String password,
    required String email,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(
        EndPoints.signUp,
        data: {
          ApiKey.number: number,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
        },
      );
      final user = User.fromJson(response);
      final token = response['token'];
      debug.i("New User Created");
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

//!-----------------------Log OUt ---------------------------------->
  Future<Either<String, String>> logoutUser() async {
    try {
      final response = await api.post(
        EndPoints.Logout,
      );
      deleteToken();
      debug.t("User Logged out ");
      return Right('YOUre Out ');
    } on ServerException catch (e) {
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

// what to save about user 
// token , user name, theme , language , role . just 