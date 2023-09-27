import 'package:white_noice_concept_app/models/category_model.dart';
import 'package:white_noice_concept_app/models/sound_model.dart';
import 'package:white_noice_concept_app/resources/images.dart';

class AppData {
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 6,
      image: Images.otherImage,
      name: 'Other',
      desc: 'Exploring Uncharted Soundscapes',
    ),
    CategoryModel(
      id: 2,
      image: Images.flowImage,
      name: 'Flow',
      desc: 'Dive into the rhythmic currents',
    ),
    CategoryModel(
      id: 5,
      image: Images.naturalImage,
      name: 'Natural',
      desc: "Harmonizing with Nature's Melodies",
    ),
    CategoryModel(
      id: 4,
      image: Images.forestImage,
      name: 'Forest',
      desc: 'Being in the forest',
    ),
    CategoryModel(
      id: 8,
      image: Images.rainImage,
      name: 'Rain',
      desc: 'Immersed in the rain',
    ),
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
