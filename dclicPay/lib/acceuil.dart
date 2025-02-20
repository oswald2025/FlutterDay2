import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  // Liste des transactions récentes
  List<Map<String, String>> transactions = [
    {
      'image': 'assets/person1.png',
      'name': 'Babalola René',
      'date': '2025-02-18',
      'amount': '\$1200',
    },
    {
      'image': 'assets/person2.png',
      'name': 'Arafat',
      'date': '2025-02-19',
      'amount': '-\$2500',
    },
    {
      'image': 'assets/person3.png',
      'name': 'Moussinou',
      'date': '2025-02-20',
      'amount': '\$350',
    },
    {
      'image': 'assets/person4.png',
      'name': 'Abladon Abdoul',
      'date': '2025-02-21',
      'amount': '-\$180',
    },
    {
      'image': 'assets/person5.png',
      'name': 'Gérad pianiste',
      'date': '2025-02-22',
      'amount': '\$450',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre du haut (Avatar, Bonjour et Recherche)
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/pngegg.png'),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    'Hello Oswald',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 13, 13, 13),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.search_rounded, color: Colors.white),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Recherche activée")),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Carte de bienvenue
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Bienvenue sur DclicPay ! Efficace et rapide",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),

            // Carte du solde
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 15,
                    left: 15,
                    child: Text(
                      "Oswald account",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const Positioned(
                    top: 15,
                    right: 15,
                    child: Text(
                      "Oswald account",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const Positioned(
                    bottom: 15,
                    left: 15,
                    child: Text(
                      "Added card: 05",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const Positioned(
                    bottom: 15,
                    right: 15,
                    child: Text(
                      "Ac. no. 2234521",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "\$989 254 457",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Arial",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Section Feature avec See more
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Feature",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Voir plus de fonctionnalités"),
                      ),
                    );
                  },
                  child: const Text(
                    "See more",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            // Liste des fonctionnalités sous forme de boutons rectangulaires
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _featureButton(Icons.send, "Send"),
                _featureButton(Icons.download, "Receive"),
                _featureButton(Icons.card_giftcard, "Rewards"),
              ],
            ),
            const SizedBox(height: 20),
            // Section des transactions récentes
            const Text(
              "Recent Activity",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 0),
            // Liste déroulante des transactions
            ListView.builder(
              shrinkWrap:
                  true, // Important pour que la ListView ne prenne pas trop de place
              physics:
                  NeverScrollableScrollPhysics(), // Empêche la ListView de faire défiler indépendamment
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return _transactionItem(
                  transactions[index]['image']!,
                  transactions[index]['name']!,
                  transactions[index]['date']!,
                  transactions[index]['amount']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour afficher un bouton rectangulaire avec une icône
  Widget _featureButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(100, 50), // Contrôle la taille du bouton
      ),
    );
  }

  // Widget pour afficher un item de transaction
  Widget _transactionItem(
    String image,
    String name,
    String date,
    String amount,
  ) {
    // Déterminer si le montant est négatif ou positif
    bool isNegative = amount.startsWith('-');
    TextStyle amountTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:
          isNegative
              ? Colors.red
              : Colors.green, // rouge pour négatif, vert pour positif
    );

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(image)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              amount,
              style:
                  amountTextStyle, // Application du style selon positif ou négatif
            ),
          ],
        ),
        subtitle: Text(
          date,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
