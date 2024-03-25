part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class UserLoginEvent extends AuthEvent {
  final String username;
  final String password;
  final String deviceToken;

  UserLoginEvent(this.username, this.password, this.deviceToken);

  @override
  List<Object?> get props => [username, password, deviceToken];
}

class GetDeviceTokenEvent extends AuthEvent {
  final String deviceToken;
  final String userId;

  const GetDeviceTokenEvent(this.deviceToken, this.userId);

  @override
  List<Object?> get props => [deviceToken, userId];
}