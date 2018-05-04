class TokenController < ApplicationController


  def index
    @received_token=nil
    @status=false
    @email=nil
    if params[:token]
      @received_token=params[:token]
      validator = GoogleIDToken::Validator.new
      begin
        payload = validator.check(@received_token, nil, false)
        @email = payload['email']
        @status = true
        sign_in(User.where(:email => @email), scope: :user)
      rescue GoogleIDToken::ValidationError => e
        puts "Cannot validate: #{e}"
        #format.json { render :index, token: params[:token], status: "Incorrecto" }
        
      end
    else
      puts "Token, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibidoToken, no recibido"
    end
    respond_to do |format|
      format.json do
        render json: {
          token: @received_token,
          status: @status,
          email: @email
        }.to_json
      end
    end
    
  end
end
