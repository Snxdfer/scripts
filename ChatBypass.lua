--fun when it lasted.

-- chat bypass

local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit ;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v29, v30)
    local v31 = {};
    for v72 = 1, # v29 do
        v6(v31, v0(v4(v1(v2(v29, v72, v72 + 1)), v1(v2(v30, 1 + (v72 % # v30), 1 + (v72 % # v30) + 1))) % 256));
    end
    return v5(v31);
end
local v8 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Snxdfer/back-ups-for-libs/refs/heads/main/Orion.lua'))();
local v9 = v8:MakeWindow({
    ['Name'] = 'Chat Bypasser BETA',
    ['HidePremium'] = false,
    ['IntroText'] = 'Chat Bypasser BETA',
    ['SaveConfig'] = false
});
loadstring(game:HttpGet('https://raw.githubusercontent.com/vqmpjayZ/More-Scripts/main/Anti-Chat-Logger'))();
loadstring(game:HttpGet('https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua', true))();
loadstring(game:HttpGet('https://raw.githubusercontent.com/MasterBypasser/KnifeBypasser/refs/heads/main/AntiChatLogger.lua', true))();
function chat(v32)
    if (game:GetService('TextChatService').ChatVersion == Enum.ChatVersion.TextChatService) then
        game:GetService('TextChatService').TextChannels.RBXGeneral:SendAsync(v32);
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v32, 'All');
    end
end
local v10 = v9:MakeTab({
    ['Name'] = 'Chat Stuff',
    ['Icon'] = 'rbxassetid://4483345998',
    ['PremiumOnly'] = false
});
v10:AddLabel('                                      CHAT BYPASS');
local v11 = nil;
v10:AddDropdown({
    ['Name'] = 'Method',
    ['Options'] = {
        "ěx́ǎḿṕĺě",
        "éxạmṕĺe",
        "ẹ̲х̲ạ̲ṃ̲р̲ḷ̲ẹ̲",
        'e>x>a>m>p>l>e',
        "￵example",
        "3></-\\/\\/\\p|_3"
    },
    ['Callback'] = function(v33)
        v11 = v33;
    end
});
function bypasstext(v34, v35)
    if (v35 == 1) then
        local function v82(v89)
            local v90 = 0;
            local v91;
            local v92;
            while true do
                if (v90 == 1) then
                    local v118 = 0;
                    while true do
                        if (v118 == (0)) then
                            for v142 = 1 , # v89 do
                                local v143 = 0 ;
                                local v144;
                                while true do
                                    if ((0) == v143) then
                                        v144 = v89:sub(v142, v142);
                                        if v91[v144] then
                                            v92 = v92 .. v91[v144] ;
                                        else
                                            v92 = v92 .. v144 ;
                                        end
                                        break;
                                    end
                                end
                            end
                            return v92;
                        end
                    end
                end
                if (v90 == (0)) then
                    local v119 = 0 ;
                    while true do
                        if (v119 == 0) then
                            v91 = {
                                a = "ǎ",
                                b = "ḃ",
                                c = "ć",
                                d = "d́",
                                e = "ě",
                                f = "ḟ",
                                g = "ġ",
                                h = "ḣ",
                                i = "í",
                                j = "j́",
                                k = "ḱ",
                                l = "ĺ",
                                m = "ḿ",
                                n = "n̋",
                                o = "ō",
                                p = "ṕ",
                                q = "q́",
                                r = "ŕ",
                                s = "ś",
                                t = "t̋",
                                u = "ū",
                                v = "v̇",
                                w = "ẃ",
                                x = "x́",
                                y = "ý",
                                z = "ź",
                                A = "Ǎ",
                                B = "Ḃ",
                                C = "Ć",
                                D = "D́",
                                E = "Ě",
                                F = "Ḟ",
                                G = "Ġ",
                                H = "Ḣ",
                                I = "Í",
                                J = "J́",
                                K = "Ḱ",
                                L = "Ĺ",
                                M = "Ḿ",
                                N = "N̋",
                                O = "Ō",
                                P = "Ṕ",
                                Q = "Q́",
                                R = "Ŕ",
                                S = "Ś",
                                T = "T̋",
                                U = "Ū",
                                V = "V̇",
                                W = "Ẃ",
                                X = "X́",
                                Y = "Ý",
                                Z = "Ź"
                            };
                            v92 = "";
                            v119 = 1;
                        end
                        if (v119 == 1) then
                            v90 = 1 ;
                            break;
                        end
                    end
                end
            end
        end
        local function v83(v93)
            local v94 = 0;
            local v95;
            while true do
                local v99 = 0 ;
                local v100;
                while true do
                    if (0 == v99) then
                        v100 = 0 ;
                        while true do
                            if (v100 == (0)) then
                                if (v94 == (1)) then
                                    return table.concat(v95, " ");
                                end
                                if (v94 == (0)) then
                                    v95 = {};
                                    for v170 in string.gmatch(v93, '%S+') do
                                        table.insert(v95, v82(v170));
                                    end
                                    v94 = 1 ;
                                end
                                break;
                            end
                        end
                        break;
                    end
                end
            end
        end
        return v83(v34);
    elseif (v35 == (2)) then
        local function v101(v107)
            local v108 = 0 ;
            local v109;
            local v110;
            while true do
                if (0 == v108) then
                    local v133 = 0;
                    while true do
                        if (v133 == (0)) then
                            v109 = {
                                a = "ạ",
                                b = "ḃ",
                                c = "c",
                                d = "d́",
                                e = "e",
                                f = "ḟ",
                                g = "ġ",
                                h = "ḣ",
                                i = "i",
                                j = "j́",
                                k = "ḳ",
                                l = "ĺ",
                                m = "m",
                                n = "n̋",
                                o = "o",
                                p = "ṕ",
                                q = "q́",
                                r = "ŕ",
                                s = "ṣ",
                                t = "t",
                                u = "ụ",
                                v = "v̇",
                                w = "ẃ",
                                x = "x́",
                                y = "y",
                                z = "z",
                                A = "Ạ",
                                B = "Ḃ",
                                C = "C",
                                D = "D́",
                                E = "E",
                                F = "Ḟ",
                                G = "Ġ",
                                H = "Ḣ",
                                I = "I",
                                J = "J́",
                                K = "Ḱ",
                                L = "Ĺ",
                                M = "M",
                                N = "N",
                                O = "O",
                                P = "Ṕ",
                                Q = "Q́",
                                R = "Ŕ",
                                S = "Ṣ",
                                T = "T",
                                U = "Ụ",
                                V = "V̇",
                                W = "Ẃ",
                                X = "X́",
                                Y = "Y",
                                Z = "Z"
                            };
                            v110 = "";
                            v133 = 1 ;
                        end
                        if (v133 == (1)) then
                            v108 = 1 ;
                            break;
                        end
                    end
                end
                if (v108 == (1)) then
                    for v138 = 1 , # v107 do
                        local v139 = 0 ;
                        local v140;
                        while true do
                            if (v139 == (0)) then
                                v140 = v107:sub(v138, v138);
                                if v109[v140] then
                                    v110 = v110 .. v109[v140] ;
                                else
                                    v110 = v110 .. v140 ;
                                end
                                break;
                            end
                        end
                    end
                    return v110;
                end
            end
        end
        local function v102(v111)
            local v112 = 0 ;
            local v113;
            while true do
                local v120 = 0;
                while true do
                    if (v120 == (0)) then
                        if (v112 == 0) then
                            local v147 = 0 ;
                            while true do
                                if ((0) == v147) then
                                    v113 = {};
                                    for v179 in string.gmatch(v111, '%S+') do
                                        table.insert(v113, v101(v179));
                                    end
                                    v147 = 1;
                                end
                                if (v147 == 1) then
                                    v112 = 1;
                                    break;
                                end
                            end
                        end
                        if (v112 == (1)) then
                            return table.concat(v113, " ");
                        end
                        break;
                    end
                end
            end
        end
        return v102(v34);
    elseif (v35 == (3)) then
        local function v121(v123)
            local v124 = 0;
            local v125;
            local v126;
            local v127;
            while true do
                if (v124 == (0)) then
                    v125 = 0 ;
                    v126 = nil;
                    v124 = 1;
                end
                if (v124 == (1)) then
                    v127 = nil;
                    while true do
                        if (v125 == (0)) then
                            local v171 = 0 ;
                            while true do
                                if (0 == v171) then
                                    v126 = {
                                        a = "ạ̲",
                                        b = "ḅ̲",
                                        c = "с̲",
                                        d = "ḍ̲",
                                        e = "ẹ̲",
                                        f = "f̲",
                                        g = "ɡ̲",
                                        h = "ḥ̲",
                                        i = "ị̲",
                                        j = "ј̲",
                                        k = "ḳ̲",
                                        l = "ḷ̲",
                                        m = "ṃ̲",
                                        n = "ṇ̲",
                                        o = "ọ̲",
                                        p = "р̲",
                                        q = "q̲",
                                        r = "ṛ̲",
                                        s = "ṣ̲",
                                        t = "ṭ̲",
                                        u = "ụ̲",
                                        v = "ṿ̲",
                                        w = "ẉ̲",
                                        x = "х̲",
                                        y = "ỵ̲",
                                        z = "ẓ̲",
                                        A = "Ạ̲",
                                        B = "Ḅ̲",
                                        C = "С̲",
                                        D = "Ḍ̲",
                                        E = "Ẹ̲",
                                        F = "F̲",
                                        G = "Ɡ̲",
                                        H = "Ḥ̲",
                                        I = "Ị̲",
                                        J = "Ј̲",
                                        K = "Ḳ̲",
                                        L = "Ḷ̲",
                                        M = "Ṃ̲",
                                        N = "Ṇ̲",
                                        O = "Ọ̲",
                                        P = "Р̲",
                                        Q = "Q̲",
                                        R = "Ṛ̲",
                                        S = "Ṣ̲",
                                        T = "Ṭ̲",
                                        U = "Ụ̲",
                                        V = "Ṿ̲",
                                        W = "Ẉ̲",
                                        X = "Х̲",
                                        Y = "Ỵ̲",
                                        Z = "Ẓ̲"
                                    };
                                    v127 = "";
                                    v171 = 1;
                                end
                                if (v171 == (1)) then
                                    v125 = 1 ;
                                    break;
                                end
                            end
                        end
                        if ((1) == v125) then
                            for v175 = 1 , # v123 do
                                local v176 = 0 ;
                                local v177;
                                while true do
                                    if (v176 == 0) then
                                        v177 = v123:sub(v175, v175);
                                        if v126[v177] then
                                            v127 = v127 .. v126[v177] ;
                                        else
                                            v127 = v127 .. v177 ;
                                        end
                                        break;
                                    end
                                end
                            end
                            return v127;
                        end
                    end
                    break;
                end
            end
        end
        local function v122(v128)
            local v129 = 0 ;
            local v130;
            while true do
                if (v129 == (1)) then
                    return table.concat(v130, " ");
                end
                if (v129 == (0)) then
                    v130 = {};
                    for v148 in string.gmatch(v128, '%S+') do
                        table.insert(v130, v121(v148));
                    end
                    v129 = 1;
                end
            end
        end
        return v122(v34);
    elseif (v35 == (4)) then
        local v134 = 0;
        local v135;
        while true do
            if (v134 == (1)) then
                return v135(v34);
            end
            if (v134 == 0) then
                v135 = nil;
                function v135(v159)
                    local v160 = "";
                    for v172 = 1 , # v159 do
                        v160 = v160 .. string.sub(v159, v172, v172) .. ">" ;
                    end
                    return v160;
                end
                v134 = 1 ;
            end
        end
    elseif (v35 == (5)) then
        local function v145(v149)
            local v150 = {
                a = "a",
                b = "b￵￵",
                c = "c￵￵",
                d = "d",
                e = "￵￵e",
                f = "￵￵󠀕f￵￵",
                g = "g",
                h = "h￵￵",
                i = "￵￵i",
                j = "￵￵j￵￵",
                k = "k",
                l = "l￵￵",
                m = "m",
                n = "n",
                o = "o￵￵",
                p = "p",
                q = "q￵￵",
                r = "￵￵r￵￵",
                s = "￵￵s",
                t = "￵￵t￵￵",
                u = "u",
                v = "v",
                w = "w",
                x = "x",
                y = "y",
                z = "￵￵z￵￵󠀕",
                A = "A￵￵󠀕",
                B = "B",
                C = "C",
                D = "￵￵D",
                E = "￵￵E￵￵󠀕",
                F = "F￵￵",
                G = "￵￵G",
                H = "H",
                I = "￵￵I",
                J = "￵￵J",
                K = "K",
                L = "￵￵L",
                M = "M￵￵",
                N = "N￵￵",
                O = "O",
                P = "P￵￵",
                Q = "Q",
                R = "￵￵R",
                S = "S",
                T = "T",
                U = "￵￵U",
                V = "V",
                W = "W￵￵",
                X = "￵￵X",
                Y = "￵￵Y",
                Z = "Z￵￵󠀕"
            };
            local v151 = "";
            for v161 = 1 , # v149 do
                local v162 = 0 ;
                local v163;
                while true do
                    if (v162 == (0)) then
                        v163 = v149:sub(v161, v161);
                        if v150[v163] then
                            v151 = v151 .. v150[v163] ;
                        else
                            v151 = v151 .. v163 ;
                        end
                        break;
                    end
                end
            end
            return v151;
        end
        local function v146(v152)
            local v153 = 0 ;
            local v154;
            while true do
                if (v153 == (1)) then
                    return table.concat(v154, "");
                end
                if (v153 == (0)) then
                    v154 = {};
                    for v180 in string.gmatch(v152, '%S+') do
                        table.insert(v154, v145(v180));
                    end
                    v153 = 1 ;
                end
            end
        end
        return v146(v34);
    elseif (v35 == 6) then
        local v164 = 0;
        local v165;
        local v166;
        while true do
            if (v164 == (0)) then
                v165 = nil;
                function v165(v188)
                    local v189 = 0 ;
                    local v190;
                    local v191;
                    local v192;
                    while true do
                        if (v189 == 0) then
                            local v196 = 0;
                            while true do
                                if (v196 == 0) then
                                    v190 = 0;
                                    v191 = nil;
                                    v196 = 1;
                                end
                                if ((1) == v196) then
                                    v189 = 1;
                                    break;
                                end
                            end
                        end
                        if ((1) == v189) then
                            v192 = nil;
                            while true do
                                if (v190 == 1) then
                                    for v201 = 1 , # v188 do
                                        local v202 = 0;
                                        local v203;
                                        while true do
                                            if (v202 == (0)) then
                                                v203 = v188:sub(v201, v201):lower();
                                                if v191[v203] then
                                                    v192 = v192 .. v191[v203] ;
                                                else
                                                    v192 = v192 .. v203 ;
                                                end
                                                break;
                                            end
                                        end
                                    end
                                    return v192;
                                end
                                if (v190 == 0) then
                                    v191 = {
                                        a = "/-\\",
                                        b = 'L3',
                                        c = "C",
                                        d = 'CL',
                                        e = "3",
                                        f = "F",
                                        g = "G",
                                        h = '|-|',
                                        i = "L",
                                        j = "J",
                                        k = 'L<',
                                        l = '|_',
                                        m = "/\\/\\",
                                        n = "/\\/",
                                        o = "0",
                                        p = "P",
                                        q = "Q",
                                        r = "R",
                                        s = "$",
                                        t = "T",
                                        u = '|_|',
                                        v = "\\/",
                                        w = "\\/\\/",
                                        x = '><',
                                        y = "Y",
                                        z = "Z"
                                    };
                                    v192 = "";
                                    v190 = 1 ;
                                end
                            end
                            break;
                        end
                    end
                end
                v164 = 1 ;
            end
            if (v164 == (2)) then
                return v166(v34);
            end
            if (v164 == 1) then
                local v181 = 0;
                while true do
                    if (v181 == (1)) then
                        v164 = 2 ;
                        break;
                    end
                    if (v181 == (0)) then
                        v166 = nil;
                        function v166(v197)
                            local v198 = 0 ;
                            local v199;
                            while true do
                                if (v198 == 0) then
                                    v199 = {};
                                    for v204 in string.gmatch(v197, '%S+') do
                                        table.insert(v199, v165(v204));
                                    end
                                    v198 = 1 ;
                                end
                                if (v198 == (1)) then
                                    return table.concat(v199, " ");
                                end
                            end
                        end
                        v181 = 1 ;
                    end
                end
            end
        end
    end
end
v10:AddTextbox({
    ['Name'] = 'Chat',
    ['TextDisappear'] = true,
    ['Callback'] = function(v36)
        if (v36 ~= "") then
            if (v11 == "ěx́ǎḿṕĺě") then
                chat(bypasstext(v36, 1));
            elseif (v11 == "éxạmṕĺe") then
                chat(bypasstext(v36, 2));
            elseif (v11 == "ẹ̲х̲ạ̲ṃ̲р̲ḷ̲ẹ̲") then
                chat(bypasstext(v36, 3));
            elseif (v11 == 'e>x>a>m>p>l>e') then
                chat(bypasstext(v36, 4));
            elseif (v11 == "￵example") then
                chat(bypasstext(v36, 5));
            elseif (v11 == "3></-\\/\\/\\p|_3") then
                chat(bypasstext(v36, 6));
            else
                v8:MakeNotification({
                    ['Name'] = 'Oops.',
                    ['Content'] = "Looks like you didn't select a method!",
                    ['Image'] = 'rbxassetid://4483345998',
                    ['Time'] = 5
                });
            end
        else
            v8:MakeNotification({
                ['Name'] = 'Oops.',
                ['Content'] = "Looks like you didn't enter any text!",
                ['Image'] = 'rbxassetid://4483345998',
                ['Time'] = 5
            });
        end
    end
});
local v12 = false;
local v13 = game:GetService('CoreGui').ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox;
v10:AddToggle({
    ['Name'] = 'Auto Bypass',
    ['Default'] = false,
    ['Callback'] = function(v37)
        v12 = v37;
        if (v37 == true) then
            v8:MakeNotification({
                ['Name'] = 'Auto Bypass',
                ['Content'] = 'Auto bypass has been enabled!',
                ['Image'] = 'rbxassetid://4483345998',
                ['Time'] = 5
            });
        else
            v8:MakeNotification({
                ['Name'] = 'Auto Bypass',
                ['Content'] = 'Auto bypass has been disabled!',
                ['Image'] = 'rbxassetid://4483345998',
                ['Time'] = 5
            });
        end
        v13.FocusLost:Connect(function(v73)
            if (v73 and v12) then
                if (v13.Text ~= "") then
                    if (v11 == "ěx́ǎḿṕĺě") then
                        local v131 = 0 ;
                        local v132;
                        while true do
                            if (v131 == (0)) then
                                v132 = 0 ;
                                while true do
                                    if (v132 == (0)) then
                                        chat(bypasstext(v13.Text, 1));
                                        v13.Text = "";
                                        break;
                                    end
                                end
                                break;
                            end
                        end
                    elseif (v11 == "éxạmṕĺe") then
                        local v141 = 0 ;
                        while true do
                            if (v141 == (0)) then
                                chat(bypasstext(v13.Text, 2));
                                v13.Text = "";
                                break;
                            end
                        end
                    elseif (v11 == "ẹ̲х̲ạ̲ṃ̲р̲ḷ̲ẹ̲") then
                        local v155 = 0;
                        while true do
                            if (v155 == 0) then
                                chat(bypasstext(v13.Text, 3));
                                v13.Text = "";
                                break;
                            end
                        end
                    elseif (v11 == 'e>x>a>m>p>l>e') then
                        local v174 = 0 ;
                        while true do
                            if (v174 == (0)) then
                                chat(bypasstext(v13.Text, 4));
                                v13.Text = "";
                                break;
                            end
                        end
                    elseif (v11 == "￵example") then
                        local v182 = 0 ;
                        local v183;
                        while true do
                            if (v182 == (0)) then
                                v183 = 0 ;
                                while true do
                                    if (v183 == 0) then
                                        chat(bypasstext(v13.Text, 5));
                                        v13.Text = "";
                                        break;
                                    end
                                end
                                break;
                            end
                        end
                    elseif (v11 == "3></-\\/\\/\\p|_3") then
                        local v194 = 0 ;
                        local v195;
                        while true do
                            if (v194 == 0) then
                                v195 = 0 ;
                                while true do
                                    if (v195 == 0) then
                                        chat(bypasstext(v13.Text, 6));
                                        v13.Text = "";
                                        break;
                                    end
                                end
                                break;
                            end
                        end
                    else
                        v8:MakeNotification({
                            ['Name'] = 'Oops.',
                            ['Content'] = "Looks like you didn't select a method!",
                            ['Image'] = 'rbxassetid://4483345998',
                            ['Time'] = 5
                        });
                    end
                end
            end
        end);
    end
});
v10:AddLabel('                                         CHAT LOG');
local v14 = false;
local v15 = "";
function sendToWebhook(v38, v39)
    local v40 = {
        ['content'] = v38,
        ['username'] = v39
    };
    local v41 = {
        ['Url'] = v15,
        ['Method'] = 'POST',
        ['Headers'] = {
            ['Content-Type'] = 'application/json'
        },
        ['Body'] = game:GetService('HttpService'):JSONEncode(v40)
    };
    request(v41);
end
v10:AddTextbox({
    ['Name'] = 'Webhook',
    ['TextDisappear'] = false,
    ['Callback'] = function(v42)
        v15 = v42;
    end
});
v10:AddToggle({
    ['Name'] = 'Log',
    ['Default'] = false,
    ['Callback'] = function(v43)
        if (v15 == "") then
            local v84 = 0 ;
            while true do
                if (v84 == 0) then
                    v8:MakeNotification({
                        ['Name'] = 'Oops.',
                        ['Content'] = "Looks like you didn't enter any webhook url!",
                        ['Image'] = 'rbxassetid://4483345998',
                        ['Time'] = 5
                    });
                    return;
                end
            end
        else
            local v85 = 0;
            local v86;
            while true do
                if ((0) == v85) then
                    v86 = 0 ;
                    while true do
                        if (v86 == 0) then
                            v14 = v43;
                            if (v43 == true) then
                                v8:MakeNotification({
                                    ['Name'] = 'Started logging',
                                    ['Content'] = 'Started logging messages at the given webhook!',
                                    ['Image'] = 'rbxassetid://4483345998',
                                    ['Time'] = 5
                                });
                            else
                                v8:MakeNotification({
                                    ['Name'] = 'Stopped logging',
                                    ['Content'] = 'Stopped logging messages at the given webhook!',
                                    ['Image'] = 'rbxassetid://4483345998',
                                    ['Time'] = 5
                                });
                            end
                            break;
                        end
                    end
                    break;
                end
            end
        end
    end
});
v10:AddLabel('                                        CHAT SPAM');
local v16 = "";
local v17 = 1 ;
local v18 = false;
v10:AddTextbox({
    ['Name'] = 'Message',
    ['TextDisappear'] = false,
    ['Callback'] = function(v44)
        v16 = v44;
    end
});
v10:AddSlider({
    ['Name'] = 'Interval',
    ['Min'] = v17,
    ['Max'] = 100,
    ['Default'] = v17,
    ['Increasmemt'] = 1,
    ['ValueName'] = 'seconds',
    ['Callback'] = function(v45)
        v17 = v45;
    end
});
v10:AddToggle({
    ['Name'] = 'Spam',
    ['Default'] = false,
    ['Callback'] = function(v46)
        if (v16 == "") then
            v8:MakeNotification({
                ['Name'] = 'Oops.',
                ['Content'] = "Looks like you didn't enter any text!",
                ['Image'] = 'rbxassetid://4483345998',
                ['Time'] = 5
            });
        else
            local v87 = 0 ;
            while true do
                if (v87 == (0)) then
                    v18 = v46;
                    if v18 then
                        repeat
                            local v136 = 0 ;
                            local v137;
                            while true do
                                if ((0) == v136) then
                                    v137 = 0;
                                    while true do
                                        if (v137 == (0)) then
                                            wait(v17);
                                            chat(v16);
                                            break;
                                        end
                                    end
                                    break;
                                end
                            end
                        until v18 == false
                    end
                    break;
                end
            end
        end
    end
});
v10:AddLabel('                                            OTHER');
v10:AddButton({
    ['Name'] = 'Tall Message',
    ['Callback'] = function()
        chat("\u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D} \u{000D}");
    end
});
v10:AddButton({
    ['Name'] = 'Fix Filter',
    ['Callback'] = function()
        chat('abcdefg()!');
    end
});
local v19 = v9:MakeTab({
    ['Name'] = 'Chatbot',
    ['Icon'] = 'rbxassetid://4483345998',
    ['PremiumOnly'] = false
});
local v20 = v9:MakeTab({
    ['Name'] = 'Servers',
    ['Icon'] = 'rbxassetid://4483345998',
    ['PremiumOnly'] = false
});
function getServers()
    local v47 = 0 ;
    local v48;
    while true do
        if (v47 == (0)) then
            v48 = v48({
                ['Url'] = 'https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Desc&limit=100',
                ['Method'] = 'GET'
            });
            if (v48.StatusCode == (200)) then
                local v114 = 0 ;
                local v115;
                local v116;
                local v117;
                while true do
                    if (v114 == (1)) then
                        v117 = nil;
                        while true do
                            if (v115 == 1) then
                                local v156 = 0 ;
                                while true do
                                    if (v156 == (0)) then
                                        for v184, v185 in pairs(v116.data) do
                                            local v186 = 0;
                                            local v187;
                                            while true do
                                                if ((0) == v186) then
                                                    v187 = {
                                                        ['serverId'] = v185.id or 'N/A',
                                                        ['players'] = v185.playing or 0,
                                                        ['maxPlayers'] = v185.maxPlayers or 0,
                                                        ['ping'] = v185.ping or 'N/A'
                                                    };
                                                    table.insert(v117, v187);
                                                    break;
                                                end
                                            end
                                        end
                                        return v117;
                                    end
                                end
                            end
                            if (v115 == 0) then
                                local v157 = 0;
                                local v158;
                                while true do
                                    if (v157 == 0) then
                                        v158 = 0 ;
                                        while true do
                                            if (1 == v158) then
                                                v115 = 1 ;
                                                break;
                                            end
                                            if (v158 == (0)) then
                                                v116 = game:GetService('HttpService'):JSONDecode(v48.Body);
                                                v117 = {};
                                                v158 = 1;
                                            end
                                        end
                                        break;
                                    end
                                end
                            end
                        end
                        break;
                    end
                    if (v114 == (0)) then
                        v115 = 0 ;
                        v116 = nil;
                        v114 = 1 ;
                    end
                end
            else
                return nil;
            end
            break;
        end
    end
end
function refreshServers()
    local v49 = 0;
    local v50;
    while true do
        if (v49 == (1)) then
            v20:AddButton({
                ['Name'] = 'Refresh',
                ['Callback'] = function()
                    refreshServers();
                end
            });
            break;
        end
        if (v49 == 0) then
            local v96 = 0 ;
            local v97;
            while true do
                if (v96 == 0) then
                    v97 = 0 ;
                    while true do
                        if (v97 == (1)) then
                            v49 = 1 ;
                            break;
                        end
                        if (v97 == 0) then
                            v50 = getServers();
                            if v50 then
                                for v168, v169 in pairs(v50) do
                                    v20:AddButton({
                                        ['Name'] = 'Players: ' .. v169.players .. "/" .. v169.maxPlayers .. "\nPing: " .. v169.ping,
                                        ['Callback'] = function()
                                            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v169.serverId, game.Players.LocalPlayer);
                                        end
                                    });
                                end
                            end
                            v97 = 1 ;
                        end
                    end
                    break;
                end
            end
        end
    end
end
v20:AddButton({
    ['Name'] = 'Load Servers',
    ['Callback'] = function()
        refreshServers();
    end
});
local v21 = v9:MakeTab({
    ['Name'] = 'Others',
    ['Icon'] = 'rbxassetid://4483345998',
    ['PremiumOnly'] = false
});
v21:AddButton({
    ['Name'] = 'Rejoin',
    ['Callback'] = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer);
    end
});
v21:AddButton({
    ['Name'] = 'Destroy UI',
    ['Callback'] = function()
        v8:Destroy();
    end
});
local v22 = "";
local v23 = false;
local v24 = 5 ;
local v25 = 1;
local v26 = 'llama3-8b-8192';
local v27 = 'Default';
local v28 = {};
function isBlacklisted(v51)
    local v52 = 0 ;
    while true do
        if (0 == v52) then
            for v103, v104 in pairs(v28) do
                if (v51 == v104) then
                    return true;
                end
            end
            return false;
        end
    end
end
function askChatbot(v53, v54)
    local v55 = 0;
    local v56;
    local v57;
    while true do
        if (v55 == (0)) then
            v56 = {
                ['model'] = v26,
                ['temperature'] = v25,
                ['messages'] = {
                    {
                        ['role'] = 'system',
                        ['content'] = 'answer with short response(200 characters max) while following roblox chat filter. your personality: ' .. v27
                    },
                    {
                        ['role'] = 'user',
                        ['content'] = 'My Name Is ' .. v54
                    },
                    {
                        ['role'] = 'user',
                        ['content'] = v53
                    }
                }
            };
            v57 = request({
                ['Url'] = 'https://api.groq.com/openai/v1/chat/completions',
                ['Method'] = 'POST',
                ['Headers'] = {
                    ['Content-Type'] = 'application/json',
                    ['Authorization'] = 'Bearer ' .. v22
                },
                ['Body'] = game:GetService('HttpService'):JSONEncode(v56)
            });
            v55 = 1 ;
        end
        if (v55 == 1) then
            if (# game:GetService('HttpService'):JSONDecode(v57.Body).choices[1 ].message.content >= 200) then
                print('Response has reached the character limit!');
            else
                return game:GetService('HttpService'):JSONDecode(v57.Body).choices[1 ].message.content;
            end
            break;
        end
    end
end
v19:AddTextbox({
    ['Name'] = 'Groq api key',
    ['TextDisappear'] = false,
    ['Callback'] = function(v58)
        v22 = v58;
    end
});
v19:AddSlider({
    ['Name'] = 'Response Distance',
    ['Min'] = 0,
    ['Max'] = 100,
    ['Default'] = 5,
    ['Increasmemt'] = 1,
    ['ValueName'] = 'studs',
    ['Callback'] = function(v59)
        v24 = v59;
    end
});
v19:AddDropdown({
    ['Name'] = 'Model',
    ['Default'] = v26,
    ['Options'] = {
        'gemma2-9b-it',
        'gemma-7b-it',
        'llama3-groq-70b-8192-tool-use-preview',
        'llama3-groq-8b-8192-tool-use-preview',
        'llama-3.1-70b-versatile',
        'llama-3.1-8b-instant',
        'llama-3.2-11b-vision-preview',
        'llama-3.2-90b-vision-preview',
        'llama3-70b-8192',
        'llama3-8b-8192'
    },
    ['Callback'] = function(v60)
        v26 = v60;
    end
});
v19:AddDropdown({
    ['Name'] = 'Personality',
    ['Default'] = v27,
    ['Options'] = {
        'Default',
        'Aggressive',
        'Happy',
        'Criminal',
        'Indian Scammer',
        'Nerd',
        'Sarcastic',
        'Stupid'
    },
    ['Callback'] = function(v61)
        v27 = v61;
    end
});
v19:AddTextbox({
    ['Name'] = 'Custom Personality',
    ['TextDisappear'] = false,
    ['Callback'] = function(v62)
        v27 = v62;
    end
});
v19:AddTextbox({
    ['Name'] = 'Prompt',
    ['TextDisappear'] = true,
    ['Callback'] = function(v63)
        v8:MakeNotification({
            ['Name'] = 'Response From ChatBot',
            ['Content'] = askChatbot(v63, game.Players.LocalPlayer.Name),
            ['Image'] = 'rbxassetid://4483345998',
            ['Time'] = 15
        });
    end
});
v19:AddSlider({
    ['Name'] = 'Temperature',
    ['Min'] = 0,
    ['Max'] = 2,
    ['Default'] = v25,
    ['Increment'] = 1015.01 - (1015),
    ['Callback'] = function(v64)
        v25 = v64;
    end
});
v19:AddTextbox({
    ['Name'] = 'Blacklist',
    ['TextDisappear'] = true,
    ['Callback'] = function(v65)
        if game.Players:FindFirstChild(v65) then
            local v88 = 0;
            while true do
                if (v88 == (0)) then
                    table.insert(v28, v65);
                    v8:MakeNotification({
                        ['Name'] = 'Blacklist',
                        ['Content'] = 'Player has been blacklisted!',
                        ['Image'] = 'rbxassetid://4483345998',
                        ['Time'] = 5
                    });
                    break;
                end
            end
        end
    end
});
v19:AddTextbox({
    ['Name'] = 'Whitelist',
    ['TextDisappear'] = true,
    ['Callback'] = function(v66)
        for v74, v75 in pairs(v28) do
            if (v75 == v66) then
                local v98 = 0;
                while true do
                    if (v98 == 0) then
                        table.remove(v28, v74);
                        v8:MakeNotification({
                            ['Name'] = 'Whitelist',
                            ['Content'] = 'Player has been whitelisted!',
                            ['Image'] = 'rbxassetid://4483345998',
                            ['Time'] = 5
                        });
                        break;
                    end
                end
            end
        end
    end
});
v19:AddToggle({
    ['Name'] = 'Enabled',
    ['Default'] = false,
    ['Callback'] = function(v67)
        local v68 = 0;
        while true do
            if (v68 == 0) then
                v23 = v67;
                if (v67 == true) then
                    v8:MakeNotification({
                        ['Name'] = 'Ai ChatBot',
                        ['Content'] = 'ChatBot has been enabled!',
                        ['Image'] = 'rbxassetid://4483345998',
                        ['Time'] = 5
                    });
                elseif (v67 == false) then
                    v8:MakeNotification({
                        ['Name'] = 'Ai ChatBot',
                        ['Content'] = 'ChatBot has been disabled!',
                        ['Image'] = 'rbxassetid://4483345998',
                        ['Time'] = 5
                    });
                end
                break;
            end
        end
    end
});
v8:Init();
for v69, v70 in pairs(game.Players:GetPlayers()) do
    v70.Chatted:Connect(function(v76)
        local v77 = 0 ;
        local v78;
        while true do
            if (v77 == (1)) then
                if v14 then
                    sendToWebhook('```' .. v76 .. '```', v70.Name);
                end
                break;
            end
            if (v77 == 0) then
                v78 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v70.Character.HumanoidRootPart.Position).Magnitude;
                if (v23 and (v78 <= v24) and (v70.Name ~= game.Players.LocalPlayer.Name) and not isBlacklisted(v70.Name)) then
                    chat(askChatbot(v76, v70.Name));
                end
                v77 = 1 ;
            end
        end
    end);
end
game.Players.PlayerAdded:Connect(function(v71)
    v71.Chatted:Connect(function(v79)
        local v80 = 0 ;
        local v81;
        while true do
            if (v80 == 1) then
                if v14 then
                    sendToWebhook('```' .. v79 .. '```', v71.Name);
                end
                break;
            end
            if (v80 == (0)) then
                v81 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Character.HumanoidRootPart.Position).Magnitude;
                if (v23 and (v81 <= v24) and (v71.Name ~= game.Players.LocalPlayer.Name) and not isBlacklisted(v71.Name)) then
                    chat(askChatbot(v79, v71.Name));
                end
                v80 = 1 ;
            end
        end
    end);
end);
