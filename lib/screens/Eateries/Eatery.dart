// class Eatery {
//   String _name;
//   String _address;
//   double _latitude;
//   double _longitude;
//   double _distanceFromUser;
//   Eatery(
//       {String name,
//       String address,
//       double latitude,
//       double longitude,
//       double distanceFromUser}) {
//     _name = name;
//     _address = address;
//     _latitude = latitude;
//     _longitude = longitude;
//     _distanceFromUser = distanceFromUser;
//   }
//   // getters
//   String get name => _name;
//   String get address => _address;
//   double get latitude => _latitude;
//   double get longitude => _longitude;
//   double get distanceFromUser => _distanceFromUser;
// }

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Eatery {
  String name;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;
  // int distancefromuser;

  Eatery(
      {this.name,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords
      // this.distancefromuser
      });
}

final List<Eatery> healthyEateries = [
  Eatery(
      name: 'Pasta Express',
      address: 'NTU North Spine',
      description: 'Pasta Parlour',
      locationCoords: LatLng(1.3558659321699835, 103.67957206122709),
      thumbNail:
          'https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/4-CZJTRFUVVYMBR6/hero/eef5b5223b4e47fe826903cc14131ae1_1591598479662885781.jpeg'),
  Eatery(
      name: 'The Crowded Bowl',
      address: 'NTU North Spine',
      description: 'All-day American Salad',
      locationCoords: LatLng(1.3484483780466714, 103.68034961859597),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Eatery(
      name: 'Mr Bean',
      address: 'NTU North Spine',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: LatLng(1.344632016183897, 103.68045290273511),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Eatery(
      name: 'Hi-Collar',
      address: '214 E 10th St',
      description:
          'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
      locationCoords: LatLng(40.729515, -73.985927),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Eatery(
      name: 'Everyman Espresso',
      address: '301 W Broadway',
      description:
          'Compact coffee & espresso bar turning out drinks made from direct-trade beans in a low-key setting.',
      locationCoords: LatLng(40.721622, -74.004308),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no')
];
