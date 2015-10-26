class RecipeApp < Sinatra::Base
  # General route actions
  get '/' do
    erb :home
  end

  get '/home' do
    erb :home
  end

#---------------------

  # index
  get '/recipes' do
    @recipes = Recipe.all
    erb(:"recipes/index")
  end

  get '/courses' do
    @courses = Course.all
    erb(:"courses/index")
  end

  get '/ingredients' do
    @ingredients = Ingredient.all
    erb(:"ingredients/index")
  end

#---------------------

  #new
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :"recipes/new"
  end

  get '/courses/new' do
    @course = Course.new
    erb :"courses/new"
  end

  get '/ingredients/new' do
    @ingredient = Ingredient.new
    erb :"ingredients/new"
  end

#---------------------

   # create
  post '/recipes' do
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect("/recipes/#{@recipe.id}")
    else
      erb(:"recipes/new")
    end
  end

  post '/courses' do
    @course = Course.new(params[:course])
    if @course.save
      redirect("/courses/#{@course.id}")
    else
      erb(:"courses/new")
    end
  end

  post '/ingredients' do
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect("/ingredients/#{@ingredient.id}")
    else
      erb(:"ingredients/new")
    end
  end

#---------------------

  # show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/show")
  end

  get '/courses/:id' do
    @course = Course.find(params[:id])
    erb(:"courses/show")
  end

  get '/ingredients/:id' do
    @ingredient = Ingredient.find(params[:id])
    erb(:"ingredients/show")
  end

#---------------------

    # edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/edit")
  end

  get '/courses/:id/edit' do
    @course = Course.find(params[:id])
    erb(:"courses/edit")
  end

  get '/ingredients/:id/edit' do
    @ingredient = Ingredient.find(params[:id])
    erb(:"ingredients/edit")
  end
#---------------------

  # update
  post '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect("/recipes")
    else
      erb(:"recipes/edit")
    end
  end

  post '/courses/:id' do
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect("/courses")
    else
      erb(:"courses/edit")
    end
  end

  post '/ingredients/:id' do
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      redirect("/ingredients")
    else
      erb(:"ingredients/edit")
    end
  end

#---------------------

  # delete
  post '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect('/recipes')
    else
      redirect("/recipes/#{@recipe.id}/edit")
    end
  end

  post '/courses/:id/delete' do
    @course = Course.find(params[:id])
    if @course.destroy
      redirect('/courses')
    else
      redirect("/courses/#{@course.id}/edit")
    end
  end

  post '/ingredients/:id/delete' do
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      redirect('/ingredients')
    else
      redirect("/ingredients/#{@ingredient.id}/edit")
    end
  end

end


