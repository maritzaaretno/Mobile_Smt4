import 'package:bab3_flutterlayout/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_screen.dart';
import 'model/tourism_place.dart';
import 'provider/done_tourism_provider.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList>{
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl. Pemuda',
      imageAsset: 'assets/images/submarine.jpg',
      desc:'Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. '
          'Clean and well maintaned. Car park cost 10k, entrance fee 15k/person.'
          'You can see KRI Pasopati there, it is a russian whiskey class.'
          'You can also watch the video about the Indonesian Navy at the buiding beside the submarine',
      day: 'Everyday',
      open:'08.00 - 16.00',
      cost:'Rp 10.000',
      img1:'assets/images/monkasel_1.jpg',
      img2:'assets/images/monkasel_2.jpg',
      img3:'assets/images/monkasel_3.jpg',
    ),
    TourismPlace(
      name: 'Kelenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/klenteng.jpg',
      desc:'Sanggar Agung Temple or Hong San Tang is a Chinese temple in Surabaya dedicated to Chinese deities and other Asian religious icons.'
          'It is located within the Pantai Ria amusement park and has become a tourist destination, even though it is originally a worship place for Tridharma followers.',
      day: 'Everyday',
      open: '07.00 - 20.00',
      cost: 'Rp 5.000 - Rp 10.000',
      img1:'assets/images/klenteng.jpg',
      img2:'assets/images/klenteng2.jpg',
      img3:'assets/images/klenteng3.jpeg',
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/sampoerna.jpg',
      desc: 'The House of Sampoerna is a tobacco museum and headquarters of Sampoerna located in Surabaya.'
          'The main buildings architectural style influenced by Dutch colonial-style compound was built in 1862, and is now a preserved historical site.',
      day:'Senin - Minggu',
      open:'09.00 - 18.00',
      cost:'Free',
      img1:'assets/images/sampoerna.jpg',
      img2:'assets/images/sampoerna2.jpg',
      img3:'assets/images/sampoerna3.jpg',
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun - Alun Contong',
      imageAsset: 'assets/images/pahlawan.jpg',
      desc: 'The Heroes Monument is a monument in Surabaya, East Java, Indonesia. It is the main symbol of the city, '
          'dedicated to the people who died during the Battle of Surabaya on 10 November 1945. The 10 November Museum is located under the monument',
      day: 'Senin - Minggu',
      open: '08.00 - 16.00',
      cost: 'Rp 5.000',
      img1:'assets/images/pahlawan.jpg',
      img2:'assets/images/pahlawan2.jpg',
      img3:'assets/images/pahlawan3.jpg',
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/suroboyo.jpg',
      desc:'Patung Sura dan Baya (Jawa: Patung Suro lan Boyo) adalah sebuah patung yang merupakan lambang kota Surabaya. Patung ini berada di depan Kebun Binatang Surabaya. '
          'Patung ini terdiri atas dua hewan yaitu buaya dan hiu yang menjadi inspirasi nama kota Surabaya: ikan sura (hiu) dan baya (buaya)',
      day: 'Senin - Minggu',
      open: '24 Hours',
      cost:'Free',
      img1:'assets/images/suroboyo.jpg',
      img2:'assets/images/suroboyo2.jpg',
      img3:'assets/images/suroboyo3.jpg',
    ),
    TourismPlace(
      name: 'Kebun Binatang Surabaya',
      location: 'Wonokromo',
      imageAsset: 'assets/images/kbs.jpg',
      desc:'Surabaya Zoo was established by decree of the Governor General of the Netherlands East Indies on 31 August 1916 as Soerabaiasche Planten-en Dierentuin on the merit of the journalist H. F. K. Kommer who had the hobby of collecting animals',
      day: 'Senin - Minggu',
      open: '24 Hours',
      cost:'Rp 15.000 - Rp 100.000',
      img1:'assets/images/kbs.jpg',
      img2:'assets/images/kbs2.jpg',
      img3:'assets/images/kbs.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
            builder:(context, DoneTourismProvider data, widget){
              return ListItem(
                  place: place,
                  isDone: data.doneTourismPlaceList.contains(place),
                  onCheckboxClick: (bool? value){
                    setState(() {
                      if(value!=null){
                        value
                            ? data.doneTourismPlaceList.add(place)
                            : data.doneTourismPlaceList.remove(place);
                      };
                    });
                  },
              );
            }
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}

