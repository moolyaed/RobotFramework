*** Variables ***
${url}         https://coinswitch.co/pro/
${browser}     chrome   

${TestSetup}    Test case Setup successfully
${TestTeardown}    Test case Tear down successfully
${Parameter}         /pro/api/v1/realtime-rates/depth?symbol=btc,inr&exchange=csx
${Base_url}    https://coinswitch.co
${TradeNow}    //button[text()='TRADE NOW']
${Skip_All}    //div[text()='Skip All']
${Done}        //div[text()='Done']

${Bid_Value}    //div[@class='tw-flex-1 tw-text-right tw-text-green-01 lg:tw-text-center']
${LimitPrice}    //input[@name='limit_price']

