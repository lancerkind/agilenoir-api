function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  var baseUrl = karate.properties['karate.baseUrl']

  var config = {
    baseUrl: baseUrl
  };

  return config;
}
