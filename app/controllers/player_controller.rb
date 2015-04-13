class PlayerController < ApplicationController

  before_filter :logged_in

  def index
    @players = current_user.players
  end

  def add
    dob = Date.parse(params['dob']) rescue nil

    # TODO: Move this create logic
    if dob
      begin
        player = Player.create(name: params['name'], position: params['position'], dob: Date.parse(params['dob']))
        current_user.players << player
        current_user.save

        # TODO: Move this json generation
        render json: { message: "#{player.name} was added to your team.", player: { name: player.name, dob: player.dob.strftime('%d/%m/%Y'), position: player.position } }
      rescue StandardError => e
        logger.error "An error occurred while adding player with params #{params.inspect} to user: #{current_user.id}. Error was #{e}"

      render json: { message: 'An unknown error occurred. Please try again.' }, status: :internal_server_error
      end
    else
      render json: { message: 'An error occurred. Please provide a valid date of birth.' }, status: :bad_request
    end
  end

end
