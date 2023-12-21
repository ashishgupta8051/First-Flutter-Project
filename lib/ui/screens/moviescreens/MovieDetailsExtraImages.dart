import 'package:flutter/material.dart';

class MovieDetailsExtraImages extends StatelessWidget {
  final List<String> imageList;

  const MovieDetailsExtraImages({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("More Movies Poster".toUpperCase(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          Container(
            color: Colors.white,
            height: 200,
            margin: const EdgeInsets.only(top: 6),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(imageList[index]), fit: BoxFit.cover)
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: imageList.length),
          )
        ],
      ),
    );
  }
}
