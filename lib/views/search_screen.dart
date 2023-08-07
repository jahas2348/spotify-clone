import 'package:flutter/material.dart';
import 'package:spotify_clone/models/search_grid_category.dart';
import 'package:spotify_clone/views/search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.camera_alt_outlined, size: 24),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //Search Box
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultsScreen(),));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                       
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'What do you want to listen to?',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        
              //Grid View
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Browse all',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //gridview builder here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1 / .55,
                  ),
                  children: [
                    SearchGridItemWidget(
                      title: 'Podcasts',
                      assetImage: 'assets/images/cover-image-2.jpeg',
                      bgColor: Color(0xFFE13300),
                    ),
                    SearchGridItemWidget(
                      title: 'Live Events',
                      assetImage: 'assets/images/cover-image-3.jpeg',
                      bgColor: Color(0xFF7358FF),
                    ),
                    SearchGridItemWidget(
                      title: 'Made For You',
                      assetImage: 'assets/images/cover-image-4.jpeg',
                      bgColor: Color(0xFF1E3264),
                    ),
                    SearchGridItemWidget(
                      title: 'New Releases',
                      assetImage: 'assets/images/cover-image-2.jpeg',
                      bgColor: Color(0xFFE8125C),
                    ),
                    SearchGridItemWidget(
                      title: 'Hindi',
                      assetImage: 'assets/images/cover-image-3.jpeg',
                      bgColor: Color(0xFFE9142A),
                    ),
                    SearchGridItemWidget(
                      title: 'Punjabi',
                      assetImage: 'assets/images/cover-image-4.jpeg',
                      bgColor: Color(0xFFB02897),
                    ),
                    // Add more GridItemWidgets for additional items if needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
