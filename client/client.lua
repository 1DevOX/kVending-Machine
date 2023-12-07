local cafe = {
    {
      name = 'cafe',
      icon = 'fa-solid fa-cart-shopping',
      label = 'Ouvrir le menu',
      onSelect = function()
        TriggerEvent('cafe')
      end,
    },
}

local soda = {
  {
    name = 'soda',
    icon = 'fa-solid fa-cart-shopping',
    label = 'Ouvrir le menu',
    onSelect = function()
      TriggerEvent('soda')
    end,
  },
}

--- # DISTRIBUTEUR # ---

lib.registerContext({
  id = 'cafe',
  title = 'Distributeur',
  options = {
    {
      title = 'Numéro de série',
      icon = 'lock',
      iconColor = '#D7FEFF',
      description = 'Entrer le numéro de série de votre article.',
      onSelect = function()
        local input = lib.inputDialog('Numéro de Série',{{type = 'number', icon = 'hashtag'}}) 

        if input[1] == 5923 then
          model = k.cafe.model
          price = k.cafe.prixmodel
        elseif input[1] == 3719 then
          model = k.twix.model
          price = k.twix.prixmodel
        elseif input[1] == 8297 then
          model = k.cafelait.model
          price = k.cafelait.prixmodel
        elseif input[1] == 7583 then
          model = k.chocolat.model
          price = k.chocolat.prixmodel
        else
          model = nil
          price = nil
        end

        if model ~= nil and price ~= nil then
          TriggerServerEvent("distributeur", model, price)
        else
          TriggerEvent('cafe')
          lib.notify({  
              title = 'Erreur',
              description = k.notification3,
              position = 'top',
              duration = 5000,
              type = 'error'
            })
        end
      end
    },
    {
      title = ' ',
      description = ' ',
    },
    {
    title = 'Café',
    icon = 'mug-hot',
    iconColor = '#BD7C7C',
    description = 'Une petite pause café ?',
    metadata = {
      {label = 'Prix ', value = k.cafe.prix..' $'},
      {label = 'Numéro de série ', value = ' #5923'},
    },
    },
    {
      title = 'Twix',
      icon = 'battery-quarter',
      iconColor = '#FCFFC2',
      description = 'Regagne des forces !',
      metadata = {
        {label = 'Prix ', value = k.twix.prix..' $'},
        {label = 'Numéro de série ', value = ' #3719'},
      },
      },
      {
      title = 'Café au lait',
      icon = 'cow',
      iconColor = '#FFFFFF',
      description = 'Un café sepoudré de lait !',
      metadata = {
        {label = 'Prix ', value = k.cafelait.prix..' $'},
        {label = 'Numéro de série ', value = ' #8297'},
      },
      },
      {
        title = 'Chocolat chaud',
        icon = 'mug-saucer',
        iconColor = '#CBFFC7',
        description = 'Besoin de se réchauffer ?',
        metadata = {
          {label = 'Prix ', value = k.chocolat.prix..' $'},
          {label = 'Numéro de série ', value = ' #7583'},
        },
  }
}})

lib.registerContext({
  id = 'soda',
  title = 'Distributeur',
  options = {
    {
      title = 'Numéro de série',
      icon = 'lock',
      iconColor = '#D7FEFF',
      description = 'Entrer le numéro de série de votre article.',
      onSelect = function()
        local input = lib.inputDialog('Numéro de Série',{{type = 'number', icon = 'hashtag'}}) 

        if input[1] == 4561 then
          model = k.manzana.model
          price = k.manzana.prixmodel
        elseif input[1] == 9745 then
          model = k.sprite.model
          price = k.sprite.prixmodel
        elseif input[1] == 3661 then
          model = k.coca.model
          price = k.coca.prixmodel
        else
          model = nil
          price = nil
        end

        if model ~= nil and price ~= nil then
          TriggerServerEvent("distributeur", model, price)
        else
          TriggerEvent('soda')
          lib.notify({  
              title = 'Erreur',
              description = k.notification3,
              position = 'top',
              duration = 5000,
              type = 'error'
            })
        end
      end
    },
    {
    title = ' ',
    description = ' ',
    },
    {
    title = 'Manzana',
    icon = 'apple-whole',
    iconColor = '#CBFFC7',
    description = 'De la pomme alcolisée !',
    metadata = {
      {label = 'Prix ', value = k.manzana.prix..' $'},
      {label = 'Numéro de série ', value = ' #4561'},
    },
    },
    {
    title = 'Sprite',
    icon = 'whiskey-glass',
    iconColor = '#FFD9FA',
    description = 'Un petit sprite pour la route ?',
    metadata = {
      {label = 'Prix ', value = k.sprite.prix..' $'},
      {label = 'Numéro de série ', value = ' #9745'},
    },
    },
    {
    title = 'Coca cola',
    icon = 'bolt',
    iconColor = '#FCFFC2',
    description = 'Pshhht du sucre !',
    metadata = {
      {label = 'Prix ', value = k.coca.prix..' $'},
      {label = 'Numéro de série ', value = ' #3661'},
    },
    },
  }
})

local models = { `prop_vend_coffe_01` } 
exports.ox_target:addModel(models, cafe)

local models = { `v_68_broeknvend`, `prop_vend_soda_02`, `prop_vend_soda_01`, `prop_vend_fridge01` } 
exports.ox_target:addModel(models, soda)

RegisterNetEvent('cafe')
AddEventHandler('cafe', function()
    lib.showContext('cafe')   
end)

RegisterNetEvent('soda')
AddEventHandler('soda', function()
    lib.showContext('soda')   
end)
