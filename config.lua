Config = {}
Config.DrawDistance = 5.0

Config.Duty = {
    Police = {
        Enable = true,
        Jobs = {
            ['police'] = true,
            ['offpolice'] = true
        },
        Pos = vector3(443.9736, -981.6132, 30.67834),
        Marker = {
            Type = 22,
            Size = {x = 1.0, y = 1.0, z = 1.0},
            Color = {r = 0, g = 100, b = 255},
        },
    },
    Ambulance = {
        Enable = true,
        Jobs = {
            ['ambulance'] = true,
            ['offambulance'] = true
        },
        Pos = vector3(304.62, -600.24, 43.28),
        Marker = {
            Type = 22,
            Size = {x = 1.0, y = 1.0, z = 1.0},
            Color = {r = 0, g = 100, b = 255},
        },
    },
}

Config.Webhook = {
    Link = '',
    Icon = ''
}
