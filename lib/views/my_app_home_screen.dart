import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_ease/utilities/constants.dart';
import 'package:cook_ease/widget/banner.dart';
import 'package:cook_ease/widget/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAppHomeScreen extends StatefulWidget {
  const MyAppHomeScreen({super.key});

  @override
  State<MyAppHomeScreen> createState() => _MyAppHomeScreenState();
}

class _MyAppHomeScreenState extends State<MyAppHomeScreen> {
    final CollectionReference  categoriesItems = FirebaseFirestore.instance.collection("App-Category");
    String category = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerParts(),
                    mySearchBar(),
                    // fot the banner
                    const BannerToExplore(),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,),
                        child: Text(
                          "categories",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ) ,
                        ),
                        ),
                        // for the categories
                        StreamBuilder(
                          stream: categoriesItems.snapshots(),
                         builder: (context,
                          AsyncSnapshot<QueryDocumentSnapshot> streamsnapshot)
                         {
                          if(streamsnapshot.hasData){
                            return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                streamsnapshot.data!.docs.length,,
                                 generator),
                              
                            );
                          }
                          return Center(
                            child: Column(
                              children:  [
                                CircularProgressIndicator(),
                             
                              ],
                            ),
                          )
                         }
                         )
                        
                  ],
                
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding mySearchBar() {
    return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Iconsax.search_normal),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Search for recipes",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )
                  );
  }

  Row headerParts() {
    return Row(
                    children: [
                      const Text("What are\nyou cooking today?",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                      
                      ),
                      const Spacer(),
                      MyIconButton(icon: Iconsax.notification, 
                      pressed: (){},
                      ),
                      
                    ],
                  );
  }
}