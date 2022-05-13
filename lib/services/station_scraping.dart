import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:smartgas/models/scraping_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WebScraping extends StatefulWidget {
  const WebScraping({Key? key}) : super(key: key);

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class _WebScrapingState extends State<WebScraping> {
  List<ScrapingModel> scrapingModel = [];
  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse(
        'https://www.indexoflebanon.com/gas-stations-in-lebanon/index.php');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('div > span.titleSpan')
        .map((element) => element.innerHtml.trim())
        .toList();
    final info = html
        .querySelectorAll('div > span.addSpan')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll('#updates > a')
        .map((e) => e.attributes['href']!)
        .toList();

    final urlImages = html
        .querySelectorAll('> div > img')
        .map((e) => e.attributes['src']!)
        .toList();

    print('Count: ${titles.length}');
    setState(() {
      scrapingModel = List.generate(
          titles.length,
          (index) => ScrapingModel(
              url: urls[index],
              title: titles[index],
              urlImage: urlImages[index],
              information: info[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_sharp),
            onPressed: () {
              setState(() {
                getWebsiteData();
              });
            },
          ),
        ],
        title: Text('NearBy Gas Stations'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: scrapingModel.length,
        itemBuilder: (context, index) {
          final scrapingModels = scrapingModel[index];
          final Uri _url = Uri.parse(scrapingModels.url);
          return GestureDetector(
            onDoubleTap: () async {
              //launcher ^6.1.2
              if(await canLaunchUrl(_url)) {
                await launchUrl(_url);
              }
              
            },
            child: ListTile(
              //leading: Image.network(scrapingModels.urlImage,width: 50,fit: BoxFit.fitHeight,),
              leading: Image.asset(
                "assets/images/pitstop.jpg",
                width: 50,
                fit: BoxFit.fitHeight,
              ),
              title: Text(scrapingModels.title),
              subtitle: Text(scrapingModels.information),
            ),
          );
        },
      ),
    );
  }
}
