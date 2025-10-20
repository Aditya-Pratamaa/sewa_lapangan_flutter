import 'package:flutter/material.dart';
import 'package:sewa_lapangan/booking_receipt.dart';
import 'package:intl/intl.dart';

class QrisPayment extends StatefulWidget {
  final String courtName;
  final String duration;
  final String paymentMethod;
  final double totalPrice;
  const QrisPayment({
    super.key,
    required this.courtName,
    required this.duration,
    required this.paymentMethod,
    required this.totalPrice,
  });

  @override
  State<QrisPayment> createState() => _QrisPaymentState();
}

class _QrisPaymentState extends State<QrisPayment> {
    final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('QRIS Payment'), centerTitle: true, backgroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Payment Amout',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                currencyFormatter.format(widget.totalPrice),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(Icons.qr_code, size: 200, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Scan to Pay',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Point your camera at the QR code',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Open your mobile banking or e-wallet app and scan the QR code above to complete your payment",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingReceipt(
                          courtName: widget.courtName,
                          duration: widget.duration,
                          paymentMethod: "QRIS",
                          totalPrice: widget.totalPrice,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_outlined, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "I Have Paid",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Row(
                  children: [
                    Icon(Icons.share, color: Colors.grey, size: 20),
                    SizedBox(width: 5),
                    Text(
                      "Share",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.save_alt, color: Colors.grey, size: 20),
                    SizedBox(width: 5),
                    Text(
                      "Save",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
