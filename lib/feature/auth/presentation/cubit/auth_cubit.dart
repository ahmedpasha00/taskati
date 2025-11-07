import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';
import 'package:taskati/feature/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  saveUserData(UserModel user)async{
    emit(SaveUserLoding());
    final response=await AuthRepo.saveUserData(user);

    if(response){
      emit(SaveUserSuccess());
    }else{
      emit(SaveUserError());
    }
  }
}
