SoccerServerAPI = {}

SoccerServerAPI.GetPlayerScoreboardIdentifier = function(source)
    return source
end

ITEMS_PER_PAGE = 10

-- 📦 Database queries
SoccerServerAPI.Queries = {
    CreateHistoryTable = function()
        clib.db.Insert([[
            CREATE TABLE IF NOT EXISTS `cdev_soccer_history` (
                `id` bigint(20) NOT NULL AUTO_INCREMENT,
                `team` tinyint(4) NOT NULL,
                `match_date` datetime NOT NULL,
                `score` varchar(50) NOT NULL DEFAULT '',
                `scoreboard` longtext NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        ]])
    end,
    ---@param team number
    ---@param matchDate string
    ---@param score string
    ---@param scoreboard string
    InsertHistory = function(team, matchDate, score, scoreboard)
        clib.db.Insert([[
            INSERT INTO `cdev_soccer_history` (`team`, `match_date`, `score`, `scoreboard`)
            VALUES (@team, @match_date, @score, @scoreboard);
        ]], {
            team = team,
            match_date = matchDate,
            score = score,
            scoreboard = scoreboard
        })
    end,
    ---@param page number
    FetchHistoryPage = function(page)
        return clib.db.Query([[
            SELECT * FROM `cdev_soccer_history`
            ORDER BY `match_date` DESC
            LIMIT @offset, 10;
        ]], {
            offset = (page - 1) * ITEMS_PER_PAGE
        })
    end,
    GetPageCount = function()
        local count = clib.db.Query([[
            SELECT COUNT(*) AS `count` FROM `cdev_soccer_history`;
        ]])[1].count

        return math.ceil(count / ITEMS_PER_PAGE)
    end
}

SoccerServerAPI.OnEndMatchServer = function()
end

SoccerServerAPI.OnBeginMatchServer = function(started)
end