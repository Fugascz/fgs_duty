Config = {}
Config.DrawDistance = 5.0

Config.ESX = {
    TriggerClient = 'esx:getSharedObject',
    TriggerServer = 'esx:getSharedObject'
}

Config.Text = {
    ['pressE'] = '[E] ON/OFF Duty',
    ['setDuty'] = 'Zapisuješ se...',
    ['youAreOffDuty'] = 'Jsi mimo službu',
    ['youAreInDuty'] = 'Jsi ve službě',
    ['player'] = 'Hráč',
    ['cameToDuty'] = 'Přišel do služby',
    ['leftTheService'] = 'Odešel ze služby'
}

Config.Animation = {
    Enable = false,
    Dict = 'gestures@f@standing@casual',
    DictAnim = 'gesture_hand_down',
    Time = 5000,
    UseProgressBar = true
}

Config.Zones = {
    ['policeStation'] = {
        Enable = true,
        Pos = vector3(443.96, -981.61, 30.67),
        Jobs = {
            ['police'] = true,
            ['offpolice'] = true,
        },
        Marker = {
            Type = 22,
            Size = {x = 1.0, y = 1.0, z = 1.0},
            Color = {r = 0, g = 100, b = 255, a = 100},
        },
    },
}

Config.Webhook = {
    Link = '',
    Icon = '',
    Color = 7829367
}
