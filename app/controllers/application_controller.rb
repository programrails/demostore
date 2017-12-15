 class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  before_action :set_active_category

  before_action :set_cart  

  protected

  def after_sign_in_path_for(resource)
    #current_user_path

    if (current_user.has_role? :admin)
      admin_products_path
    else
      root_path
    end

  end

  def after_sign_out_path_for(resource_or_scope)
    # request.referrer
    root_path
  end

  private

  def set_active_category

    @categories_menu = []

    cid = nil

    if params[:controller] == "products" && params[:action] == "index"

      cid = 0

      if params[:category]

        cid = params[:category].to_i

      end

    end

    if params[:controller] == "products" && params[:action] == "show"

      cid = 0

      if params[:id]

        @product = Product.find_by id: params[:id]

        cid = @product.try(:category).try(:id).try(:to_i)        

      end

    end

    @categories_menu << {id: 0, title: 'All products', path: products_path, active: (cid == 0 ? " active" : "")}

    Category.all.each do |category|

      @categories_menu << {id: category.id, title: category.title, path: products_path(category: category.id), active: (cid == category.id ? " active" : "")}

    end  

  end

  def xhr_history

  # http://stackoverflow.com/questions/15394156/back-button-in-browser-not-working-properly-after-using-pushstate-in-chrome    
        response.headers['Vary'] = 'Accept'

        @page_query = request.original_fullpath
    
  end

  def set_cart

    @cart = set_cart_helper current_user, session

  end  

end