import 'package:dartz/dartz.dart';
import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/core/services/errors/exceptions.dart';
import 'package:easyrent/data/models/user_model.dart';
import 'package:easyrent/main.dart';

class Userrepo {
  Userrepo(this.api);
  final ApiConsumer api;

  Future<Either<String, User>> loginUser(
      {required String number, required String password}) async {
    try {
      final response = await api.post(
        EndPoints.signUp,
        data: {
          ApiKey.number: number,
          ApiKey.password: password,
        },
      );
      // get the token
      final token = response['token'];

      final user = User.fromJson(response);
      debug.i("User Created");
      return Right(user);
      // if the request dosent return the info i need about the user in the login/signup response
      // ask for Profile info
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
  //TODO  token , EndPoints , APIKEYS, BASEURL,

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

  logoutUser() {}
}
