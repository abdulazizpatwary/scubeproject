import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
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


        body: Container(
          color: Colors.blueGrey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [


                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BFE7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '1st Page Navigate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //White Box Container
                  Container(
                    height: 468,
                    margin: EdgeInsets.only(right: 10,left: 10),

                    padding: const EdgeInsets.only(top: 6,left: 12,right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [


                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
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
                          style: TextStyle(fontSize:10,fontWeight: FontWeight.w600),
                        ),

                        const Divider(),


                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Image.asset(
                            'icons/page2/total_power.png',
                            height: 70,
                          ),
                        ),

                        //Source / Load + Data Cards
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Column(
                            children: [


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
                      ],
                    ),
                  ),

                  //New Section: List of Items in 2 columns (3 rows, 2 items per row)
                  Container(

                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [



                        //First Row
                        Row(
                          children: [
                            Expanded(
                              child: _buildListItem(
                                icon: 'icons/page2/analysis.png',
                                title: 'Analysis Pro',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildListItem(
                                icon: 'icons/page2/generator.png',
                                title: 'G. Generator',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),


                        Row(
                          children: [
                            Expanded(
                              child: _buildListItem(
                                icon: 'icons/page2/plant_summary.png',
                                title: 'Plant Summary',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildListItem(
                                icon: 'icons/page2/natural_gas.png',
                                title: 'Natural Gas',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),


                        Row(
                          children: [
                            Expanded(
                              child: _buildListItem(
                                icon: 'icons/page2/generator.png',
                                title: 'D. Generator',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildListItem(
                                icon: 'icons/page2/waterproccess.png',
                                title: 'Water Process',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }

  Widget _buildListItem({required String icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),

          ),
          child: Center(
            child: Image.asset(
              icon,
              height: 20,
              width: 20,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image, size: 20, color: Colors.grey);
              },
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),

        minLeadingWidth: 0,
        dense: true,
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
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: active ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
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
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 30),
          const SizedBox(width: 6),
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
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Data 1 : 55505.63', style: TextStyle(fontSize: 8)),
                const Text('Data 2 : 58805.63', style: TextStyle(fontSize: 8)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}