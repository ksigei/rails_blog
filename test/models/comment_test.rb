require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new
  end

  test 'should be valid' do
    assert @comment.valid?
  end

  test 'should have a user' do
    @comment.user = nil
    assert_not @comment.valid?
  end

  test 'should have a post' do
    @comment.post = nil
    assert_not @comment.valid?
  end

  test 'should have text' do
    @comment.text = nil
    assert_not @comment.valid?
  end

  test 'text should not be too long' do
    @comment.text = 'a' * 501
    assert_not @comment.valid?
  end
end
