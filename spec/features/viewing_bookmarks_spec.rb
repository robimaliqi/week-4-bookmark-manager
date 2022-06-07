feature "Home page" do
  scenario "Shows home page" do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature "Viewing bookmarks" do 
    scenario "Displays bookmarks" do 
      visit('/bookmarks')
      expect(page).to have_content "http://www.makersacademy.com"
      expect(page).to have_content "http://www.destroyallsoftware.com"
      expect(page).to have_content "http://www.google.com"
    end 
end