class RecipeApp < Sinatra::Base
  # General route actions
  get '/' do
    erb :home
  end

  get '/home' do
    erb :home
  end

  # index
  get '/recipes' do
    @recipes = Recipe.all
    erb(:"recipes/index")
  end

  #new
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :"recipes/new"
  end

   # create
  post '/recipes' do
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save || @course.save
      redirect("/recipes/#{@recipe.id}")
    else
      erb(:"recipes/new")
    end
  end

  # show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/show")
  end

    # edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/edit")
  end

  # given data, update a specific artis
  # update
  post '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect("/recipes")
    else
      erb(:"recipes/edit")
    end
  end

  # delete
  post '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect('/recipes')
    else
      redirect("/recipes/#{@recipe.id}/edit")
    end
  end

end


