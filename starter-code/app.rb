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

  get '/courses' do
    @courses = Course.all
    erb(:"courses/index")
  end

  #new
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :"recipes/new"
  end

  get '/courses/new' do
    @course = Course.new
    erb :"courses/new"
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

  post '/courses' do
    @course = Course.new(params[:course])
    if @course.save || @course.save
      redirect("/courses/#{@course.id}")
    else
      erb(:"courses/new")
    end
  end

  # show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/show")
  end

  get '/courses/:id' do
    @course = Course.find(params[:id])
    erb(:"courses/show")
  end

    # edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/edit")
  end

  get '/courses/:id/edit' do
    @course = Course.find(params[:id])
    erb(:"courses/edit")
  end

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

end


