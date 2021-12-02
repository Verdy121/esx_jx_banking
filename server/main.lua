ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jx_banking:deposit')
AddEventHandler('jx_banking:deposit', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)

	if not tonumber(amount) then return end
	amount = ESX.Math.Round(amount)

	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Virheellinen Määrä', style = { ['background-color'] = '#540909', ['color'] = '#ffffff' } })
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Talletit $'.. tostring(amount) ..'', style = { ['background-color'] = '#135409', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('jx_banking:withdraw')
AddEventHandler('jx_banking:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)
	local accountMoney = xPlayer.getAccount('bank').money

	if not tonumber(amount) then return end
	amount = ESX.Math.Round(amount)

	if amount == nil or amount <= 0 or amount > accountMoney then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Virheellinen Määrä', style = { ['background-color'] = '#540909', ['color'] = '#ffffff' } })
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Nostit $'.. tostring(amount) ..'', style = { ['background-color'] = '#135409', ['color'] = '#ffffff' } })
	end
end)
