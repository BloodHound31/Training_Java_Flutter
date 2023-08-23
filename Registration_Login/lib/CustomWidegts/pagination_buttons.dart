import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';

class PaginationButtons extends StatefulWidget {
  final PageController pageController;
  const PaginationButtons({super.key, required this.pageController});

  @override
  State<PaginationButtons> createState() => _PaginationButtonsState();
}

class _PaginationButtonsState extends State<PaginationButtons> {

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    return Visibility(
      visible: (productProvider.productList.length > productProvider.productsToShow),
      //Next and previous button
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                if (widget.pageController.page! > 0) {
                  widget.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ButtonStyle(
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF8B9AD8)),
              ),
              child: const Text(
                'Previous',
                style: TextStyle(color: Color(0xFF29376F)),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                if (widget.pageController.page! <
                    (productProvider.productList.length / productProvider.productsToShow).ceil() - 1) {
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ButtonStyle(
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF8B9AD8)),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Color(0xFF29376F)),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
