import 'package:flutter/material.dart';
import 'package:spotify_clone/infrastructure/base_client.dart';


class SearchResultsScreen extends StatefulWidget {
  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  TextEditingController _searchController = TextEditingController();
  List<SpotifySearchTrack> _searchResults = [];

  void _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    try {
      final apiUrl = 'https://api.spotify.com/v1/search?q=$query&type=track&limit=50';
      List<SpotifySearchTrack> searchResults = await SpotifyApiService.searchItems(apiUrl);
      setState(() {
        _searchResults = searchResults;
      });
    } catch (e) {
      print('Error searching tracks: $e');
      // Handle the error or show a message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282828),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            hintText: 'What do you want to listen to?',
            border: InputBorder.none,
          ),
          onChanged: _performSearch,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _searchController.clear();
              setState(() {
                _searchResults = [];
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Expanded(child: _buildSearchResults()),
      ),
    );
  }

  Widget _buildSearchResults() {
  if (_searchResults.isEmpty) {
    return Text('Your search results will appear here.');
  } else {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final SpotifySearchTrack track = _searchResults[index];
          return ListTile(
            
            leading: Image.network(track.coverImageUrl),
            title: Text(track.name),
            subtitle: Text(track.artist),
            // Other details for the track...
          );
        },
      ),
    );
  }
}

}
