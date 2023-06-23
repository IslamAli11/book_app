import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import '../../models/books_model.dart';
import '../../shared/dio_helper.dart';
import 'book_state.dart';



class BookCubit extends Cubit<BookStates> {
  BookCubit() : super(InitialState());
  static BookCubit get(context) => BlocProvider.of(context);

  List<dynamic> bookData=[];

  void getMoviesData() async{
      emit(LoadingData());
     await DioHelper.getData(
        url: 'https://wolnelektury.pl/api/books/',

      ).then((value) {
       bookData = value.data;
        emit(SuccessGetData());
        print('susssssssss');
      }).catchError((error) {
        emit(FailedGetData());
        print(FailedGetData());
      });

  }



}
