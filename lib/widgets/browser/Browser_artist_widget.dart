import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_models/Browser_artist.dart';
import '../../services/DeezedSearch_musicservice.dart';
//import 'carousel_album.dart';
import 'Browser_carousel_song_widget.dart';

class ArtistWidget extends StatefulWidget {
  final int? artistId;
  final String? artistName;

  ArtistWidget({this.artistId, this.artistName});

  @override
  State<StatefulWidget> createState() {
    return ArtistWidgetState();
  }
}

class ArtistWidgetState extends State<ArtistWidget> {
  Future<Artist>? _artist;
  AppleMusicStore _musicStore = AppleMusicStore.instance;

  @override
  void initState() {
    super.initState();
    _artist = _musicStore.fetchArtistById(widget.artistId);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.artistName!),
        ),
        child: FutureBuilder<Artist>(
            future: _artist,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final artist = snapshot.data!;
                final List<Widget> list = [];

                /*
                if (artist.albums.length > 0) {
                  list.add(Padding(
                    padding: EdgeInsets.only(top: 16),
                  ));

                  /*
                  list.add(CarouselAlbumWidget(
                    title: 'Top Albums',
                    albums: artist.albums,
                  ));

                   */

                }

                 */

                if (artist.songs!.length > 0) {
                  list.add(Padding(
                    padding: EdgeInsets.only(top: 16),
                  ));
                  list.add(CarouselSongWidget(
                    title: 'Top Songs',
                    songs: artist.songs,
                  ));
                }

                return ListView(
                  children: list,
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
