require_relative './actions/actions'
require_relative './model/state'
require_relative './view/ruby2d'

class App
    def initialize
        @state = Model::initial_state
    end
    
    def start
        view = View::Ruby2dView.new
        Thread.new { init_timer(view) }
        view.create_window(@state)
    end

    def init_timer(view)
        loop do
            view.draw(@state)
            sleep 0.5
            Actions::move_snake(@state)
            if @state.game_over
                puts "Game Over"
                exit
            end
        end
    end
end

app = App.new
app.start
app.init_timer