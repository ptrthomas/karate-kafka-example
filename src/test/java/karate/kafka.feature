Feature: karate-kafka demo

Scenario:
* def session = kafka.listen('test-topic')
* session.schema('hello')
* session.headers({ foo: 'bar', baz: 'ban' })
* session.key('someKey')
* session.send({ message: 'hello', info: { first: 5, second: true } })
* def result = session.collect()
* match result == [{ message: 'hello', info: { first: 5, second: true } }]
