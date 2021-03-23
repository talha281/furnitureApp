import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_app/data/repository/home.dart';
import 'package:furniture_app/data/repository/interfaces/I_home.dart';
import 'package:furniture_app/data/repository/interfaces/i_cart_repository.dart';
import 'package:furniture_app/data/repository/interfaces/i_user_repository.dart';
import 'package:furniture_app/screens/cart/bloc/cart_bloc.dart';
import 'package:furniture_app/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:furniture_app/global/auth/bloc/authentication_bloc.dart';
import 'data/repository/cart_repository.dart';
import 'data/repository/user_repository.dart';
import 'login/bloc/login_bloc.dart';

final GetIt sl = GetIt.instance;
Future<void> depInject() async {
  _injectRepository();
  _injectBloc();
  await _injectExternal();
}

void _injectRepository() {
  sl.registerLazySingleton<IHome>(() => HomeRepository());
  sl.registerLazySingleton<ICartRepository>(() => CartRepository());
  sl.registerLazySingleton<IUserRepository>(() => UserRepository(sl()));
}

void _injectBloc() {
  sl.registerFactory(() => DashboardBloc(sl()));
  sl.registerFactory(() => CartBloc(sl()));
  sl.registerFactory(() => LoginBloc(userRepository: sl()));
  sl.registerFactory(() => AuthenticationBloc(sl()));
}

Future<void> _injectExternal() async {
  FirebaseApp app = await Firebase.initializeApp();
  sl.registerFactory<FirebaseApp>(() => app);
  sl.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
}