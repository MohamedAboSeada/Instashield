abstract final class AppAssets {
  static final String faceIdIcon = _formImageAssetPath("face_id.svg", true);

  /// provide image name with extension
  static String _formImageAssetPath(String imageName, [bool isIcon = false]) {
    final imagesPath = 'assets/images/${isIcon ? "icons" : "pictures"}';
    return "$imagesPath/$imageName";
  }
}
