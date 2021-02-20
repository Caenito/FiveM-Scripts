--[[
	SCRIPTER: DGVaniX [ DGVaniX#0096 ] 
	WEBSITE: http://vanix.market
--]]

local cfg = {}

cfg.open_coins = 0

cfg.display_css = [[
.div_coins{
    position: absolute;
    background-color: rgba(0,0,0,0.4);
    top: 1%;
    left: 28.5%;
    text-align:center;
    color: white;
    padding: 5px;
    width: 8.75%;
    border-radius: 20px;
    font-family: 'Lucida Consola';
    font-size: 17.5px;
    font-weight: bold;
    color: #FFFFFF;
    text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}

.div_coins .symbol{
	content: url('https://png.icons8.com/office/1600/british-pound.png'); 
	display: inline-flex;
	width: 23px;
	height: 23px;
}
]]

function getCoinConfig()
	return cfg
end
