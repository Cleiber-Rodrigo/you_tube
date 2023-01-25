import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube2/model/Video.dart';


//Chave de autorização para recuperar vídeos do youtube
const CHAVE_YOUTUBE_API = "AIzaSyBONhRVPo-lyId1bPrXq6e_gR1AnSkS5yA";
const  ID_CANAL  =  "UCVHFbqXqoYvEWM1Ddxl0QDg" ;
const  URL_BASE  =  "https://www.googleapis.com/youtube/v3/" ;

class Api {

  //Método que pesquisa vídeos do youtube
  pesquisar(String pesquisa) async {

    http.Response response = await http.get(Uri.parse(
        URL_BASE + "search"   //Eu estou passando a URL base + o incremento search + os parâmetros
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
      )
    );

    if (response.statusCode==200){
      //Convertendo o retorno String para objeto Map<json>

      /*Eu poderia usar um for para percorrer minha lista de objetos jason:
      for(var video in dadosjson["items"]){
      }*/


      //Mas posso usar outro método para percorrer a lista:
      Map<String, dynamic> dadosjson = jsonDecode(response.body);
      List<Video> videos = dadosjson["items"].map<Video>(
          (map){
            //return Video.converterJson(map);
            return Video.fromJson(map);
          }
      ).toList();

      for(var video in videos){
        print("resultado" + "${video.titulo}");
      }

      //print("Resposta "+ dadosjson["items"][2]["snippet"]["title"].toString());
    }else{
      print('Ops');

    }

  }
}