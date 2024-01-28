PublicSharedSoccerConfig = {
    Keybinds = {
        ShootBall = { "mouse_button", "mouse_right" },
        SecondaryAction = { "mouse_button", "mouse_left" },
        GoaleeStance = { "keyboard", "lcontrol" },
        Scoreboard = { "keyboard", "tab" },
        Instructions = { "keyboard", "f9" },
    },

    Permissions = {},

    Style = {
        StaminaOffsetLeft = "1rem",
        StaminaOffsetBottom = "7rem",
    },

    UseTarget = true,
    UseGabzMBA = false,
    WantNPCMarker = true,

    Drawtext = {
        ManagerMenuControl = 38,
    },

    CountdownStartMatch = 10,
    GoalIntermissionDuration = 5,
    OutIntermissionDuration = 3,
    WinnerIntermissionDuration = 5,
    StaminaCostSprintPerTick = 0.16,
    StaminaRecoverPerTick = 0.16,
    StaminaCostTackle = 25,
    StaminaCostDribble = 15,
    ScoreGoal = 100,
    ScoreGoalEveryone = 15,
    ScoreAssist = 75,
    ScoreShot = 30,
    ScorePass = 50,
    ScoreDefense = 50,

    -- It's not recommended to change these values unless you're sure of it as they will heavily impact gameplay
    ShootStrength = 40.0,
    ShootUpStrengthMultiplier = 10.0,
    ShootUpCAP = 20.0, -- Upwards strength is limited to this value to prevent the ball from flying too high

    -- For development and support feedback only, do not use.
    Debug = false,
}