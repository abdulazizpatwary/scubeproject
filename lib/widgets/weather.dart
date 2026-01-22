import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class WeatherCard extends StatelessWidget {
  final String temperature;
  final String title;
  final String windSpeed;
  final String windDirection;
  final String irradiation;
  final Color color;

  const WeatherCard({
    super.key,
    required this.temperature,
    required this.title,
    required this.windSpeed,
    required this.windDirection,
    required this.irradiation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Temperature and Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temperature,
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Wind Information
          Row(
            children: [
              Icon(
                Icons.air,
                size: 16,
                color: AppColors.textLight,
              ),
              const SizedBox(width: 8),
              Text(
                '$windSpeed $windDirection',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'Wind Speed & Direction',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Irradiation
          Row(
            children: [
              Icon(
                Icons.wb_sunny,
                size: 16,
                color: AppColors.textLight,
              ),
              const SizedBox(width: 8),
              Text(
                irradiation,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'Effective Irradiation',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}