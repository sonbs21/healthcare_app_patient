import 'package:flutter/material.dart';
import 'package:healthcare_mobile/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  late bool backButton;
  late bool profile;

  CustomAppBar({
    Key? key,
    required this.icon,
    required this.backButton,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              backButton ? Navigator.pop(context) : {};
            },
            icon: Icon(
              icon,
              color: AppColors.black,
              size: 25,
            ),
          ),
          profile
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.white,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                )

              // Container(
              //     height: 40,
              //     width: 40,
              //     decoration: const BoxDecoration(
              //       shape: BoxShape.circle,
              //       image: DecorationImage(
              //         image: AssetImage("https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*"),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40,
                  width: 40,
                  child: const Icon(
                    Icons.bookmark,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
        ],
      ),
    );
  }
}
