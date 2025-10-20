import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/detail_lapangan.dart';
import 'package:sewa_lapangan/package_duration.dart';
import 'package:intl/intl.dart';

class ListLapangan extends StatefulWidget {
  const ListLapangan({super.key});

  @override
  
  State<ListLapangan> createState() => _ListLapanganState();
}

class _ListLapanganState extends State<ListLapangan> {
  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  final List<Map<String, dynamic>> lapanganList = [
    {
      "title": "Futsal Court A",
      "rating": 4.8,
      "description": "Indoor • Air Conditioned",
      "price": 50000,
      "image": "assets/images/img (1).png",
      "facilities": [
        "Changing Room",
        "Parking Area",
        "Cafeteria",
        "Free Wi-Fi",
      ],
      "location": "Jl. Tajur No.123, Kota Bogor",
    },
    {
      "title": "Basketball Court B",
      "rating": 4.7,
      "description": "Outdoor • Premium Floor",
      "price": 75000,
      "image": "assets/images/img (2).png",
      "facilities": [
        "Lighting System",
        "Seating Area",
        "Locker Room",
        "Refreshment Stand",
      ],
      "location": "Jl. Raya Bogor, Kota Bogor",
    },
    {
      "title": "Badminton Court C",
      "rating": 4.9,
      "description": "Indoor • Wooden Floor",
      "price": 45000,
      "image": "assets/images/img (3).png",
      "facilities": [
        "Changing Room",
        "Locker Room",
        "Cafeteria",
        "Free Wi-Fi",
      ],
      "location": "Jl. Raya Pandu Raya, Kota Bogor",
    },
    {
      "title": "Tennis Court D",
      "rating": 4.6,
      "description": "Outdoor • Hard Surface",
      "price": 80000,
      "image": "assets/images/img (4).png",
      "facilities": [
        "Changing Room",
        "Locker Room",
        "Cafeteria",
        "Free Wi-Fi",
      ],
      "location": "Jl. Raya Bogor 969, Kota Bogor",
    },
    {
      "title": "Volleyball Court E",
      "rating": 4.5,
      "description": "Indoor • Syntehtic Floor",
      "price": 60000,
      "image": "assets/images/img (5).png",
      "facilities": [
        "Changing Room",
        "Parking Area",
        "Cafeteria",
        "Free Wi-Fi",
      ],
      "location": "Jl. Tajur No.456, Kota Bogor",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          
          children: [
            
            Center(
              child: Text(
                "Sport Courts",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),

            ...lapanganList.map((lapangan) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return DetailLapangan(
                        courtName: lapangan['title'],
                        rating: lapangan['rating'],
                        description: lapangan['description'],
                        price: lapangan['price'],
                        image: lapangan['image'],
                        facilities: lapangan['facilities'],
                        location: lapangan['location'],
                      );
                    },
                  ));
                },
                child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.asset(
                            lapangan['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama + rating
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lapangan['title'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        lapangan['rating'].toString(),
                                        style: GoogleFonts.poppins(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              // Deskripsi
                              Text(
                                lapangan['description'],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),

                              const Spacer(),

                              // Harga + Tombol
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${currencyFormatter.format(lapangan['price'])}/hour",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute<void>(
                                        builder: (context) {
                                          return PackageDuration(
                                            title: lapangan['title'],
                                            price: lapangan['price'],
                                          );
                                        },
                                      ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                                    ),
                                    child: Text(
                                      "Select",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
