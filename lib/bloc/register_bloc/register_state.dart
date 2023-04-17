import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:offline_comment/model/register_model.dart';
import 'package:offline_comment/repository/home_repository.dart';
import 'package:offline_comment/service/auth_service.dart';

part 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {
  const RegisterInitialState();
  @override
  List<Object?> get props => [];
}

class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
  @override
  List<Object?> get props => [];
}

class RegisterErrorState extends RegisterState {
 final String error;
  const RegisterErrorState(this.error);
  @override
  List<Object?> get props => [];
}

class RegisterCompleteState extends RegisterState {
  const RegisterCompleteState();
  @override
  List<Object?> get props => [];
}
