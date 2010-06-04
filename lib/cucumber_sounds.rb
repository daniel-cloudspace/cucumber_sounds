require 'cucumber/formatter/pretty'


class Cucumber::Formatter::Pretty
  alias old_before_step_result before_step_result
  
  
  def before_step_result keyword, step_match, multiline_arg, status, exception, source_indent, background
    @sounds ||= { :failed => Dir['vendor/plugins/cucumber_sounds/sounds/fail/*'],
	          :passed => Dir['vendor/plugins/cucumber_sounds/sounds/pass/*'] }
    
    if @sounds.has_key?(@status) and not @sounds[@status].empty? then
      system 'screen -d -m mplayer ' + @sounds[@status].shuffle.first
    end
    
    old_before_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background)
  end
end
