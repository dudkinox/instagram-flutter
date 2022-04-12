import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  List<String> name;
  Search({Key? key, required this.name}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  List<String> listName = [];
  List<String> searchResults = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.name.length; i++) {
      listName.add(widget.name[i]);
    }
  }

  void searchName(String searchText) {
    setState(() {
      searchResults.clear();
    });

    for (int i = 0; i < listName.length; i++) {
      print("list name: " + listName[i]);
      String data = listName[i];
      print("data: " + data.toLowerCase());
      print("searchText: " + searchText.toLowerCase());
      if (data.toLowerCase().contains(searchText.toLowerCase())) {
        setState(() {
          searchResults.add(data);
        });
      }
      print("suggest: " + searchResults[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.search, color: Colors.white),
        title: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                setState(() {
                  controller.clear();
                });
              },
            ),
          ),
          onChanged: (value) {
            searchName(controller.text);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // for (int i = 0; i < searchResults.length; i++)
          // getName(context, searchResults),
          searchResults.length != 0 || controller.text.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text(searchResults[index]));
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: listName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text(listName[index]));
                  },
                )
        ],
      ),
    );
  }

  // Widget getName(BuildContext context, List<String> name) {
  //   return container.text.isNotEmpty() || name.length != 0
  //       ? new ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: name.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return new ListTile(title: new Text(name[index]));
  //           },
  //         )
  //       : Container();
  // GestureDetector(
  //     onTap: () {
  //       print(name);
  //     },
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(8.0),
  //           margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
  //           child: Text(
  //             name,
  //             style: const TextStyle(color: Colors.black, fontSize: 16),
  //           ),
  //         ),
  //         Container(
  //           height: 0.5,
  //           width: MediaQuery.of(context).size.width,
  //           color: Colors.grey.withOpacity(0.3),
  //           margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
  //         ),
  //       ],
  //     ),
  //   )
  //   ;
  // }
}

// class Searchx extends StatelessWidget {
//   List<String> name;
//   Searchx({Key? key, required this.name}) : super(key: key);
//   TextEditingController controller = TextEditingController();
//   List<String> searchResults = [];

//   void searchName(String searchText) {
//     searchResults.clear();
//     for (int i = 0; i < name.length; i++) {
//       String data = name[i];
//       if (data.toLowerCase().contains(searchText.toLowerCase())) {
//         searchResults.add(data);
//       }
//       print(searchResults[i]);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Icon(Icons.search, color: Colors.white),
//         title: TextField(
//           controller: controller,
//           keyboardType: TextInputType.text,
//           style: TextStyle(color: Colors.white, fontSize: 18),
//           decoration: InputDecoration(
//             hintText: "Search",
//             border: InputBorder.none,
//             hintStyle: TextStyle(color: Colors.white),
//             suffixIcon: IconButton(
//               icon: Icon(Icons.close, color: Colors.white),
//               onPressed: () {
//                 controller.clear();
//               },
//             ),
//           ),
//           onChanged: (value) {
//             print(value);
//             setState(() {
//               searchName(value);
//             });
            
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           for (int i = 0; i < searchResults.length; i++)
//             getName(context, searchResults[i]),
//         ],
//       ),
//     );
//   }

//   Widget getName(BuildContext context, String name) {
//     return name.isEmpty || name.length != 0
//         ? Container()
//         : GestureDetector(
//             onTap: () {
//               print(name);
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
//                   child: Text(
//                     name,
//                     style: const TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ),
//                 Container(
//                   height: 0.5,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.grey.withOpacity(0.3),
//                   margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
//                 ),
//               ],
//             ),
//           );
//   }
// }
