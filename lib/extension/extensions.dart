import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextEnstion on String {
  Widget titleText(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w500,
      Color? color,
      TextOverflow? overflow}) {
    return Text(this,
        overflow: overflow,
        style: GoogleFonts.lato(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }

  Widget categoryText(
      {double fontSize = 16.0,
      FontWeight fontWeight = FontWeight.w600,
      TextOverflow? overflow}) {
    return Text(this,
        overflow: overflow,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
  }

  Widget productTitleText(
      {double fontSize = 40.0,
      FontWeight fontWeight = FontWeight.bold,
      TextOverflow? overflow}) {
    return Text(this,
        overflow: overflow,
        maxLines: 1,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
  }

  Widget withCurrencyText({
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return Text(
      '\u{20B9}$this',
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  Widget withCategoryText({
    double fontSize = 23,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return Text(
      this[0].toUpperCase()+substring(1).toLowerCase(),
      style: GoogleFonts.arapey(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  Widget withCurrencyDetailsText({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return Text(
      '\u{20B9} $this',
      style: GoogleFonts.arapey(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
