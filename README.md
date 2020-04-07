

# README for Planets: Individual Project  #
Ruby 2.5.1  Rails 5.2.1
A live version is deployed on Heroku, and can be accessed using the following link:

https://mysterious-coast-84654.herokuapp.com/


## Running the application locally ##
Run bundle install if the sqlite3 database isn't already present, then seed the database using:

>rake fpm:put_tables


Access the application using:http://localhost:3000


## These are the parts that are not working correctly ##


1. I tried to implement testing for http request to NASA's APOD and returned JSON:

```ruby
  RSpec.describe "NASA APOD", type: :request do
  describe "GET /nasa_api" do
    it "should return title" do
      @nasa_info.should_receive("title")
    end
    it "should give body of text" do 
      @nasa_info.should_receive("explaination")
    end
    it "should give date" do
      @nasa_info.should_receive("date")
    end
    it "returns information from API" do
      get('/nasa_api')
      json = JSON.parse(response.body)
      expect(response.body).not_to be_nil
    end
  end 
 end
```

2. I tried to make a transaction page for a purchasable element to the website, which was ultimately unsuccessful:

```ruby
class LineItem < ApplicationRecord
  belongs_to :sponsor
  belongs_to :cart
  belongs_to :order
  has_many :sponsors
  enum donation: {
  	"1 Month" => "1Month",
  	"3 Months" => "3Months",
  	"6 Months" => "6Months"
  }
end
```
Above is the model for lineitem, and below for cart/basket.

```ruby
class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_product(sponsor)
    	current_item = line_items.find_by(sponsor_id: sponsor.id)
    	if current_item
            current_item.quantity += 1
        else
          current_item = line_items.build(sponsor_id: sponsor.id)
        end
        current_item
    end

    def total_price
        line_items.to_a.sum { |total| total.total_price }
    end
end
```
3. I implemented session keys for additional security, but this would not work in deployment:

```ruby
 config.action_controller.session = { 
      :session_key => "_user_session",  
      :secret      => "6h54gjh254g747171g7l4h1g74l4g1" 
  }
 ```
 4. I tried to implement the Devise gem into my user model, but as I already had a user and session model, there were unknown conflicts which prevented the app from deploying to heroku. The users model does however work with 'devise' in development.
 
 
5. I attempted to issue a spec to test the dependencies of the Sponsor model, however this was unsuccessful.

```ruby
it 'dependants are there' do
			User = User.find(params[:user_id])
			Planet = Planet.find(params[:planet_id])
		end
 ```

