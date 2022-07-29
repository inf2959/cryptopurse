import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mycryptowallet/screens/login_screen.dart';
import 'package:mycryptowallet/screens/signup_screen.dart';
import 'package:mycryptowallet/routes/api_routes.dart';
import 'package:mycryptowallet/widgets/loadingscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Montserrat",
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.white,
          )),
      home: const MyHomePage(title: 'myCryptoWallet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String ethereum = "";
  String bitcoin = "";
  String tether = "";
  String bnb = "";
  String cardano = "";
  String ripple = "";
  String solana = "";
  String polkadot = "";
  String dogecoin = "";
  String litecoin = "";


  @override
  void initState() {
    getValues();
  }

  getValues() async {
    LoadingScreen();
    ethereum = await getPrice("ethereum");
    bitcoin = await getPrice("bitcoin");
    tether = await getPrice("tether");
    bnb = await getPrice("binancecoin");
    cardano = await getPrice("cardano");
    ripple = await getPrice("ripple");
    solana = await getPrice("solana");
    polkadot = await getPrice("polkadot");
    dogecoin = await getPrice("dogecoin");
    litecoin = await getPrice("litecoin");
    
    setState(() {});
  }

  Widget createValues (String icon, String id) {

    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(38, 35, 52, 1),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            height: 65,
            width: 350,
            child: Row(
              children: [
                Image.network(
                  icon,width: 40, height:40,
                ),
                Text(
                  id,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
                Spacer(),
                if (id == "Ethereum")
                Text(
                  ethereum + "€",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
                if (id == "Bitcoin")
                  Text(
                    bitcoin + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Tether")
                  Text(
                    tether + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Ripple")
                  Text(
                    ripple + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Dogecoin")
                  Text(
                    dogecoin + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Binancecoin")
                  Text(
                    bnb + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Cardano")
                  Text(
                    cardano + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Solana")
                  Text(
                    solana + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Polkadot")
                  Text(
                    polkadot + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                if (id == "Litecoin")
                  Text(
                    litecoin + "€",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
              ],
            )));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 18, 31, 1),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Crypto Purse -",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Your personal Crypto Wallet",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: Text("Register",
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  top: 20, right: 60, left: 60, bottom: 20)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.white)))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                        ;
                      }),
                  Spacer(),
                  TextButton(
                      child: Text("Sign in",
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  top: 20, right: 60, left: 60, bottom: 20)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(6, 193, 52, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                        ;
                      }),
                ],
              )),
          Divider(
            height: 5,
            thickness: 0.1,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
          createValues("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/480px-Ethereum-icon-purple.svg.png", "Ethereum"),
          createValues("https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1024px-Bitcoin.svg.png", "Bitcoin"),
          createValues("https://cryptologos.cc/logos/tether-usdt-logo.png", "Tether"),
          createValues("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Binance-coin-bnb-logo.png/800px-Binance-coin-bnb-logo.png", "Binancecoin"),
          createValues("https://cryptologos.cc/logos/cardano-ada-logo.png", "Cardano"),
          createValues("https://cryptologos.cc/logos/xrp-xrp-logo.png?v=023", "Ripple"),
          createValues("https://cryptologos.cc/logos/solana-sol-logo.png?v=023", "Solana"),
          createValues("https://cryptologos.cc/logos/polkadot-new-dot-logo.png?v=023", "Polkadot"),
          createValues("https://cryptologos.cc/logos/dogecoin-doge-logo.png?v=023", "Dogecoin"),
          createValues("https://cryptologos.cc/logos/litecoin-ltc-logo.png?v=023", "Litecoin"),
          /*SingleChildScrollView(
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 35, 52, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                      ),
                      height: 65,
                      width: 350,
                      child: Row(
                        children: [
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/480px-Ethereum-icon-purple.svg.png",
                          ),
                          Text(
                            "Ethereum",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            (ethereum + "€"),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          )
                        ],
                      ))),
            ]),
          )*/
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white38,
        backgroundColor: Color.fromRGBO(20, 18, 31, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_graph,
              color: Colors.white,
            ),
            label: 'Invest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet, color: Colors.white),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
