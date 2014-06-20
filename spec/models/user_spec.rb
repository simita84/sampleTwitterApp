require 'spec_helper'

describe User do
  before do
   @user=User.new(name:"user",
                  email: "user@example.com",
                  password: "secret",
                  password_confirmation: "secret")
  end
  
  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
   it {should respond_to(:authenticate)}



  it {should be_valid}

describe "when username not present" do
  	before{@user.name=" "}
  	it {should_not be_valid}
  end
describe "when email is  not present" do
  	before{@user.email=" "}
  	it {should_not be_valid}
  end

describe "when email is  not in valid format" do
  it "should be invalid" do
  	 addresses=%w[xyz@example,com xyz xyz_at_example.org xyz.user@foo.]
       addresses.each do |invalid_email|
        @user.email=invalid_email
        @user.should_not be_valid
      end
  end
end

describe "when email is valid" do
  it "should be valid" do
    addresses=%w[user@foo.com user@foo.org first.last@goo.jp a+b@baz.cn]
      addresses.each do |valid_email|
        @user.email=valid_email
        @user.should be_valid
      end
  end
end

describe "when user name  is  too long" do
    before{@user.name="xyz"*50}
    it {should_not be_valid}
end

describe "when email adress is duplicated" do
    before do
       user_with_duplicate_email=@user.dup
       user_with_duplicate_email.save
    end
    xit  {should_not be_valid}
 end   

describe "When password is not present" do
  before {
    @user.password=@user.password_confirmation=" "
  }
  it {should_not be_valid}
end

describe "When password doesnot match   password_confirmation" do
  before {
    @user.password_confirmation="mismatch"
  }
  it {should_not be_valid}
end

describe "When   password_confirmation is nil" do
  before { @user.password_confirmation= nil }
  it {should_not be_valid}
end

describe "When password is too short" do
  before {@user.password=@user.password_confirmation="a"*2 }
  it {should_not be_valid}
end

end

 
