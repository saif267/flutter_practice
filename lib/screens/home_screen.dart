import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 24),
              UpcomingMatchCard(),
              SizedBox(height: 32),
              RecentMatchesSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(cs),
    );
  }

  /// ------------------ BOTTOM NAV ------------------
  Widget _bottomNav(ColorScheme cs) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: cs.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 'Home', 0, cs),
            _navItem(Icons.sports_tennis, 'Matches', 1, cs),
            _navItem(Icons.play_arrow, 'Play', 2, cs),
            _navItem(Icons.history, 'History', 3, cs),
            _navItem(Icons.person_outline, 'Profile', 4, cs),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
      IconData icon, String label, int index, ColorScheme cs) {
    final selected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? cs.primary : Colors.transparent,
            ),
            child: Icon(
              icon,
              color: selected ? cs.onPrimary : cs.outline,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? cs.primary : cs.outline,
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= HEADER =================
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/players/p1.png',
            width: 44,
            height: 44,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Padel Park Dubai',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Al Quoz Industrial Area 3 - Dubai',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const Spacer(),


        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            debugPrint('Notifications clicked');
          },
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
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.inverseSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Trophy + Title
          Row(
            children: [
              Icon(Icons.emoji_events, color: cs.primary, size: 18),
              const SizedBox(width: 6),
              Text(
                'Upcoming Match',
                style: TextStyle(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          /// Teams + Date + Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _team(cs),

              Column(
                children: [
                  Text(
                    'Tue\n28\nOCT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: cs.onInverseSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Al Quoz Industrial Area 3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: cs.onInverseSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),

              _team(cs),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= TEAM WIDGET =================
  Widget _team(ColorScheme cs) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: const [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/players/p1.png'),
            ),
            Positioned(
              left: 26,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/players/p2.png'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Text(
          'Ahmad & Hassan',
          style: TextStyle(
            fontSize: 12,
            color: cs.onInverseSurface,
          ),
        ),
      ],
    );
  }
}

/// ================= RECENT MATCHES SECTION =================
class RecentMatchesSection extends StatelessWidget {
  const RecentMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Matches',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed: () {
                debugPrint('See all clicked');
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: cs.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),
        const RecentMatchCard(),
      ],
    );
  }
}

/// ================= RECENT MATCH CARD =================
class RecentMatchCard extends StatelessWidget {
  const RecentMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.emoji_events_outlined,
                      size: 18, color: cs.primary),
                  const SizedBox(width: 6),
                  const Text(
                    'Ranked Match',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: cs.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Team A Won',
                  style: TextStyle(fontSize: 11, color: cs.primary),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _TeamView(),
              Text('V/S'),
              _TeamView(),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, size: 14, color: cs.outline),
              const SizedBox(width: 6),
              Text(
                'OCT 28, 2025 • 4:15 PM',
                style: TextStyle(fontSize: 12, color: cs.outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamView extends StatelessWidget {
  const _TeamView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
      Stack(
      clipBehavior: Clip.none,
      children: const [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/players/p1.png'),
        ),
        Positioned(
          left: 26, // 🔑 controls overlap
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/players/p2.png'),
          ),
        ),
      ],
    ),
        SizedBox(height: 6),
        Text('Ahmad & Hassan', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
