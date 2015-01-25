#!/Users/greapflute/.rbenv/shims/ruby
# -*- coding: utf-8 -*-


require 'webrick'
require 'json'

def message_to_json(message)
  doc = <<EOF
    {"message": "#{message}"}
EOF
end

class ServletAction < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res.status = 200
    res.content_type = "application/json"
    message = "aaa"
    res.body = message_to_json(message)
#    return JSON.generate({:data => 'Hello World'})
  end
end

IP       = '127.0.0.1'             #IPは変えること
PORT     = '8080'                #port は1024以下にしないこと、する場合はroot権限
DOC      =  './'
CGI_PATH = '/Users/greapflute/.rbenv/shims/ruby' #環境にあわせてwindows  'C:\Ruby193\bin\ruby.exe'

opts  = {
  :BindAddress    => IP,
  :Port           => PORT,
  :DocumentRoot   => DOC,
  :CGIInterpreter => CGI_PATH
}

srv = WEBrick::HTTPServer.new(opts)


# view.cgiにhttpアクセスした場合、view.rbをcgiで動かす
srv.mount('/server', ServletAction)

#コマンドラインでCtrl+Cした場合止めるイベントハンドラ
Signal.trap(:INT){ srv.shutdown}


#サーバースタート
srv.start
