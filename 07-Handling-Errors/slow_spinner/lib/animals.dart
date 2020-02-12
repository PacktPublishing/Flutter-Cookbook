class Animals {
  final String name;
  final String filepath;
  final String credit;

  const Animals._internal(this.name, this.filepath, this.credit);

  static const dog = Animals._internal(
      'Dog',
      'images/cassidy-james-blaede-pYlXbIr-Dbw-unsplash.jpg',
      'Cassidy James Blaede');
  static const bunny = Animals._internal(
      'Bunny', 'images/gary-bendig-KvHT4dltPEQ-unsplash.jpg', 'Gary Bending');
  static const cat = Animals._internal(
      'Cat', 'images/max-baskakov-OzAeZPNsLXk-unsplash.jpg', 'Max Baskakov');
  static const giraffe = Animals._internal('Giraffe',
      'images/pawel-czerwinski-ysesCvb2G_Q-unsplash.jpg', 'Pawel Czerwinski');

  static const List<Animals> all = [dog, bunny, cat, giraffe];
}
