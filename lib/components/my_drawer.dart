import 'package:flutter/material.dart';
import 'package:food_deliver/components/my_drawer_tile.dart';
import 'package:food_deliver/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [

          //cutlery
          SizedBox(height: 10,),
          Center(
            child: Text(
              '🍽️',
              style: TextStyle(
                fontSize: 80,
              ),
            )
          ),
          SizedBox(height: 30,),

          MyDrawerTile(
            text: "                     Home", 
            icon: Icons.home, 
            onTap: (){
              Navigator.pop(context);
            }
          ),
          SizedBox(height: 10,),

          MyDrawerTile(
            text: "                     Settings", 
            icon: Icons.settings, 
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                )
              );
            }
          ),
          SizedBox(height: 10,),

          const Spacer(),

          MyDrawerTile(
            text: "                     Log out", 
            icon: Icons.logout, 
            onTap: (){}
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}