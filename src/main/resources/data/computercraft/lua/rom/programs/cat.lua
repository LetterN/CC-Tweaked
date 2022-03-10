local tArgs = { ... }
if #tArgs < 1 then
    local programName = arg[0] or fs.getName(shell.getRunningProgram())
    print("Usage: " .. programName .. " <path>")
    return
end

for _, v in ipairs(tArgs) do
    local sNewDir = shell.resolve(v)
    if fs.exists(sNewDir) and not fs.isDir(sNewDir) then
      local file = fs.open(sNewDir, "r")
      local lines = {}

      while true do
        local line = file.readLine()
        if not line then break end

        lines[#lines + 1] = line
      end
      file.close()

      textutils.pagedTabulate(colors.white, lines)
    else
        printError(v .. ": File doesnt exist")
    end
end
