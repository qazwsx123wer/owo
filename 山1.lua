hookfunction(getnamecallmethod, function()
    return
end)

-- 检查关键函数是否被Hook
for i, v in pairs({request, loadstring, base64.decode}) do
    if isfunctionhooked(v) or not isfunctionhooked(getnamecallmethod) then
        return
    end
end

pcall(function()
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer


    local function Base64Decode(data)
        local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        data = data:gsub('[^'..b..'=]', '')
        return (data:gsub('.', function(x)
            if x == '=' then return '' end
            local r, f = '', (b:find(x) - 1)
            for i = 6, 1, -1 do
                r = r .. (f % 2^i - f % 2^(i-1) > 0 and '1' or '0'
            end
            return r
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if #x ~= 8 then return '' end
            local c = 0
            for i = 1, 8 do
                c = c + (x:sub(i, i) == '1' and 2^(8 - i) or 0)
            end
            return string.char(c)
        end))
    end

    -- 获取白名单json文件
    local function GetGitHubFile(url)
        local response = request({
            Url = url,
            Method = "GET",
            Headers = {
                ["Authorization"] = "Bearer github令牌",
                ["Accept"] = "application/vnd.github.v3+json"
            }
        })
        
        if not response.Success then
            warn("⚠️ 无法获取json | 状态码:", response.StatusCode)
            return nil
        end
        
        local success, data = pcall(HttpService.JSONDecode, HttpService, response.Body)
        if not success then
            warn("❌ JSON解析失败:", data)
            return nil
        end
        
        return data.content
    end

    -- 获取白名单数据
    local function GetWhitelist()
        local encodedData = GetGitHubFile("https://api.github.com/repos/github用户名/仓库名字/contents/whitelist.json?ref=main")
        if not encodedData then return nil end
        
        -- 使用修复的Base64解码
        local decodedData = Base64Decode(encodedData)
        if not decodedData then
            warn("解码失败")
            return nil
        end
        
        local success, whitelist = pcall(HttpService.JSONDecode, HttpService, decodedData)
        if not success then
            warn("白名单解析失败")
            return nil
        end
        
        return whitelist
    end

    -- 主执行逻辑
    local whitelist = GetWhitelist()
    if whitelist then
        local userIdStr = tostring(LocalPlayer.UserId)
        if whitelist[userIdStr] then
            print("✅ 白名单验证通过 | 用户ID:", userIdStr)
            print("666")
            -- 此处添加验证通过后的代码
        else
            warn("用户不在白名单中 | ID:", userIdStr)
        end
    end
end)
