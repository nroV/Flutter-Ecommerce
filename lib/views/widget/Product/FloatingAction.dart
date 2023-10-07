

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../order/Success.dart';

class CustomFLoating extends StatelessWidget {
  var title;
 CustomFLoating({
    super.key,
   this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Expanded(
          child: FloatingActionButton.extended(
              backgroundColor: Color(0xff508A7B),

              elevation: 0,
              isExtended: true,
              extendedPadding: EdgeInsets.all(0),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Success();
                },));

              }, label:Text('${title}',style: TextStyle(
              fontSize: 12.8
          ),)),
        ),
      ],
    );
  }
}