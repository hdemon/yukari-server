# encoding: shift_jis
require 'Win32API'
require 'webrick'

FindWindow    = Win32API.new("user32","FindWindow","pp","i")
FindWindowEx  = Win32API.new("user32","FindWindowEx","iipp", "i")
SendMessage = Win32API.new('user32', 'SendMessage', ["L","L","L","L"],"L")
PostMessage = Win32API.new('user32', 'PostMessage', ["L","L","L","L"],"L")


class YukariWindow
  def initialize
    @handle_top = FindWindow.call("TkTopLevel", "VOICEROID＋ 結月ゆかり")
    @handle_second = FindWindowEx.call(@handle_top, 0, "TkChild", "")
    @handle_third = FindWindowEx.call(@handle_second, 0, "TkChild", "")
    @handle_buttons = FindWindowEx.call(@handle_second, @handle_third, "TkChild", "")

    # get buttons handle
    @handle_registor_word_button = FindWindowEx.call(@handle_buttons, 0, "Button", "")
    @handle_phrase_adjust_button = FindWindowEx.call(@handle_buttons, @handle_registor_word_button, "Button", "")
    @handle_save_button = FindWindowEx.call(@handle_buttons, @handle_phrase_adjust_button, "Button", "")
    @handle_stop_button = FindWindowEx.call(@handle_buttons, @handle_save_button, "Button", "")
    @handle_play_button = FindWindowEx.call(@handle_buttons, @handle_stop_button, "Button", "")

    # get text area
  end

  def push_save_button
    PostMessage.call(@handle_save_button, 0, 0, 0)
  end

  def push_play_button
    PostMessage.call(@handle_play_button, 0, 0, 0)
  end

  def paste_text_to_textarea
    PostMessage.call(@handle_play_button, 0, 0, 0)
  end
end


class YukariSaveDialog
  def initialize
    # Class蜷阪′"#32770"縺ｧ縲∽ｸ隕玖ｵｷ蜍墓ｯ弱↓螟牙喧縺励◎縺・□縺後∝崋螳壹・讒伜ｭ舌・
    puts @handle_top = FindWindow.call("#32770", "音声ファイルの保存")
    puts @handle_submit_button = FindWindowEx.call(@handle_top, 0, "Button", "保存(&S)")
    puts @handle_cancel_button = FindWindowEx.call(@handle_top, @handle_save_button, "Button", "キャンセル")
  end

  def push_submit_button
    PostMessage.call(@handle_submit_button, 0, 0, 0)
  end

  def push_cancel_button
    PostMessage.call(@handle_cancel_button, 0, 0, 0)
  end
end


server = WEBrick::HTTPServer.new({:BindAddress => '127.0.0.1',
                                  :Port => 10080})
