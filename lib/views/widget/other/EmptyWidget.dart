
import 'package:ecommerce/res/constant/appcolor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class EmptyCard extends StatelessWidget {
  var img;
  var maintitle;
  var subtitle;

  var btntitle;
   EmptyCard({
    super.key,
     this.img,
     this.maintitle,
     this.subtitle,
     this.btntitle

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,

              child: Column(children: [
                Image.asset('${img}'
                  ,fit: BoxFit.contain,
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 40,),
                Text("${maintitle}",style: Theme.of(context)
                    .textTheme.headlineLarge,),
                SizedBox(height: 10,),
                Text("${subtitle}",style: TextStyle(
                    color: Colors.grey
                ),),

              ],)),
          Container(
            margin: EdgeInsets.only(bottom: 100),
            child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(AppColorConfig.success),
                    elevation: 0,
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),

                onPressed: () {

                }, child: Text("${btntitle}",style: TextStyle(
                fontSize: 15.8
            ),)),
          )



        ],
      ),
    );
  }
}