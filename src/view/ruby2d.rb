require 'ruby2d'

module View
    class Ruby2dView
        def initialize
            @pixel_size = 20
        end

        def render(state)
            extend Ruby2D::DSL
            set(title: "Snake",
                width: @pixel_size * state.grid.cols,
                height: @pixel_size * state.grid.rows,
                background: 'black')

            render_snake(state)
            render_food(state)
            show
        end

        def render_snake(state)
            extend Ruby2D::DSL
            state.snake.positions.each do |cell|
                Square.new(
                    x: @pixel_size * cell.col,
                    y: @pixel_size * cell.row,
                    size: @pixel_size,
                    color: 'white'
                )
            end
        end

        def render_food(state)
            extend Ruby2D::DSL
            Square.new(
                x: @pixel_size * state.food.col,
                y: @pixel_size * state.food.row,
                size: @pixel_size,
                color: 'red'
            )
        end

    end
end