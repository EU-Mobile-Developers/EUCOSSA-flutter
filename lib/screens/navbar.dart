import 'package:flutter/material.dart';

drawerNav() {
  return Drawer(
    child: SafeArea(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: const Text('johndoe@gmail.com',
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjR8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 218, 172, 72),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1638448937798-f516bc697a0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdvbGQlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Profile'),
            // onTap: () => null,
          ),
          const ListTile(
            leading: Icon(Icons.post_add_outlined),
            title: Text('Posts'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          Container(
            height: 250,
          ),
          // const Divider(
          //   color: Colors.transparent,
          // ),
          // const Divider(
          //   color: Colors.transparent,
          // ),
          // const Divider(
          //   color: Colors.transparent,
          // ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
