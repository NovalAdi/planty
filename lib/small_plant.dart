import 'package:flutter/material.dart';
import 'package:planty/detail_page.dart';
import 'package:planty/model/plants.dart';

class SmallPlant extends StatelessWidget {
  const SmallPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ListPlants.length,
      itemBuilder: (context, index) {
        final Plants plant = ListPlants[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(plant: plant);
            }));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    plant.gambar,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.nama,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 4),
                      Text(
                        plant.namaLatin,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff809F8B),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '\$' + plant.harga,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
