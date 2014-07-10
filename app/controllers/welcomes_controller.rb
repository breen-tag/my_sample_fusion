class WelcomesController < ApplicationController
  def index
    @graph_bubbles = GraphBubble.all
    @graph_connectors = GraphConnector.all
  	#redirect_to :action => "return_some_data", :format => :xml
  end
  def return_some_data
  	p "here it is"
    @thename = "JOHN DOE"
    p @thename
    #render "return_some_data.xml.erb"
      respond_to do |format|
      	p "comes here"
        format.xml
      end
  end

  def show
    p "hello this is show page okay..?"
  end

  def added
    p "test added in branch1"
  end
  
end
