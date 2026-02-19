import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 30),
              UpcomingMatchCard(),
              SizedBox(height: 20),
              Divider(color: Color(0xFFE6E6E6)),
              SizedBox(height: 24),
              RecentMatchesSection(),
              SizedBox(height: 140),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}

/// ================= HEADER =================
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/squarepic.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Padel Park Dubai",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "Al Quoz Industrial Area 3 - Dubai",
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () => debugPrint("Notification Clicked"),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedNotification01,
                  size: 22,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

/// ================= UPCOMING MATCH =================
class UpcomingMatchCard extends StatelessWidget {
  const UpcomingMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: primary,
                child: const Icon(Icons.emoji_events,
                    size: 18, color: Colors.black),
              ),
              const SizedBox(width: 10),
              const Text(
                "Upcoming Match",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const MatchRow(),
          const SizedBox(height: 26),
          const LocationBar(),
        ],
      ),
    );
  }
}

class MatchRow extends StatelessWidget {
  const MatchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MatchTeam(),
        DateBlock(),
        MatchTeam(),
      ],
    );
  }
}

class MatchTeam extends StatelessWidget {
  const MatchTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        SizedBox(
          width: 110,
          height: 70,
          child: Stack(
            children: [
              _avatar('assets/players/p1.png', primary),
              Positioned(
                left: 40,
                child: _avatar('assets/players/p2.png', primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Team A",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 4),
        const Text(
          "Ahmad & Hassan",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  static Widget _avatar(String path, Color primary) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primary, width: 2.5),
      ),
      child: ClipOval(
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }
}

class DateBlock extends StatelessWidget {
  const DateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Tue", style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        Text(
          "28",
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text("OCT", style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on,
              color: Colors.white70, size: 18),
          SizedBox(width: 6),
          Text(
            "Al Quoz Industrial Area 3 - Dubai",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}


/// ================= RECENT MATCHES =================

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
        Text("Tue", style: TextStyle(color: Colors.white)),
        SizedBox(height: 6),
        Text(
          "28",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text("OCT", style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
class RecentMatchesSection extends StatelessWidget {
  const RecentMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Recent Matches",
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              onTap: () => debugPrint("See All Clicked"),
              child: Text(
                "See All",
                style: TextStyle(
                  color: primary,
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
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.emoji_events_outlined,
                      size: 18, color: Colors.black54),
                  SizedBox(width: 6),
                  Text("Ranked Match",
                      style:
                      TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              WinBadge(primary: primary),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              MiniTeam(),
              Text("v/s"),
              MiniTeam(),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            "OCT 28, 2025 • 4:15PM",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class WinBadge extends StatelessWidget {
  final Color primary;
  const WinBadge({super.key, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/star-award-01.png",
            height: 14,
          ),
          const SizedBox(width: 6),
          Text(
            "Team A Won",
            style: TextStyle(
              fontSize: 12,
              color: primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class MiniTeam extends StatelessWidget {
  const MiniTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        SizedBox(
          width: 110,
          height: 70,
          child: Stack(
            children: [
              MatchTeam._avatar('assets/players/p1.png', primary),
              Positioned(
                left: 40,
                child: MatchTeam._avatar(
                    'assets/players/p2.png', primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const Text("Ahmad & Hassan",
            style: TextStyle(fontSize: 11)),
      ],
    );
  }
}

/// ================= BOTTOM NAV =================
class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, "Home", 0, primary),
            navItem(Icons.emoji_events_outlined, "Matches", 1, primary),
            playButton(primary),
            navItem(Icons.history, "History", 3, primary),
            navItem(Icons.person_outline, "Profile", 4, primary),
          ],
        ),
      ),
    );
  }

  Widget navItem(
      IconData icon, String label, int index, Color primary) {
    final active = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: active ? primary : Colors.black54),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color:
              active ? primary : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget playButton(Color primary) {
    return GestureDetector(
      onTap: () => onTap(2),
      child: Image.asset(
        'assets/images/play_logo.png',
        height: 58,
        width: 58,
      ),
    );
  }
}

