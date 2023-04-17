import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_comment/bloc/register_bloc/register_state.dart';
import 'package:offline_comment/core/constants/show_message_helper.dart';
import 'package:offline_comment/view/auth/log_in_page.dart';
import 'package:offline_comment/view/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterCompleteState) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else if (state is RegisterErrorState) {
          showMessageHelper(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Register with Api"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller:
                        context.watch<RegisterCubit>().firstNameController,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: context.watch<RegisterCubit>().lastNameController,
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: context.watch<RegisterCubit>().emailController,
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
                  controller: context.watch<RegisterCubit>().passwordController,
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
                          color: Colors.blue,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    obscureText: _isVisible ? false : true,
                    controller: context
                        .watch<RegisterCubit>()
                        .confirmPasswordController,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => updateStatus(),
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.blue,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
                  },
                  child: const Text("Login")),
              FloatingActionButton.extended(
                  onPressed: () {
                    context.read<RegisterCubit>().register();
                  },
                  label: state is RegisterLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text("Register")),
            ],
          ),
        );
      },
    );
  }
}
