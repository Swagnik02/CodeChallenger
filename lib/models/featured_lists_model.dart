class FeaturedListsModel {
  String title;
  String subTitle;
  int chapters;
  int questions;
  String bgImageUrl;

  FeaturedListsModel({
    required this.title,
    required this.subTitle,
    required this.chapters,
    required this.questions,
    required this.bgImageUrl,
  });

  static List<FeaturedListsModel> dummyFeaturedLists = [
    FeaturedListsModel(
      title: 'Data Structures and Algorithms',
      subTitle: 'Interview Crash Course',
      chapters: 15,
      questions: 150,
      bgImageUrl: 'assets/images/featured1.png',
    ),
    FeaturedListsModel(
      title: 'System Design for Interviews and Beyond',
      subTitle: 'Interview Crash Course',
      chapters: 12,
      questions: 120,
      bgImageUrl: 'assets/images/featured2.png',
    ),
    FeaturedListsModel(
      title: "Beginner's Guide",
      subTitle: '',
      chapters: 10,
      questions: 100,
      bgImageUrl: 'assets/images/featured3.png',
    ),
  ];
}
