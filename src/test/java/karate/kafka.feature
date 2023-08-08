Feature: karate-kafka demo

Scenario:
* def session = kafka.listen('test-topic', 2)
* session.schema('hello')
* session.headers({ foo: 'bar', baz: 'ban' })

* session.send('first', { message: 'hello1', info: { first: 1, second: true } })
* session.send('second', { message: 'hello2', info: { first: 2, second: false } })

* def results = session.collect()
* match results[*].key == ['first', 'second']
* match results[1].value == { message: 'hello2', info: { first: 2, second: false } }
