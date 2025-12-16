import 'package:afarinick_test/presentation/widgets/monitoring_card.dart';
import 'package:afarinick_test/presentation/widgets/register_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 66),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome Kwabena!',
                        style: TextStyle(
                          color: Color(0xFF224C21),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'to the HCMS App',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    foregroundImage: const NetworkImage(
                      'https://i.pravatar.cc/150?img=11',
                    ),
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),

            RegisterCard(
              title: 'Register Tree',
              icon: SvgPicture.asset(
                'assets/emojione_deciduous-tree.svg',
                width: 32,
              ),
              buttonText: 'View Registered Trees',
              onButtonPressed: () {},
              onAddPressed: () {},
            ),
            SizedBox(height: 26),

            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: MonitoringCard(
                title: 'Landscape Monitoring',
                image: SvgPicture.asset(
                  'assets/flat-color-icons_landscape.svg',
                  width: 40,
                ),
                buttonText: 'Monitoring Options',
                onButtonPressed: () {},
              ),
            ),
            SizedBox(height: 26),

            RegisterCard(
              title: '15 farmers registered',
              icon: SvgPicture.asset(
                'assets/twemoji_farmer-dark-skin-tone.svg',
                width: 32,
              ),
              buttonText: 'View Farmers List',
              onButtonPressed: () {},
              onAddPressed: () {},
            ),
            SizedBox(height: 26),

            MonitoringCard(
              title: 'Data Monitoring',
              image: SvgPicture.asset(
                'assets/mdi_monitor-eye.svg',
                width: 40,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              buttonText: 'Monitor',
              onButtonPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
