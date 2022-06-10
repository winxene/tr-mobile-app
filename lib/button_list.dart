import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trmade/button_list2.dart';
import 'package:trmade/my_icons_icons.dart';


/*Jika mau menggunakan icon dari MyIcons, harus meelakukan step ini:
1. Masukkan MyIcons.ttf pada assets => icons
2. Masukkan file my_icons_icons.dart ke folder lib
3. Tambahakan assets icon pada pubspec.yaml di bagian font 
*/
//tekan big blue button ke page selanjutnya (berisi button list)


class ButtonList extends StatelessWidget {
  final numbers = List.generate(100, (index) => '$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            'Button List',
            style: GoogleFonts.adamina(
              fontSize: 40,
              color: Colors.cyanAccent,
            ),
          ),
        ),
      ),
      body: Container(
        child: GridView(
          children: [
            Icon(
              Icons.call,
              size: 50,
            ), //phone icon
            Icon(
              Icons.home,
              size: 50,
            ), //home icon
            Icon(
              Icons.search,
              size: 50,
            ), //search icon
            Icon(
              Icons.favorite,
              size: 50,
            ), //favorite/heart icon
            Icon(
              Icons.headset_mic_rounded,
              size: 50,
            ), //customer support icon

            Icon(
              Icons.history,
              size: 50,
            ), //history icon 1
            Icon(
              Icons.history_edu,
              size: 50,
            ), //history icon 2
            Icon(
              MyIcons.history_pen,
              size: 50,
            ), //history icon 3
            Icon(
              MyIcons.pencil_writing_on_a_paper_svgrepo_com,
              size: 50,
            ), //history icon 4
            Icon(
              MyIcons.paper_page_law_svgrepo_com,
              size: 50,
            ), //history icon 5
            Icon(
              MyIcons.pencil_writing_on_paper_svgrepo_com,
              size: 50,
            ), //history icon 6

            Icon(
              Icons.credit_card,
              size: 50,
            ), //top up icon 1
            Icon(
              FontAwesomeIcons.creditCard,
              size: 38,
            ), //top up icon 2
            Icon(
              MyIcons.hand_holding_credit_card_svgrepo_com,
              size: 50,
            ), //top up icon 3
            Icon(
              MyIcons.credit_card_payment_svgrepo_com,
              size: 50,
            ), //top up icon 4
            Icon(
              MyIcons.credit_card_plus,
              size: 50,
            ), //top up icon 5

            Icon(
              FontAwesomeIcons.user,
              size: 50,
            ), //user/personal data icon 1
            Icon(
              FontAwesomeIcons.circleUser,
              size: 50,
            ), //user/personal data icon 2
            Icon(
              FontAwesomeIcons.solidCircleUser,
              size: 50,
            ), //user/personal data icon 3

            Icon(
              Icons.qr_code_scanner_outlined,
              size: 50,
            ), //barcode icon
            Icon(
              FontAwesomeIcons.gear,
              size: 50,
            ), //settings icon

            FloatingActionButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ButtonList2();
                }),
              );
            })
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
