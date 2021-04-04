import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_app/data/repository/address/address_repository.dart';
import 'package:furniture_app/data/repository/address/i_address_repository.dart';
import 'package:furniture_app/data/repository/home/home.dart';
import 'package:furniture_app/data/repository/cart/i_cart_repository.dart';
import 'package:furniture_app/data/repository/user/i_user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'blocs/cart/bloc/cart_bloc.dart';
import 'blocs/dashboard/bloc/dashboard_bloc.dart';
import 'data/repository/cart/cart_repository.dart';
import 'data/repository/home/I_home.dart';
import 'data/repository/user/user_repository.dart';

final GetIt sl = GetIt.instance;
Future<void> depInject() async {
  _injectRepository();
  _injectBloc();
  await _injectExternal();
}

void _injectRepository() {
  sl.registerLazySingleton<IHome>(() => HomeRepository());
  sl.registerLazySingleton<ICartRepository>(() => CartRepository());
  sl.registerLazySingleton<IUserRepository>(() => UserRepository(sl(), sl()));
  sl.registerLazySingleton<IAddressRepository>(() => AddressRepository());
}

void _injectBloc() {
  sl.registerFactory(() => DashboardBloc(sl()));
  sl.registerFactory(() => CartBloc(sl()));
}

Future<void> _injectExternal() async {
  FirebaseApp app = await Firebase.initializeApp();
  sl.registerFactory<FirebaseApp>(() => app);
  SharedPreferences pref = await SharedPreferences.getInstance();
  sl.registerFactory<SharedPreferences>(() => pref);
  sl.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
}
