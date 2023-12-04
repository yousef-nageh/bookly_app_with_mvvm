


import 'package:bookly_app_with_mvvm/features/home/data/models/repo/home_repo.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manger/upper_list_block/upper_list_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';





class UpperListCubit extends Cubit<UpperListStates> {
  UpperListCubit(this.homeRepo) : super(StartState());
  final HomeRepo homeRepo;

  Future<void> getUpperListData() async {
    emit(GetUpperListWaitingState());
    var result = await homeRepo.getUpperBooks();

    result.fold((failure) {
      emit(GetUpperListErrorState(failure.errorMessage));

    }, (booksModel) {
      emit(GetUpperListSuccessState(booksModel));
      
    });
  }








}


