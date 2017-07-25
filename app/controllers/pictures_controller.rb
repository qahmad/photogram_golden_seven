class PicturesController < ApplicationController

  def new_form
    render("pic_templates/new_form.html.erb")
  end

  def create_row

    photo = Photo.new
    photo.source = params["the_source"]
    photo.caption = params["the_caption"]
    photo.save
  
    @photo_count = Photo.count

    redirect_to("/photos")
    # render("pic_templates/create_row.html.erb")
  
  end
    
  def index
    @photos = Photo.all.order('created_at DESC')

    render("pic_templates/index.html.erb")
  end 

  def show
    @photo = Photo.find_by({ :Id => params["an_id"] })
    render("pic_templates/show.html.erb")
  end
  
  def edit_form
    @photo = Photo.find_by({ :Id => params["some_id"] })
    render("pic_templates/edit_form.html.erb")
  end
  
  def update_row
    photo = Photo.find_by({ :Id => params["the_id"] })
    
    photo.source = params["the_source"]
    photo.caption = params["the_caption"]
    photo.save
    
    # render("pic_templates/update_row.html.erb")
    redirect_to("/photos/" + photo.id.to_s)
  end 
  
  def destroy_row
    photo = Photo.find_by({ :Id => params["toast_id"] })
    photo.destroy
    
    @photo_count = Photo.count
    
    # render("pic_templates/destroy_row.html.erb")
    redirect_to("/photos")
  end 

end
