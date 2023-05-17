local Moves = script.Parent.Parent.Parent:WaitForChild("Moves")
local Move = Moves:WaitForChild("Move")
local Kill = Moves:WaitForChild("Kill")
local Black = script.Parent.Parent.Parent:WaitForChild("Black")
local White = script.Parent.Parent.Parent:WaitForChild("White")
local Turn = script.Parent.Parent.Parent:WaitForChild("Turn")
local Color = script.Parent.Parent.Parent:WaitForChild("Color")

local Chars = {"a", "b", "c", "d", "e", "f", "g", "h"}

local function charstonum(char)
	for i, v in ipairs(Chars) do
		if v == char then
			return i
		end
	end
end

local function Check(x)
	if x.Position.X.Scale > 0.876 or x.Position.X.Scale < 0 or x.Position.Y.Scale > 0.876 or x.Position.Y.Scale < 0 then
		return false
	else
		return true
	end
end

local function CreateMove(Info)
	for i, v in pairs(Moves:GetChildren()) do
		if v ~= Move and v ~= Kill and v.Name ~= "Kill" and v.Name ~= "Move" and not v:IsA("LocalScript") then
			v:Destroy()
		end
	end
	
	local Name = Info:split('/')[1]
	local Character = Info:split('/')[2]
	local Num = tonumber(Info:split('/')[3])

	if Name == "Pawn" then
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			if script.Parent.Parent == White then
				if Num == 2 then
					for i, v in pairs(Black:GetChildren()) do
						if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 1 then
							if tonumber(v.Name:split('/')[3]) - Num == 1 then
								local NewKill = Kill:Clone()
								NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
								NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. Num + 1 .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
								NewKill.Parent = Moves
								NewKill.Visible = true
							end
						end
					end
					for i = 1, 2 do
						local x = true
						for a, v in pairs(Black:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == i then
								x = false
							end
						end
						for a, v in pairs(White:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == i then
								print("no")
								x = false
							end
						end
						if x == true then
							local NewMove = Move:Clone()
							NewMove.Position = UDim2.new((charstonum(Character) - 1)/8,0,1 - (Num + i)/8,0)
							NewMove.Name = Info .. "=" .. Character .. "/" .. Num + i .. "=" .. (charstonum(Character) - 1)/8 .. "/" .. 1 - ((Num + i)/8)
							NewMove.Parent = Moves
							NewMove.Visible = true
						else
							break
						end
					end
				elseif Num ~= 8 then
					for i, v in pairs(Black:GetChildren()) do
						if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 1 then
							if tonumber(v.Name:split('/')[3]) - Num == 1 then
								local NewKill = Kill:Clone()
								NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
								NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. Num + 1 .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
								NewKill.Parent = Moves
								NewKill.Visible = true
							end
						end
					end
					for i = 1, 1 do
						local x = true
						for a, v in pairs(Black:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == i then
								x = false
							end
						end
						for a, v in pairs(White:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == i then
								x = false
							end
						end
						if x == true then
							local NewMove = Move:Clone()
							NewMove.Position = UDim2.new((charstonum(Character) - 1)/8,0,1 - (Num + i)/8,0)
							NewMove.Name = Info .. "=" .. Character .. "/" .. Num + i .. "=" .. (charstonum(Character) - 1)/8 .. "/" .. 1 - ((Num + i)/8)
							NewMove.Parent = Moves
							NewMove.Visible = true
						else
							break
						end
					end
				end
			else
				if Num == 7 then
					for i, v in pairs(White:GetChildren()) do
						if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 1 then
							if tonumber(v.Name:split('/')[3]) - Num == -1 then
								local NewKill = Kill:Clone()
								NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
								NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. Num - 1 .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
								NewKill.Parent = Moves
								NewKill.Visible = true
							end
						end
					end
					for i = 1, 2 do
						local x = true
						for a, v in pairs(White:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == -i then
								x = false
							end
						end
						for a, v in pairs(Black:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == -i then
								x = false
							end
						end
						if x == true then
							local NewMove = Move:Clone()
							NewMove.Position = UDim2.new((charstonum(Character) - 1)/8,0,1 - (Num - i)/8,0)
							NewMove.Name = Info .. "=" .. Character .. "/" .. Num - i .. "=" .. (charstonum(Character) - 1)/8 .. "/" .. 1 - ((Num - i)/8)
							NewMove.Parent = Moves
							NewMove.Visible = true
						else
							break
						end
					end
				elseif Num ~= 1 then
					for i, v in pairs(White:GetChildren()) do
						if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 1 then
							if tonumber(v.Name:split('/')[3]) - Num == -1 then
								local NewKill = Kill:Clone()
								NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
								NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. Num - 1 .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
								NewKill.Parent = Moves
								NewKill.Visible = true
							end
						end
					end
					for i = 1, 1 do
						local x = true
						for a, v in pairs(White:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == -i then
								x = false
							end
						end
						for a, v in pairs(Black:GetChildren()) do
							if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) == 0 and tonumber(v.Name:split('/')[3]) - Num == -i then
								x = false
							end
						end
						if x == true then
							local NewMove = Move:Clone()
							NewMove.Position = UDim2.new((charstonum(Character) - 1)/8,0,1 - (Num - i)/8,0)
							NewMove.Name = Info .. "=" .. Character .. "/" .. Num - i .. "=" .. (charstonum(Character) - 1)/8 .. "/" .. 1 - ((Num - i)/8)
							NewMove.Parent = Moves
							NewMove.Visible = true
						else
							break
						end
					end
				end
			end
		end
	elseif  Name == "Bishop" then
		local AntiTurn = "Black"
		if Turn.Value == "Black" then
			AntiTurn = "White"
		end
		local CantMove = ""
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			for i, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
				CantMove = CantMove .. "=" .. charstonum(v.Name:split('/')[2]) .. "/" .. tonumber(v.Name:split('/')[3])
			end
			local ru = 10
			local lu = 10
			local rd = 10
			local ld = 10
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(v.Name:split('/')[2]) - charstonum(Character) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
						ru = i
						break
					end
				end
			end
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(Character) - charstonum(v.Name:split('/')[2]) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
						lu = i
						break
					end
				end
			end
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(v.Name:split('/')[2]) - charstonum(Character) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
						rd = i
						break
					end
				end
			end
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(Character) - charstonum(v.Name:split('/')[2]) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
						ld = i
						break
					end
				end
			end
			
			local bool = true
			for i = 1, (ru - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(v.Name:split('/')[2]) - charstonum(Character) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							ru = i
							break
						end
					end
				else
					break
				end
			end
			bool = true
			for i = 1, (lu - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(Character) - charstonum(v.Name:split('/')[2]) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							lu = i
							break
						end
					end
				else
					break
				end
			end
			bool = true
			for i = 1, (rd - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(v.Name:split('/')[2]) - charstonum(Character) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							rd = i
							break
						end
					end
				else
					break
				end
			end
			bool = true
			for i = 1, (ld - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(Character) - charstonum(v.Name:split('/')[2]) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							ld = i
							break
						end
					end
				else
					break
				end
			end
			
			for i = 1, (ru - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) + i - 1)/8,0,1 - (Num + i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) + i .. "/" .. Num + i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + i] .. "/" .. (Num + i) .. "=" .. (charstonum(Character) + i - 1)/8 .. "/" .. 1 - (Num + i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
			for i = 1, (lu - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) - i - 1)/8,0,1 - (Num + i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) - i .. "/" .. Num + i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) - i] .. "/" .. (Num + i) .. "=" .. (charstonum(Character) - i - 1)/8 .. "/" .. 1 - (Num + i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
			for i = 1, (rd - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) + i - 1)/8,0,1 - (Num - i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) + i .. "/" .. Num - i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + i] .. "/" .. (Num - i) .. "=" .. (charstonum(Character) + i - 1)/8 .. "/" .. 1 - (Num - i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
			for i = 1, (ld - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) - i - 1)/8,0,1 - (Num - i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) - i .. "/" .. Num - i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) - i] .. "/" .. (Num - i) .. "=" .. (charstonum(Character) - i - 1)/8 .. "/" .. 1 - (Num - i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
		end
	elseif  Name == "Knight" then
		local AntiTurn = "Black"
		if Turn.Value == "Black" then
			AntiTurn = "White"
		end
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			local CantMove = ""
			for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
				if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) <= 2 and charstonum(v.Name:split('/')[2]) - charstonum(Character) ~= 0 and  math.abs(tonumber(v.Name:split('/')[3]) - Num) <= 2 and math.abs(tonumber(v.Name:split('/')[3]) - Num) ~= 0 and math.abs(math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) - math.abs(tonumber(v.Name:split('/')[3]) - Num)) == 1 then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
					CantMove = CantMove .. "=" .. charstonum(v.Name:split('/')[2]) .. "/" .. tonumber(v.Name:split('/')[3])
				end
			end
			
			for i, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
				if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) <= 2 and charstonum(v.Name:split('/')[2]) - charstonum(Character) ~= 0 and  math.abs(tonumber(v.Name:split('/')[3]) - Num) <= 2 and math.abs(tonumber(v.Name:split('/')[3]) - Num) ~= 0 and math.abs(math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) - math.abs(tonumber(v.Name:split('/')[3]) - Num)) == 1 then
					CantMove = CantMove .. "=" .. charstonum(v.Name:split('/')[2]) .. "/" .. tonumber(v.Name:split('/')[3])
				end
			end
			
			for i = 1, 8 do
				for a = 1,8 do
					if math.abs(i - charstonum(Character)) <= 2 and i - charstonum(Character) ~= 0 and  math.abs(a - Num) <= 2 and math.abs(a - Num) ~= 0  and math.abs(math.abs(i - charstonum(Character)) - math.abs(a - Num)) == 1 and CantMove:split(i .. "/" .. a)[2] == nil then
						local NewMove = Move:Clone()
						NewMove.Position = UDim2.new((i - 1)/8,0,1 - (a)/8,0)
						if Check(NewMove) == true then
							NewMove.Name = Info .. "=" .. Chars[i] .. "/" .. a .. "=" .. (i - 1)/8 .. "/" .. 1 - a/8
							NewMove.Parent = Moves
							NewMove.Visible = true
						else
							NewMove:Destroy()
						end
					end
				end
			end
		end
	elseif  Name == "Rook" then
		local AntiTurn = "Black"
		if Turn.Value == "Black" then
			AntiTurn = "White"
		end
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			local U = 9
			local D = 0
			local R = 9
			local L = 0
			for i, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
				if Character == v.Name:split('/')[2] and Num < tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) < U then
					U = tonumber(v.Name:split('/')[3])
				elseif Character == v.Name:split('/')[2] and Num > tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) > D then
					D = tonumber(v.Name:split('/')[3])
				elseif charstonum(Character) < charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) < R then
					R = charstonum(v.Name:split('/')[2])
				elseif charstonum(Character) > charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) > L then
					L = charstonum(v.Name:split('/')[2])
				end
			end

			for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
				if Character == v.Name:split('/')[2] and Num < tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) < U then
					U = tonumber(v.Name:split('/')[3])
				elseif Character == v.Name:split('/')[2] and Num > tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) > D then
					D = tonumber(v.Name:split('/')[3])
				elseif charstonum(Character) < charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) < R then
					R = charstonum(v.Name:split('/')[2])
				elseif charstonum(Character) > charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) > L then
					L = charstonum(v.Name:split('/')[2])
				end
			end
			
			for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
				if Character == v.Name:split('/')[2] and Num < tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) == U then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				elseif Character == v.Name:split('/')[2] and Num > tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) == D then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				elseif charstonum(Character) < charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) == R then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				elseif charstonum(Character) > charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) == L then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				end
			end
			
			for i = D + 1, U - 1 do
				if i ~= Num then
					local NewMove = Move:Clone()
					NewMove.Position = UDim2.new((charstonum(Character) - 1)/8,0,1 - i/8,0)
					if Check(NewMove) == true then
						NewMove.Name = Info .. "=" .. Character .. "/" .. i .. "=" .. (charstonum(Character) - 1)/8 .. "/" .. 1 - i/8
						NewMove.Parent = Moves
						NewMove.Visible = true
					else
						NewMove:Destroy()
					end
				end
			end

			for i = L + 1, R - 1 do
				if i ~= charstonum(Character) then
					local NewMove = Move:Clone()
					NewMove.Position = UDim2.new((i - 1)/8,0,1 - Num/8,0)
					if Check(NewMove) == true then
						NewMove.Name = Info .. "=" .. Chars[i] .. "/" .. Num .. "=" .. (i - 1)/8 .. "/" .. 1 - Num/8
						NewMove.Parent = Moves
						NewMove.Visible = true
					else
						NewMove:Destroy()
					end
				end
			end

		end
	elseif  Name == "Queen" then
		local AntiTurn = "Black"
		if Turn.Value == "Black" then
			AntiTurn = "White"
		end
		local CantMove = ""
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			for i, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
				CantMove = CantMove .. "=" .. charstonum(v.Name:split('/')[2]) .. "/" .. tonumber(v.Name:split('/')[3])
			end
			local ru = 10
			local lu = 10
			local rd = 10
			local ld = 10
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(v.Name:split('/')[2]) - charstonum(Character) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
						ru = i
						break
					end
				end
			end
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(Character) - charstonum(v.Name:split('/')[2]) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
						lu = i
						break
					end
				end
			end
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(v.Name:split('/')[2]) - charstonum(Character) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
						rd = i
						break
					end
				end
			end
			for i = 1, 7 do
				for a, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
					if charstonum(Character) - charstonum(v.Name:split('/')[2]) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
						ld = i
						break
					end
				end
			end

			local bool = true
			for i = 1, (ru - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(v.Name:split('/')[2]) - charstonum(Character) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							ru = i
							break
						end
					end
				else
					break
				end
			end
			bool = true
			for i = 1, (lu - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(Character) - charstonum(v.Name:split('/')[2]) == tonumber(v.Name:split('/')[3]) - Num and tonumber(v.Name:split('/')[3]) - Num == i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							lu = i
							break
						end
					end
				else
					break
				end
			end
			bool = true
			for i = 1, (rd - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(v.Name:split('/')[2]) - charstonum(Character) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							rd = i
							break
						end
					end
				else
					break
				end
			end
			bool = true
			for i = 1, (ld - 1) do
				if bool == true then
					for a, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if charstonum(Character) - charstonum(v.Name:split('/')[2]) == -tonumber(v.Name:split('/')[3]) + Num and tonumber(v.Name:split('/')[3]) - Num == -i then
							local NewKill = Kill:Clone()
							NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
							NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
							NewKill.Parent = Moves
							NewKill.Visible = true
							bool = false
							ld = i
							break
						end
					end
				else
					break
				end
			end

			for i = 1, (ru - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) + i - 1)/8,0,1 - (Num + i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) + i .. "/" .. Num + i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + i] .. "/" .. (Num + i) .. "=" .. (charstonum(Character) + i - 1)/8 .. "/" .. 1 - (Num + i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
			for i = 1, (lu - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) - i - 1)/8,0,1 - (Num + i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) - i .. "/" .. Num + i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) - i] .. "/" .. (Num + i) .. "=" .. (charstonum(Character) - i - 1)/8 .. "/" .. 1 - (Num + i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
			for i = 1, (rd - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) + i - 1)/8,0,1 - (Num - i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) + i .. "/" .. Num - i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + i] .. "/" .. (Num - i) .. "=" .. (charstonum(Character) + i - 1)/8 .. "/" .. 1 - (Num - i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
			for i = 1, (ld - 1) do
				local NewMove = Move:Clone()
				NewMove.Position = UDim2.new((charstonum(Character) - i - 1)/8,0,1 - (Num - i)/8,0)
				if Check(NewMove) == true and CantMove:split(charstonum(Character) - i .. "/" .. Num - i)[2] == nil then
					NewMove.Name = Info .. "=" .. Chars[charstonum(Character) - i] .. "/" .. (Num - i) .. "=" .. (charstonum(Character) - i - 1)/8 .. "/" .. 1 - (Num - i)/8
					NewMove.Parent = Moves
					NewMove.Visible = true
				else
					NewMove:Destroy()
				end
			end
		end
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			local U = 9
			local D = 0
			local R = 9
			local L = 0
			for i, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
				if Character == v.Name:split('/')[2] and Num < tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) < U then
					U = tonumber(v.Name:split('/')[3])
				elseif Character == v.Name:split('/')[2] and Num > tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) > D then
					D = tonumber(v.Name:split('/')[3])
				elseif charstonum(Character) < charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) < R then
					R = charstonum(v.Name:split('/')[2])
				elseif charstonum(Character) > charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) > L then
					L = charstonum(v.Name:split('/')[2])
				end
			end

			for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
				if Character == v.Name:split('/')[2] and Num < tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) < U then
					U = tonumber(v.Name:split('/')[3])
				elseif Character == v.Name:split('/')[2] and Num > tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) > D then
					D = tonumber(v.Name:split('/')[3])
				elseif charstonum(Character) < charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) < R then
					R = charstonum(v.Name:split('/')[2])
				elseif charstonum(Character) > charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) > L then
					L = charstonum(v.Name:split('/')[2])
				end
			end

			for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
				if Character == v.Name:split('/')[2] and Num < tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) == U then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				elseif Character == v.Name:split('/')[2] and Num > tonumber(v.Name:split('/')[3]) and tonumber(v.Name:split('/')[3]) == D then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				elseif charstonum(Character) < charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) == R then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				elseif charstonum(Character) > charstonum(v.Name:split('/')[2]) and Num == tonumber(v.Name:split('/')[3]) and charstonum(v.Name:split('/')[2]) == L then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
				end
			end

			for i = D + 1, U - 1 do
				if i ~= Num then
					local NewMove = Move:Clone()
					NewMove.Position = UDim2.new((charstonum(Character) - 1)/8,0,1 - i/8,0)
					if Check(NewMove) == true then
						NewMove.Name = Info .. "=" .. Character .. "/" .. i .. "=" .. (charstonum(Character) - 1)/8 .. "/" .. 1 - i/8
						NewMove.Parent = Moves
						NewMove.Visible = true
					else
						NewMove:Destroy()
					end
				end
			end

			for i = L + 1, R - 1 do
				if i ~= charstonum(Character) then
					local NewMove = Move:Clone()
					NewMove.Position = UDim2.new((i - 1)/8,0,1 - Num/8,0)
					if Check(NewMove) == true then
						NewMove.Name = Info .. "=" .. Chars[i] .. "/" .. Num .. "=" .. (i - 1)/8 .. "/" .. 1 - Num/8
						NewMove.Parent = Moves
						NewMove.Visible = true
					else
						NewMove:Destroy()
					end
				end
			end

		end
	elseif  Name == "King" then
		local AntiTurn = "Black"
		if Turn.Value == "Black" then
			AntiTurn = "White"
		end
		if Turn.Value == Color.Value and script.Parent.Parent.Name == Color.Value then
			local CantMove = ""
			for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
				if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) <= 1 and math.abs(tonumber(v.Name:split('/')[3]) - Num) <= 1 then
					local NewKill = Kill:Clone()
					NewKill.Position = UDim2.new((charstonum(v.Name:split('/')[2]) - 1)/8,0,1 - (tonumber(v.Name:split('/')[3]))/8,0)
					NewKill.Name = Info .. "=" .. v.Name:split('/')[2] .. "/" .. tonumber(v.Name:split('/')[3]) .. "=" .. (charstonum(v.Name:split('/')[2]) - 1)/8 .. "/" .. 1 - (tonumber(v.Name:split('/')[3]))/8 .. "=" .. v.Name
					NewKill.Parent = Moves
					NewKill.Visible = true
					CantMove = CantMove .. "=" .. charstonum(v.Name:split('/')[2]) .. "/" .. tonumber(v.Name:split('/')[3])
				end
			end
			for i, v in pairs(script.Parent.Parent.Parent[Turn.Value]:GetChildren()) do
				if math.abs(charstonum(v.Name:split('/')[2]) - charstonum(Character)) <= 1 and math.abs(tonumber(v.Name:split('/')[3]) - Num) <= 1 then
					CantMove = CantMove .. "=" .. charstonum(v.Name:split('/')[2]) .. "/" .. tonumber(v.Name:split('/')[3])
				end
			end
			for i = -1, 1 do
				for a = -1, 1 do
					local NewMove = Move:Clone()
					NewMove.Position = UDim2.new((charstonum(Character) + i - 1)/8,0,1 - (Num + a)/8,0)
					if Check(NewMove) == true then
						if CantMove:split(charstonum(Character) + i .. "/" .. Num + a)[2] == nil then
							NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + i] .. "/" .. (Num + a) .. "=" .. (charstonum(Character) + i - 1)/8 .. "/" .. 1 - (Num + a)/8
							NewMove.Parent = Moves
							NewMove.Visible = true
						end
					else
						NewMove:Destroy()
					end
				end
			end
			if Color.Value == "White" and script.Parent.Name == "King/e/1" then
				if script.Parent.Parent:FindFirstChild("Rook/h/1") then
					local bool = true
					for i, v in pairs(script.Parent.Parent:GetChildren()) do
						if v.Name:split('/')[3] == "1" and (v.Name:split('/')[2] == "f" or v.Name:split('/')[2] == "g") then
							bool = false
						end
					end
					for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if v.Name:split('/')[3] == "1" and (v.Name:split('/')[2] == "f" or v.Name:split('/')[2] == "g") then
							bool = false
						end
					end
					if bool == true then
						local NewMove = Move:Clone()
						NewMove.Position = UDim2.new((charstonum(Character) + 2 - 1)/8,0,1 - Num/8,0)
						if Check(NewMove) == true then
							if CantMove:split(charstonum(Character) + 2 .. "/" .. Num )[2] == nil then
								NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + 2] .. "/" .. Num .. "=" .. (charstonum(Character) + 2 - 1)/8 .. "/" .. 1 - Num/8
								NewMove.Parent = Moves
								NewMove.Visible = true
							end
						else
							NewMove:Destroy()
						end
					end
				end
				
				if script.Parent.Parent:FindFirstChild("Rook/a/1") then
					local bool = true
					for i, v in pairs(script.Parent.Parent:GetChildren()) do
						if v.Name:split('/')[3] == "1" and (v.Name:split('/')[2] == "b" or v.Name:split('/')[2] == "c" or v.Name:split('/')[2] == "d") then
							bool = false
						end
					end
					for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if v.Name:split('/')[3] == "1" and (v.Name:split('/')[2] == "b" or v.Name:split('/')[2] == "c" or v.Name:split('/')[2] == "d") then
							bool = false
						end
					end
					if bool == true then
						local NewMove = Move:Clone()
						NewMove.Position = UDim2.new((charstonum(Character) - 3 - 1)/8,0,1 - Num/8,0)
						if Check(NewMove) == true then
							if CantMove:split(charstonum(Character) - 2 .. "/" .. Num )[2] == nil then
								NewMove.Name = Info .. "=" .. Chars[charstonum(Character) - 2] .. "/" .. Num .. "=" .. (charstonum(Character) - 2 - 1)/8 .. "/" .. 1 - Num/8
								NewMove.Parent = Moves
								NewMove.Visible = true
							end
						else
							NewMove:Destroy()
						end
					end
				end
			elseif Color.Value == "Black" and script.Parent.Name == "King/e/8" then
				if script.Parent.Parent:FindFirstChild("Rook/h/8") then
					local bool = true
					for i, v in pairs(script.Parent.Parent:GetChildren()) do
						if v.Name:split('/')[3] == "8" and (v.Name:split('/')[2] == "f" or v.Name:split('/')[2] == "g") then
							bool = false
						end
					end
					for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if v.Name:split('/')[3] == "8" and (v.Name:split('/')[2] == "f" or v.Name:split('/')[2] == "g") then
							bool = false
						end
					end
					if bool == true then
						local NewMove = Move:Clone()
						NewMove.Position = UDim2.new((charstonum(Character) + 2 - 1)/8,0,1 - Num/8,0)
						if Check(NewMove) == true then
							if CantMove:split(charstonum(Character) + 2 .. "/" .. Num )[2] == nil then
								NewMove.Name = Info .. "=" .. Chars[charstonum(Character) + 2] .. "/" .. Num .. "=" .. (charstonum(Character) + 2 - 1)/8 .. "/" .. 1 - Num/8
								NewMove.Parent = Moves
								NewMove.Visible = true
							end
						else
							NewMove:Destroy()
						end
					end
				end

				if script.Parent.Parent:FindFirstChild("Rook/a/8") then
					local bool = true
					for i, v in pairs(script.Parent.Parent:GetChildren()) do
						if v.Name:split('/')[3] == "8" and (v.Name:split('/')[2] == "b" or v.Name:split('/')[2] == "c" or v.Name:split('/')[2] == "d") then
							bool = false
						end
					end
					for i, v in pairs(script.Parent.Parent.Parent[AntiTurn]:GetChildren()) do
						if v.Name:split('/')[3] == "8" and (v.Name:split('/')[2] == "b" or v.Name:split('/')[2] == "c" or v.Name:split('/')[2] == "d") then
							bool = false
						end
					end
					if bool == true then
						local NewMove = Move:Clone()
						NewMove.Position = UDim2.new((charstonum(Character) - 3 - 1)/8,0,1 - Num/8,0)
						if Check(NewMove) == true then
							if CantMove:split(charstonum(Character) - 2 .. "/" .. Num )[2] == nil then
								NewMove.Name = Info .. "=" .. Chars[charstonum(Character) - 2] .. "/" .. Num .. "=" .. (charstonum(Character) - 2 - 1)/8 .. "/" .. 1 - Num/8
								NewMove.Parent = Moves
								NewMove.Visible = true
							end
						else
							NewMove:Destroy()
						end
					end
				end
			end
		end
	end
end

script.Parent.MouseButton1Click:Connect(function()
	CreateMove(script.Parent.Name)
end)
