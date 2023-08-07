function fn() {
  var KafkaUtils = Java.type('io.karatelabs.karate.kafka.KafkaUtils');
  var config = {
    'bootstrap.servers': '127.0.0.1:29092',
   // 'value.serializer': 'io.confluent.kafka.serializers.KafkaAvroSerializer',
    'schema.registry.url': 'http://localhost:8081'    
  };  
  var kafka = new KafkaUtils(config);
  kafka.schema('hello', 'classpath:karate/hello.avsc');
  kafka.schema('complex', 'classpath:karate/complex.avsc');
  return { kafka: kafka };
}
