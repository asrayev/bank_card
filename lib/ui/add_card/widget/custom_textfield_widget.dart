import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../utils/constants.dart';


// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key, required this.text,required this.type,required this.format, required this.textEditingController}) : super(key: key);

  String text;
  TextInputType type;
  String format;
  TextEditingController textEditingController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late MaskTextInputFormatter cardMaskInputFormatterExpiry;
  late MaskTextInputFormatter cardMaskInputFormatter;
  @override
  void initState(){
    cardMaskInputFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {
        '#': RegExp(r'\d'),
      },
    );
    cardMaskInputFormatterExpiry = MaskTextInputFormatter(
      mask: '##/##',
      filter: {
        '#': RegExp(r'\d'),

      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                controller: widget.textEditingController,
                keyboardType: widget.type,
                inputFormatters: widget.format.isNotEmpty? widget.format == MyConstants.cardFormat?[cardMaskInputFormatter]:[cardMaskInputFormatterExpiry] : [],
                // onChanged: (value) {
                //   if(widget.text=="Karta raqami"){
                //     context.read<EditCardProvider>().changeFields(cardNumber1: value);
                //   }else if(widget.text=="Amal qilish muddati"){
                //     context.read<EditCardProvider>().changeFields(expireDate1: value);
                //   }else if(widget.text=="Karta nomi"){
                //     context.read<EditCardProvider>().changeFields(cardName1: value);
                //   }else if(widget.text=="Karta egasini to'liq ismi va sharfi"){
                //     context.read<EditCardProvider>().changeFields(owner1: value);
                //   }
                // },
                onSubmitted: (value) {},
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  hintText: widget.text,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
