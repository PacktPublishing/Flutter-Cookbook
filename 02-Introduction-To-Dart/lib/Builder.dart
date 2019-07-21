class UrlBuilder {
  String _scheme;
  String _host;
  String _path;

  UrlBuilder setScheme(String value) {
    _scheme = value;
    return this;
  }

  UrlBuilder setHost(String value) {
    _host = value;
    return this;
  }

  UrlBuilder setPath(String value) {
    _path = value;
    return this;
  }

  String build() {
    assert(_scheme != null);
    assert(_host != null);
    assert(_path != null);

    return '$_scheme://$_host/$_path';
  }
}

void usingTheBuilder() {
  final url = UrlBuilder()
      .setScheme('https')
      .setHost('dart.dev')
      .setPath('/guides/language/language-tour#cascade-notation-')
      .build();

  print(url);
}
