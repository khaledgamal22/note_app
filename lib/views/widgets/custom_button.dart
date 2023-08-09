import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/constant.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton(
      {super.key, required this.onTap, this.isLoading = false});

  final void Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: isLoading
                  ? const SizedBox(
                      child: CircularProgressIndicator(color: Colors.black,),
                      width: 24,
                      height: 24,
                    )
                  : const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
        ),
      ),
    );
  }
}
