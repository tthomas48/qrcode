module MenusHelper
  def remove_link_unless_new_record(fields)
    unless fields.object.new_record?
      out = ''
      out << fields.hidden_field(:_delete)
      out << link_to_function("remove", "$(this).up('.#{fields.object.class.name.underscore}').hide(); $(this).previous().value = '1'")
      out
    end
  end
  
  # These use the current date, but they could be lots easier.
  # Maybe just keep a global counter which starts at 10 or so.
  # That would be good enough if we only build 1 new record in the controller.
  #
  # And this of course is only needed because Ryan's example uses JS to add new
  # records. If you just build a new one in the controller this is all unnecessary.
 def add_menu_item_link(name, form)

#    link_to_function name do |page|
      menu_item = render(:partial => 'menu_item', :locals => { :f => form, :menu_item => MenuItem.new })
    link_to_function name, escape_javascript(menu_item)
#      page << %{
#        var new_menu_item_id = "new_" + new Date().getTime();
#        $('#menu_items').append("#{ escape_javascript menu_item }".replace(/new_\\d+/g, new_menu_item_id));
#      }
#    end
  end
end
