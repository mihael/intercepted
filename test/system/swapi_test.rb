require "application_system_test_case"

class IndexTest < ApplicationSystemTestCase
  setup do
    visit root_path
  end

  test 'The Star Wars API request' do
    intercept('https://fakerapi.it/api/v1/companies', 'my mocked response')

    click_button 'Request1'

    assert_text 'my mocked response'
    assert_selector '#response', text: 'my mocked response'
  end

  # I would expect the intercept to work anyway
  test 'Non existent URL intercept' do
    intercept('https://fakerapizzz.it/api/v1/companies', 'my mocked response')

    click_button 'Request2'

    assert_text 'my mocked response'
    assert_selector '#response', text: 'my mocked response'
  end

  # Same here, if the URL does not exist, or does not allow connection, the interception also fails!
  # Interception only works for URLs that exist and return a valid response.
  test 'Fails to intercept due to CORS' do
    intercept('http://kitschmaster.com/', 'my mocked response')

    click_button 'Request Kitsch'

    assert_text 'my mocked response'
    assert_selector '#kitsch-response', text: 'my mocked response'
  end
end
