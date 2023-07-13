import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:planty/cart_page.dart';
import 'package:planty/detail_page.dart';
import 'package:planty/model/plants.dart';
import 'package:planty/small_plant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleFont = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FeatherIcons.alignLeft),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff92AE9B),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        icon: Icon(
                          FeatherIcons.shoppingBag,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return CartPage();
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text('Find Your ', style: titleFont),
                        Text(
                          'Plant',
                          style: TextStyle(
                              color: Color(0xff81B29A),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              fontSize: 24),
                        ),
                        Text(' Online', style: titleFont)
                      ],
                    ),
                    Text('More Than 100 Plants'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 262,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    viewportFraction: 0.63,
                  ),
                  itemCount: ListPlants.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    final Plants plant = ListPlants[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailPage(plant: plant);
                        }));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              child: Image.network(plant.gambar,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Color(0xff809F8B),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    plant.nama,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '\$' + plant.harga,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: TabBar(
                        labelPadding: EdgeInsets.symmetric(vertical: 5),
                        indicator: BoxDecoration(
                            color: Color(0xff809F8B),
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Text('Small'),
                          Text('Medium'),
                          Text('Large'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 250,
                      child: TabBarView(
                        children: [
                          SmallPlant(),
                          Icon(Icons.monetization_on),
                          Icon(Icons.monetization_on),
                        ],
                      ),
                    ),
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
