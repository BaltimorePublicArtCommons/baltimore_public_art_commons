class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def query_header_for_query(query, any_search_results)
    if any_search_results
      "Showing search results for \"#{query}\""
    else
      "No search results for \"#{query}\""
    end
  end

end
