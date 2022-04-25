import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';
import '../../models/user_info.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        UserDetails userDetails = UserController.to.getUserDetails;
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 140,
            width: 140,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(userDetails.userImage ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined),
                      onPressed: () {},
                    ),
                  ),
                  bottom: 0,
                  right: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
