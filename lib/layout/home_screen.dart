
import 'package:book_app/shared/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'cubit/book_cubit.dart';
import 'cubit/book_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<BookCubit, BookStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor:backgroundColor,
            body: ConditionalBuilder(
              condition: state is SuccessGetData,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(

                    itemBuilder: (BuildContext context, int index) {
                      return  Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('${BookCubit.get(context).bookData[index]['simple_thumb']}')),
                            ),
                          ),
                          SizedBox(
                            height:height*0.02,
                          ),
                          Text('${BookCubit.get(context).bookData[index]['title']}',style: TextStyle(fontSize: 20,color: Colors.white),)
                        ],
                      );

                    },
                    separatorBuilder: (BuildContext context, int index)=>Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    itemCount: BookCubit.get(context).bookData.length,

                  ),
                );
              },
             fallback: (context){
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
             },
            ),
          );
        },
        );
  }
}
