require 'pg'

class Bookmark
  def self.all

    connection = PG.connect :dbname => 'bookmark_manager'

    rs = connection.exec "SELECT * FROM bookmarks";

    rs.map do |row|
      row['url']
    end
  end
end