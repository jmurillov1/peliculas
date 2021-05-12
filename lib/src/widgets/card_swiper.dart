import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 5.0,
      ),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
          return Hero(
            tag: peliculas[index].id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              // child: Text(peliculas[index].toString()),
              child: FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg()),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        onTap: (id) =>
            Navigator.pushNamed(context, 'detalle', arguments: peliculas[id]),
        itemCount: peliculas.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
