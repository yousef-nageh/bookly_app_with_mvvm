import 'package:bookly_app_with_mvvm/features/home/data/models/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'dio_helper.dart';

final  getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    DioHelper(
      Dio(),
    ),
  ));
}
