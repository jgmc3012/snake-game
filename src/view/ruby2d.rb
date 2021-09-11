require 'ruby2d'

module View
    class Ruby2dView
        def initialize(app)
            @app = app
            @pixel_size = 20
        end

        def create_window(state)
            extend Ruby2D::DSL
            set(title: "Snake",
                width: @pixel_size * state.board.width,
                height: @pixel_size * state.board.height,
                background: 'black'
            )
            on :key_down do |event|
                handle_key_down(event)
            end                
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
            @snake_pos.each(&:remove) if @snake_pos
            @snake_pos = state.snake.body.map do |cell|
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
            @food.remove if @food
            @food = Square.new(
                x: @pixel_size * state.food.x,
                y: @pixel_size * state.food.y,
                size: @pixel_size,
                color: 'red'
            )
        end

        private
        def handle_key_down(event)
            case event.key
            when 'up'
                @app.send_action(:change_direction, Model::Direction::UP)
            when 'down'
                @app.send_action(:change_direction, Model::Direction::DOWN)
            when 'left'
                @app.send_action(:change_direction, Model::Direction::LEFT)
            when 'right'
                @app.send_action(:change_direction, Model::Direction::RIGHT)
            end
        end

    end
end