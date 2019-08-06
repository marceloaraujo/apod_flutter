class Picture {
    
    String _title;
    String _explanation;
    String _mediaType;
    String _url;
    DateTime _date;

    Picture();

    String get title {
      return _title;
    }

    set title(String title) {
      this._title = title;
    }

    String get explanation {
      return _explanation;
    }

    set explanation(String explanation) {
      this._explanation = explanation;
    }

    String get mediaType {
      return _mediaType;
    }

    set mediaType(String mediaType) {
      this._mediaType = mediaType;
    }

    String get url {
      return _url;
    }

    set url(String url) {
      this._url = url;
    }

    DateTime get date {
      return _date;
    }

    set date(DateTime date) {
      this._date = date;
    }

    factory Picture.fromJson(Map<String, dynamic> json) {
      Picture p = Picture();
      p.title = json["title"];
      

      return p;
    }

}