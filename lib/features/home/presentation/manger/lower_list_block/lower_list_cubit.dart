
import 'package:bookly_app_with_mvvm/features/home/data/models/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lower_list_state.dart';



class LowerListCubit extends Cubit<LowerListStates> {
  LowerListCubit(this.homeRepo) : super(LowerListInitial());
HomeRepo homeRepo;

  Future<void> getLowerListData() async {
    emit(GetLowerListWaitingState());
    var result = await homeRepo.getLowerBooks();

    result.fold((l) {
      emit(GetLowerListErrorState(l.errorMessage));

    }, (r) {
      emit(GetLowerListSuccessState(r));

    });
  }


}
