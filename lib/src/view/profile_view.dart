import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/flutter_logo.png')),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Nama Bisnis',
                      style: TextStyle(fontSize: 20),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.amber,
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Badge 1',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Badge 1',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.redAccent,
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Badge 1',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                    'lorem ipsum dolor sit amet, consectetur adip non pro id, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam et e quis nostr')
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
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.navigate_next),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.exit_to_app),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.navigate_next),
                  ),
                  onTap: () {},
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
