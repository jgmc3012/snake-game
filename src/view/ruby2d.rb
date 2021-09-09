require 'ruby2d'

module View
    class Ruby2dView
        def initialize

        end

        def render
            extend Ruby2D::DSL
            set(title: "Snake", width: 800, height: 600, background: 'white')
            show
        end
    end
end