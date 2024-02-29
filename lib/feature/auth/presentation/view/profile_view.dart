import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/feature/auth/presentation/presentation_provider.dart';
import 'package:konekseed_test/feature/auth/presentation/view/edit_profile_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  void logOut(WidgetRef ref, BuildContext context) =>
      ref.read(authNotifierProvider.notifier).logout();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bussiness = ref.watch(authNotifierProvider).bussinessData!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.green.shade200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage(bussiness.logo)),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  bussiness.name,
                  style: const TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    itemCount: bussiness.sector.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = bussiness.sector[index];
                      final colors = [Colors.amber, Colors.red, Colors.blue];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: colors[index],
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Text(bussiness.value)
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  title: const Text('Edit Profile'),
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              EditProfileView(bussiness: bussiness))),
                ),
                ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.exit_to_app),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () => logOut(ref, context),
                ),
                const SizedBox(),
              ],
            ).toList(),
          ),
        ),
      ],
    );
  }
}
