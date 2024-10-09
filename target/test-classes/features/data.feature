Feature: Practice with karate - data

  @data_table
  Scenario: Data table
    * table animals
      | name  | color    |
      | 'Dog' | 'White'  |
      | 'Cat' | 'Orange' |
    * print 'animals >>> ', animals


  @get_user
  Scenario:
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
