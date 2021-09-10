module Model

    module Direction
        UP = :up
        DOWN = :down
        LEFT = :left
        RIGHT = :right
    end

    class Coord < Struct.new(:x, :y)
    end

    class Food < Coord
    end

    class Snake < Struct.new(:body)
        def head
            body.first
        end
    end

    class Board < Struct.new(:height, :width)
    end

    class State < Struct.new(:snake, :food, :board, :direction, :game_over)
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([Model::Coord.new(0, 1), Model::Coord.new(0, 0)]),
            Model::Food.new(4,4),
            Model::Board.new(20, 20),
            Model::Direction::RIGHT,
            false
        )
    end
end