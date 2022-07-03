import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ucar1/model/car_new_model.dart';
import 'package:ucar1/model/car_used_model.dart';

import '../const.dart';
import '../model/car_brand_model.dart';
import '../model/car_type_model.dart';
import '../model/news_model.dart';

class HomePageController extends GetxController {
  ScrollController scrollController = ScrollController();

  List<String> listAds = [Const.ads1, Const.ads2, Const.ads3];

  List<CarBrand> listCarBrandData = [
    CarBrand(logo: Const.honda, name: 'Honda', model: 1200),
    CarBrand(logo: Const.audi, name: 'Audi', model: 1200),
    CarBrand(logo: Const.bmw, name: 'BMW', model: 1200),
    CarBrand(logo: Const.toyota, name: 'Toyota', model: 1200),
    CarBrand(logo: Const.kia, name: 'Kia', model: 1200),
    CarBrand(logo: Const.merc, name: 'Mercedes', model: 1200),
    CarBrand(logo: Const.peugeot, name: 'Peugeot', model: 1200),
    CarBrand(logo: Const.skoda, name: 'Skoda', model: 1200),
    CarBrand(logo: Const.volkswagen, name: 'Volkswagen', model: 1200)
  ];

  List<CarType> listCarType = [
    CarType(logo: Const.couple, name: 'Couple'),
    CarType(logo: Const.sedan, name: 'Sedan'),
    CarType(logo: Const.suv, name: 'SUV'),
    CarType(logo: Const.mpv, name: 'MPV'),
    CarType(logo: Const.hatchback, name: 'Hatchback'),
    CarType(logo: Const.sport, name: 'Sport'),
    CarType(logo: Const.commercial, name: 'Commercial'),
    CarType(logo: Const.classical, name: 'Classic')
  ];

  List<CarUsed> listCarUsed = [
    CarUsed(
        image: Const.carUsed1,
        name: 'Mazda 3 Sedan 1.5 SP (A)',
        price: '83,800',
        date: '05/10/11',
        kmUsed: '8,000',
        installment: '7,000'),
    CarUsed(
        image: Const.carUsed2,
        name: 'BMW 5 Series Sedan 520i (A)',
        price: '83,800',
        date: '05/10/11',
        kmUsed: '8,000',
        installment: '7,000'),
    CarUsed(
        image: Const.carUsed3,
        name: 'Honda CR-V 1.5 Turbo 7-Seater (A)',
        price: '83,800',
        date: '05/10/11',
        kmUsed: '8,000',
        installment: '7,000'),
    CarUsed(
        image: Const.carUsed4,
        name: 'Subaru Forester 2.0 XT (A)',
        price: '83,800',
        date: '05/10/11',
        kmUsed: '8,000',
        installment: '7,000'),
    CarUsed(
        image: Const.carUsed5,
        name: 'Honda Shuttle 1.5 [2017] (A)',
        price: '83,800',
        date: '05/10/11',
        kmUsed: '8,000',
        installment: '7,000'),
  ];

  List<CarNew> listCarNew = [
    CarNew(
        image: Const.carNew1, name: 'Mercedes-Benz E-Class', price: '246,800'),
    CarNew(
        image: Const.carNew2, name: 'Mercedes-Benz E-Class', price: '246,800'),
    CarNew(
        image: Const.carNew3, name: 'Mercedes-Benz E-Class', price: '246,800'),
    CarNew(
        image: Const.carNew4, name: 'Mercedes-Benz E-Class', price: '246,800'),
    CarNew(
        image: Const.carNew5, name: 'Mercedes-Benz E-Class', price: '246,800'),
  ];

  List<News> listNews = [
    News(
        image: Const.news1,
        name:
            'Tesla opens its eighth and latest Supercharger at West Coast Plaza (Updated)',
        author: 'Lionel Kong',
        date: '30'),
    News(
        image: Const.news2,
        name:
            'Tesla opens its eighth and latest Supercharger at West Coast Plaza (Updated)',
        author: 'Lionel Kong',
        date: '30'),
    News(
        image: Const.news3,
        name:
            'Tesla opens its eighth and latest Supercharger at West Coast Plaza (Updated)',
        author: 'Lionel Kong',
        date: '30'),
    News(
        image: Const.news4,
        name:
            'Tesla opens its eighth and latest Supercharger at West Coast Plaza (Updated)',
        author: 'Lionel Kong',
        date: '30'),
    News(
        image: Const.news5,
        name:
            'Tesla opens its eighth and latest Supercharger at West Coast Plaza (Updated)',
        author: 'Lionel Kong',
        date: '30'),
  ];

  List<Widget> listItem(int type) {
    if (type == 0) {
      return List.generate(listCarUsed.length,
          (index) => buildItemCarUsed(listCarUsed.elementAt(index)));
    } else if (type == 1) {
      return List.generate(listCarNew.length,
          (index) => buildItemCarNew(listCarNew.elementAt(index)));
    } else {
      return List.generate(
          listNews.length, (index) => buildItemNews(listNews.elementAt(index)));
    }
  }

  Widget buildItemCarUsed(CarUsed carUsed) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: 224,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    carUsed.image!,
                    width: double.infinity,
                    height: 96,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  carUsed.name!,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text('\$${carUsed.price!}',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text(
                  '${carUsed.date} • ${carUsed.kmUsed} km • ${carUsed.installment} depr.',
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFF5F5F5F)),
                ),
                const SizedBox(height: 8),
              ],
            )).paddingOnly(right: 12));
  }

  Widget buildItemCarNew(CarNew carNew) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: 224,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    carNew.image!,
                    width: double.infinity,
                    height: 96,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  carNew.name!,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text('\$${carNew.price!}',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
              ],
            )).paddingOnly(right: 12));
  }

  Widget buildItemNews(News news) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
            width: 224,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    news.image!,
                    width: double.infinity,
                    height: 96,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 25,
                    width: 50,
                    color: const Color(0xFFF1F1F1),
                    child: Center(
                      child: const Text('News').paddingAll(4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  news.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  '${news.author} • ${news.date}m ago',
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFF5F5F5F)),
                ),
                const SizedBox(height: 8),
              ],
            )).paddingOnly(right: 12));
  }

  List<Widget> listBrand(bool isPopularBrand) {
    if (isPopularBrand) {
      return [
        ...List.generate(
          listCarBrandData.length,
          (index) => buildItemBrand(listCarBrandData.elementAt(index)),
        ),
        buildItemBrand(CarBrand())
      ];
    } else {
      return List.generate(
        listCarType.length,
        (index) => buildItemCarType(listCarType.elementAt(index)),
      );
    }
  }

  Widget buildItemBrand(CarBrand carBrand) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Image.asset(
              carBrand.logo ?? Const.more,
              width: 45,
              height: 45,
            ),
            const SizedBox(height: 8),
            Text(
              carBrand.name ?? 'More',
              style: const TextStyle(fontSize: 12),
            )
          ],
        ));
  }

  Widget buildItemCarType(CarType carType) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xFFF1F1F1)),
                child: Image.asset(
                  carType.logo!,
                  width: 45,
                  height: 45,
                )),
            const SizedBox(height: 8),
            Text(
              carType.name!,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ));
  }
}
