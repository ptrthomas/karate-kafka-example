Feature: karate-kafka demo

Scenario:
* def session = kafka.listen('test-topic')
* session.schema('complex')
* session.headers({ foo: 'bar', baz: 'ban' })
* session.key('someKey')
* def body = read('complex.json')
* session.send(body)
* def result = session.collect()
* match result == ([body])
