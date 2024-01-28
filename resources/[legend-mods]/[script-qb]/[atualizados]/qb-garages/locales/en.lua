local Translations = {
    error = {
        no_vehicles = "Não há veículos neste local!",
        not_impound = "Seu veículo não está no depósito",
        not_owned = "Este veículo não pode ser armazenado",
        not_correct_type = "Você não pode armazenar este tipo de veículo aqui",
        not_enough = "Dinheiro insuficiente",
        no_garage = "Nenhum",
        too_far_away = "Muito longe de um estacionamento",
        occupied = "O estacionamento já está ocupado",
        all_occupied = "Todas as vagas de estacionamento estão ocupadas",
        no_vehicle = "Não há veículo para estacionar",
        no_house_keys = "Você não tem as chaves desta garagem de casa",
    },
    success = {
        vehicle_parked = "Veículo estacionado",
    },
    menu = {
        header = {
            house_garage = "Garagem de Casa",
            house_car = "Garagem de Casa %{value}",
            public_car = "Garagem Pública %{value}",
            public_sea = "Garagem Pública para Barcos %{value}",
            public_air = "Hangar Público %{value}",
            job_car = "Garagem do Trabalho %{value}",
            job_sea = "Hangar do Trabalho para Barcos %{value}",
            job_air = "Hangar do Trabalho %{value}",
            gang_car = "Garagem de Gangue %{value}",
            gang_sea = "Hangar de Gangue para Barcos %{value}",
            gang_air = "Hangar de Gangue %{value}",
            depot_car = "Depósito %{value}",
            depot_sea = "Depósito %{value}",
            depot_air = "Depósito %{value}",
            vehicles = "Veículos Disponíveis",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Sair da Garagem",
            sea = "⬅ Sair do Hangar para Barcos",
            air = "⬅ Sair do Hangar",
            job = "⬅ Sair da Garagem"
        },
        text = {
            vehicles = "Veículos Armazenados",
            depot = "Placa: %{value}<br>Combustível: %{value2} | Motor: %{value3} | Carroceria: %{value4}",
            garage = "Estado: %{value}<br>Combustível: %{value2} | Motor: %{value3} | Carroceria: %{value4}",
        }
    },
    status = {
        out = "Fora",
        garaged = "Na Garagem",
        impound = "Apreendido",
    },    
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
