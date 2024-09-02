import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "New Arrivals",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                "https://cdn.open-pr.com/T/5/T507166583_g.jpg",
                "https://www.retcustomsbrokerage.com/wp-content/themes/retcustoms/images/resource/br.jpg",
                "https://images.northerntrust.com/content/dam/northerntrust/pws/nt/images/wealth-management/brokerage_851x478.jpg",
                "https://media.istockphoto.com/id/1314018414/photo/home-brokerage-business-introduces-architectural-house-designs-to-clients-real-estate-concepts.jpg?s=612x612&w=0&k=20&c=39O3qnguCY9ogDoNQy3e4-0AymLwMfGjxNcJAKJ2pu8="
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(item, fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
