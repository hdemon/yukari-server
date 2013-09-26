# coding: utf-8

class YukariApp
  def call(env)
    p env
    case env['REQUEST_METHOD']
    when 'GET'
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['<html><body><form method="POST"><input type="submit" value="fff" /></form></body></html>']
      ]
    when 'POST'
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['<html><body>fafwe</body></html>']
      ]
    end
  end
end