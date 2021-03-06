--[[Quest by Gebel
Dla Serwera
Zakaz publikowania/sprzedawania/etc.
bez mojej zgody !

GG: 46526993
]]
quest PetSystem begin
	state start begin
		function get_pet_skill_id(pet, skill)
			local id_skila = {
				[34011] ={3, 5, 6, 4, 16, 15, 63},
				[34012] ={3, 5, 6, 4, 16, 15, 23, 63},
				[34008] ={3, 79, 9, 5, 6, 4, 60, 17},
				[34007] ={3, 81, 9, 5, 6, 4, 62, 17},
				[34005] ={3, 80, 9, 5, 6, 4, 61, 17},
				[34006] ={3, 78, 9, 5, 6, 4, 59, 17},
			}
			return id_skila[pet][skill]
		end
		function get_max_skill_number(pet, skill)
			local max_wartosc_skila = {
				[34011] ={25, 15, 15, 15, 15, 15, 10},
				[34012] ={25, 10, 10, 10, 10, 10, 15, 15},
				[34008] ={25, 15, 15, 10, 10, 10, 10, 10},
				[34007] ={25, 15, 15, 10, 10, 10, 10, 10},
				[34005] ={25, 15, 15, 10, 10, 10, 10, 10},
				[34006] ={25, 15, 15, 10, 10, 10, 10, 10},
			}
			return max_wartosc_skila[pet][skill]
		end
		function buduj_liste()
			local umiejetnosci = {}
			--Knuud
			if pc.getqf("przywolany_pet") == 34011 then
				umiejetnosci = {"Witalnosc ", "Sila", "Zrecznosc ", "Inteligencja"}
				if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 30 and pc.getqf(pc.getqf("przywolany_pet").."poziom") <= 74 then
					table.insert(umiejetnosci, "Szansa na Przesz. Uderzenie")
					table.insert(umiejetnosci, "Szansa na Kryt. Uderzenie")
				elseif pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 75 then
					table.insert(umiejetnosci, "Szansa na Przesz. Uderzenie")
					table.insert(umiejetnosci, "Szansa na Kryt. Uderzenie")
					table.insert(umiejetnosci, "Silny Przeciwko Potworom")
				end
			--Bao Bao
			elseif pc.getqf("przywolany_pet") == 34012 then
				umiejetnosci = {"Witalnosc ", "Sila", "Zrecznosc ", "Inteligencja"}
				if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 30 and pc.getqf(pc.getqf("przywolany_pet").."poziom") <= 74 then
					table.insert(umiejetnosci, "Szansa na Przesz. Uderzenie")
					table.insert(umiejetnosci, "Szansa na Kryt. Uderzenie")
				elseif pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 75 then
					table.insert(umiejetnosci, "Szansa na Przesz. Uderzenie")
					table.insert(umiejetnosci, "Szansa na Kryt. Uderzenie")
					table.insert(umiejetnosci, "Absorbcja PZ ")
					table.insert(umiejetnosci, "Silny Przeciwko Potworom")
				end
			--Leonidas
			elseif pc.getqf("przywolany_pet") == 34008 then
				umiejetnosci = {"Witalnosc ", "Odpornosc na Ninje", "Szybkosc Zaklecia", "Sila", "Zrecznosc ", "Inteligencja"}
				if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 75 then
					table.insert(umiejetnosci, "Silny przeciwko Ninjom")
					table.insert(umiejetnosci, "Silny przeciwko Ludziom")
				end
			--Ethan
			elseif pc.getqf("przywolany_pet") == 34007 then
				umiejetnosci = {"Witalnosc ", "Odpornosc na Szaman�w", "Szybkosc Zaklecia", "Sila", "Zrecznosc ", "Inteligencja"}
				if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 75 then
					table.insert(umiejetnosci, "Silny przeciwko Szamanom")
					table.insert(umiejetnosci, "Silny przeciwko Ludziom")
				end
			--Boczus
			elseif pc.getqf("przywolany_pet") == 34005 then
				umiejetnosci = {"Witalnosc ", "Odpornosc na Sure", "Szybkosc Zaklecia", "Sila", "Zrecznosc ", "Inteligencja"}
				if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 75 then
					table.insert(umiejetnosci, "Silny przeciwko Surom")
					table.insert(umiejetnosci, "Silny przeciwko Ludziom")
				end
			--Rufus
			elseif pc.getqf("przywolany_pet") == 34006 then
				umiejetnosci = {"Witalnosc ", "Odpornosc na Wojownika", "Szybkosc Zaklecia", "Sila", "Zrecznosc ", "Inteligencja"}
				if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= 75 then
					table.insert(umiejetnosci, "Silny przeciwko Wojownikom")
					table.insert(umiejetnosci, "Silny przeciwko Ludziom")
				end
			end
			table.insert(umiejetnosci, "Wyjscie")
			return umiejetnosci
		end
		function get_free_points()
			return pc.getqf(pc.getqf("przywolany_pet").."wolne_punkty")
		end
		function get_level()
			return pc.getqf(pc.getqf("przywolany_pet").."poziom")
		end
		function get_max_level()
			return 105
		end
		function get_exp()
			return pc.getqf(pc.getqf("przywolany_pet").."exp")
		end
		function need_exp()
			local tabela_expa =
			{
				50, 100, 150, 200, 250, 300, 350, 400, 450, 500,								--1 do 10
				550, 600, 650, 700, 750, 800, 850, 900, 950, 1000,								--11 do 20
				1050, 1100, 1150, 1200, 1250, 1300, 1350, 1400, 1450, 1500,						--21 do 30
				1550, 1600, 1650, 1700, 1750, 1800, 1850, 1900, 1950, 2000,						--31 do 40
				2050, 2100, 2150, 2200, 2250, 2300, 2350, 2400, 2450, 2500,						--41 do 50
				2550, 2600, 2650, 2700, 2750, 2800, 2850, 2900, 2950, 3000,						--51 do 60
				3050, 3100, 3150, 3200, 3250, 3300, 3350, 3400, 3450, 3500,						--61 do 70
				3550, 3600, 3650, 3700, 3750, 3800, 3850, 3900, 3950, 4000,						--71 do 80
				4050, 4100, 4150, 4200, 4250, 4300, 4350, 4400, 4450, 4500,						--81 do 90
				4550, 4600, 4650, 4700, 4750, 4800, 4850, 4900, 4950, 5000,						--91 do 100
				5050, 5100, 5150, 5200, 5250													--101 do 105
			}
			return tabela_expa[pc.getqf(pc.getqf("przywolany_pet").."poziom")]
		end
		function is_summon()
			if pet.is_summon(34011) or pet.is_summon(34012) or pet.is_summon(34008) or pet.is_summon(34007) or pet.is_summon(34006) or pet.is_summon(34005) then
				return true
			else
				return false
			end
		end
		function get_pet_info(itemVnum)
			pet_info_map = {
				[53008] = {34011, "Knuud", 0},
				[53009] = {34012, "Bao Bao", 0},
				[53010] = {34008, "Leonidas", 0},
				[53011] = {34007, "Ethan", 0},
				[53012] = {34005, "Boczus ", 0},
				[53013] = {34006, "Rufus", 0},
			}
			itemVnum = tonumber(itemVnum)
			return pet_info_map[itemVnum]
		end
		when 34011.click or 34012.click or 34008.click or 34007.click or 34005.click or 34006.click with PetSystem.is_summon() begin
			if npc.get_vid() != pc.getqf("vid_przywolanego") then
				chat("Ten zwierzak nie nalezy do Ciebie!")
				return
			end
			--chat("Jestes wlascicielem tego zwierzecia.")
			say_trawa(mob_name(pc.getqf("przywolany_pet")))
			say()
			say()
			say_bursztyn("Poziom: "..PetSystem.get_level().."/"..PetSystem.get_max_level())
			if PetSystem.get_level() == PetSystem.get_max_level() then
				say_bursztyn("Doswiadczenie: Osiagnieto maksymalny poziom")
				say_bursztyn("Do nastepnego poziomu: Osiagnieto maksymalny poziom")
			else
				say_bursztyn("Doswiadczenie: "..PetSystem.get_exp().."/"..PetSystem.need_exp())
				say_bursztyn("Do nastepnego poziomu: "..PetSystem.need_exp()-PetSystem.get_exp())
			end
			if pc.getqf("pet_doswiadczenie_lecisz") == 0 then
				say_bursztyn("Zdobywanie Doswiadczenia: Aktywne")
			else
				say_bursztyn("Zdobywanie Doswiadczenia: Wylaczone")
			end
			say_bursztyn("Dostepne Punkty: "..PetSystem.get_free_points())
			say()
			local menu = select("Status Zwierzaka", "Rozdaj Punkty", "Doswiadczenie", "Wyjscie")
			if menu == 1 then
				say_trawa("Status:")
				say()
				say_reward("Aktualny poziom umiejetnosci:")
				say()
				local wczytaj = PetSystem.buduj_liste()
				if pc.getqf("przywolany_pet") == 34011 or pc.getqf("przywolany_pet") == 34012 then
					say_title(wczytaj[1].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_1").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 1))
					say_title(wczytaj[2].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_2").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 2))
					say_title(wczytaj[3].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_3").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 3))
					say_title(wczytaj[4].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_4").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 4))
					if pc.getqf(pc.getqf("przywolany_pet").."poziom") <= 29 then
						say_reward("Kolejne umiejetnosci dostepne")
						say_reward("po wbiciu 30 poziomu.")
					else
						say_title(wczytaj[5].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_5").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 5))
						say_title(wczytaj[6].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_6").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 6))
						if pc.getqf(pc.getqf("przywolany_pet").."poziom") <= 74 then
							say_reward("Kolejne umiejetnosci dostepne")
							say_reward("po wbiciu 75 poziomu.")
						else
							say_title(wczytaj[7].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_7").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 7))
							if pc.getqf("przywolany_pet") == 34012 then
								say_title(wczytaj[8].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_8").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 8))
							end
						end
					end
				else
					say_title(wczytaj[1].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_1").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 1))
					say_title(wczytaj[2].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_2").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 2))
					say_title(wczytaj[3].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_3").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 3))
					say_title(wczytaj[4].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_4").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 4))
					say_title(wczytaj[5].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_5").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 5))
					say_title(wczytaj[6].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_6").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 6))
					if pc.getqf(pc.getqf("przywolany_pet").."poziom") <= 74 then
						say_reward("Kolejne umiejetnosci dostepne")
						say_reward("po wbiciu 75 poziomu.")
					else
						say_title(wczytaj[7].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_7").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 7))
						say_title(wczytaj[8].." "..pc.getqf(pc.getqf("przywolany_pet").."skill_numer_8").."/"..PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), 8))
					end
				end
			elseif menu == 2 then
				say_trawa("Rozdaj punkty")
				say()
				if PetSystem.get_free_points() == 0 then
					say("Nie masz wolnych punkt�w.")
					return
				end
				local wczytaj = PetSystem.buduj_liste()
				local punkty_menu = select_table(wczytaj)
				if punkty_menu != table.getn(wczytaj) then
					if pc.getqf(pc.getqf("przywolany_pet").."skill_numer_"..punkty_menu) >= PetSystem.get_max_skill_number(pc.getqf("przywolany_pet"), punkty_menu) then
						chat("Ta umiejetnosc rozwineles juz na poziom maksymalny.")
						return
					end
					say_title(wczytaj[punkty_menu])
					say()
					say("Napewno chcesz dodac punkt?")
					if select("Tak", "Nie") == 1 then
						pc.setqf(pc.getqf("przywolany_pet").."skill_numer_"..punkty_menu, pc.getqf(pc.getqf("przywolany_pet").."skill_numer_"..punkty_menu)+1)
						chat("Pomyslnie dodano punkt.")
						pc.setqf(pc.getqf("przywolany_pet").."wolne_punkty", pc.getqf(pc.getqf("przywolany_pet").."wolne_punkty")-1)
					end
				end
			elseif menu == 3 then
				say_trawa("Doswiadczenie")
				say()
				if pc.getqf("pet_doswiadczenie_lecisz") == 0 then
					say_bursztyn("Zdobywanie doswiadczenia zwierzaka jest wlaczone")
					say()
					say_reward("Chcesz wylaczyc?")
					if select("Tak", "Nie") == 1 then
						pc.setqf("pet_doswiadczenie_lecisz", 1)
						chat("Wylaczono mozliwosc zdobywania doswiadczenia przez zwierzaka")
					end
				else
					say_bursztyn("Zdobywanie doswiadczenia zwierzaka jest wylaczone")
					say()
					say_reward("Chcesz wlaczyc?")
					if select("Tak", "Nie") == 1 then
						pc.setqf("pet_doswiadczenie_lecisz", 0)
						chat("Wlaczono mozliwosc zdobywania doswiadczenia przez zwierzaka")
					end
				end
			end
		end
		when 53009.use or 53008.use or 53010.use or 53011.use or 53012.use or 53013.use begin
			local pet_info = PetSystem.get_pet_info(item.vnum)
			local mobVnum = pet_info[1]
			local petName = pet_info[2]
			if pc.getqf(mobVnum.."poziom") == 0 then
				pc.setqf(mobVnum.."poziom", 1)
			end
			if null != pet_info then
				if true == pet.is_summon(mobVnum) then
					pet.unsummon(mobVnum)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 1), pc.getqf("niezmienna1"), 987987999)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 2), pc.getqf("niezmienna2"), 987987999)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 3), pc.getqf("niezmienna3"), 987987999)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 4), pc.getqf("niezmienna4"), 987987999)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 5), pc.getqf("niezmienna5"), 987987999)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 6), pc.getqf("niezmienna6"), 987987999)
					affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 7), pc.getqf("niezmienna7"), 987987999)
					if mobVnum != 34011 then
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 8), pc.getqf("niezmienna8"), 987987999)
					end
				else
					if pet.count_summoned() < 1 then
						local peciczek = pet.summon(mobVnum, " Pet Lv. "..pc.getqf(mobVnum.."poziom"), false)
						pc.setqf("vid_przywolanego", peciczek)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 1), pc.getqf("niezmienna1"), 987987999)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 2), pc.getqf("niezmienna2"), 987987999)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 3), pc.getqf("niezmienna3"), 987987999)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 4), pc.getqf("niezmienna4"), 987987999)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 5), pc.getqf("niezmienna5"), 987987999)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 6), pc.getqf("niezmienna6"), 987987999)
						affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 7), pc.getqf("niezmienna7"), 987987999)
						pc.setqf("niezmienna1", pc.getqf(mobVnum.."skill_numer_1"))
						pc.setqf("niezmienna2", pc.getqf(mobVnum.."skill_numer_2"))
						pc.setqf("niezmienna3", pc.getqf(mobVnum.."skill_numer_3"))
						pc.setqf("niezmienna4", pc.getqf(mobVnum.."skill_numer_4"))
						pc.setqf("niezmienna5", pc.getqf(mobVnum.."skill_numer_5"))
						pc.setqf("niezmienna6", pc.getqf(mobVnum.."skill_numer_6"))
						pc.setqf("niezmienna7", pc.getqf(mobVnum.."skill_numer_7"))
						pc.setqf("niezmienna8", pc.getqf(mobVnum.."skill_numer_8"))
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 1), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_1"), 987987999)
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 2), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_2"), 987987999)
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 3), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_3"), 987987999)
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 4), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_4"), 987987999)
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 5), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_5"), 987987999)
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 6), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_6"), 987987999)
						affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 7), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_7"), 987987999)
						if mobVnum != 34011 then
							affect.add_collect(PetSystem.get_pet_skill_id(mobVnum, 8), pc.getqf("niezmienna8"), 987987999)
							affect.remove_collect(PetSystem.get_pet_skill_id(mobVnum, 8), pc.getqf(pc.getqf("przywolany_pet").."skill_numer_8"), 987987999)
						end
					else
						syschat("Masz juz przywolanego zwierzaka. Najpierw go odwolaj.")
					end
				end
			end
			--chat("Poziom zwierzaka: "..pc.getqf(mobVnum.."poziom"))
			--chat("Doswiadczenie zwierzaka: "..pc.getqf(mobVnum.."exp"))
			pc.setqf("przywolany_pet", mobVnum)
			--chat(PetSystem.need_exp())
		end
		when logout begin
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 1), pc.getqf("niezmienna1"), 987987999)
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 2), pc.getqf("niezmienna2"), 987987999)
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 3), pc.getqf("niezmienna3"), 987987999)
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 4), pc.getqf("niezmienna4"), 987987999)
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 5), pc.getqf("niezmienna5"), 987987999)
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 6), pc.getqf("niezmienna6"), 987987999)
			affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 7), pc.getqf("niezmienna7"), 987987999)
			if pc.getqf("przywolany_pet") != 34011 then
				affect.remove_collect(PetSystem.get_pet_skill_id(pc.getqf("przywolany_pet"), 8), pc.getqf("niezmienna8"), 987987999)
			end
		end
		when kill with not npc.is_pc() and PetSystem.is_summon() begin
			if pc.getqf("pet_doswiadczenie_lecisz") == 1 then
				return
			end
			if pc.getqf(pc.getqf("przywolany_pet").."poziom") >= PetSystem.get_max_level() then
				chat("Tw�j zwierzak posiada maksymalny poziom!")
				return
			end
			pc.setqf(pc.getqf("przywolany_pet").."exp", pc.getqf(pc.getqf("przywolany_pet").."exp")+1)
			--chat("Doswiadczenie zwierzaka: "..pc.getqf(pc.getqf("przywolany_pet").."exp"))
			--chat(PetSystem.need_exp())
			if pc.getqf(pc.getqf("przywolany_pet").."exp") >= PetSystem.need_exp() then
				pc.setqf(pc.getqf("przywolany_pet").."poziom", pc.getqf(pc.getqf("przywolany_pet").."poziom")+1)
				pc.setqf(pc.getqf("przywolany_pet").."wolne_punkty", pc.getqf(pc.getqf("przywolany_pet").."wolne_punkty")+1)
				pc.setqf(pc.getqf("przywolany_pet").."exp", 0)
				chat("Tw�j towarzysz zdobyl "..pc.getqf(pc.getqf("przywolany_pet").."poziom").." poziom!")
				pet.unsummon(pc.getqf("przywolany_pet"))
				local peciczek = pet.summon(pc.getqf("przywolany_pet"), " Pet Lv. "..pc.getqf(pc.getqf("przywolany_pet").."poziom"), false)
				pc.setqf("vid_przywolanego", peciczek)
			end
		end
	end
end  