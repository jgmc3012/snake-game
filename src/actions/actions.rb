module Actions
    def self.move_snake(state)
        # TODO: Validate next position
        next_position = cal_next_position(state.direction, state.snake)
        if position_is_valid?(state, next_position)
            move_snake_to(next_position, state)
        else
            end_game(state)
        end
    end

    private
    def self.cal_next_position(direction, snake)
        case direction
        when :up
            return Model::Coord.new(snake.head.x, snake.head.y,  - 1)
        when :down
            return Model::Coord.new(snake.head.x, snake.head.y + 1)
        when :left
            return Model::Coord.new(snake.head.x - 1, snake.head.y)
        when :right
            return Model::Coord.new(snake.head.x + 1, snake.head.y)
        end
    end

    def self.position_is_valid?(state, next_position)
        return false if next_position.y < 0 || next_position.y > state.board.height - 1
        return false if next_position.x < 0 || next_position.x > state.board.width - 1
        return false if state.snake.body.include?(next_position)
        return true
    end

    def self.move_snake_to(next_position, state)
        state.snake.body.unshift(next_position)
        state.snake.body.pop
        puts "move_snake_to: Snake head is now at #{state.snake.head}"
    end

    def self.end_game(state)
        state.game_over = true
    end
end