import 'dart:io';

import '../../../../../generated/assets.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../../utils/helpers/pickers/attach_image.dart';
import '../../../../../utils/helpers/validations/validators.dart';
import 'package:flutter/material.dart';

class CommonPersonImage extends StatelessWidget {
  final String? _imageUrl;

  final double _size;
  final bool _canEdit;
  final Function(String path)? _onAttachImage;

  const CommonPersonImage({
    super.key,
    required String? imageUrl,
    double size = 100,
    bool canEdit = false,
    Function? onEdit,
    Function(String path)? onAttachImage,
  })  : _imageUrl = imageUrl,
        _size = size,
        _canEdit = canEdit,
        _onAttachImage = onAttachImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: _size.r,
            height: _size.r,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10))
              ],
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: (_imageUrl ?? '').isEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        Assets.assetsImagesImgAvatarPlaceholder,
                        fit: BoxFit.cover,
                        width: _size.r,
                        height: _size.r,
                      ),
                    )
                  : !Validators.isURL(_imageUrl)
                      ? Image.file(File(_imageUrl!),
                          width: _size.r, height: _size.r, fit: BoxFit.fill)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FadeInImage.assetNetwork(
                            placeholder:
                                Assets.assetsImagesImgAvatarPlaceholder,
                            width: _size.r,
                            height: _size.r,
                            fit: BoxFit.cover,
                            image: _imageUrl!,
                            imageErrorBuilder: (c, o, s) => Image.asset(
                                Assets.assetsImagesImgAvatarPlaceholder,
                                width: _size.r,
                                height: _size.r,
                                fit: BoxFit.cover),
                          ),
                        ),
            ),
          ),
          if (_canEdit)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      String? path = await onPickImagesPressed(context);
                      if (_onAttachImage != null) {
                        _onAttachImage(path!);
                      }
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
