import 'package:carvendor/constants.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';


class FreelancerCard extends StatelessWidget {
  final Color? color;
  final String? name;
  final String? description;
  final double? rating;
  final int? comments;
  final ImageProvider<dynamic>? image;

  const FreelancerCard({
    this.color,
    this.name,
    this.description,
    this.rating,
    this.comments,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child:
      ExpansionTileCard(
       elevation: 5,
        initialElevation: 5,
        initiallyExpanded: false,
        trailing:
           Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
            size: 24,
          ),
      baseColor: Color(0xfff2f2f2),
      expandedColor: Color(0xfff2f2f2),
      title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: [
            GestureDetector(
              onTap: () {
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );*/
              },
              child:
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            // Border radius
            child:
            ClipOval(child: Image(image: image as ImageProvider)),
          )),
         /* SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             *//* FaIcon(
                FontAwesomeIcons.star,
                color: kSmallDescColor,
                size: 15,
              ),*//*
              SizedBox(
                width: 5,
              ),
              Text(rating.toString(), style: kMediumDescStyle),
              ]),
          SizedBox(height: 5),
          Text('1000 total user', style: kMediumDescStyle),
            SizedBox(height: 5),*/


        ],),
        Expanded(
            child:
                Padding(
                  padding: EdgeInsets.only(left: 5),
            child:
                Container(
                child:
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Suraj Chandravanshi', style: kLargeDescStyle),
              SizedBox(height: 10,),
              Row(children: [
                Icon(Icons.location_on_outlined,color: Colors.black,size: 16,),
                Expanded(
                    flex : 2,
                    child:
                    Text('Source', style: kLargeDescStyle)),
                Expanded(
                    child:
                    Text('Nagapur', style: kMediumDescStyle)),
              ],),
              SizedBox(height: 10,),
              Row(children: [
                Icon(Icons.location_on_outlined,color: Colors.black,size: 16,),
                Expanded(
                  flex : 2,
                    child:
                Text('Destination', style: kLargeDescStyle)),
                Expanded(
                    child:
                Text('Delhi', style: kMediumDescStyle)),
              ],),

              SizedBox(height: 10,),
              Row(children: [
                Icon(Icons.date_range,color: Colors.black,size: 16,),
                Expanded(
                    flex : 1,
                    child:
                    Text('10/09/2022', style: kLargeDescStyle)),
              ],),

              SizedBox(height: 10,),
              Row(children: [
                Icon(Icons.access_time_outlined,color: Colors.black,size: 16,),
                Expanded(
                    flex : 2,
                    child:
                    Text('10:10 PM', style: kLargeDescStyle)),
                Spacer(),
              ],),

            ]))))


      ])),
        children: [
          Padding(padding: EdgeInsets.all(10),
          child:
        Column(children: [
          Row(
            children: [
            Expanded(
                flex : 2,
                child:
                Text('No. of Days:', style: kLargeDescStyle)),
            Expanded(
                flex : 3,
                child:
                Text('5', style: kLargeDescStyle)),
          ],),

          SizedBox(height: 10,),
          Row(children: [
            Expanded(
                flex : 2,
                child:
                Text('Description:', style: kLargeDescStyle)),
            Expanded(
                flex : 3,
                child:
                Text('travel from this to this', style: kLargeDescStyle)),
          ],),

          SizedBox(height: 10,),
          Row(children: [
            Expanded(
                flex : 2,
                child:
                Text('No Of Passengers:', style: kLargeDescStyle)),
            Expanded(
                flex : 3,
                child:
                Text('50', style: kLargeDescStyle)),
          ],),

          SizedBox(height: 10,),



          SizedBox(height: 10,),
          Row(children: [
            Expanded(
                child:
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  color: Colors.amber,
                  shape: kShape,
                  onPressed: () {
                    /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DateAndTime(),
                      ),
                    );*/
                  },
                  child: const Text(
                    'Reject',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),),
            SizedBox(width: 10,),

            Expanded(
                child:
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  color: Colors.amber,
                  shape: kShape,
                  onPressed: () {
                    /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DateAndTime(),
                      ),
                    );*/
                  },
                  child: const Text(
                    'Accept',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),),
          ],),


          SizedBox(height: 10,),


        ]))


        ],


    ));

    /*Card(
      elevation: 5,
      color: color,
      shape: kShape,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: image,
                    height: 90.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: kSmallDescStyle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.star,
                        color: kSmallDescColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(rating.toString(), style: kSmallDescStyle),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.comment,
                        color: kSmallDescColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(comments.toString(), style: kSmallDescStyle)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.heart,
                      size: 40,
                      color: Colors.transparent,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      color: Colors.white,
                      shape: kShape,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DateAndTime(),
                          ),
                        );
                      },
                      child: const Text(
                        'Hire',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
