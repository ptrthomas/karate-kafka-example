function fn() {
  var KafkaUtils = Java.type('io.karatelabs.karate.kafka.KafkaUtils');
  var kafka = new KafkaUtils('test-topic');
  kafka.schema('hello', 'classpath:karate/hello.avsc');
  return { kafka: kafka };
}
