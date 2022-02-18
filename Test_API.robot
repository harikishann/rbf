*** Settings ***
Library           RequestsLibrary

*** Test Cases ***
API demo
    [Documentation]    API Testing Examples
    #Quick Get Request Test
    #${response}=    GET    https://www.google.com
    #Quick Get Request With Parameters Test
    #${response}=    GET    https://www.google.com/search    params=query=ciao    expected_status=200
    #Quick Get A JSON Body Test
    ${response}=    GET    https://jsonplaceholder.typicode.com/posts/2
    Should Be Equal As Strings    2    ${response.json()}[id]
