require 'ruby2d'

module View
    class Ruby2dView
        def initialize
            @pixel_size = 20
        end

        def create_window(state)
            extend Ruby2D::DSL
            set(title: "Snake",
                width: @pixel_size * state.board.width,
                height: @pixel_size * state.board.height,
                background: 'black'
            )
            show
        end

        def draw(state)
            extend Ruby2D::DSL
            render_snake(state)
            render_food(state)
        end
        
        private
        def render_snake(state)
            extend Ruby2D::DSL
            state.snake.body.each do |cell|
                Square.new(
                    x: @pixel_size * cell.x,
                    y: @pixel_size * cell.y,
                    size: @pixel_size,
                    color: 'white'
                )
            end
        end

        private
        def render_food(state)
            extend Ruby2D::DSL
            Square.new(
                x: @pixel_size * state.food.x,
                y: @pixel_size * state.food.y,
                size: @pixel_size,
                color: 'red'
            )
        end

    end
end