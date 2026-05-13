import 'package:dartz/dartz.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Either<Fail<String>, Unit>> launchUrlLink(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    return left(Fail<String>("Unable to launch url"));
  }
  return right(unit);
}
