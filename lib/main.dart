import 'package:book_app/shared/component/bloc_observer.dart';
import 'package:book_app/shared/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'layout/cubit/book_cubit.dart';
import 'layout/cubit/book_state.dart';
import 'modules/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';





void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());

    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BookCubit()..getMoviesData(),
      child: BlocConsumer<BookCubit,BookStates>(
        listener: (context,state){
          if(state is LoadingData){
           const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context,state){
          return
             MaterialApp(
              debugShowCheckedModeBanner: false,

               localizationsDelegates: const [
                 GlobalMaterialLocalizations.delegate,
                 GlobalWidgetsLocalizations.delegate,
                 GlobalCupertinoLocalizations.delegate,
               ],

               supportedLocales: [
                 Locale('en'),
               ],
              home: LoginScreen(),
            );

        },
      ),
    );
  }
}

