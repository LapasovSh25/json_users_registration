part of 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterInitialState());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Logic
  AuthService authService = AuthService();

  Future<void> register() async {
    emit(const RegisterLoadingState());
    await authService
        .register(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text)
        .then((dynamic response) async {
      if (response is RegisterModel) {
        await Hive.openBox("access_token");
        await Hive.box("access_token")
            .put("access_token", response.accessToken.toString());
        await Hive.box("access_token").close();
        emit(const RegisterCompleteState());
      } else {
        debugPrint(response.toString());
        emit(RegisterErrorState(response));
      }
    });
  }
}
