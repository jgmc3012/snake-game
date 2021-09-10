require_relative './model/state'
require_relative './view/ruby2d'

view = View::Ruby2dView.new

initial_state = Model::initial_state

view.render(initial_state)