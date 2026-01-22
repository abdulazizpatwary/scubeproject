import 'package:flutter/material.dart';
import 'package:scube_monitoring/ui/second_screen.dart';


class TimeSlot {
  final String tempIcon;
  final String sunIcon;
  final String tempTitle;
  final String tempSubtitle;
  final String sunTitle;
  final String sunSubtitle;
  final String sunValue;
  final String sunValueLabel;
  final Color background;
  final double tempIconHeight;
  final double tempIconWidth;
  final double sunIconHeight;
  final double sunIconWidth;

  TimeSlot({
    required this.tempIcon,
    required this.sunIcon,
    required this.tempTitle,
    required this.tempSubtitle,
    required this.sunTitle,
    required this.sunSubtitle,
    required this.sunValue,
    required this.sunValueLabel,
    required this.background,
    required this.tempIconHeight,
    required this.tempIconWidth,
    required this.sunIconHeight,
    required this.sunIconWidth,
  });
}

//function to get current time slot
TimeSlot getCurrentTimeSlot() {
  final now = DateTime.now();
  final hour = now.hour;
  final minute = now.minute;
  final totalMinutes = hour * 60 + minute;


  if (totalMinutes >= 11 * 60 && totalMinutes < 12 * 60) {
    return TimeSlot(
      tempIcon: 'weather/morning_temp.png',
      sunIcon: 'weather/morning_sun.png',
      tempTitle: '17°C',
      tempSubtitle: 'Module\nTemperature',
      sunTitle: '26 MPH / NW',
      sunSubtitle: 'Wind Speed & Direction',
      sunValue: '15.20 w/m²',
      sunValueLabel: 'Effective Irradiation',
      background: Colors.lightBlue.shade50,
      tempIconHeight: 72,
      tempIconWidth: 24,
      sunIconHeight: 47,
      sunIconWidth: 57,
    );
  }
  // 12:01 PM - 1:00 PM
  else if (totalMinutes >= 12 * 60 + 1 && totalMinutes < 13 * 60) {
    return TimeSlot(
      tempIcon: 'weather/noon_temp.png',
      sunIcon: 'weather/noon_sun.png',
      tempTitle: '30°C',
      tempSubtitle: 'Module\nTemperature',
      sunTitle: '26 MPH / NW',
      sunSubtitle: 'Wind Speed & Direction',
      sunValue: '336 80',
      sunValueLabel: 'Today\'s Data',
      background: Colors.yellow.shade50,
      tempIconHeight: 72,
      tempIconWidth: 24,
      sunIconHeight: 47,
      sunIconWidth: 57,
    );
  }
  // 2:30 PM - 3:30 PM
  else if (totalMinutes >= 14 * 60 + 30 && totalMinutes < 15 * 60 + 30) {
    return TimeSlot(
      tempIcon: 'weather/afternoon_night_temp.png',
      sunIcon: 'weather/moon.png',
      tempTitle: '19°C',
      tempSubtitle: 'Module\nTemperature',
      sunTitle: '26 MPH / NW',
      sunSubtitle: 'Wind Speed & Direction',
      sunValue: '15.20 w/m²',
      sunValueLabel: 'Effective Irradiation',
      background: Colors.orange.shade50,
      tempIconHeight: 72,
      tempIconWidth: 24,
      sunIconHeight: 47,
      sunIconWidth: 57,
    );
  }
  // Default
  else {
    return TimeSlot(
      tempIcon: 'weather/noon_temp.png',
      sunIcon: 'weather/moon.png',
      tempTitle: '17°C',
      tempSubtitle: 'Module\nTemperature',
      sunTitle: '26 MPH / NW',
      sunSubtitle: 'Wind Speed & Direction',
      sunValue: '15.20 w/m²',
      sunValueLabel: 'Effective Irradiation',
      background: Colors.grey.shade200,
      tempIconHeight: 72,
      tempIconWidth: 24,
      sunIconHeight: 47,
      sunIconWidth: 57,
    );
  }
}


class DashboardItem {
  final String icon;
  final String title;
  final String subtitle;

  DashboardItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}


