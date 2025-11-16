
![blood book11](https://github.com/user-attachments/assets/4acc0acc-6c98-46b1-baed-bab79aeee314)


```diff
                                  -Aragan gearswap V2
                                     +last update

                        -★ 💀 A R A G A N  G E A R S W A P 💀 ★

                                  -🩸 Holy BLOOD MODE 🩸 
```

                            ★ 💀 A R A G A N  G E A R S W A P 💀 ★


                                       -- Aragan  --- [Author]                                 

                       --    {{{{{{{this gearswap have all codes}}}}}}}}}     --
	---------------------------------------                        --------------------------------------  
	--        A T T E N T I O N          --                        --      P L E A S E  -  R E A D      --
	---------------------------------------                        ---------------------------------------  

                             {{{{{{{this gearswap have all codes}}}}}}}}}

Listen carefully, it is unnatural, it is supernatural, it is advanced and superior to everyone, 
and they are primitive without it, it is difficult to reach it, it is smooth like water, it is 
solid like a mountain, it is light like the wind, it is burning like fire.. it was made for a long period of 
time, it came out of the power of darkness, only the light.. you cannot be defeated, and it is in your hands,
the power is with you.

                             {{{{{{{this gearswap have all codes}}}}}}}}}

u need my lib file its not work with orginal selindrile lib file i make everythink can display and add hippo feet for auto move
 
Listen carefully, it is unnatural, it is supernatural ,its powerfull , it is advanced and superior to everyone, and they are primitive without it, it is difficult to reach it, it is smooth like water, it is solid like a mountain, it is light like the wind, it is burning like fire.. it was made for a long period of time, it came out of the power of darkness, only the light.. you cannot be defeated, and it is in your hands, the power is with you.

--                                 {{{{{{{this gearswap have all codes}}}}}}}}}                       --

u only change my name in lua and file and add u name to work 
Aragan_sch_gear  change this name in all and use u name and file and global

if u want use normal aragan lua in common file :
change name file Aragan or u file name to any name or add number or Letters 
common file will work .. 
example common file name change of u want Aragan file work: 
common0 
Aragan
or if u want common file work :
common 
Aragan0

if u want Aragan file or u name file change name file common or u file name to any name or add number or Letters 
Aragan file will work .. 

that to can switch between 2 any type gearswap file lua easy 

-----------

