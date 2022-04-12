require 'rails_helper'

RSpec.describe Post, type: :model do
 

  it "should pass when contains valid content and user_id " do
    post = Post.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")

    post.content = "new post"
    post.user_id = user1.id
   
    post.save
    expect(post.valid?).to be true
  end

  it "should not pass when contains empty content " do
    post = Post.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")

    post.content = ""
    post.user_id = user1.id
   
    post.save
    expect(post.valid?).to be false
  end
  it "should not pass when create post without user " do
    post = Post.new

    post.content = "new post"
    
    post.save
    expect(post.valid?).to be false
  end
 
 
end
