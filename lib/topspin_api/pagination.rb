module TopspinApi

  module Pagination

      # Adds some methods to an array to represent the meta-data for pagination:
      # - total_pages
      # - current_page
      # - total_entries
      # - per_page
      #
      def decorate(hash, array)
        def array.metaclass
          class << self; self; end
        end
        metaclass = array.metaclass
        %w(total_pages current_page total_entries per_page).each do |m|
          if hash[m]
            array.metaclass.send(:define_method, m) do
              hash[m].to_i
            end
          end
        end
        array
      end

  end

end