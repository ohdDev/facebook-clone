require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "should pass when contains valid content and user_id and post_id " do
    comment = Comment.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    user2 = User.create(first_name:"b",last_name:"c",email: "a@aaa.c",password:"123456",gender: "male",birthday:"3/4/2001")
    post = Post.create(content: "new post", user_id: user1.id)

    comment.content = "new comment "
    comment.post_id = post.id
    comment.user_id = user2.id
   
    comment.save
    expect(comment.valid?).to be true
  end

  it "should not pass when contains empty content " do
    comment = Comment.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    user2 = User.create(first_name:"b",last_name:"c",email: "a@aaa.c",password:"123456",gender: "male",birthday:"3/4/2001")
    post = Post.create(content: "new post", user_id: user1.id)

    comment.content = ""
    comment.post_id = post.id
    comment.user_id = user2.id
   
    comment.save
    expect(comment.valid?).to be false
  end

  it "should not pass when contains empty user id " do
    comment = Comment.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    post = Post.create(content: "new post", user_id: user1.id)

    comment.content = ""
    comment.post_id = post.id
  
   
    comment.save
    expect(comment.valid?).to be false
  end

  it "should not pass when contains empty post id " do
    comment = Comment.new
    user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    user2 = User.create(first_name:"b",last_name:"c",email: "a@aaa.c",password:"123456",gender: "male",birthday:"3/4/2001")
    

    comment.content = ""
    comment.user_id = user2.id
  
   
    comment.save
    expect(comment.valid?).to be false
  end
  
end
