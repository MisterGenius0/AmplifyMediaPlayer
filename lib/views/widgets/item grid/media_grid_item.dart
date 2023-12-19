import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amplify/controllers/providers/amplifying_color_provider.dart';
import 'package:amplify/views/widgets/amplifying_menu_widget.dart';

class MediaGridItem extends StatefulWidget {
  const MediaGridItem({super.key, required this.name, required this.mainOnPress, required this.contextMenuOnPress, this.images, required this.subtext, });

 final String name;
 final String subtext;

 final List<ImageProvider>? images;

  final Function mainOnPress;

  final Function contextMenuOnPress;

  @override
  State<MediaGridItem> createState() => _MediaGridItemState();
}

class _MediaGridItemState extends State<MediaGridItem> {

  bool FillSquare = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: AspectRatio(
            aspectRatio: 1/1,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        width: 9,
                        style: BorderStyle.solid,
                        color: context.watch<ColorProvider>().amplifyingColor.accentLighterColor
                    )
                ),
                color:   FillSquare == true ?widget.images != null && widget.images!.length >= 4?  context.watch<ColorProvider>().amplifyingColor.accentLighterColor : context
                    .watch<ColorProvider>()
                    .amplifyingColor
                    .backgroundDarkerColor  : widget.images != null && widget.images!.length == 4?  context.watch<ColorProvider>().amplifyingColor.accentLighterColor : context
                    .watch<ColorProvider>()
                    .amplifyingColor
                    .backgroundDarkerColor ,
                        child: TextButton(
                          clipBehavior: Clip.antiAlias,
                          onPressed: (){widget.mainOnPress();},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              //TODO clean up the null check, have one null check or empty check and have default to be icon dont null check every time

                              if(FillSquare == false && (widget.images != null && widget.images!.length >= 2))
                                widget.images!.isNotEmpty  ? Expanded(child: GridView.count(physics: const NeverScrollableScrollPhysics(), crossAxisCount:  2, children: [
                                  Image(image: widget.images![0], fit: BoxFit.fitHeight,),
                                  if(widget.images != null && widget.images!.length >= 2 && FillSquare == false)
                                    Image(image: widget.images![1], fit: BoxFit.fitHeight,),
                                  if(widget.images != null && widget.images!.length >= 3 && FillSquare == false)
                                  Image(image:  widget.images![2], fit: BoxFit.fitHeight,),
                                  if(widget.images != null && widget.images!.length >= 4 && FillSquare == false)
                                    Image(image:  widget.images![3], fit: BoxFit.fitHeight,),
                                  // Image(image:  widget.images![3], fit: BoxFit.fill,),
                                ],),) : Container(),


                              if(FillSquare == false && (widget.images != null && widget.images!.length == 1))
                                widget.images!.isNotEmpty && (widget.images != null && widget.images!.length <= 1)  ? Expanded(child: Image(image: widget.images![0], fit: BoxFit.cover,),) :
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: IconButton(
                                    onPressed: ()=>{widget.mainOnPress()},
                                    icon:  SizedBox.expand(
                                      child: Icon(Icons.library_music,
                                          color: context
                                              .watch<ColorProvider>()
                                              .amplifyingColor
                                              .accentColor),
                                    ),
                                  ),
                                ),

                              if(FillSquare == true && (widget.images != null && widget.images!.length >= 4))
                                widget.images!.isNotEmpty  ? Expanded(child: GridView.count( physics: const NeverScrollableScrollPhysics(), crossAxisCount:  2, children: [
                                  Image(image: widget.images![0], fit: BoxFit.fitHeight,),
                                  Image(image: widget.images![1], fit: BoxFit.fitHeight,),
                                   Image(image:  widget.images![2], fit: BoxFit.fitHeight,),
                                   Image(image:  widget.images![3], fit: BoxFit.fitHeight,),
                                ],),) : Container(),

                              if(FillSquare == true && (widget.images != null && widget.images!.length < 4))
                                widget.images!.isNotEmpty && (widget.images != null && widget.images!.length < 4)  ? Expanded(child: Image(image: widget.images![0], fit: BoxFit.fill,),) :
                                      FittedBox(
                                        fit: BoxFit.fill,
                                        child: IconButton(
                                          onPressed: ()=>{widget.mainOnPress()},
                                          icon:  SizedBox.expand(
                                            child: Icon(Icons.library_music,
                                                color: context
                                                    .watch<ColorProvider>()
                                                    .amplifyingColor
                                                    .accentColor),
                                          ),
                                        ),
                                      ),

                              if(FillSquare == false && (widget.images != null && widget.images!.length < 1))
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: IconButton(
                                    onPressed: ()=>{widget.mainOnPress()},
                                    icon:  SizedBox.expand(
                                      child: Icon(Icons.library_music,
                                          color: context
                                              .watch<ColorProvider>()
                                              .amplifyingColor
                                              .accentColor),
                                    ),
                                  ),
                                ),

                              if(widget.images == null)
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: IconButton(
                                    onPressed: ()=>{widget.mainOnPress()},
                                    icon:  SizedBox.expand(
                                      child: Icon(Icons.library_music,
                                          color: context
                                              .watch<ColorProvider>()
                                              .amplifyingColor
                                              .accentColor),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                        )),
          ),
        // Flexible(
        //   flex: 1,
        //   child: Center(
        //     child: AmplifyingMenuItem(
        //         onPressed: ()=>{widget.contextMenuOnPress()},
        //         icon: Icons.menu,
        //         preWidgetSpacer: const SizedBox(),
        //         postWidgetSpacer: const SizedBox()),
        //   ),
        // ),
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.fill,
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              onPressed: () { widget.contextMenuOnPress(); },
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(widget.name,
                    style: TextStyle(
                        color: context
                            .watch<ColorProvider>()
                            .amplifyingColor
                            .whiteColor)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
