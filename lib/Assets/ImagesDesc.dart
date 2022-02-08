class Plant {
  final String imageUrl;
  final String name;
  final String category;
  final int price;
  final String size;
  final String description;

  Plant({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
  });
}

final List<Plant> plants = [
  Plant(
    imageUrl: 'assets/images/plant0.png',
    name: 'Playstation 5',
    category: 'CONSOLE',
    price: 500,
    size: 'large',
    description:
        'he PlayStation 5 (PS5) is a home video game console developed by Sony Interactive Entertainment.'
            ' The PlayStation 5\'s main hardware features include a solid-state drive customized for high-speed data streaming to enable significant improvements in storage performance, an AMD GPU capable of 4K resolution display at up to 120 frames per second, hardware-accelerated ray tracing for realistic lighting and reflections, and the Tempest Engine allowing for hardware-accelerated 3D audio effects. Other features include the DualSense controller with haptic feedback and backward compatibility with most of the PlayStation 4 and PlayStation VR games.'
,
  ),
  Plant(
    imageUrl: 'assets/images/plant1.png',
    name: 'Xbox Series X/S',
    category: 'CONSOLE',
    price: 300,
    size: 'Large',
    description:
        'The Xbox Series X and the Xbox Series S (collectively, the Xbox Series X/S[b]) are home video game consoles developed by Microsoft. They were both released on November 10, 2020 as the fourth generation of the Xbox console family, succeeding the Xbox One family. Along with Sony\'s PlayStation 5, also released in November 2020, the Xbox Series X and Series S are part of the ninth generation of video game consoles'
    'The Xbox Series X has higher end hardware, and supports higher display resolutions (up to 8K resolution) along with higher frame rates and real-time ray tracing; it also has a high-speed solid-state drive to reduce loading times. The less expensive Xbox Series S uses the same CPU, but has a less powerful GPU, has less memory and internal storage, and lacks an optical drive. Both consoles are designed to support nearly all Xbox One games, controllers, and accessories, including those games from older Xbox consoles supported by Xbox One\'s backwards compatibility. ',
  ),
  Plant(
    imageUrl: 'assets/images/plant2.png',
    name: 'Nintendo Switch',
    category: 'CONSOLE',
    price: 300,
    size: 'small',
    description:
        'The Nintendo Switch[h] is a video game console developed by Nintendo and released worldwide in most regions on March 3, 2017. The console itself is a tablet that can either be docked for use as a home console or used as a portable device, making it a hybrid console'
      'As an eighth-generation console, the Nintendo Switch competes with Microsoft\'s Xbox One and Sonys PlayStation 4. Nearly three million console units were shipped in its first month, exceeding Nintendo\'s initial projection of two million and within a year of release achieved over 14 million units sold worldwide, outselling total lifetime sales of the Wii U. By the start of 2018, the Switch became the fastest-selling home or hybrid console in both Japan and the United States. As of June 2021, the Nintendo Switch and Nintendo Switch Lite have sold more than 89 million units worldwide. Switch sales have been strongly tied to sales of Nintendo\'s first-party titles, with six games—The Legend of Zelda: Breath of the Wild, Mario Kart 8 Deluxe, Super Mario Odyssey, Super Smash Bros. Ultimate, Pokémon Sword and Shield, and Animal Crossing: New Horizons—having sold over twenty million units each.'
  ),
];
