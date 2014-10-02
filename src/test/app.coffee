'use strict'

describe 'Add16', ->

    Add16 = null

    beforeEach ->
        module 'exampleApp'

        inject ($injector)->
            Add16 = $injector.get 'Add16'


    it ->
        expect(Add16(14)).toBe 30


