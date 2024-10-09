Feature: Practice with karate
  Background:
    * url 'https://reqres.in'

  @test_reqrest
  Scenario: Get user
    Given path 'api/users?page=2'
    When method get
    Then status 200
    * def name1 = response.data[0].name
    * print 'first name >>> ', name1


  @test_table
  Scenario: Test with table
    * table users
      | name     | year | login |
      | 'Aniki'  | 24   | true  |
      | 'Esmtih' | 25   | false |
    * print 'users >>> ', users


  @csv_json
  Scenario: Conver csv to json
    * text csv =
      """
      fruit,stock
      pera,2
      apple,5
      """
    * csv fruits = csv
    * print 'csv >>> ', fruits


  @read_csv_json
  Scenario: read csv to json
    * def csvUser = read('data/user.csv')
    * print 'csvUser >>> ', csvUser


  @function_json
  Scenario: read csv to json
    * def csvUser = read('data/user.csv')
    * def changeId = function (users) { return users.map(e => { return { id: (e.id + 1), name: e.name } } ) }
    * def changeName =
      """
      function(users) {
        return users.map(e => {
          return { id: e.id, name: e.name.toUpperCase() }
        })
      }
      """
    * print 'changeId >>> ', changeId(csvUser)
    * print 'changeName >>> ', changeName(csvUser)


  @example_csv
  Scenario Outline: read csv to json
    * table user
      | id   | name     | country     |
      | <id> | '<name>' | '<country>' |
    * print 'table user >>> ', user
    Examples:
      | read('data/user.csv') |


  @read_other_feature
  Scenario: read others feature
    * def othertableFeature = call read('data.feature')
    * print 'othertableFeature >>> ', othertableFeature.animals


  @tag_other_feature
  Scenario: call others tag - feature
    * def otherTagFeature = call read('data.feature@get_user')
    * print 'otherTagFeature >>> ', otherTagFeature.response
    * def emailResponseUser = otherTagFeature.response.data.email
    * print 'nameResponseUser >>> ', emailResponseUser