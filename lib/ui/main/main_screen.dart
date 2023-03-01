import 'package:final_exam/data/model/card_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/firestore_cubit.dart';
// import '../../cubit/firestore_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const Center(child: Text("Hello"),),
      // BlocBuilder<PostModelCubit,PostModelState>(
      //   builder: (context, state) {
      //     if(state is )
      //
      //   }),
      floatingActionButton: FloatingActionButton(onPressed:
        ((){
      BlocProvider.of<PostModelCubit>(context).postCardModelToFirestore(CardModel(id: "", cardNum: "", expireDate: "", color: "", balance: "", bankName: "", backup: ""));

    }),),
    );
  }
}
