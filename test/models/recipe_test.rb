require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
    def setup
      @recipe = Recipe.new(title: 'chicken', summary: 'best chicken ever', description: 'recipes instruction for cooking chicken')
    end
    
    test 'recipe should be valid' do 
      assert @recipe.valid?
    end
    
    
end