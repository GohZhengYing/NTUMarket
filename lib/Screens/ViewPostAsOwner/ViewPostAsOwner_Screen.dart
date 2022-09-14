import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import 'component/ProductOwner.dart';

import 'component/colordot.dart';

class ViewPostAsOwnerScreen extends StatelessWidget {
  const ViewPostAsOwnerScreen({Key? key, required this.product})
      : super(key: key);

  final ProductOwner product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/Dora.jpg",
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$" + product.price.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "An past year examination paper that has been used by me",
                    ),
                  ),
                  // Text(
                  //   "Colors",
                  //   style: Theme.of(context).textTheme.subtitle2,
                  // ),
                  // const SizedBox(height: defaultPadding / 2),
                  // Row(
                  //   children: const [
                  //     const Spacer(),
                  //     ColorDot(
                  //       color: Color.fromARGB(255, 10, 122, 6),
                  //       isActive: false,
                  //     ),
                  //     ColorDot(
                  //       color: Color(0xFF141B4A),
                  //       isActive: true,
                  //     ),
                  //     ColorDot(
                  //       color: Color(0xFFF4E5C3),
                  //       isActive: false,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Edit"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
