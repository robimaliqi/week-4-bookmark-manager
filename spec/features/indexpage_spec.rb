feature "Index page" do 
    scenario "Open Index page" do 
      visit('/')
      expect(page).to have_content "Hello World"
    end 
end