import 'package:white_noice_concept_app/models/sound_model.dart';
import 'package:white_noice_concept_app/resources/images.dart';

class AppData {
  static const List<String> categories = [
    'OTHER',
    'FLOW',
    'NATURAL',
    'FOREST',
    'RAIN',
  ];

  static const List<SoundModel> sounds = [
    SoundModel(
      image: Images.image1,
      name: 'Sound of wind',
      seconds: 1.34,
    ),
    SoundModel(
      image: Images.image2,
      name: 'The cry of insects',
      seconds: 1.34,
    ),
    SoundModel(
      image: Images.image3,
      name: 'Bird cry',
      seconds: 1.34,
    ),
  ];
}
