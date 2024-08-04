// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class SongModel {
  final String song_url;
  final String thumbnail_url;
  final String song_name;
  final String artist;
  final int id;
  final String hex_code;
  SongModel({
    required this.song_url,
    required this.thumbnail_url,
    required this.song_name,
    required this.artist,
    required this.id,
    required this.hex_code,
  });

  SongModel copyWith({
    String? song_url,
    String? thumbnail_url,
    String? song_name,
    String? artist,
    int? id,
    String? hex_code,
  }) {
    return SongModel(
      song_url: song_url ?? this.song_url,
      thumbnail_url: thumbnail_url ?? this.thumbnail_url,
      song_name: song_name ?? this.song_name,
      artist: artist ?? this.artist,
      id: id ?? this.id,
      hex_code: hex_code ?? this.hex_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'song_url': song_url,
      'thumbnail_url': thumbnail_url,
      'song_name': song_name,
      'artist': artist,
      'id': id,
      'hex_code': hex_code,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      song_url: map['song_url'] ?? '',
      thumbnail_url: map['thumbnail_url'] ?? '',
      song_name: map['song_name'] ?? '',
      artist: map['artist'] ?? '',
      id: map['id'] as int,
      hex_code: map['hex_code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongModel(song_url: $song_url, thumbnail_url: $thumbnail_url, song_name: $song_name, artist: $artist, id: $id, hex_code: $hex_code)';
  }

  @override
  bool operator ==(covariant SongModel other) {
    if (identical(this, other)) return true;

    return other.song_url == song_url &&
        other.thumbnail_url == thumbnail_url &&
        other.song_name == song_name &&
        other.artist == artist &&
        other.id == id &&
        other.hex_code == hex_code;
  }

  @override
  int get hashCode {
    return song_url.hashCode ^
        thumbnail_url.hashCode ^
        song_name.hashCode ^
        artist.hashCode ^
        id.hashCode ^
        hex_code.hashCode;
  }
}
