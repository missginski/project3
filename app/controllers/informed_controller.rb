class InformedController < ApplicationController

  before_action :authenticate_user!

  def index

    client = RedditKit::Client.new('project_active', 'Th1sisn3w86FKA')
    @links = client.links(all_categories).select {|l| l.is_self != true}
    @user = current_user

    if User.joins(:informed_favorites).where(:id => @user[:id])
    end

  end


  def create

    InformedFavorite.create(
      user_id: params[:user_id],
      animals: params[:animals],
      bullying: params[:bullying],
      disasters: params[:disasters],
      discrimination: params[:discrimination],
      education: params[:education],
      environment: params[:environment],
      homelessness: params[:homelessness],
      mental_health: params[:mental_health],
      physical_health: params[:physical_health],
      poverty: params[:poverty],
      relationships: params[:relationships],
      sex: params[:sex],
      violence: params[:violence]
      )

    redirect_to :back

  end


  def load_links

    client = RedditKit::Client.new('project_active', 'Th1sisn3w86FKA')
    @links = client.links(category_from_id).select {|l| l.is_self != true}

  end


  def category_from_id

    if params[:id] == 'animals'
      reddit = 'ARLAW'
    elsif params[:id] == 'bullying'
      reddit = 'bullying'
    elsif params[:id] == 'disasters'
      reddit = 'Disasters'
    elsif params[:id] == 'discrimination'
      reddit = 'human_rights'
    elsif params[:id] == 'education'
      reddit = 'education'
    elsif params[:id] == 'environment'
      reddit = 'enviroaction'
    elsif params[:id] == 'homelessness'
      reddit = 'poverty'
    elsif params[:id] == 'mental health'
      reddit = 'globalhealth'
    elsif params[:id] == 'physical health'
      reddit = 'globalhealth'
    elsif params[:id] == 'poverty'
      reddit = 'poverty'
    elsif params[:id] == 'relationships'
      reddit = 'BetterRelationships'
    elsif params[:id] == 'sex'
      reddit = 'BetterRelationships'
    elsif params[:id] == 'violence'
      reddit = 'uncensorednews'
    else
      reddit = 'activism'
    end

  end


  def all_categories

  client = RedditKit::Client.new('project_active', 'Th1sisn3w86FKA')

    reddit = [
     'ARLAW',
     'bullying',
     'Disasters',
     'enviroaction',
     'human_rights',
     'education' ,
     'poverty',
     'globalhealth',
     'globalhealth',
     'poverty',
     'BetterRelationships',
     'BetterRelationships',
     'uncensorednews'
     ]
     reddit.join('+')

  end


  def show
    load_links
  end

end

#   def create
#     # byebug
#     InformedFavorite.create(
#       user_id: params[:user_id],
#       animals: params[:animals],
#       bullying: params[:bullying],
#       disasters: params[:disasters],
#       discrimination: params[:discrimination],
#       education: params[:education],
#       environment: params[:environment],
#       homelessness: params[:homelessness],
#       physical_health: params[:physical_health],
#       mental_health: params[:mental_health],
#       poverty: params[:poverty],
#       relationships: params[:relationships],
#       sex: params[:sex],
#       violence: params[:violence]
#       )
#     # @favorite_categories = ["animals", "bullying"]
#     end
#   end

  # def favorite_categories
  #   client = RedditKit::Client.new('project_active', 'Th1sisn3w86FKA')
  #     @favorite_categories = []
  #     if params[:animals] == true
  #       favorite_categories.push('ARLAW')
  #     elsif params[:bullying] == true
  #       favorite_categories.push('bullying')
  #     elsif params[:disasters] == true
  #       favorite_categories.push('Disasters')
  #     elsif params[:human_rights] == true
  #       favorite_categories.push('human_rights')
  #     elsif params[:education] == true
  #       favorite_categories.push('education')
  #     elsif params[:environment] == true
  #       favorite_categories.push('enviroaction')
  #     elsif params[:health] == true
  #       favorite_categories.push('globalhealth')
  #     elsif params[:poverty] == true
  #       favorite_categories.push('poverty')
  #     elsif params[:relationships] == true
  #       favorite_categories.push('BetterRelationships')
  #     else
  #       @favorite_categories = all_categories
  #   end
  # end





