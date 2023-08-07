class SPotifyPodcast {
  final String podCastcoverImagePath;
  final String podCasttitle;
  final String podCastsubtitle;
  final String podCastdescription;
  final String podCastDate;

  SPotifyPodcast(
      this.podCastcoverImagePath,
      this.podCasttitle,
      this.podCastsubtitle,
      this.podCastdescription,
      this.podCastDate,
  );

  factory SPotifyPodcast.fromJsonForPodcast(Map<String, dynamic> json) {
    final artists = json['artists'] as List<dynamic>;
    final artistName = artists.isNotEmpty ? artists[0]['name'] as String : '';
    final images = json['images'] as List<dynamic>?;
    final coverImagePath = images != null && images.isNotEmpty
        ? images[0]['url'] as String
        : 'default_cover_image_url';

    // final genresList = json['genres'] as List<dynamic>?; // Handle the genres list
    // final genres = genresList?.cast<String>().join(', ') ?? 'Unknown'; // Convert list to a string

    return SPotifyPodcast(
      coverImagePath,
      json['name'] as String? ?? 'Unknown',
      json['album_type'] as String? ?? 'Unknown', // Use album_type instead of type
      json['release_date'] as String?  ?? 'Test',

      artistName,
    );
  }
}
