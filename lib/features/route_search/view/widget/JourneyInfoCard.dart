import 'package:egypt_metro_navigator/data/models/JourneyInfo.dart';
import 'package:egypt_metro_navigator/features/route_search/view/widget/JourneyInfoItem.dart';
import 'package:flutter/material.dart';

class JourneyInfoCard extends StatelessWidget {
  final JourneyInfo info;

  const JourneyInfoCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: JourneyInfoItem(
                    icon: Icons.confirmation_number_outlined,
                    title: 'سعر التذكرة',
                    value: '${info.ticketPrice} جنيه',
                    color: colors.primary,
                  ),
                ),
                Expanded(
                  child: JourneyInfoItem(
                    icon: Icons.access_time,
                    title: 'الوقت المتوقع',
                    value: '${info.estimatedMinutes} دقيقة',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              children: [
                Expanded(
                  child: JourneyInfoItem(
                    icon: Icons.train_outlined,
                    title: 'عدد المحطات',
                    value: '${info.stationsTravelled}',
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: JourneyInfoItem(
                    icon: Icons.swap_horiz,
                    title: 'عدد التحويلات',
                    value: '${info.transfers}',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
