import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'معلومات عني',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  'الاسم: أحمد عبد الحليم ياسين ابو حبل',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  'الواتس اب الخاص بي: 972592367112+',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  'رابط الجيت هب:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'https://github.com/AhmadAbd2020',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  'رابط اللينكد إن:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'https://www.linkedin.com/in/ahmad-abo-habel-8b03a3237/',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
