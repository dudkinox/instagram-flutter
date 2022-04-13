import 'package:flutter/material.dart';

import '../../components/Loading.dart';
import '../account/account_page.dart';

class Search extends StatefulWidget {
  List<String> name;
  List<String> image;
  List<String> id;
  List<String> email;
  Search(
      {Key? key,
      required this.name,
      required this.image,
      required this.id,
      required this.email})
      : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  List<String> searchResults = [];
  List<String> searchResultsImage = [];
  List<String> searchResultsID = [];
  List<String> searchResultsEmail = [];
  bool isSearching = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void searchName(String searchText) {
    setState(() {
      searchResults.clear();
      searchResultsImage.clear();
      searchResultsID.clear();
      searchResultsEmail.clear();
    });

    for (int i = 0; i < widget.name.length; i++) {
      String name = widget.name[i];
      String image = widget.image[i];
      String id = widget.id[i];
      String email = widget.email[i];
      if (name.toLowerCase().contains(searchText.toLowerCase())) {
        setState(() {
          searchResults.add(name);
          searchResultsImage.add(image);
          searchResultsID.add(id);
          searchResultsEmail.add(email);
        });
      }
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
                  Navigator.pop(context);
                });
              },
            ),
          ),
          onChanged: (value) {
            if (controller.text == "") {
              setState(() {
                searchResults.clear();
                searchResultsImage.clear();
                isSearching = false;
              });
            } else {
              searchName(controller.text);
              isSearching = true;
            }
          },
        ),
      ),
      body: !isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < searchResults.length; i++)
                  getName(context, searchResultsID[i], searchResults[i],
                      searchResultsImage[i], searchResultsEmail[i]),

                // getName(context, searchResults[i]),
              ],
            )
          : Center(
              child: LoadingCircle(),
            ),
    );
  }

  Widget getName(BuildContext context, String id, String name, String image,
      String email) {
    return controller.text.isNotEmpty || controller.text != ""
        ? Visibility(
            visible: isSearching,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountPage(
                            id: id, name: name, image: image, email: email, me: false)));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 16, backgroundImage: NetworkImage(image)),
                        const SizedBox(width: 8),
                        Text(
                          name,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.3),
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
