part of 'login_state.dart';




class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  // Instance
  AuthService authService = AuthService();

  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Logic
  Future<void> login() async {
    emit(LoginLoadingState());
    await authService
        .login(email: emailController.text, password: passwordController.text)
        .then((dynamic response) async {
      if (response is RegisterModel) {
        await Hive.openBox("access_token");
        await Hive.box("access_token").put("access_token", response.accessToken.toString());
        await Hive.box("access_token").close();
        emit(LoginCompleteState());
      } else {
        emit(LoginErrorState(response));
      }
    });
  }
}
