
import 'package:echo_booking_admin/core/constent/size.dart';
import 'package:flutter/material.dart';

class ImageFrameWidget extends StatelessWidget {
  final String image; 
  const ImageFrameWidget({super.key,required this.image});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                width: borderWidth),
            borderRadius: radius),
        child:ClipRRect(
                borderRadius: radius,
                child: Image.network(image,fit: BoxFit.cover,),
              
                )
           
      ),
    );
  }
}
