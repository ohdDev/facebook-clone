require 'rails_helper'

RSpec.describe Friend, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"


    it "should pass when contains valid follower_id and followee_id and status" do
      friend = Friend.new
      user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
      user2 = User.create(first_name:"c",last_name:"d",email: "a@a.b",password:"123456",gender: "male",birthday:"3/4/2001")
      friend.follower_id = user1.id
      friend.followee_id = user2.id
      friend.status = "pending"
      friend.save
      expect(friend.valid?).to be true
    end

    it "shouldn't pass when contains invalid status" do
      friend = Friend.new
      user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
      user2 = User.create(first_name:"c",last_name:"d",email: "a@a.b",password:"123456",gender: "male",birthday:"3/4/2001")
      friend.follower_id = user1.id
      friend.followee_id = user2.id
      friend.status = ""
      friend.save
      expect(friend.valid?).to be false
    end

    it "shouldn't pass when contains invalid follower_id" do
      friend = Friend.new
      # user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
      user2 = User.create(first_name:"c",last_name:"d",email: "a@a.b",password:"123456",gender: "male",birthday:"3/4/2001")
      friend.follower_id = ""
      friend.followee_id = user2.id
      friend.status = "pending"
      friend.save
      expect(friend.valid?).to be false
    end

    it "shouldn't pass when contains invalid followee_id" do
      friend = Friend.new
      user1 = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
      # user2 = User.create(first_name:"c",last_name:"d",email: "a@a.b",password:"123456",gender: "male",birthday:"3/4/2001")
      friend.follower_id = user1.id
      friend.followee_id = ""
      friend.status = "pending"
      friend.save
      expect(friend.valid?).to be false
    end
    



end
