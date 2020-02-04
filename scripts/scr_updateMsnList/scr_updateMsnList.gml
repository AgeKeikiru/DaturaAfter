var
_arr = [],
_arrMsn = [],
_arrSoc = [],
_phase = global.map_flags[? FG_MSNPHASE],
_newPhase = _phase + 1,
_key = FG_MP + string(_phase),
_thresh = [
    0,
    1,
    3,
    4,
    3
],
_unlocks = [
    [
        [
            MSN_NLOEWI_01
        ],
        [
            SOC_EEVOKER,
            SOC_DCHEF,
            SOC_SRAZER,
            SOC_MENTOR
        ]
    ],
    
    [
        [
            MSN_VWOODS_01,
            MSN_VCANAL_01,
            MSN_NABTUNDRA_01
        ],
        [
            SOC_BBULLETTIP,
            SOC_WANDERERTIP,
            SOC_WOLFEANTTIP,
            SOC_ARI_JOIN1
        ]
    ],
    
    [
        [
            MSN_VCANAL_02,
            MSN_VWOODS_02,
            MSN_NLOEWI_02
        ],
        [
            SOC_VACE,
            SOC_AZOD
        ]
    ],
    
    [
        [
            MSN_CLOEWI_01,
            MSN_VCANAL_03
        ],
        []
    ],
    
    [
        [
            MSN_DEMOBOSS
        ],
        []
    ],
    
    //placeholder to avoid out of bounds index
    [
        [],
        []
    ]
];

if(global.map_flags[? _key] >= _thresh[_newPhase]){
    global.map_flags[? FG_MSNPHASE] += 1;
    
    _arr = _unlocks[_phase];
    _arrMsn = _arr[0];
    _arrSoc = _arr[1];
}

//special cases
switch _newPhase{
    case 0:
        //
    
        break;
}

if(array_length_1d(_arr) > 0){
    //old content
    for(var _i = 0;_i < array_length_1d(_arrSoc);_i++){
        var _soc = _arrSoc[_i];
        
        switch _soc{
            case SOC_ARI_JOIN1:
                //permanent socials, do nothing
                break;
            default:
                global.map_flags[? SOC_FG_STATUS + _soc] = 3;
        }
    }
    
    //new content
    _arr = _unlocks[_newPhase];
    _arrMsn = _arr[0];
    _arrSoc = _arr[1];
    
    for(var _i = 0;_i < array_length_1d(_arrMsn);_i++){
        scr_unlockMission(_arrMsn[_i]);
    }
    
    for(var _i = 0;_i < array_length_1d(_arrSoc);_i++){
        scr_unlockSocial(_arrSoc[_i]);
    }
}