class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const DashboardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F8FF),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                item.icon,
                height: 22,
                width: 22,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(width: 3),
            // Title + Subtitle
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[800],
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  _buildTitleWithSmallBracket(item.subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWithSmallBracket(String subtitle) {
    if (subtitle.contains('(') && subtitle.contains(')')) {
      final bracketStart = subtitle.indexOf('(');
      final bracketEnd = subtitle.indexOf(')');

      if (bracketStart != -1 && bracketEnd != -1) {
        final mainText = subtitle.substring(0, bracketStart).trim();
        final bracketText = subtitle.substring(bracketStart, bracketEnd + 1);

        return RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          text: TextSpan(
            children: [
              TextSpan(
                text: mainText,
                style: const TextStyle(
                  fontSize: 9.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                text: bracketText,
                style: const TextStyle(
                  fontSize: 5.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }
    }
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 9.2,
        fontWeight: FontWeight.w700,
        color: Colors.grey,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}

// Temperature Tile Widget
class TemperatureTile extends StatelessWidget {
  final TimeSlot slot;

  const TemperatureTile({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left: Title + Subtitle
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Temperature Value
                Text(
                  slot.tempTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 2),
                // Module Temperature
                Text(
                  slot.tempSubtitle,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    height: 1.2,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),

          // Right: Temperature Icon
          Container(
            height: slot.tempIconHeight,
            width: slot.tempIconWidth,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              slot.tempIcon,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              height: slot.tempIconHeight,
              width: slot.tempIconWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class SunMoonTile extends StatelessWidget {
  final TimeSlot slot;

  const SunMoonTile({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 50, right: 12, top: 6, bottom: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E63F7), // #2E63F7
            Color(0xFFB982D9), // #B982D9
          ],
          stops: [0.0, 1.0],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left: Two lines of text
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Wind Speed Line
                Text(
                  slot.sunTitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  slot.sunSubtitle,
                  style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 6),

                // Effective Irradiation Line
                Text(
                  slot.sunValue,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  slot.sunValueLabel,
                  style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),


          Container(
            height: slot.sunIconHeight,
            width: slot.sunIconWidth,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              slot.sunIcon,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              height: slot.sunIconHeight,
              width: slot.sunIconWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  DataTableWidget({super.key});

  final List<Map<String, String>> tableData = [
    {
      'title': 'AC Max Power',
      'yesterday': '1636.50 kW',
      'today': '2121.88 kW',
    },
    {
      'title': 'Net Energy',
      'yesterday': '6439.16 kWh',
      'today': '4875.77 kWh',
    },
    {
      'title': 'Specific Yield',
      'yesterday': '1.25 kWh/kWp',
      'today': '0.94 kWh/kWp',
    },
    {
      'title': 'Net Energy',
      'yesterday': '6439.16 kWh',
      'today': '4875.77 kWh',
    },
    {
      'title': 'Specific Yield',
      'yesterday': '1.25 kWh/kWp',
      'today': '0.94 kWh/kWp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7.0, right: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(
                      "Yesterday's Data",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(
                      "Today's Data",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),


          ...tableData.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == tableData.length - 1;

            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: isLast
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey[100]!, width: 1),
                ),
              ),
              child: Row(
                children: [

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),


                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text(
                        item['yesterday']!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),


                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Text(
                        item['today']!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}


class PVSystemListTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;

  const PVSystemListTile({
    super.key,
    required this.iconPath,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      constraints: const BoxConstraints(minHeight: 60, maxHeight: 60),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 3,vertical: 0),
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F8FF),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            iconPath,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle!,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        )
            : null,
      ),
    );
  }
}

class PVSystemInfoSection extends StatelessWidget {
  const PVSystemInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Full width first item
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            constraints: const BoxConstraints(minHeight: 55, maxHeight: 55),

            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F8FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  'icons/pvicons/total_noof_pv_module.png',
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Num of PV Module  :  ',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38,
                        ),
                      ),
                      TextSpan(
                        text: '6372pcs(585 Wp each)',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            letterSpacing: 1
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Two column layout for the rest
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(

                child: Column(
                  children: [
                    PVSystemListTile(
                      iconPath: 'icons/pvicons/total_ac_capacity.png',
                      title: 'Total AC Capacity',
                      subtitle: '3000 KW',
                    ),
                    PVSystemListTile(
                      iconPath: 'icons/pvicons/total_dc_capacity.png',
                      title: 'Total DC Capacity',
                      subtitle: '3.727 MWp',
                    ),
                    PVSystemListTile(
                      iconPath: 'icons/pvicons/date_of_comission.png',
                      title: 'Date of Commissioning',
                      subtitle: '17/07/2024',
                    ),
                  ],
                ),
              ),

              // Right Column
              Expanded(
                child: Column(
                  children: [
                    PVSystemListTile(
                      iconPath: 'icons/pvicons/no_of_interver.png',
                      title: 'Number of Inverter',
                      subtitle: '30',
                    ),
                    PVSystemListTile(
                      iconPath: 'icons/pvicons/total_ac_capacity.png',
                      title: 'Total AC Capacity',
                      subtitle: '3000 KW',
                    ),
                    PVSystemListTile(
                      iconPath: 'icons/pvicons/total_dc_capacity.png',
                      title: 'Total DC Capacity',
                      subtitle: '3.727 MWp',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PVSystemCompleteDataSection extends StatelessWidget {
  const PVSystemCompleteDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with LT_01 and Power Capacity at the end
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              title: const Text(
                'LT_01',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'icons/obicons/object_png.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '495.505 kWp / 440 kW',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Data Grid - Row 1
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lifetime Energy
              Expanded(
                child: Container(

                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'icons/obicons/lifetime_energy.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    title: const Text(
                      'Lifetime Energy',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: const Text(
                      '352.96 MWh',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              // Prev. Meter Energy
              Expanded(
                child: Container(

                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        'icons/obicons/prev_meter_energy.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    title: const Text(
                      'Prev. Meter Energy',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: const Text(
                      '0.00 MWh',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Data Grid - Row 2
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today Energy
              Expanded(
                child: Container(

                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        'icons/obicons/today_energy.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    title: const Text(
                      'Today Energy',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: const Text(
                      '273.69 kWh',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              // Live Power
              Expanded(
                child: Container(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'icons/obicons/live_power.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    title: const Text(
                      'Live Power',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: const Text(
                      '352.96 MWh',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final List<DashboardItem> items = [
    DashboardItem(icon: 'icons/live_ac_power.png', subtitle: 'Live AC Power', title: '10000 kW'),
    DashboardItem(icon: 'icons/plant_generation.png', subtitle: 'Plant Generation', title: '82.58 %'),
    DashboardItem(icon: 'icons/live_pr.png', subtitle: 'Live PR', title: '85.61 %'),
    DashboardItem(icon: 'icons/cumulative_pr.png', subtitle: 'Cumulative PR', title: '27.58 %'),
    DashboardItem(icon: 'icons/return_pv.png', subtitle: 'Return PV(Till Today)', title: '10000 ৳'),
    DashboardItem(icon: 'icons/total_energy.png', subtitle: 'Total Energy', title: '10000 kWh'),
  ];

  @override
  Widget build(BuildContext context) {
    final currentSlot = getCurrentTimeSlot();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text('1st Page', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
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
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            // 2nd Page Navigate Button
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen()));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF00BFE7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('2nd Page Navigate',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(width: 16),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Main Content Area
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Dashboard Grid
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return DashboardCard(item: items[index]);
                      },
                    ),


                    Container(
                      height: 80,
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // SunMoonTile
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.30,
                            top: 0,
                            bottom: 0,
                            right: 0,
                            child: SunMoonTile(slot: currentSlot),
                          ),


                          Positioned(
                            left: 8,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TemperatureTile(slot: currentSlot),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Data Table Widget
                    const SizedBox(height: 8),
                    DataTableWidget(),

                    // PV System Information Section
                    const PVSystemInfoSection(),

                    // PV System Complete Data Section
                    const SizedBox(height: 8),
                    const PVSystemCompleteDataSection(),
                    const SizedBox(height: 8),
                    const PVSystemCompleteDataSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}