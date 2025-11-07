part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SaveUserSuccess extends AuthState {}
final class SaveUserLoding extends AuthState {}
final class SaveUserError extends AuthState {}
