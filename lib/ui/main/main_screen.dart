import 'package:final_exam/ui/main/widget/card_item_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/firestore_cubit.dart';
import '../../cubit/firestore_state.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_card/add_card_page.dart';
// import '../../cubit/firestore_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Exam"),
        actions:  [
          InkWell(
              onTap: ((){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCardPage()));
              }),
              child: const Icon(Icons.add)),
          SizedBox(width: 10.w,)
        ],
      ),
    body:  BlocBuilder<PostCardCubit,PostCardState>(
        builder: (context, state) {
          if(state is CardLoading){
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          else if (state is GetCardSuccess){
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index){
                return CardItemWidget(index: index,data: state.data,);
              }),
            );
          }else if (state is CardError){
            return Center(child: Text("${state.message} "));
          }else {
            BlocProvider.of<PostCardCubit>(context).getAllCards();
            return const Center(child: Text("ERROR nima "));
          }
        }
        ),
    );
  }
}
