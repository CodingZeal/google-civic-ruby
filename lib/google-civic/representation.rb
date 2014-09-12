require 'ostruct'

module Google
  module Civic
    class Representation < OpenStruct
      class << self
        def has_many(association, options={})
          build_getter_for_ids(association)
          build_getter_for_collection(association, options)
        end

        private

        def build_getter_for_ids(association)
          singularized_association = __singularized(association)

          class_eval %{
            def #{singularized_association}_ids
              self["#{singularized_association}Ids"] || []
            end
          }
        end

        def build_getter_for_collection(association, options)
          class_eval %{
            def #{association}
              @__#{association} ||= #{__singularized(association)}_ids.map do |id|
                #{options[:class_name] || __singularized(association).capitalize}.new(__find_#{association}_by_id(id), @root_scope)
              end
            end

            def __find_#{association}_by_id(id)
              @root_scope.fetch("#{association}").fetch(id)
            end
          }
        end

        def __singularized(word)
          word.to_s.gsub(/s\z/, '')
        end
      end

      def initialize(representation, root_scope = nil)
        @root_scope = root_scope || representation
        super(representation)
      end
    end
  end
end
