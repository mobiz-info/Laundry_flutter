import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_falcon/Customers/my_profile.dart';
import '../Customers/Notifications.dart';
import '../src/Color.dart';

class ScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String? name;
  final double appBarHeight;
  final String imagepath;
  final SvgPicture? svgImage;
  final bool? svgNeed;
  final bool? needAction;
  final bool? needRadius;
  final bool? needAlign;
  final bool? needText;
  final bool? colorChange;
  final bool? needCart;
  final bool? backArrow;
  void Function()? onpressed;
  final String? countText;

  ScreenAppbar({required this.text, this.name, this.appBarHeight = 159.0, this.backArrow, this.svgImage, required this.imagepath, this.needAction, this.needRadius, this.needAlign, this.needText, this.colorChange, this.needCart, this.onpressed, this.countText, this.svgNeed});

  @override
  Size get preferredSize {
    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backArrow == false ? false : true,
      surfaceTintColor: Colors.white,
      iconTheme: IconThemeData(color: colorChange == true ? Colors.white : primaryColor),
      backgroundColor: colorChange == true ? primaryColor : Colors.white,
      shape: needRadius == false ?
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ) :
      const RoundedRectangleBorder(side: BorderSide(width: 1, color: primaryColor),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      actions: [
        needAction == true ? IconButton(
          iconSize: appBarHeight * 0.25, // Adjust icon size
          icon: SvgPicture.asset('Assets/Images/notification_icon.svg'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications()));
          },
        ) : needCart == true ? Stack(
          children: [
            IconButton(
              iconSize: appBarHeight * 0.25, // Adjust icon size
              icon: SvgPicture.asset('Assets/Images/cart_icon.svg'),
              onPressed: onpressed,
            ),
            Positioned(
              right: 10, top: 5,
              child: Container(
                height: 14, width: 14,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Text(countText!.toString(), textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ) : Container(),
        // Your actions here
      ],
      flexibleSpace: needAlign == false ?
      Container(
        margin: const EdgeInsets.only(top: 62),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58, width: 58,
              child: svgNeed == true ? SvgPicture.asset(imagepath) : Image.asset(imagepath),
            ),
            const SizedBox(width: 22),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: textgray)),
                //const SizedBox(height: 2),
                Text(name!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: primaryColor)),
                // SizedBox(
                //   height: 32,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile()));
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white, surfaceTintColor: Colors.white, elevation: 0,
                //         side: const BorderSide(width: 1.0, color: primaryColor),
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                //     ),
                //     child: const Text('EDIT PROFILE', style: TextStyle(fontSize: 13.0, color: primaryColor, fontWeight: FontWeight.w600),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ) :
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 81, height: 99,
              child: svgNeed == true ? SvgPicture.asset(imagepath) : Image.asset(imagepath),
            ),
            text.isEmpty == true ? Container() :
            Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: colorChange == true ? Colors.white : primaryColor)),
          ],
        ),
      ),
    );
  }
}
