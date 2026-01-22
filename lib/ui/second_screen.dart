import 'package:flutter/material.dart';
import 'first_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),

      // 🔹 AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          '2nd Page',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.notifications_none, color: Colors.black),
              ),
              Positioned(
                right: 16,
                top: 6,
                child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
              )
            ],
          )
        ],
      ),

      // 🔹 Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF00BFE7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('1st Page Navigate',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(width: 16),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                children: const [
                  _TabItem(title: 'Summery', active: true),
                  _TabItem(title: 'SLD'),
                  _TabItem(title: 'Data'),
                ],
              ),
            ),

            const Text(
              'Electricity',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const Divider(),

            // 🔹 Total Power Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset(
                'icons/page2/total_power.png',
                height: 180,
              ),
            ),

            // 🔹 Source / Load Switch
            Container(
              height: 538,
              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [

                    // 🔹 Source / Load Switch
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          _SwitchButton(title: 'Source', active: true),
                          _SwitchButton(title: 'Load'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // 🔹 Data Cards
                    _DataCard(
                      icon: 'icons/page2/data_view.png',
                      title: 'Data View',
                      active: true,
                    ),
                    _DataCard(
                      icon: 'icons/page2/data_type_2.png',
                      title: 'Data Type 2',
                      active: true,
                    ),
                    _DataCard(
                      icon: 'icons/page2/data_type_3.png',
                      title: 'Data Type 3',
                      active: false,
                    ),
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
class _TabItem extends StatelessWidget {
  final String title;
  final bool active;

  const _TabItem({required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: active ? Colors.white : Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _SwitchButton extends StatelessWidget {
  final String title;
  final bool active;

  const _SwitchButton({required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: active ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  final String icon;
  final String title;
  final bool active;

  const _DataCard({
    required this.icon,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      
      child: Row(
        children: [
          Image.asset(icon, height: 36),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(width: 6),
                    Text(
                      active ? '(Active)' : '(Inactive)',
                      style: TextStyle(
                        color: active ? Colors.blue : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Data 1 : 55505.63', style: TextStyle(fontSize: 12)),
                const Text('Data 2 : 58805.63', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
