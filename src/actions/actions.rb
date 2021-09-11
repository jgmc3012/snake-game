require_relative '../model/state'

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

    def self.change_direction(state, direction)
        if next_direction_is_invalid?(direction, state)
            return
        end
        state.direction = direction
    end

    private
    def self.next_direction_is_invalid?(direction, state)
        case direction
        when Model::Direction::UP, Model::Direction::DOWN
            if state.direction in [Model::Direction::UP, Model::Direction::DOWN]
                return true
            end
        when Model::Direction::LEFT, Model::Direction::RIGHT
            if state.direction in [Model::Direction::LEFT, Model::Direction::RIGHT]
                return true
            end
        end
        return false
    end

    private
    def self.cal_next_position(direction, snake)
        case direction
        when Model::Direction::UP
            return Model::Coord.new(snake.head.x, snake.head.y - 1)
        when Model::Direction::DOWN
            return Model::Coord.new(snake.head.x, snake.head.y + 1)
        when Model::Direction::LEFT
            return Model::Coord.new(snake.head.x - 1, snake.head.y)
        when Model::Direction::RIGHT
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