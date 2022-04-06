// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

<% if I18n.locale == :en %>
  moment.locale('en');
<% end %> 
<% if I18n.locale == :ar %>
  moment.locale('ar');
<% end %> 