import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_comment/bloc/login_bloc/login_state.dart';
import 'package:offline_comment/core/constants/show_message_helper.dart';
import 'package:offline_comment/view/home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginCompleteState) {
           Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        } else if (state is LoginErrorState) {
          showMessageHelper(state.error);
        }
      },
      builder: (BuildContext context, LoginState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login with Api"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: context.watch<LoginCubit>().emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              TextFormField(
                obscureText: _isVisible ? false : true,
                controller: context.watch<LoginCubit>().passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                   suffixIcon: IconButton(
                          onPressed: () => updateStatus(),
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color:  Colors.blue,
                          ),
                        )
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                context.read<LoginCubit>().login();
              },
              label: state is LoginLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Text("Login")),
        );
      },
    );
  }
}
