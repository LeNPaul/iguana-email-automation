local retry = require 'retry'

local function callAPI(URL)

   local result, code = net.http.get{url=URL, timeout=120, live=false}

   if code == 200 then 
      iguana.logInfo('Email automation successful!')
      return true
   else
      error('Email automation failed!')
   end

end

local emailUtil = {}

function emailUtil.ping()

   local callUrl = 'http://localhost:5000'

   local result, code = net.http.get{url=callUrl, timeout=120, live=false}

   if code == 200 then 
      iguana.logInfo('Ping successful!')
      return true
   else
      error('Ping failed!')
   end

end

function emailUtil.enable()

   local callUrl = 'http://localhost:5000/enable'

   retry.call{func=callAPI, arg1=callUrl,retry=4, pause=45}

end

function emailUtil.disable()

   local callUrl = 'http://localhost:5000/disable'

   retry.call{func=callAPI, arg1=callUrl,retry=4, pause=45}

end

return emailUtil