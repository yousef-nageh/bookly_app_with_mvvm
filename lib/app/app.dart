import 'package:bookly_app_with_mvvm/config/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/routes/routes.dart';
import '../core/utils/service_locator.dart';
import '../features/home/data/models/repo/home_repo_impl.dart';
import '../features/home/presentation/manger/lower_list_block/lower_list_cubit.dart';
import '../features/home/presentation/manger/upper_list_block/upper_list_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                UpperListCubit(getIt.get<HomeRepoImpl>())..getUpperListData()),
        BlocProvider(
          create: (BuildContext context) =>
              LowerListCubit(getIt.get<HomeRepoImpl>())..getLowerListData(),
        )
      ],
      child: MaterialApp(

       builder: DevicePreview.appBuilder,
        initialRoute: AppRoutes.splashRoutes,
        onGenerateRoute: AppRoutes.generateRoute,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
