import 'package:final_project/OAuth/googleOAuth.dart';
import 'package:final_project/bloc/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class LoginEvent extends UserEvent {}

class RegisterEvent extends UserEvent {}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

    void LoginEvent() async {
      GoogleOauth obj = GoogleOauth();
      UserCredential userCred = await obj.signInWithGoogle();
      User user = userCred.user!;
      emit(UserState.init(user.displayName!, user.email!, user.photoURL!));
  }

}
