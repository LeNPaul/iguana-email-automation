local retry = require 'retry'
local scheduler = {}
scheduler.runAt = require 'scheduler'

local function callAPI(URL)

   local result, code = net.http.get{url=URL, timeout=120, live=false}

   if code == 200 then 
      iguana.logInfo('Email automation successful!')
      return true
   else
      error('Email automation failed!')
   end

end

local function ping()

   local callUrl = 'http://localhost:5000'

   local result, code = net.http.get{url=callUrl, timeout=120, live=false}

   if code == 200 then 
      iguana.logInfo('Ping successful!')
      return true
   else
      error('Ping failed!')
   end

end

local function enable()

   local callUrl = 'http://localhost:5000/enable'

   retry.call{func=callAPI, arg1=callUrl,retry=4, pause=45}

end

local function disable()

   local callUrl = 'http://localhost:5000/disable'

   retry.call{func=callAPI, arg1=callUrl,retry=4, pause=45}

end

function main()

   iguana.setTimeout(300)

   local weekday = os.date('%A')
   local date = os.date('%x')
   local minutes = os.date('%M')
   local seconds = os.date('%S')

   local holidays = {
      '07/01/18',
      '08/06/18',
      '09/03/18',
      '10/08/18',
      '12/25/18',
      '12/26/18'
   }
--[[
   if minutes:sub(2,2) == '0' and seconds:sub(1,1) == '0' then 
      retry.call{func=ping, arg1=callUrl,retry=4, pause=45}
   end
--]]
   if weekday ~= 'Saturday' and weekday ~= 'Sunday' then

      if date ~= holidays[1] and date ~= holidays[2] and 
         date ~= holidays[3] and date ~= holidays[4] and 
         date ~= holidays[5] and date ~= holidays[6] then 

         -- Disable email automation
         scheduler.runAt(9, disable)

      end

   end

end