require "application_system_test_case"

class ListaTest < ApplicationSystemTestCase
  setup do
    @listum = lista(:one)
  end

  test "visiting the index" do
    visit lista_url
    assert_selector "h1", text: "Lista"
  end

  test "creating a Listum" do
    visit lista_url
    click_on "New Listum"

    fill_in "Nome", with: @listum.nome
    click_on "Create Listum"

    assert_text "Listum was successfully created"
    click_on "Back"
  end

  test "updating a Listum" do
    visit lista_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @listum.nome
    click_on "Update Listum"

    assert_text "Listum was successfully updated"
    click_on "Back"
  end

  test "destroying a Listum" do
    visit lista_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listum was successfully destroyed"
  end
end
