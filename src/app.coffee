'use strict'

angular.module 'exampleApp', [
    'ngResource'
]
.factory 'Add16', ->
    (i)->
        i + 16

.run (Add16)->
    console.log 'Add(3): ' + Add16(3)
    console.log 'Add(12): ' + Add16(12)

