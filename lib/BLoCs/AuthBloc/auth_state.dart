part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends AuthState {
  final String usertype;
  final String token;
  final String user_id;

  LoginSuccessState(this.user_id, this.token, this.usertype);

  @override
  List<Object?> get props => [user_id, usertype, token];
}

class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class DeviceTokenInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class DeviceTokenSuccess extends AuthState {
  final List<TokenData>? tokenData;

  const DeviceTokenSuccess(this.tokenData);

  @override
  List<Object?> get props => [tokenData];
}

class DeviceTokenError extends AuthState {
  final String? message;

  const DeviceTokenError(this.message);

  @override
  List<Object?> get props => [message];
}