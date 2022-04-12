require 'rails_helper'

RSpec.describe Setting, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"


  it "should pass when contains valid post_privacy and friends_list_privacy" do
    setting = Setting.new
    user = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    setting.user_id = user.id
    setting.post_privacy = "public"
    setting.friends_list_privacy = "public"
    setting.save
    expect(setting.valid?).to be true
  end

  it "shouldn\'t pass when contains invalidvalid post_privacy" do
    setting = Setting.new
    user = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    setting.user_id = user.id
    setting.post_privacy = ""
    setting.friends_list_privacy = "public"
    setting.save
    expect(setting.valid?).to be false
  end

  it "shouldn\'t pass when contains invalidvalid friends_list_privacy" do
    setting = Setting.new
    user = User.create(first_name:"a",last_name:"b",email: "a@a.c",password:"123456",gender: "male",birthday:"3/4/2001")
    setting.user_id = user.id
    setting.post_privacy = "public"
    setting.friends_list_privacy = ""
    setting.save
    expect(setting.valid?).to be false
  end


end
