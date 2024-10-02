part of 'auth_bloc.dart';



abstract class AuthState extends Equatable {

    @override 
    List<Object> get props => [];

 }

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
 final User user;

 AuthLoaded({required this.user});

}

final class AuthError extends AuthState {

  final String error;

  AuthError({required this.error});

}