add :
code panacea auto used for ody nms + code monshade ear if get 3k tp change + code auto kitting when move + code auto remedy when silenced . auto holy water if doom curse and more + add Reinforcement Points Mode for Su5 weapons and neck JSE CP jb cape + PDL Physical Damage Limit f4 command change it + WeaponskillMode SC for ws capped skillchain bonus + OffenseMode:options('Normal', 'Acc', 'STP','TP', 'DA', 'CRIT + HybridMode:options('Normal', 'DT', 'DT25', 'SubtleBlow f9-ctrl+f9 command change it + IdleMode:options('Normal', 'PDT', 'MDT', 'HP', 'Regen','Regain', 'Evasion', 'EnemyCritRate', 'Refresh', 'Sphere') f12 command change it + add gear set Absorb-TP in all job for aminon mega boss +  auto wakeup if u sleep  with Vim Torque +1  auto equip for Jobs:     Warrior / Paladin / Dark Knight / Samurai / Dragoon + auto equip magic burst gear if skillchain window open for mages job and whm pld drk + and more code + display under screen all mods + auto call HUD pld sch dnc + auto call organizer inventory equip u job when change job + add WeaponSet all jobs all weapon need f6 command change it + add code Hippo. Socks +1 for pull mobs f1 command change it

----------
add code gearswap automatically detect open MB window and apply set.

add code gearswap  AutoMedicinemode automatically use panacea or remedy if get debuff.

add bind to work addon autoitem for auto use medicine for Odyssey nms 

add bind for reset addon zonetimer for sortie bosses F/H to calc 3min run away before tpmove or use ja run or bind or kitting

modification seli-display to can add any state 

Note: optional : u can install macro all jobs from my web and addons plugin bot
to can play smooth and easy and i play with main gameped controller logitech and 
keyboard binds and chat 

in macro job blm sch rdm nin drk geo whm pld for fast used i add :

/con gs c elemental nuke -- for clear magic burst mobs in A/C and spam mb on bosses 

/con gs c elemental smallnuke -- for proc in sortie boss HAND B/D and F/H

----------
add staff on all job weapons to can do shell crusher Lowers target's defense .
add regain idle all job and dnc add in defensemode to can keep it all time up for aminon.

------
FOR DRK I ADD  element in display screen f4 change it , and add absorts and cycle f3 and in macro
and add absorbs cycle and elementalmode

--

sch i add macro for fast make skillchain :

command add macro :

SC1

/console gs c elemental skillchain1

SC2

/console gs c elemental skillchain2

SC3

/console gs c elemental skillchain3 

----

command add macro : for auto magic burst after skillchains ,SC11 CLOSE skillchain with T1 ONLY NO HELIX

SC11

/console gs c elemental skillchain11

SC22

/console gs c elemental skillchain22

SC33

/console gs c elemental skillchain33

command add macro : CLOSE skillchain with helix and auto magic burst after skillchains

SC11H

/console gs c elemental skillchain11H

SCH add command for solo skillchains from addon schskillchain ssc and script solosc.lua

NOTE: for sortie NM Triboulex use this command for 2step fusion open close close2 ;

-------------
smn add autofavrmode
pld add auto foil if /run sub and tankmode active
run add AutoEffusionMode auto rayke/Gambit tankmode active

-----

--[[ for gearswap work singer addon cycle songs playlist faster and easy 

add in function 

function job_setup()

	send_command('lua l Singer')--;sing off;sing active off


	state.Singer = M{['description']='Singer','seg','Cuijatender','haste4','seg','seg4','shinryu','shinryu4','mboze','mboze2', 'xevioso', 'kalunga', 'ngai','arebati', 'ongo', 'bumba',
		'haste','haste4', 'magic', 'ph','sortie4', 'ody4', 'ody','sortie',} --'aria',

end

function job_self_command(commandArgs, eventArgs)

	if commandArgs[1]:lower() == 'singer' then
		send_command('@input //sing playlist "'..state.Singer.value..'"') 
	end

end


for binds add 

function user_job_setup()

    send_command('bind tab gs c cycle singer;gs c singer')
    send_command('bind ^tab gs c cycleback singer;gs c singer')

end

for brd AutoBuffBard addon add state.Songset have songsset its copy from AutoBuffBard addon file abb_sets 
u can add name songsset there and copy name in state.Songset

cycle Songset --  autobrdbuff addon
cycle Singer  --  singer addon 

/con gs c Singer -- active singer addon 

send_command('bind f2 gs c cycle Songset') --  autobrdbuff addon
send_command('bind !f2 gs c Songset') --  autobrdbuff addon


send_command('bind f2 gs c cycle singer') --  singer addon 
send_command('bind !f2 gs c singer --  singer addon 
')
macro

/con gs c Songset -- active autobrdbuff
/con gs c Singer -- active singer addon 

its do all ja first then do u  songset

------------

for cor add state.Roller1 state.Roller2 have all rolls send to roller addon 
and state.Rollset change 2 roll in 1 click 

cycle Roll

  send_command('bind f2 gs c cycle Roller1;input //gs c Roller1')
    send_command('bind f3 gs c cycle Roller2;input //gs c Roller2')
    send_command('bind ^f2 gs c cycleback Roller1;input //gs c Roller1')
    send_command('bind ^f3 gs c cycleback Roller2;input //gs c Roller2')
    
--  send_command('bind f1 gs c cycle Rollset;awit;input //gs c Rollset')

macro

/con gs c Roller1
/con gs c Roller2
/con gs c Rollset
/con roll

-----
add in my macro for silindrile gearswap all macro job pld brd drk dnc geo rdm cor bst  
name ws start with A like Asavage or Aruda and other ws
aminon ws macro 

/attack on 

/wait 1 

/ws "Savage Blade" <bt>

/wait 2 

/attack off

--now u not need this command in macro 

just do ws when u idle and char auto  do ws and back idle.

u need install my macro rar for silindrile gearswap to have rdy all
https://github.com/aragan/macro-all-jobs/blob/main/1Macro_selindrile%20gearswap%20_all_job_ffxi_-created%20by%20Author%20Aragan.rar

-------------

if u have all jobs for easy have free slot inventory 

add itmizer addon bind 

send_command('bind ^] input //put storage slip* case all')

send_command('bind ^[ input //get storage slip* all')

//get storage slip* all
//put storage slip* case all

-------------
Note: i play with Wireless Gamepad controller logitec and keyboard and if u want play like me easy fast smooth 
u need install my last macro all jobs and if u play my selindrile gs u need install macro selindrile all jobs and if u play normal gs u install normal macro all jobs  i add line for job and add code u follow number line macro in lua job 
(seli. gs macro have more code macro work with seli. gs every job have code for it and those code not work with normal gs)

and learning all and u need see all list binds to know all binds do command //listbinds and u need see Aragan global to know all binds 
and know all aliases to now all see inti in scripts file or do command //listaliases.
and install all addons all plugin all bot tako project and easyfarm and curepleas 
and install my init in script and use it for active my addon need it only .
finaly any ask u can meet me in discord i add my discord under icon github account 
my discord https://discord.gg/pcYCEHGT
or Aragan gearswap support server https://discord.gg/RUBknQ52JZ 

Aragan Epic music ffxi Album
https://soundcloud.com/araganffxi

