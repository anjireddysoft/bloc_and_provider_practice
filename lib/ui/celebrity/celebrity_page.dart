import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_practice/bloc/favourates/favourates_bloc.dart';
import 'package:ui_practice/repository/favouraties_repository.dart';
import 'package:ui_practice/ui/celebrity/celebrity_screen.dart';

import 'celebrity_screenbloc.dart';

class CelebrityPage extends StatefulWidget {
  const CelebrityPage({Key? key}) : super(key: key);

  @override
  _CelebrityPageState createState() => _CelebrityPageState();
}
class _CelebrityPageState extends State<CelebrityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FavouratesBloc(favouratiesRepository: FavouratiesRepository()),
        child: CelebrityForm(),
      ),
    );
  }
}
/*
Scaffold(
appBar: AppBar(
title: Text("Celebrity"),
leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
Navigator.push(
context, MaterialPageRoute(builder: (context) => Calendar()));
},),
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
child: StreamBuilder(
stream: celebrityBloc.getCelebrity,
builder: (BuildContext context,
    AsyncSnapshot<List<Info>> snapshot) {
//    print("snapshotData${snapshot.data!.info.toString()}");

if (!snapshot.hasData) {
return Container(
child: Center(child: CircularProgressIndicator()));
}
if (snapshot.hasError) {
print("Data error");
}
return ListView.builder(
// controller: controller,
itemCount: snapshot.data!.length,
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
    .width * 0.7,
child: GestureDetector(
onTap: () {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
content: Text(
"Are you sure you want to delete"),
title: Text("Delete Clelebrity"),
actions: [
FlatButton(
onPressed: () {
Navigator.pop(context);
},
child: Text("No")),
MaterialButton(
onPressed: () {
setState(() {
snapshot.data!
    .removeAt(index);
});

Navigator.pop(context);
},
child: Text("Yes"))
],
);
});
},
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
snapshot
    .data![index].profilePic
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
"${snapshot
    .data![index]
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
"${snapshot.data![index]
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
snapshot
    .data![
index]
    .livePhotoSelfiesCount
    .toString(),
style: TextStyle(
fontSize:
16,
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
snapshot
    .data![
index]
    .livePhotoSelfiesCount
    .toString(),
style: TextStyle(
fontSize:
16,
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
snapshot
    .data![
index]
    .videoMessagesCount
    .toString(),
style: TextStyle(
fontSize:
16,
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
children: [
Icon(Icons
    .camera_alt_outlined),
SizedBox(
width: 5,
),
Text(
snapshot
    .data![
index]
    .liveVideosCount
    .toString(),
style: TextStyle(
fontSize:
16,
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
onPressed: () {},
icon: Icon(
Icons.favorite,
color: Colors.red,
)),
Text(
snapshot.data![index].favs
    .toString(),
style: TextStyle(
color: Colors.red,
fontSize: 20,
fontWeight:
FontWeight.bold),
)
],
))
],
),
),
),
(snapshot.data!.length == 1)
? Container(
height: 50,
child: CircularProgressIndicator(),
)
    : Container()
],
);
});
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
child: StreamBuilder(
stream: celebrityBloc.getCelebrity,
builder: (BuildContext context,
    AsyncSnapshot<List<Info>> snapshot) {
if (!snapshot.hasData) {
return Center(child: CircularProgressIndicator());
}
if (snapshot.hasError) {
print("Data error");
}
return ListView.builder(
controller: controller,
itemCount: snapshot.data!.length,
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
borderRadius: BorderRadius.only(
topLeft: Radius.circular(
15),
topRight:
Radius.circular(15)),
child: Image.network(
snapshot.data![index]
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
top: 15,),
Positioned(child: Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Row(
children: [
Text(
"${snapshot.data![index]
    .username}",

style: TextStyle(
fontSize: 16,
color: Color(0xffd9ddd6),
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
"${snapshot.data![index]
    .categoriesOfCelebrity.join(
",")}",
overflow:
TextOverflow.ellipsis,
style: TextStyle(
color:
Color(0xff6b6b6b),
fontWeight:
FontWeight.bold),
),
],
),
), bottom: 5, left: 5, right: 5,)
],
),
),
index == snapshot.data!.length - 1 &&
celebrityBloc.isLoading == true
? Container(
height: 50,
width: 50,
child: CircularProgressIndicator(),
)
    : Container()
],
);
});
}),
),
],
),
),
),
)*/
