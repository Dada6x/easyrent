import 'package:dartz/dartz.dart';
import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/core/services/api/errors/exceptions.dart';
import 'package:easyrent/data/models/user_model.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:easyrent/presentation/views/auth/views/verification_code_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userrepo {
  Userrepo(this.api);
  final ApiConsumer api;

// maybe as salma said , i dont need the user object in the application , its nothing dynamicly running or i need to save it or anything ,
// maybe i chace the name and some thinhs via chace helper from api course , 
// chahe the name and other things .

  //!-----------------------login---------------------------------->
  Future<Either<String, User>> loginUser({
    required String number,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.Login,
        data: {
          ApiKey.phone: number,
          ApiKey.password: password,
        },
      );
      if (response.statusCode == 200) {
        debug.i("User Logged In");
        userPref?.setBool('isLoggedIn', true);
        final token = response['accessToken'];
        await saveToken(token);
        Get.off(() => const HomeScreenNavigator());
        //! ###################################### Fetch full user profile
        final profileResponse = await api.get(
          EndPoints.me,
        );
        if (profileResponse.statusCode == 200) {
          debug.w("New User Created !");
          final user = User.fromJson(profileResponse);
          //! ##########
          return Right(user);
        }
        //! ######################################
      }
      return const Left('Unexpected error');
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

//!-----------------------Sign Up---------------------------------->
// maybe i should delete the either here
  Future<Either<String, String>> signUpUser({
    required String number,
    required String userName,
    required String password,
    required Map<String, double> latLang,
  }) async {
    try {
      final response = await api.post(
        EndPoints.registerUser,
        // "https://run.mocky.io/v3/22e0a317-53d3-4836-85f4-ee698ef1b1da"
        data: {
          ApiKey.phone: number,
          ApiKey.password: password,
          ApiKey.userName: userName,
          ApiKey.pointsDto: latLang,
        },
      );
      if (response.statusCode == 200) {
        // userPref?.setBool('isLoggedIn', true);
        Get.off(() => const VerificationCodePage());
        // it has to go to the verification  code page and then when its verify
        // //! ######################################         //@ Fetch full user profile
        // final profileResponse = await api.get(
        //   EndPoints.me,
        // );
        // if (profileResponse.statusCode == 200) {
        //   debug.w("New User Created !");
        //   final user = User.fromJson(profileResponse);
        //   //! ##########
        //   return Right(user);
        // }
        // //! ######################################
      }
      return const Left('Unexpected error');
    } on ServerException catch (e) {
      debug.e("Exception $e");
      return Left(e.errorModel.message);
    }
  }

//! i need to make an Fetch User when the app initialized after we know that he has an token in the device
//! maybe store some Data in the sharedPref as username or image Url. and everyTime the app is loaded .

//!-----------------------Log OUt ---------------------------------->
  Future<Either<String, String>> logoutUser() async {
    try {
      final response = await api.post(
        EndPoints.Logout,
      );
      if (response.statusCode == 200) {
        debug.i("Status Code is ${response.statusCode}");
        userPref?.setBool('isLoggedIn', false);
        deleteToken();
        Get.off(() => LoginPage());
      }
      debug.t("User Logged out ");
      return const Right('User Logged Out');
    } on ServerException catch (e) {
      debug.e("Exception $e");
      return Left(e.errorModel.message);
    }
  }

//!-----------------------Verify Code---------------------------------->
// ! now i want the state of the application via Bloc
// emit sucres or false state for the color of the pin codes
  Future<Either<String, User>> verifyCode({
    required int code,
  }) async {
    try {
      final response = await api.post(
        EndPoints.verifyCode,
        data: {
          ApiKey.code: code,
        },
      );
      if (response.statusCode == 200) {
        final token = response.data['accessToken'];
        await saveToken(token);
        userPref?.setBool('isLoggedIn', true);
        Get.off(() => const HomeScreenNavigator());

        // Profile 
        final profileResponse = await api.get(
          EndPoints.me,
        );
        if (profileResponse.statusCode == 200) {
          debug.w("New User Created !");
          final user = User.fromJson(profileResponse);
          return Right(user);
        }
      }
      return const Left('Unexpected error');
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
  debug.i("Token Saved");
}

Future<void> deleteToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  debug.i("Token Deleted ");
}

// what to save about user .
// token , user name, theme , language , role . just
