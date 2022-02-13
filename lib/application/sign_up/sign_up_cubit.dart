import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teker_teker/domain/auth_models/email.dart';
import 'package:teker_teker/domain/auth_models/name.dart';
import 'package:teker_teker/domain/auth_models/password.dart';
import 'package:teker_teker/domain/auth_models/re_password.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status:
          Formz.validate([state.name, email, state.password, state.rePassword]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status:
          Formz.validate([state.name, state.email, password, state.rePassword]),
    ));
  }

  void rePasswordChanged(String value) {
    final rePassword = RePassword.dirty(value);
    emit(state.copyWith(
      rePassword: rePassword,
      status:
          Formz.validate([state.name, state.email, state.password, rePassword]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status:
          Formz.validate([name, state.email, state.password, state.rePassword]),
    ));
  }

  void signUpWithCredentials() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth
          .createUserWithEmailAndPassword(
              email: state.email.value, password: state.password.value)
          .then((value) => FirebaseFirestore.instance
                  .collection('bicycles')
                  .doc(_auth.currentUser?.uid)
                  .set({
                'email': state.email.value,
                'password': state.password.value,
                'displayName': state.name.value,
                'photoURL':
                    'https://espclarity.com/wp-content/uploads/2021/07/3rd-member.png',
                'credit': 0,
                'teker_lira': 0,
                'total_driving_time': 6,
                'travalled_distance': 54,
                'calorie': 193,
                'driver_type': 'Gümüş'
              }));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      print(error);
      emit(state.copyWith(
          exceptionError: 'Unexpected error please try again later',
          status: FormzStatus.submissionFailure));
    }
  }
}
