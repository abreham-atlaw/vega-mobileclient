


import 'package:flutter/cupertino.dart';

class WidthSizedHeightContainer extends StatelessWidget{

  final Widget child;
  final double width;

  const WidthSizedHeightContainer({
    required this.child,
    required this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: width,
     child: LayoutBuilder(
       builder: (BuildContext context, BoxConstraints constraints){
         return SizedBox(
           height: constraints.maxWidth,
           width: constraints.maxWidth,
           child: child,
         );
       },
     ),
   );
  }



}