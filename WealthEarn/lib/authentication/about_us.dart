import 'package:flutter/material.dart';
import 'package:wealth_earn/screens/account_screen.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1830),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1a1830),
        // ignore: prefer_const_constructors
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const SettingsPage(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3,
                ),
                child: const Text(
                  'Wealth Earn',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Financial success',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'We help our employees build successful futures for themselves through competitive pay.\n \n'
              '  Our average starting hourly wage is \$18 per '
              'hour—more than double the federal minimum wage—for full time, part '
              'time, and seasonal employees and contractors.In addition to fair pay, '
              'employees have opportunities to own Wealth Earn stock, participate in 401(k) '
              'plans with company match, and enroll '
              'in paid life and accident insurance. Financial counseling and estate '
              'planning services are also available, plus paid '
              'short-term and long-term disability if needed.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Building Employee Trust',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'But trust is achievable. And worth it. We human beings are social animals,'
              ' after all. It’s normal for us to trust one another. All of our social '
              'institutions require it. That’s one reason violations of trust feel so'
              ' wrong and hurt so much. They cause rifts in friendships, romantic partnerships, families, neighborhoods, churches, teams, and other organizations. And yet those rifts are not the norm. '
              'They’re not what we typically expect. '
              'In the workplace, we expect to be able to trust our teammates, at least as far as work is concerned. So how do we get there? Let’s examine a few practical ways to build trust at work.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Participating companies',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'ِAmazon. Walmart. Rakuten. eBay. Flipkart.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                child: Image.asset('assets/img1.jpg'),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Products transfer',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'The business partners from whom goods are transferred or to whom goods'
              ' are transferred must be created in the system as retailers (SAP business partners) with'
              ' the order-specific role ship-to partyThe transfer type must be maintained in Customizing '
              'The transfer type groups the sales document types created by the goods transfer, in this case '
              'the return delivery to the sender of the transfer and the outbound delivery to the recipient of the transfer. The sales document types for returns and outbound deliveries are created in Customizing for the standard SAP Sales and Distribution solution.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                child: Image.asset('assets/img2.jpg'),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            const Text(
              'When the Ownership of the goods is transferred to the buyer when the shipping documents are delivered to the buyer and he receives them by paying price of the goods. Thus, on buyers '
              'refusal to take the shipping documents, the Seller can claim the damages for the breach of contract, and not the price of the goods.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Trust transfer theory posits that trust can be transferred from the selling platform to the sellers and has been widely applied in the e-commerce environment. However,'
              ' prior research has overlooked the boundary conditions under which trust can be transfer',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                child: Image.asset('assets/img3.jpg'),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Why USDT Transaction!',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Additionally, tether can be sent anywhere globally much more quickly and with lower fees than transfers at traditional banks and financial institutions. While most people wouldnt'
              ' use bitcoin or ethereum for purchases and daily transactions due to their high volatility, it makes perfect sense to use tether.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Tether USD is available on popular cryptocurrency exchanges, including Binance, BitFinex, Coinbase, and Kraken. You can also get your hands on USDT by converting another cryptocurrency,'
              ' like ETH, into USDT directly in your Trust Wallet.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
