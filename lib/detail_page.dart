import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:planty/model/plants.dart';

class DetailPage extends StatelessWidget {
  final Plants plant;

  DetailPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              plant.gambar,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 24, top: 16),
              decoration: BoxDecoration(
                color: Color(0xff92AE9B),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  FeatherIcons.chevronLeft,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 16),
                        child: Text(
                          plant.nama,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: FavoriteButton(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text(
                    plant.namaLatin,
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.star,
                        color: Colors.amberAccent,
                        size: 30,
                      ),
                      SizedBox(width: 12),
                      Text(plant.rate)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    plant.desc,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff809F8B),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '\$' + plant.harga,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 16),
                                  Icon(
                                    FeatherIcons.shoppingBag,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isOn = !isOn;
        });
      },
      icon: Icon(
        isOn ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
