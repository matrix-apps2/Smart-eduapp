import 'dart:io';

import '../../../../../utils/helpers/validations/validators.dart';
import '../../../../../utils/resources/resources.dart';
import '../../../../../utils/styles/decoration.dart';
import 'package:flutter/material.dart';

import 'network_image.dart';

class ItemPickedImage extends StatelessWidget {
  final String? path;
  final GestureTapCallback? onRemovePressed;

  const ItemPickedImage({Key? key, required this.path, this.onRemovePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRemovePressed,
      child: Container(
        decoration: const BoxDecoration().listStyle(),
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Validators.isURL(path) || path == null
                ? CustomImage(
                    imageUrl: path,
                    height: 150,
                    radius: kRadius,
                  )
                : ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(kRadius)),
                    child: Image.file(
                      File(path ?? ''),
                      fit: BoxFit.cover,
                    )),
            Visibility(
              visible: onRemovePressed != null,
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(kRadius)),
                color: Colors.black45.withOpacity(.3),
              )),
            ),
            Visibility(
                visible: onRemovePressed != null,
                child: const Icon(Icons.clear,
                    color: Colors.white, size: kIconSize)),
          ],
        ),
      ),
    );
  }
}
