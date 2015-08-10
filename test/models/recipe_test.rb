require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
    def setup
      @recipe = Recipe.new(title: 'chicken', summary: 'best chicken ever', description: 'recipes instruction for cooking chicken')
    end
    
    test 'recipe should be valid' do 
      assert @recipe.valid?
    end
    
    test 'title should be present' do
      @recipe.title = ""
      assert_not @recipe.valid?
    end
    
    test 'title should be not too long' do 
      @recipe.title = "a" * 101
      
      assert_not @recipe.valid?
    end
    
    test 'title should not be too short' do
      @recipe.title = 'aaaa'
      assert_not @recipe.valid?
    end
    
    test 'summary should be present' do
      @recipe.summary = ""
      
      assert_not @recipe.valid?
    end
    
    test 'summary should not be too long' do 
      @recipe.summary = "a" * 151
      
      assert_not @recipe.valid?
    end
    
    test 'summary should not be too short' do
      @recipe.summary = "a" * 9
      
      assert_not @recipe.valid?
    end
    
    test 'description should be present' do
      @recipe.description = ""
      
      assert_not @recipe.valid?
    end
    
     test 'description should not be too long' do 
      @recipe.description = "a" * 501
      
      assert_not @recipe.valid?
    end
    
    test 'description should not be too short' do
      @recipe.description = "a" * 19
      
      assert_not @recipe.valid?
    end
end