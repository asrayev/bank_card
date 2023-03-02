import 'package:final_exam/data/model/card_model.dart';
import 'package:final_exam/ui/main/widget/card_item_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/firestore_cubit.dart';
import '../../cubit/firestore_state.dart';
// import '../../cubit/firestore_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.add)
        ],
      ),
      // body:  const Center(child: Text("Hello"),),
    body:  BlocBuilder<PostCardCubit,PostCardState>(
      // listener: (context, state) {
      //   context.read<PostCardCubit>().getAllCards();
      // },
        builder: (context, state) {
          if(state is CardLoading){
            return const CircularProgressIndicator.adaptive();
          }
          else if (state is GetCardSuccess){
            return SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index){
                return CardItemWidget(index: index,data: state.data,);
              }),
            );
          }else if (state is CardError){
            return Center(child: Text("${state.message} "));
          }else {
            return const Center(child: Text("ERROR nima "));
          }

        }),
      floatingActionButton: FloatingActionButton(onPressed:
        ((){
      BlocProvider.of<PostCardCubit>(context).postCardToFirestore(CardModel(id: "", cardNum: "", expireDate: "", color: "", balance: "", bankName: "", backup: ""));

    }),),
    );
  }
}
