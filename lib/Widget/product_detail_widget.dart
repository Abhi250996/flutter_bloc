import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key,this.label,this.value});
  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: Text(value![0].toUpperCase()+value!.substring(1).toLowerCase(),style: GoogleFonts.robotoSlab(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
    );
  }
}

