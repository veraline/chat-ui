import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage() ,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _globalKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     IconButton(
                       onPressed: (){
                         _globalKey.currentState!.openDrawer();

                     },
                     icon: const Icon(
                       Icons.menu, color: Colors.white,
                     )
                     ,),
                     IconButton(
                       onPressed: (){

                       },
                       icon: const  Icon(
                         Icons.search, color: Colors.white,
                       )
                       ,)

                   ],
                 ),
               ),
              SizedBox(height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                children: [
                  TextButton(onPressed: (){},
                      child: const Text('Messages',
                      style: TextStyle(color: Colors.white, fontSize: 20),)
                  ),
                  const SizedBox(width: 35,),

                  TextButton(onPressed: (){},
                      child: const Text('Online',
                        style: TextStyle(color: Colors.grey, fontSize: 20),)
                  ),
                  const SizedBox(width: 35,),

                  TextButton(onPressed: (){},
                      child: const Text('Groups',
                        style: TextStyle(color: Colors.grey, fontSize: 20),)
                  ),
                  const SizedBox(width: 35,),

                  TextButton(onPressed: (){},
                      child: const Text('Calls',
                        style: TextStyle(color: Colors.grey, fontSize: 20),)
                  ),
                  const SizedBox(width: 35,),
                ],
              ),)
            ],
          ),

          Positioned(
            top: 190,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
            height: 220,
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40)

              )
            ),

          child: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text('Favorite Contacts',
               style: TextStyle(color: Colors.white, fontSize: 16),),

              IconButton(
                onPressed: (){
                },
                icon: const  Icon(
                  Icons.more_horiz, color: Colors.white, size: 25,
                )
                ,)
            ],
          ),

              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:  [
                    buildavatar('Ella', 'avatar 1.jpg'),
                    buildavatar('Precious', 'avatar 3.jpg'),
                    buildavatar('Solomon', 'avatar 5.jpg'),
                    buildavatar('Ella', 'avatar 4.jpg'),
                    buildavatar('Louis', 'avatar 2.jpg'),
                    buildavatar('Solomon', 'avatar 5.jpg'),
                  ],
                ),
              )
                ]
          )
          ),


    ),
          Positioned(
            top: 365,
              left: 0,
              right: 0,
              bottom: 0,

              child:Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
             borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
             topLeft: Radius.circular(40)

    )
                ),
                child: ListView(
                  padding: const EdgeInsets.only(left: 25),
                  children:   [
                    ConversationRow('Mary', 'How are you?', 'avatar 3.jpg', 0),
                    ConversationRow('Ella', 'Pls call me', 'avatar 4.jpg', 2),
                    ConversationRow('Precious', 'I lost my phone', 'avatar 3.jpg', 5),
                    ConversationRow('David', 'I need You ', 'avatar 3.jpg', 0),
                    ConversationRow('David', 'I got gist for you ', 'avatar 3.jpg', 0),
                    ConversationRow('David', 'Fuck You ', 'avatar 3.jpg', 0),
                    ConversationRow('David', 'Ifeanyi dor marry', 'avatar 3.jpg', 0),
                  ],
                ),
              )
          )
    ]
      ),
      drawer:const  Drawer(
        width: 285,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(40))
        ),
        backgroundColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,50,20,50),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white,),
                  SizedBox(width: 56,),
                  Text('Settings', style: TextStyle(color: Colors.white, fontSize: 20),)
                ],
              ),
               SizedBox(height: 30,),
              Row(
                children: [
                  UserAvatar(filename: 'avatar 3.jpg'),
                  SizedBox(width: 12,),
                  Text('Vera Ndulue', style: TextStyle(color: Colors.white, fontSize: 20),)
                ],
              ),
              SizedBox(height: 35,),
              DrawerIcons(tittle: 'Chats', icon: Icons.chat_bubble,),
              DrawerIcons(tittle: 'Notification', icon: Icons.notifications,),
              DrawerIcons(tittle: 'Data And Storage', icon: Icons.storage,),
              DrawerIcons(tittle: 'Help', icon: Icons.help,),

              Divider(
                height: 35,
                thickness: 1.0,
                color: Colors.cyan,
              ),
              DrawerIcons(tittle: 'Invite a friend', icon: Icons.people_outlined,),
              DrawerIcons(tittle: 'Log Out', icon: Icons.logout,),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.edit_outlined, size: 30,),
        ),
      ),
    );
  }

  Column ConversationRow(String name, String message, String filename, int msgcount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(filename: filename),
                const SizedBox(width: 15), // Removed the 'const' keyword
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, // Use the 'name' parameter here
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 5,),
                    Text(message, // Use the 'message' parameter here
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, right: 25),
              child: Column(
                children: [
                  const Text('18:00', style: TextStyle(fontSize: 12),),
                 const  SizedBox(height: 15,),
                  if(msgcount > 0)
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.cyan,
                    child: Text(msgcount.toString(), style: const TextStyle(fontSize: 12, color: Colors.white),),
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(
          indent: 70,
        )
      ],
    );
  }


  Padding buildavatar( String name, String filename) {
    return  Padding(
      padding:  const EdgeInsets.only(right: 25),
      child:   Column(
                      children: [
                        UserAvatar(filename: filename,
                        ),

                       const  SizedBox(height: 5,),
                        Text(name,
                          style: const TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
    );
  }
}

class DrawerIcons extends StatelessWidget {
  final String tittle;
  final IconData icon;
  const DrawerIcons({
    super.key, required this.tittle, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){

        } ,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            SizedBox(width: 56,),
            Text(tittle, style: TextStyle(color: Colors.white, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key, required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius:32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/avatar/$filename').image,
      ),
    );
  }
}
