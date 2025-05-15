import 'package:clean_arch_app/core/base/base_remote_data_source.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/login_request_body.dart';
import 'package:clean_arch_app/features/login/data/datasources/remote/models/login_response.dart';

class LoginRemoteDataSourceImpl extends BaseRemoteDataSource
    implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl();

  @override
  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    return safeApiCall(
      () async => await apiService.login(
        LoginRequestBody(email: email, password: password),
      ),
    );
  }
}
