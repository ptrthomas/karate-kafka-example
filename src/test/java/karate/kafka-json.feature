Feature: karate-kafka demo

Background:
* configure kafka =
"""
{ 
  'bootstrap.servers': '127.0.0.1:29092'
}
"""

Scenario:
* def session = karate.consume('kafka', 'test-topic')
* session.count = 1

* topic 'test-topic'
* key 'first'
* request { message: 'hello', info: { first: 1, second: true } }
* produce kafka

* def response = session.collect()
* match response[0].key == 'first'
* match response[0].value == { message: 'hello', info: { first: 1, second: true } }