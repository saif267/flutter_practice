import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
        Stack(
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

            /// Rank Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 18,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Rank: A",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 18),

        /// Title & Location
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Padel Park Dubai",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "Al Quoz Industrial Area 3 - Dubai",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Notification Button
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () => debugPrint("Notification Clicked"),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              size: 18,
            ),
          ),
        ),
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
        MatchTeam(
          teamName: "Team A",
          players: ["Ahmad", "Hassan"],
        ),
        DateBlock(),
        MatchTeam(
          teamName: "Team B",
          players: ["Omar", "Ali"],
        ),
      ],
    );
  }
}
class MatchTeam extends StatelessWidget {
  final String teamName;
  final List<String> players;

  const MatchTeam({
    super.key,
    required this.teamName,
    required this.players,
  });

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

        /// Team Label
        Text(
          teamName,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 4),

        /// Player Names
        Text(
          "${players[0]} & ${players[1]}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
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
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
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
              color: Colors.white, size: 18),
          SizedBox(width: 6),
          Text(
            "Al Quoz Industrial Area 3 - Dubai",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// ================= RECENT MATCHES =================

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
                    fontSize: 20
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
                  Text(
                    "Ranked Match",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              WinBadge(primary: primary),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MiniTeam(
                teamName: "Team A",
                players: "Ahmad & Hassan",
              ),
              Text("v/s"),
              MiniTeam(
                teamName: "Team B",
                players: "Omar & Ali",
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HugeIcon(
                icon: HugeIcons.strokeRoundedClock01,
                color: Colors.black,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                "OCT 28, 2025 • 4:15PM",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
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
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
class MiniTeam extends StatelessWidget {
  final String teamName;
  final String players;

  const MiniTeam({
    super.key,
    required this.teamName,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 110,
          height: 70,
          child: Stack(
            children: [
              MatchTeam._avatar(
                'assets/players/p1.png',
                Colors.grey.shade50,
              ),
              Positioned(
                left: 40,
                child: MatchTeam._avatar(
                  'assets/players/p2.png',
                  Colors.grey.shade50,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),

        ///  Team Name
        Text(
          teamName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),

        ///  Player Names
        Text(
          players,
          style: const TextStyle(fontSize: 11),
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(
              const HugeIcon(
                icon: HugeIcons.strokeRoundedHome04,
                color: Colors.black,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Home",
              0,
              primary,
            ),
            navItem(
              const Icon(Icons.emoji_events_outlined),
              "Matches",
              1,
              primary,
            ),
            playButton(primary),
            navItem(
              const Icon(Icons.history),
              "History",
              3,
              primary,
            ),
            navItem(
              const Icon(LucideIcons.user),
              "Profile",
              4,
              primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(
      Widget icon,
      String label,
      int index,
      Color primary,
      ) {
    final active = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: active
              ? primary.withOpacity(0.10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(
                color: active ? primary : Colors.black,
              ),
              child: icon,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: active ? primary : Colors.black54,
              ),
            ),
          ],
        ),
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