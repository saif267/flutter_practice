import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test5/theme.dart';

import '../app/components/ui/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // 👈 space for nav
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeHeader(),
            VGap.x5(),
            UpcomingMatchCard(),
            VGap.x5(),
            Divider(color: Color(0xFFE2E2E2)),
            VGap.x5(),
            RecentMatchesSection(),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
/// ================= HEADER =================
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    //final primary = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/squarepic.png',
                width: 58,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),

            /// Rank Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 58,
                height: 16,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ).copyWith(color: context.colorScheme.outline),
                alignment: Alignment.center,
                child: Text(
                  "Rank A",
                  /*style: context.theme.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.surface,*/
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.surface,
                  ),
                ),
              ),
            ),
          ],
        ),

        HGap.x4(),

        /// Title & Location
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Padel Park Dubai",
                //style: context.theme.textTheme.titleMedium,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              VGap(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                  HGap.x1(),
                  Expanded(
                    child: Text(
                      "Al Quoz Industrial Area 3 - Dubai",
                      overflow: TextOverflow.ellipsis,
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Notification Button
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => debugPrint("Notification Clicked"),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                /*color: const Color(0xFFE2E4E9)*/
                color: context.colorScheme.outline,
              ),
            ),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              size: 24,
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        /*color: const Color(0xFF1E1E1E),*/
        color: context.colorScheme.shadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              HGap(width: 10),
              CircleAvatar(
                radius: 15,
                backgroundColor: primary,
                child: Icon(
                  Icons.emoji_events,
                  size: 20,
                  color: context.colorScheme.shadow,
                ),
              ),
              HGap.x2(),
              Text(
                "Upcoming Match",
                style: context.theme.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.surface,
                ),
              ),
            ],
          ),
          VGap.x4(),
          const MatchRow(),
          VGap.x3(),
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
        MatchTeam(teamName: "Team A", players: ["Ahmad", "Hassan"]),
        DateBlock(),
        MatchTeam(teamName: "Team B", players: ["Omar", "Ali"]),
      ],
    );
  }
}

class MatchTeam extends StatelessWidget {
  final String teamName;
  final List<String> players;

  const MatchTeam({super.key, required this.teamName, required this.players});

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
        //VGap.x4(),
        VGap(height: 15),

        /// Team Label
        Text(
          teamName,
          style: context.theme.textTheme.bodySmall?.copyWith(
            color: context.theme.colorScheme.outline,
          ),
        ),

        VGap.x1(),

        /// Player Names
        Text(
          "${players[0]} & ${players[1]}",
          style: context.theme.textTheme.labelMedium?.copyWith(
            color: context.theme.colorScheme.surface,
          ),
        ),
      ],
    );
  }

  static Widget _avatar(String path, Color primary) {
    return Container(
      width: 67,
      height: 67,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primary, width: 2.5),
      ),
      child: ClipOval(child: Image.asset(path, fit: BoxFit.cover)),
    );
  }
}

class DateBlock extends StatelessWidget {
  const DateBlock({super.key});

  @override
  Widget build(BuildContext context) {
    HGap.x11();
    return Column(
      children: [
        Text(
          "Tue",
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        VGap(height: 9),
        Text(
          "28",
          style: context.theme.textTheme.headlineLarge?.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        VGap(height: 9),
        Text(
          "OCT",
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: const Color(0xFFE2E4E9),
          ),
        ),
      ],
    );
  }
}

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF323232),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            /*color: Color(0xFFFFFFFF),*/
            color: context.colorScheme.surface,
            size: 16,
          ),
          const HGap.x1(),
          Text(
            "Al Quoz Industrial Area 3 - Dubai",
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.surface,
            ),
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
    //final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Matches",
              //style:context.theme.textTheme.titleMedium,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () => debugPrint("See All Clicked"),
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ).copyWith(color: context.theme.colorScheme.primary),
              ),
            ),
          ],
        ),
        VGap(height: 17),
        const RankedMatchCard(),
        VGap.x3(),
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: context.theme.colorScheme.outline, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  HGap(width: 14),
                  Icon(
                    Icons.emoji_events_outlined,
                    size: 15,
                    color: context.theme.colorScheme.shadow,
                  ),
                  HGap.x2(),
                  Text(
                    "Ranked Match",
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              WinBadge(primary: primary),
            ],
          ),
          VGap.x2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HGap.x6(),
              MiniTeam(teamName: "Team A", players: "Ahmad & Hassan"),
              HGap.x4(),
              Text("v/s", style: context.theme.textTheme.titleMedium),
              HGap.x4(),
              MiniTeam(teamName: "Team B", players: "Omar & Ali"),
              HGap.x6(),

            ],
          ),
          VGap(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: context.theme.colorScheme.scrim,
              ),
              HGap(width: 5),
              Text(
                "OCT 28, 2025 • 4:15PM",
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.scrim,
                ),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.20),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/star-award-01.png",
            height: 16,
            color: context.theme.colorScheme.outline,
          ),
          HGap.x1(),
          Text(
            "Team A Won",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ).copyWith(color: context.theme.colorScheme.scrim),
          ),
        ],
      ),
    );
  }
}

class MiniTeam extends StatelessWidget {
  final String teamName;
  final String players;

  const MiniTeam({super.key, required this.teamName, required this.players});

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
                const Color(0xFFE2E4E9),
              ),
              Positioned(
                left: 40,
                child: MatchTeam._avatar(
                  'assets/players/p2.png',
                  const Color(0xFFE2E4E9),
                ),
              ),
            ],
          ),
        ),
        VGap.x2(),

        Text(
          teamName,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),

        VGap(height: 3,),

        Text(players,  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
      ],
    );
  }
}

/// ================= BOTTOM NAV =================
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomInset == 0 ? 10 : bottomInset,
        left: 10,
        right: 10,
      ),
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: const Color(0xFFE2E4E9)),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navItem(
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedHome04,
                      size: 24,
                      strokeWidth: 1.5,
                    ),
                    "Home",
                    0,
                    primary,
                    context,
                  ),
                  HGap.x3(),
                  navItem(
                    const Icon(Icons.emoji_events_outlined),
                    "Matches",
                    1,
                    primary,
                    context,
                  ),
                  HGap.x3(),
                  playButton(primary, context),
                  HGap.x3(),
                  navItem(
                    const Icon(Icons.history),
                    "History",
                    3,
                    primary,
                    context,
                  ),
                  HGap.x3(),
                  navItem(
                    const Icon(LucideIcons.user),
                    "Profile",
                    4,
                    primary,
                    context,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget navItem(
      Widget icon,
      String label,
      int index,
      Color primary,
      BuildContext context,
      ) {
    final active = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8),
        constraints: const BoxConstraints(minWidth: 50),
        decoration: BoxDecoration(
          color: active ? primary.withOpacity(0.10) : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(color: active ? primary : Colors.black),
              child: icon,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playButton(Color primary, BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(2),
      child: Image.asset(
        'assets/images/play_logo.png',
        height: 66,
        width: 66,
      ),
    );
  }
}