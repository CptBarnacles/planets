require 'rails_helper'

RSpec.describe User, type: :model do 
	context 'validates correctly' do 
		it 'ensures Sponsor presence' do
			Sponsor = Sponsor.new(first_name: 'example').save
			expect(Sponsor).to eq(false)
		end

		it 'dependants are there' do
			User = User.find(params[:user_id])
			Planet = Planet.find(params[:planet_id])
		end
	end

	context 'scope test' do
	end

end