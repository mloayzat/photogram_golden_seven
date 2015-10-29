class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show

  	@photo = Photo.find_by({:id => params[:id] })
  	
  end

  def new_form
  end

  def delete_row
  	p = Photo.find_by({:id => params[:id] })
  	p.destroy

  	redirect_to("http://localhost:3000/photos")
  end

  def create_row
  	p = Photo.new
  	p.caption = params[:the_caption]
  	p.source = params[:the_source]
  	p.save

  	redirect_to("http://localhost:3000/photos")
  end

  def edit_form
  	@photo = Photo.find_by({:id => params[:id] })
  	x = Photo.find_by({:id => params[:id] })
  	@old_caption = x.caption
  	@old_source = x.source 


  end

  def edit_row
  	@photo = Photo.find_by({:id => params[:id] })
  	p = Photo.find_by({:id => params[:id] })
  	p.caption = params[:new_caption]
  	p.source = params[:new_source]

  	p.save

  	redirect_to("http://localhost:3000/photos/"+@photo.id.to_s)

  end


end
