
import 'package:ecommerce/helper/GoogleLocation.dart';
import 'package:ecommerce/model/Address.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/products/address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../client/NavScreen.dart';
import '../../widget/Product/CustomButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GoogleMapScreen extends StatefulWidget {
  var positionlat;
  var positionlong;
  GoogleMapScreen({Key? key,this.positionlat,this.positionlong}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  LocationHelper locationhelper = LocationHelper();
  var userinput = TextEditingController();
 var long;
 var lat;
var mapofaddress;

var homeadd;
var city;
var country;
var userid;
Map<String?,dynamic > googleaddress = {};



  GoogleMapController? mapController;



  Newmarker(LatLng argument,BuildContext context) {
    print(argument);
    setState((){

      SendLatandLong(argument.latitude,argument.longitude);
      lat =argument.latitude;
      long = argument.longitude;

      

    });


  }
  SendLatandLong(lat,long)  async{
    mapofaddress = await locationhelper.getPlaceWithLatLng( lat,long);
  setState(() {
    print('call');

    print(mapofaddress[5]["address_components"][5]["long_name"]);
    homeadd = mapofaddress[0]['formatted_address'];
    print(mapofaddress[0]["address_components"][6]["long_name"]);
    country = mapofaddress[0]["address_components"][6]["long_name"];
    city = mapofaddress[5]["address_components"][5]["long_name"];


    print("Position loong ${widget.positionlong}");
    print("Position lat ${widget.positionlat}");
  });
  }
  Future<void> currentUserLocation () async {
    var location = await Location().getLocation();
    print("User current location");
    print(location.longitude);
    print(location.latitude);

    widget.positionlong = location.longitude;
    widget.positionlat = location.latitude;


  }
  @override
  void initState() {
    // TODO: implement initState
  checkuserinstance();
    super.initState();

  }






  Widget build(BuildContext context) {
    // TODO: implement build

    print('Called Build');


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),

        title: Row(
          children: [
            Expanded(
              child: TextField(


                onTap: () {

                },
                controller: userinput,
                onSubmitted: (value) async {
                  setState(() {
                    userinput.text = value;

                  });
               var placeid =    await locationhelper.getPlaceId( userinput.text ) ;
               //todo get the place id


                  //TODO now it time ot submit that place id to get the detail
               print(placeid);
                var map = await locationhelper.getPlaceDetail(placeid) as Map<String,dynamic>;
                print(map);
                var address= map['formatted_address'];
               // positionlong = map['geometry']['location']['lat'];
               //  positionlat =map['geometry']['location']['lng'];

                print(address);
                setState(() {
                  var address= map['formatted_address'];
                  widget.positionlong = map['geometry']['location']['lng'];
                  widget.positionlat =map['geometry']['location']['lat'];
                  print(address);
                  print('long: ${widget.positionlong}');
                  print('lat: ${widget.positionlat }');
                  mapController?.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(    target:LatLng(widget.positionlat, widget.positionlong ),

                        zoom: 17


                      )));
                });

                },
                style: TextStyle(
                  fontSize: 12.8
                ),

                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_rounded,color: Colors.black,),
                  hintText: 'Search place',


                  contentPadding: EdgeInsets.all(6),

                  filled: true,
                  fillColor: Color(0xffF1F1F1),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

                ),

              ),
            ),
          ],
        ),
      ),
      body:     Column(
        children: [
          Expanded(
            child: GoogleMap(
              onTap:(argument) {
                setState(() {
                  Newmarker(argument,context);
                });


              },


              initialCameraPosition:CameraPosition(
                target:LatLng(widget.positionlat ?? 0 , widget.positionlong ?? 0 ),
                zoom: 17,





              ),
              myLocationEnabled: true,
              compassEnabled: false,
              myLocationButtonEnabled: false,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,

              onMapCreated: (controller) async {
                setState(() {
                  mapController = controller;
                });

              },
              markers: {
             if(lat != null)
                Marker(
                    markerId: MarkerId('Marker 1'),

                    position: LatLng(lat ??11.593430164361337 , long ?? 104.8149532927308)
                ),
              },


            ),
          ),

          Card(
            child: Container(
              height: 230,
              padding: EdgeInsets.all(10),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text('Address Detail',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                  Container(
                    padding: EdgeInsets.all(10),
                    

                    child: ListTile(
                     title:    Text('${        homeadd  ?? 'No Address pick yet'} ',style: TextStyle(
    fontSize: 12.8,
    color: Colors.grey
    ),),
                      leading: Image.asset('assets/logo/Location.png',fit: BoxFit.cover,width: 50,height: 50,),
    ),
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5)
                    ),
                  ),

                  ElevatedButton(


                  onPressed: () {

                    //TODO bloc address put
                    print("Sending Post Address");
                    BlocProvider.of<AddressBloc>( context,listen: false).add(PostAddress(
                      add: AddressBody(
                        city: city,
                        country: country,
                        lat: widget.positionlat,
                        lon: widget.positionlong,
                        street: homeadd,


                      ),
                      userid:userid
                    ));
                    print(userid);


                    Navigator.pop(context,{
                      "homeadd":homeadd,
                      "country":country,
                      "city":city,
                      "lat":widget.positionlat,

                      "lon":widget.positionlong
                    });

                  },
    style: ElevatedButton.styleFrom(
    backgroundColor:Colors.black,
    elevation: 0,
    padding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.black.withOpacity(0.14)),
    borderRadius: BorderRadius.circular(3)
    )
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    SizedBox(width: 10,),
    Text("Comfirm",style: TextStyle(
    fontSize: 12.8,

    ),)
    ],
    ))
                ],
              ),
            ),
          ),



        ],
      ),


    );

  }

  void checkuserinstance() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();


    userid = prefs!.getInt("userid");
  }
}
