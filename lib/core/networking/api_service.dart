import 'package:clean_arch_app/features/profile/data/models/profile_response.dart';
import 'package:clean_arch_app/features/signup/data/models/signup_request_body.dart';
import 'package:clean_arch_app/features/signup/data/models/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignUpResponse> signUp(@Body() SignupRequestBody signUpRequestBody);

  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfile(@Header("Authorization") String token);
}
