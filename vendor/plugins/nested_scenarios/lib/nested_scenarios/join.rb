module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Hash #:nodoc:
      module Join

        # Returns a string created by converting each element of the hash to
        # a string, separated by <i>sep</i>.
        #     
        #     { :a => :b, :c => :d }.join        #=> "abcd"
        #     { :a => :b, :c => :d }.join('-')   #=> "a-b-c-d"
        #
        # If the hash has a key or value as a hash also, it's also joined
        # (just as it works with arrays).
        #
        #     { :a => { :b => :c } }.join(' ')         #=> "a b c"
        #
        # Note: hash order is just preserved in Ruby 1.9
        #
        def join(sep = $,)
          array = []
          sep = sep.to_s

          self.each_pair do |k, v|
            array << (k.is_a?(Hash) ? k.join(sep) : k.to_s)
            array << (v.is_a?(Hash) ? v.join(sep) : v.to_s)
          end

          array.join(sep)
        end

      end
    end
  end
end

Hash.send :include, ActiveSupport::CoreExtensions::Hash::Join