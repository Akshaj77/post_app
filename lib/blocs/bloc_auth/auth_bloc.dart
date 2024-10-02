import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:post_app/models/user_model.dart';
import 'package:post_app/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> _onLoginEvent(LoginEvent event,Emitter<AuthState> emit)async {
    emit(AuthLoading());
    try{
      final jsonResponse = await authRepository.login(event.email,event.password);
      final User user = User.fromMap(jsonResponse);
      emit(AuthLoaded(user: user));

    }
    catch(e) 
    {
        emit(AuthError(error: e.toString()));
    }
  }

}
