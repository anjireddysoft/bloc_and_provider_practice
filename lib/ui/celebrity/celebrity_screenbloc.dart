import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_practice/bloc/celebrity_bloc.dart';
import 'package:ui_practice/bloc/favourates/favourates_bloc.dart';
import 'package:ui_practice/bloc/favourates/favourates_event.dart';
import 'package:ui_practice/bloc/favourates/favourates_state.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/repository/favouraties_repository.dart';

import '../calendar_screen.dart';

class CelebrityForm extends StatefulWidget {
  const CelebrityForm({Key? key}) : super(key: key);

  @override
  CelebrityFormState createState() => CelebrityFormState();
}

class CelebrityFormState extends State<CelebrityForm> {
  // CelebrityBloc celebrityBloc = CelebrityBloc();
  List<Info> info_List = <Info>[];
  String? categery;
  ScrollController controller = ScrollController();
  FavouratesBloc favouratesBloc =
  FavouratesBloc(favouratiesRepository: FavouratiesRepository());
  int page = 1;
  bool isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    // celebrityBloc.getClebrityDataList(page);
    favouratesBloc = BlocProvider.of<FavouratesBloc>(context);
    BlocProvider.of<FavouratesBloc>(context).add(CelebrityEvent(page: page));


    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        setState(() {
          page = page + 1;

          print("page${page}");
        });
        //  celebrityBloc.getClebrityDataList(page);
        BlocProvider.of<FavouratesBloc>(context)
            .add(CelebrityEvent(page: page));
      } else {}
    });
    super.initState();
  }

  List<Info> infoList = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouratesBloc, FavouratesState>(
      listener: (BuildContext context, FavouratesState state) {
        if (state is FavouratesLoadingState) {
          print("FavouratesLoadingState");
          Container(child: Center(child: CircularProgressIndicator()));
        } else if (state is FavouratesSuccessState) {
          print("FavouratesSuccessState");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.1,
                      child: Center(
                          child: Text(
                            "${state.favouratiesModel.message}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ))),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        } else if (state is FavouratesFailureState) {
          print("FavouratesFailureState");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.1,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Center(
                          child: Text(
                            "${state.errorMessage}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ))),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        }
      },
      child: BlocBuilder<FavouratesBloc, FavouratesState>(
        builder: (context, FavouratesState state) {
          if (state is CelebrityLoadingState) {
            print("CelebrityLoadingState");
            Container(child: Center(child: CircularProgressIndicator()),);
          }
          if (state is CelebritySuccessState) {
            print("CelebritySuccessState");
            infoList = state.celebrityModel;
          }
          return Scaffold(
            appBar: AppBar(
              title: isSearching == true ? TextField(
                /*  onSubmitted: (value){
                  setState(() {
                      isSearching=false;
                    });
                  searchController.clear();
                },*/
                style: TextStyle(color: Colors.white),
                controller: searchController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(

                  hintText: 'Search your trips',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.cancel_outlined, color: Colors.black,),
                    onPressed: () {
                      searchController.clear();
                      BlocProvider.of<FavouratesBloc>(context).add(CelebrityEvent(page: page));
                    }
                    ,),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
                onChanged: (value) {
                  BlocProvider.of<FavouratesBloc>(context).add(
                      SearchEvent(serchQuery: value));
                },
              ) : Text(
                "Celebrity Screen with BLoc", style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,

              actions: [
                isSearching == false ? IconButton(
                  icon: Icon(Icons.search), onPressed: () {
                  if (isSearching == false) {
                    setState(() {
                      isSearching = true;
                    });
                  } else {
                    setState(() {
                      isSearching = false;
                    });
                  }
                }, color: Colors.grey,) : Container(),
                isSearching == false ? IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                  color: Colors.grey,) : Container(),

              ],
            ),

            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: ListView.builder(
// controller: controller,
                            itemCount: infoList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Container(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.7,
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Expanded(
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                elevation: 5,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                            Radius.circular(
                                                                15),
                                                            topRight:
                                                            Radius.circular(
                                                                15)),
                                                        child: Image.network(
                                                          infoList[index]
                                                              .profilePic
                                                              .toString(),
                                                          width:
                                                          MediaQuery
                                                              .of(context)
                                                              .size
                                                              .width,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${infoList[index]
                                                                    .username}",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    color: Color(
                                                                        0xff000000),
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(
                                                            "${infoList[index]
                                                                .categoriesOfCelebrity
                                                                .join(",")}",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                Color(0xffc2c2c2),
                                                                fontWeight:
                                                                FontWeight.bold),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          IntrinsicHeight(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .camera_alt_outlined,
                                                                          color: Color(
                                                                              0xff3d3d3d),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                            infoList[
                                                                            index]
                                                                                .livePhotoSelfiesCount
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                12,
                                                                                fontWeight: FontWeight
                                                                                    .bold,
                                                                                color:
                                                                                Color(
                                                                                    0xffb14159)))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                VerticalDivider(
                                                                  thickness: 1,
                                                                  color: Colors.black,
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .photo_library),
                                                                        SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                            infoList[
                                                                            index]
                                                                                .livePhotoSelfiesCount
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                12,
                                                                                fontWeight: FontWeight
                                                                                    .bold,
                                                                                color:
                                                                                Color(
                                                                                    0xffb14159)))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                VerticalDivider(
                                                                  thickness: 1,
                                                                  color: Colors.black,
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .videocam),
                                                                        SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                            infoList[
                                                                            index]
                                                                                .videoMessagesCount
                                                                                .toString(),
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                12,
                                                                                fontWeight: FontWeight
                                                                                    .bold,
                                                                                color:
                                                                                Color(
                                                                                    0xffb14159)))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                VerticalDivider(
                                                                  thickness: 1,
                                                                  color: Colors.black,
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .camera_alt_outlined),
                                                                      SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Text(
                                                                        infoList[
                                                                        index]
                                                                            .liveVideosCount
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            12,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                            color: Color(
                                                                                0xffb14159)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            bottom: 120,
                                            right: 20,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                          FavouratesBloc>(
                                                          context)
                                                          .add(
                                                        FavouratesButtonPressed(
                                                            celebrity_Id:
                                                            infoList[
                                                            index]
                                                                .userId
                                                                .toString(),),
                                                      );
                                                      setState(() {
                                                        BlocProvider.of<
                                                            FavouratesBloc>(
                                                            context).add(
                                                            CelebrityEvent(
                                                                page: page));
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )),
                                                Text(
                                                  infoList[index]
                                                      .favs
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  /*(infoList.length == 1)
                                      ? Container(
                                    height: 50,
                                    child: CircularProgressIndicator(),
                                  )
                                      : Container()*/
                                ],
                              );
                            })),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Recomended",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.3,
                        child: ListView.builder(
                            controller: controller,
                            itemCount: infoList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return Row(
                                children: [
                                  Container(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width / 2,
                                    child: Stack(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          elevation: 5,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          15),
                                                      topRight:
                                                      Radius.circular(
                                                          15)),
                                                  child: Image.network(
                                                    infoList[index]
                                                        .profilePic
                                                        .toString(),
                                                    width:
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width /
                                                        2,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          child: CircleAvatar(
                                            radius: 15,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            backgroundColor: Colors.white,
                                          ),
                                          right: 15,
                                          top: 15,
                                        ),
                                        Positioned(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${infoList[index]
                                                          .username}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                          Color(0xffd9ddd6),
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  "${infoList[index]
                                                      .categoriesOfCelebrity
                                                      .join(",")}",
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color(0xff6b6b6b),
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          bottom: 5,
                                          left: 5,
                                          right: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                  index == infoList.length - 1 &&
                                      favouratesBloc.isLoading == true
                                      ? Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(),
                                  )
                                      : Container()
                                ],
                              );
                            })),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
