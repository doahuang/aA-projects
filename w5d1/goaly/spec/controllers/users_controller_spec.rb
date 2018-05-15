require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do 
    it 'renders a new user template' do 
      get :new 
      expect(response).to render_template(:new)
    end 
  end 
  
  describe "POST #create" do
    it 'sign up new user with valid input params' do
      post :create, params: {user: {username:'ms anderson' , password: 'red pill' }} 
      expect(response).to redirect_to(users_url)
    end 
  end 
  
  describe 'GET #index' do 
    it 'renders user index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
end
