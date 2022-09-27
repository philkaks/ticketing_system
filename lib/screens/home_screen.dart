import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authentication/authentication_client.dart';
import '../authentication/login_page.dart';
import '../components/movie_card.dart';
import '../components/red_rounded_action_button.dart';
import '../movienames.dart';
import '../components/background_gradient_image.dart';
import '../const.dart';
import 'buy_ticket.dart';

class MyHomePage extends StatefulWidget {
  int index = 1;
  final User user;
  MyHomePage({Key? key, required this.user}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isProgress = false;
  final _authClient = AuthenticationClient();
  @override
  Widget build(BuildContext context) {
    final String backgroundImage = movies[widget.index].imageURL;
    final String age = movies[widget.index].age;
    final String rating = movies[widget.index].rating.toString();
    final String year = movies[widget.index].date.year.toString();
    final String categories = movies[widget.index].categorires;
    final String technology = movies[widget.index].technology;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundGradientImage(
            image: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                //const MovieAppBar(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 56.0)),
                const Text(
                  'NEW.CONCERTS',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
             
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                
                const SizedBox(
                  height: 200.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          year,
                          style: kSmallMainTextStyle,
                        ),
                        const Text('•', style: kPromaryColorTextStyle),
                        Text(
                          categories,
                          style: kSmallMainTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text('•', style: kPromaryColorTextStyle),
                        Text(technology, style: kSmallMainTextStyle),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/divider.png'),
                RedRoundedActionButton(
                    text: 'BUY TICKET',
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyTicket(
                              movies[widget.index].title,
                              movies[widget.index].price),
                        ),
                      );
                    }),
                Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //shrinkWrap: true,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                              title: movies[index].title,
                              imageLink: movies[index].imageURL,
                              active: index == widget.index ? true : false,
                              callBack: () {
                                setState(() {
                                  widget.index = index;
                                });
                              });
                        })),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: kBackgroundColor,
        elevation: 20,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: kPimaryColor,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xeff0dfe1),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.person, color: kPimaryColor),
                title: Text('${widget.user.displayName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                onTap: () {},
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                  color: kPimaryColor,
                ),
                title: Text(
                  widget.user.email.toString(),
                  style: kMainTextStyle.copyWith(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                onTap: () {},
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kActionColor,
                  fixedSize: const Size(30, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () async {
                setState(() {
                  _isProgress = true;
                });
                await _authClient.logoutUser();
                setState(() {
                  _isProgress = false;
                });
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 130,
            // ),
            // const Center(
            //   child: Text(
            //     'Terms and conditions Apply',
            //     style: TextStyle(color: Colors.blue),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
