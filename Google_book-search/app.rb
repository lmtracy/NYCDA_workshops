require "sinatra"
require "googlebooks"


get '/' do
    erb :form
end


post "/" do
    books = GoogleBooks.search(params[:query])
    first_book = books.first #returns first result from search

    @image = first_book.image_link 
    @title = first_book.title
    @author = first_book.authors 
    @isbn = first_book.isbn
    @description = first_book.description
    @link = first_book.info_link
  
    puts books
    erb :form,  :locals => {:image => @image, :title => @title, :author => @author, :isbn => @isbn, :description => @description, :link => @link}
  #locals have to be passed in as arguments since they are not accessible to the template
end

# post '/' do
#     @books - GoogleBooks.search(params[:query])
#     redirect "/result", @books
# end

# get 'result'