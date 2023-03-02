import 'package:final_exam/data/model/card_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
class CardItemWidget extends StatelessWidget {
  final int index;
  final List<CardModel> data;
  const CardItemWidget({Key? key, required this.index, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
           SizedBox(
            height: 15.h,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 200.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    // color: Color(hexColor(bankViewModel
                    //     .bankCart![index].colors!.colorA
                    //     .toString()) ??
                    //     ""),
                    borderRadius: BorderRadius.circular(30),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(hexColor(bankViewModel
                    //         .bankCart![index].colors!.colorA
                    //         .toString()) ??
                    //         "")
                    //         .withOpacity(0.5),
                    //     blurRadius: 2,
                    //     offset: Offset(3, 6), // Shadow position
                    //   ),
                    // ],
                  ),
                ),
                // SvgPicture.asset(
                //   MyIcon.cardbg,
                //   color: Color(hexColor(bankViewModel
                //       .bankCart![index].colors!.colorB
                //       .toString()) ??
                //       ""),
                // ),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 15, right: 15, left: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [

                              // SvgPicture.asset(
                              //   MyIcon.getIcon(cardModel
                              //       .bankCart![index].cardType
                              //       .toString()),
                              //   width: 50,
                              // )
                            // ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            // SvgPicture.asset(
                            //   MyIcon.card,
                            //   width: 50,
                            // ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  data[index].cardNum
                                      .toString(),
                                  style: GoogleFonts.concertOne().copyWith(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w100),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index].expireDate
                                      .toString(),

                                  style:
                                  GoogleFonts.alatsi(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Current Balance",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "UZS ${data[index].balance}",
                              style: GoogleFonts.rajdhani().copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }
