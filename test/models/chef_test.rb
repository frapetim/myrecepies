require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: 'bob', email: 'bob@example.com')
  end
  
  test 'chef name should be valid' do
    assert @chef.valid?
  end
  
  test 'chef name should be present' do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  
  test 'chef email should be present' do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test 'chef name should not be too long' do 
    @chef.chefname = "a" * 2
    assert_not @chef.valid?
  end
  
  test 'chef name should not be too short' do 
    @chef.chefname = "a" * 51
    assert_not @chef.valid?
  end
  
  test 'email should be within bounds' do
      @chef.email = "a" * 101 + "@examp.com"
      assert_not @chef.valid?
  end
  
  test 'email should be unique' do 
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test 'chef email should be valid format' do 
      valid_addresses = %w[user@email.com R_TD-DS@email.hello.org first.last@email.com laura+jack@email.com]
      valid_addresses.each do |va|
        @chef.email = va
        assert @chef.valid?, '#{va.inspect} should be valid'
      end
  end
  
  test 'email validation should reject invalid' do 
      invalid_addresses = %w[user@email,com R_TD@DS@email.hello.org first.last.email.com laura+jack@em+ail.com]
      invalid_addresses.each do |ia|
        @chef.email = ia
        assert_not @chef.valid?, '#{va.inspect} should be valid'
      end
  end
  
    
end
