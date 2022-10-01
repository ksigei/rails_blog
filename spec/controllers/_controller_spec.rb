require 'spec_helper'
require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#   describe 'GET #index' do
#     it 'returns http success' do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end
# end

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end

# RSpec.describe CommentsController, type: :controller do
#   describe 'GET #comments' do
#     it 'returns http success' do
#       get :comments, params: { id: 1 }
#       expect(response).to have_http_status(:success)
#     end
#   end
# end

# RSpec.describe LikesController, type: :controller do
#   describe 'GET #likes' do
#     it 'returns http success' do
#       get :likes, params: { id: 1 }
#       expect(response).to have_http_status(:success)
#     end
#   end
# end

RSpec.describe AboutController, type: :controller do
  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
end
