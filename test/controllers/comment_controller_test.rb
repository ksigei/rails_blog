require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test 'should get comment' do
    get comment_comment_url
    assert_response :success
  end
end
