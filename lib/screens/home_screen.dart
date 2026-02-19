import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 28),
              UpcomingMatchCard(),
              SizedBox(height: 28),
              RecentMatchesSection(),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/players/p1.png',
            width: 52,
            height: 52,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Padel Park Dubai",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "Al Quoz Industrial Area 3 - Dubai",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            debugPrint("Notification Clicked");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(Icons.notifications_none),
          ),
        )
      ],
    );
  }
}
class UpcomingMatchCard extends StatelessWidget {
  const UpcomingMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.emoji_events, color: Color(0xFF8CE000)),
              SizedBox(width: 8),
              Text(
                "Upcoming Match",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DarkTeam(),
              _DateBlock(),
              _DarkTeam(),
            ],
          ),
        ],
      ),
    );
  }
}

class _DarkTeam extends StatelessWidget {
  const _DarkTeam();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/players/p1.png'),
            ),
            Positioned(
              left: 30,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/players/p2.png'),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Ahmad & Hassan",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

class _DateBlock extends StatelessWidget {
  const _DateBlock();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Tue", style: TextStyle(color: Colors.white70)),
        SizedBox(height: 6),
        Text(
          "28",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text("OCT", style: TextStyle(color: Colors.white70)),
      ],
    );
  }
}
class RecentMatchesSection extends StatelessWidget {
  const RecentMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Recent Matches",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            InkWell(
              onTap: () {
                debugPrint("See All Clicked");
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  color: Color(0xFF8CE000),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        const RankedMatchCard(),
        const SizedBox(height: 16),
        const RankedMatchCard(),
      ],
    );
  }
}
class RankedMatchCard extends StatelessWidget {
  const RankedMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.emoji_events_outlined,
                      size: 18, color: Colors.black54),
                  SizedBox(width: 6),
                  Text("Ranked Match",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              Text(
                "Team A Won",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8CE000),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MiniTeam(),
              Text("v/s"),
              _MiniTeam(),
            ],
          ),
          SizedBox(height: 14),
          Text(
            "OCT 28, 2025 • 4:15PM",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _MiniTeam extends StatelessWidget {
  const _MiniTeam();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/players/p1.png'),
            ),
            Positioned(
              left: 24,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/players/p2.png'),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Text("Ahmad & Hassan",
            style: TextStyle(fontSize: 11)),
      ],
    );
  }
}
class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home,
              label: "Home",
              index: 0,
              cs: cs,
            ),
            _buildNavItem(
              icon: Icons.emoji_events_outlined,
              label: "Matches",
              index: 1,
              cs: cs,
            ),
            _buildPlayButton(cs),
            _buildNavItem(
              icon: Icons.history,
              label: "History",
              index: 3,
              cs: cs,
            ),
            _buildNavItem(
              icon: Icons.person_outline,
              label: "Profile",
              index: 4,
              cs: cs,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required ColorScheme cs,
  }) {
    final bool active = currentIndex == index;

    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? cs.primary : Colors.black54,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: active ? cs.primary : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayButton(ColorScheme cs) {
    final bool active = currentIndex == 2;

    return GestureDetector(
      onTap: () => onTabTapped(2),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cs.primary,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/images/play_logo.png',
          height: 28,
          width: 28,
        ),
      ),
    );
  }
}