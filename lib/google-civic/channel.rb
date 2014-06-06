module Google
  module Civic
    class Channel < Representation
    end

    class Facebook < Channel
      def url
        "http://facebook.com/#{self.id}"
      end
    end

    class Twitter < Channel
      def url
        "http://twitter.com/#{self.id}"
      end
    end

    class GooglePlus < Channel
      def url
        "https://plus.google.com/#{self.id}"
      end
    end

    class YouTube < Channel
      def url
        "http://youtube.com/#{self.id}"
      end
    end
  end
end

