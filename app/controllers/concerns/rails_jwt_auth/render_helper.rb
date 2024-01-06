module RailsJwtAuth
    module RenderHelper
      private
  
      def render_session(jwt, user)
        # add custom field to session response
        render json: {session: {jwt: jwt, email: user.email}}, status: 201
      end
    end

  end