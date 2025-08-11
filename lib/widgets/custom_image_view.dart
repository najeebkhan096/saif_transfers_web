import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import '../enum/image_type.dart';
import '../theme/theme_helper.dart';

/// Extension to determine the type of image based on the path
extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return endsWith('.svg') ? ImageType.networkSvg : ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

/// A highly customizable widget that supports network, SVG, file, and asset images.
class CustomImageView extends StatelessWidget {
  CustomImageView({
    super.key,
    String? imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder,
  })  : imagePath = (imagePath?.isNotEmpty ?? false)
      ? imagePath!
      : ImageConstants.imgImageNotFound;

  /// Image path (asset, network, svg, file).
  final String imagePath;

  /// Image height
  final double? height;

  /// Image width
  final double? width;

  /// Image color filter
  final Color? color;

  /// BoxFit type (e.g., BoxFit.cover)
  final BoxFit? fit;

  /// Placeholder (used when image fails to load)
  final String? placeHolder;

  /// Image alignment inside its parent
  final Alignment? alignment;

  /// Tap callback
  final VoidCallback? onTap;

  /// Outer margin
  final EdgeInsetsGeometry? margin;

  /// Border radius
  final BorderRadius? radius;

  /// Optional border around image
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImageContent();
    final withBorder = _wrapWithBorder(imageWidget);
    final withRadius = _wrapWithRadius(withBorder);
    final withTap = InkWell(onTap: onTap, child: withRadius);
    final withMargin = Padding(padding: margin ?? EdgeInsets.zero, child: withTap);

    return alignment != null
        ? Align(alignment: alignment!, child: withMargin)
        : withMargin;
  }

  Widget _wrapWithRadius(Widget child) {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius!,
        child: child,
      );
    }
    return child;
  }

  Widget _wrapWithBorder(Widget child) {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: child,
      );
    }
    return child;
  }

  Widget _buildImageContent() {
    switch (imagePath.imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        );

      case ImageType.file:
        return Image.file(
          File(imagePath),
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );

      case ImageType.networkSvg:
        return SvgPicture.network(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        );

      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: imagePath,
          height: height,
          width: width,
          fit: fit,
          color: color,
          placeholder: (context, url) => SizedBox(
            height: 30,
            width: 30,
            child: LinearProgressIndicator(
              color: appTheme.grey200,
              backgroundColor: appTheme.grey100,
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeHolder ?? ImageConstants.imgImageNotFound,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          ),
        );

      case ImageType.png:
      default:
        return Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
    }
  }
}
