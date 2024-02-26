import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key,this.label,this.value});
  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Row(
                        children: [ SizedBox(
                          width: 100,
                          child: Text("$label  : ",style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                        ), Expanded(child: Text(value!,style: GoogleFonts.merriweather(fontSize: 17,fontWeight: FontWeight.w400),))],
                      ),
    );
  }
}