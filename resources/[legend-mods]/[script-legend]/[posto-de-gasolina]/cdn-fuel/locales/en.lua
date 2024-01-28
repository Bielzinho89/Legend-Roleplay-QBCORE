local Translations = {
    -- Fuel
    set_fuel_debug = "Definir combustível para:",
    cancelled = "Cancelado.",
    not_enough_money = "Você não tem dinheiro suficiente!",
    not_enough_money_in_bank = "Você não tem dinheiro suficiente no banco!",
    not_enough_money_in_cash = "Você não tem dinheiro suficiente no bolso!",
    more_than_zero = "Você precisa abastecer mais do que 0 litros!",
    emergency_shutoff_active = "As bombas estão atualmente desligadas.",
    nozzle_cannot_reach = "A mangueira não consegue alcançar até aqui!",
    station_no_fuel = "Esta estação está sem combustível!",
    station_not_enough_fuel = "A estação não tem tanto combustível!",
    show_input_key_special = "Pressione [G] quando próximo ao veículo para abastecê-lo!",
    tank_cannot_fit = "Seu tanque não consegue armazenar isso!",
    tank_already_full = "Seu veículo já está com o tanque cheio!",
    need_electric_charger = "Preciso ir até um carregador elétrico!",
    cannot_refuel_inside = "Você não pode abastecer de dentro do veículo!",
    
    -- 2.1.2 -- Reserva para Coleta ---
    fuel_order_ready = "Seu pedido de combustível está pronto para ser retirado! Consulte o GPS para encontrar o local de retirada!",
    draw_text_fuel_dropoff = "[E] Descarregar Caminhão",
    fuel_pickup_success = "Suas reservas foram preenchidas com: %s litros",
    fuel_pickup_failed = "A Ron Oil acaba de entregar o combustível na sua estação!",
    trailer_too_far = "O reboque não está acoplado ao caminhão ou está muito longe!",
    
    -- 2.1.0
    no_nozzle = "Você não tem a mangueira!",
    vehicle_is_damaged = "O veículo está muito danificado para abastecer!",
    vehicle_too_far = "Você está muito longe para abastecer este veículo!",
    inside_vehicle = "Você não pode abastecer estando dentro do veículo!",
    you_are_discount_eligible = "Se você entrar em serviço, poderá receber um desconto de "..Config.EmergencyServicesDiscount['discount'].."%!",
    no_fuel = "Sem combustível..",
    
    -- Elétrico
    electric_more_than_zero = "Você precisa carregar mais do que 0KW!",
    electric_vehicle_not_electric = "Seu veículo não é elétrico!",
    electric_no_nozzle = "Seu veículo não é elétrico!",
    
    -- Telefone --
    electric_phone_header = "Carregador Elétrico",
    electric_phone_notification = "Custo Total de Eletricidade: $",
    fuel_phone_header = "Posto de Gasolina",
    phone_notification = "Custo Total: $",
    phone_refund_payment_label = "Reembolso @ Posto de Gasolina!",    

    -- Estações
    station_per_liter = " / Litro!",
    station_already_owned = "Este local já está adquirido!",
    station_cannot_sell = "Você não pode vender este local!",
    station_sold_success = "Você vendeu este local com sucesso!",
    station_not_owner = "Você não é o proprietário deste local!",
    station_amount_invalid = "A quantidade é inválida!",
    station_more_than_one = "Você precisa comprar mais do que 1 litro!",
    station_price_too_high = "Este preço está muito alto!",
    station_price_too_low = "Este preço está muito baixo!",
    station_name_invalid = "Este nome é inválido!",
    station_name_too_long = "O nome não pode ter mais de "..Config.NameChangeMaxChar.." caracteres.",
    station_name_too_short = "O nome deve ter mais de "..Config.NameChangeMinChar.." caracteres.",
    station_withdraw_too_much = "Você não pode sacar mais do que a estação tem!",
    station_withdraw_too_little = "Você não pode sacar menos de $1!",
    station_success_withdrew_1 = "Retirou com sucesso $",
    station_success_withdrew_2 = " do saldo desta estação!", -- Deixe o espaço no início!
    station_deposit_too_much = "Você não pode depositar mais do que possui!",
    station_deposit_too_little = "Você não pode depositar menos de $1!",
    station_success_deposit_1 = "Depositou com sucesso $",
    station_success_deposit_2 = " no saldo desta estação!", -- Deixe o espaço no início!
    station_cannot_afford_deposit = "Você não pode pagar para depositar $",
    station_shutoff_success = "Alterou com sucesso o estado da válvula de desligamento para este local!",
    station_fuel_price_success = "Alterou com sucesso o preço do combustível para $",
    station_reserve_cannot_fit = "As reservas não podem armazenar isso!",
    station_reserves_over_max = "Você não pode comprar essa quantidade, pois excederá a quantidade máxima de "..Config.MaxFuelReserves.." litros",
    station_name_change_success = "Alterou com sucesso o nome para: ", -- Deixe o espaço no final!
    station_purchased_location_payment_label = "Comprou uma Localização de Posto de Gasolina: ",
    station_sold_location_payment_label = "Vendeu uma Localização de Posto de Gasolina: ",
    station_withdraw_payment_label = "Sacou dinheiro do Posto de Gasolina. Localização: ",
    station_deposit_payment_label = "Depositou dinheiro no Posto de Gasolina. Localização: ",

    -- Todas as Barras de Progresso
    prog_refueling_vehicle = "Abastecendo Veículo..",
    prog_electric_charging = "Carregando..",
    prog_jerry_can_refuel = "Abastecendo Galão..",
    prog_syphoning = "Drenando Combustível..",

    -- Menus

    menu_header_cash = "Dinheiro",
    menu_header_bank = "Banco",
    menu_header_close = "Cancelar",
    menu_pay_with_cash = "Pagar em dinheiro. <br>Meu saldo: $",
    menu_pay_with_bank = "Pagar no cartão.", 
    menu_refuel_header = "Posto de Gasolina",
    menu_refuel_accept = "Eu gostaria de comprar o combustível.",
    menu_refuel_cancel = "Na verdade, eu não quero mais combustível.",
    menu_pay_label_1 = "Gasolina @ ",
    menu_pay_label_2 = " / L",
    menu_header_jerry_can = "Galão",
    menu_header_refuel_jerry_can = "Abastecer Galão",
    menu_header_refuel_vehicle = "Abastecer Veículo",

    menu_electric_cancel = "Na verdade, eu não quero mais carregar meu carro.",
    menu_electric_header = "Carregador Elétrico",
    menu_electric_accept = "Eu gostaria de pagar pela eletricidade.",
    menu_electric_payment_label_1 = "Eletricidade @ ",
    menu_electric_payment_label_2 = " / KW",


        -- Menus de Estação

    menu_ped_manage_location_header = "Gerenciar Posto",
    menu_ped_manage_location_footer = "Se você é o proprietário, pode gerenciar este posto.",

    menu_ped_purchase_location_header = "Comprar Posto",
    menu_ped_purchase_location_footer = "Se ninguém é proprietário deste posto, você pode comprá-lo.",

    menu_ped_emergency_shutoff_header = "Alternar Desligamento de Emergência",
    menu_ped_emergency_shutoff_footer = "Desligue o combustível em caso de emergência. <br> As bombas estão atualmente",

    menu_ped_close_header = "Cancelar Conversa",
    menu_ped_close_footer = "Na verdade, não quero discutir mais nada.",

    menu_station_reserves_header = "Comprar Reservas por ",
    menu_station_reserves_purchase_header = "Comprar reservas por: $",
    menu_station_reserves_purchase_footer = "Sim, quero comprar reservas de combustível por $",
    menu_station_reserves_cancel_footer = "Na verdade, não quero comprar mais reservas!",

    menu_purchase_station_header_1 = "O custo total será: $",
    menu_purchase_station_header_2 = " incluindo impostos.",
    menu_purchase_station_confirm_header = "Confirmar",
    menu_purchase_station_confirm_footer = "Quero comprar este posto por $",
    menu_purchase_station_cancel_footer = "Na verdade, não quero mais comprar este posto. Esse preço é absurdo!",

    menu_sell_station_header = "Vender ",
    menu_sell_station_header_accept = "Vender posto de gasolina",
    menu_sell_station_footer_accept = "Sim, quero vender este posto por: $",
    menu_sell_station_footer_close = "Cancelar venda.",

    menu_manage_header = "Painel do posto: ",
    menu_manage_reserves_header = "Estoque de Combustível:",
    menu_manage_reserves_footer_1 =  " / ",
    menu_manage_reserves_footer_2 =  "",

    menu_manage_purchase_reserves_header = "Comprar combustível para estoque",
    menu_manage_purchase_reserves_footer = "Valor do litro: $",
    menu_manage_purchase_reserves_footer_2 = "/L",

    menu_alter_fuel_price_header = "Alterar preço do combustível",
    menu_alter_fuel_price_footer_1 = "Quero mudar o preço do combustível no meu Posto de Combustível!  <br>Atualmente, está em $",

    menu_manage_company_funds_header = "Gerenciar financeiro do posto",
    menu_manage_company_funds_footer = "Saque ou deposite fundos na empresa.",
    menu_manage_company_funds_header_2 = "Financeiro de: <br>",
    menu_manage_company_funds_withdraw_header = "Sacar Fundos",
    menu_manage_company_funds_withdraw_footer = "Retirar fundos da conta do posto.",
    menu_manage_company_funds_deposit_header = "Depositar Fundos",
    menu_manage_company_funds_deposit_footer = "Depositar fundos na conta do posto.",
    menu_manage_company_funds_return_header = "Retornar",
    menu_manage_company_funds_return_footer = "Quero discutir outra coisa!",

    menu_manage_change_name_header = "Alterar nome do posto",
    menu_manage_change_name_footer = "Mude o nome do posto gratuitamente.",

    menu_manage_sell_station_footer = "Vender posto por: $",

    menu_manage_close = "Na verdade, não tenho mais nada para discutir!", 

    -- Menus de Galão
    menu_jerry_can_purchase_header = "Comprar Galão por $",
    menu_jerry_can_footer_full_gas = "Seu Galão está cheio!",
    menu_jerry_can_footer_refuel_gas = "Abasteça seu Galão!",
    menu_jerry_can_footer_use_gas = "Coloque sua gasolina para usar e abasteça o veículo!",
    menu_jerry_can_footer_no_gas = "Você não tem gasolina no seu Galão!",
    menu_jerry_can_footer_close = "Na verdade, não quero mais um Galão.",
    menu_jerry_can_close = "Na verdade, não quero mais usar isso.",

    -- Menus de Kit de Sifão
    menu_syphon_kit_full = "Seu Kit de Sifão está cheio! Só cabe " .. Config.SyphonKitCap .. "L!",
    menu_syphon_vehicle_empty = "O tanque de combustível deste veículo está vazio.",
    menu_syphon_allowed = "Roube combustível de uma vítima desavisada!",
    menu_syphon_refuel = "Coloque sua gasolina roubada para usar e abasteça o veículo!",
    menu_syphon_empty = "Coloque sua gasolina roubada para usar e abasteça o veículo!",
    menu_syphon_cancel = "Na verdade, não quero mais usar isso. Estou virando uma nova folha!",
    menu_syphon_header = "Sifão",
    menu_syphon_refuel_header = "Abastecer",



    -- Entrada --
    input_select_refuel_header = "Selecione quanto combustível abastecer.",
    input_refuel_submit = "Abastecer Veículo",
    input_refuel_jerrycan_submit = "Abastecer Galão",
    input_max_fuel_footer_1 = "Até ",
    input_max_fuel_footer_2 = "L de gasolina.",
    input_insert_nozzle = "Inserir bocal", -- Usado também para Alvo!

    input_purchase_reserves_header_1 = "Comprar Combustível <br>Preço atual: $",
    input_purchase_reserves_header_2 = Config.FuelReservesPrice .. "/L  <br>Estoque atual: ",
    input_purchase_reserves_header_3 = " Litros  <br>Custo para encher totalmente: $",
    input_purchase_reserves_submit_text = "Comprar Combustível",
    input_purchase_reserves_text = 'inserir valor',

    input_alter_fuel_price_header_1 = "Alterar Preço do Combustível   <br>Preço atual: $",
    input_alter_fuel_price_header_2 = "/L",
    input_alter_fuel_price_submit_text = "Mudar Valor",

    input_change_name_header_1 = "Alterar Nome de: <br>",
    input_change_name_header_2 = "",
    input_change_name_submit_text = "Confirmar Mudança",
    input_change_name_text = "insira um novo nome",

    input_withdraw_funds_header = "Retirar Fundos  <br>Saldo Atual: $",
    input_withdraw_submit_text = "Retirar",
    input_withdraw_text = "Retirar Fundos",

    input_deposit_funds_header = "Depositar Fundos  <br>Saldo Atual: $",
    input_deposit_submit_text = "Depositar",
    input_deposit_text = "Depositar Fundos",

    -- Alvo
    grab_electric_nozzle = "Pegar bocal elétrico",
    insert_electric_nozzle = "Inserir bocal elétrico",
    grab_nozzle = "Pegar bocal",
    return_nozzle = "Devolver bocal",
    grab_special_nozzle = "Pegar bocal especial",
    return_special_nozzle = "Devolver bocal especial",
    buy_jerrycan = "Comprar galão",
    station_talk_to_ped = "Conversar com frentista",

    -- Galão
    jerry_can_full = "Seu Galão está cheio!",
    jerry_can_refuel = "Abasteça seu Galão!",
    jerry_can_not_enough_fuel = "O Galão não tem tanto combustível!",
    jerry_can_not_fit_fuel = "O Galão não consegue armazenar tanto combustível!",
    jerry_can_success = "Encheu o Galão com sucesso!",
    jerry_can_success_vehicle = "Abasteceu o veículo com sucesso usando o Galão!",
    jerry_can_payment_label = "Galão Comprado.",

    -- Sifão
    syphon_success = "Sifonou com sucesso do veículo!",
    syphon_success_vehicle = "Abasteceu o veículo com sucesso usando o Kit de Sifão!",
    syphon_electric_vehicle = "Este veículo é elétrico!",
    syphon_no_syphon_kit = "Você precisa de algo para sifonar gasolina.",
    syphon_inside_vehicle = "Você não pode sifonar de dentro do veículo!",
    syphon_more_than_zero = "Você precisa roubar mais do que 0L!",
    syphon_kit_cannot_fit_1 = "Você não pode sifonar tanto, seu kit não cabe! Você só pode armazenar: ",
    syphon_kit_cannot_fit_2 = " Litros.",
    syphon_not_enough_gas = "Você não tem gasolina suficiente para abastecer tanto!",
    syphon_dispatch_string = "(10-90) - Roubo de Gasolina",
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})