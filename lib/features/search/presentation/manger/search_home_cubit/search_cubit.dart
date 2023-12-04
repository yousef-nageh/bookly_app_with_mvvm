import 'package:bloc/bloc.dart';
import 'package:bookly_app_with_mvvm/features/home/data/models/repo/home_repo.dart';

import 'search_state.dart';




class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;
  SearchCubit(this.homeRepo) : super(SearchInitial());


 Future<void> searchForBook({required String item}) async{
   emit(SearchWaitingState());
  var result=await homeRepo.geSearchBooks(item: item);
  result.fold((l) {
    emit(SearchErrorState(l.errorMessage));
  }, (r)  {
    emit(SearchSuccessState(r));

  });


  }
}
