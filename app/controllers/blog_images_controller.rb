class BlogImagesController < ApplicationController
  flex_image :action => 'show', :class => BlogImage
end