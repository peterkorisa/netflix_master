import 'package:flutter/material.dart';
import 'package:netflix/data/movie-class.dart';


class Detalis extends StatelessWidget {
  final Movie movie;

  const Detalis({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
       Image.network(
              'https://image.tmdb.org/t/p/w780${movie.posterPath}',
              width: 376,
              height: 287,
              fit: BoxFit.fill,
            ),
          const SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star,color: Color.fromRGBO(187, 187, 187, 1),
                ),
                 SizedBox(
                   width: 3,
                 ),
                 Text(
                    movie.voteAverage.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(187, 187, 187, 1),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("-------------------------------------------------------------------------"),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("RealaseDate: ${movie.releaseDate}",style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("-------------------------------------------------------------------------"),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Description",style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(movie.overview,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),),
          ),
        ],
      ),
    );
  }
}
