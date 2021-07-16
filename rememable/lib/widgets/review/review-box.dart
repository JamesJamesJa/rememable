import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewBox extends StatelessWidget {
  final String name;
  final int rating;
  final String review;

  const ReviewBox({Key key, this.name, this.rating, this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          top: 20,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              name,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Color(0xff323232),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                for (int index = 1; index <= 5; index++)
                  (rating >= index
                      ? Icon(
                          Icons.star_outlined,
                          size: 16,
                          color: Color(0xFF749BFF),
                        )
                      : Icon(
                          Icons.star_border_outlined,
                          size: 16,
                          color: Color(0xFF749BFF),
                        )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 6, right: 6, top: 8),
            child: Text(
              review,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Color(0xff323232),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
