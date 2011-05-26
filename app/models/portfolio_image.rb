class PortfolioImage < ActiveRecord::Base
  acts_as_fleximage do
    image_directory 'public/portfolio'
  end
end
