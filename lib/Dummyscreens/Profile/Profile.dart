import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:test5/theme.dart';
import '../../Services/user_local_service.dart';
import '../../app/components/ui/gap.dart';
import 'EditProfileSheet.dart';
import 'change_password.dart';
import 'deleteAccount.dart';
import 'logout.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            const VGap.x5(),
            const ProfileHeader(),
            const VGap(height: 30),
            ProfileInfo(key: UniqueKey()),

            const VGap.x5(),

            GeneralSection(onUpdated: refresh),

            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: context.theme.textTheme.titleLarge?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  Map<String, String> user = {};

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final data = await UserLocalService.getUser();
    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = context.colorScheme.primary;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primary, width: 3.3),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/players/hassan.png"),
          ),
        ),

        VGap.x4(),

        Text(
          user['name']?.isNotEmpty == true ? user['name']! : "No Name",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        VGap.x2(),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 18),
            HGap.x1(),
            Text(
              user['city']?.isNotEmpty == true ? user['city']! : "No City",
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),

        VGap.x5(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            statItem("Total Matches", "20"),
            divider(),
            statItem("Upcoming Matches", "9"),
            divider(),
            rankItem(primary),
          ],
        ),
      ],
    );
  }

  Widget statItem(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        VGap.x1(),
        Text(value, style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget divider() {
    return Container(height: 40, width: 2, color: const Color(0xFFE2E4E9));
  }

  Widget rankItem(Color primary) {
    return Column(
      children: [
        const Text("Rank", style: TextStyle(fontSize: 10)),
        VGap.x1(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
          child: const Text("A"),
        ),
      ],
    );
  }
}
class GeneralSection extends StatelessWidget {
  final VoidCallback onUpdated;

  const GeneralSection({super.key, required this.onUpdated});

  void _openEditProfile(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const EditProfileSheet(),
    );

    if (result == true) {
      onUpdated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VGap(height: 30),

        /// Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text("General", style: context.textTheme.titleMedium),
        ),
        VGap.x4(),
        Column(
          children: [
            menuItem(
              context,
              const HugeIcon(
                icon: HugeIcons.strokeRoundedEditUser02,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Edit Profile",
              onTap: () => _openEditProfile(context),
            ),
            VGap.x2(),
            divider(),

            VGap.x2(),
            menuItem(
              context,
              const HugeIcon(
                icon: HugeIcons.strokeRoundedNotification01,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Notifications",
            ),
            VGap.x2(),
            divider(),

            VGap.x2(),
            menuItem(
              context,
              const HugeIcon(
                icon: HugeIcons.strokeRoundedRanking,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Request Level Upgrade",
            ),
            VGap.x2(),
            divider(),

            VGap.x2(),
            menuItem(
              context,
              const HugeIcon(
                icon: HugeIcons.strokeRoundedSquareLockPassword,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Change Password",
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const ChangePasswordSheet(),
                );
              }
            ),
            VGap.x2(),
            divider(),

            VGap.x2(),
            menuItem(
              context,
              const HugeIcon(
                icon: HugeIcons.strokeRoundedDelete02,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Delete Account",
    onTap: () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const deleteAccount(),
      );
    }
            ),
            VGap.x2(),
            divider(),

            VGap.x2(),
            menuItem(
              context,
              const HugeIcon(
                icon: HugeIcons.strokeRoundedLogout05,
                size: 24,
                strokeWidth: 1.5,
              ),
              "Logout",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const Logout(),
                  );
                }
            ),
          ],
        )
      ],
    );
  }

  Widget menuItem(
      BuildContext context,
      Widget icon,
      String title, {
      VoidCallback? onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 14),
        child: Row(
          children: [
            /// Icon
            icon,

            HGap(width: 10),

            /// Title
            Expanded(
              child: Text(
                title,
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ),

            /// Arrow
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return const Divider(color: Color(0xFFE2E4E9), height: 1, thickness: 1);
  }
}

