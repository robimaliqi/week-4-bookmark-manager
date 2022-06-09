feature "add bookmark" do
  scenario "user adds a bookmark" do
    visit '/bookmarks/add'
    fill_in :url, with: "http://www.hello.com"
    click_button "Add"
    expect(page).to have_content("http://www.hello.com")
  end
end