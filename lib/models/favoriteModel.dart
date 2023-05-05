class FavoriteModel{
  int? photoId;
  String? imageUrl;
  int? isFavorite;
  FavoriteModel(this.photoId, this.imageUrl,this.isFavorite);
  Map<String, dynamic> addFavorite() {
    return {
      "photoId": photoId,
      "imageUrl": imageUrl,
"isFavorite":isFavorite

    };
  }
  FavoriteModel.getFavorite(Map<String, dynamic>getMap){
    photoId=getMap['photoId'];
    imageUrl=getMap['imageUrl'];
    isFavorite=getMap['isFavorite'];




  }

}