local P=game:GetService("Players")
local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local W=workspace
local LP=P.LocalPlayer
local Cam=W.CurrentCamera
local C,V2,U,F=Color3.fromRGB,Vector2.new,UDim2.new,UDim2.fromOffset
local WH=Color3.new(1,1,1)
local V3,UD,ip,mf,mc,mxx,UT=Vector3.new,UDim.new,ipairs,math.floor,math.clamp,math.max,Enum.UserInputType
local function W2(v) return Cam:WorldToViewportPoint(v) end
local GB,CD=Enum.Font.GothamBold,Enum.Font.Code
local AL=Enum.TextXAlignment.Left
local AY=Enum.AutomaticSize.Y
local TXT=C(220,228,250)
local S={Aimbot=false,UseMouse=false,ShowFOV=false,AimTeam=false,AimWall=false,AimDowned=false,AimTransp=false,FOV=100,Str=.5,Held=false,Target="Head",Key="Always",ESP=false,EspTeam=false,EspDowned=false,EspTransp=false,LimitDist=false,MaxDist=1000,Boxes=false,Names=false,Distance=false,HealthBar=false,HeadDot=false,Tracers=false,Skeleton=false,ChinaHat=false,ChinaHatRGB=false,BoxColor=WH,NameColor=C(30,180,0),DistColor=C(200,200,255),SkelColor=C(140,40,255),DotColor=C(255,0,0),TracerColor=C(170,190,0),HatColor=WH,HighHP=C(0,255,0),MidHP=C(255,255,0),LowHP=C(255,0,0),WSon=false,WS=50,JPon=false,JP=100,Spin=false,Noclip=false,WM=false,WMRGB=false,UIRGB=false,WMCol=WH}
local PAL={WH,C(30,180,0),C(200,200,255),C(140,40,255),C(255,0,0),C(170,190,0),C(0,150,255),C(255,140,0)}
local hue,sel,spec,wsw,jpw,lock=WH
local K={BT="BackgroundTransparency",BC="BackgroundColor3",TC="TextColor3",AP="AnchorPoint",Pos="Position"}
local function mk(c,p,par)
local o=Instance.new(c)
for k,v in pairs(p) do o[K[k] or k]=v end
o.Parent=par
return o
end
local function rnd(o,r) mk("UICorner",{CornerRadius=UD(0,r or 6)},o) end
local function strk(o,c,t) return mk("UIStroke",{Color=c,Thickness=t or 1},o) end
local function press(i) return i.UserInputType==UT.MouseButton1 or i.UserInputType==UT.Touch end
local function drag(h,f)
local on=false
h.InputBegan:Connect(function(i) if press(i) then on=true f(i,true) end end)
UIS.InputChanged:Connect(function(i)
if on and (i.UserInputType==UT.MouseMovement or i.UserInputType==UT.Touch) then f(i,false) end
end)
UIS.InputEnded:Connect(function(i) if press(i) then on=false end end)
end
local function mvb(h,t)
local ds,sp,mv
drag(h,function(i,b)
if b then ds=i.Position sp=t.Position mv=false
else
local d=i.Position-ds
if d.Magnitude>6 then mv=true end
if mv then t.Position=U(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y) end
end
end)
return function() return mv end
end
local function line(f,a,b,col,th)
local d=b-a
f.Position=F((a.X+b.X)/2,(a.Y+b.Y)/2)
f.Size=F(d.Magnitude,th or 1)
f.Rotation=math.deg(math.atan2(d.Y,d.X))
f.BackgroundColor3=col
f.Visible=true
end
local function tri(par,cx,cy,s)
local p={V2(cx,cy-s),V2(cx-s*.8,cy+s*.9),V2(cx,cy+s*.4),V2(cx+s*.8,cy+s*.9)}
for i=1,4 do line(mk("Frame",{BorderSizePixel=0,AP=V2(.5,.5)},par),p[i],p[i%4+1],C(235,30,40),3) end
end
local G=mk("ScreenGui",{Name="CyberMenu",ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},LP:WaitForChild("PlayerGui"))
local EL=mk("Frame",{Size=U(1,0,1,0),BT=1},G)
local M=mk("Frame",{Size=F(560,330),Pos=U(.5,0,.5,0),AP=V2(.5,.5),BC=C(9,14,30),Active=true},G)
rnd(M,14)
local MS=strk(M,C(50,62,100),1.5)
mvb(mk("Frame",{Size=U(1,0,0,64),BT=1},M),M)
tri(M,40,34,18)
local X=mk("TextButton",{Size=F(24,24),Pos=U(1,-30,0,4),BT=1,Text="x",Font=CD,TextSize=16,TC=TXT},M)
local OB=mk("TextButton",{Size=F(48,48),Pos=U(0,12,.5,-24),BC=C(9,14,30),Text=""},G)
rnd(OB,24) strk(OB,C(235,30,40),1.5) tri(OB,24,24,11)
local moved=mvb(OB,OB)
X.MouseButton1Click:Connect(function() M.Visible=false end)
OB.MouseButton1Click:Connect(function() if not moved() then M.Visible=not M.Visible end end)
UIS.InputBegan:Connect(function(i,gp) if not gp and i.KeyCode==Enum.KeyCode.RightShift then M.Visible=not M.Visible end end)
local WM=mk("TextLabel",{Size=F(0,22),Pos=F(10,10),AutomaticSize=Enum.AutomaticSize.X,BC=C(9,14,30),BT=.3,Font=GB,TextSize=13,Visible=false},G)
rnd(WM,6)
local TB=mk("Frame",{Size=U(1,-110,0,32),Pos=F(90,16),BT=1},M)
mk("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UD(0,6)},TB)
local Pg,Tb={},{}
local function show(n)
for k,p in pairs(Pg) do p.Visible=(k==n) end
for k,b in pairs(Tb) do
local a=(k==n)
b.BackgroundTransparency=a and 0 or 1
b.UIStroke.Enabled=a
end
end
local function txt(par,t,col,pos,size)
return mk("TextLabel",{Size=size or U(1,0,0,22),Pos=pos or U(0,0,0,0),BT=1,Text=t,TextXAlignment=AL,Font=CD,TextSize=12,TC=col or TXT},par)
end
local function page(n)
local p=mk("ScrollingFrame",{Size=U(1,-28,1,-86),Pos=F(14,72),BC=C(12,18,38),BorderSizePixel=0,ScrollBarThickness=4,Visible=false},M)
rnd(p,14) strk(p,C(50,62,100),1)
mk("UIPadding",{PaddingLeft=UD(0,12),PaddingRight=UD(0,12),PaddingTop=UD(0,8)},p)
local ll={}
local function col(x,o)
local f=mk("Frame",{Size=U(.5,-8,0,0),Pos=U(x,o,0,0),AutomaticSize=AY,BT=1},p)
ll[#ll+1]=mk("UIListLayout",{Padding=UD(0,5)},f)
return f
end
local L,R=col(0,0),col(.5,8)
for _,l in ip(ll) do
l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
p.CanvasSize=F(0,mxx(ll[1].AbsoluteContentSize.Y,ll[2].AbsoluteContentSize.Y)+20)
end)
end
local b=mk("TextButton",{Size=F(80,32),BC=C(40,60,110),Text=n,Font=CD,TextSize=13,TC=TXT},TB)
rnd(b,10) strk(b,C(190,205,255),1.5)
b.MouseButton1Click:Connect(function() show(n) end)
Pg[n]=p Tb[n]=b
return L,R
end
local function hh(par,t)
local f=mk("Frame",{Size=U(1,0,0,24),BT=1},par)
txt(f,t,C(190,200,235))
mk("Frame",{Size=U(1,0,0,1),Pos=F(0,22),BC=C(50,62,100),BorderSizePixel=0},f)
end
local function ck(par,t,k,big)
local b=mk("TextButton",{Size=U(1,0,0,big and 34 or 24),BT=1,Text=""},par)
if big then b.BackgroundTransparency=0 b.BackgroundColor3=C(18,34,74) rnd(b,10) strk(b,C(60,150,255),1.5) end
local c=mk("TextLabel",{Size=F(20,20),Pos=F(big and 8 or 0,big and 7 or 2),Font=GB,TextSize=14,TC=WH},b)
rnd(c,10)
txt(b,t,TXT,F(big and 36 or 26,0),U(1,-36,1,0))
local function u() c.Text=S[k] and "✓" or "" c.BackgroundColor3=S[k] and C(52,64,110) or C(26,32,52) end
u()
b.MouseButton1Click:Connect(function() S[k]=not S[k] u() end)
end
local function grid(par)
local g=mk("Frame",{Size=U(1,0,0,0),AutomaticSize=AY,BT=1},par)
mk("UIGridLayout",{CellSize=U(.5,-4,0,24),CellPadding=F(4,2)},g)
return g
end
local function sl(par,t,k,step,mn,mx)
local r=mk("Frame",{Size=U(1,0,0,t and 48 or 26),BT=1},par)
if t then txt(r,t) end
local tr=mk("TextButton",{Size=U(1,0,0,22),Pos=F(0,t and 24 or 0),BC=C(22,28,48),Text="",AutoButtonColor=false},r)
rnd(tr,11)
local v=txt(tr,"",TXT,nil,U(1,0,1,0)) v.TextXAlignment=Enum.TextXAlignment.Center
local kn=mk("Frame",{Size=F(20,20),AP=V2(.5,.5),BC=C(110,140,230)},tr)
rnd(kn,10)
local function set(x)
x=mc(mf(x/step+.5)*step,mn,mx)
x=mf(x*1000+.5)/1000
S[k]=x
kn.Position=U((x-mn)/(mx-mn),0,.5,0)
v.Text=tostring(x)
end
set(S[k])
drag(tr,function(i) set(mn+mc((i.Position.X-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)*(mx-mn)) end)
end
local function drop(par,t,k,opts)
txt(par,t)
local b=mk("TextButton",{Size=U(1,0,0,26),BC=C(22,28,48),Text="  "..S[k],TextXAlignment=AL,Font=CD,TextSize=12,TC=TXT},par)
rnd(b,8)
local n=1
b.MouseButton1Click:Connect(function() n=n%#opts+1 S[k]=opts[n] b.Text="  "..S[k] end)
end
local function sw(par,t,k)
local b=mk("TextButton",{Size=U(1,0,0,26),BT=1,Text=""},par)
local s=mk("Frame",{Size=F(24,24),Pos=F(0,1),BC=S[k]},b)
rnd(s,5)
txt(b,t,TXT,F(34,2),U(1,-34,1,0))
local n=0
b.MouseButton1Click:Connect(function() n=n%#PAL+1 S[k]=PAL[n] s.BackgroundColor3=S[k] end)
end
local function btn(par,t,fn)
local b=mk("TextButton",{Size=U(1,0,0,28),BC=C(40,60,110),Text=t,Font=CD,TextSize=12,TC=TXT},par)
rnd(b,8)
b.MouseButton1Click:Connect(fn)
end
local function lst(par,list) for _,v in ip(list) do ck(par,v[1],v[2]) end end
local L,R=page("Aimbot")
ck(L,"Enable Aimbot","Aimbot",true)
hh(L,"General")
lst(L,{{"Use Mouse (No Center)","UseMouse"},{"Show FOV","ShowFOV"},{"Check Team","AimTeam"},{"Check Wall","AimWall"},{"Check Downed","AimDowned"},{"Check Transparency","AimTransp"}})
hh(L,"Targeting")
drop(L,"Aim Target","Target",{"Head","Torso"})
drop(L,"Aimbot Keybind","Key",{"Always","MouseButton2","Q","E","LeftShift"})
hh(R,"Precision")
sl(R,"FOV Radius","FOV",5,30,600)
sl(R,"Strength","Str",.05,.05,1)
L,R=page("Visuals")
ck(L,"Enable ESP","ESP",true)
hh(L,"ESP")
lst(L,{{"Check Team","EspTeam"},{"Check Downed","EspDowned"},{"Check Transparency","EspTransp"},{"Limit Distance","LimitDist"}})
sl(L,"Max Distance","MaxDist",50,100,5000)
hh(L,"Elements")
lst(grid(L),{{"Boxes","Boxes"},{"Names","Names"},{"Distance","Distance"},{"Health Bar","HealthBar"},{"Head Dot","HeadDot"},{"Tracers","Tracers"},{"Skeleton","Skeleton"},{"ChinaHat","ChinaHat"},{"ChinaHat RGB","ChinaHatRGB"}})
ck(L,"Held Item","Held")
hh(R,"ESP Colors")
for _,v in ip({{"Box Color","BoxColor"},{"Name Color","NameColor"},{"Distance Color","DistColor"},{"Skeleton Color","SkelColor"},{"Head Dot Color","DotColor"},{"Tracer Color","TracerColor"},{"ChinaHat Color","HatColor"}}) do sw(R,v[1],v[2]) end
hh(R,"Health Colors")
for _,v in ip({{"High Health","HighHP"},{"Mid Health","MidHP"},{"Low Health","LowHP"}}) do sw(R,v[1],v[2]) end
L,R=page("Mis")
hh(L,"Movement")
ck(L,"WalkSpeed","WSon") sl(L,nil,"WS",1,16,300)
ck(L,"JumpPower","JPon") sl(L,nil,"JP",1,50,300)
hh(L,"Other")
lst(L,{{"Spinbot","Spin"},{"Noclip","Noclip"}})
hh(R,"Watermark")
lst(R,{{"Enable Watermark","WM"},{"RGB Watermark","WMRGB"},{"RGB Interface","UIRGB"}})
sw(R,"Watermark Color","WMCol")
L,R=page("Skins")
hh(L,"Players")
local LF=mk("Frame",{Size=U(1,0,0,0),AutomaticSize=AY,BT=1},L)
mk("UIListLayout",{Padding=UD(0,4)},LF)
hh(R,"Acoes")
local info=txt(R,"Sel: -")
local st=txt(R,"",C(120,200,255))
local gone
local function mH() return LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") end
local function rf()
for _,c in ip(LF:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
for _,p in ip(P:GetPlayers()) do
if p~=LP and p~=gone then
local b=mk("TextButton",{Size=U(1,0,0,26),BC=sel==p and C(52,64,110) or C(22,28,48),Text="  "..p.DisplayName,TextXAlignment=AL,Font=CD,TextSize=12,TC=TXT},LF)
rnd(b,8)
b.MouseButton1Click:Connect(function() sel=p info.Text="Sel: "..p.DisplayName rf() end)
end
end
end
btn(R,"Teleportar (atras)",function()
local t=sel and sel.Character and sel.Character:FindFirstChild("HumanoidRootPart")
local m=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
if t and m then m.CFrame=t.CFrame*CFrame.new(0,0,3.5) st.Text="OK!" else st.Text="Falhou" end
end)
btn(R,"Spectar",function() if sel then spec=sel st.Text="Vendo "..sel.DisplayName end end)
btn(R,"Parar Spectate",function() spec=nil local h=mH() if h then Cam.CameraSubject=h end st.Text="" end)
P.PlayerAdded:Connect(rf)
P.PlayerRemoving:Connect(function(p)
if sel==p then sel=nil info.Text="Sel: -" end
if spec==p then spec=nil end
gone=p rf() gone=nil
end)
rf()
L,R=page("Config")
hh(L,"Informacoes da conta")
txt(L,"Usuario: cyber") txt(L,"Plano: Gratis") txt(L,"Expiracao: Sem data de expiracao") txt(L,"Status: Ativo")
hh(R,"Atualizacoes")
txt(R,"Loja (copie o link):")
mk("TextBox",{Size=U(1,0,0,26),BC=C(22,28,48),Text="https://cyberonline-pg5i.onrender.com/",ClearTextOnFocus=false,TextEditable=false,Font=CD,TextSize=11,TC=C(100,170,255)},R)
txt(R,"Versao: verificar na loja")
show("Aimbot")
local function tm(p) return p.Team~=nil and p.Team==LP.Team end
local function dn(ch)
local h=ch:FindFirstChildOfClass("Humanoid")
return (not h) or h.Health<=15 or ch:GetAttribute("Downed")==true
end
local function tp2(ch) local h=ch:FindFirstChild("Head") return h~=nil and h.Transparency>=.9 end
local function hpc(p) if p>.66 then return S.HighHP elseif p>.33 then return S.MidHP end return S.LowHP end
local E={}
local function nE(p)
local e={All={},Lines={},Hat={}}
local function fr(c)
local f=mk("Frame",{BorderSizePixel=0,Visible=false,AP=c and V2(.5,.5) or V2()},EL)
e.All[#e.All+1]=f
return f
end
local function tl(a)
local l=mk("TextLabel",{BT=1,Font=GB,TextSize=12,Size=F(120,14),AP=a,Visible=false},EL)
e.All[#e.All+1]=l
return l
end
e.Box=fr() e.Box.BackgroundTransparency=1
e.BS=strk(e.Box,WH)
e.BG=fr() e.BG.BackgroundColor3=C(0,0,0)
e.Bar=fr()
e.Name=tl(V2(.5,1))
e.Dist=tl(V2(.5,0))
e.Held=tl(V2(.5,0)) e.Held.TextColor3=C(255,200,0)
e.Dot=fr(true) e.Dot.Size=F(6,6)
e.Tr=fr(true)
for i=1,16 do e.Lines[i]=fr(true) end
for i=1,24 do e.Hat[i]=fr(true) end
E[p]=e
return e
end
local function hide(e) for _,o in ip(e.All) do o.Visible=false end end
P.PlayerRemoving:Connect(function(p)
local e=E[p]
if not e then return end
for _,o in ip(e.All) do o:Destroy() end
E[p]=nil
end)
local function upd(p,e)
local ch=p.Character
local h=ch and ch:FindFirstChildOfClass("Humanoid")
local r=ch and ch:FindFirstChild("HumanoidRootPart")
local hd=ch and ch:FindFirstChild("Head")
if not (S.ESP and h and r and hd and h.Health>0) then return hide(e) end
if (S.EspTeam and tm(p)) or (S.EspDowned and dn(ch)) or (S.EspTransp and tp2(ch)) then return hide(e) end
local d=(Cam.CFrame.Position-r.Position).Magnitude
if S.LimitDist and d>S.MaxDist then return hide(e) end
local rp,on=W2(r.Position)
if not on then return hide(e) end
local top=W2(hd.Position+V3(0,hd.Size.Y/2+.2,0))
local bot=W2(r.Position-V3(0,3,0))
local ht=math.abs(bot.Y-top.Y)
local w=ht*.55
local cx=rp.X
e.Box.Visible=S.Boxes
if S.Boxes then e.Box.Position=F(cx-w/2,top.Y) e.Box.Size=F(w,ht) e.BS.Color=S.BoxColor end
e.BG.Visible=S.HealthBar e.Bar.Visible=S.HealthBar
if S.HealthBar then
local pc=mc(h.Health/mxx(h.MaxHealth,1),0,1)
e.BG.Position=F(cx-w/2-6,top.Y) e.BG.Size=F(4,ht)
e.Bar.Position=F(cx-w/2-6,top.Y+ht*(1-pc)) e.Bar.Size=F(4,ht*pc)
e.Bar.BackgroundColor3=hpc(pc)
end
e.Name.Visible=S.Names
if S.Names then e.Name.Text=p.DisplayName e.Name.TextColor3=S.NameColor e.Name.Position=F(cx,top.Y-2) end
e.Dist.Visible=S.Distance
if S.Distance then e.Dist.Text=mf(d).."m" e.Dist.TextColor3=S.DistColor e.Dist.Position=F(cx,top.Y+ht+2) end
local tool=S.Held and ch:FindFirstChildOfClass("Tool")
e.Held.Visible=not not tool
if tool then e.Held.Text=tool.Name e.Held.Position=F(cx,top.Y+ht+16) end
e.Dot.Visible=S.HeadDot
if S.HeadDot then
local hp=W2(hd.Position)
e.Dot.Position=F(hp.X,hp.Y) e.Dot.BackgroundColor3=S.DotColor
end
e.Tr.Visible=S.Tracers
if S.Tracers then
local vs=Cam.ViewportSize
line(e.Tr,V2(vs.X/2,vs.Y),V2(cx,bot.Y),S.TracerColor)
end
local n=0
if S.Skeleton then
for _,m in ip(ch:GetDescendants()) do
if n<16 and m:IsA("Motor6D") and m.Part0 and m.Part1 then
local pa,oa=W2(m.Part0.Position)
local pb,ob=W2(m.Part1.Position)
if oa and ob then n=n+1 line(e.Lines[n],V2(pa.X,pa.Y),V2(pb.X,pb.Y),S.SkelColor) end
end
end
end
for i=n+1,16 do e.Lines[i].Visible=false end
local pts={}
local ap,ao=W2(hd.Position+V3(0,hd.Size.Y/2+1.1,0))
if S.ChinaHat then
local tp=hd.Position+V3(0,hd.Size.Y/2+.1,0)
for j=1,12 do
local a=j/12*math.pi*2
local q,qo=W2(tp+V3(math.cos(a)*2.2,0,math.sin(a)*2.2))
pts[j]=qo and V2(q.X,q.Y)
end
end
local hc=S.ChinaHatRGB and hue or S.HatColor
for j=1,12 do
local s,rm=e.Hat[j],e.Hat[12+j]
s.Visible=false rm.Visible=false
local a1,a2=pts[j],pts[j%12+1]
if ao and a1 then line(s,V2(ap.X,ap.Y),a1,hc) end
if a1 and a2 then line(rm,a1,a2,hc) end
end
end
local FC=mk("Frame",{AP=V2(.5,.5),BT=1,Visible=false},G)
mk("UICorner",{CornerRadius=UD(1,0)},FC)
strk(FC,WH,1.5)
local function vis(pt,ch)
if not S.AimWall then return true end
local rp=RaycastParams.new()
rp.FilterType=Enum.RaycastFilterType.Exclude
rp.FilterDescendantsInstances={LP.Character,ch}
return W:Raycast(Cam.CFrame.Position,pt.Position-Cam.CFrame.Position,rp)==nil
end
local function tg(c,fov)
local best,bd=nil,fov
for _,p in ip(P:GetPlayers()) do
local ch=p~=LP and p.Character
local h=ch and ch:FindFirstChildOfClass("Humanoid")
local pt=ch and ch:FindFirstChild(S.Target=="Head" and "Head" or "HumanoidRootPart")
if h and pt and h.Health>0 and not (S.AimTeam and tm(p)) and not (S.AimDowned and dn(ch)) and not (S.AimTransp and tp2(ch)) then
local pos,on=W2(pt.Position)
if on then
local dd=(V2(pos.X,pos.Y)-c).Magnitude
if dd<bd then
if vis(pt,ch) then best,bd=pt,dd end
end
end
end
end
return best
end
local function hl()
if S.Key=="Always" then return true end
if S.Key=="MouseButton2" then return UIS:IsMouseButtonPressed(UT.MouseButton2) end
return UIS:IsKeyDown(Enum.KeyCode[S.Key])
end
RS.Stepped:Connect(function()
local ch=LP.Character
if S.Noclip and ch then for _,p in ip(ch:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end
end)
RS:BindToRenderStep("CyberMenu",Enum.RenderPriority.Camera.Value+1,function(dt)
Cam=W.CurrentCamera
hue=Color3.fromHSV(tick()*.3%1,1,1)
local vs=Cam.ViewportSize
local c=S.UseMouse and UIS:GetMouseLocation() or V2(vs.X/2,vs.Y/2)
FC.Visible=S.ShowFOV FC.Position=F(c.X,c.Y) FC.Size=F(S.FOV*2,S.FOV*2)
WM.Visible=S.WM
WM.TextColor3=S.WMRGB and hue or S.WMCol
WM.Text=" CYBER | "..LP.Name.." | "..mf(1/mxx(dt,.001)).." FPS "
MS.Color=S.UIRGB and hue or C(50,62,100)
local hm=mH()
if hm then
if S.WSon then hm.WalkSpeed=S.WS wsw=true elseif wsw then hm.WalkSpeed=16 wsw=false end
if S.JPon then hm.UseJumpPower=true hm.JumpPower=S.JP jpw=true elseif jpw then hm.JumpPower=50 jpw=false end
end
local rt=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
if S.Spin and rt then rt.CFrame=rt.CFrame*CFrame.Angles(0,math.rad(25),0) end
if spec then
local sh=spec.Character and spec.Character:FindFirstChildOfClass("Humanoid")
if sh then Cam.CameraSubject=sh end
elseif S.Aimbot and hl() then
local t=lock
local lh=t and t.Parent and t.Parent:FindFirstChildOfClass("Humanoid")
if lh and lh.Health>0 then
local pp,on=W2(t.Position)
if not on or (V2(pp.X,pp.Y)-c).Magnitude>S.FOV*1.6 or not vis(t,t.Parent) then t=nil end
else t=nil end
lock=t or tg(c,S.FOV)
if lock then Cam.CFrame=Cam.CFrame:Lerp(CFrame.lookAt(Cam.CFrame.Position,lock.Position),1-(1-S.Str)^(dt*60)) end
else lock=nil
end
for _,p in ip(P:GetPlayers()) do
if p~=LP then upd(p,E[p] or nE(p)) end
end
end)
