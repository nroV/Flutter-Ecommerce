import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/products/address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../order/GoogleMap/GoogleMapScreen.dart';


class AddressProductScr extends StatefulWidget {
  var userid;
  AddressProductScr({Key? key,this.userid}) : super(key: key);

  @override
  State<AddressProductScr> createState() => _AddressProductScrState();
}

class _AddressProductScrState extends State<AddressProductScr> {
  var address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.userid);

  }
  Widget build(BuildContext context) {
    // TODO: implement build
    BlocProvider.of<AddressBloc>(context).add(FetchAddress(userid: widget.userid));
    print("State updated");
    return Scaffold(
      appBar: AppBar(

        title: Text('Address', style: TextStyle(
            color: Colors.black
        ),),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.34),
        elevation: 0,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 7,),
              InkWell(
                onTap: () async {
                  var location = await Location().getLocation();
                  print("User current location");
                  print(location.longitude);
                  print(location.latitude);


                  address = await Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                    return GoogleMapScreen(positionlong: location.longitude,
                      positionlat: location.latitude,
                    );
                  },));

                  setState(() {
                    print("Got Address back");
                    print(address);
                  });
                },

                child: Row(
                  children: [
                    Icon(Icons.add_circle_rounded),
                    SizedBox(width: 7,),
                    Text("Add new Address ", style: TextStyle(

                      fontSize: 12.8,

                    ),),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 10,),
              //TODO address
              Expanded(child:
              BlocConsumer<AddressBloc, AddressState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if(state is AddressLoading) {
                    return Center(
                      child: CircularProgressIndicator(

                      ),
                    );

                  }
                  if(state is AddressError) {
                    return Center(
                      child: CircularProgressIndicator(

                      ),
                    );
                  }
                  if(state is AddressDone) {
                    return ListView.builder(
                      itemCount: state.add?.results?.length ?? 0,

                      itemBuilder: (context, index) {
                        return

                          state.add?.results?.length  == null ?
                              Center(child: Text("You have no address yet"),) :
                          Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(bottom: 10),

                          padding: EdgeInsets.only(
                              top: 35, bottom: 35, left: 15, right: 15),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${state.add?.results![index].description}', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),

                                  SizedBox(height: 10,),

                                  InkWell(
                                    onTap: () {

                                    },
                                    child: InkWell(
                                        onTap: () async {
                                          var location = await Location()
                                              .getLocation();
                                          print("User current location");
                                          print(location.longitude);
                                          print(location.latitude);


                                          address = await Navigator.push(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return GoogleMapScreen(
                                                    positionlong: location
                                                        .longitude,
                                                    positionlat: location
                                                        .latitude,
                                                  );
                                                },));

                                          setState(() {
                                            print("Got Address back");
                                            print(address);
                                          });
                                        },
                                        child: Text('Edit', style: TextStyle(
                                            fontSize: 12.8
                                        ),)),
                                  )
                                ],
                              ),



                              Text('${state.add?.results![index].street}', style: TextStyle(
                                  fontSize: 12.8,
                                  color: Colors.grey
                              ),)


                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5)
                          ),
                        );
                      },);
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(

                      ),
                    );
                  }
                },
              ))


              //TODO Payment


              //TODO product row

            ],
          ),
        ),
      ),


    );
  }

// PopUpColor(BuildContext context) {
//   showDialog(context: context, builder: (context) {
//     return AlertDialog(
//       content: Column(
//         children: [
//           Text('Choose Color'),
//           CheckboxListTile(
//             title: Text('Red'),
//             value: _isChecked ,
//             onChanged: (value) {
//               setState(() {
//
//                 _isChecked = value!;
//
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   },);
//
//
// }
}
