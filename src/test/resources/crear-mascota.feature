Feature: Creación y actualización de Mascota usando Karate
  Background:
    * configure ssl = true
    * def NombreAleatorio = Java.type('NombreAleatorio')
    * def nombreAleatorio = NombreAleatorio.obtenerNombreAleatorio()
    * def body = read('classpath:body.json')

  Scenario: Creación de Mascota mediante POST
    * def requestBody = body
    * set requestBody.id = 000000123
    * set requestBody.category.name = "perros"
    * set requestBody.name = nombreAleatorio
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request requestBody
    Then method post
    And status 200
    And match $.name == nombreAleatorio

  Scenario: Actualizar la mascota creada mediante PUT
    * def requestBody = body
    * set requestBody.id = 000000123
    * set requestBody.category.name = "perros"
    * set requestBody.name = nombreAleatorio
    * set requestBody.status = "sold"
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request requestBody
    Then method put
    And status 200

  Scenario: Obtener información de la mascota mediante GET
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/000000123"
    Then method get
    And status 200
    And match $.name == nombreAleatorio