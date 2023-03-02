import 'package:final_exam/ui/add_card/widget/custom_button.dart';
import 'package:final_exam/ui/add_card/widget/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import '../../cubit/firestore_cubit.dart';
import '../../data/model/card_model.dart';
import '../../utils/constants.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}
TextEditingController cardNumController  = TextEditingController();
TextEditingController expireDateController = TextEditingController();
TextEditingController cardNameController  = TextEditingController();
TextEditingController fullNameController  = TextEditingController();
TextEditingController balanceController  = TextEditingController();
Color picker = Color(0xFFFFFF);
class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const ColorsView(),
            CustomTextField(
                text: "Card Number",
                type: TextInputType.number,
                format: MyConstants.cardFormat,
              textEditingController: cardNumController,

            ),
            const SizedBox(height: 16),
            CustomTextField(
              text: "Expire Data",
              type: TextInputType.datetime,
              format: MyConstants.validityPeriod,
              textEditingController: expireDateController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
                text: "Card Name", type: TextInputType.text, format: "",
              textEditingController: cardNameController,),
            const SizedBox(height: 16),
            CustomTextField(
              text: "Full Name",
              type: TextInputType.text,
              format: "",
              textEditingController: fullNameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              text: "Balance",
              type: TextInputType.number,
              format: "",
              textEditingController: balanceController,
            ),
            const SizedBox(height: 16),
            // const CustomDropdown(),
            CircleColorPicker(
              onChanged: (color) {
                picker = color;
              },
              size: const Size(240, 240),
              strokeWidth: 4,
              thumbSize: 36,
            ),
            InkWell(
                onTap: () {
                  BlocProvider.of<PostCardCubit>(context).postCardToFirestore(
                      CardModel(
                          id: "",
                          cardNum: cardNumController.text,
                          expireDate: expireDateController.text,
                          color: picker.toString(),
                          balance: balanceController.text,
                          bankName: cardNameController.text,
                          backup: fullNameController.text));
                  Navigator.pop(context);

                },


                child: CustomButton(
                  text: "Add Card",
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
