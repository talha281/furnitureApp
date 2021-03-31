import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/global/auth/bloc/authentication_bloc.dart';
import 'package:furniture_app/home_page.dart';
import 'package:furniture_app/routers.dart';
import 'package:provider/provider.dart';
import 'blocs/cart/bloc/cart_bloc.dart';
import 'blocs/dashboard/bloc/dashboard_bloc.dart';
import 'global/user/bloc/user_bloc.dart';
import 'injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await di.depInject();
  di.sl<FirebaseApp>();
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: buildMaterialApp(),
    );
  }

  Widget buildMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture app',
      navigatorKey: RouteNavigation.routeKey,
      theme: ThemeData(
        // We set Poppins as our default font
        primaryColor: kPrimaryColor,

        accentColor: kPrimaryColor,
        fontFamily: 'NunitoSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      onGenerateRoute: (settings) => RouteNavigation.onGenerateRoute(settings),
    );
  }

  List<BlocProvider> providers() {
    return [
      BlocProvider<AuthenticationBloc>(
        create: (context) => di.sl<AuthenticationBloc>()..add(AppStarted()),
      ),
      BlocProvider<DashboardBloc>(
          create: (context) => di.sl<DashboardBloc>()..add(LoadDashboard())),
      BlocProvider<CartBloc>(create: (context) => di.sl<CartBloc>()),
      BlocProvider<UserBloc>(
          create: (context) => di.sl<UserBloc>()..add(CheckUserEvent())),
    ];
  }
}
