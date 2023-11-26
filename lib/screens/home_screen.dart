import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
  List<dynamic> foods = [
    {
      "image": "assets/images/pizza.png",
      "isFavorite": false,
    },
    {
      "image": "assets/images/pizza1.png",
      "isFavorite": false,
    },
    {
      "image": "assets/images/spansh.png",
      "isFavorite": false,
    },
    {
      "image": "assets/images/pizza2.png",
      "isFavorite": false,
    },
    {
      "image": "assets/images/pizza3.png",
      "isFavorite": false,
    },
    {
      "image": "assets/images/pizza.png",
      "isFavorite": false,
    },
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Text(
          'Food Delivery',
          style: TextStyle(
              color: Colors.grey[80],
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => makeCategory(
                            title: categories[index], index: index)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const PageScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: foods.length,
                    itemBuilder: (context, index) => makeItem(
                        image: foods[index]["image"],
                        isFavorite: foods[index]["isFavorite"],
                        index: index),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    childAspectRatio:1 / 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                ),),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({title, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: AnimatedContainer(
        width: 120,
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:
              selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    selectedCategory == index ? Colors.black : Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, isFavorite, index}) {
    return AspectRatio(
      aspectRatio: 1 / 1.7,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, stops: const [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        foods[index]["isFavorite"] =
                            !foods[index]["isFavorite"];
                      });
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1.5,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors.transparent,
                              )),
                          child: isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ 15.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vegetarian Pizza",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
