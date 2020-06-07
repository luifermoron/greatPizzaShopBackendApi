
class CategoryRepository
    class << self
      def all()
        Category.all
      end
      
      def find_or_create_by(*attrs)
        Category.find_or_create_by(*attrs)
      end
    end
end