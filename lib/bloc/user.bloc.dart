import 'package:bloc/bloc.dart';
import 'package:enset_app2/bloc/theme.bloc.dart';
import 'package:enset_app2/model/users.model.dart';
import 'package:enset_app2/repository/userrepository.dart';

abstract class Userevent {}

class SearchUsersevent extends Userevent {
  final String keyword;

  SearchUsersevent({
    required this.keyword,
  });
}

abstract class UserState {}

class SearchUserSuccessState extends UserState {
  final ListUsers listUsers;
  SearchUserSuccessState({
    required this.listUsers,
  });
}

class SearchUsersLoadingUsersState extends UserState {}

class SearchUserErrorState extends UserState {
  final String errorMessage;

  SearchUserErrorState({required this.errorMessage});
}

class UsersInitialState extends UserState {}

class Usersbloc extends Bloc<Userevent, UserState> {
  Userrepository userrepository = Userrepository();
  Usersbloc() : super(UsersInitialState()) {
    on((SearchUsersevent event, emit) async {
      emit(SearchUsersLoadingUsersState());
      try {
        ListUsers listUsers =
            await userrepository.searchUsers(event.keyword, 0, 20);
        emit(SearchUserSuccessState(listUsers: listUsers));
      } catch (e) {
        SearchUserErrorState(errorMessage: e.toString());
      }
    });
  }
}
