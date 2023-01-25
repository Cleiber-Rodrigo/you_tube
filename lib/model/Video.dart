class Video{

  String? id = "";
  String? titulo = "";
  String? descricao = "";
  String? imagem = "";
  String? canal = "";

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  /*Método que converte objeto json para objeto video
Usando esse método, conseguiríamos converter os objetos json em Video, porém, criaríamos 20 instancias desse Video,
o que gastaria mais reciursos. Para corrigir isso, podemos usar um construtor nomeado utilizando o factory

  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["video"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }
*/

  //Quando usamos o factory, vamos criar uma única instancia do objeto Video
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["video"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }

}