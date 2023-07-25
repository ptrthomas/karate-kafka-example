Feature: karate-kafka demo

Scenario:
* def session = kafka.listen('test-topic')
* session.send('hello', { message: 'hello', info: { first: 5, second: true } })
* def result = session.collect()
* match result == [{ message: 'hello', info: { first: 5, second: true } }]
