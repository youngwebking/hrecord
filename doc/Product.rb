class Product < HRecord::Base
  column_families 'attr', 'img', 'file'
end
