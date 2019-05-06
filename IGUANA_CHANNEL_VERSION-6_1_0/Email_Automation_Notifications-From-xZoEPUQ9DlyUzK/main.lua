local autoresponder = require 'emailUtil'
local retry = require 'retry'
local scheduler = {}
scheduler.runAt = require 'scheduler'

function main()

   iguana.setTimeout(300)

   local weekday = os.date('%A')
   local date = os.date('%x')
   local hours = os.date('%H')
   local minutes = os.date('%M')
   local seconds = os.date('%S')

   local holidays = {
      '01/01/19',
      '02/18/19',
      '04/19/19',
      '05/20/19',
      '07/01/19',
      '09/02/19',
      '10/14/19',
      '12/25/19',
      '12/26/19'
   }

   if minutes:sub(2,2) == '0' and seconds:sub(1,1) == '0' then 
      retry.call{func=autoresponder.ping, arg1=callUrl,retry=4, pause=45}
   end

   if weekday ~= 'Saturday' and weekday ~= 'Sunday' and hours == '17' then

      if date ~= holidays[1] and date ~= holidays[2] and 
         date ~= holidays[3] and date ~= holidays[4] and 
         date ~= holidays[5] and date ~= holidays[6] and
         date ~= holidays[7] and date ~= holidays[8] and
         date ~= holidays[9] then 

         -- Enable email automation
         scheduler.runAt(17, autoresponder.enable)

      end

   end

end