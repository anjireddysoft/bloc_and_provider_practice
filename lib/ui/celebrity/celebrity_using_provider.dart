import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/provider/celebrity_provider.dart';

class Celebrity_with_provider extends StatefulWidget {
  const Celebrity_with_provider({Key? key}) : super(key: key);

  @override
  _Celebrity_with_providerState createState() =>
      _Celebrity_with_providerState();
}

class _Celebrity_with_providerState extends State<Celebrity_with_provider> {
  int page = 1;
  List<Info> infoList = [];
  ScrollController controller = ScrollController();
  CelebrityProvider provider = CelebrityProvider();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CelebrityProvider>(context, listen: false).getCelebrityDataList(
        page);


    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        setState(() {
          page = page + 1;

          print("page${page}");
        });
        //  celebrityBloc.getClebrityDataList(page);
        Provider.of<CelebrityProvider>(context, listen: false)
            .getCelebrityDataList(page);
      } else {}
    });
    super.initState();
  }
bool  isSearching=false;
  @override
  Widget build(BuildContext context) {
    infoList = Provider
        .of<CelebrityProvider>(context)
        .getInfoList;
    print("celebrityList${infoList.length}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: isSearching == true ? TextField(

          style: TextStyle(color: Colors.white),
          controller: searchController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: 'Search your trips',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                searchController.clear();
                print(" searchController${searchController.text}");
                Provider.of<CelebrityProvider>(context,listen: false).searching(searchController.text);
              },
            ),
            filled: true,
            fillColor: Colors.grey,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.all(15),
          ),
          onChanged: (value) {
            print("anji");
            Provider.of<CelebrityProvider>(context, listen: false).searching(
                value);
            //  infoList   = Provider.of<CelebrityProvider>(context).getInfoList;
          },
        ):Text(
          "Celebrity Screen with provider", style: TextStyle(color: Colors.black),),
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.7,
                          child: Stack(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: Image.network(
                                          infoList[index].profilePic.toString(),
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
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${infoList[index].username}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff000000),
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
                                                .categoriesOfCelebrity.join(
                                                ",")}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xffc2c2c2),
                                                fontWeight: FontWeight.bold),
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
                                                          color:
                                                          Color(0xff3d3d3d),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                            infoList[index]
                                                                .livePhotoSelfiesCount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
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
                                                            infoList[index]
                                                                .livePhotoSelfiesCount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
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
                                                        Icon(Icons.videocam),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                            infoList[index]
                                                                .videoMessagesCount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
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
                                                      children: [
                                                        Icon(Icons
                                                            .camera_alt_outlined),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          infoList[index]
                                                              .liveVideosCount
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: Color(
                                                                  0xffb14159)),
                                                        )
                                                      ],
                                                    ),
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
                              Positioned(
                                  bottom: 120,
                                  right: 20,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: ()async {
                                            Provider.of<CelebrityProvider>(
                                                context, listen: false)
                                                .addFavourates(
                                                 infoList[index].userId.toString(),context);

                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )),
                                      Text(
                                        infoList[index].favs.toString(),
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
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
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recomended",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                          child: Image.network(
                                            infoList[index]
                                                .profilePic
                                                .toString(),
                                            width: MediaQuery
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
                                              "${infoList[index].username}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xffd9ddd6),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${infoList[index]
                                              .categoriesOfCelebrity.join(
                                              ",")}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xff6b6b6b),
                                              fontWeight: FontWeight.bold),
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
                              context
                                  .watch<CelebrityProvider>()
                                  .isLoading ==
                                  true
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
    );
  }
}
