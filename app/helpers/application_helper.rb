module ApplicationHelper

  def active_name(controller, name)
    controller.controller_name.to_s.downcase == name.downcase ? ' class=' + html_escape("") + 'active' + html_escape("") : ''
  end

  def class_by_name name
    # http://stackoverflow.com/questions/14070369/how-to-instantiate-class-from-name-string-in-rails
    Object.const_get name.to_s

  end  

# http://stackoverflow.com/questions/7994484/empty-folders-when-file-is-deleted-using-carrierwave
  def remove_file_directory uploader
    path = File.expand_path(uploader.store_path, uploader.root)
    FileUtils.remove_dir(path, force: false)
  end

  def uploaded_images_dir

     Rails.root.join( Rails.env.to_s, 'uploads').to_s

  end

  def heroku?
# http://stackoverflow.com/questions/9383450/how-can-i-detect-herokus-environment    
    Rails.env.production? && !ENV['DYNO'].blank?
  end  

  def uploader_name_helper instance_obj
# https://stackoverflow.com/questions/41863242/how-to-dynamically-determining-carrierwave-uploader-column-name/44179356#44179356
    instance_obj.class.try(:uploaders).try(:keys).try(:first).try(:to_sym)

  end

  def image_stored_file_path2 uploader
# http://stackoverflow.com/questions/2733007/urldecode-in-ruby
    # URI.unescape().to_s
    
    URI.unescape(uploader.to_s).to_s
  end  

  def helper_by_name2 path, id=nil, params=nil

    Rails.application.routes.url_helpers.send path, id, params

  end

  def single_attachment_url_280 instance_obj

    if heroku?

      begin

        stored_image = asset_path(instance_obj.try(:title).try(:downcase))

      rescue Sprockets::Rails::Helper::AssetNotFound 

        stored_image = ""

      end

    else  

      stored_image = image_stored_file_path2 instance_obj.file

    end

    path = stored_image.blank? ? asset_path('no_image_280.png') : stored_image

    # Rails.env.test? ? path[1..-1] : path
    Rails.env.test? ? "#" : path

  end

  def set_cart_helper user, session_param

    if user

      guest_cart = Cart.find_by(id: session_param[:cart_id])

      if user.cart
        user_cart = user.cart
      else
        user_cart = user.create_cart!
      end

      (user_cart.move_cart_content guest_cart) if guest_cart

      session_param[:cart_id] = nil

      cart = user_cart
      
    else     
      cart = Cart.find_by(id: session_param[:cart_id])

      unless cart    
        cart = Cart.create!      
        session_param[:cart_id] = cart.id
      end
    end

    cart

  end

# include ActionView::Helpers::AssetTagHelper

# alias_method :old_stylesheet_link_tag, :stylesheet_link_tag

# def stylesheet_link_tag2(*sources)
#   options = sources.extract_options!.stringify_keys
#   path_options = options.extract!('protocol').symbolize_keys

#   sources.uniq.map { |source|
#     tag_options = {
#       "rel" => "stylesheet",
#       "media" => "screen",
#       "href" => "file://#{Rails.root}/public" + path_to_stylesheet(source, path_options)
#     }.merge!(options)
#     tag(:link, tag_options)
#   }.join("\n").html_safe
# end  

# def stylesheet_link_tag(*sources)

#   if Rails.env.test?

#     stylesheet_link_tag2(*sources)

#   else

#     old_stylesheet_link_tag(*sources)

#   end

# end
  
end