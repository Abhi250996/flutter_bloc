import 'package:bloc_demo/Screen/product_category.dart';
import 'package:bloc_demo/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              color: Colors.cyan,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNl8zZF9pbGx1c3RyYXRpb25fb2ZfYV9ib3lfc2l0dGluZ19vbl90aGVfZmxvb18zMjc1NTFkMC1mMzRiLTQ3NzItYjg4YS1hOGM5Yzg2ODFiMzFfMS5qcGc.jpg",
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(),
                  Text(
                   StringConstants.userName ,
                    style: GoogleFonts.lato(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    StringConstants.userEmail,
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 3,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const  ProductCategoryScreen())),
                leading: const Icon(Icons.category),
                title: Text(
               StringConstants.category,
                  style: GoogleFonts.roboto(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Divider(
              height: 2,
              color: Colors.grey.withOpacity(.5),
            )
          ],
        ),
      );
  }
}