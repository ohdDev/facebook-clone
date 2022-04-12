require 'rails_helper'

RSpec.describe Like, type: :model do

  it "should pass when contains valid post_id and user_id" do
    like = Like.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    user2 = User.create(first_name:"b",last_name:"c",email: "a@aaa.c",password:"123456",gender: "male",birthday:"3/4/2001")
    post = Post.create(content: "new post", user_id: user1.id)

   
    like.post_id = post.id
    like.user_id = user2.id
   
    like.save
    expect(like.valid?).to be true
  end

  it "should not pass when contains empty  post_id " do
    like = Like.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    user2 = User.create(first_name:"b",last_name:"c",email: "a@aaa.c",password:"123456",gender: "male",birthday:"3/4/2001")
   
    like.post_id = 
    like.user_id = user2.id
   
    like.save
    expect(like.valid?).to be false
  end

  it "should not pass when contains empty  user_id " do
    like = Like.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    post = Post.create(content: "new post", user_id: user1.id)
    like.post_id = post.id
    
    like.save
    expect(like.valid?).to be false
  end
end
