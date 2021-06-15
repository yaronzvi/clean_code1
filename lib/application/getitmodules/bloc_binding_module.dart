import 'package:first_proj/main.dart';
import 'package:first_proj/pages/home/home_bloc.dart';

import '../../pages/home/home_bloc.dart';

class BlocBindingModule {
  static provideModules() {
    getIt.registerFactory(() => HomeBloc(getIt.get()));
    getIt.registerFactory(() => HomeCubit(getIt.get()));
  }
}
