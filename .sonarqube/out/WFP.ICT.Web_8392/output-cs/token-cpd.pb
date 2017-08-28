�
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\BundleConfig.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

class 
BundleConfig 
{ 
public 
static 
void 
RegisterBundles *
(* +
BundleCollection+ ;
bundles< C
)C D
{		 	
bundles 
. 
Add 
( 
new 
StyleBundle '
(' (
$str( 5
)5 6
.6 7
Include7 >
(> ?
$str "
," #
$str "
," #
$str   ,
,  , -
$str!! )
,!!) *
$str"" !
,""! "
$str## (
,##( )
$str$$ %
,$$% &
$str%% +
,%%+ ,
$str&& $
,&&$ %
$str'' %
,''% &
$str(( &
,((& '
$str)) 
,))  
$str** "
,**" #
$str++ #
,++# $
$str,, /
,,,/ 0
$str-- &
,--& '
$str.. &
,..& '
$str// 8
)00 
)00 
;00 
bundles22 
.22 
Add22 
(22 
new22 
ScriptBundle22 (
(22( )
$str22) 5
)225 6
.226 7
Include227 >
(22> ?
$str44 +
,44+ ,
$str55 '
,55' (
$str66 '
,66' (
$str77 (
,77( )
$str88 $
,88$ %
$str99 *
,99* +
$str::  
,::  !
$str;; '
,;;' (
$str== %
,==% &
$str>> )
,>>) *
$str?? )
,??) *
$str@@ 
,@@ 
$strAA 
,AA 
$strBB 6
,BB6 7
$strCC +
,CC+ ,
$strDD .
,DD. /
$strEE *
,EE* +
$strFF )
,FF) *
$strGG "
,GG" #
$strHH 7
)II 
)II 
;II 
bundlesKK 
.KK 
AddKK 
(KK 
newKK 
ScriptBundleKK (
(KK( )
$strKK) ;
)KK; <
.KK< =
IncludeKK= D
(KKD E
$strLL #
,LL# $
$strMM &
)NN 
)NN 
;NN 
BundleTablePP 
.PP 
EnableOptimizationsPP +
=PP, -
falsePP. 3
;PP3 4
}QQ 	
}RR 
}SS �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\FilterConfig.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

class 
FilterConfig 
{ 
public 
static 
void !
RegisterGlobalFilters 0
(0 1"
GlobalFilterCollection1 G
filtersH O
)O P
{ 	
filters		 
.		 
Add		 
(		 
new		  
HandleErrorAttribute		 0
(		0 1
)		1 2
)		2 3
;		3 4
}

 	
} 
} �S
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\IdentityConfig.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

class 
EmailService 
: #
IIdentityMessageService  7
{ 
public 
Task 
	SendAsync 
( 
IdentityMessage -
message. 5
)5 6
{ 	
return 
Task 
. 

FromResult "
(" #
$num# $
)$ %
;% &
} 	
} 
public 

class 

SmsService 
: #
IIdentityMessageService 5
{ 
public 
Task 
	SendAsync 
( 
IdentityMessage -
message. 5
)5 6
{ 	
return 
Task 
. 

FromResult "
(" #
$num# $
)$ %
;% &
} 	
} 
public   

class   "
ApplicationUserManager   '
:  ( )
UserManager  * 5
<  5 6
WfpUser  6 =
>  = >
{!! 
public"" "
ApplicationUserManager"" %
(""% &

IUserStore""& 0
<""0 1
WfpUser""1 8
>""8 9
store"": ?
)""? @
:""A B
base""C G
(""G H
store""H M
)""M N
{## 	
}$$ 	
public&& 
static&& "
ApplicationUserManager&& ,
Create&&- 3
(&&3 4"
IdentityFactoryOptions&&4 J
<&&J K"
ApplicationUserManager&&K a
>&&a b
options&&c j
,&&j k
IOwinContext&&l x
context	&&y �
)
&&� �
{'' 	
var(( 
manager(( 
=(( 
new(( "
ApplicationUserManager(( 4
(((4 5
new((5 8
	UserStore((9 B
<((B C
WfpUser((C J
>((J K
(((K L
context((L S
.((S T
Get((T W
<((W X
WfpictContext((X e
>((e f
(((f g
)((g h
)((h i
)((i j
;((j k
manager** 
.** 
UserValidator** !
=**" #
new**$ '
UserValidator**( 5
<**5 6
WfpUser**6 =
>**= >
(**> ?
manager**? F
)**F G
{++ *
AllowOnlyAlphanumericUserNames,, .
=,,/ 0
false,,1 6
,,,6 7
RequireUniqueEmail-- "
=--# $
true--% )
}.. 
;.. 
manager11 
.11 
PasswordValidator11 %
=11& '
new11( +
PasswordValidator11, =
{22 
}88 
;88 
manager;; 
.;; '
UserLockoutEnabledByDefault;; /
=;;0 1
true;;2 6
;;;6 7
manager<< 
.<< )
DefaultAccountLockoutTimeSpan<< 1
=<<2 3
TimeSpan<<4 <
.<<< =
FromMinutes<<= H
(<<H I
$num<<I J
)<<J K
;<<K L
manager== 
.== 0
$MaxFailedAccessAttemptsBeforeLockout== 8
===9 :
$num==; <
;==< =
managerAA 
.AA %
RegisterTwoFactorProviderAA -
(AA- .
$strAA. :
,AA: ;
newAA< ?$
PhoneNumberTokenProviderAA@ X
<AAX Y
WfpUserAAY `
>AA` a
{BB 
MessageFormatCC 
=CC 
$strCC  ;
}DD 
)DD 
;DD 
managerEE 
.EE %
RegisterTwoFactorProviderEE -
(EE- .
$strEE. :
,EE: ;
newEE< ?
EmailTokenProviderEE@ R
<EER S
WfpUserEES Z
>EEZ [
{FF 
SubjectGG 
=GG 
$strGG )
,GG) *

BodyFormatHH 
=HH 
$strHH 8
}II 
)II 
;II 
managerJJ 
.JJ 
EmailServiceJJ  
=JJ! "
newJJ# &
EmailServiceJJ' 3
(JJ3 4
)JJ4 5
;JJ5 6
managerKK 
.KK 

SmsServiceKK 
=KK  
newKK! $

SmsServiceKK% /
(KK/ 0
)KK0 1
;KK1 2
varLL "
dataProtectionProviderLL &
=LL' (
optionsLL) 0
.LL0 1"
DataProtectionProviderLL1 G
;LLG H
ifMM 
(MM "
dataProtectionProviderMM &
!=MM' )
nullMM* .
)MM. /
{NN 
managerOO 
.OO 
UserTokenProviderOO )
=OO* +
newPP &
DataProtectorTokenProviderPP 2
<PP2 3
WfpUserPP3 :
>PP: ;
(PP; <"
dataProtectionProviderPP< R
.PPR S
CreatePPS Y
(PPY Z
$strPPZ l
)PPl m
)PPm n
;PPn o
}QQ 
returnRR 
managerRR 
;RR 
}SS 	
}TT 
publicVV 

classVV "
ApplicationRoleManagerVV '
:VV( )
RoleManagerVV* 5
<VV5 6
WfpRoleVV6 =
>VV= >
{WW 
publicXX "
ApplicationRoleManagerXX %
(XX% &

IRoleStoreXX& 0
<XX0 1
WfpRoleXX1 8
,XX8 9
stringXX: @
>XX@ A
	roleStoreXXB K
)XXK L
:XXL M
baseXXN R
(XXR S
	roleStoreXXS \
)XX\ ]
{YY 	
}ZZ 	
public\\ 
static\\ "
ApplicationRoleManager\\ ,
Create\\- 3
(\\3 4"
IdentityFactoryOptions\\4 J
<\\J K"
ApplicationRoleManager\\K a
>\\a b
options\\c j
,\\j k
IOwinContext\\l x
context	\\y �
)
\\� �
{]] 	
return^^ 
new^^ "
ApplicationRoleManager^^ -
(^^- .
new^^. 1
	RoleStore^^2 ;
<^^; <
WfpRole^^< C
>^^C D
(^^D E
context^^E L
.^^L M
Get^^M P
<^^P Q
WfpictContext^^Q ^
>^^^ _
(^^_ `
)^^` a
)^^a b
)^^b c
;^^c d
}__ 	
publicaa 
voidaa 
AddClaimaa 
(aa 
WfpictContextaa *
ctxaa+ .
,aa. /
stringaa0 6
roleIdaa7 =
,aa= >
Guidaa? C
claimIDaaD K
)aaK L
{bb 	
ctxcc 
.cc 

RoleClaimscc 
.cc 
Addcc 
(cc 
newcc "
AspNetRoleClaimscc# 3
(cc3 4
)cc4 5
{dd 
Idee 
=ee 
Guidee 
.ee 
NewGuidee !
(ee! "
)ee" #
,ee# $
RoleIDff 
=ff 
roleIdff 
,ff  
ClaimIDgg 
=gg 
claimIDgg !
,gg! "
	CreatedAthh 
=hh 
DateTimehh $
.hh$ %
Nowhh% (
}ii 
)ii 
;ii 
ctxjj 
.jj 
SaveChangesjj 
(jj 
)jj 
;jj 
}kk 	
}ll 
publicoo 

classoo $
ApplicationSignInManageroo )
:oo* +
SignInManageroo, 9
<oo9 :
WfpUseroo: A
,ooA B
stringooC I
>ooI J
{pp 
publicqq $
ApplicationSignInManagerqq '
(qq' ("
ApplicationUserManagerqq( >
userManagerqq? J
,qqJ K"
IAuthenticationManagerqqL b!
authenticationManagerqqc x
)qqx y
:rr 
baserr 
(rr 
userManagerrr 
,rr !
authenticationManagerrr  5
)rr5 6
{ss 	
}tt 	
publicvv 
overridevv 
Taskvv 
<vv 
ClaimsIdentityvv +
>vv+ ,#
CreateUserIdentityAsyncvv- D
(vvD E
WfpUservvE L
uservvM Q
)vvQ R
{ww 	
returnxx 
userxx 
.xx %
GenerateUserIdentityAsyncxx 1
(xx1 2
(xx2 3"
ApplicationUserManagerxx3 I
)xxI J
UserManagerxxJ U
)xxU V
;xxV W
}yy 	
public{{ 
static{{ $
ApplicationSignInManager{{ .
Create{{/ 5
({{5 6"
IdentityFactoryOptions{{6 L
<{{L M$
ApplicationSignInManager{{M e
>{{e f
options{{g n
,{{n o
IOwinContext{{p |
context	{{} �
)
{{� �
{|| 	
return}} 
new}} $
ApplicationSignInManager}} /
(}}/ 0
context}}0 7
.}}7 8
GetUserManager}}8 F
<}}F G"
ApplicationUserManager}}G ]
>}}] ^
(}}^ _
)}}_ `
,}}` a
context}}b i
.}}i j
Authentication}}j x
)}}x y
;}}y z
}~~ 	
public
�� 
override
�� 
Task
�� 
SignInAsync
�� (
(
��( )
WfpUser
��) 0
user
��1 5
,
��5 6
bool
��7 ;
isPersistent
��< H
,
��H I
bool
��J N
rememberBrowser
��O ^
)
��^ _
{
�� 	
return
�� 
base
�� 
.
�� 
SignInAsync
�� #
(
��# $
user
��$ (
,
��( )
isPersistent
��* 6
,
��6 7
rememberBrowser
��8 G
)
��G H
;
��H I
}
�� 	
public
�� 
override
�� 
Task
�� 
<
�� 
SignInStatus
�� )
>
��) *"
TwoFactorSignInAsync
��+ ?
(
��? @
string
��@ F
provider
��G O
,
��O P
string
��Q W
code
��X \
,
��\ ]
bool
��^ b
isPersistent
��c o
,
��o p
bool
��q u
rememberBrowser��v �
)��� �
{
�� 	
return
�� 
base
�� 
.
�� "
TwoFactorSignInAsync
�� ,
(
��, -
provider
��- 5
,
��5 6
code
��7 ;
,
��; <
isPersistent
��= I
,
��I J
rememberBrowser
��K Z
)
��Z [
;
��[ \
}
�� 	
}
�� 
}�� �	
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\RouteConfig.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

class 
RouteConfig 
{ 
public		 
static		 
void		 
RegisterRoutes		 )
(		) *
RouteCollection		* 9
routes		: @
)		@ A
{

 	
routes 
. 
IgnoreRoute 
( 
$str ;
); <
;< =
routes 
. 
MapRoute 
( 
name 
: 
$str 
,  
url 
: 
$str 1
,1 2
defaults 
: 
new 
{ 

controller  *
=+ ,
$str- 8
,8 9
action: @
=A B
$strC J
,J K
idL N
=O P
UrlParameterQ ]
.] ^
Optional^ f
}g h
) 
; 
} 	
} 
} �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\Startup.Auth.cs
	namespace		 	
WFP		
 
.		 
ICT		 
.		 
Web		 
{

 
public 

partial 
class 
Startup  
{ 
public 
void 
ConfigureAuth !
(! "
IAppBuilder" -
app. 1
)1 2
{ 	
app 
.  
CreatePerOwinContext $
($ %
WfpictContext% 2
.2 3
Create3 9
)9 :
;: ;
app 
.  
CreatePerOwinContext $
<$ %"
ApplicationUserManager% ;
>; <
(< ="
ApplicationUserManager= S
.S T
CreateT Z
)Z [
;[ \
app 
.  
CreatePerOwinContext $
<$ %"
ApplicationRoleManager% ;
>; <
(< ="
ApplicationRoleManager= S
.S T
CreateT Z
)Z [
;[ \
app 
.  
CreatePerOwinContext $
<$ %$
ApplicationSignInManager% =
>= >
(> ?$
ApplicationSignInManager? W
.W X
CreateX ^
)^ _
;_ `
app 
. #
UseCookieAuthentication '
(' (
new( +'
CookieAuthenticationOptions, G
{ 
AuthenticationType "
=# $&
DefaultAuthenticationTypes% ?
.? @
ApplicationCookie@ Q
,Q R
	LoginPath 
= 
new 

PathString  *
(* +
$str+ ;
); <
,< =
Provider 
= 
new (
CookieAuthenticationProvider ;
{ 
OnValidateIdentity!! &
=!!' ("
SecurityStampValidator!!) ?
.!!? @
OnValidateIdentity!!@ R
<!!R S"
ApplicationUserManager!!S i
,!!i j
WfpUser!!k r
>!!r s
(!!s t
validateInterval"" (
:""( )
TimeSpan""* 2
.""2 3
FromMinutes""3 >
(""> ?
$num""? A
)""A B
,""B C
regenerateIdentity## *
:##* +
(##, -
manager##- 4
,##4 5
user##6 :
)##: ;
=>##< >
user##? C
.##C D%
GenerateUserIdentityAsync##D ]
(##] ^
manager##^ e
)##e f
)##f g
}$$ 
}%% 
)%% 
;%% 
app&& 
.&& #
UseExternalSignInCookie&& '
(&&' (&
DefaultAuthenticationTypes&&( B
.&&B C
ExternalCookie&&C Q
)&&Q R
;&&R S
app)) 
.)) $
UseTwoFactorSignInCookie)) (
())( )&
DefaultAuthenticationTypes))) C
.))C D
TwoFactorCookie))D S
,))S T
TimeSpan))U ]
.))] ^
FromMinutes))^ i
())i j
$num))j k
)))k l
)))l m
;))m n
app.. 
... -
!UseTwoFactorRememberBrowserCookie.. 1
(..1 2&
DefaultAuthenticationTypes..2 L
...L M*
TwoFactorRememberBrowserCookie..M k
)..k l
;..l m
}BB 	
}CC 
}DD �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\UnityConfig.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
	App_Start 
{ 
public

 

class

 
UnityConfig

 
{ 
private 
static 
Lazy 
< 
IUnityContainer +
>+ ,
	container- 6
=7 8
new9 <
Lazy= A
<A B
IUnityContainerB Q
>Q R
(R S
(S T
)T U
=>V X
{ 	
var 
	container 
= 
new 
UnityContainer  .
(. /
)/ 0
;0 1
RegisterTypes 
( 
	container #
)# $
;$ %
return 
	container 
; 
} 	
)	 

;
 
public 
static 
IUnityContainer %"
GetConfiguredContainer& <
(< =
)= >
{ 	
return 
	container 
. 
Value "
;" #
} 	
public!! 
static!! 
void!! 
RegisterTypes!! (
(!!( )
IUnityContainer!!) 8
	container!!9 B
)!!B C
{"" 	
	container)) 
.)) 
RegisterType)) "
<))" #
Controllers))# .
.)). /
AccountController))/ @
>))@ A
())A B
new))B E 
InjectionConstructor))F Z
())Z [
)))[ \
)))\ ]
;))] ^
	container++ 
.++ 
RegisterType++ "
<++" #
System++# )
.++) *
Data++* .
.++. /
Entity++/ 5
.++5 6
	DbContext++6 ?
,++? @
WfpictContext++A N
>++N O
(++O P
new++P S'
HierarchicalLifetimeManager++T o
(++o p
)++p q
)++q r
;++r s
},, 	
}-- 
}.. �
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\UnityMvcActivator.cs
[ 
assembly 	
:	 

WebActivatorEx 
. %
PreApplicationStartMethod 3
(3 4
typeof4 :
(: ;
WFP; >
.> ?
ICT? B
.B C
WebC F
.F G
	App_StartG P
.P Q
UnityWebActivatorQ b
)b c
,c d
$stre l
)l m
]m n
[ 
assembly 	
:	 

WebActivatorEx 
. %
ApplicationShutdownMethod 3
(3 4
typeof4 :
(: ;
WFP; >
.> ?
ICT? B
.B C
WebC F
.F G
	App_StartG P
.P Q
UnityWebActivatorQ b
)b c
,c d
$stre o
)o p
]p q
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
	App_Start 
{		 
public 

static 
class 
UnityWebActivator )
{ 
public 
static 
void 
Start  
(  !
)! "
{ 	
var 
	container 
= 
UnityConfig '
.' ("
GetConfiguredContainer( >
(> ?
)? @
;@ A
FilterProviders 
. 
	Providers %
.% &
Remove& ,
(, -
FilterProviders- <
.< =
	Providers= F
.F G
OfTypeG M
<M N)
FilterAttributeFilterProviderN k
>k l
(l m
)m n
.n o
Firsto t
(t u
)u v
)v w
;w x
FilterProviders 
. 
	Providers %
.% &
Add& )
() *
new* -.
"UnityFilterAttributeFilterProvider. P
(P Q
	containerQ Z
)Z [
)[ \
;\ ]
DependencyResolver 
. 
SetResolver *
(* +
new+ .#
UnityDependencyResolver/ F
(F G
	containerG P
)P Q
)Q R
;R S
} 	
public 
static 
void 
Shutdown #
(# $
)$ %
{ 	
var 
	container 
= 
UnityConfig '
.' ("
GetConfiguredContainer( >
(> ?
)? @
;@ A
	container 
. 
Dispose 
( 
) 
;  
}   	
}!! 
}"" �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\WebApiConfig.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

static 
class 
WebApiConfig $
{		 
public

 
static

 
void

 
Register

 #
(

# $
HttpConfiguration

$ 5
config

6 <
)

< =
{ 	
config 
. "
MapHttpAttributeRoutes )
() *
)* +
;+ ,
config 
. 
Routes 
. 
MapHttpRoute &
(& '
name 
: 
$str "
," #
routeTemplate 
: 
$str 6
,6 7
defaults 
: 
new 
{ 
id  "
=# $
RouteParameter% 3
.3 4
Optional4 <
}= >
) 
; 
var 
jsonFormatter 
= 
config  &
.& '

Formatters' 1
.1 2
OfType2 8
<8 9"
JsonMediaTypeFormatter9 O
>O P
(P Q
)Q R
.R S
FirstS X
(X Y
)Y Z
;Z [
jsonFormatter 
. 
SerializerSettings ,
., -
ContractResolver- =
=> ?
new@ C2
&CamelCasePropertyNamesContractResolverD j
(j k
)k l
;l m
} 	
} 
} �0
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\NotificationsProcessor.cs
	namespace

 	
WFP


 
.

 
ICT

 
.

 
Web

 
.

 
ProData

 
{ 
public 

class "
NotificationsProcessor '
{ 
public 
static 
void #
FetchAndCheckForQCRules 2
(2 3
)3 4
{ 	
using 
( 
var 
db 
= 
new 
WfpictContext  -
(- .
). /
)/ 0
{ 
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
RulesProcessing- <
,< =
$str> @
,@ A
$strB q
)q r
;r s
List 
< 
Campaign 
> 
	campaigns (
=) *
db+ -
.- .
	Campaigns. 7
.7 8
Include8 ?
(? @
x@ A
=>B D
xE F
.F G
SegmentsG O
)O P
. 
Where 
( 
x 
=> 
x  !
.! "
Status" (
==) +
(, -
int- 0
)0 1
CampaignStatus1 ?
.? @

Monitoring@ J
||K M
xN O
.O P
SegmentsP X
.X Y
AnyY \
(\ ]
s] ^
=>_ a
sb c
.c d
SegmentStatusd q
==r t
(u v
intv y
)y z
SegmentStatus	z �
.
� �

Monitoring
� �
)
� �
)
� �
. 
ToList 
( 
) 
; 
foreach 
( 
var 
campaign %
in& (
	campaigns) 2
)2 3
{ 
ProDataAPIManager %
.% &#
FetchAndUpdateTrackings& =
(= >
db> @
,@ A
campaignB J
)J K
;K L
}77 
var:: 
toBeExpired:: 
=::  !
db::" $
.::$ %
Notifications::% 2
.::2 3
ToList::3 9
(::9 :
)::: ;
.;; 
Where;; 
(;; 
x;;  
=>;;! #
(;;$ %
DateTime;;% -
.;;- .
Now;;. 1
.;;1 2
	TimeOfDay;;2 ;
.;;; <
Hours;;< A
-;;B C
x;;D E
.;;E F
FoundAt;;F M
?;;M N
.;;N O
	TimeOfDay;;O X
.;;X Y
Hours;;Y ^
);;^ _
>=;;` b
$num;;c e
);;e f
.<< 
ToList<< 
(<<  
)<<  !
;<<! "
if== 
(== 
toBeExpired== 
.==  
Count==  %
>==& '
$num==( )
)==) *
{>> 
	LogHelper?? 
.?? 
AddLog?? $
(??$ %
db??% '
,??' (
LogType??) 0
.??0 1
RulesProcessing??1 @
,??@ A
$str??B D
,??D E
$str??F h
)??h i
;??i j
foreach@@ 
(@@ 
var@@  
notification@@! -
in@@. 0
toBeExpired@@1 <
)@@< =
{AA 
notificationBB $
.BB$ %
StatusBB% +
=BB, -
(BB. /
intBB/ 2
)BB2 3
NotificationStatusBB3 E
.BBE F
ExpiredBBF M
;BBM N
}CC 
}DD 
}FF 
}GG 	
publicII 
staticII 
voidII "
SendNotificationEmailsII 1
(II1 2
)II2 3
{JJ 	
usingKK 
(KK 
varKK 
dbKK 
=KK 
newKK 
WfpictContextKK  -
(KK- .
)KK. /
)KK/ 0
{LL 
varVV 
	campaignsVV 
=VV 
(VV  !
fromVV! %
cVV& '
inVV( *
dbVV+ -
.VV- .
	CampaignsVV. 7
joinWW  $
nWW% &
inWW' )
dbWW* ,
.WW, -
NotificationsWW- :
onWW; =
cWW> ?
.WW? @
IdWW@ B
equalsWWC I
nWWJ K
.WWK L

CampaignIdWWL V
whereXX  %
nXX& '
.XX' (
StatusXX( .
==XX/ 1
(XX2 3
intXX3 6
)XX6 7
NotificationStatusXX7 I
.XXI J
FoundXXJ O
selectYY  &
cYY' (
)YY( )
.YY) *
DistinctYY* 2
(YY2 3
)YY3 4
.YY4 5
IncludeYY5 <
(YY< =
xYY= >
=>YY? A
xYYB C
.YYC D
NotificationsYYD Q
)YYQ R
.YYR S
ToListYYS Y
(YYY Z
)YYZ [
;YY[ \
var[[ 
vendor[[ 
=[[ 
db[[ 
.[[  
Vendors[[  '
.[[' (
FirstOrDefault[[( 6
([[6 7
x[[7 8
=>[[9 ;
x[[< =
.[[= >
Name[[> B
.[[B C
Contains[[C K
([[K L
$str[[L Q
)[[Q R
||[[S U
x[[V W
.[[W X
Name[[X \
.[[\ ]
Contains[[] e
([[e f
$str[[f l
)[[l m
)[[m n
;[[n o
if]] 
(]] 
	campaigns]] 
.]] 
Count]] #
>]]$ %
$num]]& '
)]]' (
{^^ 
	LogHelper__ 
.__ 
AddLog__ $
(__$ %
db__% '
,__' (
LogType__) 0
.__0 1
RulesProcessing__1 @
,__@ A
$str__B D
,__D E
$str__F c
)__c d
;__d e
EmailHelper`` 
.``  %
SendNotificationsToVendor``  9
(``9 :
vendor``: @
,``@ A
	campaigns``B K
)``K L
;``L M
}aa 
}bb 
}cc 	
}ee 
}ff �O
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\CampaignProcessor.cs
	namespace		 	
WFP		
 
.		 
ICT		 
.		 
Web		 
.		 
Async		 
{

 
public 

class 
CampaignProcessor "
{ 
public 
static 
void 
SendVendorEmail *
(* +
Guid+ /
?/ 0
vendorId1 9
,9 :
string; A
OrderNumberB M
,M N
stringO U
[U V
]V W
SegmentsSelectedX h
)h i
{ 	
using 
( 
var 
db 
= 
new 
WfpictContext  -
(- .
). /
)/ 0
{ 
Campaign 
campaign !
=" #
db$ &
.& '
	Campaigns' 0
. 
Include 
( 
x 
=> !
x" #
.# $
Assets$ *
)* +
. 
Include 
( 
x 
=> !
x" #
.# $
Segments$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
Approved$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
	Trackings$ -
)- .
. 
FirstOrDefault #
(# $
x$ %
=>& (
x) *
.* +
OrderNumber+ 6
==7 9
OrderNumber: E
)E F
;F G
var 
vendor 
= 
db 
.  
Vendors  '
.' (
FirstOrDefault( 6
(6 7
x7 8
=>9 ;
x< =
.= >
Id> @
==A C
vendorIdD L
)L M
;M N
if 
( 
SegmentsSelected $
==% '
null( ,
), -
{ 
EmailHelper 
.   
SendApprovedToVendor  4
(4 5
vendor5 ;
,; <
campaign= E
,E F
nullG K
)K L
;L M
string 
OrderNumberRDP )
=* +
campaign, 4
.4 5
ReBroadcasted5 B
?B C
campaignD L
.L M$
ReBroadcastedOrderNumberM e
:f g
campaignh p
.p q
OrderNumberq |
;| }
var   
campaignTracking   (
=  ) *
db!! 
.!! 
CampaignTrackings!! /
.!!/ 0
FirstOrDefault!!0 >
(!!> ?
x!!? @
=>!!A C
x!!D E
.!!E F

CampaignId!!F P
==!!Q S
campaign!!T \
.!!\ ]
Id!!] _
&&!!` b
x!!c d
.!!d e
OrderNumber!!e p
==!!q s
OrderNumberRDP	!!t �
&&
!!� �
x
!!� �
.
!!� �
SegmentNumber
!!� �
==
!!� �
$str
!!� �
)
!!� �
;
!!� �
if## 
(## 
campaignTracking## (
==##) +
null##, 0
)##0 1
{$$ 
var%% 

trackingId%% &
=%%' (
Guid%%) -
.%%- .
NewGuid%%. 5
(%%5 6
)%%6 7
;%%7 8
var&& 
tracking&& $
=&&% &
new&&' *
CampaignTracking&&+ ;
(&&; <
)&&< =
{'' 
Id(( 
=((  

trackingId((! +
,((+ ,
	CreatedAt)) %
=))& '
DateTime))( 0
.))0 1
Now))1 4
,))4 5

CampaignId** &
=**' (
campaign**) 1
.**1 2
Id**2 4
,**4 5
OrderNumber++ '
=++( )
OrderNumberRDP++* 8
,++8 9
SegmentNumber,, )
=,,* +
string,,, 2
.,,2 3
Empty,,3 8
,,,8 9
DateSent-- $
=--% &
DateTime--' /
.--/ 0
Now--0 3
,--3 4
IsCreatedThroughApi.. /
=..0 1
false..2 7
}// 
;// 
db00 
.00 
CampaignTrackings00 ,
.00, -
Add00- 0
(000 1
tracking001 9
)009 :
;00: ;
}11 
if33 
(33 
!33 
campaign33 !
.33! "
ReBroadcasted33" /
)33/ 0
{44 
	LogHelper55 !
.55! "
AddLog55" (
(55( )
db55) +
,55+ ,
LogType55- 4
.554 5
ProData555 <
,55< =
OrderNumber55> I
,55I J
$str55K x
)55x y
;55y z
}66 
else77 
{88 
	LogHelper99 !
.99! "
AddLog99" (
(99( )
db99) +
,99+ ,
LogType99- 4
.994 5
ProData995 <
,99< =
OrderNumber99> I
,99I J
$str99K 
)	99 �
;
99� �
}:: 
db;; 
.;; 
SaveChanges;; "
(;;" #
);;# $
;;;$ %
}== 
else>> 
{?? 
var@@ 
segments@@  
=@@! "
db@@# %
.@@% &
CampaignSegments@@& 6
.AA# $
WhereAA$ )
(AA) *
cAA* +
=>AA, .
cAA/ 0
.AA0 1

CampaignIdAA1 ;
==AA< >
campaignAA? G
.AAG H
IdAAH J
&&AAK M
SegmentsSelectedAAN ^
.AA^ _
ContainsAA_ g
(AAg h
cAAh i
.AAi j
SegmentNumberAAj w
)AAw x
)AAx y
.BB# $
ToListBB$ *
(BB* +
)BB+ ,
;BB, -
foreachDD 
(DD 
varDD  
segmentDD! (
inDD) +
segmentsDD, 4
)DD4 5
{EE 
EmailHelperFF #
.FF# $ 
SendApprovedToVendorFF$ 8
(FF8 9
vendorFF9 ?
,FF? @
campaignFFA I
,FFI J
segmentFFK R
)FFR S
;FFS T
segmentHH 
.HH  
SegmentStatusHH  -
=HH. /
(HH0 1
intHH1 4
)HH4 5
SegmentStatusHH5 B
.HHB C

MonitoringHHC M
;HHM N
varJJ 
campaignTrackingJJ ,
=JJ- .
dbKK 
.KK 
CampaignTrackingsKK 0
.KK0 1
FirstOrDefaultKK1 ?
(KK? @
xKK@ A
=>KKB D
xKKE F
.KKF G

CampaignIdKKG Q
==KKR T
campaignKKU ]
.KK] ^
IdKK^ `
&&KKa c
xKKd e
.KKe f
SegmentNumberKKf s
==KKt v
segmentKKw ~
.KK~ 
SegmentNumber	KK �
)
KK� �
;
KK� �
ifMM 
(MM 
campaignTrackingMM ,
==MM- /
nullMM0 4
)MM4 5
{NN 
varOO 

trackingIdOO  *
=OO+ ,
GuidOO- 1
.OO1 2
NewGuidOO2 9
(OO9 :
)OO: ;
;OO; <
varPP 
trackingPP  (
=PP) *
newPP+ .
CampaignTrackingPP/ ?
(PP? @
)PP@ A
{QQ 
IdRR  "
=RR# $

trackingIdRR% /
,RR/ 0
	CreatedAtSS  )
=SS* +
DateTimeSS, 4
.SS4 5
NowSS5 8
,SS8 9

CampaignIdTT  *
=TT+ ,
campaignTT- 5
.TT5 6
IdTT6 8
,TT8 9
OrderNumberUU  +
=UU, -
OrderNumberUU. 9
,UU9 :
SegmentNumberVV  -
=VV. /
segmentVV0 7
.VV7 8
SegmentNumberVV8 E
,VVE F
DateSentWW  (
=WW) *
DateTimeWW+ 3
.WW3 4
NowWW4 7
,WW7 8
IsCreatedThroughApiXX  3
=XX4 5
falseXX6 ;
}YY 
;YY 
dbZZ 
.ZZ 
CampaignTrackingsZZ 0
.ZZ0 1
AddZZ1 4
(ZZ4 5
trackingZZ5 =
)ZZ= >
;ZZ> ?
}[[ 
	LogHelper\\ !
.\\! "
AddLog\\" (
(\\( )
db\\) +
,\\+ ,
LogType\\- 4
.\\4 5
ProData\\5 <
,\\< =
OrderNumber\\> I
,\\I J
$str\\K U
+\\V W
segment\\X _
.\\_ `
SegmentNumber\\` m
+\\n o
$str	\\p �
)
\\� �
;
\\� �
}]] 
var`` #
ifSomeSegmentsRemaining`` /
=``0 1
db``2 4
.``4 5
CampaignSegments``5 E
.aa" #
Whereaa# (
(aa( )
caa) *
=>aa+ -
caa. /
.aa/ 0

CampaignIdaa0 :
==aa; =
campaignaa> F
.aaF G
IdaaG I
)aaI J
.bb" #
Anybb# &
(bb& '
xbb' (
=>bb) +
xbb, -
.bb- .
SegmentStatusbb. ;
==bb< >
(bb? @
intbb@ C
)bbC D
SegmentStatusbbD Q
.bbQ R
	GeneratedbbR [
||bb\ ^
xbb_ `
.bb` a
SegmentStatusbba n
==bbo q
(bbr s
intbbs v
)bbv w
SegmentStatus	bbw �
.
bb� �
Approved
bb� �
)
bb� �
;
bb� �
ifcc 
(cc 
!cc #
ifSomeSegmentsRemainingcc 0
)cc0 1
{dd 
campaignee  
.ee  !
Statusee! '
=ee( )
(ee* +
intee+ .
)ee. /
CampaignStatusee/ =
.ee= >

Monitoringee> H
;eeH I
dbff 
.ff 
SaveChangesff &
(ff& '
)ff' (
;ff( )
}gg 
}hh 
}jj 
}kk 	
}mm 
}nn �n
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\DataFileProcessor.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Async 
{ 
public 

class 
DataFileProcessor "
{ 
public 
DataFileProcessor  
(  !
)! "
{ 	
} 	
public 
static 
async 
Task  
FetchSQLDataFile! 1
(1 2
string2 8

UploadPath9 C
,C D
stringE K
OrderNumberL W
,W X
stringY _
ZipCodeFile` k
,k l
long 
DataQuantity 
) 
{ 	
using 
( 
var 
db 
= 
new 
WfpictContext  -
(- .
). /
)/ 0
{ 
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
DataProcessing- ;
,; <
OrderNumber= H
,H I
$strJ l
)l m
;m n
try 
{ 
string   
ZipFilePath   &
=  ' (
Path  ) -
.  - .
Combine  . 5
(  5 6

UploadPath  6 @
,  @ A
ZipCodeFile  B M
)  M N
;  N O
S3FileManager!! !
.!!! "
Download!!" *
(!!* +
ZipCodeFile!!+ 6
,!!6 7
ZipFilePath!!8 C
)!!C D
;!!D E
var"" 
list"" 
="" 
new"" "
List""# '
<""' (
string""( .
>"". /
(""/ 0
)""0 1
;""1 2
foreach## 
(## 
var##  
line##! %
in##& (
File##) -
.##- .
ReadAllLines##. :
(##: ;
ZipFilePath##; F
)##F G
)##G H
{$$ 
var%% 
trimmed%% #
=%%$ %
StringHelper%%& 2
.%%2 3
Trim%%3 7
(%%7 8
line%%8 <
)%%< =
;%%= >
if&& 
(&& 
string&& "
.&&" #
IsNullOrEmpty&&# 0
(&&0 1
trimmed&&1 8
)&&8 9
)&&9 :
continue&&; C
;&&C D
list'' 
.'' 
Add''  
(''  !
trimmed''! (
)''( )
;'') *
}(( 
	LogHelper)) 
.)) 
AddLog)) $
())$ %
db))% '
,))' (
LogType))) 0
.))0 1
DataProcessing))1 ?
,))? @
OrderNumber))A L
,))L M
ZipCodeFile** #
+**$ %
$str**& ?
)**? @
;**@ A
try-- 
{.. 
var// 
data//  
=//! "
SegmentDataManager//# 5
.//5 6
FetchSegmentsData//6 G
(//G H
new//H K
SegmentParameters//L ]
(//] ^
)//^ _
{00 
DataQuantity11 (
=11) *
DataQuantity11+ 7
,117 8
CustomerCode22 (
=22) *
SegmentDataManager22+ =
.22= >
CustomerCode22> J
,22J K
ZipCodes33 $
=33% &
list33' +
}44 
)44 
;44 
string55 
fileName55 '
=55( )
string55* 0
.550 1
Format551 7
(557 8
$str558 J
,55J K
OrderNumber55L W
)55W X
;55X Y
var66 
filePath66 $
=66% &
string66' -
.66- .
Format66. 4
(664 5
$str665 ?
,66? @

UploadPath66A K
,66K L
fileName66M U
)66U V
;66V W
data77 
.77 
ToCsv77 "
(77" #
filePath77# +
,77+ ,
new77- 0
CsvDefinition771 >
(77> ?
)77? @
{88 
	EndOfLine99 %
=99& '
$str99( .
,99. /
FieldSeparator:: *
=::+ ,
$char::- 0
,::0 1
TextQualifier;; )
=;;* +
$char;;, /
,;;/ 0
Columns<< #
=<<$ %
new==  #
List==$ (
<==( )
string==) /
>==/ 0
{>>  !
$str?? +
,??+ ,
$str@@ '
,@@' (
$strAA &
,AA& '
$strBB %
,BB% &
$strCC "
,CC" #
$strDD #
,DD# $
$strEE !
,EE! "
$strFF "
,FF" #
$strGG !
,GG! "
$strHH +
,HH+ ,
$strII #
}JJ  !
}KK 
)KK 
;KK 
stringLL 
amazonFileKeyLL ,
=LL- .
stringLL/ 5
.LL5 6
FormatLL6 <
(LL< =
$strLL= N
,LLN O
OrderNumberLLP [
)LL[ \
;LL\ ]
S3FileManagerMM %
.MM% &
UploadMM& ,
(MM, -
amazonFileKeyMM- :
,MM: ;
filePathMM< D
,MMD E
trueMMF J
)MMJ K
;MMK L
	LogHelperNN !
.NN! "
AddLogNN" (
(NN( )
dbNN) +
,NN+ ,
LogTypeNN- 4
.NN4 5
DataProcessingNN5 C
,NNC D
OrderNumberNNE P
,NNP Q
amazonFileKeyOO $
+OO% &
$strOO' a
)OOa b
;OOb c
CampaignRR  
campaignRR! )
=RR* +
dbSS 
.SS 
	CampaignsSS (
.SS( )
IncludeSS) 0
(SS0 1
xSS1 2
=>SS3 5
xSS6 7
.SS7 8
SegmentsSS8 @
)SS@ A
.SSA B
FirstOrDefaultSSB P
(SSP Q
xSSQ R
=>SSS U
xSSV W
.SSW X
OrderNumberSSX c
==SSd f
OrderNumberSSg r
)SSr s
;SSs t
varUU 
campaignTestingUU +
=UU, -
dbUU. 0
.UU0 1
CampaignsTestingUU1 A
.UUA B
FirstOrDefaultUUB P
(UUP Q
xUUQ R
=>UUS U
xUUV W
.UUW X

CampaignIdUUX b
==UUc e
campaignUUf n
.UUn o
IdUUo q
)UUq r
;UUr s
campaignTestingVV '
.VV' (
DataFileUrlVV( 3
=VV4 5
amazonFileKeyVV6 C
;VVC D
campaignTestingWW '
.WW' (
DateFetchedWW( 3
=WW4 5
DateTimeWW6 >
.WW> ?
NowWW? B
;WWB C
dbXX 
.XX 
SaveChangesXX &
(XX& '
)XX' (
;XX( )
foreachZZ 
(ZZ  !
varZZ! $
segmentZZ% ,
inZZ- /
campaignZZ0 8
.ZZ8 9
SegmentsZZ9 A
.ZZA B
OrderByZZB I
(ZZI J
xZZJ K
=>ZZL N
xZZO P
.ZZP Q
SegmentNumberZZQ ^
)ZZ^ _
)ZZ_ `
{[[ 
string\\ "
	fileName1\\# ,
=\\- .
string\\/ 5
.\\5 6
Format\\6 <
(\\< =
$str\\= O
,\\O P
campaign\\Q Y
.\\Y Z
OrderNumber\\Z e
,\\e f
segment\\g n
.\\n o
SegmentNumber\\o |
)\\| }
;\\} ~
var]] 
	filePath1]]  )
=]]* +
string]], 2
.]]2 3
Format]]3 9
(]]9 :
$str]]: D
,]]D E

UploadPath]]F P
,]]P Q
	fileName1]]R [
)]][ \
;]]\ ]
var^^ 
data1^^  %
=^^& '
data__  $
.__$ %
Where__% *
(__* +
x__+ ,
=>__- /
x__0 1
.__1 2
Index__2 7
>=__8 :
segment__; B
.__B C
FirstRangeStart__C R
&&__S U
x__V W
.__W X
Index__X ]
<=__^ `
segment__a h
.__h i
FirstRangeEnd__i v
)__v w
.__w x
ToList__x ~
(__~ 
)	__ �
;
__� �
var`` 
data2``  %
=``& '
dataaa  $
.aa$ %
Whereaa% *
(aa* +
xaa+ ,
=>aa- /
xaa0 1
.aa1 2
Indexaa2 7
>=aa8 :
segmentaa; B
.aaB C
SecondRangeStartaaC S
&&aaT V
xaaW X
.aaX Y
IndexaaY ^
<=aa_ a
segmentaab i
.aai j
SecondRangeEndaaj x
)aax y
.bb$ %
ToListbb% +
(bb+ ,
)bb, -
;bb- .
varcc 
data3cc  %
=cc& '
datadd  $
.dd$ %
Wheredd% *
(dd* +
xdd+ ,
=>dd- /
xdd0 1
.dd1 2
Indexdd2 7
>=dd8 :
segmentdd; B
.ddB C
ThirdRangeStartddC R
&&ddS U
xddV W
.ddW X
IndexddX ]
<=dd^ `
segmentdda h
.ddh i
ThirdRangeEndddi v
)ddv w
.ddw x
ToListddx ~
(dd~ 
)	dd �
;
dd� �
data2ee !
.ee! "
AddRangeee" *
(ee* +
data3ee+ 0
)ee0 1
;ee1 2
data1ff !
.ff! "
AddRangeff" *
(ff* +
data2ff+ 0
)ff0 1
;ff1 2
data1gg !
.gg! "
ToCsvgg" '
(gg' (
	filePath1gg( 1
,gg1 2
newgg3 6
CsvDefinitiongg7 D
(ggD E
)ggE F
{hh 
	EndOfLineii  )
=ii* +
$strii, 2
,ii2 3
FieldSeparatorjj  .
=jj/ 0
$charjj1 4
,jj4 5
TextQualifierkk  -
=kk. /
$charkk0 3
,kk3 4
Columnsll  '
=ll( )
newmm$ '
Listmm( ,
<mm, -
stringmm- 3
>mm3 4
{nn$ %
$stroo  /
,oo/ 0
$strpp  +
,pp+ ,
$strqq  *
,qq* +
$strrr  )
,rr) *
$strss  &
,ss& '
$strtt  '
,tt' (
$struu  %
,uu% &
$strvv  &
,vv& '
$strww  %
,ww% &
$strxx  /
,xx/ 0
$stryy  '
}zz$ %
}{{ 
){{ 
;{{ 
string|| "
amazonFileKey1||# 1
=||2 3
string||4 :
.||: ;
Format||; A
(||A B
$str||B S
,||S T
campaign||U ]
.||] ^
OrderNumber||^ i
,||i j
segment||k r
.||r s
SegmentNumber	||s �
)
||� �
;
||� �
S3FileManager}} )
.}}) *
Upload}}* 0
(}}0 1
amazonFileKey1}}1 ?
,}}? @
filePath}}A I
,}}I J
true}}K O
)}}O P
;}}P Q
segment #
.# $
SegmentDataFileUrl$ 6
=7 8
FileManager9 D
.D E
GetFilePathLiveE T
(T U
UploadFileTypeU c
.c d
DataFiled l
,l m
campaign
��  (
.
��( )
OrderNumber
��) 4
,
��4 5
string
��6 <
.
��< =
Empty
��= B
,
��B C
segment
��D K
.
��K L
SegmentNumber
��L Y
)
��Y Z
;
��Z [
segment
�� #
.
��# $
DateFetched
��$ /
=
��0 1
DateTime
��2 :
.
��: ;
Now
��; >
;
��> ?
segment
�� #
.
��# $
UploadStatus
��$ 0
=
��1 2
(
��3 4
int
��4 7
)
��7 8
UploadFileStatus
��8 H
.
��H I
	Completed
��I R
;
��R S
segment
�� #
.
��# $
SegmentStatus
��$ 1
=
��2 3
(
��4 5
int
��5 8
)
��8 9
SegmentStatus
��9 F
.
��F G
	Generated
��G P
;
��P Q
	LogHelper
�� %
.
��% &
AddLog
��& ,
(
��, -
db
��- /
,
��/ 0
LogType
��1 8
.
��8 9
DataProcessing
��9 G
,
��G H
OrderNumber
��I T
,
��T U
amazonFileKey1
��  .
+
��/ 0
$str
��1 k
)
��k l
;
��l m
}
�� 
db
�� 
.
�� 
SaveChanges
�� &
(
��& '
)
��' (
;
��( )
	LogHelper
�� !
.
��! "
AddLog
��" (
(
��( )
db
��) +
,
��+ ,
LogType
��- 4
.
��4 5
DataProcessing
��5 C
,
��C D
OrderNumber
��E P
,
��P Q
$str
��R z
)
��z {
;
��{ |
}
�� 
catch
�� 
(
�� 
	Exception
�� $
ex
��% '
)
��' (
{
�� 
	LogHelper
�� !
.
��! "
AddError
��" *
(
��* +
db
��+ -
,
��- .
LogType
��/ 6
.
��6 7
DataProcessing
��7 E
,
��E F
OrderNumber
��G R
,
��R S
$str
��T z
+
��{ |
ex
��} 
.�� �
Message��� �
)��� �
;��� �
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
	LogHelper
�� 
.
�� 
AddError
�� &
(
��& '
db
��' )
,
��) *
LogType
��+ 2
.
��2 3
DataProcessing
��3 A
,
��A B
OrderNumber
��C N
,
��N O
$str
��P c
+
��d e
ZipCodeFile
��f q
+
��r s
$str
��t w
+
��x y
ex
��z |
.
��| }
Message��} �
)��� �
;��� �
}
�� 
}
�� 
}
�� 	
}
�� 
}�� ��
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\MailChimpProcessor.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Async 
{ 
public 

class 
MailChimpProcessor #
{ 
public 
MailChimpProcessor !
(! "
)" #
{ 	
} 	
public 
static 
void 
QucikTestSend (
(( )

CreativeVM) 3
model4 9
)9 :
{ 	
string 

campaignId !
=" #$
CreateCampignWithContent$ <
(< =
model= B
)B C
;C D!
QuickTestSendCampaign %
(% &
model& +
,+ ,

campaignId- 7
,7 8
model9 >
.> ?
QuickTestEmails? N
.N O
SplitO T
(T U
$strU X
.X Y
ToCharArrayY d
(d e
)e f
)f g
)g h
;h i
} 	
private 
static 
void !
QuickTestSendCampaign 1
(1 2

CreativeVM2 <
model= B
,B C
stringD J

campaignIdK U
,U V
stringW ]
[] ^
]^ _

testEmails` j
)j k
{   	
IMailChimpManager!! 
manager!! %
=!!& '
new!!( +
MailChimpManager!!, <
(!!< =
)!!= >
;!!> ?
var"" 
testSend"" 
="" 
manager"" "
.""" #
	Campaigns""# ,
."", -
	TestAsync""- 6
(""6 7

campaignId""7 A
,""A B
new""C F
CampaignTestRequest""G Z
{## 
Emails%% 
=%% 

testEmails%% #
,%%# $
	EmailType&& 
=&& 
$str&& "
}'' 
)'' 
.'' 
ConfigureAwait'' 
('' 
false'' #
)''# $
;''$ %
})) 	
public++ 
static++ 
void++ 
TestSend++ #
(++# $

CreativeVM++$ .
model++/ 4
)++4 5
{,, 	
using-- 
(-- 
var-- 
db-- 
=-- 
new-- 
WfpictContext--  -
(--- .
)--. /
)--/ 0
{.. 
var// 
logs// 
=// 
db// 
.// 

SystemLogs// (
.//( )
Where//) .
(//. /
x/// 0
=>//1 3
x//4 5
.//5 6
OrderNumber//6 A
==//B D
model//E J
.//J K
OrderNumber//K V
&&//W Y
x//Z [
.//[ \
LogType//\ c
==//d f
(//g h
int//h k
)//k l
LogType//l s
.//s t
	MailChimp//t }
)//} ~
;//~ 
foreach00 
(00 
var00 
log00  
in00! #
logs00$ (
)00( )
{11 
db22 
.22 

SystemLogs22 !
.22! "
Remove22" (
(22( )
log22) ,
)22, -
;22- .
}33 
db44 
.44 
SaveChanges44 
(44 
)44  
;44  !
	LogHelper66 
.66 
AddLog66  
(66  !
db66! #
,66# $
LogType66% ,
.66, -
	MailChimp66- 6
,666 7
model668 =
.66= >
OrderNumber66> I
,66I J
$str66K p
+66q r
model66s x
.66x y
OrderNumber	66y �
)
66� �
;
66� �
string77 
listId77 
=77 

CreateList77  *
(77* +
db77+ -
,77- .
model77/ 4
)774 5
;775 6
CreateMembers88 
(88 
db88  
,88  !
listId88" (
,88( )
model88* /
)88/ 0
;880 1
Thread;; 
.;; 
Sleep;; 
(;; 
$num;; !
*;;" #
$num;;$ &
*;;' (
$num;;) *
);;* +
;;;+ ,
int>> 

templateId>> 
=>>  
CreateTemplate>>! /
(>>/ 0
db>>0 2
,>>2 3
model>>4 9
)>>9 :
;>>: ;
string@@ 

campaignId@@ !
=@@" #%
CreateCampignWithTemplate@@$ =
(@@= >
db@@> @
,@@@ A
model@@B G
,@@G H
listId@@I O
,@@O P

templateId@@Q [
)@@[ \
;@@\ ]
SendCampaignBB 
(BB 
dbBB 
,BB  
modelBB! &
,BB& '

campaignIdBB( 2
)BB2 3
;BB3 4
	LogHelperDD 
.DD 
AddLogDD  
(DD  !
dbDD! #
,DD# $
LogTypeDD% ,
.DD, -
	MailChimpDD- 6
,DD6 7
modelDD8 =
.DD= >
OrderNumberDD> I
,DDI J
$strDDK n
)DDn o
;DDo p
}EE 
}FF 	
privateHH 
staticHH 
voidHH 
SendCampaignHH (
(HH( )
WfpictContextHH) 6
dbHH7 9
,HH9 :

CreativeVMHH; E
modelHHF K
,HHK L
stringHHM S

campaignIdHHT ^
)HH^ _
{II 	
IMailChimpManagerJJ 
managerJJ %
=JJ& '
newJJ( +
MailChimpManagerJJ, <
(JJ< =
)JJ= >
;JJ> ?
	LogHelperKK 
.KK 
AddLogKK 
(KK 
dbKK 
,KK  
LogTypeKK! (
.KK( )
	MailChimpKK) 2
,KK2 3
modelKK4 9
.KK9 :
OrderNumberKK: E
,KKE F
$strKKG ]
)KK] ^
;KK^ _
varLL 
sentLL 
=LL 
managerLL 
.LL 
	CampaignsLL (
.LL( )
	SendAsyncLL) 2
(LL2 3

campaignIdLL3 =
)LL= >
.LL> ?
ConfigureAwaitLL? M
(LLM N
falseLLN S
)LLS T
;LLT U
}NN 	
privatePP 
staticPP 
stringPP $
CreateCampignWithContentPP 6
(PP6 7

CreativeVMPP7 A
modelPPB G
)PPG H
{QQ 	
IMailChimpManagerRR 
managerRR %
=RR& '
newRR( +
MailChimpManagerRR, <
(RR< =
)RR= >
;RR> ?
varTT 
campaignTT 
=TT 
managerTT "
.TT" #
	CampaignsTT# ,
.TT, -
AddAsyncTT- 5
(TT5 6
newTT6 9
	MailChimpTT: C
.TTC D
NetTTD G
.TTG H
ModelsTTH N
.TTN O
CampaignTTO W
{UU 
SettingsVV 
=VV 
newVV 
SettingVV &
{WW 
ReplyToXX 
=XX 
$strXX <
,XX< =
TitleYY 
=YY 
modelYY !
.YY! "
SubjectLineYY" -
,YY- .
FromNameZZ 
=ZZ 
$strZZ ,
,ZZ, -
SubjectLine[[ 
=[[  !
model[[" '
.[[' (
SubjectLine[[( 3
,[[3 4
}\\ 
,\\ 
Type]] 
=]] 
CampaignType]] #
.]]# $
Regular]]$ +
,]]+ ,
}^^ 
)^^ 
.^^ 
ConfigureAwait^^ 
(^^ 
false^^ #
)^^# $
;^^$ %
var`` 

campaignId`` 
=`` 
campaign`` %
.``% &

GetAwaiter``& 0
(``0 1
)``1 2
.``2 3
	GetResult``3 <
(``< =
)``= >
.``> ?
Id``? A
;``A B
varbb 
contentbb 
=bb 
newbb 
ContentRequestbb ,
{cc 
Htmlee 
=ee 
modelee 
.ee 
	Creativesee &
,ee& '
}ff 
;ff 
managergg 
.gg 
Contentgg 
.gg 
AddOrUpdateAsyncgg ,
(gg, -

campaignIdgg- 7
,gg7 8
contentgg9 @
)gg@ A
;ggA B
returnhh 

campaignIdhh 
;hh 
}ii 	
privatekk 
statickk 
stringkk %
CreateCampignWithTemplatekk 7
(kk7 8
WfpictContextkk8 E
dbkkF H
,kkH I

CreativeVMkkJ T
modelkkU Z
,kkZ [
stringkk\ b
listIdkkc i
,kki j
intkkk n

templateIdkko y
)kky z
{ll 	
IMailChimpManagermm 
managermm %
=mm& '
newmm( +
MailChimpManagermm, <
(mm< =
)mm= >
;mm> ?
	LogHelpernn 
.nn 
AddLognn 
(nn 
dbnn 
,nn  
LogTypenn! (
.nn( )
	MailChimpnn) 2
,nn2 3
modelnn4 9
.nn9 :
OrderNumbernn: E
,nnE F
$strnnG h
)nnh i
;nni j
varoo 
campaignoo 
=oo 
manageroo "
.oo" #
	Campaignsoo# ,
.oo, -
AddAsyncoo- 5
(oo5 6
newoo6 9
	MailChimpoo: C
.ooC D
NetooD G
.ooG H
ModelsooH N
.ooN O
CampaignooO W
{pp 

Recipientsqq 
=qq 
newqq  
	Recipientqq! *
{rr 
ListIdss 
=ss 
listIdss #
}tt 
,tt 
Settingsuu 
=uu 
newuu 
Settinguu &
{vv 
ReplyToww 
=ww 
$strww <
,ww< =
Titlexx 
=xx 
modelxx !
.xx! "
SubjectLinexx" -
,xx- .
FromNameyy 
=yy 
$stryy ,
,yy, -
SubjectLinezz 
=zz  !
modelzz" '
.zz' (
SubjectLinezz( 3
,zz3 4

TemplateId{{ 
={{  

templateId{{! +
,{{+ ,
}|| 
,|| 
Type}} 
=}} 
CampaignType}} #
.}}# $
Regular}}$ +
,}}+ ,
}~~ 
)~~ 
.~~ 
ConfigureAwait~~ 
(~~ 
false~~ #
)~~# $
;~~$ %
var
�� 

campaignId
�� 
=
�� 
campaign
�� %
.
��% &

GetAwaiter
��& 0
(
��0 1
)
��1 2
.
��2 3
	GetResult
��3 <
(
��< =
)
��= >
.
��> ?
Id
��? A
;
��A B
return
�� 

campaignId
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
int
�� 
CreateTemplate
�� )
(
��) *
WfpictContext
��* 7
db
��8 :
,
��: ;

CreativeVM
��< F
model
��G L
)
��L M
{
�� 	
IMailChimpManager
�� 
manager
�� %
=
��& '
new
��( +
MailChimpManager
��, <
(
��< =
)
��= >
;
��> ?
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
	MailChimp
��) 2
,
��2 3
model
��4 9
.
��9 :
OrderNumber
��: E
,
��E F
$str
��G i
)
��i j
;
��j k
var
�� !
allTemplatesRequest
�� #
=
��$ %
manager
��& -
.
��- .
	Templates
��. 7
.
��7 8
GetAllAsync
��8 C
(
��C D
)
��D E
.
��E F
ConfigureAwait
��F T
(
��T U
false
��U Z
)
��Z [
;
��[ \
var
�� 
allTemplates
�� 
=
�� !
allTemplatesRequest
�� 2
.
��2 3

GetAwaiter
��3 =
(
��= >
)
��> ?
.
��? @
	GetResult
��@ I
(
��I J
)
��J K
;
��K L
int
�� 
templateIdOld
�� 
=
�� 
-
��  !
$num
��! "
;
��" #
foreach
�� 
(
�� 
var
�� 
allTemplate
�� $
in
��% '
allTemplates
��( 4
)
��4 5
{
�� 
if
�� 
(
�� 
allTemplate
�� 
.
��  
Name
��  $
==
��% '
model
��( -
.
��- .
OrderNumber
��. 9
)
��9 :
{
�� 
templateIdOld
�� !
=
��" #
allTemplate
��$ /
.
��/ 0
Id
��0 2
;
��2 3
break
�� 
;
�� 
}
�� 
}
�� 
if
�� 
(
�� 
templateIdOld
�� 
!=
��  
-
��! "
$num
��" #
)
��# $
{
�� 
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
	MailChimp
��- 6
,
��6 7
model
��8 =
.
��= >
OrderNumber
��> I
,
��I J
$str
��K V
+
��W X
model
��Y ^
.
��^ _
OrderNumber
��_ j
+
��k l
$str��m �
)��� �
;��� �
var
�� #
deleteTemplateRequest
�� )
=
��* +
manager
��, 3
.
��3 4
	Templates
��4 =
.
��= >
DeleteAsync
��> I
(
��I J
templateIdOld
��J W
.
��W X
ToString
��X `
(
��` a
)
��a b
)
��b c
.
��c d
ConfigureAwait
��d r
(
��r s
false
��s x
)
��x y
;
��y z
}
�� 
var
�� 
template
�� 
=
�� 
manager
�� "
.
��" #
	Templates
��# ,
.
��, -
CreateAsync
��- 8
(
��8 9
model
��9 >
.
��> ?
OrderNumber
��? J
,
��J K
$str
��L N
,
��N O
model
��P U
.
��U V
	Creatives
��V _
)
��_ `
.
��` a
ConfigureAwait
��a o
(
��o p
false
��p u
)
��u v
;
��v w
var
�� 

templateId
�� 
=
�� 
template
�� %
.
��% &

GetAwaiter
��& 0
(
��0 1
)
��1 2
.
��2 3
	GetResult
��3 <
(
��< =
)
��= >
.
��> ?
Id
��? A
;
��A B
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
	MailChimp
��) 2
,
��2 3
model
��4 9
.
��9 :
OrderNumber
��: E
,
��E F
$str
��G q
)
��q r
;
��r s
return
�� 

templateId
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� "
CreateTemplateFolder
�� 0
(
��0 1

CreativeVM
��1 ;
model
��< A
)
��A B
{
�� 	
IMailChimpManager
�� 
manager
�� %
=
��& '
new
��( +
MailChimpManager
��, <
(
��< =
)
��= >
;
��> ?
var
�� 
folder
�� 
=
�� 
manager
�� 
.
��  
TemplateFolders
��  /
.
��/ 0
AddAsync
��0 8
(
��8 9
model
��9 >
.
��> ?
OrderNumber
��? J
)
��J K
.
��K L
ConfigureAwait
��L Z
(
��Z [
false
��[ `
)
��` a
;
��a b
var
�� 
folderStatus
�� 
=
�� 
folder
�� %
.
��% &

GetAwaiter
��& 0
(
��0 1
)
��1 2
.
��2 3
	GetResult
��3 <
(
��< =
)
��= >
;
��> ?
}
�� 	
private
�� 
static
�� 
void
�� 
CreateMembers
�� )
(
��) *
WfpictContext
��* 7
db
��8 :
,
��: ;
string
��< B
listId
��C I
,
��I J

CreativeVM
��K U
model
��V [
)
��[ \
{
�� 	
IMailChimpManager
�� 
manager
�� %
=
��& '
new
��( +
MailChimpManager
��, <
(
��< =
)
��= >
;
��> ?
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
	MailChimp
��) 2
,
��2 3
model
��4 9
.
��9 :
OrderNumber
��: E
,
��E F
$str
��G Y
)
��Y Z
;
��Z [
foreach
�� 
(
�� 
var
�� 
email
�� 
in
�� !
model
��" '
.
��' (

TestEmails
��( 2
)
��2 3
{
�� 
var
�� 
member
�� 
=
�� 
new
��  
Member
��! '
{
��( )
EmailAddress
��* 6
=
��7 8
email
��9 >
.
��> ?
Text
��? C
,
��C D
StatusIfNew
��E P
=
��Q R
Status
��S Y
.
��Y Z

Subscribed
��Z d
}
��e f
;
��f g
var
�� 
memberResult
��  
=
��! "
manager
��# *
.
��* +
Members
��+ 2
.
��2 3
AddOrUpdateAsync
��3 C
(
��C D
listId
��D J
,
��J K
member
��L R
)
��R S
.
��S T
ConfigureAwait
��T b
(
��b c
false
��c h
)
��h i
;
��i j
var
�� 
result
�� 
=
�� 
memberResult
�� )
.
��) *

GetAwaiter
��* 4
(
��4 5
)
��5 6
.
��6 7
	GetResult
��7 @
(
��@ A
)
��A B
;
��B C
var
�� 
exists
�� 
=
�� 
manager
�� $
.
��$ %
Members
��% ,
.
��, -
ExistsAsync
��- 8
(
��8 9
listId
��9 ?
,
��? @
email
��A F
.
��F G
Text
��G K
)
��K L
.
��L M
Result
��M S
;
��S T
}
�� 
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
	MailChimp
��) 2
,
��2 3
model
��4 9
.
��9 :
OrderNumber
��: E
,
��E F
$str
��G f
)
��f g
;
��g h
}
�� 	
private
�� 
static
�� 
string
�� 

CreateList
�� (
(
��( )
WfpictContext
��) 6
db
��7 9
,
��9 :

CreativeVM
��; E
model
��F K
)
��K L
{
�� 	
bool
�� 
isListExists
�� 
=
�� 
false
��  %
;
��% &
string
�� 
listId
�� 
=
�� 
string
�� "
.
��" #
Empty
��# (
;
��( )
IMailChimpManager
�� 
manager
�� %
=
��& '
new
��( +
MailChimpManager
��, <
(
��< =
)
��= >
;
��> ?
var
�� 
lists
�� 
=
�� 
manager
�� 
.
��  
Lists
��  %
.
��% &
GetAllAsync
��& 1
(
��1 2
)
��2 3
.
��3 4
ConfigureAwait
��4 B
(
��B C
false
��C H
)
��H I
;
��I J
foreach
�� 
(
�� 
var
�� 
list
�� 
in
��  
lists
��! &
.
��& '

GetAwaiter
��' 1
(
��1 2
)
��2 3
.
��3 4
	GetResult
��4 =
(
��= >
)
��> ?
)
��? @
{
�� 
if
�� 
(
�� 
list
�� 
.
�� 
Name
�� 
==
��  
model
��! &
.
��& '
OrderNumber
��' 2
)
��2 3
{
�� 
isListExists
��  
=
��! "
true
��# '
;
��' (
listId
�� 
=
�� 
list
�� !
.
��! "
Id
��" $
;
��$ %
break
�� 
;
�� 
}
�� 
}
�� 
if
�� 
(
�� 
isListExists
�� 
)
�� 
{
�� 
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
	MailChimp
��- 6
,
��6 7
model
��8 =
.
��= >
OrderNumber
��> I
,
��I J
$str
��K R
+
��S T
model
��U Z
.
��Z [
OrderNumber
��[ f
+
��g h
$str
��i {
)
��{ |
;
��| }
}
�� 
else
�� 
{
�� 
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
	MailChimp
��- 6
,
��6 7
model
��8 =
.
��= >
OrderNumber
��> I
,
��I J
$str
��K Z
)
��Z [
;
��[ \
var
�� 
testList
�� 
=
�� 
manager
�� &
.
��& '
Lists
��' ,
.
��, -
AddOrUpdateAsync
��- =
(
��= >
new
�� 
List
��  
(
��  !
)
��! "
{
�� 
Name
��  
=
��! "
model
��# (
.
��( )
OrderNumber
��) 4
,
��4 5 
PermissionReminder
�� .
=
��/ 0
$str
��1 7
,
��7 8
Contact
�� #
=
��$ %
new
��& )
Contact
��* 1
{
�� 
Address1
��  (
=
��) *
$str
��+ 1
,
��1 2
City
��  $
=
��% &
$str
��' 3
,
��3 4
Country
��  '
=
��( )
$str
��* /
,
��/ 0
State
��  %
=
��& '
$str
��( ,
,
��, -
Zip
��  #
=
��$ %
$str
��& -
,
��- .
Company
��  '
=
��( )
$str
��* 0
}
�� 
,
�� 
CampaignDefaults
�� ,
=
��- .
new
��/ 2
CampaignDefaults
��3 C
{
�� 
	FromEmail
��  )
=
��* +
$str
��, K
,
��K L
FromName
��  (
=
��) *
model
��+ 0
.
��0 1
FromLine
��1 9
,
��9 :
Language
��  (
=
��) *
$str
��+ /
,
��/ 0
Subject
��  '
=
��( )
model
��* /
.
��/ 0
SubjectLine
��0 ;
}
�� 
}
�� 
)
�� 
.
�� 
ConfigureAwait
�� )
(
��) *
false
��* /
)
��/ 0
;
��0 1
var
�� 
list
�� 
=
�� 
testList
�� #
.
��# $

GetAwaiter
��$ .
(
��. /
)
��/ 0
.
��0 1
	GetResult
��1 :
(
��: ;
)
��; <
;
��< =
listId
�� 
=
�� 
list
�� 
.
�� 
Id
��  
;
��  !
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
	MailChimp
��- 6
,
��6 7
model
��8 =
.
��= >
OrderNumber
��> I
,
��I J
$str
��K g
)
��g h
;
��h i
}
�� 
return
�� 
listId
�� 
;
�� 
}
�� 	
}
�� 
}�� �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\ProDataHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
ProData 
{ 
public 

class 
ProDataHelper 
{ 
public 
static 
int 
GetIndex "
(" #
string# )
ReportSiteURL* 7
)7 8
{ 	
var 
parts 
= 
ReportSiteURL %
.% &
Split& +
(+ ,
$char, /
)/ 0
;0 1
return		 
int		 
.		 
Parse		 
(		 
parts		 "
[		" #
parts		# (
.		( )
Length		) /
-		0 1
$num		2 3
]		3 4
)		4 5
;		5 6
}

 	
} 
} ؊
JE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\AccountController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
AccountController "
:# $
BaseController% 3
{ 
private "
ApplicationUserManager &
_userManager' 3
;3 4
private $
ApplicationSignInManager (
_signInManager) 7
;7 8
public 
AccountController  
(  !
)! "
{ 	
} 	
public 
AccountController  
(  !"
ApplicationUserManager! 7
userManager8 C
,C D$
ApplicationSignInManagerE ]
signInManager^ k
)l m
{ 	
UserManager 
= 
userManager %
;% &
SignInManager 
= 
signInManager )
;) *
} 	
public "
ApplicationUserManager %
UserManager& 1
{ 	
get   
{!! 
return"" 
_userManager"" #
??""$ &
HttpContext""' 2
.""2 3
GetOwinContext""3 A
(""A B
)""B C
.""C D
GetUserManager""D R
<""R S"
ApplicationUserManager""S i
>""i j
(""j k
)""k l
;""l m
}## 
set$$ 
{%% 
_userManager&& 
=&& 
value&& $
;&&$ %
}'' 
}(( 	
public** $
ApplicationSignInManager** '
SignInManager**( 5
{++ 	
get,, 
{-- 
return.. 
_signInManager.. %
??..& (
HttpContext..) 4
...4 5
GetOwinContext..5 C
(..C D
)..D E
...E F
Get..F I
<..I J$
ApplicationSignInManager..J b
>..b c
(..c d
)..d e
;..e f
}// 
private00 
set00 
{11 
_signInManager22 
=22  
value22! &
;22& '
}33 
}44 	
[88 	
AllowAnonymous88	 
]88 
public99 
ActionResult99 
Login99 !
(99! "
string99" (
	returnUrl99) 2
)992 3
{:: 	
ViewBag;; 
.;; 
	ReturnUrl;; 
=;; 
	returnUrl;;  )
;;;) *
if<< 
(<< 
LoggedInUser<< 
!=<< 
null<<  $
)<<$ %
{== 
if>> 
(>> 
	returnUrl>> 
!=>>  
null>>! %
)>>% &
return?? 
Redirect?? #
(??# $
	returnUrl??$ -
)??- .
;??. /
else@@ 
returnAA 
RedirectToActionAA +
(AA+ ,
$strAA, 3
,AA3 4
$strAA5 ;
)AA; <
;AA< =
}BB 
elseCC 
returnDD 
ViewDD 
(DD 
)DD 
;DD 
}EE 	
[II 	
HttpPostII	 
]II 
[JJ 	
AllowAnonymousJJ	 
]JJ 
[KK 	$
ValidateAntiForgeryTokenKK	 !
]KK! "
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
>LL& '
LoginLL( -
(LL- .
LoginViewModelLL. <
modelLL= B
,LLB C
stringLLD J
	returnUrlLLK T
)LLT U
{MM 	
tryPP 
{QQ 
ifRR 
(RR 
!RR 

ModelStateRR 
.RR  
IsValidRR  '
)RR' (
{SS 
stringTT 
errorsTT !
=TT" #
stringTT$ *
.TT* +
EmptyTT+ 0
;TT0 1
foreachUU 
(UU 
varUU  
msUU! #
inUU$ &

ModelStateUU' 1
.UU1 2
ValuesUU2 8
)UU8 9
{VV 
foreachWW 
(WW  !
varWW! $
errorWW% *
inWW+ -
msWW. 0
.WW0 1
ErrorsWW1 7
)WW7 8
{XX 
errorsYY "
+=YY# %
errorYY& +
.YY+ ,
ErrorMessageYY, 8
+YY9 :
$strYY: A
;YYA B
}ZZ 
}[[ 
if\\ 
(\\ 
!\\ 
string\\ 
.\\  
IsNullOrEmpty\\  -
(\\- .
errors\\. 4
)\\4 5
)\\5 6
throw]] 
new]] !
	Exception]]" +
(]]+ ,
errors]], 2
)]]2 3
;]]3 4
}^^ 
var`` 
result`` 
=`` 
await`` "
SignInManager``# 0
.``0 1
PasswordSignInAsync``1 D
(``D E
model``E J
.``J K
Username``K S
,``S T
model``U Z
.``Z [
Password``[ c
,``c d
model``e j
.``j k

RememberMe``k u
,``u v
shouldLockout	``w �
:
``� �
false
``� �
)
``� �
;
``� �
switchaa 
(aa 
resultaa 
)aa 
{bb 
casecc 
SignInStatuscc %
.cc% &
Successcc& -
:cc- .
SetupLoggedInUserdd )
(dd) *
modeldd* /
.dd/ 0
Usernamedd0 8
)dd8 9
;dd9 :
returnee 
Jsonee #
(ee# $
newee$ '
JsonResponseee( 4
(ee4 5
)ee5 6
{ee7 8
IsSucessee9 A
=eeB C
trueeeD H
}eeI J
,eeJ K
JsonRequestBehavioreeL _
.ee_ `
AllowGetee` h
)eeh i
;eei j
casegg 
SignInStatusgg %
.gg% & 
RequiresVerificationgg& :
:gg: ;
returnqq 
RedirectToLocalqq .
(qq. /
	returnUrlqq/ 8
)qq8 9
;qq9 :
casett 
SignInStatustt %
.tt% &
	LockedOuttt& /
:tt/ 0
throwuu 
newuu !
	Exceptionuu" +
(uu+ ,
$struu, <
)uu< =
;uu= >
caseww 
SignInStatusww %
.ww% &
Failureww& -
:ww- .
throwxx 
newxx !
	Exceptionxx" +
(xx+ ,
$strxx, P
)xxP Q
;xxQ R
defaultyy 
:yy 
throwzz 
newzz !
	Exceptionzz" +
(zz+ ,
$strzz, P
)zzP Q
;zzQ R
}}} 
} 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
[
�� 	
	Authorize
��	 
]
�� 
public
�� 
ActionResult
�� 
LogOff
�� "
(
��" #
)
��# $
{
�� 	
Session
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
Session
�� 
.
�� 
Abandon
�� 
(
�� 
)
�� 
;
�� #
AuthenticationManager
�� !
.
��! "
SignOut
��" )
(
��) *(
DefaultAuthenticationTypes
��* D
.
��D E
ApplicationCookie
��E V
)
��V W
;
��W X
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 6
)
��6 7
;
��7 8
}
�� 	
[
�� 	
AllowAnonymous
��	 
]
�� 
public
�� 
ActionResult
�� 
Register
�� $
(
��$ %
)
��% &
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
AllowAnonymous
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
Register
��( 0
(
��0 1
RegisterViewModel
��1 B
model
��C H
)
��H I
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
var
�� 
appUser
�� 
=
�� 
new
�� !
WfpUser
��" )
{
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� %
(
��% &
)
��& '
.
��' (
ToString
��( 0
(
��0 1
)
��1 2
,
��2 3
	CreatedAt
�� 
=
�� 
DateTime
��  (
.
��( )
Now
��) ,
,
��, -
UserName
�� 
=
�� 
model
�� $
.
��$ %
UserName
��% -
,
��- .
Email
�� 
=
�� 
model
�� !
.
��! "
Email
��" '
,
��' (
Status
�� 
=
�� 
(
�� 
int
�� !
)
��! "

UserStatus
��" ,
.
��, -
Active
��- 3
,
��3 4
UserType
�� 
=
�� 
model
�� $
.
��$ %
IsAdminUser
��% 0
?
��1 2
(
��3 4
int
��4 7
)
��7 8
UserType
��8 @
.
��@ A
Admin
��A F
:
��F G
(
��H I
int
��I L
)
��L M
UserType
��M U
.
��U V
User
��V Z
,
��Z [
	IsUsesApi
�� 
=
�� 
model
��  %
.
��% &
	IsUsesAPI
��& /
,
��/ 0
IsTestsCreatives
�� $
=
��% &
model
��' ,
.
��, -
IsTestsCreatives
��- =
}
�� 
;
�� 
var
�� 
result
�� 
=
�� 
UserManager
�� (
.
��( )
CreateAsync
��) 4
(
��4 5
appUser
��5 <
,
��< =
model
��> C
.
��C D
Password
��D L
)
��L M
;
��M N
if
�� 
(
�� 
result
�� 
.
�� 
Result
�� !
==
��" $
IdentityResult
��% 3
.
��3 4
Success
��4 ;
)
��; <
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 3
,
��3 4
$str
��5 ;
)
��; <
;
��< =
}
�� 
	AddErrors
�� 
(
�� 
result
��  
.
��  !
Result
��! '
)
��' (
;
��( )
}
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
AllowAnonymous
��	 
]
�� 
public
�� 
ActionResult
�� "
ExternalLoginFailure
�� 0
(
��0 1
)
��1 2
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
override
�� 
void
�� 
Dispose
��  '
(
��' (
bool
��( ,
	disposing
��- 6
)
��6 7
{
�� 	
if
�� 
(
�� 
	disposing
�� 
)
�� 
{
�� 
if
�� 
(
�� 
_userManager
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
_userManager
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
_userManager
��  
=
��! "
null
��# '
;
��' (
}
�� 
if
�� 
(
�� 
_signInManager
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
_signInManager
�� "
.
��" #
Dispose
��# *
(
��* +
)
��+ ,
;
��, -
_signInManager
�� "
=
��# $
null
��% )
;
��) *
}
�� 
}
�� 
base
�� 
.
�� 
Dispose
�� 
(
�� 
	disposing
�� "
)
��" #
;
��# $
}
�� 	
private
�� 
const
�� 
string
�� 
XsrfKey
�� $
=
��% &
$str
��' /
;
��/ 0
private
�� $
IAuthenticationManager
�� &#
AuthenticationManager
��' <
{
�� 	
get
�� 
{
�� 
return
�� 
HttpContext
�� "
.
��" #
GetOwinContext
��# 1
(
��1 2
)
��2 3
.
��3 4
Authentication
��4 B
;
��B C
}
�� 
}
�� 	
private
�� 
void
�� 
	AddErrors
�� 
(
�� 
IdentityResult
�� -
result
��. 4
)
��4 5
{
�� 	
foreach
�� 
(
�� 
var
�� 
error
�� 
in
�� !
result
��" (
.
��( )
Errors
��) /
)
��/ 0
{
�� 

ModelState
�� 
.
�� 
AddModelError
�� (
(
��( )
$str
��) +
,
��+ ,
error
��- 2
)
��2 3
;
��3 4
}
�� 
}
�� 	
private
�� 
ActionResult
�� 
RedirectToLocal
�� ,
(
��, -
string
��- 3
	returnUrl
��4 =
)
��= >
{
�� 	
if
�� 
(
�� 
Url
�� 
.
�� 

IsLocalUrl
�� 
(
�� 
	returnUrl
�� (
)
��( )
)
��) *
{
�� 
return
�� 
Redirect
�� 
(
��  
	returnUrl
��  )
)
��) *
;
��* +
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 3
)
��3 4
;
��4 5
}
�� 	
internal
�� 
class
�� 
ChallengeResult
�� &
:
��' ($
HttpUnauthorizedResult
��) ?
{
�� 	
public
�� 
ChallengeResult
�� "
(
��" #
string
��# )
provider
��* 2
,
��2 3
string
��4 :
redirectUri
��; F
)
��F G
:
�� 
this
�� 
(
�� 
provider
�� 
,
��  
redirectUri
��! ,
,
��, -
null
��. 2
)
��2 3
{
�� 
}
�� 
public
�� 
ChallengeResult
�� "
(
��" #
string
��# )
provider
��* 2
,
��2 3
string
��4 :
redirectUri
��; F
,
��F G
string
��H N
userId
��O U
)
��U V
{
�� 
LoginProvider
�� 
=
�� 
provider
��  (
;
��( )
RedirectUri
�� 
=
�� 
redirectUri
�� )
;
��) *
UserId
�� 
=
�� 
userId
�� 
;
��  
}
�� 
public
�� 
string
�� 
LoginProvider
�� '
{
��( )
get
��* -
;
��- .
set
��/ 2
;
��2 3
}
��4 5
public
�� 
string
�� 
RedirectUri
�� %
{
��& '
get
��( +
;
��+ ,
set
��- 0
;
��0 1
}
��2 3
public
�� 
string
�� 
UserId
��  
{
��! "
get
��# &
;
��& '
set
��( +
;
��+ ,
}
��- .
public
�� 
override
�� 
void
��  
ExecuteResult
��! .
(
��. /
ControllerContext
��/ @
context
��A H
)
��H I
{
�� 
var
�� 

properties
�� 
=
��  
new
��! $&
AuthenticationProperties
��% =
{
��> ?
RedirectUri
��@ K
=
��L M
RedirectUri
��N Y
}
��Z [
;
��[ \
if
�� 
(
�� 
UserId
�� 
!=
�� 
null
�� "
)
��" #
{
�� 

properties
�� 
.
�� 

Dictionary
�� )
[
��) *
XsrfKey
��* 1
]
��1 2
=
��3 4
UserId
��5 ;
;
��; <
}
�� 
context
�� 
.
�� 
HttpContext
�� #
.
��# $
GetOwinContext
��$ 2
(
��2 3
)
��3 4
.
��4 5
Authentication
��5 C
.
��C D
	Challenge
��D M
(
��M N

properties
��N X
,
��X Y
LoginProvider
��Z g
)
��g h
;
��h i
}
�� 
}
�� 	
}
�� 
}�� �Y
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\API\AdsController.cs
	namespace

 	
WFP


 
.

 
ICT

 
.

 
Web

 
.

 
API

 
{ 
public 

class 
AdsController 
:  
ApiController! .
{ 
private 
readonly 
string '
AuthenticationParameterName  ;
=< =
$str> J
;J K
private 
readonly 
int 
APIMaxDailyLimit -
=. /
$num0 2
;2 3
private 
WfpictContext 
db  
=! "
new# &
WfpictContext' 4
(4 5
)5 6
;6 7
public 

JsonResult 
< 
JsonResponse &
>& '
Get( +
(+ ,
), -
{ 	
try 
{ 
if 
( 
! 
Request 
. 
Headers $
.$ %
Contains% -
(- .'
AuthenticationParameterName. I
)I J
)J K
{ 
throw 
new 
	Exception '
(' (
$str( K
)K L
;L M
} 
string 
token 
= 
Request &
.& '
Headers' .
.. /
	GetValues/ 8
(8 9'
AuthenticationParameterName9 T
)T U
.U V
FirstV [
([ \
)\ ]
;] ^
var   
user   
=   
db   
.   
Users   #
.  # $
FirstOrDefault  $ 2
(  2 3
x  3 4
=>  5 7
x  8 9
.  9 :
ApiKey  : @
.  @ A
Equals  A G
(  G H
token  H M
)  M N
)  N O
;  O P
var!! 
isValidUser!! 
=!!  !
user!!" &
!=!!' )
null!!* .
;!!. /
if"" 
("" 
!"" 
isValidUser""  
)""  !
{## 
throw$$ 
new$$ 
	Exception$$ '
($$' (
$str$$( H
)$$H I
;$$I J
}%% 
int'' 
todaysRequests'' "
=''# $
db(( 
.(( 
ApiRequests(( "
.((" #
ToList((# )
((() *
)((* +
.((+ ,
Count((, 1
(((1 2
x((2 3
=>((4 6
x((7 8
.((8 9
APIKey((9 ?
==((@ B
token((C H
&&((I K
x((L M
.((M N
	CreatedAt((N W
.((W X
Date((X \
==((] _
DateTime((` h
.((h i
Now((i l
.((l m
Date((m q
)((q r
;((r s
if)) 
()) 
todaysRequests)) "
>))# $
APIMaxDailyLimit))% 5
)))5 6
{** 
throw++ 
new++ 
	Exception++ '
(++' (
$str++( >
+++? @
APIMaxDailyLimit++A Q
+++R S
$str,,( N
),,N O
;,,O P
}-- 
db// 
.// 
ApiRequests// 
.// 
Add// "
(//" #
new//# &

ApiRequest//' 1
(//1 2
)//2 3
{00 
Id11 
=11 
Guid11 
.11 
NewGuid11 %
(11% &
)11& '
,11' (
	CreatedAt22 
=22 
DateTime22  (
.22( )
Now22) ,
,22, -
APIKey33 
=33 
token33 "
}44 
)44 
;44 
db55 
.55 
SaveChanges55 
(55 
)55  
;55  !
var77 
	campaigns77 
=77 
db77  "
.77" #
	Campaigns77# ,
.88 
Include88 
(88 
x88 
=>88 !
x88" #
.88# $
ProDatas88$ ,
)88, -
.99 
Include99 
(99 
x99 
=>99 !
x99" #
.99# $
Testing99$ +
)99+ ,
.:: 
Include:: 
(:: 
x:: 
=>:: !
x::" #
.::# $
Approved::$ ,
)::, -
.;; 
Where;; 
(;; 
x;; 
=>;; 
x;;  !
.;;! "
AssignedToCustomer;;" 4
==;;5 7
user;;8 <
.;;< =
Id;;= ?
&&;;@ B
x;;C D
.;;D E
Status;;E K
==;;L N
(;;O P
int;;P S
);;S T
CampaignStatus;;T b
.;;b c
	Completed;;c l
);;l m
.<< 
ToList<< 
(<< 
)<< 
.== 
Select== 
(== 
x== 
=>==  
ADS==! $
.==$ %
API==% (
.==( )
Models==) /
.==/ 0
Campaign==0 8
.==8 9
FromCampaign==9 E
(==E F
x==F G
)==G H
)==H I
;==I J
return?? 
Json?? 
(?? 
new?? 
JsonResponse??  ,
(??, -
)??- .
{??/ 0
IsSucess??0 8
=??9 :
true??; ?
,??? @
Result??A G
=??H I
	campaigns??J S
}??S T
)??T U
;??U V
}@@ 
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA  
{BB 
returnCC 
JsonCC 
(CC 
newCC 
JsonResponseCC  ,
(CC, -
)CC- .
{CC/ 0
IsSucessCC0 8
=CC9 :
falseCC; @
,CC@ A
ErrorMessageCCB N
=CCO P
exCCQ S
.CCS T
MessageCCT [
}CC[ \
)CC\ ]
;CC] ^
}DD 
}EE 	
publicHH 

JsonResultHH 
<HH 
JsonResponseHH &
>HH& '
PostHH( ,
(HH, -
[HH- .
FromBodyHH. 6
]HH6 7
ADSHH8 ;
.HH; <
APIHH< ?
.HH? @
ModelsHH@ F
.HHF G
CampaignHHG O
campaginHHP X
)HHX Y
{II 	
tryJJ 
{KK 
ifLL 
(LL 
!LL 
RequestLL 
.LL 
HeadersLL $
.LL$ %
ContainsLL% -
(LL- .'
AuthenticationParameterNameLL. I
)LLI J
)LLJ K
{MM 
throwNN 
newNN 
	ExceptionNN '
(NN' (
$strNN( K
)NNK L
;NNL M
}OO 
ifPP 
(PP 
stringPP 
.PP 
IsNullOrEmptyPP (
(PP( )
campaginPP) 1
.PP1 2
OrderNumberPP2 =
)PP= >
)PP> ?
{QQ 
throwRR 
newRR 
	ExceptionRR '
(RR' (
$strRR( @
)RR@ A
;RRA B
}SS 
ifTT 
(TT 
stringTT 
.TT 
IsNullOrEmptyTT (
(TT( )
campaginTT) 1
.TT1 2
IONumberTT2 :
)TT: ;
)TT; <
{UU 
throwVV 
newVV 
	ExceptionVV '
(VV' (
$strVV( =
)VV= >
;VV> ?
}WW 
stringYY 
tokenYY 
=YY 
RequestYY &
.YY& '
HeadersYY' .
.YY. /
	GetValuesYY/ 8
(YY8 9'
AuthenticationParameterNameYY9 T
)YYT U
.YYU V
FirstYYV [
(YY[ \
)YY\ ]
;YY] ^
var[[ 
user[[ 
=[[ 
db[[ 
.[[ 
Users[[ #
.[[# $
FirstOrDefault[[$ 2
([[2 3
x[[3 4
=>[[5 7
x[[8 9
.[[9 :
ApiKey[[: @
.[[@ A
Equals[[A G
([[G H
token[[H M
)[[M N
)[[N O
;[[O P
var\\ 
isValidUser\\ 
=\\  !
user\\" &
!=\\' )
null\\* .
;\\. /
if]] 
(]] 
!]] 
isValidUser]]  
)]]  !
{^^ 
throw__ 
new__ 
	Exception__ '
(__' (
$str__( H
)__H I
;__I J
}`` 
dbbb 
.bb 
ApiRequestsbb 
.bb 
Addbb "
(bb" #
newbb# &

ApiRequestbb' 1
(bb1 2
)bb2 3
{cc 
Iddd 
=dd 
Guiddd 
.dd 
NewGuiddd %
(dd% &
)dd& '
,dd' (
	CreatedAtee 
=ee 
DateTimeee  (
.ee( )
Nowee) ,
,ee, -
APIKeyff 
=ff 
tokenff "
}gg 
)gg 
;gg 
dbhh 
.hh 
SaveChangeshh 
(hh 
)hh  
;hh  !
varjj 
campaignTrackingjj $
=jj% &
dbjj' )
.jj) *
CampaignTrackingsjj* ;
.kk  !
FirstOrDefaultkk! /
(kk/ 0
xkk0 1
=>kk2 4
xkk5 6
.kk6 7
SegmentNumberkk7 D
==kkE G
campaginkkH P
.kkP Q
OrderNumberkkQ \
.kk\ ]
Trimkk] a
(kka b
)kkb c
)kkc d
;kkd e
ifmm 
(mm 
campaignTrackingmm $
==mm% '
nullmm( ,
)mm, -
{nn 
throwoo 
newoo 
	Exceptionoo '
(oo' (
$stroo( E
+ooF G
campaginooH P
.ooP Q
OrderNumberooQ \
+oo] ^
$stroo_ q
)ooq r
;oor s
}pp 
campaignTrackingrr  
.rr  !
IONumberrr! )
=rr* +
campaginrr, 4
.rr4 5
IONumberrr5 =
.rr= >
Trimrr> B
(rrB C
)rrC D
;rrD E
dbss 
.ss 
SaveChangesss 
(ss 
)ss  
;ss  !
stringuu 
messageuu 
=uu  
$struu! >
+uu? @
campaginuuA I
.uuI J
OrderNumberuuJ U
+uuV W
$strvv! D
+vvE F
campaginvvG O
.vvO P
IONumbervvP X
;vvX Y
returnxx 
Jsonxx 
(xx 
newxx 
JsonResponsexx  ,
(xx, -
)xx- .
{xx/ 0
IsSucessxx1 9
=xx: ;
truexx< @
,xx@ A
ResultxxB H
=xxI J
messagexxK R
}xxS T
)xxT U
;xxU V
}yy 
catchzz 
(zz 
	Exceptionzz 
exzz 
)zz  
{{{ 
return|| 
Json|| 
(|| 
new|| 
JsonResponse||  ,
(||, -
)||- .
{||/ 0
IsSucess||1 9
=||: ;
false||< A
,||A B
ErrorMessage||C O
=||P Q
ex||R T
.||T U
Message||U \
}||] ^
)||^ _
;||_ `
}}} 
}~~ 	
}
�� 
}�� �
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\ApprovedController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
ApprovedController #
:$ %
BaseController& 4
{ 
public 
ActionResult 
EditApproved (
(( )
Guid) -
?- .
id/ 1
)1 2
{ 	
CampaignApproved 
campaignApproved -
=. /
db0 2
.2 3
CampaignsApproved3 D
.D E
FirstOrDefaultE S
(S T
cT U
=>V X
cY Z
.Z [
Id[ ]
==^ `
ida c
)c d
;d e
if 
( 
campaignApproved  
==! #
null$ (
)( )
{ 
throw 
new 
HttpException '
(' (
$num( +
,+ ,
$str- 8
)8 9
;9 :
} 

TinyMapper 
. 
Bind 
< 
CampaignApproved ,
,, -
CampaignApprovedVM. @
>@ A
(A B
configB H
=>I K
{ 
config 
. 
Ignore 
( 
x 
=>  "
x# $
.$ %
ChannelTypes% 1
)1 2
;2 3
}   
)   
;   
var"" 
campaignApprovedVm"" "
=""# $

TinyMapper""% /
.""/ 0
Map""0 3
<""3 4
CampaignApprovedVM""4 F
>""F G
(""G H
campaignApproved""H X
)""X Y
;""Y Z
Campaign## 
campaign## 
=## 
db##  "
.##" #
	Campaigns### ,
.$$ 
Include$$ 
($$ 
x$$ 
=>$$  
x$$! "
.$$" #
Assets$$# )
)$$) *
.%% 
Include%% 
(%% 
x%% 
=>%%  
x%%! "
.%%" #
Segments%%# +
)%%+ ,
.&& 
FirstOrDefault&& "
(&&" #
x&&# $
=>&&% '
x&&( )
.&&) *
Id&&* ,
==&&- /
campaignApprovedVm&&0 B
.&&B C

CampaignId&&C M
)&&M N
;&&N O
campaignApprovedVm'' 
.'' 
OrderNumber'' *
=''+ ,
campaign''- 5
.''5 6
OrderNumber''6 A
;''A B
campaignApprovedVm(( 
.(( 
Assets(( %
=((& '
campaign((( 0
.((0 1
Assets((1 7
;((7 8
foreach)) 
()) 
var)) 
segment))  
in))! #
campaign))$ ,
.)), -
Segments))- 5
)))5 6
{** 
var++ 
	segmentVm++ 
=++ 

TinyMapper++  *
.++* +
Map+++ .
<++. /
CampaignSegmentVM++/ @
>++@ A
(++A B
segment++B I
)++I J
;++J K
campaignApprovedVm,, "
.,," #
Segments,,# +
.,,+ ,
Add,,, /
(,,/ 0
	segmentVm,,0 9
),,9 :
;,,: ;
}-- 
campaignApprovedVm// 
.// 
ChannelTypes// +
=//, -
string//. 4
.//4 5
IsNullOrEmpty//5 B
(//B C
campaignApproved//C S
.//S T
ChannelTypes//T `
)//` a
?//b c
new//d g
List//h l
<//l m
ChannelType//m x
>//x y
{//z {
}//| }
://~ 
campaignApproved00  
.00  !
ChannelTypes00! -
.11 
Split11 
(11 
$str11 
.11 
ToCharArray11 *
(11* +
)11+ ,
)11, -
.22 
Select22 
(22 
x22 
=>22  
(22! "
ChannelType22" -
)22- .
System22. 4
.224 5
Enum225 9
.229 :
Parse22: ?
(22? @
typeof22@ F
(22F G
ChannelType22G R
)22R S
,22S T
x22U V
)22V W
)22W X
.22X Y
ToList22Y _
(22_ `
)22` a
;22a b
var44 
proData44 
=44 
VendorsList44 %
.44% &
FirstOrDefault44& 4
(444 5
x445 6
=>447 9
x44: ;
.44; <
Text44< @
.44@ A
ToLowerInvariant44A Q
(44Q R
)44R S
.44S T
Contains44T \
(44\ ]
$str44] b
)44b c
)44c d
;44d e
ViewBag55 
.55 
Vendor55 
=55 
new55  

SelectList55! +
(55+ ,
VendorsList55, 7
,557 8
$str559 @
,55@ A
$str55B H
,55H I
proData55J Q
)55Q R
;55R S
return77 
View77 
(77 
campaignApprovedVm77 *
)77* +
;77+ ,
}88 	
[:: 	
HttpPost::	 
]:: 
[;; 	$
ValidateAntiForgeryToken;;	 !
];;! "
public<< 
ActionResult<< 
EditApproved<< (
(<<( )
[<<) *
Bind<<* .
(<<. /
Include<</ 6
=<<7 8
$str	<<9 �
)
<<� �
]
<<� � 
CampaignApprovedVM
<<� � 
campaignApprovedVm
<<� �
)
<<� �
{== 	
if>> 
(>> 

ModelState>> 
.>> 
IsValid>> "
)>>" #
{?? 

TinyMapperBB 
.BB 
BindBB 
<BB  
CampaignApprovedVMBB  2
,BB2 3
CampaignApprovedBB4 D
>BBD E
(BBE F
configBBF L
=>BBM O
{CC 
configDD 
.DD 
IgnoreDD !
(DD! "
xDD" #
=>DD$ &
xDD' (
.DD( )
ChannelTypesDD) 5
)DD5 6
;DD6 7
configEE 
.EE 
IgnoreEE !
(EE! "
xEE" #
=>EE$ &
xEE' (
.EE( )
AssetsEE) /
)EE/ 0
;EE0 1
configFF 
.FF 
IgnoreFF !
(FF! "
xFF" #
=>FF$ &
xFF' (
.FF( )
SegmentsFF) 1
)FF1 2
;FF2 3
}GG 
)GG 
;GG 
varHH 
campaignApprovedHH $
=HH% &

TinyMapperHH' 1
.HH1 2
MapHH2 5
<HH5 6
CampaignApprovedHH6 F
>HHF G
(HHG H
campaignApprovedVmHHH Z
)HHZ [
;HH[ \
campaignApprovedII  
.II  !
ChannelTypesII! -
=II. /
campaignApprovedVmII0 B
.IIB C
ChannelTypesIIC O
==IIP R
nullIIS W
?IIX Y
nullIIZ ^
:II_ `
stringJJ 
.JJ 
JoinJJ 
(JJ  
$strJJ  #
,JJ# $
campaignApprovedVmJJ% 7
.JJ7 8
ChannelTypesJJ8 D
)JJD E
;JJE F
dbKK 
.KK 
EntryKK 
(KK 
campaignApprovedKK )
)KK) *
.KK* +
StateKK+ 0
=KK1 2
EntityStateKK3 >
.KK> ?
ModifiedKK? G
;KKG H
dbLL 
.LL 
SaveChangesLL 
(LL 
)LL  
;LL  !
varOO 
campaignAssetsOO "
=OO# $
dbOO% '
.OO' (
CampaignAssetsOO( 6
.OO6 7
FirstOrDefaultOO7 E
(OOE F
xOOF G
=>OOH J
xOOK L
.OOL M

CampaignIdOOM W
==OOX Z
campaignApprovedVmOO[ m
.OOm n

CampaignIdOOn x
)OOx y
;OOy z
campaignAssetsPP 
.PP 
CreativeFilesPP ,
=PP- .
campaignApprovedVmPP/ A
.PPA B
AssetsPPB H
.PPH I
CreativeFilesPPI V
;PPV W
campaignAssetsQQ 
.QQ 
CreativeUrlQQ *
=QQ+ ,
campaignApprovedVmQQ- ?
.QQ? @
AssetsQQ@ F
.QQF G
CreativeUrlQQG R
;QQR S
campaignAssetsRR 
.RR 
ZipCodeFileRR *
=RR+ ,
campaignApprovedVmRR- ?
.RR? @
AssetsRR@ F
.RRF G
ZipCodeFileRRG R
;RRR S
campaignAssetsSS 
.SS 

ZipCodeUrlSS )
=SS* +
campaignApprovedVmSS, >
.SS> ?
AssetsSS? E
.SSE F

ZipCodeUrlSSF P
;SSP Q
campaignAssetsTT 
.TT 
TestSeedFileTT +
=TT, -
campaignApprovedVmTT. @
.TT@ A
AssetsTTA G
.TTG H
TestSeedFileTTH T
;TTT U
campaignAssetsUU 
.UU 
LiveSeedFileUU +
=UU, -
campaignApprovedVmUU. @
.UU@ A
AssetsUUA G
.UUG H
LiveSeedFileUUH T
;UUT U
dbVV 
.VV 
EntryVV 
(VV 
campaignAssetsVV '
)VV' (
.VV( )
StateVV) .
=VV/ 0
EntityStateVV1 <
.VV< =
ModifiedVV= E
;VVE F
dbWW 
.WW 
SaveChangesWW 
(WW 
)WW  
;WW  !
TempDataYY 
[YY 
$strYY "
]YY" #
=YY$ %
$strYY& I
;YYI J
}ZZ 
else[[ 
{\\ 
var]] 
	errorList]] 
=]] 
(]]  !
from]]! %
item]]& *
in]]+ -

ModelState]]. 8
.]]8 9
Values]]9 ?
from^^! %
error^^& +
in^^, .
item^^/ 3
.^^3 4
Errors^^4 :
select__! '
error__( -
.__- .
ErrorMessage__. :
)__: ;
.__; <
ToList__< B
(__B C
)__C D
;__D E
TempData`` 
[`` 
$str``  
]``  !
=``" #
$str``$ D
+``E F
string``G M
.``M N
Join``N R
(``R S
$str``S Z
,``Z [
	errorList``\ e
)``e f
;``f g
}aa 
varbb 
proDatabb 
=bb 
VendorsListbb %
.bb% &
FirstOrDefaultbb& 4
(bb4 5
xbb5 6
=>bb7 9
xbb: ;
.bb; <
Textbb< @
.bb@ A
ContainsbbA I
(bbI J
$strbbJ O
)bbO P
)bbP Q
;bbQ R
ViewBagcc 
.cc 
Vendorcc 
=cc 
newcc  

SelectListcc! +
(cc+ ,
VendorsListcc, 7
,cc7 8
$strcc9 @
,cc@ A
$strccB H
,ccH I
proDataccJ Q
)ccQ R
;ccR S
returnee 
Viewee 
(ee 
campaignApprovedVmee *
)ee* +
;ee+ ,
}ff 	
publichh 
ActionResulthh 
CompleteSegmenthh +
(hh+ ,
Guidhh, 0
?hh0 1
Idhh2 4
)hh4 5
{ii 	
tryjj 
{kk 
varll 
segmentll 
=ll 
dbll  
.ll  !
CampaignSegmentsll! 1
.ll1 2
FirstOrDefaultll2 @
(ll@ A
xllA B
=>llC E
xllF G
.llG H
IdllH J
==llK M
IdllN P
)llP Q
;llQ R
segmentmm 
.mm 
SegmentStatusmm %
=mm& '
(mm( )
intmm) ,
)mm, -
SegmentStatusmm- :
.mm: ;
Completemm; C
;mmC D
segmentnn 
.nn 
DateCompletenn $
=nn% &
DateTimenn' /
.nn/ 0
Nownn0 3
;nn3 4
dboo 
.oo 
SaveChangesoo 
(oo 
)oo  
;oo  !
returnpp 
Jsonpp 
(pp 
newpp 
JsonResponsepp  ,
(pp, -
)pp- .
{pp/ 0
IsSucesspp1 9
=pp: ;
truepp< @
}ppA B
,ppB C
JsonRequestBehaviorppD W
.ppW X
AllowGetppX `
)pp` a
;ppa b
}qq 
catchrr 
(rr 
	Exceptionrr 
exrr 
)rr  
{ss 
returntt 
Jsontt 
(tt 
newtt 
JsonResponsett  ,
(tt, -
)tt- .
{tt/ 0
IsSucesstt1 9
=tt: ;
falsett< A
,ttA B
ErrorMessagettC O
=ttP Q
exttR T
.ttT U
MessagettU \
}tt] ^
,tt^ _
JsonRequestBehaviortt` s
.tts t
AllowGetttt |
)tt| }
;tt} ~
}uu 
}vv 	
publicxx 
ActionResultxx 
SendToVendorxx (
(xx( )
Guidxx) -
?xx- .
VendorIdxx/ 7
,xx7 8
Guidxx9 =
?xx= >
Idxx? A
,xxA B
stringxxC I
[xxI J
]xxJ K
SegmentsSelectedxxL \
)xx\ ]
{yy 	
tryzz 
{{{ 
Campaign|| 
campaign|| !
=||" #
db||$ &
.||& '
	Campaigns||' 0
.||0 1
Include||1 8
(||8 9
x||9 :
=>||; =
x||> ?
.||? @
Approved||@ H
)||H I
.||I J
FirstOrDefault||J X
(||X Y
x||Y Z
=>||[ ]
x||^ _
.||_ `
Id||` b
==||c e
Id||f h
)||h i
;||i j
if}} 
(}} 
campaign}} 
==}} 
null}}  $
)}}$ %
{~~ 
throw 
new 
	Exception '
(' (
$str( <
+= >
Id? A
+B C
$strD Q
)Q R
;R S
}
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� %
==
��& (
null
��) -
)
��- .
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( 4
+
��5 6
campaign
��7 ?
.
��? @
CampaignName
��@ L
+
��M N
$str
��O f
)
��f g
;
��g h
}
�� 
BackgroundJob
�� 
.
�� 
Enqueue
�� %
(
��% &
(
��& '
)
��' (
=>
��) +
CampaignProcessor
��, =
.
��= >
SendVendorEmail
��> M
(
��M N
VendorId
��N V
,
��V W
campaign
��X `
.
��` a
OrderNumber
��a l
,
��l m
SegmentsSelected
��n ~
)
��~ 
)�� �
;��� �
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
ActionResult
�� 

SendViaAPI
�� &
(
��& '
Guid
��' +
?
��+ ,
Id
��- /
)
��/ 0
{
�� 	
try
�� 
{
�� 
Campaign
�� 
campaign
�� !
=
��" #
db
��$ &
.
��& '
	Campaigns
��' 0
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� !
x
��" #
.
��# $
Assets
��$ *
)
��* +
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� !
x
��" #
.
��# $
Segments
��$ ,
)
��, -
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� !
x
��" #
.
��# $
Approved
��$ ,
)
��, -
.
�� 
FirstOrDefault
�� #
(
��# $
x
��$ %
=>
��& (
x
��) *
.
��* +
Id
��+ -
==
��. 0
Id
��1 3
)
��3 4
;
��4 5
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( <
+
��= >
Id
��? A
+
��B C
$str
��D Q
)
��Q R
;
��R S
}
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� %
==
��& (
null
��) -
)
��- .
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( 4
+
��5 6
campaign
��7 ?
.
��? @
CampaignName
��@ L
+
��M N
$str
��O f
)
��f g
;
��g h
}
�� 
var
�� 
segment
�� 
=
�� 
campaign
�� &
.
��& '
Segments
��' /
.
��/ 0
FirstOrDefault
��0 >
(
��> ?
)
��? @
;
��@ A
var
�� 
response
�� 
=
�� 
ProDataAPIManager
�� 0
.
��0 1
Create
��1 7
(
��7 8
campaign
��8 @
,
��@ A
segment
��B I
)
��I J
;
��J K
if
�� 
(
�� 
response
�� 
.
�� 
status
�� #
==
��$ &
ProDataAPIManager
��' 8
.
��8 9
SUCCESS
��9 @
)
��@ A
{
�� 
var
�� 
campaignTracking
�� (
=
��) *
db
�� 
.
�� 
CampaignTrackings
�� +
.
��+ ,
FirstOrDefault
��, :
(
��: ;
x
��; <
=>
��= ?
x
��@ A
.
��A B

CampaignId
��B L
==
��M O
campaign
��P X
.
��X Y
Id
��Y [
&&
��\ ^
x
��_ `
.
��` a
SegmentNumber
��a n
==
��o q
segment
��r y
.
��y z
SegmentNumber��z �
)��� �
;��� �
if
�� 
(
�� 
campaignTracking
�� (
==
��) +
null
��, 0
)
��0 1
{
�� 
var
�� 

trackingId
�� &
=
��' (
Guid
��) -
.
��- .
NewGuid
��. 5
(
��5 6
)
��6 7
;
��7 8
var
�� 
tracking
�� $
=
��% &
new
��' *
CampaignTracking
��+ ;
(
��; <
)
��< =
{
�� 
Id
�� 
=
��  

trackingId
��! +
,
��+ ,
	CreatedAt
�� %
=
��& '
DateTime
��( 0
.
��0 1
Now
��1 4
,
��4 5

CampaignId
�� &
=
��' (
campaign
��) 1
.
��1 2
Id
��2 4
,
��4 5
SegmentNumber
�� )
=
��* +
segment
��, 3
.
��3 4
SegmentNumber
��4 A
,
��A B
DateSent
�� $
=
��% &
DateTime
��' /
.
��/ 0
Now
��0 3
,
��3 4!
IsCreatedThroughApi
�� /
=
��0 1
true
��2 6
,
��6 7
QueuedCampaignId
�� ,
=
��- .
response
��/ 7
.
��7 8(
queued_pending_campaign_id
��8 R
.
��R S
ToString
��S [
(
��[ \
)
��\ ]
,
��] ^
}
�� 
;
�� 
db
�� 
.
�� 
CampaignTrackings
�� ,
.
��, -
Add
��- 0
(
��0 1
tracking
��1 9
)
��9 :
;
��: ;
campaign
��  
.
��  !
Status
��! '
=
��( )
(
��* +
int
��+ .
)
��. /
CampaignStatus
��/ =
.
��= >

Monitoring
��> H
;
��H I
db
�� 
.
�� 
SaveChanges
�� &
(
��& '
)
��' (
;
��( )
}
�� 
}
�� 
else
�� 
{
�� 
string
�� 
message
�� "
=
��# $
response
��% -
.
��- .
message
��. 5
;
��5 6
foreach
�� 
(
�� 
var
��  
field
��! &
in
��' )
response
��* 2
.
��2 3
error_fields
��3 ?
)
��? @
{
�� 
message
�� 
+=
��  "
$str
��# *
+
��+ ,
field
��- 2
;
��2 3
}
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
message
��( /
)
��/ 0
;
��0 1
}
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
}
�� 
}�� ă
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\BaseController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
public 

class 
BaseController 
:  !

Controller" ,
{ 
private 
WfpictContext 
_db !
;! "
public 
WfpictContext 
db 
{ 	
get 
{ 
if 
( 
_db 
== 
null 
) 
_db 
= 
HttpContext %
.% &
GetOwinContext& 4
(4 5
)5 6
.6 7
Get7 :
<: ;
WfpictContext; H
>H I
(I J
)J K
;K L
return 
_db 
; 
} 
private 
set 
{ 
_db 
= 
value 
; 
} 
} 	
public   
void   
SetupLoggedInUser   %
(  % &
string  & ,
UserName  - 5
)  5 6
{!! 	
var"" 
user"" 
="" 
db"" 
."" 
Users"" 
.""  
Include""  '
(""' (
u""( )
=>""* ,
u""- .
."". /
Roles""/ 4
)""4 5
.""5 6
FirstOrDefault""6 D
(""D E
x""E F
=>""G I
x""J K
.""K L
UserName""L T
==""U W
UserName""X `
)""` a
;""a b
Session## 
[## 
$str## 
]## 
=## 
user## "
;##" #
}$$ 	
public&& 
WfpUser&& 
LoggedInUser&& #
{'' 	
get(( 
{)) 
return** 
Session** 
[** 
$str** %
]**% &
as**' )
WfpUser*** 1
;**1 2
}++ 
},, 	
public.. 
bool.. 
IsAdmin.. 
{// 	
get00 
{11 
return22 
LoggedInUser22 #
!=22$ &
null22' +
&&22, .
(22/ 0
LoggedInUser220 <
.22< =
UserType22= E
==22F H
(22I J
int22J M
)22M N
UserType22N V
.22V W
Admin22W \
)22\ ]
;22] ^
}33 
}44 	
string66 
_uploadPath66 
=66 
$str66 (
;66( )
public77 
string77 

UploadPath77  
{88 	
get99 
{:: 
string;; 

uploadPath;; !
=;;" #
Server;;$ *
.;;* +
MapPath;;+ 2
(;;2 3
_uploadPath;;3 >
);;> ?
;;;? @
if<< 
(<< 
!<< 
System<< 
.<< 
IO<< 
.<< 
	Directory<< (
.<<( )
Exists<<) /
(<</ 0

uploadPath<<0 :
)<<: ;
)<<; <
System<<= C
.<<C D
IO<<D F
.<<F G
	Directory<<G P
.<<P Q
CreateDirectory<<Q `
(<<` a

uploadPath<<a k
)<<k l
;<<l m
return== 

uploadPath== !
;==! "
}>> 
}?? 	
stringAA 
_downloadPathAA 
=AA 
$strAA ,
;AA, -
publicBB 
stringBB 
DownloadPathBB "
{CC 	
getDD 
{EE 
stringFF 
downloadPathFF #
=FF$ %
ServerFF& ,
.FF, -
MapPathFF- 4
(FF4 5
_downloadPathFF5 B
)FFB C
;FFC D
ifGG 
(GG 
!GG 
SystemGG 
.GG 
IOGG 
.GG 
	DirectoryGG (
.GG( )
ExistsGG) /
(GG/ 0
downloadPathGG0 <
)GG< =
)GG= >
SystemGG? E
.GGE F
IOGGF H
.GGH I
	DirectoryGGI R
.GGR S
CreateDirectoryGGS b
(GGb c
downloadPathGGc o
)GGo p
;GGp q
returnHH 
downloadPathHH #
;HH# $
}II 
}JJ 	
stringLL 
_imagesPathLL 
=LL 
$strLL '
;LL' (
publicMM 
stringMM 

ImagesPathMM  
{NN 	
getOO 
{PP 
returnQQ 
ServerQQ 
.QQ 
MapPathQQ %
(QQ% &
_imagesPathQQ& 1
)QQ1 2
;QQ2 3
}RR 
}SS 	
publicUU 

SelectListUU 

StatusListUU $
{VV 	
getWW 
{XX 
varYY 
itemsYY 
=YY 

EnumHelperYY &
.YY& '
GetEnumTextValuesYY' 8
(YY8 9
typeofYY9 ?
(YY? @
CampaignStatusYY@ N
)YYN O
)YYO P
.ZZ 
SelectZZ 
(ZZ 
xZZ 
=>ZZ  
newZZ! $
SelectListItemZZ% 3
(ZZ3 4
)ZZ4 5
{[[ 
Text\\ 
=\\ 
x\\  
.\\  !
Text\\! %
,\\% &
Value]] 
=]] 
x]]  !
.]]! "
Value]]" '
}^^ 
)^^ 
.^^ 
ToList^^ 
(^^ 
)^^ 
;^^  
items__ 
.__ 
Insert__ 
(__ 
$num__ 
,__ 
new__  #
SelectListItem__$ 2
(__2 3
)__3 4
{`` 
Textaa 
=aa 
$straa *
,aa* +
Valuebb 
=bb 
stringbb "
.bb" #
Emptybb# (
}cc 
)cc 
;cc 
returndd 
newdd 

SelectListdd %
(dd% &
itemsdd& +
,dd+ ,
$strdd- 4
,dd4 5
$strdd6 <
)dd< =
;dd= >
}ee 
}ff 	
publichh 
IEnumerablehh 
<hh 
SelectListItemhh )
>hh) *

MonthsListhh+ 5
{ii 	
getjj 
{kk 
varll 
monthsll 
=ll 
newll  
Listll! %
<ll% &
SelectListItemll& 4
>ll4 5
(ll5 6
)ll6 7
;ll7 8
formm 
(mm 
intmm 
imm 
=mm 
$nummm 
;mm 
imm  !
<mm" #
$nummm$ &
;mm& '
imm( )
++mm) +
)mm+ ,
{nn 
monthsoo 
.oo 
Addoo 
(oo 
newoo "
SelectListItemoo# 1
(oo1 2
)oo2 3
{pp 
Textqq 
=qq 
CultureInfoqq *
.qq* +
CurrentCultureqq+ 9
.qq9 :
DateTimeFormatqq: H
.qqH I
GetMonthNameqqI U
(qqU V
iqqV W
+qqX Y
$numqqZ [
)qq[ \
,qq\ ]
Valuerr 
=rr 
irr  !
.rr! "
ToStringrr" *
(rr* +
)rr+ ,
}ss 
)ss 
;ss 
}tt 
monthsuu 
.uu 
Insertuu 
(uu 
$numuu 
,uu  
newuu! $
SelectListItemuu% 3
(uu3 4
)uu4 5
{vv 
Textww 
=ww 
$strww )
,ww) *
Valuexx 
=xx 
stringxx "
.xx" #
Emptyxx# (
}yy 
)yy 
;yy 
returnzz 
monthszz 
;zz 
}{{ 
}|| 	
private~~ 
static~~ 
List~~ 
<~~ 
SelectListItem~~ *
>~~* +
_users~~, 2
;~~2 3
public 
IEnumerable 
< 
SelectListItem )
>) *
	UsersList+ 4
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_users
�� 
==
�� 
null
�� "
)
��" #
{
�� 
var
�� 
user
�� 
=
�� 
Session
�� &
[
��& '
$str
��' -
]
��- .
as
��/ 1
WfpUser
��2 9
;
��9 :
_users
�� 
=
�� 
db
�� 
.
��  
Users
��  %
.
�� 
OrderBy
��  
(
��  !
x
��! "
=>
��# %
x
��& '
.
��' (
	CreatedAt
��( 1
)
��1 2
.
��2 3
Select
��3 9
(
��9 :
x
�� 
=>
�� !
new
��" %
SelectListItem
��& 4
(
��4 5
)
��5 6
{
�� 
Text
��! %
=
��& '
x
��( )
.
��) *
UserName
��* 2
,
��2 3
Value
��! &
=
��' (
x
��) *
.
��* +
UserName
��+ 3
}
�� 
)
�� 
.
��  
ToList
��  &
(
��& '
)
��' (
;
��( )
_users
�� 
.
�� 
Insert
�� !
(
��! "
$num
��" #
,
��# $
new
��% (
SelectListItem
��) 7
(
��7 8
)
��8 9
{
�� 
Text
�� 
=
�� 
$str
�� ,
,
��, -
Value
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
_users
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
_forceOrders
�� (
;
��( )
public
�� 
static
�� 
bool
�� 
ForceOrders
�� &
{
�� 	
get
�� 
{
�� 
return
�� 
_forceOrders
�� %
;
��% &
}
��' (
set
�� 
{
�� 
_forceOrders
�� 
=
��  
value
��! &
;
��& '
}
��( )
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� 
SelectListItem
�� *
>
��* +
_orderNumbers
��, 9
;
��9 :
public
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� )
>
��) *
OrderNumberList
��+ :
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_orderNumbers
�� !
==
��" $
null
��% )
||
��* ,
_forceOrders
��- 9
)
��9 :
{
�� 
_orderNumbers
�� !
=
��" #
db
��$ &
.
��& '
	Campaigns
��' 0
.
�� 
OrderBy
��  
(
��  !
x
��! "
=>
��# %
x
��& '
.
��' (
	CreatedAt
��( 1
)
��1 2
.
��2 3
Select
��3 9
(
��9 :
x
�� 
=>
�� !
new
��" %
SelectListItem
��& 4
(
��4 5
)
��5 6
{
�� 
Text
��! %
=
��& '
x
��( )
.
��) *
OrderNumber
��* 5
,
��5 6
Value
��! &
=
��' (
x
��) *
.
��* +
Id
��+ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
}
�� 
)
�� 
.
��  
ToList
��  &
(
��& '
)
��' (
;
��( )
_orderNumbers
�� !
.
��! "
Insert
��" (
(
��( )
$num
��) *
,
��* +
new
��, /
SelectListItem
��0 >
(
��> ?
)
��? @
{
�� 
Text
�� 
=
�� 
$str
�� /
,
��/ 0
Value
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
_orderNumbers
�� $
;
��$ %
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
_forceVendors
�� )
;
��) *
public
�� 
static
�� 
bool
�� 
ForceVendors
�� '
{
�� 	
get
�� 
{
�� 
return
�� 
_forceVendors
�� &
;
��& '
}
��( )
set
�� 
{
�� 
_forceVendors
�� 
=
��  !
value
��" '
;
��' (
}
��) *
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� 
SelectListItem
�� *
>
��* +
_vendors
��, 4
;
��4 5
public
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� )
>
��) *
VendorsList
��+ 6
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_vendors
�� 
==
�� 
null
��  $
||
��% '
_forceVendors
��( 5
)
��5 6
{
�� 
_vendors
�� 
=
�� 
db
�� !
.
��! "
Vendors
��" )
.
�� 
OrderBy
��  
(
��  !
x
��! "
=>
��# %
x
��& '
.
��' (
	CreatedAt
��( 1
)
��1 2
.
��2 3
Select
��3 9
(
��9 :
x
�� 
=>
�� !
new
��" %
SelectListItem
��& 4
(
��4 5
)
��5 6
{
�� 
Text
��! %
=
��& '
x
��( )
.
��) *
Name
��* .
,
��. /
Value
��! &
=
��' (
x
��) *
.
��* +
Id
��+ -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
}
�� 
)
�� 
.
��  
ToList
��  &
(
��& '
)
��' (
;
��( )
_vendors
�� 
.
�� 
Insert
�� #
(
��# $
$num
��$ %
,
��% &
new
��' *
SelectListItem
��+ 9
(
��9 :
)
��: ;
{
�� 
Text
�� 
=
�� 
$str
�� .
,
��. /
Value
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
_vendors
�� 
;
��  
}
�� 
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� 
SelectListItem
�� *
>
��* +
_claimTypes
��, 7
;
��7 8
public
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� )
>
��) *

ClaimTypes
��+ 5
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_claimTypes
�� 
==
��  "
null
��# '
)
��' (
{
�� 
var
�� 
mgr
�� 
=
�� 
new
�� !!
AspNetClaimsManager
��" 5
(
��5 6
)
��6 7
;
��7 8
_claimTypes
�� 
=
��  !
mgr
��" %
.
��% &
GetAll
��& ,
(
��, -
)
��- .
.
��. /
Select
��/ 5
(
��5 6
x
�� 
=>
�� 
new
�� 
SelectListItem
�� +
(
��+ ,
)
��, -
{
�� 
Text
�� 
=
�� 
x
��  
.
��  !
	ClaimType
��! *
,
��* +
Value
�� 
=
�� 
x
��  !
.
��! "
	ClaimType
��" +
}
�� 
)
�� 
.
�� 
Distinct
�� 
(
��  
)
��  !
.
��! "
ToList
��" (
(
��( )
)
��) *
;
��* +
_claimTypes
�� 
.
��  
Insert
��  &
(
��& '
$num
��' (
,
��( )
new
��* -
SelectListItem
��. <
(
��< =
)
��= >
{
�� 
Text
�� 
=
�� 
$str
�� 0
,
��0 1
Value
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
_claimTypes
�� "
;
��" #
}
�� 
}
�� 	
}
�� 
}�� �

OE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\NotificationController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public		 

class		 "
NotificationController		 '
:		( )
BaseController		* 8
{

 
int 
pageSize 
= 
$num 
; 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
var 
notifications 
= 
db  "
." #
Notifications# 0
.0 1
ToList1 7
(7 8
)8 9
;9 :
int 

pageNumber 
= 
( 
sc  
.  !
page! %
??& (
$num) *
)* +
;+ ,
return 
View 
( 
notifications %
.% &
ToPagedList& 1
(1 2

pageNumber2 <
,< =
pageSize> F
)F G
)G H
;H I
} 	
}
�� 
}�� ��
IE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\StatusController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
StatusController !
:" #
BaseController$ 2
{ 
int 
pageSize 
= 
$num 
; 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
sc& (
.( )
clearSessionId) 7
)7 8
)8 9
{ 
Session 
[ 
$str 
] 
= 
null  $
;$ %
sc 
. 
basicString 
=  
string! '
.' (
Empty( -
;- .
} 
ViewBag 
. 
CurrentSort 
=  !
sc" $
.$ %
	sortOrder% .
;. /
ViewBag 
.  
CampaignNameSortParm (
=) *
sc+ -
.- .
	sortOrder. 7
==8 :
$str; I
?J K
$strL _
:` a
$strb p
;p q
ViewBag 
. !
BroadcastDateSortParm )
=* +
sc, .
.. /
	sortOrder/ 8
==9 ;
$str< K
?L M
$strN b
:c d
$stre t
;t u
ViewBag   
.   
CreatedBySortParm   %
=  & '
sc  ( *
.  * +
	sortOrder  + 4
==  5 7
$str  8 C
?  D E
$str  F V
:  W X
$str  Y d
;  d e
ViewBag!! 
.!! 
StatusSortParm!! "
=!!# $
sc!!% '
.!!' (
	sortOrder!!( 1
==!!2 4
$str!!5 =
?!!> ?
$str!!@ M
:!!N O
$str!!P X
;!!X Y
ViewBag"" 
."" 
OrderNumberSortParm"" '
=""( )
sc""* ,
."", -
	sortOrder""- 6
==""7 9
$str"": G
?""H I
$str""J \
:""] ^
$str""_ l
;""l m
var$$ 
	campagins$$ 
=$$ 
db$$ 
.$$ 
	Campaigns$$ (
.%% 
Include%% 
(%% 
x%% 
=>%% 
x%% 
.%%  
Testing%%  '
)%%' (
.&& 
Include&& 
(&& 
x&& 
=>&& 
x&& 
.&&  
Approved&&  (
)&&( )
.'' 
Include'' 
('' 
x'' 
=>'' 
x'' 
.''  
	Trackings''  )
)'') *
.(( 
ToList(( 
((( 
)(( 
;(( 
switch** 
(** 
sc** 
.** 
	sortOrder**  
)**  !
{++ 
case,, 
$str,, #
:,,# $
	campagins-- 
=-- 
	campagins--  )
.--) *
OrderBy--* 1
(--1 2
s--2 3
=>--4 6
s--7 8
.--8 9
CampaignName--9 E
)--E F
.--F G
ToList--G M
(--M N
)--N O
;--O P
break.. 
;.. 
case// 
$str// (
://( )
	campagins00 
=00 
	campagins00  )
.00) *
OrderByDescending00* ;
(00; <
s00< =
=>00> @
s00A B
.00B C
CampaignName00C O
)00O P
.00P Q
ToList00Q W
(00W X
)00X Y
;00Y Z
break11 
;11 
case22 
$str22 $
:22$ %
	campagins33 
=33 
	campagins33  )
.33) *
OrderBy33* 1
(331 2
s332 3
=>334 6
s337 8
.338 9
BroadcastDate339 F
)33F G
.33G H
ToList33H N
(33N O
)33O P
;33P Q
break44 
;44 
case55 
$str55 )
:55) *
	campagins66 
=66 
	campagins66  )
.66) *
OrderByDescending66* ;
(66; <
s66< =
=>66> @
s66A B
.66B C
BroadcastDate66C P
)66P Q
.66Q R
ToList66R X
(66X Y
)66Y Z
;66Z [
break77 
;77 
case88 
$str88  
:88  !
	campagins99 
=99 
	campagins99  )
.99) *
OrderBy99* 1
(991 2
s992 3
=>994 6
s997 8
.998 9
	CreatedBy999 B
)99B C
.99C D
ToList99D J
(99J K
)99K L
;99L M
break:: 
;:: 
case;; 
$str;; %
:;;% &
	campagins<< 
=<< 
	campagins<<  )
.<<) *
OrderByDescending<<* ;
(<<; <
s<<< =
=><<> @
s<<A B
.<<B C
	CreatedBy<<C L
)<<L M
.<<M N
ToList<<N T
(<<T U
)<<U V
;<<V W
break== 
;== 
case>> 
$str>> 
:>> 
	campagins?? 
=?? 
	campagins??  )
.??) *
OrderBy??* 1
(??1 2
s??2 3
=>??4 6
s??7 8
.??8 9
Status??9 ?
)??? @
.??@ A
ToList??A G
(??G H
)??H I
;??I J
break@@ 
;@@ 
caseAA 
$strAA "
:AA" #
	campaginsBB 
=BB 
	campaginsBB  )
.BB) *
OrderByDescendingBB* ;
(BB; <
sBB< =
=>BB> @
sBBA B
.BBB C
StatusBBC I
)BBI J
.BBJ K
ToListBBK Q
(BBQ R
)BBR S
;BBS T
breakCC 
;CC 
caseDD 
$strDD "
:DD" #
	campaginsEE 
=EE 
	campaginsEE  )
.EE) *
OrderByEE* 1
(EE1 2
sEE2 3
=>EE4 6
sEE7 8
.EE8 9
OrderNumberEE9 D
)EED E
.EEE F
ToListEEF L
(EEL M
)EEM N
;EEN O
breakFF 
;FF 
caseGG 
$strGG '
:GG' (
	campaginsHH 
=HH 
	campaginsHH  )
.HH) *
OrderByDescendingHH* ;
(HH; <
sHH< =
=>HH> @
sHHA B
.HHB C
OrderNumberHHC N
)HHN O
.HHO P
ToListHHP V
(HHV W
)HHW X
;HHX Y
breakII 
;II 
defaultJJ 
:JJ 
	campaginsKK 
=KK 
	campaginsKK  )
.KK) *
OrderByDescendingKK* ;
(KK; <
sKK< =
=>KK> @
sKKA B
.KKB C
	CreatedAtKKC L
)KKL M
.KKM N
ToListKKN T
(KKT U
)KKU V
;KKV W
breakLL 
;LL 
}MM 
ViewBagOO 
.OO 

SearchTypeOO 
=OO  
scOO! #
.OO# $

searchTypeOO$ .
;OO. /
ifPP 
(PP 
scPP 
.PP 

searchTypePP 
==PP  
$strPP! (
)PP( )
{QQ 
ifRR 
(RR 
!RR 
stringRR 
.RR 
IsNullOrEmptyRR )
(RR) *
scRR* ,
.RR, -
basicStringRR- 8
)RR8 9
)RR9 :
{SS 
	campaginsTT 
=TT 
	campaginsTT  )
.TT) *
WhereTT* /
(TT/ 0
sTT0 1
=>TT2 4
sUU 
.UU 
OrderNumberUU !
.UU! "
EqualsUU" (
(UU( )
scUU) +
.UU+ ,
basicStringUU, 7
)UU7 8
||UU9 ;
sVV 
.VV $
ReBroadcastedOrderNumberVV .
==VV/ 1
scVV2 4
.VV4 5
basicStringVV5 @
||VVA C
sWW 
.WW 
CampaignNameWW "
.WW" #
IndexOfWW# *
(WW* +
scWW+ -
.WW- .
basicStringWW. 9
,WW9 :
StringComparisonWW; K
.WWK L&
InvariantCultureIgnoreCaseWWL f
)WWf g
>=WWh j
$numWWk l
)WWl m
.WWm n
ToListWWn t
(WWt u
)WWu v
;WWv w
ViewBagXX 
.XX 
BasicStringSearchedXX /
=XX0 1
scXX2 4
.XX4 5
basicStringXX5 @
;XX@ A
}YY 
elseZZ 
ifZZ 
(ZZ 
!ZZ 
stringZZ  
.ZZ  !
IsNullOrEmptyZZ! .
(ZZ. /
scZZ/ 1
.ZZ1 2
basicStatusZZ2 =
)ZZ= >
)ZZ> ?
{[[ 
int\\ 
status\\ 
=\\  
int\\! $
.\\$ %
Parse\\% *
(\\* +
sc\\+ -
.\\- .
basicStatus\\. 9
)\\9 :
;\\: ;
if]] 
(]] 
status]] 
==]] !
(]]" #
int]]# &
)]]& '
CampaignStatus]]' 5
.]]5 6
Rebroadcasted]]6 C
)]]C D
	campagins^^ !
=^^" #
	campagins^^$ -
.^^- .
Where^^. 3
(^^3 4
s^^4 5
=>^^6 8
s^^9 :
.^^: ;
ReBroadcasted^^; H
)^^H I
.^^I J
ToList^^J P
(^^P Q
)^^Q R
;^^R S
else__ 
if__ 
(__ 
status__ #
==__$ &
(__' (
int__( +
)__+ ,
CampaignStatus__, :
.__: ;
NotRebroadcasted__; K
)__K L
	campagins`` !
=``" #
	campagins``$ -
.``- .
Where``. 3
(``3 4
s``4 5
=>``6 8
s``9 :
.``: ;
ReBroadCast``; F
&&``G I
!``J K
s``K L
.``L M
ReBroadcasted``M Z
)``Z [
.``[ \
ToList``\ b
(``b c
)``c d
;``d e
elseaa 
	campaginsbb !
=bb" #
	campaginsbb$ -
.bb- .
Wherebb. 3
(bb3 4
sbb4 5
=>bb6 8
sbb9 :
.bb: ;
Statusbb; A
==bbB D
statusbbE K
)bbK L
.bbL M
ToListbbM S
(bbS T
)bbT U
;bbU V
ViewBagcc 
.cc 
BasicStatusSearchedcc /
=cc0 1
sccc2 4
.cc4 5
basicStatuscc5 @
;cc@ A
}dd 
elseee 
ifee 
(ee 
!ee 
stringee  
.ee  !
IsNullOrEmptyee! .
(ee. /
scee/ 1
.ee1 2
basicOrderNumberee2 B
)eeB C
)eeC D
{ff 
	campaginsgg 
=gg 
	campaginsgg  )
.gg) *
Wheregg* /
(gg/ 0
sgg0 1
=>gg2 4
sgg5 6
.gg6 7
Idgg7 9
.gg9 :
ToStringgg: B
(ggB C
)ggC D
.ggD E
EqualsggE K
(ggK L
scggL N
.ggN O
basicOrderNumberggO _
)gg_ `
)gg` a
.gga b
ToListggb h
(ggh i
)ggi j
;ggj k
}hh 
}ii 
elsejj 
ifjj 
(jj 
scjj 
.jj 

searchTypejj "
==jj# %
$strjj& 0
)jj0 1
{kk 
ifll 
(ll 
!ll 
stringll 
.ll 
IsNullOrEmptyll )
(ll) *
scll* ,
.ll, -
advancedStatusll- ;
)ll; <
)ll< =
{mm 
intnn 
statusnn 
=nn  
intnn! $
.nn$ %
Parsenn% *
(nn* +
scnn+ -
.nn- .
advancedStatusnn. <
)nn< =
;nn= >
ifoo 
(oo 
statusoo 
==oo !
(oo" #
intoo# &
)oo& '
CampaignStatusoo' 5
.oo5 6
Rebroadcastedoo6 C
)ooC D
	campaginspp !
=pp" #
	campaginspp$ -
.pp- .
Wherepp. 3
(pp3 4
spp4 5
=>pp6 8
spp9 :
.pp: ;
OrderNumberpp; F
.ppF G
EndsWithppG O
(ppO P
$strppP U
)ppU V
)ppV W
.ppW X
ToListppX ^
(pp^ _
)pp_ `
;pp` a
elseqq 
	campaginsrr !
=rr" #
	campaginsrr$ -
.rr- .
Whererr. 3
(rr3 4
srr4 5
=>rr6 8
srr9 :
.rr: ;
Statusrr; A
==rrB D
statusrrE K
)rrK L
.rrL M
ToListrrM S
(rrS T
)rrT U
;rrU V
ViewBagss 
.ss "
AdvancedStatusSearchedss 2
=ss3 4
scss5 7
.ss7 8
advancedStatusss8 F
;ssF G
}tt 
ifuu 
(uu 
!uu 
stringuu 
.uu 
IsNullOrEmptyuu )
(uu) *
scuu* ,
.uu, -
advancedUseruu- 9
)uu9 :
)uu: ;
{vv 
	campaginsww 
=ww 
	campaginsww  )
.ww) *
Whereww* /
(ww/ 0
sww0 1
=>ww2 4
sww5 6
.ww6 7
	CreatedByww7 @
==wwA C
scwwD F
.wwF G
advancedUserwwG S
)wwS T
.wwT U
ToListwwU [
(ww[ \
)ww\ ]
;ww] ^
ViewBagxx 
.xx  
AdvancedUserSearchedxx 0
=xx1 2
scxx3 5
.xx5 6
advancedUserxx6 B
;xxB C
}yy 
if{{ 
({{ 
!{{ 
string{{ 
.{{ 
IsNullOrEmpty{{ )
({{) *
sc{{* ,
.{{, -
campaignName{{- 9
){{9 :
){{: ;
{|| 
sc}} 
.}} 
campaignName}} #
=}}$ %
sc}}& (
.}}( )
campaignName}}) 5
.}}5 6
ToLowerInvariant}}6 F
(}}F G
)}}G H
;}}H I
	campagins~~ 
=~~ 
	campagins~~  )
.~~) *
Where~~* /
(~~/ 0
s~~0 1
=>~~2 4
s~~5 6
.~~6 7
CampaignName~~7 C
.~~C D
IndexOf~~D K
(~~K L
sc~~L N
.~~N O
campaignName~~O [
,~~[ \
StringComparison~~] m
.~~m n%
CurrentCultureIgnoreCase	~~n �
)
~~� �
>=
~~� �
$num
~~� �
)
~~� �
.
~~� �
ToList
~~� �
(
~~� �
)
~~� �
;
~~� �
ViewBag 
. 
CampaignName (
=) *
sc+ -
.- .
campaignName. :
;: ;
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
isTested
��- 5
)
��5 6
)
��6 7
{
�� 
bool
�� 
IsTested
�� !
=
��" #
Boolean
��$ +
.
��+ ,
Parse
��, 1
(
��1 2
sc
��2 4
.
��4 5
isTested
��5 =
)
��= >
;
��> ?
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
Testing
��7 >
!=
��? A
null
��B F
&&
��2 4
s
��5 6
.
��6 7
Testing
��7 >
?
��> ?
.
��? @
IsTested
��@ H
==
��I K
IsTested
��L T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
IsTested
�� $
=
��% &
sc
��' )
.
��) *
isTested
��* 2
;
��2 3
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
orderedFrom
��- 8
)
��8 9
)
��9 :
{
�� 
DateTime
�� 
dateFrom
�� %
=
��& '
DateTime
��( 0
.
��0 1

ParseExact
��1 ;
(
��; <
sc
��< >
.
��> ?
orderedFrom
��? J
,
��J K
$str
��L X
,
��X Y
CultureInfo
��Z e
.
��e f
InvariantCulture
��f v
)
��v w
;
��w x
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedAt
��7 @
.
��@ A
Date
��A E
>=
��F H
dateFrom
��I Q
.
��Q R
Date
��R V
)
��V W
.
��W X
ToList
��X ^
(
��^ _
)
��_ `
;
��` a
ViewBag
�� 
.
�� 
OrderedFrom
�� '
=
��( )
sc
��* ,
.
��, -
orderedFrom
��- 8
;
��8 9
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
	orderedTo
��- 6
)
��6 7
)
��7 8
{
�� 
DateTime
�� 
dateTo
�� #
=
��$ %
DateTime
��& .
.
��. /

ParseExact
��/ 9
(
��9 :
sc
��: <
.
��< =
	orderedTo
��= F
,
��F G
$str
��H T
,
��T U
CultureInfo
��V a
.
��a b
InvariantCulture
��b r
)
��r s
;
��s t
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedAt
��7 @
.
��@ A
Date
��A E
<=
��F H
dateTo
��I O
.
��O P
Date
��P T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
	OrderedTo
�� %
=
��& '
sc
��( *
.
��* +
	orderedTo
��+ 4
;
��4 5
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
broadcastFrom
��- :
)
��: ;
)
��; <
{
�� 
DateTime
�� 
dateFrom
�� %
=
��& '
DateTime
��( 0
.
��0 1

ParseExact
��1 ;
(
��; <
sc
��< >
.
��> ?
broadcastFrom
��? L
,
��L M
$str
��N Z
,
��Z [
CultureInfo
��\ g
.
��g h
InvariantCulture
��h x
)
��x y
;
��y z
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
BroadcastDate
��7 D
?
��D E
.
��E F
Date
��F J
>=
��K M
dateFrom
��N V
.
��V W
Date
��W [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
;
��e f
ViewBag
�� 
.
�� 
BroadcastFrom
�� )
=
��* +
sc
��, .
.
��. /
broadcastFrom
��/ <
;
��< =
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
broadcastTo
��- 8
)
��8 9
)
��9 :
{
�� 
DateTime
�� 
dateTo
�� #
=
��$ %
DateTime
��& .
.
��. /

ParseExact
��/ 9
(
��9 :
sc
��: <
.
��< =
broadcastTo
��= H
,
��H I
$str
��J V
,
��V W
CultureInfo
��X c
.
��c d
InvariantCulture
��d t
)
��t u
;
��u v
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
BroadcastDate
��7 D
?
��D E
.
��E F
Date
��F J
<=
��K M
dateTo
��N T
.
��T U
Date
��U Y
)
��Y Z
.
��Z [
ToList
��[ a
(
��a b
)
��b c
;
��c d
ViewBag
�� 
.
�� 
BroadcastTo
�� '
=
��( )
sc
��* ,
.
��, -
broadcastTo
��- 8
;
��8 9
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
IsAdmin
�� 
)
�� 
{
�� 
	campagins
�� 
=
�� 
	campagins
�� %
.
��% &
Where
��& +
(
��+ ,
s
��, -
=>
��. 0
s
��1 2
.
��2 3
	CreatedBy
��3 <
==
��= ?
LoggedInUser
��@ L
?
��L M
.
��M N
UserName
��N V
)
��V W
.
��W X
ToList
��X ^
(
��^ _
)
��_ `
;
��` a
}
�� 
ViewBag
�� 
.
�� 
BasicOrderNumber
�� $
=
��% &
OrderNumberList
��' 6
;
��6 7
ViewBag
�� 
.
�� 
BasicStatus
�� 
=
��  !

StatusList
��" ,
;
��, -
ViewBag
�� 
.
�� 
AdvancedStatus
�� "
=
��# $

StatusList
��% /
;
��/ 0
ViewBag
�� 
.
�� 
AdvancedUser
��  
=
��! "
	UsersList
��# ,
;
��, -
ViewBag
�� 
.
�� 
Customer
�� 
=
�� 
	UsersList
�� (
;
��( )
int
�� 

pageNumber
�� 
=
�� 
(
�� 
sc
��  
.
��  !
page
��! %
??
��& (
$num
��) *
)
��* +
;
��+ ,
return
�� 
View
�� 
(
�� 
	campagins
�� !
.
��! "
ToPagedList
��" -
(
��- .

pageNumber
��. 8
,
��8 9
pageSize
��: B
)
��B C
)
��C D
;
��D E
}
�� 	
public
�� 
ActionResult
�� 
ChangeAssigned
�� *
(
��* +
Guid
��+ /
?
��/ 0
Id
��1 3
,
��3 4
string
��5 ;
UserId
��< B
)
��B C
{
�� 	
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
FirstOrDefault
��- ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
==
��F H
Id
��I K
)
��K L
;
��L M
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
try
�� 
{
�� 
campaign
�� 
.
��  
AssignedToCustomer
�� +
=
��, -
UserId
��. 4
;
��4 5
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
public
�� 
ActionResult
�� 
SendToTracking
�� *
(
��* +
Guid
��+ /
?
��/ 0
Id
��1 3
,
��3 4
string
��5 ;
SegmentNumber
��< I
,
��I J
string
��K Q
IONumber
��R Z
)
��Z [
{
�� 	
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
FirstOrDefault
��- ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
==
��F H
Id
��I K
)
��K L
;
��L M
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
try
�� 
{
�� 
CampaignTracking
��  
campaignTracking
��! 1
=
��2 3
null
��4 8
;
��8 9
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� '
(
��' (
SegmentNumber
��( 5
)
��5 6
)
��6 7
campaignTracking
�� $
=
��% &
db
��' )
.
��) *
CampaignTrackings
��* ;
.
��; <
FirstOrDefault
��< J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

CampaignId
��R \
==
��] _
Id
��` b
)
��b c
;
��c d
else
�� 
campaignTracking
�� $
=
��% &
db
��' )
.
��) *
CampaignTrackings
��* ;
.
��; <
FirstOrDefault
��< J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

CampaignId
��R \
==
��] _
Id
��` b
&&
��c e
x
��f g
.
��g h
SegmentNumber
��h u
==
��v x
SegmentNumber��y �
)��� �
;��� �
if
�� 
(
�� 
campaignTracking
�� $
!=
��% '
null
��( ,
)
��, -
{
�� 
campaignTracking
�� $
.
��$ %
IONumber
��% -
=
��. /
IONumber
��0 8
;
��8 9
}
�� 
campaign
�� 
.
�� 
Status
�� 
=
��  !
(
��" #
int
��# &
)
��& '
CampaignStatus
��( 6
.
��6 7

Monitoring
��7 A
;
��A B
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
}
�� 
}�� �
LE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CampaignsController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
CampaignsController $
:% &
BaseController' 5
{ 
int 
pageSize 
= 
$num 
; 
static 
char 
c1 
; 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
if!! 
(!! 
LoggedInUser!! 
==!! 
null!!  $
)!!$ %
return!!& ,
RedirectToAction!!- =
(!!= >
$str!!> F
,!!F G
$str!!H Q
)!!Q R
;!!R S
ViewBag## 
.## 
CurrentSort## 
=##  !
sc##" $
.##$ %
	sortOrder##% .
;##. /
ViewBag$$ 
.$$ 
OrderNumberSortParm$$ '
=$$( )
sc$$* ,
.$$, -
	sortOrder$$- 6
==$$7 9
$str$$: G
?$$H I
$str$$J \
:$$] ^
$str$$_ l
;$$l m
ViewBag%% 
.%%  
CampaignNameSortParm%% (
=%%) *
sc%%+ -
.%%- .
	sortOrder%%. 7
==%%8 :
$str%%; I
?%%J K
$str%%L _
:%%` a
$str%%b p
;%%p q
ViewBag&& 
.&& 
CreatedBySortParm&& %
=&&& '
sc&&( *
.&&* +
	sortOrder&&+ 4
==&&5 7
$str&&8 C
?&&D E
$str&&F V
:&&W X
$str&&Y d
;&&d e
ViewBag'' 
.'' 
CreatedAtSortParm'' %
=''& '
sc''( *
.''* +
	sortOrder''+ 4
==''5 7
$str''8 C
?''D E
$str''F V
:''W X
$str''Y d
;''d e
ViewBag(( 
.(( !
BroadcastDateSortParm(( )
=((* +
sc((, .
.((. /
	sortOrder((/ 8
==((9 ;
$str((< K
?((L M
$str((N b
:((c d
$str((e t
;((t u
ViewBag)) 
.)) 
QuantitySortParm)) $
=))% &
sc))' )
.))) *
	sortOrder))* 3
==))4 6
$str))7 A
?))B C
$str))D S
:))T U
$str))V `
;))` a
ViewBag** 
.** 
StatusSortParm** "
=**# $
sc**% '
.**' (
	sortOrder**( 1
==**2 4
$str**5 =
?**> ?
$str**@ M
:**N O
$str**P X
;**X Y
var,, 
	campagins,, 
=,, 
db-- 
.-- 
	Campaigns-- 
... 
Include.. 
(.. 
x.. 
=>.. 
x.. 
...  
Testing..  '
)..' (
...( )
Include..) 0
(..0 1
x..1 2
=>..3 5
x..6 7
...7 8
Approved..8 @
)..@ A
.// 
ToList// 
(// 
)// 
;// 
switch11 
(11 
sc11 
.11 
	sortOrder11  
)11  !
{22 
case33 
$str33 "
:33" #
	campagins44 
=44 
	campagins44  )
.44) *
OrderBy44* 1
(441 2
s442 3
=>444 6
s447 8
.448 9
OrderNumber449 D
)44D E
.44E F
ToList44F L
(44L M
)44M N
;44N O
break55 
;55 
case66 
$str66 '
:66' (
	campagins77 
=77 
	campagins77  )
.77) *
OrderByDescending77* ;
(77; <
s77< =
=>77> @
s77A B
.77B C
OrderNumber77C N
)77N O
.77O P
ToList77P V
(77V W
)77W X
;77X Y
break88 
;88 
case99 
$str99 #
:99# $
	campagins:: 
=:: 
	campagins::  )
.::) *
OrderBy::* 1
(::1 2
s::2 3
=>::4 6
s::7 8
.::8 9
CampaignName::9 E
)::E F
.::F G
ToList::G M
(::M N
)::N O
;::O P
break;; 
;;; 
case<< 
$str<< (
:<<( )
	campagins== 
=== 
	campagins==  )
.==) *
OrderByDescending==* ;
(==; <
s==< =
=>==> @
s==A B
.==B C
CampaignName==C O
)==O P
.==P Q
ToList==Q W
(==W X
)==X Y
;==Y Z
break>> 
;>> 
case?? 
$str??  
:??  !
	campagins@@ 
=@@ 
	campagins@@  )
.@@) *
OrderBy@@* 1
(@@1 2
s@@2 3
=>@@4 6
s@@7 8
.@@8 9
	CreatedBy@@9 B
)@@B C
.@@C D
ToList@@D J
(@@J K
)@@K L
;@@L M
breakAA 
;AA 
caseBB 
$strBB %
:BB% &
	campaginsCC 
=CC 
	campaginsCC  )
.CC) *
OrderByDescendingCC* ;
(CC; <
sCC< =
=>CC> @
sCCA B
.CCB C
	CreatedByCCC L
)CCL M
.CCM N
ToListCCN T
(CCT U
)CCU V
;CCV W
breakDD 
;DD 
caseEE 
$strEE  
:EE  !
	campaginsFF 
=FF 
	campaginsFF  )
.FF) *
OrderByFF* 1
(FF1 2
sFF2 3
=>FF4 6
sFF7 8
.FF8 9
	CreatedAtFF9 B
)FFB C
.FFC D
ToListFFD J
(FFJ K
)FFK L
;FFL M
breakGG 
;GG 
caseHH 
$strHH %
:HH% &
	campaginsII 
=II 
	campaginsII  )
.II) *
OrderByDescendingII* ;
(II; <
sII< =
=>II> @
sIIA B
.IIB C
	CreatedAtIIC L
)IIL M
.IIM N
ToListIIN T
(IIT U
)IIU V
;IIV W
breakJJ 
;JJ 
caseKK 
$strKK $
:KK$ %
	campaginsLL 
=LL 
	campaginsLL  )
.LL) *
OrderByLL* 1
(LL1 2
sLL2 3
=>LL4 6
sLL7 8
.LL8 9
BroadcastDateLL9 F
)LLF G
.LLG H
ToListLLH N
(LLN O
)LLO P
;LLP Q
breakMM 
;MM 
caseNN 
$strNN )
:NN) *
	campaginsOO 
=OO 
	campaginsOO  )
.OO) *
OrderByDescendingOO* ;
(OO; <
sOO< =
=>OO> @
sOOA B
.OOB C
BroadcastDateOOC P
)OOP Q
.OOQ R
ToListOOR X
(OOX Y
)OOY Z
;OOZ [
breakPP 
;PP 
caseQQ 
$strQQ 
:QQ  
	campaginsRR 
=RR 
	campaginsRR  )
.RR) *
OrderByRR* 1
(RR1 2
sRR2 3
=>RR4 6
sRR7 8
.RR8 9
QuantityRR9 A
)RRA B
.RRB C
ToListRRC I
(RRI J
)RRJ K
;RRK L
breakSS 
;SS 
caseTT 
$strTT $
:TT$ %
	campaginsUU 
=UU 
	campaginsUU  )
.UU) *
OrderByDescendingUU* ;
(UU; <
sUU< =
=>UU> @
sUUA B
.UUB C
QuantityUUC K
)UUK L
.UUL M
ToListUUM S
(UUS T
)UUT U
;UUU V
breakVV 
;VV 
caseWW 
$strWW 
:WW 
	campaginsXX 
=XX 
	campaginsXX  )
.XX) *
OrderByXX* 1
(XX1 2
sXX2 3
=>XX4 6
sXX7 8
.XX8 9
StatusXX9 ?
)XX? @
.XX@ A
ToListXXA G
(XXG H
)XXH I
;XXI J
breakYY 
;YY 
caseZZ 
$strZZ "
:ZZ" #
	campagins[[ 
=[[ 
	campagins[[  )
.[[) *
OrderByDescending[[* ;
([[; <
s[[< =
=>[[> @
s[[A B
.[[B C
Status[[C I
)[[I J
.[[J K
ToList[[K Q
([[Q R
)[[R S
;[[S T
break\\ 
;\\ 
default]] 
:]] 
	campagins^^ 
=^^ 
	campagins^^  )
.^^) *
OrderByDescending^^* ;
(^^; <
s^^< =
=>^^> @
s^^A B
.^^B C
	CreatedAt^^C L
)^^L M
.^^M N
ToList^^N T
(^^T U
)^^U V
;^^V W
break__ 
;__ 
}`` 
ViewBagbb 
.bb 

SearchTypebb 
=bb  
scbb! #
.bb# $

searchTypebb$ .
;bb. /
ifcc 
(cc 
sccc 
.cc 

searchTypecc 
==cc  
$strcc! (
)cc( )
{dd 
ifee 
(ee 
!ee 
stringee 
.ee 
IsNullOrEmptyee )
(ee) *
scee* ,
.ee, -
basicStringee- 8
)ee8 9
)ee9 :
{ff 
	campaginsgg 
=gg 
	campaginsgg  )
.gg) *
Wheregg* /
(gg/ 0
sgg0 1
=>gg2 4
shh 
.hh 
OrderNumberhh !
.hh! "
Equalshh" (
(hh( )
schh) +
.hh+ ,
basicStringhh, 7
)hh7 8
||hh9 ;
sii 
.ii $
ReBroadcastedOrderNumberii .
==ii/ 1
scii2 4
.ii4 5
basicStringii5 @
||iiA C
sjj 
.jj 
CampaignNamejj "
.jj" #
IndexOfjj# *
(jj* +
scjj+ -
.jj- .
basicStringjj. 9
,jj9 :
StringComparisonjj; K
.jjK L&
InvariantCultureIgnoreCasejjL f
)jjf g
>=jjh j
$numjjk l
)jjl m
.jjm n
ToListjjn t
(jjt u
)jju v
;jjv w
ViewBagkk 
.kk 
BasicStringSearchedkk /
=kk0 1
sckk2 4
.kk4 5
basicStringkk5 @
;kk@ A
}ll 
elsell 
ifll 
(ll 
!ll 
stringll "
.ll" #
IsNullOrEmptyll# 0
(ll0 1
scll1 3
.ll3 4
basicStatusll4 ?
)ll? @
)ll@ A
{mm 
intnn 
statusnn 
=nn  
intnn! $
.nn$ %
Parsenn% *
(nn* +
scnn+ -
.nn- .
basicStatusnn. 9
)nn9 :
;nn: ;
ifoo 
(oo 
statusoo 
==oo !
(oo" #
intoo# &
)oo& '
CampaignStatusoo' 5
.oo5 6
Rebroadcastedoo6 C
)ooC D
	campaginspp !
=pp" #
	campaginspp$ -
.pp- .
Wherepp. 3
(pp3 4
spp4 5
=>pp6 8
spp9 :
.pp: ;
ReBroadcastedpp; H
)ppH I
.ppI J
ToListppJ P
(ppP Q
)ppQ R
;ppR S
elseqq 
ifqq 
(qq 
statusqq #
==qq$ &
(qq' (
intqq( +
)qq+ ,
CampaignStatusqq, :
.qq: ;
NotRebroadcastedqq; K
)qqK L
	campaginsrr !
=rr" #
	campaginsrr$ -
.rr- .
Whererr. 3
(rr3 4
srr4 5
=>rr6 8
srr9 :
.rr: ;
ReBroadCastrr; F
&&rrG I
!rrJ K
srrK L
.rrL M
ReBroadcastedrrM Z
)rrZ [
.rr[ \
ToListrr\ b
(rrb c
)rrc d
;rrd e
elsess 
	campaginstt !
=tt" #
	campaginstt$ -
.tt- .
Wherett. 3
(tt3 4
stt4 5
=>tt6 8
stt9 :
.tt: ;
Statustt; A
==ttB D
statusttE K
)ttK L
.ttL M
ToListttM S
(ttS T
)ttT U
;ttU V
ViewBaguu 
.uu 
BasicStatusSearcheduu /
=uu0 1
scuu2 4
.uu4 5
basicStatusuu5 @
;uu@ A
}vv 
elsevv 
ifvv 
(vv 
!vv 
stringvv "
.vv" #
IsNullOrEmptyvv# 0
(vv0 1
scvv1 3
.vv3 4
basicOrderNumbervv4 D
)vvD E
)vvE F
{ww 
	campaginsxx 
=xx 
	campaginsxx  )
.xx) *
Wherexx* /
(xx/ 0
sxx0 1
=>xx2 4
sxx5 6
.xx6 7
Idxx7 9
.xx9 :
ToStringxx: B
(xxB C
)xxC D
.xxD E
EqualsxxE K
(xxK L
scxxL N
.xxN O
basicOrderNumberxxO _
)xx_ `
)xx` a
.xxa b
ToListxxb h
(xxh i
)xxi j
;xxj k
}yy 
}{{ 
else|| 
if|| 
(|| 
sc|| 
.|| 

searchType|| "
==||# %
$str||& 0
)||0 1
{}} 
if~~ 
(~~ 
!~~ 
string~~ 
.~~ 
IsNullOrEmpty~~ )
(~~) *
sc~~* ,
.~~, -
advancedStatus~~- ;
)~~; <
)~~< =
{ 
int
�� 
status
�� 
=
��  
int
��! $
.
��$ %
Parse
��% *
(
��* +
sc
��+ -
.
��- .
advancedStatus
��. <
)
��< =
;
��= >
if
�� 
(
�� 
status
�� 
==
�� !
(
��" #
int
��# &
)
��& '
CampaignStatus
��' 5
.
��5 6
Rebroadcasted
��6 C
)
��C D
	campagins
�� !
=
��" #
	campagins
��$ -
.
��- .
Where
��. 3
(
��3 4
s
��4 5
=>
��6 8
s
��9 :
.
��: ;
OrderNumber
��; F
.
��F G
EndsWith
��G O
(
��O P
$str
��P U
)
��U V
)
��V W
.
��W X
ToList
��X ^
(
��^ _
)
��_ `
;
��` a
else
�� 
	campagins
�� !
=
��" #
	campagins
��$ -
.
��- .
Where
��. 3
(
��3 4
s
��4 5
=>
��6 8
s
��9 :
.
��: ;
Status
��; A
==
��B D
status
��E K
)
��K L
.
��L M
ToList
��M S
(
��S T
)
��T U
;
��U V
ViewBag
�� 
.
�� $
AdvancedStatusSearched
�� 2
=
��3 4
sc
��5 7
.
��7 8
advancedStatus
��8 F
;
��F G
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
advancedUser
��- 9
)
��9 :
)
��: ;
{
�� 
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedBy
��7 @
==
��A C
sc
��D F
.
��F G
advancedUser
��G S
)
��S T
.
��T U
ToList
��U [
(
��[ \
)
��\ ]
;
��] ^
ViewBag
�� 
.
�� "
AdvancedUserSearched
�� 0
=
��1 2
sc
��3 5
.
��5 6
advancedUser
��6 B
;
��B C
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
campaignName
��- 9
)
��9 :
)
��: ;
{
�� 
sc
�� 
.
�� 
campaignName
�� #
=
��$ %
sc
��& (
.
��( )
campaignName
��) 5
.
��5 6
ToLowerInvariant
��6 F
(
��F G
)
��G H
;
��H I
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
CampaignName
��7 C
.
��C D
IndexOf
��D K
(
��K L
sc
��L N
.
��N O
campaignName
��O [
,
��[ \
StringComparison
��] m
.
��m n'
CurrentCultureIgnoreCase��n �
)��� �
>=��� �
$num��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
ViewBag
�� 
.
�� 
CampaignName
�� (
=
��) *
sc
��+ -
.
��- .
campaignName
��. :
;
��: ;
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
isTested
��- 5
)
��5 6
)
��6 7
{
�� 
bool
�� 
IsTested
�� !
=
��" #
Boolean
��$ +
.
��+ ,
Parse
��, 1
(
��1 2
sc
��2 4
.
��4 5
isTested
��5 =
)
��= >
;
��> ?
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
Testing
��7 >
!=
��? A
null
��B F
&&
��2 4
s
��5 6
.
��6 7
Testing
��7 >
?
��> ?
.
��? @
IsTested
��@ H
==
��I K
IsTested
��L T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
IsTested
�� $
=
��% &
sc
��' )
.
��) *
isTested
��* 2
;
��2 3
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
orderedFrom
��- 8
)
��8 9
)
��9 :
{
�� 
DateTime
�� 
dateFrom
�� %
=
��& '
DateTime
��( 0
.
��0 1

ParseExact
��1 ;
(
��; <
sc
��< >
.
��> ?
orderedFrom
��? J
,
��J K
$str
��L X
,
��X Y
CultureInfo
��Z e
.
��e f
InvariantCulture
��f v
)
��v w
;
��w x
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedAt
��7 @
.
��@ A
Date
��A E
>=
��F H
dateFrom
��I Q
.
��Q R
Date
��R V
)
��V W
.
��W X
ToList
��X ^
(
��^ _
)
��_ `
;
��` a
ViewBag
�� 
.
�� 
OrderedFrom
�� '
=
��( )
sc
��* ,
.
��, -
orderedFrom
��- 8
;
��8 9
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
	orderedTo
��- 6
)
��6 7
)
��7 8
{
�� 
DateTime
�� 
dateTo
�� #
=
��$ %
DateTime
��& .
.
��. /

ParseExact
��/ 9
(
��9 :
sc
��: <
.
��< =
	orderedTo
��= F
,
��F G
$str
��H T
,
��T U
CultureInfo
��V a
.
��a b
InvariantCulture
��b r
)
��r s
;
��s t
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedAt
��7 @
.
��@ A
Date
��A E
<=
��F H
dateTo
��I O
.
��O P
Date
��P T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
	OrderedTo
�� %
=
��& '
sc
��( *
.
��* +
	orderedTo
��+ 4
;
��4 5
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
broadcastFrom
��- :
)
��: ;
)
��; <
{
�� 
DateTime
�� 
dateFrom
�� %
=
��& '
DateTime
��( 0
.
��0 1

ParseExact
��1 ;
(
��; <
sc
��< >
.
��> ?
broadcastFrom
��? L
,
��L M
$str
��N Z
,
��Z [
CultureInfo
��\ g
.
��g h
InvariantCulture
��h x
)
��x y
;
��y z
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
BroadcastDate
��7 D
?
��D E
.
��E F
Date
��F J
>=
��K M
dateFrom
��N V
.
��V W
Date
��W [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
;
��e f
ViewBag
�� 
.
�� 
BroadcastFrom
�� )
=
��* +
sc
��, .
.
��. /
broadcastFrom
��/ <
;
��< =
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
broadcastTo
��- 8
)
��8 9
)
��9 :
{
�� 
DateTime
�� 
dateTo
�� #
=
��$ %
DateTime
��& .
.
��. /

ParseExact
��/ 9
(
��9 :
sc
��: <
.
��< =
broadcastTo
��= H
,
��H I
$str
��J V
,
��V W
CultureInfo
��X c
.
��c d
InvariantCulture
��d t
)
��t u
;
��u v
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
BroadcastDate
��7 D
?
��D E
.
��E F
Date
��F J
<=
��K M
dateTo
��N T
.
��T U
Date
��U Y
)
��Y Z
.
��Z [
ToList
��[ a
(
��a b
)
��b c
;
��c d
ViewBag
�� 
.
�� 
BroadcastTo
�� '
=
��( )
sc
��* ,
.
��, -
broadcastTo
��- 8
;
��8 9
}
�� 
}
�� 
if
�� 
(
�� 
LoggedInUser
�� 
!=
�� 
null
��  $
&&
��% '
!
��( )
IsAdmin
��) 0
)
��0 1
{
�� 
	campagins
�� 
=
�� 
	campagins
�� %
.
��% &
Where
��& +
(
��+ ,
s
��, -
=>
��. 0
s
��1 2
.
��2 3
	CreatedBy
��3 <
==
��= ?
LoggedInUser
��@ L
.
��L M
UserName
��M U
)
��U V
.
��V W
ToList
��W ]
(
��] ^
)
��^ _
;
��_ `
}
�� 
ViewBag
�� 
.
�� 
BasicOrderNumber
�� $
=
��% &
OrderNumberList
��' 6
;
��6 7
ViewBag
�� 
.
�� 
BasicStatus
�� 
=
��  !

StatusList
��" ,
;
��, -
ViewBag
�� 
.
�� 
AdvancedStatus
�� "
=
��# $

StatusList
��% /
;
��/ 0
ViewBag
�� 
.
�� 
AdvancedUser
��  
=
��! "
	UsersList
��# ,
;
��, -
string
�� 
idsForPrint
�� 
=
��  
string
��! '
.
��' (
IsNullOrEmpty
��( 5
(
��5 6
ViewBag
��6 =
.
��= >
	SearchIds
��> G
)
��G H
?
��I J
string
��$ *
.
��* +
Join
��+ /
(
��/ 0
$str
��0 3
,
��3 4
	campagins
��5 >
.
��> ?
Select
��? E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
Id
��M O
.
��O P
ToString
��P X
(
��X Y
)
��Y Z
)
��Z [
)
��[ \
:
��$ %
ViewBag
��& -
.
��- .
	SearchIds
��. 7
;
��7 8
Session
�� 
[
�� 
$str
�� !
]
��! "
=
��# $
idsForPrint
��% 0
;
��0 1
int
�� 

pageNumber
�� 
=
�� 
(
�� 
sc
��  
.
��  !
page
��! %
??
��& (
$num
��) *
)
��* +
;
��+ ,
return
�� 
View
�� 
(
�� 
	campagins
�� !
.
��! "
ToPagedList
��" -
(
��- .

pageNumber
��. 8
,
��8 9
pageSize
��: B
)
��B C
)
��C D
;
��D E
}
�� 	
public
�� 
ActionResult
�� 
Download
�� $
(
��$ %
)
��% &
{
�� 	
string
�� 
fileName
�� 
=
�� 
string
�� $
.
��$ %
Format
��% +
(
��+ ,
$str
��, L
,
��L M
DateTime
��N V
.
��V W
Now
��W Z
)
��Z [
;
��[ \
var
�� 
filePath
�� 
=
�� 
string
�� !
.
��! "
Format
��" (
(
��( )
$str
��) 3
,
��3 4
DownloadPath
��5 A
,
��A B
fileName
��C K
)
��K L
;
��L M
if
�� 
(
�� 
Session
�� 
[
�� 
$str
�� %
]
��% &
!=
��' )
null
��* .
)
��. /
{
�� 
List
�� 
<
�� 
Guid
�� 
>
�� 
ids
�� 
;
�� 
try
�� 
{
�� 
ids
�� 
=
�� 
(
�� 
Session
��  
[
��  !
$str
��! .
]
��. /
as
��0 2
string
��3 9
)
��9 :
.
��: ;
Split
��; @
(
��@ A
$str
��A D
.
��D E
ToCharArray
��E P
(
��P Q
)
��Q R
)
��R S
.
��S T
Select
��T Z
(
��Z [
x
��[ \
=>
��] _
Guid
��` d
.
��d e
Parse
��e j
(
��j k
x
��k l
)
��l m
)
��m n
.
��n o
ToList
��o u
(
��u v
)
��v w
;
��w x
var
�� 
	campagins
�� !
=
��" #
db
��$ &
.
��& '
	Campaigns
��' 0
.
�� 
Include
��  
(
��  !
x
��! "
=>
��# %
x
��& '
.
��' (
Testing
��( /
)
��/ 0
.
��0 1
Include
��1 8
(
��8 9
x
��9 :
=>
��; =
x
��> ?
.
��? @
Approved
��@ H
)
��H I
.
�� 
Where
�� 
(
�� 
x
��  
=>
��! #
ids
��$ '
.
��' (
Contains
��( 0
(
��0 1
x
��1 2
.
��2 3
Id
��3 5
)
��5 6
)
��6 7
.
�� 
ToList
�� 
(
��  
)
��  !
.
�� 
Select
�� 
(
��  
x
��  !
=>
��" $
new
��% (
CampaignReportVM
��) 9
(
��9 :
)
��: ;
{
�� 
OrderNumber
�� '
=
��( )
x
��* +
.
��+ ,
OrderNumber
��, 7
,
��7 8
CampaignName
�� (
=
��) *
x
��+ ,
.
��, -
CampaignName
��- 9
,
��9 :
BroadcastDate
�� )
=
��* +
x
��, -
.
��- .
BroadcastDate
��. ;
?
��; <
.
��< =
ToString
��= E
(
��E F
)
��F G
,
��G H
Quantity
�� $
=
��% &
x
��' (
.
��( )
Approved
��) 1
!=
��2 4
null
��5 9
?
��: ;
x
��< =
.
��= >
Approved
��> F
.
��F G
Quantity
��G O
.
��O P
ToString
��P X
(
��X Y
)
��Y Z
:
��[ \
x
��] ^
.
��^ _
Testing
��_ f
!=
��g i
null
��j n
?
��o p
x
��q r
.
��r s
Testing
��s z
.
��z {
Quantity��{ �
.��� �
ToString��� �
(��� �
)��� �
:��� �
x��� �
.��� �
Quantity��� �
.��� �
ToString��� �
(��� �
)��� �
,��� �
Status
�� "
=
��# $
System
��% +
.
��+ ,
Enum
��, 0
.
��0 1
GetName
��1 8
(
��8 9
typeof
��9 ?
(
��? @
CampaignStatus
��@ N
)
��N O
,
��O P
x
��Q R
.
��R S
Status
��S Y
)
��Y Z
}
�� 
)
�� 
;
�� 
	campagins
�� 
.
�� 
ToCsv
�� #
(
��# $
filePath
��$ ,
,
��, -
new
��. 1
CsvDefinition
��2 ?
(
��? @
)
��@ A
{
�� 
	EndOfLine
�� !
=
��" #
$str
��$ *
,
��* +
FieldSeparator
�� &
=
��' (
$char
��) ,
,
��, -
TextQualifier
�� %
=
��& '
$char
��( +
,
��+ ,
Columns
�� 
=
��" #
new
��$ '
List
��( ,
<
��, -
string
��- 3
>
��3 4
{
��5 6
$str
��7 D
,
��D E
$str
��F T
,
��T U
$str
��V e
,
��e f
$str
��g q
,
��q r
$str
��s {
}
��| }
}
�� 
)
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( 7
+
��8 9
ex
��: <
.
��< =
Message
��= D
)
��D E
;
��E F
}
�� 
}
�� 
return
�� 
File
�� 
(
�� 
filePath
��  
,
��  !
$str
��" ,
,
��, -
fileName
��. 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
ActionResult
�� 
Details
�� #
(
��# $
Guid
��$ (
?
��( )
id
��* ,
)
��, -
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
public
�� 
ActionResult
�� 

NewSegment
�� &
(
��& '
)
��' (
{
�� 	
var
�� 
segment
�� 
=
�� 
new
�� 
CampaignSegment
�� -
(
��- .
)
��. /
{
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� !
(
��! "
)
��" #
,
��# $
	CreatedAt
�� 
=
�� 
DateTime
�� $
.
��$ %
Now
��% (
,
��( )
SegmentNumber
�� 
=
�� 
$str
��  "
+
��# $
c1
��% '
++
��' )
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� J
,
��J K
segment
��L S
)
��S T
;
��T U
}
�� 	
public
�� 
ActionResult
�� 
Create
�� "
(
��" #
)
��# $
{
�� 	
c1
�� 
=
�� 
$char
�� 
;
�� 

CampaignVM
�� 
model
�� 
=
�� 
new
�� "

CampaignVM
��# -
(
��- .
)
��. /
{
��  
RepresentativeName
�� "
=
��# $
LoggedInUser
��% 1
?
��1 2
.
��2 3
UserName
��3 ;
,
��; <!
RepresentativeEmail
�� #
=
��$ %
LoggedInUser
��& 2
?
��2 3
.
��3 4
Email
��4 9
,
��9 :
ChannelTypes
�� 
=
�� 
new
�� "
List
��# '
<
��' (
ChannelType
��( 3
>
��3 4
{
��5 6
}
��7 8
}
�� 
;
�� 
ViewBag
�� 
.
�� 
TestingUrgency
�� "
=
��# $
new
��% (

SelectList
��) 3
(
��3 4

EnumHelper
��4 >
.
��> ?
GetEnumTextValues
��? P
(
��P Q
typeof
��Q W
(
��W X
TestingUrgency
��X f
)
��f g
)
��g h
,
��h i
$str
��j q
,
��q r
$str
�� 
,
�� 
model
�� 
.
�� 
TestingUrgency
�� ,
)
��, -
;
��- .
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
Create
�� "
(
��" #
[
�� 
Bind
�� 
(
�� 
Include
�� 
=
�� 
$str�� �
)��� �
]��� �

CampaignVM��� �

campaignVm��� �
)��� �
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
try
�� 
{
�� 
var
�� 
camps
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
ToList
��- 3
(
��3 4
)
��4 5
;
��5 6
int
�� 
newOrderNumber
�� &
=
��' (
camps
��) .
.
��. /
Count
��/ 4
>
��5 6
$num
��7 8
?
�� 
camps
�� 
.
��  
Max
��  #
(
��# $
x
��$ %
=>
��& (
int
��) ,
.
��, -
Parse
��- 2
(
��2 3
x
��3 4
.
��4 5
OrderNumber
��5 @
.
��@ A
TrimEnd
��A H
(
��H I
$str
��I N
.
��N O
ToCharArray
��O Z
(
��Z [
)
��[ \
)
��\ ]
)
��] ^
)
��^ _
+
��` a
$num
��b c
:
�� 
$num
�� 
;
�� 
string
�� 
userName
�� #
=
��$ %
LoggedInUser
��& 2
?
��2 3
.
��3 4
UserName
��4 <
;
��< =

TinyMapper
�� 
.
�� 
Bind
�� #
<
��# $

CampaignVM
��$ .
,
��. /
Campaign
��0 8
>
��8 9
(
��9 :
config
��: @
=>
��A C
{
�� 
config
�� 
.
�� 
Ignore
�� %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
Segments
��- 5
)
��5 6
;
��6 7
config
�� 
.
�� 
Ignore
�� %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
ChannelTypes
��- 9
)
��9 :
;
��: ;
}
�� 
)
�� 
;
�� 
var
�� 
campaign
��  
=
��! "

TinyMapper
��# -
.
��- .
Map
��. 1
<
��1 2
Campaign
��2 :
>
��: ;
(
��; <

campaignVm
��< F
)
��F G
;
��G H
char
�� 
c2
�� 
=
�� 
$char
�� !
;
��! "
foreach
�� 
(
�� 
var
��  
	segmentVm
��! *
in
��+ -

campaignVm
��. 8
.
��8 9
Segments
��9 A
)
��A B
{
�� 
var
�� 
segment
�� #
=
��$ %

TinyMapper
��& 0
.
��0 1
Map
��1 4
<
��4 5
CampaignSegment
��5 D
>
��D E
(
��E F
	segmentVm
��F O
)
��O P
;
��P Q
segment
�� 
.
��  
Id
��  "
=
��# $
Guid
��% )
.
��) *
NewGuid
��* 1
(
��1 2
)
��2 3
;
��3 4
segment
�� 
.
��  
	CreatedAt
��  )
=
��* +
DateTime
��, 4
.
��4 5
Now
��5 8
;
��8 9
segment
�� 
.
��  
OrderNumber
��  +
=
��, -
$str
��. 0
+
��1 2
newOrderNumber
��3 A
;
��A B
segment
�� 
.
��  
SegmentNumber
��  -
=
��. /
newOrderNumber
��0 >
+
��? @
$str
��A C
+
��D E
c2
��F H
++
��H J
;
��J K
campaign
��  
.
��  !
Segments
��! )
.
��) *
Add
��* -
(
��- .
segment
��. 5
)
��5 6
;
��6 7
}
�� 
campaign
�� 
.
�� 
Id
�� 
=
��  !
Guid
��" &
.
��& '
NewGuid
��' .
(
��. /
)
��/ 0
;
��0 1
campaign
�� 
.
�� 
	CreatedAt
�� &
=
��' (
DateTime
��) 1
.
��1 2
Now
��2 5
;
��5 6
campaign
�� 
.
�� 
	CreatedBy
�� &
=
��' (
userName
��) 1
;
��1 2
campaign
�� 
.
�� 
OrderNumber
�� (
=
��) *
newOrderNumber
��+ 9
.
��9 :
ToString
��: B
(
��B C
)
��C D
;
��D E
campaign
�� 
.
�� 
IP
�� 
=
��  !
Request
��" )
.
��) *
ServerVariables
��* 9
[
��9 :
$str
��: G
]
��G H
;
��H I
campaign
�� 
.
�� 
Browser
�� $
=
��% &
Request
��' .
.
��. /
	UserAgent
��/ 8
;
��8 9
campaign
�� 
.
�� 
OS
�� 
=
��  !
Environment
��" -
.
��- .
	OSVersion
��. 7
.
��7 8
Platform
��8 @
+
��A B
$str
��C F
+
��G H
Environment
��I T
.
��T U
	OSVersion
��U ^
.
��^ _
VersionString
��_ l
;
��l m
campaign
�� 
.
�� 
Referrer
�� %
=
��& '
Request
��( /
.
��/ 0
UrlReferrer
��0 ;
.
��; <
AbsolutePath
��< H
;
��H I
campaign
�� 
.
�� 
ChannelTypes
�� )
=
��* +

campaignVm
��, 6
.
��6 7
ChannelTypes
��7 C
==
��D F
null
��G K
?
��L M
null
��N R
:
��S T
string
�� 
.
�� 
Join
�� #
(
��# $
$str
��$ '
,
��' (

campaignVm
��) 3
.
��3 4
ChannelTypes
��4 @
)
��@ A
;
��A B
campaign
�� 
.
�� 
Assets
�� #
.
��# $
Id
��$ &
=
��' (
Guid
��) -
.
��- .
NewGuid
��. 5
(
��5 6
)
��6 7
;
��7 8
campaign
�� 
.
�� 
Assets
�� #
.
��# $

CampaignId
��$ .
=
��/ 0
campaign
��1 9
.
��9 :
Id
��: <
;
��< =
campaign
�� 
.
�� 
Assets
�� #
.
��# $
	CreatedAt
��$ -
=
��. /
DateTime
��0 8
.
��8 9
Now
��9 <
;
��< =
campaign
�� 
.
�� 
Assets
�� #
.
��# $
	CreatedBy
��$ -
=
��. /
userName
��0 8
;
��8 9
db
�� 
.
�� 
	Campaigns
��  
.
��  !
Add
��! $
(
��$ %
campaign
��% -
)
��- .
;
��. /
db
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
BackgroundJob
�� !
.
��! "
Enqueue
��" )
(
��) *
(
��* +
)
��+ ,
=>
��- /
FileProcessor
��0 =
.
��= >
ProcessNewOrder
��> M
(
��M N
campaign
��N V
.
��V W
OrderNumber
��W b
,
��b c
userName
��d l
)
��l m
)
��m n
;
��n o
ForceOrders
�� 
=
��  !
true
��" &
;
��& '
TempData
�� 
[
�� 
$str
�� &
]
��& '
=
��( )
$str
��* 5
+
��5 6
campaign
��7 ?
.
��? @
OrderNumber
��@ K
+
��L M
$str
��N \
+
��] ^
campaign
��_ g
.
��g h
CampaignName
��h t
+
��u v
$str��w �
;��� �
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
TempData
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
$str
��( M
+
��N O
ex
��P R
.
��R S
Message
��S Z
;
��Z [
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
)
��/ 0
;
��0 1
}
�� 

campaignVm
�� 
.
�� 
ChannelTypes
�� #
=
��$ %

campaignVm
��& 0
.
��0 1
ChannelTypes
��1 =
??
��> @
new
��A D
List
��E I
<
��I J
ChannelType
��J U
>
��U V
{
��W X
}
��X Y
;
��Y Z
ViewBag
�� 
.
�� 
TestingUrgency
�� "
=
��# $
new
��% (

SelectList
��) 3
(
��3 4

EnumHelper
��4 >
.
��> ?
GetEnumTextValues
��? P
(
��P Q
typeof
��Q W
(
��W X
TestingUrgency
��X f
)
��f g
)
��g h
,
��h i
$str
��j q
,
��q r
$str
�� 
,
�� 

campaignVm
�� "
.
��" #
TestingUrgency
��# 1
)
��1 2
;
��2 3
return
�� 
View
�� 
(
�� 

campaignVm
�� "
)
��" #
;
��# $
}
�� 	
public
�� 
ActionResult
�� 
Edit
��  
(
��  !
Guid
��! %
?
��% &
id
��' )
)
��) *
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
ViewBag
�� 
.
�� 
TestingUrgency
�� "
=
��# $
new
��% (

SelectList
��) 3
(
��3 4

EnumHelper
��4 >
.
��> ?
GetEnumTextValues
��? P
(
��P Q
typeof
��Q W
(
��W X
TestingUrgency
��X f
)
��f g
)
��g h
,
��h i
$str
��j q
,
��q r
$str
�� 
,
�� 
campaign
��  
.
��  !
TestingUrgency
��! /
)
��/ 0
;
��0 1
ViewBag
�� 
.
�� 
Status
�� 
=
�� 
new
��  

SelectList
��! +
(
��+ ,

EnumHelper
��, 6
.
��6 7
GetEnumTextValues
��7 H
(
��H I
typeof
��I O
(
��O P
CampaignStatus
��P ^
)
��^ _
)
��_ `
,
��` a
$str
��b i
,
��i j
$str
��k q
,
��q r
campaign
�� 
.
�� 
Status
�� 
)
��  
;
��  !
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
Edit
��  
(
��  !
[
�� 
Bind
�� 
(
�� 
Include
�� 
=
�� 
$str�� �
)
�� 
]
�� 
Campaign
�� 
campaign
�� !
)
��! "
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
db
�� 
.
�� 
Entry
�� 
(
�� 
campaign
�� !
)
��! "
.
��" #
State
��# (
=
��) *
EntityState
��+ 6
.
��6 7
Modified
��7 ?
;
��? @
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
)
��/ 0
;
��0 1
}
�� 
ViewBag
�� 
.
�� 
TestingUrgency
�� "
=
��# $
new
��% (

SelectList
��) 3
(
��3 4

EnumHelper
��4 >
.
��> ?
GetEnumTextValues
��? P
(
��P Q
typeof
��Q W
(
��W X
TestingUrgency
��X f
)
��f g
)
��g h
,
��h i
$str
��j q
,
��q r
$str
�� 
,
�� 
campaign
��  
.
��  !
TestingUrgency
��! /
)
��/ 0
;
��0 1
ViewBag
�� 
.
�� 
Status
�� 
=
�� 
new
��  

SelectList
��! +
(
��+ ,

EnumHelper
��, 6
.
��6 7
GetEnumTextValues
��7 H
(
��H I
typeof
��I O
(
��O P
CampaignStatus
��P ^
)
��^ _
)
��_ `
,
��` a
$str
��b i
,
��i j
$str
��k q
,
��q r
campaign
�� 
.
�� 
Status
�� 
)
��  
;
��  !
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
public
�� 
ActionResult
�� 
Clone
�� !
(
��! "
Guid
��" &
?
��& '
id
��( *
)
��* +
{
�� 	
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� 
,
��  
campaign
��! )
)
��) *
;
��* +
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� %
)
��% &
]
��& '
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
CloneConfirmed
�� *
(
��* +
Guid
��+ /
id
��0 2
)
��2 3
{
�� 	
var
�� 
camps
�� 
=
�� 
db
�� 
.
�� 
	Campaigns
�� $
.
��$ %
ToList
��% +
(
��+ ,
)
��, -
;
��- .
int
�� 
newOrderNumber
�� 
=
��  
camps
��! &
.
��& '
Count
��' ,
>
��- .
$num
��/ 0
?
��1 2
camps
��3 8
.
��8 9
Max
��9 <
(
��< =
x
��= >
=>
��? A
int
��B E
.
��E F
Parse
��F K
(
��K L
x
��L M
.
��M N
OrderNumber
��N Y
.
��Y Z
TrimEnd
��Z a
(
��a b
$str
��b g
.
��g h
ToCharArray
��h s
(
��s t
)
��t u
)
��u v
)
��v w
)
��w x
+
��y z
$num
��{ |
:
��} ~
$num�� �
;��� �
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Assets
��  &
)
��& '
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Segments
��  (
)
��( )
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Testing
��  '
)
��' (
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Approved
��  (
)
��( )
.
�� 
FirstOrDefault
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
Id
��' )
==
��* ,
id
��- /
)
��/ 0
;
��0 1
var
�� 
copyId
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� %
(
��% &
)
��& '
;
��' (
var
�� 
copy
�� 
=
�� 
new
�� 
Campaign
�� #
(
��# $
)
��$ %
;
��% &
db
�� 
.
�� 
	Campaigns
�� 
.
�� 
Add
�� 
(
�� 
copy
�� !
)
��! "
;
��" #
db
�� 
.
�� 
Entry
�� 
(
�� 
copy
�� 
)
�� 
.
�� 
CurrentValues
�� (
.
��( )
	SetValues
��) 2
(
��2 3
db
��3 5
.
��5 6
Entry
��6 ;
(
��; <
campaign
��< D
)
��D E
.
��E F
CurrentValues
��F S
)
��S T
;
��T U
copy
�� 
.
�� 
Id
�� 
=
�� 
copyId
�� 
;
�� 
copy
�� 
.
�� 
	CreatedAt
�� 
=
�� 
DateTime
�� %
.
��% &
Now
��& )
;
��) *
copy
�� 
.
�� 
OrderNumber
�� 
=
�� 
newOrderNumber
�� -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
;
��8 9
copy
�� 
.
�� 
Status
�� 
=
�� 
(
�� 
int
�� 
)
�� 
CampaignStatus
�� -
.
��- .
OrderRecevied
��. ;
;
��; <
copy
�� 
.
�� 
	TestingId
�� 
=
�� 
null
�� !
;
��! "
copy
�� 
.
�� 

ApprovedId
�� 
=
�� 
null
�� "
;
��" #
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
var
�� 

copyAssets
�� 
=
�� 
new
��  
CampaignAsset
��! .
(
��. /
)
��/ 0
;
��0 1
db
�� 
.
�� 
CampaignAssets
�� 
.
�� 
Add
�� !
(
��! "

copyAssets
��" ,
)
��, -
;
��- .
db
�� 
.
�� 
Entry
�� 
(
�� 

copyAssets
�� 
)
��  
.
��  !
CurrentValues
��! .
.
��. /
	SetValues
��/ 8
(
��8 9
db
��9 ;
.
��; <
Entry
��< A
(
��A B
campaign
��B J
.
��J K
Assets
��K Q
)
��Q R
.
��R S
CurrentValues
��S `
)
��` a
;
��a b

copyAssets
�� 
.
�� 
Id
�� 
=
�� 
Guid
��  
.
��  !
NewGuid
��! (
(
��( )
)
��) *
;
��* +

copyAssets
�� 
.
�� 

CampaignId
�� !
=
��" #
copyId
��$ *
;
��* +

copyAssets
�� 
.
�� 
	CreatedAt
��  
=
��! "
DateTime
��# +
.
��+ ,
Now
��, /
;
��/ 0
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
copy
�� 
.
�� 
AssetsId
�� 
=
�� 

copyAssets
�� &
.
��& '
Id
��' )
;
��) *
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
foreach
�� 
(
�� 
var
�� 
segment
��  
in
��! #
campaign
��$ ,
.
��, -
Segments
��- 5
.
��5 6
ToList
��6 <
(
��< =
)
��= >
)
��> ?
{
�� 
var
�� 
copySegment
�� 
=
��  !
new
��" %
CampaignSegment
��& 5
(
��5 6
)
��6 7
;
��7 8
db
�� 
.
�� 
CampaignSegments
�� #
.
��# $
Add
��$ '
(
��' (
copySegment
��( 3
)
��3 4
;
��4 5
db
�� 
.
�� 
Entry
�� 
(
�� 
copySegment
�� $
)
��$ %
.
��% &
CurrentValues
��& 3
.
��3 4
	SetValues
��4 =
(
��= >
db
��> @
.
��@ A
Entry
��A F
(
��F G
segment
��G N
)
��N O
.
��O P
CurrentValues
��P ]
)
��] ^
;
��^ _
copySegment
�� 
.
�� 
Id
�� 
=
��  
Guid
��! %
.
��% &
NewGuid
��& -
(
��- .
)
��. /
;
��/ 0
copySegment
�� 
.
�� 

CampaignId
�� &
=
��' (
copyId
��) /
;
��/ 0
copySegment
�� 
.
�� 
OrderNumber
�� '
=
��( )
$str
��* ,
+
��- .
newOrderNumber
��/ =
;
��= >
copySegment
�� 
.
�� 
	CreatedAt
�� %
=
��& '
DateTime
��( 0
.
��0 1
Now
��1 4
;
��4 5
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
}
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Testing
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
var
�� 
	testingId
�� 
=
�� 
Guid
��  $
.
��$ %
NewGuid
��% ,
(
��, -
)
��- .
;
��. /
var
�� 
testing
�� 
=
�� 
new
�� !
CampaignTesting
��" 1
(
��1 2
)
��2 3
;
��3 4
db
�� 
.
�� 
CampaignsTesting
�� #
.
��# $
Add
��$ '
(
��' (
testing
��( /
)
��/ 0
;
��0 1
db
�� 
.
�� 
Entry
�� 
(
�� 
testing
��  
)
��  !
.
��! "
CurrentValues
��" /
.
��/ 0
	SetValues
��0 9
(
��9 :
db
��: <
.
��< =
Entry
��= B
(
��B C
campaign
��C K
.
��K L
Testing
��L S
)
��S T
.
��T U
CurrentValues
��U b
)
��b c
;
��c d
testing
�� 
.
�� 
Id
�� 
=
�� 
	testingId
�� &
;
��& '
testing
�� 
.
�� 
	CreatedAt
�� !
=
��" #
DateTime
��$ ,
.
��, -
Now
��- 0
;
��0 1
testing
�� 
.
�� 

CampaignId
�� "
=
��# $
copy
��% )
.
��) *
Id
��* ,
;
��, -
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
copy
�� 
.
�� 
	TestingId
�� 
=
��  
	testingId
��! *
;
��* +
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
}
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
var
�� 

approvedId
�� 
=
��  
Guid
��! %
.
��% &
NewGuid
��& -
(
��- .
)
��. /
;
��/ 0
var
�� 
approved
�� 
=
�� 
new
�� "
CampaignApproved
��# 3
(
��3 4
)
��4 5
;
��5 6
db
�� 
.
�� 
CampaignsApproved
�� $
.
��$ %
Add
��% (
(
��( )
approved
��) 1
)
��1 2
;
��2 3
db
�� 
.
�� 
Entry
�� 
(
�� 
approved
�� !
)
��! "
.
��" #
CurrentValues
��# 0
.
��0 1
	SetValues
��1 :
(
��: ;
db
��; =
.
��= >
Entry
��> C
(
��C D
campaign
��D L
.
��L M
Approved
��M U
)
��U V
.
��V W
CurrentValues
��W d
)
��d e
;
��e f
approved
�� 
.
�� 
Id
�� 
=
�� 

approvedId
�� (
;
��( )
approved
�� 
.
�� 
	CreatedAt
�� "
=
��# $
DateTime
��% -
.
��- .
Now
��. 1
;
��1 2
approved
�� 
.
�� 

CampaignId
�� #
=
��$ %
copy
��& *
.
��* +
Id
��+ -
;
��- .
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
copy
�� 
.
�� 

ApprovedId
�� 
=
��  !

approvedId
��" ,
;
��, -
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
}
�� 
ForceOrders
�� 
=
�� 
true
�� 
;
�� 
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" ,
+
��- .
campaign
��/ 7
.
��7 8
OrderNumber
��8 C
+
��D E
$str
��F c
+
��d e
newOrderNumber
��f t
+
��u v
$str��w �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
ActionResult
�� 
Delete
�� "
(
��" #
Guid
��# '
?
��' (
id
��) +
)
��+ ,
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
DeleteConfirmed
�� +
(
��+ ,
Guid
��, 0
id
��1 3
)
��3 4
{
�� 	
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
var
�� 
proDatas
�� 
=
�� 
db
�� 
.
�� 
ProDatas
�� &
.
��& '
Where
��' ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4

CampaignId
��4 >
==
��? A
campaign
��B J
.
��J K
Id
��K M
)
��M N
;
��N O
foreach
�� 
(
�� 
var
�� 
proData
��  
in
��! #
proDatas
��$ ,
)
��, -
{
�� 
db
�� 
.
�� 
ProDatas
�� 
.
�� 
Remove
�� "
(
��" #
proData
��# *
)
��* +
;
��+ ,
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
var
�� 
segments
�� 
=
�� 
db
�� 
.
�� 
CampaignSegments
�� .
.
��. /
Where
��/ 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <

CampaignId
��< F
==
��G I
campaign
��J R
.
��R S
Id
��S U
)
��U V
;
��V W
foreach
�� 
(
�� 
var
�� 
segment
��  
in
��! #
segments
��$ ,
)
��, -
{
�� 
db
�� 
.
�� 
CampaignSegments
�� #
.
��# $
Remove
��$ *
(
��* +
segment
��+ 2
)
��2 3
;
��3 4
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
var
�� 
assets
�� 
=
�� 
db
�� 
.
�� 
CampaignAssets
�� *
.
��* +
FirstOrDefault
��+ 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A

CampaignId
��A K
==
��L N
campaign
��O W
.
��W X
Id
��X Z
)
��Z [
;
��[ \
if
�� 
(
�� 
assets
�� 
!=
�� 
null
�� 
)
�� 
db
�� 
.
�� 
CampaignAssets
�� !
.
��! "
Remove
��" (
(
��( )
assets
��) /
)
��/ 0
;
��0 1
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
var
�� 
testing
�� 
=
�� 
db
�� 
.
�� 
CampaignsTesting
�� -
.
��- .
FirstOrDefault
��. <
(
��< =
x
��= >
=>
��? A
x
��B C
.
��C D

CampaignId
��D N
==
��O Q
campaign
��R Z
.
��Z [
Id
��[ ]
)
��] ^
;
��^ _
if
�� 
(
�� 
testing
�� 
!=
�� 
null
�� 
)
�� 
db
�� 
.
�� 
CampaignsTesting
�� #
.
��# $
Remove
��$ *
(
��* +
testing
��+ 2
)
��2 3
;
��3 4
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
var
�� 
approved
�� 
=
�� 
db
�� 
.
�� 
CampaignsApproved
�� /
.
��/ 0
FirstOrDefault
��0 >
(
��> ?
x
��? @
=>
��A C
x
��D E
.
��E F

CampaignId
��F P
==
��Q S
campaign
��T \
.
��\ ]
Id
��] _
)
��_ `
;
��` a
if
�� 
(
�� 
approved
�� 
!=
�� 
null
��  
)
��  !
db
�� 
.
�� 
CampaignsApproved
�� $
.
��$ %
Remove
��% +
(
��+ ,
approved
��, 4
)
��4 5
;
��5 6
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
db
�� 
.
�� 
	Campaigns
�� 
.
�� 
Remove
�� 
(
��  
campaign
��  (
)
��( )
;
��) *
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
ForceOrders
�� 
=
�� 
true
�� 
;
�� 
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" +
+
��, -
campaign
��. 6
.
��6 7
OrderNumber
��7 B
+
��C D
$str
��E e
;
��e f
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
}
�� 	
public
�� 
ActionResult
�� 
Cancel
�� "
(
��" #
Guid
��# '
?
��' (
id
��) +
)
��+ ,
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
CancelConfirmed
�� +
(
��+ ,
Guid
��, 0
id
��1 3
)
��3 4
{
�� 	
var
�� 
campaign
�� 
=
�� 
db
�� 
.
�� 
	Campaigns
�� '
.
��' (
Find
��( ,
(
��, -
id
��- /
)
��/ 0
;
��0 1
campaign
�� 
.
�� 
Status
�� 
=
�� 
(
�� 
int
�� "
)
��" #
CampaignStatus
��# 1
.
��1 2
	Cancelled
��2 ;
;
��; <
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" +
+
��, -
campaign
��. 6
.
��6 7
OrderNumber
��7 B
+
��C D
$str
��E g
;
��g h
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
ActionResult
�� 
Complete
�� $
(
��$ %
Guid
��% )
?
��) *
id
��+ -
)
��- .
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Find
��- 1
(
��1 2
id
��2 4
)
��4 5
;
��5 6
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� (
)
��( )
]
��) *
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
CompleteConfirmed
�� -
(
��- .
Guid
��. 2
id
��3 5
)
��5 6
{
�� 	
var
�� 
campaign
�� 
=
�� 
db
�� 
.
�� 
	Campaigns
�� '
.
��' (
Include
��( /
(
��/ 0
x
��0 1
=>
��2 4
x
��5 6
.
��6 7
Testing
��7 >
)
��> ?
.
��? @
FirstOrDefault
��@ N
(
��N O
x
��O P
=>
��Q S
x
��T U
.
��U V
Id
��V X
==
��Y [
id
��\ ^
)
��^ _
;
��_ `
if
�� 
(
�� 
campaign
�� 
.
�� 
Testing
��  
==
��! #
null
��$ (
)
��( )
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ H
;
��H I
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
var
�� "
notCompletedSegments
�� $
=
��% &
db
��' )
.
��) *
CampaignSegments
��* :
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 

CampaignId
�� (
==
��) +
campaign
��, 4
.
��4 5
Id
��5 7
&&
��8 :
x
��; <
.
��< =
SegmentStatus
��= J
!=
��K M
(
��N O
int
��O R
)
��R S
SegmentStatus
��S `
.
��` a
Complete
��a i
)
��i j
;
��j k
if
�� 
(
�� "
notCompletedSegments
�� $
.
��$ %
Any
��% (
(
��( )
)
��) *
)
��* +
{
�� 
string
�� 
segments
�� 
=
��  !
string
��" (
.
��( )
Join
��) -
(
��- .
$str
��. 1
,
��1 2"
notCompletedSegments
��3 G
.
��G H
Select
��H N
(
��N O
x
��O P
=>
��Q S
x
��T U
.
��U V
SegmentNumber
��V c
)
��c d
)
��d e
;
��e f
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ /
+
��0 1
segments
��2 :
+
��; <
$str
��= _
;
��_ `
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
campaign
�� 
.
�� 
Status
�� 
=
�� 
(
�� 
int
�� "
)
��" #
CampaignStatus
��# 1
.
��1 2
	Completed
��2 ;
;
��; <
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" -
+
��. /
campaign
��0 8
.
��8 9
CampaignName
��9 E
+
��F G
$str
��H j
;
��j k
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
ActionResult
�� 
Rebroad
�� #
(
��# $
Guid
��$ (
?
��( )
id
��* ,
)
��, -
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
Include
��- 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Segments
��< D
)
��D E
.
��E F
Include
��F M
(
��M N
x
��N O
=>
��P R
x
��S T
.
��T U
	Trackings
��U ^
)
��^ _
.
�� 
FirstOrDefault
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
Id
��' )
==
��* ,
id
��- /
)
��/ 0
;
��0 1
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
var
�� 
proData
�� 
=
�� 
VendorsList
�� %
.
��% &
FirstOrDefault
��& 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Text
��< @
.
��@ A
Contains
��A I
(
��I J
$str
��J O
)
��O P
)
��P Q
;
��Q R
ViewBag
�� 
.
�� 
Vendor
�� 
=
�� 
new
��  

SelectList
��! +
(
��+ ,
VendorsList
��, 7
,
��7 8
$str
��9 @
,
��@ A
$str
��B H
,
��H I
proData
��J Q
)
��Q R
;
��R S
long
��  
opennedFromOrignal
�� #
=
��$ %
campaign
��& .
.
��. /
	Trackings
��/ 8
.
��8 9
FirstOrDefault
��9 G
(
��G H
)
��H I
!=
��J L
null
��M Q
?
��R S
campaign
��T \
.
��\ ]
	Trackings
��] f
.
��f g
FirstOrDefault
��g u
(
��u v
)
��v w
.
��w x
Opened
��x ~
:�� �
campaign��� �
.��� �
Quantity��� �
;��� �
ViewBag
�� 
.
��  
OpennedFromOrignal
�� &
=
��' ( 
opennedFromOrignal
��) ;
;
��; <
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� '
)
��' (
]
��( )
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
RebroadConfirmed
�� ,
(
��, -
Guid
��- 1
?
��1 2
Id
��2 4
,
��4 5
DateTime
��6 >
?
��> ?
ReBroadcastedDate
��@ Q
,
��Q R
long
��S W#
ReBroadcastedQuantity
��X m
,
��m n
Guid
��o s
?
��s t
Vendor
��u {
,
��{ |
string��} �
[��� �
]��� � 
SegmentsSelected��� �
)��� �
{
�� 	
Campaign
�� !
campaignToBeRebroad
�� (
=
��) *
db
��+ -
.
��- .
	Campaigns
��. 7
.
��7 8
FirstOrDefault
��8 F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Id
��N P
==
��Q S
Id
��T V
)
��V W
;
��W X!
campaignToBeRebroad
�� 
.
��  
ReBroadcasted
��  -
=
��. /
true
��0 4
;
��4 5!
campaignToBeRebroad
�� 
.
��  
ReBroadcastedDate
��  1
=
��2 3
ReBroadcastedDate
��4 E
;
��E F!
campaignToBeRebroad
�� 
.
��  #
ReBroadcastedQuantity
��  5
=
��6 7#
ReBroadcastedQuantity
��8 M
;
��M N!
campaignToBeRebroad
�� 
.
��  &
ReBroadcastedOrderNumber
��  8
=
��9 :!
campaignToBeRebroad
��; N
.
��N O
OrderNumber
��O Z
+
��[ \
$str
��] b
;
��b c
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
BackgroundJob
�� 
.
�� 
Enqueue
�� !
(
��! "
(
��" #
)
��# $
=>
��% '
CampaignProcessor
��( 9
.
��9 :
SendVendorEmail
��: I
(
��I J
Vendor
��J P
,
��P Q!
campaignToBeRebroad
��R e
.
��e f
OrderNumber
��f q
,
��q r
SegmentsSelected��s �
)��� �
)��� �
;��� �
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" ,
+
��- .!
campaignToBeRebroad
��/ B
.
��B C
OrderNumber
��C N
+
��O P
$str
��Q ^
+
��_ `!
campaignToBeRebroad
��a t
.
��t u
CampaignName��u �
+��� �
$str��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 	
}
�� 
}�� �x
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CopyController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
CopyController 
:  !
BaseController" 0
{ 
int 
pageSize 
= 
$num 
; 
public 
ActionResult 
MoveTo "
(" #
Guid# '
id( *
,* +
string, 2
to3 5
)5 6
{ 	
var 
campaign 
= 
db 
. 
	Campaigns '
. 
Include 
( 
c 
=> 
c 
.  
Assets  &
)& '
. 
Include 
( 
c 
=> 
c 
.  
Testing  '
)' (
. 
Include 
( 
c 
=> 
c 
.  
Approved  (
)( )
. 
Include 
( 
c 
=> 
c 
.  
ProDatas  (
)( )
. 
Include 
( 
c 
=> 
c 
.  
Segments  (
)( )
. 
FirstOrDefault 
(  
c  !
=>" $
c% &
.& '
Id' )
==* ,
id- /
)/ 0
;0 1
Session 
[ 
$str 
] 
= 
id 
; 
Session 
[ 
$str !
]! "
=# $
campaign% -
.- .
OrderNumber. 9
;9 :
switch 
( 
to 
) 
{   
case!! 
$str!! 
:!! 
if"" 
("" 
campaign""  
.""  !
Testing""! (
=="") +
null"", 0
)""0 1
{## 
campaign$$  
.$$  !
Assets$$! '
.$$' (

ZipCodeUrl$$( 2
=$$3 4
string$$5 ;
.$$; <
Format$$< B
($$B C
$str$$C v
,$$v w
campaign%% $
.%%$ %
OrderNumber%%% 0
)%%0 1
;%%1 2
campaign&&  
.&&  !
Assets&&! '
.&&' (
CreativeUrl&&( 3
=&&4 5
string&&6 <
.&&< =
Format&&= C
(&&C D
$str&&D t
,&&t u
campaign'' #
.''# $
OrderNumber''$ /
)''/ 0
;''0 1
var)) 
	testingId)) %
=))& '
Guid))( ,
.)), -
NewGuid))- 4
())4 5
)))5 6
;))6 7
var** 
testing** #
=**$ %
new**& )
CampaignTesting*** 9
(**9 :
)**: ;
{++ 
Id,, 
=,,  
	testingId,,! *
,,,* +

CampaignId-- &
=--' (
campaign--) 1
.--1 2
Id--2 4
,--4 5
	CreatedAt.. %
=..& '
DateTime..( 0
...0 1
Now..1 4
,..4 5
	CreatedBy// %
=//& '
campaign//( 0
.//0 1
	CreatedBy//1 :
,//: ;
CampaignName00 (
=00) *
campaign00+ 3
.003 4
CampaignName004 @
,00@ A

WhiteLabel11 &
=11' (
campaign11) 1
.111 2

WhiteLabel112 <
,11< =
ReBroadCast22 '
=22( )
campaign22* 2
.222 3
ReBroadCast223 >
,22> ?
ReBroadcastDate33 +
=33, -
campaign33. 6
.336 7
ReBroadcastDate337 F
,33F G
FromLine44 $
=44% &
campaign44' /
.44/ 0
FromLine440 8
,448 9
SubjectLine55 '
=55( )
campaign55* 2
.552 3
SubjectLine553 >
,55> ?
TestingUrgency77 *
=77+ ,
campaign77- 5
.775 6
TestingUrgency776 D
,77D E

DeployDate88 &
=88' (
campaign88) 1
.881 2
BroadcastDate882 ?
,88? @

GeoDetails99 &
=99' (
campaign99) 1
.991 2

GeoDetails992 <
,99< =
Demographics:: (
=::) *
campaign::+ 3
.::3 4
Demographics::4 @
,::@ A
Quantity;; $
=;;% &
campaign;;' /
.;;/ 0
Quantity;;0 8
,;;8 9
SpecialInstructions<< /
=<<0 1
campaign<<2 :
.<<: ;
SpecialInstructions<<; N
,<<N O
IsOpenPixel>> '
=>>( )
campaign>>* 2
.>>2 3
IsOpenPixel>>3 >
,>>> ?
OpenPixelUrl?? (
=??) *
campaign??+ 3
.??3 4
OpenPixelUrl??4 @
,??@ A
	OpenGoals@@ %
=@@& '
campaign@@( 0
.@@0 1
Quantity@@1 9
*@@: ;
$num@@< >
/@@? @
$num@@A D
,@@D E

ClickGoalsAA &
=AA' (
campaignAA) 1
.AA1 2
QuantityAA2 :
*AA; <
$numAA= ?
/AA@ A
$numAAB E
,AAE F
DataFileQuantityBB ,
=BB- .
campaignBB/ 7
.BB7 8
DataFileQuantityBB8 H
,BBH I
IsOmniOrderEE '
=EE( )
campaignEE* 2
.EE2 3
IsOmniOrderEE3 >
,EE> ?
OmniDeployDateFF *
=FF+ ,
campaignFF- 5
.FF5 6
OmniDeployDateFF6 D
,FFD E
ImpressionsGG '
=GG( )
campaignGG* 2
.GG2 3
ImpressionsGG3 >
,GG> ?
ChannelTypesHH (
=HH) *
campaignHH+ 3
.HH3 4
ChannelTypesHH4 @
,HH@ A
}JJ 
;JJ 
dbbb 
.bb 
CampaignsTestingbb +
.bb+ ,
Addbb, /
(bb/ 0
testingbb0 7
)bb7 8
;bb8 9
dbcc 
.cc 
SaveChangescc &
(cc& '
)cc' (
;cc( )
campaignee  
.ee  !
	TestingIdee! *
=ee+ ,
	testingIdee- 6
;ee6 7
dbff 
.ff 
SaveChangesff &
(ff& '
)ff' (
;ff( )
}gg 
campaignhh 
.hh 
Statushh #
=hh$ %
(hh& '
inthh' *
)hh* +
CampaignStatushh, :
.hh: ;
Testinghh; B
;hhB C
dbii 
.ii 
SaveChangesii "
(ii" #
)ii# $
;ii$ %
returnjj 
RedirectToActionjj +
(jj+ ,
$strjj, 9
,jj9 :
$strjj; D
,jjD E
newjjF I
{jjJ K
idjjK M
=jjN O
campaignjjP X
.jjX Y
	TestingIdjjY b
}jjb c
)jjc d
;jjd e
breakkk 
;kk 
casell 
$strll 
:ll  
ifnn 
(nn 
campaignnn  
.nn  !
Testingnn! (
==nn) +
nullnn, 0
)nn0 1
{oo 
TempDatapp  
[pp  !
$strpp! (
]pp( )
=pp* +
$strpp, P
;ppP Q
returnqq 
RedirectToActionqq /
(qq/ 0
$strqq0 7
,qq7 8
$strqq9 D
)qqD E
;qqE F
}rr 
iftt 
(tt 
campaigntt  
.tt  !
Approvedtt! )
==tt* ,
nulltt- 1
)tt1 2
{uu 
varvv 
testingvv #
=vv$ %
campaignvv& .
.vv. /
Testingvv/ 6
;vv6 7
varww 

approvedIdww &
=ww' (
Guidww) -
.ww- .
NewGuidww. 5
(ww5 6
)ww6 7
;ww7 8
varxx 
approvedxx $
=xx% &
newxx' *
CampaignApprovedxx+ ;
(xx; <
)xx< =
{yy 
Idzz 
=zz  

approvedIdzz! +
,zz+ ,

CampaignId{{ &
={{' (
campaign{{) 1
.{{1 2
Id{{2 4
,{{4 5
	CreatedAt|| %
=||& '
DateTime||( 0
.||0 1
Now||1 4
,||4 5
	CreatedBy}} %
=}}& '
campaign}}( 0
.}}0 1
	CreatedBy}}1 :
,}}: ;
CampaignName~~ (
=~~) *
testing~~+ 2
.~~2 3
CampaignName~~3 ?
,~~? @

WhiteLabel &
=' (
testing) 0
.0 1

WhiteLabel1 ;
,; <
ReBroadCast
�� '
=
��( )
testing
��* 1
.
��1 2
ReBroadCast
��2 =
,
��= >
ReBroadcastDate
�� +
=
��, -
testing
��. 5
.
��5 6
ReBroadcastDate
��6 E
,
��E F
FromLine
�� $
=
��% &
testing
��' .
.
��. /
FromLine
��/ 7
,
��7 8
SubjectLine
�� '
=
��( )
testing
��* 1
.
��1 2
SubjectLine
��2 =
,
��= >

DeployDate
�� &
=
��' (
testing
��) 0
.
��0 1

DeployDate
��1 ;
,
��; <

GeoDetails
�� &
=
��' (
testing
��) 0
.
��0 1

GeoDetails
��1 ;
,
��; <
Demographics
�� (
=
��) *
testing
��+ 2
.
��2 3
Demographics
��3 ?
,
��? @
Quantity
�� $
=
��% &
testing
��' .
.
��. /
Quantity
��/ 7
,
��7 8!
SpecialInstructions
�� /
=
��0 1
testing
��2 9
.
��9 :!
SpecialInstructions
��: M
,
��M N
ReportSiteLink
�� *
=
��+ ,
string
��- 3
.
��3 4
Format
��4 :
(
��: ;
$str
��; \
,
��\ ]
campaign
��^ f
.
��f g
OrderNumber
��g r
)
��r s
,
��s t
LinkBreakout
�� (
=
��) *
string
��+ 1
.
��1 2
Format
��2 8
(
��8 9
$str
��9 n
,
��n o
campaign
��p x
.
��x y
OrderNumber��y �
)��� �
,��� �
IsOpenPixel
�� '
=
��( )
testing
��* 1
.
��1 2
IsOpenPixel
��2 =
,
��= >
OpenPixelUrl
�� (
=
��) *
testing
��+ 2
.
��2 3
OpenPixelUrl
��3 ?
,
��? @
	OpenGoals
�� %
=
��& '
testing
��( /
.
��/ 0
	OpenGoals
��0 9
,
��9 :

ClickGoals
�� &
=
��' (
testing
��) 0
.
��0 1

ClickGoals
��1 ;
,
��; <
DataFileQuantity
�� ,
=
��- .
testing
��/ 6
.
��6 7
DataFileQuantity
��7 G
,
��G H
DataFileUrl
�� '
=
��( )
testing
��* 1
.
��1 2
DataFileUrl
��2 =
,
��= >
IsOmniOrder
�� '
=
��( )
testing
��* 1
.
��1 2
IsOmniOrder
��2 =
,
��= >
OmniDeployDate
�� *
=
��+ ,
testing
��- 4
.
��4 5
OmniDeployDate
��5 C
,
��C D
Impressions
�� '
=
��( )
testing
��* 1
.
��1 2
Impressions
��2 =
,
��= >
ChannelTypes
�� (
=
��) *
testing
��+ 2
.
��2 3
ChannelTypes
��3 ?
,
��? @
}
�� 
;
�� 
db
�� 
.
�� 
CampaignsApproved
�� ,
.
��, -
Add
��- 0
(
��0 1
approved
��1 9
)
��9 :
;
��: ;
db
�� 
.
�� 
SaveChanges
�� &
(
��& '
)
��' (
;
��( )
campaign
��  
.
��  !

ApprovedId
��! +
=
��, -

approvedId
��. 8
;
��8 9
db
�� 
.
�� 
SaveChanges
�� &
(
��& '
)
��' (
;
��( )
}
�� 
campaign
�� 
.
�� 
Status
�� #
=
��$ %
(
��& '
int
��' *
)
��* +
CampaignStatus
��, :
.
��: ;
Approved
��; C
;
��C D
db
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, :
,
��: ;
$str
��< F
,
��F G
new
��H K
{
��L M
id
��M O
=
��P Q
campaign
��R Z
.
��Z [

ApprovedId
��[ e
}
��e f
)
��f g
;
��g h
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 8
,
��8 9
$str
��: D
,
��D E
new
��F I
{
��J K
id
��K M
=
��N O
campaign
��P X
.
��X Y
Id
��Y [
}
��[ \
)
��\ ]
;
��] ^
case
�� 
$str
�� 
:
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 3
,
��3 4
$str
��5 @
,
��@ A
new
��B E
{
��F G
id
��H J
=
��K L
campaign
��M U
.
��U V
Id
��V X
}
��Y Z
)
��Z [
;
��[ \
case
�� 
$str
�� 
:
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 5
,
��5 6
$str
��7 B
,
��B C
new
��D G
{
��H I
id
��J L
=
��M N
campaign
��O W
.
��W X
Id
��X Z
}
��[ \
)
��\ ]
;
��] ^
case
�� 
$str
�� 
:
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 4
,
��4 5
$str
��6 A
,
��A B
new
��C F
{
��G H
id
��I K
=
��L M
campaign
��N V
.
��V W
Id
��W Y
}
��Z [
)
��[ \
;
��\ ]
case
�� 
$str
�� 
:
��  
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 6
,
��6 7
$str
��8 C
,
��C D
new
��E H
{
��I J
id
��K M
=
��N O
campaign
��P X
.
��X Y
Id
��Y [
}
��\ ]
)
��] ^
;
��^ _
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
}
�� 
}�� �
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\ErrorController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
public 

class 
ErrorController  
:! "
BaseController# 1
{ 
public

 
ActionResult

 
Index

 !
(

! "
)

" #
{ 	
return 
RedirectToAction #
(# $
$str$ 2
,2 3
new4 7
HandleErrorInfo8 G
(G H
newH K
HttpExceptionL Y
(Y Z
$numZ ]
,] ^
$str_ |
)| }
,} ~
$str	 �
,
� �
$str
� �
)
� �
)
� �
;
� �
} 	
public 

ViewResult 
GenericError &
(& '
HandleErrorInfo' 6
	exception7 @
)@ A
{ 	
return 
View 
( 
$str 
,  
	exception! *
)* +
;+ ,
} 	
public 

ViewResult 
NotFound "
(" #
HandleErrorInfo# 2
	exception3 <
)< =
{ 	
ViewBag 
. 
Title 
= 
$str ,
;, -
return 
View 
( 
$str 
,  
new! $
HandleErrorInfo% 4
(4 5
new5 8
HttpException9 F
(F G
$numG J
,J K
$strL \
)\ ]
,] ^
$str_ p
,p q
$strr y
)y z
)z {
;{ |
} 	
public 

ViewResult 

BadRequest $
($ %
HandleErrorInfo% 4
	exception5 >
)> ?
{ 	
ViewBag 
. 
Title 
= 
$str .
;. /
return 
View 
( 
$str 
,  
new! $
HandleErrorInfo% 4
(4 5
new5 8
HttpException9 F
(F G
$numG J
,J K
$strL ^
)^ _
,_ `
$stra r
,r s
$strt {
){ |
)| }
;} ~
} 	
public   

ViewResult   
NotAuthorized   '
(  ' (
)  ( )
{!! 	
ViewBag"" 
."" 
Title"" 
="" 
$str"" 4
;""4 5
return## 
View## 
(## 
$str## 
)##  
;##  !
}$$ 	
}%% 
}&& �U
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\FileController.cs
	namespace		 	
WFP		
 
.		 
ICT		 
.		 
Web		 
.		 
Controllers		 !
{

 
public 

class 
FileController 
:  !
BaseController" 0
{ 
[ 	
HttpPost	 
] 
public 
async 
Task 
< 

JsonResult $
>$ %

UploadFile& 0
(0 1
UploadFileVM1 =
fileVm> D
)D E
{ 	
try 
{ 
string 
amazonFileKey $
=% &
$str' )
;) *
foreach 
( 
string 
selectedFile  ,
in- /
Request0 7
.7 8
Files8 =
)= >
{ 
var 
fileContent #
=$ %
Request& -
.- .
Files. 3
[3 4
selectedFile4 @
]@ A
;A B
if 
( 
fileContent #
!=$ &
null' +
&&, .
fileContent/ :
.: ;
ContentLength; H
>I J
$numK L
)L M
{ 
var 
stream "
=# $
fileContent% 0
.0 1
InputStream1 <
;< =
string 
filePath '
=( )
Path* .
.. /
Combine/ 6
(6 7

UploadPath7 A
,A B
fileContentC N
.N O
FileNameO W
)W X
;X Y
using 
( 
var "

fileStream# -
=. /
System0 6
.6 7
IO7 9
.9 :
File: >
.> ?
Create? E
(E F
filePathF N
)N O
)O P
{ 
stream "
." #
CopyTo# )
() *

fileStream* 4
)4 5
;5 6
} 
if   
(   
!   
fileVm   #
.  # $
IsValid  $ +
(  + ,
filePath  , 4
)  4 5
)  5 6
{!! 
if"" 
(""  
System""  &
.""& '
IO""' )
."") *
File""* .
."". /
Exists""/ 5
(""5 6
filePath""6 >
)""> ?
)""? @
System##  &
.##& '
IO##' )
.##) *
File##* .
.##. /
Delete##/ 5
(##5 6
filePath##6 >
)##> ?
;##? @
throw$$ !
new$$" %
	Exception$$& /
($$/ 0
fileVm$$0 6
.$$6 7
FileType$$7 ?
+$$@ A
$str$$B l
)$$l m
;$$m n
}%% 
if'' 
('' 
string'' "
.''" #
IsNullOrEmpty''# 0
(''0 1
fileVm''1 7
.''7 8
OrderNumber''8 C
)''C D
)''D E
{(( 
amazonFileKey)) )
=))* +
string)), 2
.))2 3
Format))3 9
())9 :
$str)): R
,))R S
DateTime))T \
.))\ ]
Now))] `
,))` a
fileContent))b m
.))m n
FileName))n v
)))v w
;))w x
S3FileManager** )
.**) *
Upload*** 0
(**0 1
amazonFileKey**1 >
,**> ?
filePath**@ H
)**H I
;**I J
}++ 
else,, 
if,, 
(,,  !
!,,! "
string,," (
.,,( )
IsNullOrEmpty,,) 6
(,,6 7
fileVm,,7 =
.,,= >
SegmentNumber,,> K
),,K L
),,L M
{-- 
amazonFileKey.. )
=..* +
string.., 2
...2 3
Format..3 9
(..9 :
$str..: L
,..L M
fileVm..N T
...T U
OrderNumber..U `
,..` a
fileVm..b h
...h i
SegmentNumber..i v
)..v w
;..w x
S3FileManager// )
.//) *
Upload//* 0
(//0 1
amazonFileKey//1 >
,//> ?
filePath//@ H
,//H I
true//J N
,//N O
true//P T
)//T U
;//U V
}00 
else11 
{22 
switch33 "
(33# $
fileVm33$ *
.33* +
FileType33+ 3
)333 4
{44 
case55  $
$str55% ;
:55; <
amazonFileKey66$ 1
=662 3
string664 :
.66: ;
Format66; A
(66A B
$str66B T
,66T U
fileVm66V \
.66\ ]
OrderNumber66] h
)66h i
;66i j
break77$ )
;77) *
case88  $
$str88% 9
:889 :
amazonFileKey99$ 1
=992 3
string994 :
.99: ;
Format99; A
(99A B
$str99B R
,99R S
fileVm99T Z
.99Z [
OrderNumber99[ f
)99f g
;99g h
break::$ )
;::) *
case;;  $
$str;;% :
:;;: ;
amazonFileKey<<$ 1
=<<2 3
string<<4 :
.<<: ;
Format<<; A
(<<A B
$str<<B S
,<<S T
fileVm<<U [
.<<[ \
OrderNumber<<\ g
)<<g h
;<<h i
break==$ )
;==) *
case>>  $
$str>>% :
:>>: ;
amazonFileKey??$ 1
=??2 3
string??4 :
.??: ;
Format??; A
(??A B
$str??B S
,??S T
fileVm??U [
.??[ \
OrderNumber??\ g
)??g h
;??h i
break@@$ )
;@@) *
caseAA  $
$strAA% 9
:AA9 :
amazonFileKeyBB$ 1
=BB2 3
stringBB4 :
.BB: ;
FormatBB; A
(BBA B
$strBBB U
,BBU V
fileVmBBW ]
.BB] ^
OrderNumberBB^ i
,BBi j
PathBBk o
.BBo p
GetExtensionBBp |
(BB| }
filePath	BB} �
)
BB� �
)
BB� �
;
BB� �
breakCC$ )
;CC) *
caseDD  $
$strDD% =
:DD= >
amazonFileKeyEE$ 1
=EE2 3
stringEE4 :
.EE: ;
FormatEE; A
(EEA B
$strEEB Z
,EEZ [
fileVmEE\ b
.EEb c
OrderNumberEEc n
,EEn o
PathEEp t
.EEt u
GetExtension	EEu �
(
EE� �
filePath
EE� �
)
EE� �
)
EE� �
;
EE� �
breakFF$ )
;FF) *
caseGG  $
$strGG% 6
:GG6 7
amazonFileKeyHH$ 1
=HH2 3
stringHH4 :
.HH: ;
FormatHH; A
(HHA B
$strHHB S
,HHS T
fileVmHHU [
.HH[ \
OrderNumberHH\ g
,HHg h
PathHHi m
.HHm n
GetExtensionHHn z
(HHz {
filePath	HH{ �
)
HH� �
)
HH� �
;
HH� �
breakII$ )
;II) *
}JJ 
S3FileManagerKK )
.KK) *
UploadKK* 0
(KK0 1
amazonFileKeyKK1 >
,KK> ?
filePathKK@ H
,KKH I
trueKKJ N
,KKN O
trueKKP T
)KKT U
;KKU V
}LL 
ifOO 
(OO 
SystemOO "
.OO" #
IOOO# %
.OO% &
FileOO& *
.OO* +
ExistsOO+ 1
(OO1 2
filePathOO2 :
)OO: ;
)OO; <
SystemPP "
.PP" #
IOPP# %
.PP% &
FilePP& *
.PP* +
DeletePP+ 1
(PP1 2
filePathPP2 :
)PP: ;
;PP; <
}QQ 
}RR 
returnTT 
JsonTT 
(TT 
newTT 
JsonResponseTT  ,
(TT, -
)TT- .
{TT/ 0
IsSucessTT1 9
=TT: ;
trueTT< @
,TT@ A
ResultTTB H
=TTI J
amazonFileKeyTTK X
}TTY Z
)TTZ [
;TT[ \
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
returnYY 
JsonYY 
(YY 
newYY 
JsonResponseYY  ,
(YY, -
)YY- .
{YY/ 0
IsSucessYY1 9
=YY: ;
falseYY< A
,YYA B
ErrorMessageYYC O
=YYP Q
$strYYR b
+YYc d
exYYe g
.YYg h
MessageYYh o
}YYp q
)YYq r
;YYr s
}ZZ 
}[[ 	
[]] 	
HttpGet]]	 
]]] 
public^^ 
virtual^^ 
ActionResult^^ #
DownloadFile^^$ 0
(^^0 1
string^^1 7
file^^8 <
)^^< =
{__ 	
string`` 
filePath`` 
=`` 
Path`` "
.``" #
Combine``# *
(``* +

UploadPath``+ 5
,``5 6
Server``7 =
.``= >
	UrlEncode``> G
(``G H
file``H L
)``L M
)``M N
;``N O
S3FileManagerdd 
.dd 
Downloaddd "
(dd" #
filedd# '
,dd' (
filePathdd) 1
)dd1 2
;dd2 3
returnff 
Fileff 
(ff 
filePathff  
,ff  !
$strff" ,
,ff, -
fileff. 2
)ff2 3
;ff3 4
}gg 	
[ii 	
HttpPostii	 
]ii 
publicjj 
virtualjj 

JsonResultjj !

DeleteFilejj" ,
(jj, -
stringjj- 3
filejj4 8
)jj8 9
{kk 	
tryll 
{mm 
S3FileManagernn 
.nn 
Deletenn $
(nn$ %
filenn% )
)nn) *
;nn* +
returnuu 
Jsonuu 
(uu 
newuu 
JsonResponseuu  ,
(uu, -
)uu- .
{uu/ 0
IsSucessuu0 8
=uu9 :
trueuu; ?
}uu? @
)uu@ A
;uuA B
}vv 
catchww 
(ww 
	Exceptionww 
exww 
)ww  
{xx 
returnzz 
Jsonzz 
(zz 
newzz 
JsonResponsezz  ,
(zz, -
)zz- .
{zz/ 0
IsSucesszz0 8
=zz9 :
falsezz; @
,zz@ A
ErrorMessagezzB N
=zzO P
$strzzQ g
+zzh i
exzzj l
.zzl m
Messagezzm t
}zzu v
)zzv w
;zzw x
}{{ 
}|| 	
}}} 
}~~ ��
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\HomeController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
HomeController 
:  !
BaseController" 0
{ 
int 
pageSize 
= 
$num 
; 
private "
ApplicationUserManager &
_userManager' 3
;3 4
public "
ApplicationUserManager %
UserManager& 1
{ 	
get 
{ 
return 
_userManager #
??$ &
HttpContext' 2
.2 3
GetOwinContext3 A
(A B
)B C
.C D
GetUserManagerD R
<R S"
ApplicationUserManagerS i
>i j
(j k
)k l
;l m
} 
set 
{ 
_userManager 
= 
value $
;$ %
} 
} 	
public   
ActionResult   
Index   !
(  ! "
)  " #
{!! 	
return"" 
RedirectToAction"" #
(""# $
$str""$ +
,""+ ,
$str""- 8
)""8 9
;""9 :
}## 	
public%% 
ActionResult%% 
Users%% !
(%%! "
CampaignSearchVM%%" 2
sc%%3 5
)%%5 6
{&& 	
var'' 
model'' 
='' 
UserManager'' #
.''# $
Users''$ )
.'') *
Select''* 0
(''0 1
x''1 2
=>''3 5
new(( 
UserProfileVM(( 
((( 
)(( 
{)) 
Id** 
=** 
x** 
.** 
Id** 
,** 
UserName++ 
=++ 
x++ 
.++ 
UserName++ %
,++% &
Email,, 
=,, 
x,, 
.,, 
Email,, 
,,,  
DateCreated-- 
=-- 
x-- 
.--  
	CreatedAt--  )
.--) *
ToString--* 2
(--2 3
)--3 4
,--4 5
Status.. 
=.. 
x.. 
... 
Status.. !
,..! "
Type// 
=// 
x// 
.// 
UserType// !
,//! "
IsTestsCreatives00  
=00! "
x00# $
.00$ %
IsTestsCreatives00% 5
,005 6
	IsUsesAPI11 
=11 
x11 
.11 
	IsUsesApi11 '
}22 
)22 
.22 
ToList22 
(22 
)22 
;22 
int44 

pageNumber44 
=44 
(44 
sc44  
.44  !
page44! %
??44& (
$num44) *
)44* +
;44+ ,
var55 
Model55 
=55 
model55 
.55 
ToPagedList55 )
(55) *

pageNumber55* 4
,554 5
pageSize556 >
)55> ?
;55? @
return66 
View66 
(66 
$str66 
,66  
Model66! &
)66& '
;66' (
}77 	
public99 
ActionResult99 
SaveUser99 $
(99$ %
CompanyUsersVM99% 3
model994 9
)999 :
{:: 	
try;; 
{<< 
var== 
user== 
=== 
UserManager== &
.==& '
FindById==' /
(==/ 0
model==0 5
.==5 6
ID==6 8
.==8 9
ToString==9 A
(==A B
)==B C
)==C D
;==D E
switch>> 
(>> 
model>> 
.>> 
Action>> $
)>>$ %
{?? 
case@@ 
$str@@ 
:@@  
ifAA 
(AA 
userAA  
.AA  !
StatusAA! '
==AA( *
(AA+ ,
intAA, /
)AA/ 0

UserStatusAA0 :
.AA: ;
ActiveAA; A
)AAA B
{BB 
userCC  
.CC  !
StatusCC! '
=CC( )
(CC* +
intCC+ .
)CC. /

UserStatusCC/ 9
.CC9 :
LockedCC: @
;CC@ A
userDD  
.DD  !
LockoutEndDateUtcDD! 2
=DD3 4
newDD5 8
DateTimeDD9 A
(DDA B
$numDDB F
,DDF G
$numDDH J
,DDJ K
$numDDL N
)DDN O
;DDO P
boolEE  
aEE! "
=EE# $
UserManagerEE% 0
.EE0 1
IsLockedOutEE1 <
(EE< =
userEE= A
.EEA B
IdEEB D
)EED E
;EEE F
}FF 
elseGG 
ifGG 
(GG  !
userGG! %
.GG% &
StatusGG& ,
==GG- /
(GG0 1
intGG1 4
)GG4 5

UserStatusGG5 ?
.GG? @
LockedGG@ F
)GGF G
{HH 
userII  
.II  !
StatusII! '
=II( )
(II* +
intII+ .
)II. /

UserStatusII/ 9
.II9 :
ActiveII: @
;II@ A
userJJ  
.JJ  !
LockoutEndDateUtcJJ! 2
=JJ3 4
nullJJ5 9
;JJ9 :
boolKK  
aKK! "
=KK# $
UserManagerKK% 0
.KK0 1
IsLockedOutKK1 <
(KK< =
userKK= A
.KKA B
IdKKB D
)KKD E
;KKE F
}LL 
breakMM 
;MM 
caseNN 
$strNN 
:NN  
ifOO 
(OO 
userOO  
.OO  !
UserTypeOO! )
==OO* ,
(OO- .
intOO. 1
)OO1 2
UserTypeOO2 :
.OO: ;
AdminOO; @
)OO@ A
{PP 
userQQ  
.QQ  !
UserTypeQQ! )
=QQ* +
(QQ, -
intQQ- 0
)QQ0 1
UserTypeQQ2 :
.QQ: ;
UserQQ; ?
;QQ? @
}RR 
elseSS 
ifSS 
(SS  !
userSS! %
.SS% &
UserTypeSS& .
==SS/ 1
(SS2 3
intSS3 6
)SS6 7
UserTypeSS7 ?
.SS? @
UserSS@ D
)SSD E
{TT 
userUU  
.UU  !
UserTypeUU! )
=UU* +
(UU, -
intUU- 0
)UU0 1
UserTypeUU1 9
.UU9 :
AdminUU: ?
;UU? @
}VV 
breakWW 
;WW 
caseXX 
$strXX  
:XX  !
ifYY 
(YY 
userYY  
.YY  !
IsTestsCreativesYY! 1
)YY1 2
{ZZ 
user[[  
.[[  !
IsTestsCreatives[[! 1
=[[2 3
false[[4 9
;[[9 :
}\\ 
else]] 
{^^ 
user__  
.__  !
IsTestsCreatives__! 1
=__2 3
true__4 8
;__8 9
}`` 
breakaa 
;aa 
casebb 
$strbb #
:bb# $
ifcc 
(cc 
!cc 
stringcc #
.cc# $
IsNullOrEmptycc$ 1
(cc1 2
modelcc2 7
.cc7 8
Passwordcc8 @
)cc@ A
)ccA B
{dd 
stringee "

resetTokenee# -
=ee. /
UserManageree0 ;
.ee; <&
GeneratePasswordResetTokenee< V
(eeV W
usereeW [
.ee[ \
Idee\ ^
)ee^ _
;ee_ `
IdentityResultff * 
passwordChangeResultff+ ?
=ff@ A
UserManagerffB M
.ffM N
ResetPasswordffN [
(ff[ \
userff\ `
.ff` a
Idffa c
,ffc d

resetTokenffe o
,ffo p
modelffq v
.ffv w
Passwordffw 
)	ff �
;
ff� �
ifgg 
(gg   
passwordChangeResultgg  4
!=gg5 7
IdentityResultgg8 F
.ggF G
SuccessggG N
)ggN O
{hh 
throwii  %
newii& )
	Exceptionii* 3
(ii3 4 
passwordChangeResultii4 H
.iiH I
ErrorsiiI O
.iiO P
FirstOrDefaultiiP ^
(ii^ _
)ii_ `
)ii` a
;iia b
}jj 
}kk 
breakll 
;ll 
case 
$str !
:! "
UserManager
�� #
.
��# $
Delete
��$ *
(
��* +
user
��+ /
)
��/ 0
;
��0 1
break
�� 
;
�� 
}
�� 
base
�� 
.
�� 
db
�� 
.
�� 
SaveChanges
�� #
(
��# $
)
��$ %
;
��% &
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
�� '
.
��' (
AllowGet
��( 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
public
�� 
ActionResult
�� 
Settings
�� $
(
��$ %
)
��% &
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� $
(
��$ %
LoggedInUser
��% 1
?
��1 2
.
��2 3
ApiKey
��3 9
)
��9 :
)
��: ;
{
�� 
var
�� 
user
�� 
=
�� 
base
�� 
.
��  
db
��  "
.
��" #
Users
��# (
.
��( )
ToList
��) /
(
��/ 0
)
��0 1
.
��1 2
FirstOrDefault
��2 @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Id
��H J
==
��K M
LoggedInUser
��N Z
?
��Z [
.
��[ \
Id
��\ ^
)
��^ _
;
��_ `
user
�� 
.
�� 
ApiKey
�� 
=
�� 
KeyGenerator
�� *
.
��* +
GetUniqueKey
��+ 7
(
��7 8
$num
��8 :
)
��: ;
;
��; <
base
�� 
.
�� 
db
�� 
.
�� 
SaveChanges
�� #
(
��# $
)
��$ %
;
��% &
SetupLoggedInUser
�� !
(
��! "
LoggedInUser
��" .
?
��. /
.
��/ 0
UserName
��0 8
)
��8 9
;
��9 :
}
�� 
UserProfileVM
�� 
profile
�� !
=
��" #
new
��$ '
UserProfileVM
��( 5
(
��5 6
)
��6 7
{
�� 
	IsUsesAPI
�� 
=
�� 
LoggedInUser
�� (
.
��( )
	IsUsesApi
��) 2
,
��2 3
APIKey
�� 
=
�� 
LoggedInUser
�� %
.
��% &
ApiKey
��& ,
,
��, -
Email
�� 
=
�� 
LoggedInUser
�� $
.
��$ %
Email
��% *
,
��* +
CompanyLogo
�� 
=
�� 
LoggedInUser
�� *
.
��* +
CompanyLogo
��+ 6
}
�� 
;
�� 
return
�� 
View
�� 
(
�� 
$str
�� "
,
��" #
profile
��% ,
)
��, -
;
��- .
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
Settings
�� $
(
��$ %
UserProfileVM
��% 2
profile
��3 :
)
��: ;
{
�� 	
try
�� 
{
�� 
var
�� 
user
�� 
=
�� 
base
�� 
.
��  
db
��  "
.
��" #
Users
��# (
.
��( )
FirstOrDefault
��) 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
Id
��? A
==
��B D
LoggedInUser
��E Q
.
��Q R
Id
��R T
)
��T U
;
��U V
user
�� 
.
�� 
Email
�� 
=
�� 
profile
�� $
.
��$ %
Email
��% *
;
��* +
user
�� 
.
�� 
CompanyLogo
��  
=
��! "
profile
��# *
.
��* +
CompanyLogo
��+ 6
;
��6 7
base
�� 
.
�� 
db
�� 
.
�� 
SaveChanges
�� #
(
��# $
)
��$ %
;
��% &
SetupLoggedInUser
�� !
(
��! "
LoggedInUser
��" .
.
��. /
UserName
��/ 7
)
��7 8
;
��8 9
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& N
;
��N O
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 2
)
��2 3
;
��3 4
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� 
)
��  
;
��  !
}
�� 	
public
�� 
ActionResult
�� 
Vendors
�� #
(
��# $
CampaignSearchVM
��$ 4
sc
��5 7
)
��7 8
{
�� 	
var
�� 
vendors
�� 
=
�� 
db
�� 
.
�� 
Vendors
�� $
.
��$ %
Select
��% +
(
��+ ,
x
��, -
=>
��. 0
new
�� 
UserProfileVM
�� 
(
�� 
)
�� 
{
�� 
Id
�� 
=
�� 
x
�� 
.
�� 
Id
�� 
.
�� 
ToString
�� "
(
��" #
)
��# $
,
��$ %
	FirstName
�� 
=
�� 
x
�� 
.
�� 
Name
�� "
,
��" #
LastName
�� 
=
�� 
x
�� 
.
�� 
CompanyName
�� (
,
��( )
Email
�� 
=
�� 
x
�� 
.
�� 
Email
�� 
,
��  
CCEmails
�� 
=
�� 
x
�� 
.
�� 
CCEmails
�� %
,
��% &
Phone
�� 
=
�� 
x
�� 
.
�� 
Phone
�� 
,
��  
APIKey
�� 
=
�� 
x
�� 
.
�� 
APIKey
�� !
,
��! "
DateCreated
�� 
=
�� 
x
�� 
.
��  
	CreatedAt
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
int
�� 

pageNumber
�� 
=
�� 
(
�� 
sc
��  
.
��  !
page
��! %
??
��& (
$num
��) *
)
��* +
;
��+ ,
var
�� 
Model
�� 
=
�� 
vendors
�� 
.
��  
ToPagedList
��  +
(
��+ ,

pageNumber
��, 6
,
��6 7
pageSize
��8 @
)
��@ A
;
��A B
return
�� 
View
�� 
(
�� 
$str
�� !
,
��! "
Model
��# (
)
��( )
;
��) *
}
�� 	
public
�� 
ActionResult
�� 
CreateVendor
�� (
(
��( )
)
��) *
{
�� 	
return
�� 
View
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
CreateVendor
�� (
(
��( )
UserProfileVM
��) 6
profile
��7 >
)
��> ?
{
�� 	
try
�� 
{
�� 
var
�� 
vendor
�� 
=
�� 
new
��  
Vendor
��! '
(
��' (
)
��( )
{
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� %
(
��% &
)
��& '
,
��' (
	CreatedAt
�� 
=
�� 
DateTime
��  (
.
��( )
Now
��) ,
,
��, -
	CreatedBy
�� 
=
�� 
LoggedInUser
��  ,
.
��, -
Id
��- /
,
��/ 0
Name
�� 
=
�� 
profile
�� "
.
��" #
	FirstName
��# ,
,
��, -
CompanyName
�� 
=
��  !
profile
��" )
.
��) *
LastName
��* 2
,
��2 3
Email
�� 
=
�� 
profile
�� #
.
��# $
Email
��$ )
,
��) *
CCEmails
�� 
=
�� 
profile
�� &
.
��& '
CCEmails
��' /
,
��/ 0
Phone
�� 
=
�� 
profile
�� #
.
��# $
Phone
��$ )
,
��) *
APIKey
�� 
=
�� 
profile
�� $
.
��$ %
	IsUsesAPI
��% .
?
��/ 0
KeyGenerator
��1 =
.
��= >
GetUniqueKey
��> J
(
��J K
$num
��K M
)
��M N
:
��O P
string
��Q W
.
��W X
Empty
��X ]
}
�� 
;
�� 
db
�� 
.
�� 
Vendors
�� 
.
�� 
Add
�� 
(
�� 
vendor
�� %
)
��% &
;
��& '
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
ForceVendors
�� 
=
�� 
true
�� #
;
��# $
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& T
;
��T U
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 1
)
��1 2
;
��2 3
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� 
)
��  
;
��  !
}
�� 	
public
�� 
ActionResult
�� 

EditVendor
�� &
(
��& '
Guid
��' +
?
��+ ,
id
��- /
)
��/ 0
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
var
�� 
x
�� 
=
�� 
db
�� 
.
�� 
Vendors
�� 
.
�� 
Find
�� #
(
��# $
id
��$ &
)
��& '
;
��' (
if
�� 
(
�� 
x
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
var
�� 
vendor
�� 
=
�� 
new
�� 
UserProfileVM
�� )
(
��) *
)
��* +
{
�� 
Id
�� 
=
�� 
x
�� 
.
�� 
Id
�� 
.
�� 
ToString
�� "
(
��" #
)
��# $
,
��$ %
	FirstName
�� 
=
�� 
x
�� 
.
�� 
Name
�� "
,
��" #
LastName
�� 
=
�� 
x
�� 
.
�� 
CompanyName
�� (
,
��( )
Email
�� 
=
�� 
x
�� 
.
�� 
Email
�� 
,
��  
CCEmails
�� 
=
�� 
x
�� 
.
�� 
CCEmails
�� %
,
��% &
Phone
�� 
=
�� 
x
�� 
.
�� 
Phone
�� 
,
��  
APIKey
�� 
=
�� 
x
�� 
.
�� 
APIKey
�� !
,
��! "
DateCreated
�� 
=
�� 
x
�� 
.
��  
	CreatedAt
��  )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
}
�� 
;
�� 
return
�� 
View
�� 
(
�� 
$str
�� &
,
��& '
vendor
��( .
)
��. /
;
��/ 0
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 

EditVendor
�� &
(
��& '
UserProfileVM
��' 4
profile
��5 <
)
��< =
{
�� 	
try
�� 
{
�� 
var
�� 
vendor
�� 
=
�� 
db
�� 
.
��  
Vendors
��  '
.
��' (
Find
��( ,
(
��, -
Guid
��- 1
.
��1 2
Parse
��2 7
(
��7 8
profile
��8 ?
.
��? @
Id
��@ B
)
��B C
)
��C D
;
��D E
vendor
�� 
.
�� 
Name
�� 
=
�� 
profile
�� %
.
��% &
	FirstName
��& /
;
��/ 0
vendor
�� 
.
�� 
CompanyName
�� "
=
��# $
profile
��% ,
.
��, -
LastName
��- 5
;
��5 6
vendor
�� 
.
�� 
Email
�� 
=
�� 
profile
�� &
.
��& '
Email
��' ,
;
��, -
vendor
�� 
.
�� 
CCEmails
�� 
=
��  !
profile
��" )
.
��) *
CCEmails
��* 2
;
��2 3
vendor
�� 
.
�� 
Phone
�� 
=
�� 
profile
�� &
.
��& '
Phone
��' ,
;
��, -
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& V
;
��V W
ForceVendors
�� 
=
�� 
true
�� #
;
��# $
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 1
)
��1 2
;
��2 3
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� 
)
��  
;
��  !
}
�� 	
public
�� 
ActionResult
�� 

SaveVendor
�� &
(
��& '
CompanyUsersVM
��' 5
model
��6 ;
)
��; <
{
�� 	
try
�� 
{
�� 
var
�� 
vendor
�� 
=
�� 
db
�� 
.
��  
Vendors
��  '
.
��' (
Find
��( ,
(
��, -
model
��- 2
.
��2 3
ID
��3 5
)
��5 6
;
��6 7
switch
�� 
(
�� 
model
�� 
.
�� 
Action
�� $
)
��$ %
{
�� 
case
�� 
$str
�� !
:
��! "
db
�� 
.
�� 
Vendors
�� "
.
��" #
Remove
��# )
(
��) *
vendor
��* 0
)
��0 1
;
��1 2
break
�� 
;
�� 
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
ForceVendors
�� 
=
�� 
true
�� #
;
��# $
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
�� '
.
��' (
AllowGet
��( 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
}
�� 
}�� ��
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CreativeController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
CreativeController #
:$ %
BaseController& 4
{ 
public 
ActionResult 
Index !
(! "
Guid" &
id' )
)) *
{ 	
var 
campaign 
= 
db 
. 
	Campaigns '
. 
Include 
( 
c 
=> 
c 
.  
Assets  &
)& '
. 
Include 
( 
c 
=> 
c 
.  
Testing  '
)' (
. 
Include 
( 
c 
=> 
c 
.  
Approved  (
)( )
. 
Include 
( 
c 
=> 
c 
.  
Creative  (
)( )
.   
FirstOrDefault   
(    
c    !
=>  " $
c  % &
.  & '
Id  ' )
==  * ,
id  - /
)  / 0
;  0 1
Session"" 
["" 
$str"" 
]"" 
="" 
id"" 
;"" 
Session## 
[## 
$str## !
]##! "
=### $
campaign##% -
.##- .
OrderNumber##. 9
;##9 :
var%% 
creative%% 
=%% 
new%% 

CreativeVM%% )
(%%) *
)%%* +
{&& 

CampaignId'' 
='' 
campaign'' %
.''% &
Id''& (
.''( )
ToString'') 1
(''1 2
)''2 3
,''3 4
OrderNumber(( 
=(( 
campaign(( &
.((& '
OrderNumber((' 2
,((2 3
CampaignName)) 
=)) 
campaign)) '
.))' (
Testing))( /
.))/ 0
CampaignName))0 <
,))< =
FromLine** 
=** 
campaign** #
.**# $
Testing**$ +
.**+ ,
FromLine**, 4
,**4 5
SubjectLine++ 
=++ 
campaign++ &
.++& '
Testing++' .
.++. /
SubjectLine++/ :
,++: ;
TestSeedFile,, 
=,, 
campaign,, '
.,,' (
Assets,,( .
.,,. /
TestSeedFile,,/ ;
,,,; <
LiveSeedFile-- 
=-- 
campaign-- '
.--' (
Assets--( .
.--. /
LiveSeedFile--/ ;
,--; <
	Creatives.. 
=.. 
campaign.. $
...$ %
Creative..% -
?..- .
.... /
CreativeHtml../ ;
,..; <

TestEmails// 
=// 
new//  
List//! %
<//% &
SelectItemPair//& 4
>//4 5
(//5 6
)//6 7
,//7 8

LiveEmails00 
=00 
new00  
List00! %
<00% &
SelectItemPair00& 4
>004 5
(005 6
)006 7
}11 
;11 
if33 
(33 
!33 
string33 
.33 
IsNullOrEmpty33 %
(33% &
campaign33& .
.33. /
Assets33/ 5
.335 6
TestSeedFile336 B
)33B C
)33C D
{44 
string55 
filePath55 
=55  !
Path55" &
.55& '
Combine55' .
(55. /

UploadPath55/ 9
,559 :
campaign55; C
.55C D
Assets55D J
.55J K
TestSeedFile55K W
)55W X
;55X Y
if66 
(66 
!66 
System66 
.66 
IO66 
.66 
File66 "
.66" #
Exists66# )
(66) *
filePath66* 2
)662 3
&&664 6
!667 8
string668 >
.66> ?
IsNullOrEmpty66? L
(66L M
campaign66M U
.66U V
Assets66V \
.66\ ]
TestSeedFile66] i
)66i j
)66j k
S3FileManager77 !
.77! "
Download77" *
(77* +
campaign77+ 3
.773 4
Assets774 :
.77: ;
TestSeedFile77; G
,77G H
filePath77I Q
)77Q R
;77R S
creative88 
.88 

TestEmails88 #
=88$ %
CreativeUtility88& 5
.885 6

ReadEmails886 @
(88@ A
filePath88A I
)88I J
;88J K
}99 
if;; 
(;; 
!;; 
string;; 
.;; 
IsNullOrEmpty;; %
(;;% &
campaign;;& .
.;;. /
Assets;;/ 5
.;;5 6
LiveSeedFile;;6 B
);;B C
);;C D
{<< 
string== 
filePathLive== #
===$ %
Path==& *
.==* +
Combine==+ 2
(==2 3

UploadPath==3 =
,=== >
campaign==? G
.==G H
Assets==H N
.==N O
LiveSeedFile==O [
)==[ \
;==\ ]
if>> 
(>> 
!>> 
System>> 
.>> 
IO>> 
.>> 
File>> #
.>># $
Exists>>$ *
(>>* +
filePathLive>>+ 7
)>>7 8
&&>>9 ;
!>>< =
string>>= C
.>>C D
IsNullOrEmpty>>D Q
(>>Q R
campaign>>R Z
.>>Z [
Assets>>[ a
.>>a b
LiveSeedFile>>b n
)>>n o
)>>o p
S3FileManager?? !
.??! "
Download??" *
(??* +
campaign??+ 3
.??3 4
Assets??4 :
.??: ;
LiveSeedFile??; G
,??G H
filePathLive??I U
)??U V
;??V W
creative@@ 
.@@ 

LiveEmails@@ #
=@@$ %
CreativeUtility@@& 5
.@@5 6

ReadEmails@@6 @
(@@@ A
filePathLive@@A M
)@@M N
;@@N O
}AA 
SessionCC 
[CC 
$strCC "
]CC" #
=CC$ %
campaignCC& .
.CC. /
AssetsCC/ 5
.CC5 6
TestSeedFileCC6 B
;CCB C
SessionDD 
[DD 
$strDD !
]DD! "
=DD# $
campaignDD% -
.DD- .
AssetsDD. 4
.DD4 5
TestSeedUrlDD5 @
;DD@ A
SessionEE 
[EE 
$strEE "
]EE" #
=EE$ %
campaignEE& .
.EE. /
AssetsEE/ 5
.EE5 6
LiveSeedFileEE6 B
;EEB C
SessionFF 
[FF 
$strFF !
]FF! "
=FF# $
campaignFF% -
.FF- .
AssetsFF. 4
.FF4 5
LiveSeedUrlFF5 @
;FF@ A
returnGG 
ViewGG 
(GG 
creativeGG  
)GG  !
;GG! "
}HH 	
[JJ 	
HttpPostJJ	 
]JJ 
[KK 	
ValidateInputKK	 
(KK 
falseKK 
)KK 
]KK 
[LL 	
MultipleButtonLL	 
(LL 
NameLL 
=LL 
$strLL '
,LL' (
ArgumentLL) 1
=LL2 3
$strLL4 :
)LL: ;
]LL; <
publicMM 
ActionResultMM 
SaveMM  
(MM  !

CreativeVMMM! +
modelMM, 1
)MM1 2
{NN 	
tryOO 
{PP 
varQQ 
alreayQQ 
=QQ 
dbQQ 
.QQ  
CampaignCreativesQQ  1
.QQ1 2
FirstOrDefaultQQ2 @
(QQ@ A
xQQA B
=>QQC E
xQQF G
.QQG H

CampaignIdQQH R
.QQR S
ToStringQQS [
(QQ[ \
)QQ\ ]
==QQ^ `
modelQQa f
.QQf g

CampaignIdQQg q
)QQq r
;QQr s
ifRR 
(RR 
alreayRR 
==RR 
nullRR "
)RR" #
{SS 
varTT 

creativeIdTT "
=TT# $
GuidTT% )
.TT) *
NewGuidTT* 1
(TT1 2
)TT2 3
;TT3 4
alreayUU 
=UU 
newUU  
CampaignCreativeUU! 1
(UU1 2
)UU2 3
{VV 
IdWW 
=WW 

creativeIdWW '
,WW' (
	CreatedAtXX !
=XX" #
DateTimeXX$ ,
.XX, -
NowXX- 0
,XX0 1

CampaignIdYY "
=YY# $
GuidYY% )
.YY) *
ParseYY* /
(YY/ 0
modelYY0 5
.YY5 6

CampaignIdYY6 @
)YY@ A
,YYA B
CreativeHtmlZZ $
=ZZ% &
modelZZ' ,
.ZZ, -
	CreativesZZ- 6
}[[ 
;[[ 
db\\ 
.\\ 
CampaignCreatives\\ (
.\\( )
Add\\) ,
(\\, -
alreay\\- 3
)\\3 4
;\\4 5
var]] 
campaign]]  
=]]! "
db]]# %
.]]% &
	Campaigns]]& /
.]]/ 0
FirstOrDefault]]0 >
(]]> ?
c]]? @
=>]]A C
c]]D E
.]]E F
Id]]F H
.]]H I
ToString]]I Q
(]]Q R
)]]R S
==]]T V
model]]W \
.]]\ ]

CampaignId]]] g
)]]g h
;]]h i
campaign^^ 
.^^ 

CreativeId^^ '
=^^( )

creativeId^^* 4
;^^4 5
}__ 
else`` 
{aa 
alreaybb 
.bb 
CreativeHtmlbb '
=bb( )
modelbb* /
.bb/ 0
	Creativesbb0 9
;bb9 :
}cc 
dbdd 
.dd 
SaveChangesdd 
(dd 
)dd  
;dd  !
TempDataee 
[ee 
$stree "
]ee" #
=ee$ %
$stree& N
;eeN O
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
TempDataii 
[ii 
$strii  
]ii  !
=ii" #
$strii$ D
+iiE F
stringiiG M
.iiM N
JoiniiN R
(iiR S
$striiS Z
,iiZ [
exii\ ^
.ii^ _
Messageii_ f
)iif g
;iig h
}jj 
returnkk 
RedirectToActionkk #
(kk# $
$strkk$ +
,kk+ ,
newkk- 0
{kk1 2
idkk3 5
=kk6 7
modelkk8 =
.kk= >

CampaignIdkk> H
}kkI J
)kkJ K
;kkK L
}ll 	
publicnn 
ActionResultnn 
	AddToListnn %
(nn% &
stringnn& ,
listnn- 1
,nn1 2
stringnn3 9
emailnn: ?
)nn? @
{oo 	
trypp 
{qq 
switchrr 
(rr 
listrr 
)rr 
{ss 
casett 
$strtt 
:tt  
stringuu 
filePathuu '
=uu( )
Pathuu* .
.uu. /
Combineuu/ 6
(uu6 7

UploadPathuu7 A
,uuA B
(uuC D
stringuuD J
)uuJ K
SessionuuK R
[uuR S
$struuS a
]uua b
)uub c
;uuc d
newvv 
CreativeUtilityvv +
(vv+ ,
)vv, -
.vv- .
Addvv. 1
(vv1 2
filePathvv2 :
,vv: ;
emailvv< A
)vvA B
;vvB C
S3FileManagerww %
.ww% &
Uploadww& ,
(ww, -
(ww- .
stringww. 4
)ww4 5
Sessionww5 <
[ww< =
$strww= J
]wwJ K
,wwK L
filePathwwM U
,wwU V
truewwW [
)ww[ \
;ww\ ]
breakxx 
;xx 
caseyy 
$stryy 
:yy  
stringzz 
filePathLivezz +
=zz, -
Pathzz. 2
.zz2 3
Combinezz3 :
(zz: ;

UploadPathzz; E
,zzE F
(zzG H
stringzzH N
)zzN O
SessionzzO V
[zzV W
$strzzW f
]zzf g
)zzg h
;zzh i
new{{ 
CreativeUtility{{ +
({{+ ,
){{, -
.{{- .
Add{{. 1
({{1 2
filePathLive{{2 >
,{{> ?
email{{@ E
){{E F
;{{F G
S3FileManager|| %
.||% &
Upload||& ,
(||, -
(||- .
string||. 4
)||4 5
Session||5 <
[||< =
$str||= J
]||J K
,||K L
filePathLive||M Y
,||Y Z
true||[ _
)||_ `
;||` a
break}} 
;}} 
}~~ 
return 
Json 
( 
new 
JsonResponse  ,
(, -
)- .
{/ 0
IsSucess0 8
=9 :
true; ?
}? @
)@ A
;A B
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��0 8
=
��9 :
false
��; @
,
��@ A
ErrorMessage
��B N
=
��O P
ex
��Q S
.
��S T
Message
��T [
}
��[ \
)
��\ ]
;
��] ^
}
�� 
}
�� 	
public
�� 
ActionResult
�� 
DeleteFromList
�� *
(
��* +
string
��+ 1
list
��2 6
,
��6 7
string
��8 >
email
��? D
)
��D E
{
�� 	
try
�� 
{
�� 
switch
�� 
(
�� 
list
�� 
)
�� 
{
�� 
case
�� 
$str
�� 
:
��  
string
�� 
filePath
�� '
=
��( )
Path
��* .
.
��. /
Combine
��/ 6
(
��6 7

UploadPath
��7 A
,
��A B
(
��C D
string
��D J
)
��J K
Session
��K R
[
��R S
$str
��S a
]
��a b
)
��b c
;
��c d
new
�� 
CreativeUtility
�� +
(
��+ ,
)
��, -
.
��- .
Remove
��. 4
(
��4 5
filePath
��5 =
,
��= >
email
��? D
)
��D E
;
��E F
S3FileManager
�� %
.
��% &
Upload
��& ,
(
��, -
(
��- .
string
��. 4
)
��4 5
Session
��5 <
[
��< =
$str
��= J
]
��J K
,
��K L
filePath
��M U
,
��U V
true
��W [
)
��[ \
;
��\ ]
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
string
�� 
filePathLive
�� +
=
��, -
Path
��. 2
.
��2 3
Combine
��3 :
(
��: ;

UploadPath
��; E
,
��E F
(
��G H
string
��H N
)
��N O
Session
��O V
[
��V W
$str
��W f
]
��f g
)
��g h
;
��h i
new
�� 
CreativeUtility
�� +
(
��+ ,
)
��, -
.
��- .
Remove
��. 4
(
��4 5
filePathLive
��5 A
,
��A B
email
��C H
)
��H I
;
��I J
S3FileManager
�� %
.
��% &
Upload
��& ,
(
��, -
(
��- .
string
��. 4
)
��4 5
Session
��5 <
[
��< =
$str
��= J
]
��J K
,
��K L
filePathLive
��M Y
,
��Y Z
true
��[ _
)
��_ `
;
��` a
break
�� 
;
�� 
}
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
)
��B C
;
��C D
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
ValidateInput
��	 
(
�� 
false
�� 
)
�� 
]
�� 
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 >
)
��> ?
]
��? @
public
�� 
ActionResult
�� 
TestSend
�� $
(
��$ %

CreativeVM
��% /
model
��0 5
)
��5 6
{
�� 	
try
�� 
{
�� 
string
�� 
filePath
�� 
=
��  !
Path
��" &
.
��& '
Combine
��' .
(
��. /

UploadPath
��/ 9
,
��9 :
(
��; <
string
��< B
)
��B C
Session
��C J
[
��J K
$str
��K Y
]
��Y Z
)
��Z [
;
��[ \
string
�� 
filePathLive
�� #
=
��$ %
Path
��& *
.
��* +
Combine
��+ 2
(
��2 3

UploadPath
��3 =
,
��= >
(
��? @
string
��@ F
)
��F G
Session
��G N
[
��N O
$str
��O ^
]
��^ _
)
��_ `
;
��` a
model
�� 
.
�� 

TestEmails
��  
=
��! "
CreativeUtility
��# 2
.
��2 3

ReadEmails
��3 =
(
��= >
filePath
��> F
)
��F G
;
��G H
model
�� 
.
�� 

LiveEmails
��  
=
��! "
CreativeUtility
��# 2
.
��2 3

ReadEmails
��3 =
(
��= >
filePathLive
��> J
)
��J K
;
��K L
BackgroundJob
�� 
.
�� 
Enqueue
�� %
(
��% &
(
��& '
)
��' (
=>
��) + 
MailChimpProcessor
��, >
.
��> ?
TestSend
��? G
(
��G H
model
��H M
)
��M N
)
��N O
;
��O P
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& X
;
��X Y
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ D
+
��E F
string
��G M
.
��M N
Join
��N R
(
��R S
$str
��S Z
,
��Z [
ex
��\ ^
.
��^ _
Message
��_ f
)
��f g
;
��g h
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
new
��- 0
{
��1 2
id
��2 4
=
��4 5
model
��6 ;
.
��; <

CampaignId
��< F
}
��F G
)
��G H
;
��H I
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
ValidateInput
��	 
(
�� 
false
�� 
)
�� 
]
�� 
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 C
)
��C D
]
��D E
public
�� 
ActionResult
�� 
QuickTestSend
�� )
(
��) *

CreativeVM
��* 4
model
��5 :
)
��: ;
{
�� 	
try
�� 
{
��  
MailChimpProcessor
�� "
.
��" #
QucikTestSend
��# 0
(
��0 1
model
��1 6
)
��6 7
;
��7 8
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& N
;
��N O
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ D
+
��E F
string
��G M
.
��M N
Join
��N R
(
��R S
$str
��S Z
,
��Z [
ex
��\ ^
.
��^ _
Message
��_ f
)
��f g
;
��g h
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
new
��- 0
{
��1 2
id
��3 5
=
��6 7
model
��8 =
.
��= >

CampaignId
��> H
}
��I J
)
��J K
;
��K L
}
�� 	
public
�� 

JsonResult
�� !
RefreshMailChimpLog
�� -
(
��- .
string
��. 4
OrderNumber
��5 @
)
��@ A
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
OrderNumber
�� 
==
��  "
null
��# '
)
��' (
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( >
)
��> ?
;
��? @
}
�� 
var
�� 
messages
�� 
=
�� 
db
�� !
.
��! "

SystemLogs
��" ,
.
��, -
Where
��- 2
(
��2 3
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
OrderNumber
��: E
==
��F H
OrderNumber
��I T
&&
��U W
x
��X Y
.
��Y Z
LogType
��Z a
==
��b d
(
��e f
int
��f i
)
��i j
LogType
��j q
.
��q r
	MailChimp
��r {
)
��{ |
.
�� 
OrderByDescending
�� &
(
��& '
x
��' (
=>
��) +
x
��, -
.
��- .
	CreatedAt
��. 7
)
��7 8
.
�� 
Select
�� 
(
�� 
x
�� 
=>
��  
new
��! $
{
��% &
	CreatedAt
��' 0
=
��1 2
x
��3 4
.
��4 5
	CreatedAt
��5 >
.
��> ?
ToString
��? G
(
��G H
)
��H I
,
��I J
Message
��K R
=
��S T
x
��U V
.
��V W
Message
��W ^
}
��_ `
)
��` a
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
,
��@ A
Result
��B H
=
��I J
messages
��K S
}
��T U
)
��U V
;
��V W
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
}
�� 
}�� �
IE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\ManageController.cs
	namespace

 	
WFP


 
.

 
ICT

 
.

 
Web

 
.

 
Controllers

 !
{ 
public 

class 
ManageController !
:" #

Controller$ .
{ 
private $
ApplicationSignInManager (
_signInManager) 7
;7 8
private "
ApplicationUserManager &
_userManager' 3
;3 4
public 
ManageController 
(  
)  !
{ 	
} 	
public 
ManageController 
(  "
ApplicationUserManager  6
userManager7 B
,B C$
ApplicationSignInManagerD \
signInManager] j
)j k
{ 	
UserManager 
= 
userManager %
;% &
SignInManager 
= 
signInManager )
;) *
} 	
public $
ApplicationSignInManager '
SignInManager( 5
{ 	
get 
{ 
return   
_signInManager   %
??  & (
HttpContext  ) 4
.  4 5
GetOwinContext  5 C
(  C D
)  D E
.  E F
Get  F I
<  I J$
ApplicationSignInManager  J b
>  b c
(  c d
)  d e
;  e f
}!! 
private"" 
set"" 
{## 
_signInManager$$ 
=$$  
value$$! &
;$$& '
}%% 
}&& 	
public(( "
ApplicationUserManager(( %
UserManager((& 1
{)) 	
get** 
{++ 
return,, 
_userManager,, #
??,,$ &
HttpContext,,' 2
.,,2 3
GetOwinContext,,3 A
(,,A B
),,B C
.,,C D
GetUserManager,,D R
<,,R S"
ApplicationUserManager,,S i
>,,i j
(,,j k
),,k l
;,,l m
}-- 
private.. 
set.. 
{// 
_userManager00 
=00 
value00 $
;00$ %
}11 
}22 	
public66 
async66 
Task66 
<66 
ActionResult66 &
>66& '
Index66( -
(66- .
ManageMessageId66. =
?66= >
message66? F
)66F G
{77 	
ViewBag88 
.88 
StatusMessage88 !
=88" #
message99 
==99 
ManageMessageId99 *
.99* +!
ChangePasswordSuccess99+ @
?99A B
$str99C d
::: 
message:: 
==:: 
ManageMessageId:: ,
.::, -
SetPasswordSuccess::- ?
?::@ A
$str::B _
:;; 
message;; 
==;; 
ManageMessageId;; ,
.;;, -
SetTwoFactorSuccess;;- @
?;;A B
$str;;C z
:<< 
message<< 
==<< 
ManageMessageId<< ,
.<<, -
Error<<- 2
?<<3 4
$str<<5 M
:== 
message== 
==== 
ManageMessageId== ,
.==, -
AddPhoneSuccess==- <
?=== >
$str==? ]
:>> 
message>> 
==>> 
ManageMessageId>> ,
.>>, -
RemovePhoneSuccess>>- ?
?>>@ A
$str>>B b
:?? 
$str?? 
;?? 
varAA 
userIdAA 
=AA 
UserAA 
.AA 
IdentityAA &
.AA& '
	GetUserIdAA' 0
(AA0 1
)AA1 2
;AA2 3
varBB 
modelBB 
=BB 
newBB 
IndexViewModelBB *
{CC 
HasPasswordDD 
=DD 
HasPasswordDD )
(DD) *
)DD* +
,DD+ ,
PhoneNumberEE 
=EE 
awaitEE #
UserManagerEE$ /
.EE/ 0
GetPhoneNumberAsyncEE0 C
(EEC D
userIdEED J
)EEJ K
,EEK L
	TwoFactorFF 
=FF 
awaitFF !
UserManagerFF" -
.FF- .$
GetTwoFactorEnabledAsyncFF. F
(FFF G
userIdFFG M
)FFM N
,FFN O
LoginsGG 
=GG 
awaitGG 
UserManagerGG *
.GG* +
GetLoginsAsyncGG+ 9
(GG9 :
userIdGG: @
)GG@ A
,GGA B
BrowserRememberedHH !
=HH" #
awaitHH$ )!
AuthenticationManagerHH* ?
.HH? @+
TwoFactorBrowserRememberedAsyncHH@ _
(HH_ `
userIdHH` f
)HHf g
}II 
;II 
returnJJ 
ViewJJ 
(JJ 
modelJJ 
)JJ 
;JJ 
}KK 	
[OO 	
HttpPostOO	 
]OO 
[PP 	$
ValidateAntiForgeryTokenPP	 !
]PP! "
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
ActionResultQQ &
>QQ& '
RemoveLoginQQ( 3
(QQ3 4
stringQQ4 :
loginProviderQQ; H
,QQH I
stringQQJ P
providerKeyQQQ \
)QQ\ ]
{RR 	
ManageMessageIdSS 
?SS 
messageSS $
;SS$ %
varTT 
resultTT 
=TT 
awaitTT 
UserManagerTT *
.TT* +
RemoveLoginAsyncTT+ ;
(TT; <
UserTT< @
.TT@ A
IdentityTTA I
.TTI J
	GetUserIdTTJ S
(TTS T
)TTT U
,TTU V
newTTW Z
UserLoginInfoTT[ h
(TTh i
loginProviderTTi v
,TTv w
providerKey	TTx �
)
TT� �
)
TT� �
;
TT� �
ifUU 
(UU 
resultUU 
.UU 
	SucceededUU  
)UU  !
{VV 
varWW 
userWW 
=WW 
awaitWW  
UserManagerWW! ,
.WW, -
FindByIdAsyncWW- :
(WW: ;
UserWW; ?
.WW? @
IdentityWW@ H
.WWH I
	GetUserIdWWI R
(WWR S
)WWS T
)WWT U
;WWU V
ifXX 
(XX 
userXX 
!=XX 
nullXX  
)XX  !
{YY 
awaitZZ 
SignInManagerZZ '
.ZZ' (
SignInAsyncZZ( 3
(ZZ3 4
userZZ4 8
,ZZ8 9
isPersistentZZ: F
:ZZF G
falseZZH M
,ZZM N
rememberBrowserZZO ^
:ZZ^ _
falseZZ` e
)ZZe f
;ZZf g
}[[ 
message\\ 
=\\ 
ManageMessageId\\ )
.\\) *
RemoveLoginSuccess\\* <
;\\< =
}]] 
else^^ 
{__ 
message`` 
=`` 
ManageMessageId`` )
.``) *
Error``* /
;``/ 0
}aa 
returnbb 
RedirectToActionbb #
(bb# $
$strbb$ 2
,bb2 3
newbb4 7
{bb8 9
Messagebb: A
=bbB C
messagebbD K
}bbL M
)bbM N
;bbN O
}cc 	
publicgg 
ActionResultgg 
AddPhoneNumbergg *
(gg* +
)gg+ ,
{hh 	
returnii 
Viewii 
(ii 
)ii 
;ii 
}jj 	
[nn 	
HttpPostnn	 
]nn 
[oo 	$
ValidateAntiForgeryTokenoo	 !
]oo! "
publicpp 
asyncpp 
Taskpp 
<pp 
ActionResultpp &
>pp& '
AddPhoneNumberpp( 6
(pp6 7#
AddPhoneNumberViewModelpp7 N
modelppO T
)ppT U
{qq 	
ifrr 
(rr 
!rr 

ModelStaterr 
.rr 
IsValidrr #
)rr# $
{ss 
returntt 
Viewtt 
(tt 
modeltt !
)tt! "
;tt" #
}uu 
varww 
codeww 
=ww 
awaitww 
UserManagerww (
.ww( )/
#GenerateChangePhoneNumberTokenAsyncww) L
(wwL M
UserwwM Q
.wwQ R
IdentitywwR Z
.wwZ [
	GetUserIdww[ d
(wwd e
)wwe f
,wwf g
modelwwh m
.wwm n
Numberwwn t
)wwt u
;wwu v
ifxx 
(xx 
UserManagerxx 
.xx 

SmsServicexx &
!=xx' )
nullxx* .
)xx. /
{yy 
varzz 
messagezz 
=zz 
newzz !
IdentityMessagezz" 1
{{{ 
Destination|| 
=||  !
model||" '
.||' (
Number||( .
,||. /
Body}} 
=}} 
$str}} 4
+}}5 6
code}}7 ;
}~~ 
;~~ 
await 
UserManager !
.! "

SmsService" ,
., -
	SendAsync- 6
(6 7
message7 >
)> ?
;? @
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 7
,
��7 8
new
��9 <
{
��= >
PhoneNumber
��? J
=
��K L
model
��M R
.
��R S
Number
��S Y
}
��Z [
)
��[ \
;
��\ ]
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '+
EnableTwoFactorAuthentication
��( E
(
��E F
)
��F G
{
�� 	
await
�� 
UserManager
�� 
.
�� &
SetTwoFactorEnabledAsync
�� 6
(
��6 7
User
��7 ;
.
��; <
Identity
��< D
.
��D E
	GetUserId
��E N
(
��N O
)
��O P
,
��P Q
true
��R V
)
��V W
;
��W X
var
�� 
user
�� 
=
�� 
await
�� 
UserManager
�� (
.
��( )
FindByIdAsync
��) 6
(
��6 7
User
��7 ;
.
��; <
Identity
��< D
.
��D E
	GetUserId
��E N
(
��N O
)
��O P
)
��P Q
;
��Q R
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
await
�� 
SignInManager
�� #
.
��# $
SignInAsync
��$ /
(
��/ 0
user
��0 4
,
��4 5
isPersistent
��6 B
:
��B C
false
��D I
,
��I J
rememberBrowser
��K Z
:
��Z [
false
��\ a
)
��a b
;
��b c
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 5
)
��5 6
;
��6 7
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& ',
DisableTwoFactorAuthentication
��( F
(
��F G
)
��G H
{
�� 	
await
�� 
UserManager
�� 
.
�� &
SetTwoFactorEnabledAsync
�� 6
(
��6 7
User
��7 ;
.
��; <
Identity
��< D
.
��D E
	GetUserId
��E N
(
��N O
)
��O P
,
��P Q
false
��R W
)
��W X
;
��X Y
var
�� 
user
�� 
=
�� 
await
�� 
UserManager
�� (
.
��( )
FindByIdAsync
��) 6
(
��6 7
User
��7 ;
.
��; <
Identity
��< D
.
��D E
	GetUserId
��E N
(
��N O
)
��O P
)
��P Q
;
��Q R
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
await
�� 
SignInManager
�� #
.
��# $
SignInAsync
��$ /
(
��/ 0
user
��0 4
,
��4 5
isPersistent
��6 B
:
��B C
false
��D I
,
��I J
rememberBrowser
��K Z
:
��Z [
false
��\ a
)
��a b
;
��b c
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
VerifyPhoneNumber
��( 9
(
��9 :
string
��: @
phoneNumber
��A L
)
��L M
{
�� 	
var
�� 
code
�� 
=
�� 
await
�� 
UserManager
�� (
.
��( )1
#GenerateChangePhoneNumberTokenAsync
��) L
(
��L M
User
��M Q
.
��Q R
Identity
��R Z
.
��Z [
	GetUserId
��[ d
(
��d e
)
��e f
,
��f g
phoneNumber
��h s
)
��s t
;
��t u
return
�� 
phoneNumber
�� 
==
�� !
null
��" &
?
��' (
View
��) -
(
��- .
$str
��. 5
)
��5 6
:
��7 8
View
��9 =
(
��= >
new
��> A(
VerifyPhoneNumberViewModel
��B \
{
��] ^
PhoneNumber
��_ j
=
��k l
phoneNumber
��m x
}
��y z
)
��z {
;
��{ |
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
VerifyPhoneNumber
��( 9
(
��9 :(
VerifyPhoneNumberViewModel
��: T
model
��U Z
)
��Z [
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
model
�� !
)
��! "
;
��" #
}
�� 
var
�� 
result
�� 
=
�� 
await
�� 
UserManager
�� *
.
��* +$
ChangePhoneNumberAsync
��+ A
(
��A B
User
��B F
.
��F G
Identity
��G O
.
��O P
	GetUserId
��P Y
(
��Y Z
)
��Z [
,
��[ \
model
��] b
.
��b c
PhoneNumber
��c n
,
��n o
model
��p u
.
��u v
Code
��v z
)
��z {
;
��{ |
if
�� 
(
�� 
result
�� 
.
�� 
	Succeeded
��  
)
��  !
{
�� 
var
�� 
user
�� 
=
�� 
await
��  
UserManager
��! ,
.
��, -
FindByIdAsync
��- :
(
��: ;
User
��; ?
.
��? @
Identity
��@ H
.
��H I
	GetUserId
��I R
(
��R S
)
��S T
)
��T U
;
��U V
if
�� 
(
�� 
user
�� 
!=
�� 
null
��  
)
��  !
{
�� 
await
�� 
SignInManager
�� '
.
��' (
SignInAsync
��( 3
(
��3 4
user
��4 8
,
��8 9
isPersistent
��: F
:
��F G
false
��H M
,
��M N
rememberBrowser
��O ^
:
��^ _
false
��` e
)
��e f
;
��f g
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
new
��1 4
{
��5 6
Message
��7 >
=
��? @
ManageMessageId
��A P
.
��P Q
AddPhoneSuccess
��Q `
}
��a b
)
��b c
;
��c d
}
�� 

ModelState
�� 
.
�� 
AddModelError
�� $
(
��$ %
$str
��% '
,
��' (
$str
��) A
)
��A B
;
��B C
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
RemovePhoneNumber
��( 9
(
��9 :
)
��: ;
{
�� 	
var
�� 
result
�� 
=
�� 
await
�� 
UserManager
�� *
.
��* +!
SetPhoneNumberAsync
��+ >
(
��> ?
User
��? C
.
��C D
Identity
��D L
.
��L M
	GetUserId
��M V
(
��V W
)
��W X
,
��X Y
null
��Z ^
)
��^ _
;
��_ `
if
�� 
(
�� 
!
�� 
result
�� 
.
�� 
	Succeeded
�� !
)
��! "
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
new
��1 4
{
��5 6
Message
��7 >
=
��? @
ManageMessageId
��A P
.
��P Q
Error
��Q V
}
��W X
)
��X Y
;
��Y Z
}
�� 
var
�� 
user
�� 
=
�� 
await
�� 
UserManager
�� (
.
��( )
FindByIdAsync
��) 6
(
��6 7
User
��7 ;
.
��; <
Identity
��< D
.
��D E
	GetUserId
��E N
(
��N O
)
��O P
)
��P Q
;
��Q R
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
await
�� 
SignInManager
�� #
.
��# $
SignInAsync
��$ /
(
��/ 0
user
��0 4
,
��4 5
isPersistent
��6 B
:
��B C
false
��D I
,
��I J
rememberBrowser
��K Z
:
��Z [
false
��\ a
)
��a b
;
��b c
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
new
��- 0
{
��1 2
Message
��3 :
=
��; <
ManageMessageId
��= L
.
��L M 
RemovePhoneSuccess
��M _
}
��` a
)
��a b
;
��b c
}
�� 	
public
�� 
ActionResult
�� 
ChangePassword
�� *
(
��* +
)
��+ ,
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
ChangePassword
��( 6
(
��6 7%
ChangePasswordViewModel
��7 N
model
��O T
)
��T U
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
model
�� !
)
��! "
;
��" #
}
�� 
var
�� 
result
�� 
=
�� 
await
�� 
UserManager
�� *
.
��* +!
ChangePasswordAsync
��+ >
(
��> ?
User
��? C
.
��C D
Identity
��D L
.
��L M
	GetUserId
��M V
(
��V W
)
��W X
,
��X Y
model
��Z _
.
��_ `
OldPassword
��` k
,
��k l
model
��m r
.
��r s
NewPassword
��s ~
)
��~ 
;�� �
if
�� 
(
�� 
result
�� 
.
�� 
	Succeeded
��  
)
��  !
{
�� 
var
�� 
user
�� 
=
�� 
await
��  
UserManager
��! ,
.
��, -
FindByIdAsync
��- :
(
��: ;
User
��; ?
.
��? @
Identity
��@ H
.
��H I
	GetUserId
��I R
(
��R S
)
��S T
)
��T U
;
��U V
if
�� 
(
�� 
user
�� 
!=
�� 
null
��  
)
��  !
{
�� 
await
�� 
SignInManager
�� '
.
��' (
SignInAsync
��( 3
(
��3 4
user
��4 8
,
��8 9
isPersistent
��: F
:
��F G
false
��H M
,
��M N
rememberBrowser
��O ^
:
��^ _
false
��` e
)
��e f
;
��f g
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
new
��1 4
{
��5 6
Message
��7 >
=
��? @
ManageMessageId
��A P
.
��P Q#
ChangePasswordSuccess
��Q f
}
��g h
)
��h i
;
��i j
}
�� 
	AddErrors
�� 
(
�� 
result
�� 
)
�� 
;
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
ActionResult
�� 
SetPassword
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
SetPassword
��( 3
(
��3 4"
SetPasswordViewModel
��4 H
model
��I N
)
��N O
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
var
�� 
result
�� 
=
�� 
await
�� "
UserManager
��# .
.
��. /
AddPasswordAsync
��/ ?
(
��? @
User
��@ D
.
��D E
Identity
��E M
.
��M N
	GetUserId
��N W
(
��W X
)
��X Y
,
��Y Z
model
��[ `
.
��` a
NewPassword
��a l
)
��l m
;
��m n
if
�� 
(
�� 
result
�� 
.
�� 
	Succeeded
�� $
)
��$ %
{
�� 
var
�� 
user
�� 
=
�� 
await
�� $
UserManager
��% 0
.
��0 1
FindByIdAsync
��1 >
(
��> ?
User
��? C
.
��C D
Identity
��D L
.
��L M
	GetUserId
��M V
(
��V W
)
��W X
)
��X Y
;
��Y Z
if
�� 
(
�� 
user
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
await
�� 
SignInManager
�� +
.
��+ ,
SignInAsync
��, 7
(
��7 8
user
��8 <
,
��< =
isPersistent
��> J
:
��J K
false
��L Q
,
��Q R
rememberBrowser
��S b
:
��b c
false
��d i
)
��i j
;
��j k
}
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 3
,
��3 4
new
��5 8
{
��9 :
Message
��; B
=
��C D
ManageMessageId
��E T
.
��T U 
SetPasswordSuccess
��U g
}
��h i
)
��i j
;
��j k
}
�� 
	AddErrors
�� 
(
�� 
result
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
ManageLogins
��( 4
(
��4 5
ManageMessageId
��5 D
?
��D E
message
��F M
)
��M N
{
�� 	
ViewBag
�� 
.
�� 
StatusMessage
�� !
=
��" #
message
�� 
==
�� 
ManageMessageId
�� *
.
��* + 
RemoveLoginSuccess
��+ =
?
��> ?
$str
��@ a
:
�� 
message
�� 
==
�� 
ManageMessageId
�� ,
.
��, -
Error
��- 2
?
��3 4
$str
��5 M
:
�� 
$str
�� 
;
�� 
var
�� 
user
�� 
=
�� 
await
�� 
UserManager
�� (
.
��( )
FindByIdAsync
��) 6
(
��6 7
User
��7 ;
.
��; <
Identity
��< D
.
��D E
	GetUserId
��E N
(
��N O
)
��O P
)
��P Q
;
��Q R
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
return
�� 
View
�� 
(
�� 
$str
�� #
)
��# $
;
��$ %
}
�� 
var
�� 

userLogins
�� 
=
�� 
await
�� "
UserManager
��# .
.
��. /
GetLoginsAsync
��/ =
(
��= >
User
��> B
.
��B C
Identity
��C K
.
��K L
	GetUserId
��L U
(
��U V
)
��V W
)
��W X
;
��X Y
var
�� 
otherLogins
�� 
=
�� #
AuthenticationManager
�� 3
.
��3 4,
GetExternalAuthenticationTypes
��4 R
(
��R S
)
��S T
.
��T U
Where
��U Z
(
��Z [
auth
��[ _
=>
��` b

userLogins
��c m
.
��m n
All
��n q
(
��q r
ul
��r t
=>
��u w
auth
��x |
.
��| }!
AuthenticationType��} �
!=��� �
ul��� �
.��� �
LoginProvider��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
ViewBag
�� 
.
�� 
ShowRemoveButton
�� $
=
��% &
user
��' +
.
��+ ,
PasswordHash
��, 8
!=
��9 ;
null
��< @
||
��A C

userLogins
��D N
.
��N O
Count
��O T
>
��U V
$num
��W X
;
��X Y
return
�� 
View
�� 
(
�� 
new
�� #
ManageLoginsViewModel
�� 1
{
�� 
CurrentLogins
�� 
=
�� 

userLogins
��  *
,
��* +
OtherLogins
�� 
=
�� 
otherLogins
�� )
}
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
ActionResult
�� 
	LinkLogin
�� %
(
��% &
string
��& ,
provider
��- 5
)
��5 6
{
�� 	
return
�� 
new
�� 
AccountController
�� (
.
��( )
ChallengeResult
��) 8
(
��8 9
provider
��9 A
,
��A B
Url
��C F
.
��F G
Action
��G M
(
��M N
$str
��N a
,
��a b
$str
��c k
)
��k l
,
��l m
User
��n r
.
��r s
Identity
��s {
.
��{ |
	GetUserId��| �
(��� �
)��� �
)��� �
;��� �
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
LinkLoginCallback
��( 9
(
��9 :
)
��: ;
{
�� 	
var
�� 
	loginInfo
�� 
=
�� 
await
�� !#
AuthenticationManager
��" 7
.
��7 8'
GetExternalLoginInfoAsync
��8 Q
(
��Q R
XsrfKey
��R Y
,
��Y Z
User
��[ _
.
��_ `
Identity
��` h
.
��h i
	GetUserId
��i r
(
��r s
)
��s t
)
��t u
;
��u v
if
�� 
(
�� 
	loginInfo
�� 
==
�� 
null
�� !
)
��! "
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 6
,
��6 7
new
��8 ;
{
��< =
Message
��> E
=
��F G
ManageMessageId
��H W
.
��W X
Error
��X ]
}
��^ _
)
��_ `
;
��` a
}
�� 
var
�� 
result
�� 
=
�� 
await
�� 
UserManager
�� *
.
��* +
AddLoginAsync
��+ 8
(
��8 9
User
��9 =
.
��= >
Identity
��> F
.
��F G
	GetUserId
��G P
(
��P Q
)
��Q R
,
��R S
	loginInfo
��T ]
.
��] ^
Login
��^ c
)
��c d
;
��d e
return
�� 
result
�� 
.
�� 
	Succeeded
�� #
?
��$ %
RedirectToAction
��& 6
(
��6 7
$str
��7 E
)
��E F
:
��G H
RedirectToAction
��I Y
(
��Y Z
$str
��Z h
,
��h i
new
��j m
{
��n o
Message
��p w
=
��x y
ManageMessageId��z �
.��� �
Error��� �
}��� �
)��� �
;��� �
}
�� 	
	protected
�� 
override
�� 
void
�� 
Dispose
��  '
(
��' (
bool
��( ,
	disposing
��- 6
)
��6 7
{
�� 	
if
�� 
(
�� 
	disposing
�� 
&&
�� 
_userManager
�� )
!=
��* ,
null
��- 1
)
��1 2
{
�� 
_userManager
�� 
.
�� 
Dispose
�� $
(
��$ %
)
��% &
;
��& '
_userManager
�� 
=
�� 
null
�� #
;
��# $
}
�� 
base
�� 
.
�� 
Dispose
�� 
(
�� 
	disposing
�� "
)
��" #
;
��# $
}
�� 	
private
�� 
const
�� 
string
�� 
XsrfKey
�� $
=
��% &
$str
��' /
;
��/ 0
private
�� $
IAuthenticationManager
�� &#
AuthenticationManager
��' <
{
�� 	
get
�� 
{
�� 
return
�� 
HttpContext
�� "
.
��" #
GetOwinContext
��# 1
(
��1 2
)
��2 3
.
��3 4
Authentication
��4 B
;
��B C
}
�� 
}
�� 	
private
�� 
void
�� 
	AddErrors
�� 
(
�� 
IdentityResult
�� -
result
��. 4
)
��4 5
{
�� 	
foreach
�� 
(
�� 
var
�� 
error
�� 
in
�� !
result
��" (
.
��( )
Errors
��) /
)
��/ 0
{
�� 

ModelState
�� 
.
�� 
AddModelError
�� (
(
��( )
$str
��) +
,
��+ ,
error
��- 2
)
��2 3
;
��3 4
}
�� 
}
�� 	
private
�� 
bool
�� 
HasPassword
��  
(
��  !
)
��! "
{
�� 	
var
�� 
user
�� 
=
�� 
UserManager
�� "
.
��" #
FindById
��# +
(
��+ ,
User
��, 0
.
��0 1
Identity
��1 9
.
��9 :
	GetUserId
��: C
(
��C D
)
��D E
)
��E F
;
��F G
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
user
�� 
.
�� 
PasswordHash
�� (
!=
��) +
null
��, 0
;
��0 1
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
bool
�� 
HasPhoneNumber
�� #
(
��# $
)
��$ %
{
�� 	
var
�� 
user
�� 
=
�� 
UserManager
�� "
.
��" #
FindById
��# +
(
��+ ,
User
��, 0
.
��0 1
Identity
��1 9
.
��9 :
	GetUserId
��: C
(
��C D
)
��D E
)
��E F
;
��F G
if
�� 
(
�� 
user
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
return
�� 
user
�� 
.
�� 
PhoneNumber
�� '
!=
��( *
null
��+ /
;
��/ 0
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
public
�� 
enum
�� 
ManageMessageId
�� #
{
�� 	
AddPhoneSuccess
�� 
,
�� #
ChangePasswordSuccess
�� !
,
��! "!
SetTwoFactorSuccess
�� 
,
��   
SetPasswordSuccess
�� 
,
��  
RemoveLoginSuccess
�� 
,
��  
RemovePhoneSuccess
�� 
,
�� 
Error
�� 
}
�� 	
}
�� 
}�� Œ
JE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\TestingController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
TestingController "
:# $
BaseController% 3
{ 
static 
char 
c1 
; 
public 
ActionResult 
EditTesting '
(' (
Guid( ,
?, -
id. 0
)0 1
{ 	
var 
campaignTesting 
=  !
db" $
.$ %
CampaignsTesting% 5
.5 6
FirstOrDefault6 D
(D E
cE F
=>G I
cJ K
.K L
IdL N
==O Q
idR T
)T U
;U V
if 
( 
campaignTesting 
==  "
null# '
)' (
{ 
throw 
new 
HttpException '
(' (
$num( +
,+ ,
$str- 8
)8 9
;9 :
} 

TinyMapper!! 
.!! 
Bind!! 
<!! 
CampaignTesting!! +
,!!+ ,
CampaignTestingVM!!- >
>!!> ?
(!!? @
config!!@ F
=>!!G I
{"" 
config## 
.## 
Ignore## 
(## 
x## 
=>##  "
x### $
.##$ %
ChannelTypes##% 1
)##1 2
;##2 3
}$$ 
)$$ 
;$$ 
var&& 
campaignTestingVm&& !
=&&" #

TinyMapper&&$ .
.&&. /
Map&&/ 2
<&&2 3
CampaignTestingVM&&3 D
>&&D E
(&&E F
campaignTesting&&F U
)&&U V
;&&V W
Campaign'' 
campaign'' 
='' 
db''  "
.''" #
	Campaigns''# ,
.(( 
Include(( 
((( 
x(( 
=>((  
x((! "
.((" #
Assets((# )
)(() *
.)) 
Include)) 
()) 
x)) 
=>))  
x))! "
.))" #
Segments))# +
)))+ ,
.** 
FirstOrDefault** "
(**" #
x**# $
=>**% '
x**( )
.**) *
Id*** ,
==**- /
campaignTesting**0 ?
.**? @

CampaignId**@ J
)**J K
;**K L
campaignTestingVm++ 
.++ 
OrderNumber++ )
=++* +
campaign++, 4
.++4 5
OrderNumber++5 @
;++@ A
if,, 
(,, 
campaign,, 
.,, 
Assets,, 
==,,  "
null,,# '
),,' (
{-- 
var.. 
assetId.. 
=.. 
Guid.. "
..." #
NewGuid..# *
(..* +
)..+ ,
;.., -
db// 
.// 
CampaignAssets// !
.//! "
Add//" %
(//% &
new//& )
CampaignAsset//* 7
(//7 8
)//8 9
{00 
Id11 
=11 
assetId11  
,11  !

CampaignId22 
=22  
campaign22! )
.22) *
Id22* ,
,22, -
	CreatedAt33 
=33 
DateTime33  (
.33( )
Now33) ,
}44 
)44 
;44 
campaign55 
.55 
AssetsId55 !
=55" #
assetId55$ +
;55+ ,
db66 
.66 
SaveChanges66 
(66 
)66  
;66  !
campaign77 
=77 
db77 
.77 
	Campaigns77 '
.88 
Include88 
(88 
x88 
=>88  
x88! "
.88" #
Assets88# )
)88) *
.99 
Include99 
(99 
x99 
=>99  
x99! "
.99" #
Segments99# +
)99+ ,
.:: 
FirstOrDefault:: "
(::" #
x::# $
=>::% '
x::( )
.::) *
Id::* ,
==::- /
campaignTesting::0 ?
.::? @

CampaignId::@ J
)::J K
;::K L
};; 
campaignTestingVm<< 
.<< 
Assets<< $
=<<% &
campaign<<' /
.<</ 0
Assets<<0 6
;<<6 7
c1== 
=== 
$char== 
;== 
foreach>> 
(>> 
var>> 
segment>>  
in>>! #
campaign>>$ ,
.>>, -
Segments>>- 5
.>>5 6
OrderBy>>6 =
(>>= >
x>>> ?
=>>>@ B
x>>C D
.>>D E
SegmentNumber>>E R
)>>R S
)>>S T
{?? 
var@@ 
	segmentVm@@ 
=@@ 

TinyMapper@@  *
.@@* +
Map@@+ .
<@@. /
CampaignSegmentVM@@/ @
>@@@ A
(@@A B
segment@@B I
)@@I J
;@@J K
campaignTestingVmAA !
.AA! "
SegmentsAA" *
.AA* +
AddAA+ .
(AA. /
	segmentVmAA/ 8
)AA8 9
;AA9 :
c1BB 
=BB 
segmentBB 
.BB 
SegmentNumberBB *
.BB* +
ReplaceBB+ 2
(BB2 3
campaignTestingVmBB3 D
.BBD E
OrderNumberBBE P
,BBP Q
stringBBR X
.BBX Y
EmptyBBY ^
)BB^ _
.BB_ `
ToCharArrayBB` k
(BBk l
)BBl m
.BBm n
SelectBBn t
(BBt u
xBBu v
=>BBw y
++BBz |
xBB| }
)BB} ~
.BB~ 
FirstOrDefault	BB �
(
BB� �
)
BB� �
;
BB� �
}CC 
campaignTestingVmDD 
.DD 
ChannelTypesDD *
=DD+ ,
stringDD- 3
.DD3 4
IsNullOrEmptyDD4 A
(DDA B
campaignTestingDDB Q
.DDQ R
ChannelTypesDDR ^
)DD^ _
?DD` a
newDDb e
ListDDf j
<DDj k
ChannelTypeDDk v
>DDv w
{DDx y
}DDz {
:DD| }
campaignTestingEE 
.EE  
ChannelTypesEE  ,
.FF 
SplitFF 
(FF 
$strFF 
.FF 
ToCharArrayFF *
(FF* +
)FF+ ,
)FF, -
.GG 
SelectGG 
(GG 
xGG 
=>GG  
(GG! "
ChannelTypeGG" -
)GG- .
SystemGG. 4
.GG4 5
EnumGG5 9
.GG9 :
ParseGG: ?
(GG? @
typeofGG@ F
(GGF G
ChannelTypeGGG R
)GGR S
,GGS T
xGGT U
)GGU V
)GGV W
.GGW X
ToListGGX ^
(GG^ _
)GG_ `
;GG` a
ViewBagHH 
.HH 
TestingUrgencyHH "
=HH# $
newHH% (

SelectListHH) 3
(HH3 4

EnumHelperHH4 >
.HH> ?
GetEnumTextValuesHH? P
(HHP Q
typeofHHQ W
(HHW X
TestingUrgencyHHX f
)HHf g
)HHg h
,HHh i
$strHHj q
,HHq r
$strII 
,II 
campaignTestingII '
.II' (
TestingUrgencyII( 6
)II6 7
;II7 8
returnKK 
ViewKK 
(KK 
campaignTestingVmKK )
)KK) *
;KK* +
}LL 	
publicNN 
ActionResultNN 

NewSegmentNN &
(NN& '
stringNN' -
OrderNumberNN. 9
)NN9 :
{OO 	
varQQ 
segmentQQ 
=QQ 
newQQ 
CampaignSegmentQQ -
(QQ- .
)QQ. /
{RR 
IdSS 
=SS 
GuidSS 
.SS 
NewGuidSS !
(SS! "
)SS" #
,SS# $
	CreatedAtTT 
=TT 
DateTimeTT $
.TT$ %
NowTT% (
,TT( )
SegmentNumberUU 
=UU 
OrderNumberUU  +
+UU, -
c1UU. 0
++UU0 2
}VV 
;VV 
returnWW 
PartialViewWW 
(WW 
$strWW J
,WWJ K
segmentWWL S
)WWS T
;WWT U
}XX 	
[[[ 	
HttpPost[[	 
][[ 
[\\ 	$
ValidateAntiForgeryToken\\	 !
]\\! "
[]] 	
MultipleButton]]	 
(]] 
Name]] 
=]] 
$str]] '
,]]' (
Argument]]) 1
=]]2 3
$str]]4 A
)]]A B
]]]B C
public^^ 
ActionResult^^ 
EditTesting^^ '
(^^' (
[^^( )
Bind^^) -
(^^- .
Include^^. 5
=^^6 7
$str	__ �
)`` 
]`` 
CampaignTestingVM``  
campaignTestingVm``! 2
)``2 3
{aa 	
ifbb 
(bb 

ModelStatebb 
.bb 
IsValidbb "
)bb" #
{cc 

TinyMapperee 
.ee 
Bindee 
<ee  
CampaignTestingVMee  1
,ee1 2
CampaignTestingee3 B
>eeB C
(eeC D
configeeD J
=>eeK M
{ff 
configgg 
.gg 
Ignoregg !
(gg! "
xgg" #
=>gg$ &
xgg' (
.gg( )
ChannelTypesgg) 5
)gg5 6
;gg6 7
confighh 
.hh 
Ignorehh !
(hh! "
xhh" #
=>hh$ &
xhh' (
.hh( )
Assetshh) /
)hh/ 0
;hh0 1
configii 
.ii 
Ignoreii !
(ii! "
xii" #
=>ii$ &
xii' (
.ii( )
Segmentsii) 1
)ii1 2
;ii2 3
}jj 
)jj 
;jj 
varkk 
campaignTestingkk #
=kk$ %

TinyMapperkk& 0
.kk0 1
Mapkk1 4
<kk4 5
CampaignTestingkk5 D
>kkD E
(kkE F
campaignTestingVmkkF W
)kkW X
;kkX Y
campaignTestingll 
.ll  
ChannelTypesll  ,
=ll- .
campaignTestingVmll/ @
.ll@ A
ChannelTypesllA M
==llN P
nullllQ U
?llV W
nullllX \
:ll] ^
stringmm 
.mm 
Joinmm 
(mm  
$strmm  #
,mm# $
campaignTestingVmmm% 6
.mm6 7
ChannelTypesmm7 C
)mmC D
;mmD E
dbnn 
.nn 
Entrynn 
(nn 
campaignTestingnn (
)nn( )
.nn) *
Statenn* /
=nn0 1
EntityStatenn2 =
.nn= >
Modifiednn> F
;nnF G
dboo 
.oo 
SaveChangesoo 
(oo 
)oo  
;oo  !
varrr 
campaignAssetsrr "
=rr# $
dbrr% '
.rr' (
CampaignAssetsrr( 6
.rr6 7
FirstOrDefaultrr7 E
(rrE F
xrrF G
=>rrH J
xrrK L
.rrL M

CampaignIdrrM W
==rrX Z
campaignTestingVmrr[ l
.rrl m

CampaignIdrrm w
)rrw x
;rrx y
campaignAssetsss 
.ss 
CreativeFilesss ,
=ss- .
campaignTestingVmss/ @
.ss@ A
AssetsssA G
.ssG H
CreativeFilesssH U
;ssU V
campaignAssetstt 
.tt 
CreativeUrltt *
=tt+ ,
campaignTestingVmtt- >
.tt> ?
Assetstt? E
.ttE F
CreativeUrlttF Q
;ttQ R
campaignAssetsuu 
.uu 
ZipCodeFileuu *
=uu+ ,
campaignTestingVmuu- >
.uu> ?
Assetsuu? E
.uuE F
ZipCodeFileuuF Q
;uuQ R
campaignAssetsvv 
.vv 

ZipCodeUrlvv )
=vv* +
campaignTestingVmvv, =
.vv= >
Assetsvv> D
.vvD E

ZipCodeUrlvvE O
;vvO P
campaignAssetsww 
.ww 
TestSeedFileww +
=ww, -
campaignTestingVmww. ?
.ww? @
Assetsww@ F
.wwF G
TestSeedFilewwG S
;wwS T
campaignAssetsxx 
.xx 
LiveSeedFilexx +
=xx, -
campaignTestingVmxx. ?
.xx? @
Assetsxx@ F
.xxF G
LiveSeedFilexxG S
;xxS T
dbyy 
.yy 
Entryyy 
(yy 
campaignAssetsyy '
)yy' (
.yy( )
Stateyy) .
=yy/ 0
EntityStateyy1 <
.yy< =
Modifiedyy= E
;yyE F
dbzz 
.zz 
SaveChangeszz 
(zz 
)zz  
;zz  !
if}} 
(}} 
campaignTestingVm}} $
.}}$ %
Segments}}% -
!=}}. 0
null}}1 5
)}}5 6
foreach~~ 
(~~ 
var~~ 
	segmentVm~~ &
in~~' )
campaignTestingVm~~* ;
.~~; <
Segments~~< D
)~~D E
{ 
var
�� 
segment
�� 
=
��  !
db
��" $
.
��$ %
CampaignSegments
��% 5
.
��5 6
FirstOrDefault
��6 D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
Id
��L N
==
��O Q
	segmentVm
��R [
.
��[ \
Id
��\ ^
)
��^ _
;
��_ `
if
�� 
(
�� 
segment
�� 
==
��  "
null
��# '
)
��' (
{
�� 
segment
�� 
=
��  !
new
��" %
CampaignSegment
��& 5
(
��5 6
)
��6 7
{
�� 
Id
�� 
=
��  
Guid
��! %
.
��% &
NewGuid
��& -
(
��- .
)
��. /
,
��/ 0
	CreatedAt
�� %
=
��& '
DateTime
��( 0
.
��0 1
Now
��1 4
,
��4 5

CampaignId
�� &
=
��' (
campaignTestingVm
��) :
.
��: ;

CampaignId
��; E
,
��E F
OrderNumber
�� '
=
��( )
campaignTestingVm
��* ;
.
��; <
OrderNumber
��< G
,
��G H
SegmentNumber
�� )
=
��* +
	segmentVm
��, 5
.
��5 6
SegmentNumber
��6 C
}
�� 
;
�� 
db
�� 
.
�� 
CampaignSegments
�� +
.
��+ ,
Add
��, /
(
��/ 0
segment
��0 7
)
��7 8
;
��8 9
db
�� 
.
�� 
SaveChanges
�� &
(
��& '
)
��' (
;
��( )
}
�� 
segment
�� 
.
�� 
SubjectLine
�� '
=
��( )
	segmentVm
��* 3
.
��3 4
SubjectLine
��4 ?
;
��? @
segment
�� 
.
�� 
FromLine
�� $
=
��% &
	segmentVm
��' 0
.
��0 1
FromLine
��1 9
;
��9 :
segment
�� 
.
�� 

WhiteLabel
�� &
=
��' (
	segmentVm
��) 2
.
��2 3

WhiteLabel
��3 =
;
��= >
segment
�� 
.
�� 
DataQuantity
�� (
=
��) *
	segmentVm
��+ 4
.
��4 5
DataQuantity
��5 A
;
��A B
segment
�� 
.
�� 
DeploymentDate
�� *
=
��+ ,
	segmentVm
��- 6
.
��6 7
DeploymentDate
��7 E
;
��E F
segment
�� 
.
�� 
CreativeFiles
�� )
=
��* +
	segmentVm
��, 5
.
��5 6
CreativeFiles
��6 C
;
��C D
segment
�� 
.
�� 
FirstRangeStart
�� +
=
��, -
	segmentVm
��. 7
.
��7 8
FirstRangeStart
��8 G
;
��G H
segment
�� 
.
�� 
FirstRangeEnd
�� )
=
��* +
	segmentVm
��, 5
.
��5 6
FirstRangeEnd
��6 C
;
��C D
segment
�� 
.
�� 
SecondRangeStart
�� ,
=
��- .
	segmentVm
��/ 8
.
��8 9
SecondRangeStart
��9 I
;
��I J
segment
�� 
.
�� 
SecondRangeEnd
�� *
=
��+ ,
	segmentVm
��- 6
.
��6 7
SecondRangeEnd
��7 E
;
��E F
segment
�� 
.
�� 
ThirdRangeStart
�� +
=
��, -
	segmentVm
��. 7
.
��7 8
ThirdRangeStart
��8 G
;
��G H
segment
�� 
.
�� 
ThirdRangeEnd
�� )
=
��* +
	segmentVm
��, 5
.
��5 6
ThirdRangeEnd
��6 C
;
��C D
db
�� 
.
�� 
Entry
�� 
(
�� 
segment
�� $
)
��$ %
.
��% &
State
��& +
=
��, -
EntityState
��. 9
.
��9 :
Modified
��: B
;
��B C
db
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& H
;
��H I
}
�� 
else
�� 
{
�� 
var
�� 
	errorList
�� 
=
�� 
(
��  !
from
��! %
item
��& *
in
��+ -

ModelState
��. 8
.
��8 9
Values
��9 ?
from
��! %
error
��& +
in
��, .
item
��/ 3
.
��3 4
Errors
��4 :
select
��! '
error
��( -
.
��- .
ErrorMessage
��. :
)
��: ;
.
��; <
ToList
��< B
(
��B C
)
��C D
;
��D E
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ D
+
��E F
string
��G M
.
��M N
Join
��N R
(
��R S
$str
��S Z
,
��Z [
	errorList
��\ e
)
��e f
;
��f g
}
�� 
ViewBag
�� 
.
�� 
TestingUrgency
�� "
=
��# $
new
��% (

SelectList
��) 3
(
��3 4

EnumHelper
��4 >
.
��> ?
GetEnumTextValues
��? P
(
��P Q
typeof
��Q W
(
��W X
TestingUrgency
��X f
)
��f g
)
��g h
,
��h i
$str
��j q
,
��q r
$str
�� 
,
�� 
campaignTestingVm
�� )
.
��) *
TestingUrgency
��* 8
)
��8 9
;
��9 :
return
�� 
View
�� 
(
�� 
$str
�� %
,
��% &
campaignTestingVm
��' 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
ActionResult
�� 
ApproveSegment
�� *
(
��* +
Guid
��+ /
?
��/ 0
Id
��1 3
)
��3 4
{
�� 	
try
�� 
{
�� 
var
�� 
segment
�� 
=
�� 
db
��  
.
��  !
CampaignSegments
��! 1
.
��1 2
FirstOrDefault
��2 @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Id
��H J
==
��K M
Id
��N P
)
��P Q
;
��Q R
segment
�� 
.
�� 
SegmentStatus
�� %
=
��& '
(
��( )
int
��) ,
)
��, -
SegmentStatus
��- :
.
��: ;
Approved
��; C
;
��C D
segment
�� 
.
�� 
DateApproved
�� $
=
��% &
DateTime
��' /
.
��/ 0
Now
��0 3
;
��3 4
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 =
)
��= >
]
��> ?
public
�� 
ActionResult
�� 
Approve
�� #
(
��# $
[
��$ %
Bind
��% )
(
��) *
Include
��* 1
=
��2 3
$str��4 �
)��� �
]��� �!
CampaignTestingVM��� �!
campaignTestingVm��� �
)��� �
{
�� 	
if
�� 
(
�� 

ModelState
�� 
.
�� 
IsValid
�� "
)
��" #
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 0
,
��0 1
$str
��2 8
,
��8 9
new
��: =
{
��> ?
id
��@ B
=
��C D
Session
��E L
[
��L M
$str
��M Q
]
��Q R
,
��R S
to
��T V
=
��W X
$str
��Y c
}
��d e
)
��e f
;
��f g
}
�� 
else
�� 
{
�� 
var
�� 
	errorList
�� 
=
�� 
(
��  !
from
��! %
item
��& *
in
��+ -

ModelState
��. 8
.
��8 9
Values
��9 ?
from
��! %
error
��& +
in
��, .
item
��/ 3
.
��3 4
Errors
��4 :
select
��! '
error
��( -
.
��- .
ErrorMessage
��. :
)
��: ;
.
��; <
ToList
��< B
(
��B C
)
��C D
;
��D E
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ D
+
��E F
string
��G M
.
��M N
Join
��N R
(
��R S
$str
��S Z
,
��Z [
	errorList
��\ e
)
��e f
;
��f g
}
�� 
ViewBag
�� 
.
�� 
TestingUrgency
�� "
=
��# $
new
��% (

SelectList
��) 3
(
��3 4

EnumHelper
��4 >
.
��> ?
GetEnumTextValues
��? P
(
��P Q
typeof
��Q W
(
��W X
TestingUrgency
��X f
)
��f g
)
��g h
,
��h i
$str
��j q
,
��q r
$str
�� 
,
�� 
campaignTestingVm
�� )
.
��) *
TestingUrgency
��* 8
)
��8 9
;
��9 :
return
�� 
View
�� 
(
�� 
$str
�� %
,
��% &
campaignTestingVm
��' 8
)
��8 9
;
��9 :
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 B
)
��B C
]
��C D
public
�� 
ActionResult
�� 
ProcessFiles
�� (
(
��( )
[
��) *
Bind
��* .
(
��. /
Include
��/ 6
=
��7 8
$str
��9 T
)
��T U
]
��U V
CampaignTestingVM
��W h
campaignTestingVm
��i z
)
��z {
{
�� 	
var
�� 
campaign
�� 
=
�� 
db
�� 
.
�� 
	Campaigns
�� '
.
��' (
FirstOrDefault
��( 6
(
��6 7
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Id
��> @
==
��A C
campaignTestingVm
��D U
.
��U V

CampaignId
��V `
)
��` a
;
��a b
BackgroundJob
�� 
.
�� 
Enqueue
�� !
(
��! "
(
��" #
)
��# $
=>
��% '
FileProcessor
��( 5
.
��5 6$
ProcessAssetUpdateUrls
��6 L
(
��L M

UploadPath
��M W
,
��W X
campaign
��Y a
.
��a b
OrderNumber
��b m
)
��m n
)
��n o
;
��o p
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" Q
;
��Q R
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 1
,
��1 2
new
��3 6
{
��7 8
id
��9 ;
=
��< =
campaignTestingVm
��> O
.
��O P
Id
��P R
}
��S T
)
��T U
;
��U V
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 K
)
��K L
]
��L M
public
�� 
ActionResult
�� #
FetchProcessDataFiles
�� 1
(
��1 2
[
��2 3
Bind
��3 7
(
��7 8
Include
��8 ?
=
��@ A
$str��B �
)��� �
]��� �!
CampaignTestingVM��� �!
campaignTestingVm��� �
)��� �
{
�� 	
try
�� 
{
�� 
var
�� 
campaign
�� 
=
�� 
db
�� !
.
��! "
	Campaigns
��" +
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Assets
��  &
)
��& '
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Segments
��  (
)
��( )
.
�� 
FirstOrDefault
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
Id
��' )
==
��* ,
campaignTestingVm
��- >
.
��> ?

CampaignId
��? I
)
��I J
;
��J K
if
�� 
(
�� 
campaign
�� 
.
�� 
Segments
�� $
.
��$ %
Count
��% *
==
��+ -
$num
��. /
)
��/ 0
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( E
)
��E F
;
��F G
BackgroundJob
�� 
.
�� 
Enqueue
�� %
(
��% &
(
��& '
)
��' (
=>
��) +
DataFileProcessor
��, =
.
��= >
FetchSQLDataFile
��> N
(
��N O

UploadPath
��O Y
,
��Y Z
campaign
��[ c
.
��c d
OrderNumber
��d o
,
��o p
campaign
��q y
.
��y z
Assets��z �
.��� �
ZipCodeFile��� �
,��� �!
campaignTestingVm��� �
.��� � 
DataFileQuantity��� �
)��� �
)��� �
;��� �
TempData
�� 
[
�� 
$str
�� "
]
��" #
=
��$ %
$str
��& i
;
��i j
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
ex
��$ &
.
��& '
Message
��' .
;
��. /
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 1
,
��1 2
new
��3 6
{
��7 8
id
��9 ;
=
��< =
campaignTestingVm
��> O
.
��O P
Id
��P R
}
��S T
)
��T U
;
��U V
}
�� 	
public
�� 
ActionResult
�� 
UpdateSegments
�� *
(
��* +
Guid
��+ /
?
��/ 0
Id
��1 3
,
��3 4
int
��5 8
oldValue
��9 A
,
��A B
int
��C F
newValue
��G O
)
��O P
{
�� 	
try
�� 
{
�� 
Campaign
�� 
campaign
�� !
=
��" #
db
��$ &
.
��& '
	Campaigns
��' 0
.
�� 
Include
�� 
(
�� 
x
�� 
=>
��  
x
��! "
.
��" #
Segments
��# +
)
��+ ,
.
�� 
FirstOrDefault
�� "
(
��" #
x
��# $
=>
��% '
x
��( )
.
��) *
Id
��* ,
==
��- /
Id
��0 2
)
��2 3
;
��3 4
var
�� 
lastSegment
�� 
=
��  !
campaign
��" *
.
��* +
Segments
��+ 3
.
��3 4
OrderBy
��4 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
SegmentNumber
��C P
)
��P Q
.
��Q R
LastOrDefault
��R _
(
��_ `
)
��` a
;
��a b
if
�� 
(
�� 
oldValue
�� 
+
�� 
$num
��  
==
��! #
newValue
��$ ,
)
��, -
{
�� 
char
�� 
c1
�� 
=
�� 
$char
�� !
;
��! "
if
�� 
(
�� 
lastSegment
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� 
c1
�� 
=
�� 
lastSegment
�� (
.
��( )
SegmentNumber
��) 6
.
��6 7
ToCharArray
��7 B
(
��B C
)
��C D
.
��D E
Last
��E I
(
��I J
)
��J K
;
��K L
c1
�� 
++
�� 
;
�� 
}
�� 
campaign
�� 
.
�� 
Segments
�� %
.
��% &
Add
��& )
(
��) *
new
��* -
CampaignSegment
��. =
(
��= >
)
��> ?
{
�� 
Id
�� 
=
�� 
Guid
�� !
.
��! "
NewGuid
��" )
(
��) *
)
��* +
,
��+ ,
	CreatedAt
�� !
=
��" #
DateTime
��$ ,
.
��, -
Now
��- 0
,
��0 1

CampaignId
�� "
=
��# $
campaign
��% -
.
��- .
Id
��. 0
,
��0 1
SegmentNumber
�� %
=
��& '
campaign
��( 0
.
��0 1
OrderNumber
��1 <
+
��= >
c1
��? A
,
��A B
FirstRangeStart
�� '
=
��( )
$num
��* +
,
��+ ,
FirstRangeEnd
�� %
=
��& '
$num
��( -
,
��- .
SecondRangeStart
�� (
=
��) *
$num
��+ ,
,
��, -
SecondRangeEnd
�� &
=
��' (
$num
��) *
,
��* +
ThirdRangeStart
�� '
=
��( )
$num
��* +
,
��+ ,
ThirdRangeEnd
�� %
=
��& '
$num
��( )
}
�� 
)
�� 
;
�� 
db
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
else
�� 
if
�� 
(
�� 
oldValue
�� !
-
��" #
$num
��$ %
==
��& (
newValue
��) 1
)
��1 2
{
�� 
if
�� 
(
�� 
lastSegment
�� #
==
��$ &
null
��' +
)
��+ ,
{
�� 
throw
�� 
new
�� !
	Exception
��" +
(
��+ ,
$str
��, >
)
��> ?
;
��? @
}
�� 
db
�� 
.
�� 
CampaignSegments
�� '
.
��' (
Remove
��( .
(
��. /
lastSegment
��/ :
)
��: ;
;
��; <
campaign
�� 
.
�� 
Segments
�� %
.
��% &
Remove
��& ,
(
��, -
lastSegment
��- 8
)
��8 9
;
��9 :
db
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
else
�� 
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( H
)
��H I
;
��I J
}
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
,
��B C!
JsonRequestBehavior
��D W
.
��W X
AllowGet
��X `
)
��` a
;
��a b
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
,
��^ _!
JsonRequestBehavior
��` s
.
��s t
AllowGet
��t |
)
��| }
;
��} ~
}
�� 
}
�� 	
}
�� 
}�� ҅
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\TrackingController.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
TrackingController #
:$ %
BaseController& 4
{ 
int 
pageSize 
= 
$num 
; 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
ViewBag 
. 
CurrentSort 
=  !
sc" $
.$ %
	sortOrder% .
;. /
ViewBag 
.  
CampaignNameSortParm (
=) *
sc+ -
.- .
	sortOrder. 7
==8 :
$str; I
?J K
$strL _
:` a
$strb p
;p q
ViewBag 
. !
BroadcastDateSortParm )
=* +
sc, .
.. /
	sortOrder/ 8
==9 ;
$str< K
?L M
$strN b
:c d
$stre t
;t u
ViewBag 
. 
CreatedBySortParm %
=& '
sc( *
.* +
	sortOrder+ 4
==5 7
$str8 C
?D E
$strF V
:W X
$strY d
;d e
ViewBag   
.   
StatusSortParm   "
=  # $
sc  % '
.  ' (
	sortOrder  ( 1
==  2 4
$str  5 =
?  > ?
$str  @ M
:  N O
$str  P X
;  X Y
ViewBag!! 
.!! 
OrderNumberSortParm!! '
=!!( )
sc!!* ,
.!!, -
	sortOrder!!- 6
==!!7 9
$str!!: G
?!!H I
$str!!J \
:!!] ^
$str!!_ l
;!!l m
var## 
	campagins## 
=## 
db## 
.## 
	Campaigns## (
.$$ 
Include$$ 
($$ 
x$$ 
=>$$ 
x$$ 
.$$  
ProDatas$$  (
)$$( )
.%% 
Include%% 
(%% 
x%% 
=>%% 
x%% 
.%%  
Testing%%  '
)%%' (
.&& 
Include&& 
(&& 
x&& 
=>&& 
x&& 
.&&  
Approved&&  (
)&&( )
.'' 
OrderByDescending'' "
(''" #
x''# $
=>''% '
x''( )
.'') *
	CreatedAt''* 3
)''3 4
.(( 
Where(( 
((( 
x(( 
=>(( 
x(( 
.(( 
Status(( $
==((% '
(((( )
int(() ,
)((, -
CampaignStatus((- ;
.((; <
	Completed((< E
)((E F
.)) 
ToList)) 
()) 
))) 
;)) 
switch++ 
(++ 
sc++ 
.++ 
	sortOrder++  
)++  !
{,, 
case-- 
$str-- #
:--# $
	campagins.. 
=.. 
	campagins..  )
...) *
OrderBy..* 1
(..1 2
s..2 3
=>..4 6
s..7 8
...8 9
CampaignName..9 E
)..E F
...F G
ToList..G M
(..M N
)..N O
;..O P
break// 
;// 
case00 
$str00 (
:00( )
	campagins11 
=11 
	campagins11  )
.11) *
OrderByDescending11* ;
(11; <
s11< =
=>11> @
s11A B
.11B C
CampaignName11C O
)11O P
.11P Q
ToList11Q W
(11W X
)11X Y
;11Y Z
break22 
;22 
case33 
$str33 $
:33$ %
	campagins44 
=44 
	campagins44  )
.44) *
OrderBy44* 1
(441 2
s442 3
=>444 6
s447 8
.448 9
BroadcastDate449 F
)44F G
.44G H
ToList44H N
(44N O
)44O P
;44P Q
break55 
;55 
case66 
$str66 )
:66) *
	campagins77 
=77 
	campagins77  )
.77) *
OrderByDescending77* ;
(77; <
s77< =
=>77> @
s77A B
.77B C
BroadcastDate77C P
)77P Q
.77Q R
ToList77R X
(77X Y
)77Y Z
;77Z [
break88 
;88 
case99 
$str99  
:99  !
	campagins:: 
=:: 
	campagins::  )
.::) *
OrderBy::* 1
(::1 2
s::2 3
=>::4 6
s::7 8
.::8 9
	CreatedBy::9 B
)::B C
.::C D
ToList::D J
(::J K
)::K L
;::L M
break;; 
;;; 
case<< 
$str<< %
:<<% &
	campagins== 
=== 
	campagins==  )
.==) *
OrderByDescending==* ;
(==; <
s==< =
=>==> @
s==A B
.==B C
	CreatedBy==C L
)==L M
.==M N
ToList==N T
(==T U
)==U V
;==V W
break>> 
;>> 
case?? 
$str?? 
:?? 
	campagins@@ 
=@@ 
	campagins@@  )
.@@) *
OrderBy@@* 1
(@@1 2
s@@2 3
=>@@4 6
s@@7 8
.@@8 9
Status@@9 ?
)@@? @
.@@@ A
ToList@@A G
(@@G H
)@@H I
;@@I J
breakAA 
;AA 
caseBB 
$strBB "
:BB" #
	campaginsCC 
=CC 
	campaginsCC  )
.CC) *
OrderByDescendingCC* ;
(CC; <
sCC< =
=>CC> @
sCCA B
.CCB C
StatusCCC I
)CCI J
.CCJ K
ToListCCK Q
(CCQ R
)CCR S
;CCS T
breakDD 
;DD 
caseEE 
$strEE "
:EE" #
	campaginsFF 
=FF 
	campaginsFF  )
.FF) *
OrderByFF* 1
(FF1 2
sFF2 3
=>FF4 6
sFF7 8
.FF8 9
OrderNumberFF9 D
)FFD E
.FFE F
ToListFFF L
(FFL M
)FFM N
;FFN O
breakGG 
;GG 
caseHH 
$strHH '
:HH' (
	campaginsII 
=II 
	campaginsII  )
.II) *
OrderByDescendingII* ;
(II; <
sII< =
=>II> @
sIIA B
.IIB C
OrderNumberIIC N
)IIN O
.IIO P
ToListIIP V
(IIV W
)IIW X
;IIX Y
breakJJ 
;JJ 
defaultKK 
:KK 
	campaginsLL 
=LL 
	campaginsLL  )
.LL) *
OrderByDescendingLL* ;
(LL; <
sLL< =
=>LL> @
sLLA B
.LLB C
	CreatedAtLLC L
)LLL M
.LLM N
ToListLLN T
(LLT U
)LLU V
;LLV W
breakMM 
;MM 
}NN 
ViewBagPP 
.PP 

SearchTypePP 
=PP  
scPP! #
.PP# $

searchTypePP$ .
;PP. /
ifQQ 
(QQ 
scQQ 
.QQ 

searchTypeQQ 
==QQ  
$strQQ! (
)QQ( )
{RR 
ifSS 
(SS 
!SS 
stringSS 
.SS 
IsNullOrEmptySS )
(SS) *
scSS* ,
.SS, -
basicStringSS- 8
)SS8 9
)SS9 :
{TT 
	campaginsUU 
=UU 
	campaginsUU  )
.UU) *
WhereUU* /
(UU/ 0
sUU0 1
=>UU2 4
sVV 
.VV 
OrderNumberVV !
.VV! "
EqualsVV" (
(VV( )
scVV) +
.VV+ ,
basicStringVV, 7
)VV7 8
||VV9 ;
sWW 
.WW $
ReBroadcastedOrderNumberWW .
==WW/ 1
scWW2 4
.WW4 5
basicStringWW5 @
||WWA C
sXX 
.XX 
CampaignNameXX "
.XX" #
IndexOfXX# *
(XX* +
scXX+ -
.XX- .
basicStringXX. 9
,XX9 :
StringComparisonXX; K
.XXK L&
InvariantCultureIgnoreCaseXXL f
)XXf g
>=XXh j
$numXXk l
)XXl m
.XXm n
ToListXXn t
(XXt u
)XXu v
;XXv w
ViewBagYY 
.YY 
BasicStringSearchedYY /
=YY0 1
scYY2 4
.YY4 5
basicStringYY5 @
;YY@ A
}ZZ 
else[[ 
if[[ 
([[ 
![[ 
string[[  
.[[  !
IsNullOrEmpty[[! .
([[. /
sc[[/ 1
.[[1 2
basicStatus[[2 =
)[[= >
)[[> ?
{\\ 
int]] 
status]] 
=]]  
int]]! $
.]]$ %
Parse]]% *
(]]* +
sc]]+ -
.]]- .
basicStatus]]. 9
)]]9 :
;]]: ;
if^^ 
(^^ 
status^^ 
==^^ !
(^^" #
int^^# &
)^^& '
CampaignStatus^^' 5
.^^5 6
Rebroadcasted^^6 C
)^^C D
	campagins__ !
=__" #
	campagins__$ -
.__- .
Where__. 3
(__3 4
s__4 5
=>__6 8
s__9 :
.__: ;
ReBroadcasted__; H
)__H I
.__I J
ToList__J P
(__P Q
)__Q R
;__R S
else`` 
if`` 
(`` 
status`` #
==``$ &
(``' (
int``( +
)``+ ,
CampaignStatus``, :
.``: ;
NotRebroadcasted``; K
)``K L
	campaginsaa !
=aa" #
	campaginsaa$ -
.aa- .
Whereaa. 3
(aa3 4
saa4 5
=>aa6 8
saa9 :
.aa: ;
ReBroadCastaa; F
&&aaG I
!aaJ K
saaK L
.aaL M
ReBroadcastedaaM Z
)aaZ [
.aa[ \
ToListaa\ b
(aab c
)aac d
;aad e
elsebb 
	campaginscc !
=cc" #
	campaginscc$ -
.cc- .
Wherecc. 3
(cc3 4
scc4 5
=>cc6 8
scc9 :
.cc: ;
Statuscc; A
==ccB D
statusccE K
)ccK L
.ccL M
ToListccM S
(ccS T
)ccT U
;ccU V
ViewBagdd 
.dd 
BasicStatusSearcheddd /
=dd0 1
scdd2 4
.dd4 5
basicStatusdd5 @
;dd@ A
}ee 
elseff 
ifff 
(ff 
!ff 
stringff  
.ff  !
IsNullOrEmptyff! .
(ff. /
scff/ 1
.ff1 2
basicOrderNumberff2 B
)ffB C
)ffC D
{gg 
	campaginshh 
=hh 
	campaginshh  )
.hh) *
Wherehh* /
(hh/ 0
shh0 1
=>hh2 4
shh5 6
.hh6 7
Idhh7 9
.hh9 :
ToStringhh: B
(hhB C
)hhC D
.hhD E
EqualshhE K
(hhK L
schhL N
.hhN O
basicOrderNumberhhO _
)hh_ `
)hh` a
.hha b
ToListhhb h
(hhh i
)hhi j
;hhj k
}ii 
}kk 
elsell 
ifll 
(ll 
scll 
.ll 

searchTypell "
==ll# %
$strll& 0
)ll0 1
{mm 
ifnn 
(nn 
!nn 
stringnn 
.nn 
IsNullOrEmptynn )
(nn) *
scnn* ,
.nn, -
advancedStatusnn- ;
)nn; <
)nn< =
{oo 
intpp 
statuspp 
=pp  
intpp! $
.pp$ %
Parsepp% *
(pp* +
scpp+ -
.pp- .
advancedStatuspp. <
)pp< =
;pp= >
ifqq 
(qq 
statusqq 
==qq !
(qq" #
intqq# &
)qq& '
CampaignStatusqq' 5
.qq5 6
Rebroadcastedqq6 C
)qqC D
	campaginsrr !
=rr" #
	campaginsrr$ -
.rr- .
Whererr. 3
(rr3 4
srr4 5
=>rr6 8
srr9 :
.rr: ;
OrderNumberrr; F
.rrF G
EndsWithrrG O
(rrO P
$strrrP U
)rrU V
)rrV W
.rrW X
ToListrrX ^
(rr^ _
)rr_ `
;rr` a
elsess 
	campaginstt !
=tt" #
	campaginstt$ -
.tt- .
Wherett. 3
(tt3 4
stt4 5
=>tt6 8
stt9 :
.tt: ;
Statustt; A
==ttB D
statusttE K
)ttK L
.ttL M
ToListttM S
(ttS T
)ttT U
;ttU V
ViewBaguu 
.uu "
AdvancedStatusSearcheduu 2
=uu3 4
scuu5 7
.uu7 8
advancedStatusuu8 F
;uuF G
}vv 
ifww 
(ww 
!ww 
stringww 
.ww 
IsNullOrEmptyww )
(ww) *
scww* ,
.ww, -
advancedUserww- 9
)ww9 :
)ww: ;
{xx 
	campaginsyy 
=yy 
	campaginsyy  )
.yy) *
Whereyy* /
(yy/ 0
syy0 1
=>yy2 4
syy5 6
.yy6 7
	CreatedByyy7 @
==yyA C
scyyD F
.yyF G
advancedUseryyG S
)yyS T
.yyT U
ToListyyU [
(yy[ \
)yy\ ]
;yy] ^
ViewBagzz 
.zz  
AdvancedUserSearchedzz 0
=zz1 2
sczz3 5
.zz5 6
advancedUserzz6 B
;zzB C
}{{ 
if}} 
(}} 
!}} 
string}} 
.}} 
IsNullOrEmpty}} )
(}}) *
sc}}* ,
.}}, -
campaignName}}- 9
)}}9 :
)}}: ;
{~~ 
sc 
. 
campaignName #
=$ %
sc& (
.( )
campaignName) 5
.5 6
ToLowerInvariant6 F
(F G
)G H
;H I
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
CampaignName
��7 C
.
��C D
IndexOf
��D K
(
��K L
sc
��L N
.
��N O
campaignName
��O [
,
��[ \
StringComparison
��] m
.
��m n'
CurrentCultureIgnoreCase��n �
)��� �
>=��� �
$num��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
ViewBag
�� 
.
�� 
CampaignName
�� (
=
��) *
sc
��+ -
.
��- .
campaignName
��. :
;
��: ;
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
isTested
��- 5
)
��5 6
)
��6 7
{
�� 
bool
�� 
IsTested
�� !
=
��" #
Boolean
��$ +
.
��+ ,
Parse
��, 1
(
��1 2
sc
��2 4
.
��4 5
isTested
��5 =
)
��= >
;
��> ?
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
Testing
��7 >
!=
��? A
null
��B F
&&
��2 4
s
��5 6
.
��6 7
Testing
��7 >
?
��> ?
.
��? @
IsTested
��@ H
==
��I K
IsTested
��L T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
IsTested
�� $
=
��% &
sc
��' )
.
��) *
isTested
��* 2
;
��2 3
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
orderedFrom
��- 8
)
��8 9
)
��9 :
{
�� 
DateTime
�� 
dateFrom
�� %
=
��& '
DateTime
��( 0
.
��0 1

ParseExact
��1 ;
(
��; <
sc
��< >
.
��> ?
orderedFrom
��? J
,
��J K
$str
��L X
,
��X Y
CultureInfo
��Z e
.
��e f
InvariantCulture
��f v
)
��v w
;
��w x
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedAt
��7 @
.
��@ A
Date
��A E
>=
��F H
dateFrom
��I Q
.
��Q R
Date
��R V
)
��V W
.
��W X
ToList
��X ^
(
��^ _
)
��_ `
;
��` a
ViewBag
�� 
.
�� 
OrderedFrom
�� '
=
��( )
sc
��* ,
.
��, -
orderedFrom
��- 8
;
��8 9
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
	orderedTo
��- 6
)
��6 7
)
��7 8
{
�� 
DateTime
�� 
dateTo
�� #
=
��$ %
DateTime
��& .
.
��. /

ParseExact
��/ 9
(
��9 :
sc
��: <
.
��< =
	orderedTo
��= F
,
��F G
$str
��H T
,
��T U
CultureInfo
��V a
.
��a b
InvariantCulture
��b r
)
��r s
;
��s t
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
	CreatedAt
��7 @
.
��@ A
Date
��A E
<=
��F H
dateTo
��I O
.
��O P
Date
��P T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
	OrderedTo
�� %
=
��& '
sc
��( *
.
��* +
	orderedTo
��+ 4
;
��4 5
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
broadcastFrom
��- :
)
��: ;
)
��; <
{
�� 
DateTime
�� 
dateFrom
�� %
=
��& '
DateTime
��( 0
.
��0 1

ParseExact
��1 ;
(
��; <
sc
��< >
.
��> ?
broadcastFrom
��? L
,
��L M
$str
��N Z
,
��Z [
CultureInfo
��\ g
.
��g h
InvariantCulture
��h x
)
��x y
;
��y z
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
BroadcastDate
��7 D
?
��D E
.
��E F
Date
��F J
>=
��K M
dateFrom
��N V
.
��V W
Date
��W [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
;
��e f
ViewBag
�� 
.
�� 
BroadcastFrom
�� )
=
��* +
sc
��, .
.
��. /
broadcastFrom
��/ <
;
��< =
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
sc
��* ,
.
��, -
broadcastTo
��- 8
)
��8 9
)
��9 :
{
�� 
DateTime
�� 
dateTo
�� #
=
��$ %
DateTime
��& .
.
��. /

ParseExact
��/ 9
(
��9 :
sc
��: <
.
��< =
broadcastTo
��= H
,
��H I
$str
��J V
,
��V W
CultureInfo
��X c
.
��c d
InvariantCulture
��d t
)
��t u
;
��u v
	campagins
�� 
=
�� 
	campagins
��  )
.
��) *
Where
��* /
(
��/ 0
s
��0 1
=>
��2 4
s
��5 6
.
��6 7
BroadcastDate
��7 D
?
��D E
.
��E F
Date
��F J
<=
��K M
dateTo
��N T
.
��T U
Date
��U Y
)
��Y Z
.
��Z [
ToList
��[ a
(
��a b
)
��b c
;
��c d
ViewBag
�� 
.
�� 
BroadcastTo
�� '
=
��( )
sc
��* ,
.
��, -
broadcastTo
��- 8
;
��8 9
}
�� 
}
�� 
if
�� 
(
�� 
LoggedInUser
�� 
!=
�� 
null
��  $
&&
��% '
!
��( )
IsAdmin
��) 0
)
��0 1
{
�� 
	campagins
�� 
=
�� 
	campagins
�� %
.
��% &
Where
��& +
(
��+ ,
s
��, -
=>
��. 0
s
��1 2
.
��2 3
	CreatedBy
��3 <
==
��= ?
LoggedInUser
��@ L
.
��L M
UserName
��M U
)
��U V
.
��V W
ToList
��W ]
(
��] ^
)
��^ _
;
��_ `
}
�� 
ViewBag
�� 
.
�� 
BasicOrderNumber
�� $
=
��% &
OrderNumberList
��' 6
;
��6 7
ViewBag
�� 
.
�� 
BasicStatus
�� 
=
��  !

StatusList
��" ,
;
��, -
ViewBag
�� 
.
�� 
AdvancedStatus
�� "
=
��# $

StatusList
��% /
;
��/ 0
ViewBag
�� 
.
�� 
AdvancedUser
��  
=
��! "
	UsersList
��# ,
;
��, -
var
�� 
	reportVms
�� 
=
�� 
new
�� 
List
��  $
<
��$ %
CampaignReportVM
��% 5
>
��5 6
(
��6 7
)
��7 8
;
��8 9
foreach
�� 
(
�� 
var
�� 
campaign
�� !
in
��" $
	campagins
��% .
)
��. /
{
�� 
long
�� 
clicked
�� 
=
�� 
$num
��  
,
��  !
opened
��" (
=
��) *
$num
��+ ,
;
��, -
DateTime
�� 
startDateTime
�� &
=
��' (
DateTime
��) 1
.
��1 2
MinValue
��2 :
;
��: ;
string
�� 
IONumber
�� 
=
��  !
$str
��" &
;
��& '
if
�� 
(
�� 
campaign
�� 
.
�� 
ProDatas
�� %
.
��% &
Count
��& +
>
��, -
$num
��. /
)
��/ 0
{
�� 
clicked
�� 
=
�� 
campaign
�� &
.
��& '
ProDatas
��' /
.
��/ 0
Sum
��0 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;

ClickCount
��; E
)
��E F
;
��F G
startDateTime
�� !
=
��" #
DateTime
��$ ,
.
��, -
Parse
��- 2
(
��2 3
campaign
��3 ;
.
��; <
ProDatas
��< D
.
��D E
FirstOrDefault
��E S
(
��S T
)
��T U
.
��U V
CampaignStartDate
��V g
)
��g h
;
��h i
IONumber
�� 
=
�� 
campaign
�� '
.
��' (
ProDatas
��( 0
.
��0 1
FirstOrDefault
��1 ?
(
��? @
)
��@ A
.
��A B
IO
��B D
;
��D E
opened
�� 
=
�� 
campaign
�� %
.
��% &
Approved
��& .
.
��. /!
IsUseApiDataForOpen
��/ B
?
��C D
campaign
��E M
.
��M N
ProDatas
��N V
.
��V W
FirstOrDefault
��W e
(
��e f
)
��f g
.
��g h
ImpressionCnt
��h u
:
��v w
ADS
��x {
.
��{ |
API
��| 
.�� �
Models��� �
.��� �
Campaign��� �
.��� �
GetOpens��� �
(��� �
campaign��� �
.��� �
Approved��� �
.��� �
Quantity��� �
,��� �
startDateTime��� �
)��� �
;��� �
}
�� 
var
�� 
model
�� 
=
�� 
new
�� 
CampaignReportVM
��  0
(
��0 1
)
��1 2
{
�� 
Id
�� 
=
�� 
campaign
�� !
.
��! "
Id
��" $
.
��$ %
ToString
��% -
(
��- .
)
��. /
,
��/ 0
OrderNumber
�� 
=
��  !
campaign
��" *
.
��* +
OrderNumber
��+ 6
,
��6 7
CampaignName
��  
=
��! "
campaign
��# +
.
��+ ,
CampaignName
��, 8
,
��8 9
	OrderDate
�� 
=
�� 
campaign
��  (
.
��( )
	CreatedAt
��) 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
,
��= >
Status
�� 
=
�� 
(
�� 
(
�� 
CampaignStatus
�� -
)
��- .
campaign
��/ 7
.
��7 8
Status
��8 >
)
��> ?
.
��? @
ToString
��@ H
(
��H I
)
��I J
,
��J K

WhiteLabel
�� 
=
��  
campaign
��! )
.
��) *

WhiteLabel
��* 4
,
��4 5
Quantity
�� 
=
�� 
campaign
�� '
.
��' (
Approved
��( 0
?
��0 1
.
��1 2
Quantity
��2 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
,
��E F
Clicked
�� 
=
�� 
clicked
�� %
==
��& (
$num
��) *
?
��+ ,
$str
��- 1
:
��2 3
clicked
��4 ;
.
��; <
ToString
��< D
(
��D E
)
��E F
,
��F G
Opened
�� 
=
�� 
opened
�� #
==
��$ &
$num
��' (
?
��) *
$str
��+ /
:
��0 1
opened
��2 8
.
��8 9
ToString
��9 A
(
��A B
)
��B C
,
��C D
IONumber
�� 
=
�� 
IONumber
�� '
,
��' (
	StartDate
�� 
=
�� 
startDateTime
��  -
==
��. 0
DateTime
��1 9
.
��9 :
MinValue
��: B
?
��C D
$str
��E I
:
��J K
startDateTime
��L Y
.
��Y Z
ToString
��Z b
(
��b c
)
��c d
,
��d e

EmailsSent
�� 
=
��  
campaign
��! )
.
��) *
Approved
��* 2
?
��2 3
.
��3 4
Quantity
��4 <
.
��< =
ToString
��= E
(
��E F
)
��F G
,
��G H
OpenedPercentage
�� $
=
��% &
campaign
��  
.
��  !
Approved
��! )
?
��) *
.
��* +
Quantity
��+ 3
==
��4 6
$num
��7 8
?
�� 
$str
�� "
:
�� 
(
�� 
(
��  
double
��  &
)
��& '
opened
��( .
/
��. /
campaign
��/ 7
.
��7 8
Approved
��8 @
?
��@ A
.
��A B
Quantity
��B J
)
��J K
?
��K L
.
��L M
ToString
��M U
(
��U V
$str
��V ]
)
��] ^
,
��^ _
ClickedPercentage
�� %
=
��& '
campaign
��  
.
��  !
Approved
��! )
?
��) *
.
��* +
Quantity
��+ 3
==
��4 6
$num
��7 8
?
�� 
$str
�� "
:
�� 
(
�� 
(
��  
double
��  &
)
��& '
clicked
��( /
/
��/ 0
campaign
��0 8
.
��8 9
Approved
��9 A
?
��A B
.
��B C
Quantity
��C K
)
��K L
?
��L M
.
��M N
ToString
��N V
(
��V W
$str
��W ^
)
��^ _
,
��_ `
CTRPercentage
�� !
=
��" #
opened
��$ *
==
��+ -
$num
��. /
?
��0 1
$str
��2 6
:
��7 8
(
��9 :
(
��: ;
double
��; A
)
��A B
clicked
��C J
/
��J K
opened
��K Q
)
��Q R
.
��R S
ToString
��S [
(
��[ \
$str
��\ c
)
��c d
,
��d e
}
�� 
;
�� 
model
�� 
.
�� 
PerLink
�� 
=
�� 
new
��  #
List
��$ (
<
��( )$
CampaignReportDetailVM
��) ?
>
��? @
(
��@ A
)
��A B
;
��B C
foreach
�� 
(
�� 
var
�� 
proData
�� $
in
��% '
campaign
��( 0
.
��0 1
ProDatas
��1 9
.
��9 :
OrderBy
��: A
(
��A B
x
��B C
=>
��D F
ProDataHelper
��G T
.
��T U
GetIndex
��U ]
(
��] ^
x
��^ _
.
��_ `
Reportsite_URL
��` n
)
��n o
)
��o p
)
��p q
{
�� 
model
�� 
.
�� 
PerLink
�� !
.
��! "
Add
��" %
(
��% &
new
��& )$
CampaignReportDetailVM
��* @
(
��@ A
)
��A B
{
�� 
IONumber
��  
=
��! "
proData
��# *
.
��* +
IO
��+ -
,
��- .
Link
�� 
=
�� 
proData
�� &
.
��& '
Destination_URL
��' 6
,
��6 7

ClickCount
�� "
=
��# $
proData
��% ,
.
��, -

ClickCount
��- 7
.
��7 8
ToString
��8 @
(
��@ A
)
��A B
}
�� 
)
�� 
;
�� 
}
�� 
	reportVms
�� 
.
�� 
Add
�� 
(
�� 
model
�� #
)
��# $
;
��$ %
}
�� 
ViewBag
�� 
.
�� 
Status
�� 
=
�� 

StatusList
�� '
;
��' (
ViewBag
�� 
.
�� 
SearchStatus
��  
=
��! "

StatusList
��# -
;
��- .
int
�� 

pageNumber
�� 
=
�� 
(
�� 
sc
��  
.
��  !
page
��! %
??
��& (
$num
��) *
)
��* +
;
��+ ,
return
�� 
View
�� 
(
�� 
	reportVms
�� !
.
��! "
ToPagedList
��" -
(
��- .

pageNumber
��. 8
,
��8 9
pageSize
��: B
)
��B C
)
��C D
;
��D E
}
�� 	
public
�� 
ActionResult
�� 

ViewReport
�� &
(
��& '
Guid
��' +
?
��+ ,
id
��- /
)
��/ 0
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Assets
��  &
)
��& '
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Segments
��  (
)
��( )
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
ProDatas
��  (
)
��( )
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Testing
��  '
)
��' (
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Approved
��  (
)
��( )
.
�� 
FirstOrDefault
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
Id
��' )
==
��* ,
id
��- /
)
��/ 0
;
��0 1
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� !
==
��" $
null
��% )
)
��) *
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ `
;
��` a
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
long
�� 
clicked
�� 
=
�� 
$num
�� 
,
�� 
opened
�� $
=
��% &
$num
��' (
;
��( )
DateTime
�� 
startDateTime
�� "
=
��# $
DateTime
��% -
.
��- .
MinValue
��. 6
;
��6 7
string
�� 
IONumber
�� 
=
�� 
$str
�� "
;
��" #
if
�� 
(
�� 
campaign
�� 
.
�� 
ProDatas
�� !
.
��! "
Count
��" '
>
��( )
$num
��* +
)
��+ ,
{
�� 
clicked
�� 
=
�� 
campaign
�� "
.
��" #
ProDatas
��# +
.
��+ ,
Sum
��, /
(
��/ 0
x
��0 1
=>
��2 4
x
��5 6
.
��6 7

ClickCount
��7 A
)
��A B
;
��B C
startDateTime
�� 
=
�� 
DateTime
��  (
.
��( )
Parse
��) .
(
��. /
campaign
��/ 7
.
��7 8
ProDatas
��8 @
.
��@ A
FirstOrDefault
��A O
(
��O P
)
��P Q
.
��Q R
CampaignStartDate
��R c
)
��c d
;
��d e
IONumber
�� 
=
�� 
campaign
�� #
.
��# $
ProDatas
��$ ,
.
��, -
FirstOrDefault
��- ;
(
��; <
)
��< =
.
��= >
IO
��> @
;
��@ A
opened
�� 
=
�� 
campaign
�� !
.
��! "
Approved
��" *
.
��* +!
IsUseApiDataForOpen
��+ >
?
��? @
campaign
��A I
.
��I J
ProDatas
��J R
.
��R S
FirstOrDefault
��S a
(
��a b
)
��b c
.
��c d
ImpressionCnt
��d q
:
��r s
ADS
��t w
.
��w x
API
��x {
.
��{ |
Models��| �
.��� �
Campaign��� �
.��� �
GetOpens��� �
(��� �
campaign��� �
.��� �
Approved��� �
.��� �
Quantity��� �
,��� �
startDateTime��� �
)��� �
;��� �
}
�� 
var
�� 
model
�� 
=
�� 
new
�� 
CampaignReportVM
�� ,
(
��, -
)
��- .
{
�� 
Id
�� 
=
�� 
campaign
�� 
.
�� 
Id
��  
.
��  !
ToString
��! )
(
��) *
)
��* +
,
��+ ,
OrderNumber
�� 
=
�� 
campaign
�� &
.
��& '
OrderNumber
��' 2
,
��2 3
CampaignName
�� 
=
�� 
campaign
�� '
.
��' (
CampaignName
��( 4
,
��4 5
	OrderDate
�� 
=
�� 
campaign
�� $
.
��$ %
	CreatedAt
��% .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
Status
�� 
=
�� 
(
�� 
(
�� 
CampaignStatus
�� )
)
��) *
campaign
��+ 3
.
��3 4
Status
��4 :
)
��: ;
.
��; <
ToString
��< D
(
��D E
)
��E F
,
��F G

WhiteLabel
�� 
=
�� 
campaign
�� %
.
��% &

WhiteLabel
��& 0
,
��0 1
Quantity
�� 
=
�� 
campaign
�� #
.
��# $
Approved
��$ ,
.
��, -
Quantity
��- 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
Clicked
�� 
=
�� 
clicked
�� !
==
��" $
$num
��% &
?
��' (
$str
��) -
:
��. /
clicked
��0 7
.
��7 8
ToString
��8 @
(
��@ A
)
��A B
,
��B C
Opened
�� 
=
�� 
opened
�� 
==
��  "
$num
��# $
?
��% &
$str
��' +
:
��, -
opened
��. 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
,
��? @
IONumber
�� 
=
�� 
IONumber
�� #
,
��# $
	StartDate
�� 
=
�� 
startDateTime
�� )
==
��* ,
DateTime
��- 5
.
��5 6
MinValue
��6 >
?
��? @
$str
��A E
:
��F G
startDateTime
��H U
.
��U V
ToString
��V ^
(
��^ _
)
��_ `
,
��` a

EmailsSent
�� 
=
�� 
campaign
�� %
.
��% &
Approved
��& .
.
��. /
Quantity
��/ 7
.
��7 8
ToString
��8 @
(
��@ A
)
��A B
,
��B C
OpenedPercentage
��  
=
��! "
campaign
�� 
.
�� 
Approved
�� %
.
��% &
Quantity
��& .
==
��/ 1
$num
��2 3
?
�� 
$str
�� 
:
�� 
(
�� 
(
�� 
double
�� "
)
��" #
opened
��$ *
/
��* +
campaign
��+ 3
.
��3 4
Approved
��4 <
.
��< =
Quantity
��= E
)
��E F
.
��F G
ToString
��G O
(
��O P
$str
��P W
)
��W X
,
��X Y
ClickedPercentage
�� !
=
��" #
campaign
�� 
.
�� 
Approved
�� %
.
��% &
Quantity
��& .
==
��/ 1
$num
��2 3
?
�� 
$str
�� 
:
�� 
(
�� 
(
�� 
double
�� "
)
��" #
clicked
��$ +
/
��+ ,
campaign
��, 4
.
��4 5
Approved
��5 =
.
��= >
Quantity
��> F
)
��F G
.
��G H
ToString
��H P
(
��P Q
$str
��Q X
)
��X Y
,
��Y Z
CTRPercentage
�� 
=
�� 
opened
��  &
==
��' )
$num
��* +
?
��, -
$str
��. 2
:
��3 4
(
��5 6
(
��6 7
double
��7 =
)
��= >
clicked
��? F
/
��F G
opened
��G M
)
��M N
.
��N O
ToString
��O W
(
��W X
$str
��X _
)
��_ `
,
��` a
}
�� 
;
�� 
model
�� 
.
�� 
PerLink
�� 
=
�� 
new
�� 
List
��  $
<
��$ %$
CampaignReportDetailVM
��% ;
>
��; <
(
��< =
)
��= >
;
��> ?
foreach
�� 
(
�� 
var
�� 
proData
��  
in
��! #
campaign
��$ ,
.
��, -
ProDatas
��- 5
.
��5 6
OrderBy
��6 =
(
��= >
x
��> ?
=>
��@ B
ProDataHelper
��C P
.
��P Q
GetIndex
��Q Y
(
��Y Z
x
��Z [
.
��[ \
Reportsite_URL
��\ j
)
��j k
)
��k l
)
��l m
{
�� 
model
�� 
.
�� 
PerLink
�� 
.
�� 
Add
�� !
(
��! "
new
��" %$
CampaignReportDetailVM
��& <
(
��< =
)
��= >
{
�� 
IONumber
�� 
=
�� 
proData
�� &
.
��& '
IO
��' )
,
��) *
OrderNumber
�� 
=
��  !
proData
��" )
.
��) *
Reportsite_URL
��* 8
,
��8 9
Link
�� 
=
�� 
proData
�� "
.
��" #
Destination_URL
��# 2
,
��2 3

ClickCount
�� 
=
��  
proData
��! (
.
��( )

ClickCount
��) 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
ActionResult
�� 
DownloadReport
�� *
(
��* +
Guid
��+ /
?
��/ 0
id
��1 3
)
��3 4
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- :
)
��: ;
;
��; <
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
db
��  "
.
��" #
	Campaigns
��# ,
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Assets
��  &
)
��& '
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Segments
��  (
)
��( )
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
ProDatas
��  (
)
��( )
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Testing
��  '
)
��' (
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
��  
Approved
��  (
)
��( )
.
�� 
FirstOrDefault
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
Id
��' )
==
��* ,
id
��- /
)
��/ 0
;
��0 1
if
�� 
(
�� 
campaign
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� 
HttpException
�� '
(
��' (
$num
��( +
,
��+ ,
$str
��- 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� !
==
��" $
null
��% )
)
��) *
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$str
��$ `
;
��` a
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
long
�� 
clicked
�� 
=
�� 
$num
�� 
,
�� 
opened
�� $
=
��% &
$num
��' (
;
��( )
long
�� 
mobile
�� 
=
�� 
$num
�� 
,
�� 
desktop
�� $
=
��% &
$num
��' (
;
��( )
DateTime
�� 
startDateTime
�� "
=
��# $
DateTime
��% -
.
��- .
MinValue
��. 6
;
��6 7
string
�� 
IONumber
�� 
=
�� 
$str
�� "
;
��" #
if
�� 
(
�� 
campaign
�� 
.
�� 
ProDatas
�� !
.
��! "
Count
��" '
>
��( )
$num
��* +
)
��+ ,
{
�� 
clicked
�� 
=
�� 
campaign
�� "
.
��" #
ProDatas
��# +
.
��+ ,
Sum
��, /
(
��/ 0
x
��0 1
=>
��2 4
x
��5 6
.
��6 7

ClickCount
��7 A
)
��A B
;
��B C
mobile
�� 
=
�� 
campaign
�� !
.
��! "
ProDatas
��" *
.
��* +
Sum
��+ .
(
��. /
x
��/ 0
=>
��1 3
x
��4 5
.
��5 6
	MobileCnt
��6 ?
)
��? @
;
��@ A
desktop
�� 
=
�� 
campaign
�� "
.
��" #
ProDatas
��# +
.
��+ ,
FirstOrDefault
��, :
(
��: ;
)
��; <
.
��< =
	UniqueCnt
��= F
;
��F G
startDateTime
�� 
=
�� 
DateTime
��  (
.
��( )
Parse
��) .
(
��. /
campaign
��/ 7
.
��7 8
ProDatas
��8 @
.
��@ A
FirstOrDefault
��A O
(
��O P
)
��P Q
.
��Q R
CampaignStartDate
��R c
)
��c d
;
��d e
IONumber
�� 
=
�� 
campaign
�� #
.
��# $
ProDatas
��$ ,
.
��, -
FirstOrDefault
��- ;
(
��; <
)
��< =
.
��= >
IO
��> @
;
��@ A
opened
�� 
=
�� 
ADS
�� 
.
�� 
API
��  
.
��  !
Models
��! '
.
��' (
Campaign
��( 0
.
��0 1
GetOpens
��1 9
(
��9 :
campaign
��: B
.
��B C
Approved
��C K
.
��K L
Quantity
��L T
,
��T U
startDateTime
��V c
)
��c d
;
��d e
}
�� 
var
�� 
model
�� 
=
�� 
new
�� 
CampaignReportVM
�� ,
(
��, -
)
��- .
{
�� 
Id
�� 
=
�� 
campaign
�� 
.
�� 
Id
��  
.
��  !
ToString
��! )
(
��) *
)
��* +
,
��+ ,
OrderNumber
�� 
=
�� 
campaign
�� &
.
��& '
OrderNumber
��' 2
,
��2 3
CampaignName
�� 
=
�� 
campaign
�� '
.
��' (
Approved
��( 0
.
��0 1
CampaignName
��1 =
,
��= >

WhiteLabel
�� 
=
�� 
campaign
�� %
.
��% &
Approved
��& .
.
��. /

WhiteLabel
��/ 9
,
��9 :
SubjectLine
�� 
=
�� 
campaign
�� &
.
��& '
Approved
��' /
.
��/ 0
SubjectLine
��0 ;
,
��; <
FromLine
�� 
=
�� 
campaign
�� #
.
��# $
Approved
��$ ,
.
��, -
FromLine
��- 5
,
��5 6
	OrderDate
�� 
=
�� 
campaign
�� $
.
��$ %
	CreatedAt
��% .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
,
��9 :
Status
�� 
=
�� 
(
�� 
(
�� 
CampaignStatus
�� )
)
��) *
campaign
��* 2
.
��2 3
Status
��3 9
)
��9 :
.
��: ;
ToString
��; C
(
��C D
)
��D E
,
��E F
Quantity
�� 
=
�� 
campaign
�� #
.
��# $
Approved
��$ ,
.
��, -
Quantity
��- 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
,
��@ A
Clicked
�� 
=
�� 
clicked
�� !
==
��" $
$num
��% &
?
��' (
$str
��) -
:
��. /
clicked
��0 7
.
��7 8
ToString
��8 @
(
��@ A
)
��A B
,
��B C
Opened
�� 
=
�� 
opened
�� 
==
��  "
$num
��# $
?
��% &
$str
��' +
:
��, -
opened
��. 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
,
��? @
IONumber
�� 
=
�� 
IONumber
�� #
,
��# $
	StartDate
�� 
=
�� 
startDateTime
�� )
==
��* ,
DateTime
��- 5
.
��5 6
MinValue
��6 >
?
��? @
$str
��A E
:
��F G
startDateTime
��H U
.
��U V
ToString
��V ^
(
��^ _
StringConstants
��_ n
.
��n o 
DateFormatSlashes��o �
)��� �
,��� �

EmailsSent
�� 
=
�� 
campaign
�� %
.
��% &
Approved
��& .
.
��. /
Quantity
��/ 7
.
��7 8
ToString
��8 @
(
��@ A
)
��A B
,
��B C
OpenedPercentage
��  
=
��! "
campaign
�� 
.
�� 
Approved
�� %
.
��% &
Quantity
��& .
==
��/ 1
$num
��2 3
?
�� 
$str
�� 
:
�� 
(
�� 
(
�� 
double
�� "
)
��" #
opened
��# )
/
��* +
campaign
��, 4
.
��4 5
Approved
��5 =
.
��= >
Quantity
��> F
)
��F G
.
��G H
ToString
��H P
(
��P Q
$str
��Q X
)
��X Y
,
��Y Z
ClickedPercentage
�� !
=
��" #
campaign
�� 
.
�� 
Approved
�� %
.
��% &
Quantity
��& .
==
��/ 1
$num
��2 3
?
�� 
$str
�� 
:
�� 
(
�� 
(
�� 
double
�� "
)
��" #
clicked
��# *
/
��+ ,
campaign
��- 5
.
��5 6
Approved
��6 >
.
��> ?
Quantity
��? G
)
��G H
.
��H I
ToString
��I Q
(
��Q R
$str
��R Y
)
��Y Z
,
��Z [
CTRPercentage
�� 
=
�� 
opened
��  &
==
��' )
$num
��* +
?
��, -
$str
��. 2
:
��3 4
(
��5 6
(
��6 7
double
��7 =
)
��= >
clicked
��> E
/
��F G
opened
��H N
)
��N O
.
��O P
ToString
��P X
(
��X Y
$str
��Y `
)
��` a
,
��a b
Mobile
�� 
=
�� 
mobile
�� 
.
��  
ToString
��  (
(
��( )
)
��) *
,
��* +
Desktop
�� 
=
�� 
desktop
�� !
.
��! "
ToString
��" *
(
��* +
)
��+ ,
}
�� 
;
�� 
model
�� 
.
�� 
PerLink
�� 
=
�� 
new
�� 
List
��  $
<
��$ %$
CampaignReportDetailVM
��% ;
>
��; <
(
��< =
)
��= >
;
��> ?
foreach
�� 
(
�� 
var
�� 
proData
��  
in
��! #
campaign
��$ ,
.
��, -
ProDatas
��- 5
.
��5 6
OrderBy
��6 =
(
��= >
x
��> ?
=>
��@ B
ProDataHelper
��C P
.
��P Q
GetIndex
��Q Y
(
��Y Z
x
��Z [
.
��[ \
Reportsite_URL
��\ j
)
��j k
)
��k l
)
��l m
{
�� 
model
�� 
.
�� 
PerLink
�� 
.
�� 
Add
�� !
(
��! "
new
��" %$
CampaignReportDetailVM
��& <
(
��< =
)
��= >
{
�� 
IONumber
�� 
=
�� 
proData
�� &
.
��& '
IO
��' )
,
��) *
OrderNumber
�� 
=
��  !
proData
��" )
.
��) *
Reportsite_URL
��* 8
,
��8 9
Link
�� 
=
�� 
proData
�� "
.
��" #
Destination_URL
��# 2
,
��2 3

ClickCount
�� 
=
��  
proData
��! (
.
��( )

ClickCount
��) 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
,
��> ?
UniqueCount
�� 
=
��  !
proData
��" )
.
��) *
	UniqueCnt
��* 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
,
��> ?
MobileCount
�� 
=
��  !
proData
��" )
.
��) *
	MobileCnt
��* 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
}
�� 
)
�� 
;
�� 
}
�� 
string
�� 
creativeURL
�� 
=
��  
$str
��! #
,
��# $
	imagePath
��% .
=
��/ 0
$str
��1 3
,
��3 4
imageURL
��5 =
=
��> ?
$str
��@ B
;
��B C
string
�� 
fileName
�� 
=
�� 
$str
��  
,
��  !
filePath
��" *
=
��+ ,
$str
��- /
;
��/ 0

Dictionary
�� 
<
�� 
string
�� 
,
�� 
string
�� %
>
��% &
	keyValues
��' 0
=
��1 2
new
��3 6

Dictionary
��7 A
<
��A B
string
��B H
,
��H I
string
��J P
>
��P Q
(
��Q R
)
��R S
;
��S T
creativeURL
�� 
=
�� 
campaign
�� "
.
��" #
Assets
��# )
.
��) *
CreativeUrl
��* 5
;
��5 6
string
�� 
imagePathTemp
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 @
,
��@ A

UploadPath
��B L
,
��L M
campaign
��N V
.
��V W
OrderNumber
��W b
)
��b c
;
��c d
	imagePath
�� 
=
�� 
string
�� 
.
�� 
Format
�� %
(
��% &
$str
��& 4
,
��4 5

UploadPath
��6 @
,
��@ A
campaign
��B J
.
��J K
OrderNumber
��K V
)
��V W
;
��W X
imageURL
�� 
=
�� 
new
�� 
Uri
�� 
(
�� 
Request
�� &
.
��& '
Url
��' *
,
��* +
Url
��, /
.
��/ 0
Content
��0 7
(
��7 8
string
��8 >
.
��> ?
Format
��? E
(
��E F
$str
��F Y
,
��Y Z
campaign
��[ c
.
��c d
OrderNumber
��d o
)
��o p
)
��p q
)
��q r
.
��r s
AbsoluteUri
��s ~
;
��~ 
fileName
�� 
=
�� 
campaign
�� 
.
��  
OrderNumber
��  +
+
��, -
$str
��. 5
;
��5 6
filePath
�� 
=
�� 
Path
�� 
.
�� 
Combine
�� #
(
��# $
DownloadPath
��$ 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
	keyValues
�� 
.
�� 
Add
�� 
(
�� 
$str
�� (
,
��( )
campaign
��* 2
.
��2 3
CampaignName
��3 ?
)
��? @
;
��@ A
string
�� 
logoFilePath
�� 
;
��  
if
�� 
(
�� 
LoggedInUser
�� 
!=
�� 
null
��  $
&&
��% '
!
��( )
string
��) /
.
��/ 0
IsNullOrEmpty
��0 =
(
��= >
LoggedInUser
��> J
.
��J K
CompanyLogo
��K V
)
��V W
)
��W X
logoFilePath
�� 
=
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -
$str
��- ;
,
��; <

UploadPath
��= G
,
��G H
LoggedInUser
��I U
.
��U V
CompanyLogo
��V a
)
��a b
;
��b c
else
�� 
logoFilePath
�� 
=
�� 
string
�� %
.
��% &
Format
��& ,
(
��, -
$str
��- =
,
��= >

ImagesPath
��? I
)
��I J
;
��J K
var
�� 
helper
�� 
=
�� 
new
�� 
ImageHelper
�� (
(
��( )
creativeURL
��) 4
,
��4 5
imagePathTemp
��6 C
)
��C D
;
��D E
if
�� 
(
�� 
!
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� 
.
��  
Exists
��  &
(
��& '
	imagePath
��' 0
)
��0 1
)
��1 2
{
�� 
helper
�� 
.
�� 
Capture
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Exists
��# )
(
��) *
imagePathTemp
��* 7
)
��7 8
)
��8 9
helper
�� 
.
�� 
ResizeImage
�� &
(
��& '
imagePathTemp
��' 4
,
��4 5
	imagePath
��6 ?
,
��? @
$num
��A D
,
��D E
$num
��F I
,
��I J
true
��K O
)
��O P
;
��P Q
if
�� 
(
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Exists
��# )
(
��) *
imagePathTemp
��* 7
)
��7 8
)
��8 9
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Delete
��# )
(
��) *
imagePathTemp
��* 7
)
��7 8
;
��8 9
}
�� 
string
�� 
logoFilePathTemp
�� #
=
��$ %
string
��& ,
.
��, -
Format
��- 3
(
��3 4
$str
��4 J
,
��J K

ImagesPath
��L V
)
��V W
;
��W X
if
�� 
(
�� 
!
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� 
.
��  
Exists
��  &
(
��& '
logoFilePathTemp
��' 7
)
��7 8
)
��8 9
{
�� 
helper
�� 
.
�� 
ResizeImage
�� "
(
��" #
logoFilePath
��# /
,
��/ 0
logoFilePathTemp
��1 A
,
��A B
$num
��C F
,
��F G
$num
��H K
,
��K L
true
��M Q
)
��Q R
;
��R S
}
�� 
ExcelHelper
�� 
.
�� $
GenerateTrackingReport
�� .
(
��. /
model
��/ 4
,
��4 5
logoFilePath
��6 B
,
��B C
	imagePath
��D M
,
��M N
filePath
��O W
)
��W X
;
��X Y
return
�� 
File
�� 
(
�� 
filePath
��  
,
��  !
$str
��" e
,
��e f
fileName
��g o
)
��o p
;
��p q
}
�� 	
public
�� 

JsonResult
�� 
RefreshProData
�� (
(
��( )
string
��) /
OrderNumber
��0 ;
)
��; <
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
OrderNumber
�� 
==
��  "
null
��# '
)
��' (
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( >
)
��> ?
;
��? @
}
�� 
ProDataAPIManager
�� !
.
��! "$
FetchAndUpdateProDatas
��" 8
(
��8 9
db
��9 ;
,
��; <
OrderNumber
��= H
)
��H I
;
��I J
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
}
��A B
)
��B C
;
��C D
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
public
�� 

JsonResult
�� 
RefreshProDataLog
�� +
(
��+ ,
string
��, 2
OrderNumber
��3 >
)
��> ?
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
OrderNumber
�� 
==
��  "
null
��# '
)
��' (
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( >
)
��> ?
;
��? @
}
�� 
var
�� 
messages
�� 
=
�� 
db
�� !
.
��! "

SystemLogs
��" ,
.
��, -
Where
��- 2
(
��2 3
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
OrderNumber
��: E
==
��F H
OrderNumber
��I T
&&
��U W
x
��X Y
.
��Y Z
LogType
��Z a
==
��b d
(
��e f
int
��f i
)
��i j
LogType
��j q
.
��q r
ProData
��r y
)
��y z
.
�� 
OrderByDescending
�� &
(
��& '
x
��' (
=>
��) +
x
��, -
.
��- .
	CreatedAt
��. 7
)
��7 8
.
�� 
Select
�� 
(
�� 
x
�� 
=>
��  
new
��! $
{
��% &
	CreatedAt
��' 0
=
��1 2
x
��3 4
.
��4 5
	CreatedAt
��5 >
.
��> ?
ToString
��? G
(
��G H
)
��H I
,
��I J
Message
��K R
=
��S T
x
��U V
.
��V W
Message
��W ^
}
��_ `
)
��` a
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
true
��< @
,
��@ A
Result
��B H
=
��I J
messages
��K S
}
��T U
)
��U V
;
��V W
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Json
�� 
(
�� 
new
�� 
JsonResponse
��  ,
(
��, -
)
��- .
{
��/ 0
IsSucess
��1 9
=
��: ;
false
��< A
,
��A B
ErrorMessage
��C O
=
��P Q
ex
��R T
.
��T U
Message
��U \
}
��] ^
)
��^ _
;
��_ `
}
�� 
}
�� 	
}
�� 
}�� �=
8E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Global.asax.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

class 
MvcApplication 
:  !
HttpApplication" 1
{ 
	protected 
void 
Application_Start (
(( )
)) *
{ 	
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
GlobalConfiguration 
.  
	Configure  )
() *
WebApiConfig* 6
.6 7
Register7 ?
)? @
;@ A
FilterConfig 
. !
RegisterGlobalFilters .
(. /
GlobalFilters/ <
.< =
Filters= D
)D E
;E F
RouteConfig 
. 
RegisterRoutes &
(& '

RouteTable' 1
.1 2
Routes2 8
)8 9
;9 :
BundleConfig 
. 
RegisterBundles (
(( )
BundleTable) 4
.4 5
Bundles5 <
)< =
;= >
} 	
	protected 
void +
Application_AcquireRequestState 6
(6 7
object7 =
sender> D
,D E
	EventArgsF O
eP Q
)Q R
{ 	
} 	
	protected   
void   
Application_Error   (
(  ( )
object  ) /
sender  0 6
,  6 7
	EventArgs  8 A
e  B C
)  C D
{!! 	
var"" 
httpContext"" 
="" 
("" 
(""  
MvcApplication""  .
)"". /
sender""/ 5
)""5 6
.""6 7
Context""7 >
;""> ?
var## 
currentController## !
=##" #
$str##$ '
;##' (
var$$ 
currentAction$$ 
=$$ 
$str$$  #
;$$# $
var%% 
currentRouteData%%  
=%%! "

RouteTable%%# -
.%%- .
Routes%%. 4
.%%4 5
GetRouteData%%5 A
(%%A B
new%%B E
HttpContextWrapper%%F X
(%%X Y
httpContext%%Y d
)%%d e
)%%e f
;%%f g
if'' 
('' 
currentRouteData''  
!=''! #
null''$ (
)''( )
{(( 
if)) 
()) 
currentRouteData)) $
.))$ %
Values))% +
[))+ ,
$str)), 8
]))8 9
!=)): <
null))= A
&&))B D
!))E F
string))F L
.))L M
IsNullOrEmpty))M Z
())Z [
currentRouteData))[ k
.))k l
Values))l r
[))r s
$str))s 
]	)) �
.
))� �
ToString
))� �
(
))� �
)
))� �
)
))� �
)
))� �
{** 
currentController++ %
=++& '
currentRouteData++( 8
.++8 9
Values++9 ?
[++? @
$str++@ L
]++L M
.++M N
ToString++N V
(++V W
)++W X
;++X Y
},, 
if.. 
(.. 
currentRouteData.. $
...$ %
Values..% +
[..+ ,
$str.., 4
]..4 5
!=..6 8
null..9 =
&&..> @
!..A B
string..B H
...H I
IsNullOrEmpty..I V
(..V W
currentRouteData..W g
...g h
Values..h n
[..n o
$str..o w
]..w x
...x y
ToString	..y �
(
..� �
)
..� �
)
..� �
)
..� �
{// 
currentAction00 !
=00" #
currentRouteData00$ 4
.004 5
Values005 ;
[00; <
$str00< D
]00D E
.00E F
ToString00F N
(00N O
)00O P
;00P Q
}11 
}22 
var33 
ex33 
=33 
Server33 
.33 
GetLastError33 (
(33( )
)33) *
;33* +
try55 
{66 
EmailHelper77 
.77 
SendErrorEmail77 *
(77* + 
ConfigurationManager77+ ?
.77? @
AppSettings77@ K
[77K L
$str77L _
]77_ `
,77` a
ex77b d
,77d e
currentController77f w
,77w x
currentAction88 !
)88! "
;88" #
}99 
catch:: 
(:: 
	Exception:: 
exx::  
)::  !
{;; 
}<< 
var>> 
	routeData>> 
=>> 
new>> 
	RouteData>>  )
(>>) *
)>>* +
;>>+ ,
var?? 
action?? 
=?? 
$str?? '
;??' (
ifAA 
(AA 
exAA 
isAA 
HttpExceptionAA #
)AA# $
{BB 
varCC 
httpExCC 
=CC 
exCC 
asCC  "
HttpExceptionCC# 0
;CC0 1
switchEE 
(EE 
httpExEE 
.EE 
GetHttpCodeEE *
(EE* +
)EE+ ,
)EE, -
{FF 
caseGG 
$numGG 
:GG 
actionHH 
=HH  
$strHH! -
;HH- .
breakII 
;II 
caseJJ 
$numJJ 
:JJ 
actionKK 
=KK  
$strKK! +
;KK+ ,
breakLL 
;LL 
}NN 
}OO 
httpContextQQ 
.QQ 

ClearErrorQQ "
(QQ" #
)QQ# $
;QQ$ %
httpContextRR 
.RR 
ResponseRR  
.RR  !
ClearRR! &
(RR& '
)RR' (
;RR( )
httpContextSS 
.SS 
ResponseSS  
.SS  !

StatusCodeSS! +
=SS, -
exSS. 0
isSS1 3
HttpExceptionSS4 A
?SSB C
(SSD E
(SSE F
HttpExceptionSSF S
)SSS T
exSST V
)SSV W
.SSW X
GetHttpCodeSSX c
(SSc d
)SSd e
:SSf g
$numSSh k
;SSk l
httpContextTT 
.TT 
ResponseTT  
.TT  !"
TrySkipIisCustomErrorsTT! 7
=TT8 9
trueTT: >
;TT> ?
	routeDataVV 
.VV 
ValuesVV 
[VV 
$strVV )
]VV) *
=VV+ ,
$strVV- 4
;VV4 5
	routeDataWW 
.WW 
ValuesWW 
[WW 
$strWW %
]WW% &
=WW' (
actionWW) /
;WW/ 0
	routeDataXX 
.XX 
ValuesXX 
[XX 
$strXX (
]XX( )
=XX* +
newXX, /
HandleErrorInfoXX0 ?
(XX? @
exXX@ B
,XXB C
currentControllerXXD U
,XXU V
currentActionXXW d
)XXd e
;XXe f
IControllerZZ 
errorControllerZZ '
=ZZ( )
newZZ* -
ErrorControllerZZ. =
(ZZ= >
)ZZ> ?
;ZZ? @
HttpContextWrapper[[ 
wrapper[[ &
=[[' (
new[[) ,
HttpContextWrapper[[- ?
([[? @
httpContext[[@ K
)[[K L
;[[L M
var\\ 
rc\\ 
=\\ 
new\\ 
RequestContext\\ '
(\\' (
wrapper\\( /
,\\/ 0
	routeData\\1 :
)\\: ;
;\\; <
errorController]] 
.]] 
Execute]] #
(]]# $
rc]]$ &
)]]& '
;]]' (
}^^ 	
}__ 
}`` �
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\AjaxAuthorizeAttribute.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class "
AjaxAuthorizeAttribute '
:( )
AuthorizeAttribute* <
{ 
	protected 
override 
void %
HandleUnauthorizedRequest  9
(9 : 
AuthorizationContext: N
contextO V
)V W
{ 	
if		 
(		 
context		 
.		 
HttpContext		 #
.		# $
Request		$ +
.		+ ,
IsAjaxRequest		, 9
(		9 :
)		: ;
)		; <
{

 
var 
	urlHelper 
= 
new  #
	UrlHelper$ -
(- .
context. 5
.5 6
RequestContext6 D
)D E
;E F
context 
. 
HttpContext #
.# $
Response$ ,
., -

StatusCode- 7
=8 9
$num: =
;= >
context 
. 
Result 
=  
new! $

JsonResult% /
{ 
Data 
= 
new 
{ 
Error 
= 
$str  /
,/ 0
LogOnUrl  
=! "
	urlHelper# ,
., -
Action- 3
(3 4
$str4 ;
,; <
$str= F
)F G
} 
, 
JsonRequestBehavior '
=( )
JsonRequestBehavior* =
.= >
AllowGet> F
} 
; 
} 
else 
{ 
base 
. %
HandleUnauthorizedRequest .
(. /
context/ 6
)6 7
;7 8
} 
} 	
} 
} �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\AuthorizeRole.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public		 

class		 
AuthorizeRole		 
:		  !
ActionFilterAttribute		! 6
{

 
public 
string 
Roles 
{ 
get !
;! "
set# &
;& '
}( )
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
filterContextF S
)S T
{ 	
bool 
	IfAllowed 
= 
false "
;" #
try 
{ 
var 
userIdentity  
=! "
filterContext# 0
.0 1
HttpContext1 <
.< =
User= A
.A B
IdentityB J
asK M
ClaimsIdentityN \
;\ ]
var 
roles 
= 
userIdentity (
.( )
Claims) /
./ 0
Where0 5
(5 6
x6 7
=>8 :
x; <
.< =
Type= A
==B D

ClaimTypesE O
.O P
RoleP T
)T U
.U V
SelectV \
(\ ]
claim] b
=>c e
claime j
.j k
Valuek p
)p q
.q r
ToArrayr y
(y z
)z {
;{ |
var 
	rolesList 
= 
Roles  %
.% &
Split& +
(+ ,
$str, /
./ 0
ToCharArray0 ;
(; <
)< =
,= >
StringSplitOptions? Q
.Q R
RemoveEmptyEntriesR d
)d e
;e f
foreach 
( 
var 
requestedRole *
in+ -
	rolesList. 7
)7 8
{ 
if   
(   
roles   
.   
Contains   &
(  & '
requestedRole  ' 4
)  4 5
)  5 6
{!! 
	IfAllowed"" !
=""" #
true""$ (
;""( )
break## 
;## 
}$$ 
}%% 
if'' 
('' 
	IfAllowed'' 
)'' 
{(( 
base)) 
.)) 
OnActionExecuting)) *
())* +
filterContext))+ 8
)))8 9
;))9 :
return** 
;** 
}++ 
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)-- 
{.. 
}00 
filterContext33 
.33 
Result33  
=33! "
new44 !
RedirectToRouteResult44 -
(44- .
new44. 1 
RouteValueDictionary442 F
{55 
{66 
$str66 "
,66" #
$str66$ 3
}664 5
,665 6
{77 
$str77 &
,77& '
$str77( /
}770 1
,771 2
}88 
)88 
;88 
return99 
;99 
}:: 	
};; 
}<< �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\AuthorizeClaim.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public		 

class		 
AuthorizeClaim		 
:		  !!
ActionFilterAttribute		" 7
{

 
public 
string 
Claims 
{ 
get "
;" #
set$ '
;' (
}) *
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
filterContextF S
)S T
{ 	
bool 
	IfAllowed 
= 
false "
;" #
try 
{ 
var 
userIdentity  
=! "
filterContext# 0
.0 1
HttpContext1 <
.< =
User= A
.A B
IdentityB J
asK M
ClaimsIdentityN \
;\ ]
var 
claims 
= 
userIdentity )
.) *
Claims* 0
.0 1
Where1 6
(6 7
x7 8
=>9 ;
x< =
.= >
Type> B
==C E

ClaimTypesF P
.P Q
UserDataQ Y
)Y Z
.Z [
Select[ a
(a b
claimb g
=>h j
claimk p
.p q
Valueq v
)v w
.w x
ToListx ~
(~ 
)	 �
;
� �
var 

claimsList 
=  
Claims! '
.' (
Split( -
(- .
$str. 1
.1 2
ToCharArray2 =
(= >
)> ?
,? @
StringSplitOptionsA S
.S T
RemoveEmptyEntriesT f
)f g
;g h
foreach 
( 
var 
requestedClaim +
in, .

claimsList/ 9
)9 :
{   
if!! 
(!! 
claims!! 
.!! 
Contains!! '
(!!' (
requestedClaim!!( 6
)!!6 7
)!!7 8
{"" 
	IfAllowed## !
=##" #
true##$ (
;##( )
break$$ 
;$$ 
}%% 
}&& 
if(( 
((( 
	IfAllowed(( 
)(( 
{)) 
base** 
.** 
OnActionExecuting** *
(*** +
filterContext**+ 8
)**8 9
;**9 :
return++ 
;++ 
},, 
}-- 
catch.. 
(.. 
	Exception.. 
ex.. 
).. 
{// 
}11 
filterContext44 
.44 
Result44  
=44! "
new55 !
RedirectToRouteResult55 -
(55- .
new55. 1 
RouteValueDictionary552 F
{66 
{77 
$str77 "
,77" #
$str77$ 3
}774 5
,775 6
{88 
$str88 &
,88& '
$str88( /
}880 1
}99 
)99 
;99 
return:: 
;:: 
};; 	
}<< 
}== ��
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\CsvHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
CsvFile 
: 
IDisposable &
{ 
public 
static 
CsvDefinition # 
DefaultCsvDefinition$ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
static 
bool 

UseLambdas %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
static 
bool 
UseTasks #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
static 
bool 
FastIndexOfAny )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
static 
CsvFile 
( 
) 
{ 	 
DefaultCsvDefinition%%  
=%%! "
new%%# &
CsvDefinition%%' 4
{&& 
	EndOfLine'' 
='' 
$str'' "
,''" #
FieldSeparator(( 
=((  
$char((! $
,(($ %
TextQualifier)) 
=)) 
$char))  #
}** 
;** 

UseLambdas++ 
=++ 
true++ 
;++ 
UseTasks,, 
=,, 
true,, 
;,, 
FastIndexOfAny-- 
=-- 
true-- !
;--! "
}.. 	
internal22 
	protected22 
Stream22 !

BaseStream22" ,
;22, -
	protected33 
static33 
DateTime33 !
DateTimeZero33" .
=33/ 0
new331 4
DateTime335 =
(33= >
)33> ?
;33? @
public66 
static66 
IEnumerable66 !
<66! "
T66" #
>66# $
Read66% )
<66) *
T66* +
>66+ ,
(66, -
	CsvSource66- 6
	csvSource667 @
)66@ A
where66B G
T66H I
:66J K
new66L O
(66O P
)66P Q
{77 	
var88 
csvFileReader88 
=88 
new88  #
CsvFileReader88$ 1
<881 2
T882 3
>883 4
(884 5
	csvSource885 >
)88> ?
;88? @
return99 
(99 
IEnumerable99 
<99  
T99  !
>99! "
)99" #
csvFileReader99# 0
;990 1
}:: 	
public<< 
char<< 
FieldSeparator<< "
{<<# $
get<<% (
;<<( )
private<<* 1
set<<2 5
;<<5 6
}<<7 8
public== 
char== 
TextQualifier== !
{==" #
get==$ '
;==' (
private==) 0
set==1 4
;==4 5
}==6 7
public>> 
IEnumerable>> 
<>> 
String>> !
>>>! "
Columns>># *
{>>+ ,
get>>- 0
;>>0 1
private>>2 9
set>>: =
;>>= >
}>>? @
public@@ 
void@@ 
Dispose@@ 
(@@ 
)@@ 
{AA 	
DisposeBB 
(BB 
trueBB 
)BB 
;BB 
}CC 	
	protectedEE 
virtualEE 
voidEE 
DisposeEE &
(EE& '
boolEE' +
	disposingEE, 5
)EE5 6
{FF 	
}II 	
}JJ 
publicLL 

classLL 
CsvFileLL 
<LL 
TLL 
>LL 
:LL 
CsvFileLL %
{MM 
privateNN 
readonlyNN 
charNN 
fieldSeparatorNN ,
;NN, -
privateOO 
readonlyOO 
stringOO "
fieldSeparatorAsStringOO  6
;OO6 7
privatePP 
readonlyPP 
charPP 
[PP 
]PP  
invalidCharsInFieldsPP  4
;PP4 5
privateQQ 
readonlyQQ 
StreamWriterQQ %
streamWriterQQ& 2
;QQ2 3
privateRR 
readonlyRR 
charRR 
textQualifierRR +
;RR+ ,
privateSS 
readonlySS 
StringSS 
[SS  
]SS  !
columnsSS" )
;SS) *
privateTT 
FuncTT 
<TT 
TTT 
,TT 
objectTT 
>TT 
[TT  
]TT  !
gettersTT" )
;TT) *
readonlyUU 
boolUU 
[UU 
]UU !
isInvalidCharInFieldsUU -
;UU- .
privateWW 
intWW 
linesToWriteWW  
;WW  !
privateXX 
readonlyXX 
BlockingCollectionXX +
<XX+ ,
stringXX, 2
>XX2 3
csvLinesToWriteXX4 C
=XXD E
newXXF I
BlockingCollectionXXJ \
<XX\ ]
stringXX] c
>XXc d
(XXd e
$numXXe i
)XXi j
;XXj k
privateYY 
readonlyYY 
ThreadYY 
writeCsvLinesTaskYY  1
;YY1 2
privateZZ 
TaskZZ 
addAsyncTaskZZ !
;ZZ! "
public]] 
CsvFile]] 
(]] 
CsvDestination]] %
csvDestination]]& 4
)]]4 5
:^^ 
this^^ 
(^^ 
csvDestination^^ !
,^^! "
null^^# '
)^^' (
{__ 	
}`` 	
publicbb 
CsvFilebb 
(bb 
)bb 
{cc 	
}dd 	
publicff 
CsvFileff 
(ff 
CsvDestinationff %
csvDestinationff& 4
,ff4 5
CsvDefinitionff6 C
csvDefinitionffD Q
)ffQ R
{gg 	
ifhh 
(hh 
csvDefinitionhh 
==hh  
nullhh! %
)hh% &
csvDefinitionii 
=ii  
DefaultCsvDefinitionii  4
;ii4 5
thisjj 
.jj 
columnsjj 
=jj 
(jj 
csvDefinitionjj )
.jj) *
Columnsjj* 1
??jj2 4
InferColumnsjj5 A
(jjA B
typeofjjB H
(jjH I
TjjI J
)jjJ K
)jjK L
)jjL M
.jjM N
ToArrayjjN U
(jjU V
)jjV W
;jjW X
thiskk 
.kk 
fieldSeparatorkk 
=kk  !
csvDefinitionkk" /
.kk/ 0
FieldSeparatorkk0 >
;kk> ?
thisll 
.ll "
fieldSeparatorAsStringll '
=ll( )
thisll* .
.ll. /
fieldSeparatorll/ =
.ll= >
ToStringll> F
(llF G
CultureInfollG R
.llR S
InvariantCulturellS c
)llc d
;lld e
thismm 
.mm 
textQualifiermm 
=mm  
csvDefinitionmm! .
.mm. /
TextQualifiermm/ <
;mm< =
thisnn 
.nn 
streamWriternn 
=nn 
csvDestinationnn  .
.nn. /
StreamWriternn/ ;
;nn; <
thispp 
.pp  
invalidCharsInFieldspp %
=pp& '
newpp( +
[pp+ ,
]pp, -
{pp. /
$charpp0 4
,pp4 5
$charpp6 :
,pp: ;
thispp< @
.pp@ A
textQualifierppA N
,ppN O
thisppP T
.ppT U
fieldSeparatorppU c
}ppd e
;ppe f
thisqq 
.qq !
isInvalidCharInFieldsqq &
=qq' (
newqq) ,
boolqq- 1
[qq1 2
$numqq2 5
]qq5 6
;qq6 7
foreachss 
(ss 
varss 
css 
inss 
thisss "
.ss" # 
invalidCharsInFieldsss# 7
)ss7 8
{tt 
thisuu 
.uu !
isInvalidCharInFieldsuu *
[uu* +
cuu+ ,
]uu, -
=uu. /
trueuu0 4
;uu4 5
}vv 
thisww 
.ww 
WriteHeaderww 
(ww 
)ww 
;ww 
thisyy 
.yy 
CreateGettersyy 
(yy 
)yy  
;yy  !
if{{ 
({{ 
CsvFile{{ 
.{{ 
UseTasks{{  
){{  !
{|| 
writeCsvLinesTask}} !
=}}" #
new}}$ '
Thread}}( .
(}}. /
(}}/ 0
o}}0 1
)}}1 2
=>}}3 5
this}}6 :
.}}: ;
WriteCsvLines}}; H
(}}H I
)}}I J
)}}J K
;}}K L
writeCsvLinesTask~~ !
.~~! "
Start~~" '
(~~' (
)~~( )
;~~) *
} 
this
�� 
.
�� 
addAsyncTask
�� 
=
�� 
Task
��  $
.
��$ %
Factory
��% ,
.
��, -
StartNew
��- 5
(
��5 6
(
��6 7
)
��7 8
=>
��9 ;
{
��< =
}
��> ?
)
��? @
;
��@ A
}
�� 	
	protected
�� 
override
�� 
void
�� 
Dispose
��  '
(
��' (
bool
��( ,
	disposing
��- 6
)
��6 7
{
�� 	
if
�� 
(
�� 
	disposing
�� 
)
�� 
{
�� 
addAsyncTask
�� 
.
�� 
Wait
�� !
(
��! "
)
��" #
;
��# $
if
�� 
(
�� 
csvLinesToWrite
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� 
csvLinesToWrite
�� #
.
��# $
CompleteAdding
��$ 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
writeCsvLinesTask
�� %
!=
��& (
null
��) -
)
��- .
writeCsvLinesTask
�� %
.
��% &
Join
��& *
(
��* +
)
��+ ,
;
��, -
this
�� 
.
�� 
streamWriter
�� !
.
��! "
Close
��" '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
	protected
�� 
static
�� 
IEnumerable
�� $
<
��$ %
string
��% +
>
��+ ,
InferColumns
��- 9
(
��9 :
Type
��: >

recordType
��? I
)
��I J
{
�� 	
var
�� 
columns
�� 
=
�� 

recordType
�� $
.
�� 
GetProperties
�� 
(
�� 
BindingFlags
�� +
.
��+ ,
Public
��, 2
|
��3 4
BindingFlags
��5 A
.
��A B
Instance
��B J
)
��J K
.
�� 
Where
�� 
(
�� 
pi
�� 
=>
�� 
pi
�� 
.
��   
GetIndexParameters
��  2
(
��2 3
)
��3 4
.
��4 5
Length
��5 ;
==
��< >
$num
��? @
&&
�� 
pi
�� 
.
�� 
GetSetMethod
�� &
(
��& '
)
��' (
!=
��) +
null
��, 0
&&
�� 
!
�� 
	Attribute
�� !
.
��! "
	IsDefined
��" +
(
��+ ,
pi
��, .
,
��. /
typeof
��0 6
(
��6 7(
CsvIgnorePropertyAttribute
��7 Q
)
��Q R
)
��R S
)
��S T
.
�� 
Select
�� 
(
�� 
pi
�� 
=>
�� 
pi
��  
.
��  !
Name
��! %
)
��% &
.
�� 
Concat
�� 
(
�� 

recordType
�� "
.
�� 
	GetFields
�� 
(
�� 
BindingFlags
�� +
.
��+ ,
Public
��, 2
|
��3 4
BindingFlags
��5 A
.
��A B
Instance
��B J
)
��J K
.
�� 
Where
�� 
(
�� 
fi
�� 
=>
��  
!
��! "
	Attribute
��" +
.
��+ ,
	IsDefined
��, 5
(
��5 6
fi
��6 8
,
��8 9
typeof
��: @
(
��@ A(
CsvIgnorePropertyAttribute
��A [
)
��[ \
)
��\ ]
)
��] ^
.
�� 
Select
�� 
(
�� 
fi
�� 
=>
�� !
fi
��" $
.
��$ %
Name
��% )
)
��) *
)
��* +
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
return
�� 
columns
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
WriteCsvLines
�� "
(
��" #
)
��# $
{
�� 	
int
�� 
written
�� 
=
�� 
$num
�� 
;
�� 
foreach
�� 
(
�� 
var
�� 
csvLine
��  
in
��! #
csvLinesToWrite
��$ 3
.
��3 4$
GetConsumingEnumerable
��4 J
(
��J K
)
��K L
)
��L M
{
�� 
this
�� 
.
�� 
streamWriter
�� !
.
��! "
	WriteLine
��" +
(
��+ ,
csvLine
��, 3
)
��3 4
;
��4 5
written
�� 
++
�� 
;
�� 
}
�� 
Interlocked
�� 
.
�� 
Add
�� 
(
�� 
ref
�� 
this
��  $
.
��$ %
linesToWrite
��% 1
,
��1 2
-
��3 4
written
��4 ;
)
��; <
;
��< =
}
�� 	
public
�� 
void
�� 
Append
�� 
(
�� 
T
�� 
record
�� #
)
��# $
{
�� 	
if
�� 
(
�� 
CsvFile
�� 
.
�� 
UseTasks
��  
)
��  !
{
�� 
var
�� 
linesWaiting
��  
=
��! "
Interlocked
��# .
.
��. /
	Increment
��/ 8
(
��8 9
ref
��9 <
this
��= A
.
��A B
linesToWrite
��B N
)
��N O
;
��O P
Action
�� 
<
�� 
Task
�� 
>
�� 
	addRecord
�� &
=
��' (
(
��) *
t
��* +
)
��+ ,
=>
��- /
{
�� 
var
�� 
csvLine
�� 
=
��  !
this
��" &
.
��& '
ToCsv
��' ,
(
��, -
record
��- 3
)
��3 4
;
��4 5
this
�� 
.
�� 
csvLinesToWrite
�� (
.
��( )
Add
��) ,
(
��, -
csvLine
��- 4
)
��4 5
;
��5 6
}
�� 
;
�� 
if
�� 
(
�� 
linesWaiting
��  
<
��! "
$num
��# (
)
��( )
this
�� 
.
�� 
addAsyncTask
�� %
=
��& '
this
��( ,
.
��, -
addAsyncTask
��- 9
.
��9 :
ContinueWith
��: F
(
��F G
	addRecord
��G P
)
��P Q
;
��Q R
else
�� 
	addRecord
�� 
(
�� 
null
�� "
)
��" #
;
��# $
}
�� 
else
�� 
{
�� 
var
�� 
csvLine
�� 
=
�� 
this
�� "
.
��" #
ToCsv
��# (
(
��( )
record
��) /
)
��/ 0
;
��0 1
this
�� 
.
�� 
streamWriter
�� !
.
��! "
	WriteLine
��" +
(
��+ ,
csvLine
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 	
private
�� 
static
�� 
Func
�� 
<
�� 
T
�� 
,
�� 
object
�� %
>
��% &

FindGetter
��' 1
(
��1 2
string
��2 8
c
��9 :
,
��: ;
bool
��< @
staticMember
��A M
)
��M N
{
�� 	
var
�� 
flags
�� 
=
�� 
BindingFlags
�� $
.
��$ %
Public
��% +
|
��, -
BindingFlags
��. :
.
��: ;
	NonPublic
��; D
|
��E F
BindingFlags
��G S
.
��S T

IgnoreCase
��T ^
|
��_ `
(
��a b
staticMember
��b n
?
��o p
BindingFlags
��q }
.
��} ~
Static��~ �
:��� �
BindingFlags��� �
.��� �
Instance��� �
)��� �
;��� �
Func
�� 
<
�� 
T
�� 
,
�� 
object
�� 
>
�� 
func
��  
=
��! "
null
��# '
;
��' (
PropertyInfo
�� 
pi
�� 
=
�� 
typeof
�� $
(
��$ %
T
��% &
)
��& '
.
��' (
GetProperty
��( 3
(
��3 4
c
��4 5
,
��5 6
flags
��7 <
)
��< =
;
��= >
	FieldInfo
�� 
fi
�� 
=
�� 
typeof
�� !
(
��! "
T
��" #
)
��# $
.
��$ %
GetField
��% -
(
��- .
c
��. /
,
��/ 0
flags
��1 6
)
��6 7
;
��7 8
if
�� 
(
�� 
CsvFile
�� 
.
�� 

UseLambdas
�� "
)
��" #
{
�� 

Expression
�� 
expr
�� 
=
��  !
null
��" &
;
��& '!
ParameterExpression
�� #
	parameter
��$ -
=
��. /

Expression
��0 :
.
��: ;
	Parameter
��; D
(
��D E
typeof
��E K
(
��K L
T
��L M
)
��M N
,
��N O
$str
��P S
)
��S T
;
��T U
Type
�� 
type
�� 
=
�� 
null
��  
;
��  !
if
�� 
(
�� 
pi
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
type
�� 
=
�� 
pi
�� 
.
�� 
PropertyType
�� *
;
��* +
expr
�� 
=
�� 

Expression
�� %
.
��% &
Property
��& .
(
��. /
	parameter
��/ 8
,
��8 9
pi
��: <
.
��< =
Name
��= A
)
��A B
;
��B C
}
�� 
else
�� 
if
�� 
(
�� 
fi
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
type
�� 
=
�� 
fi
�� 
.
�� 
	FieldType
�� '
;
��' (
expr
�� 
=
�� 

Expression
�� %
.
��% &
Field
��& +
(
��+ ,
	parameter
��, 5
,
��5 6
fi
��7 9
.
��9 :
Name
��: >
)
��> ?
;
��? @
}
�� 
if
�� 
(
�� 
expr
�� 
!=
�� 
null
��  
)
��  !
{
�� 

Expression
�� 
<
�� 
Func
�� #
<
��# $
T
��$ %
,
��% &
object
��' -
>
��- .
>
��. /
lambda
��0 6
;
��6 7
if
�� 
(
�� 
type
�� 
.
�� 
IsValueType
�� (
)
��( )
{
�� 
lambda
�� 
=
��  

Expression
��! +
.
��+ ,
Lambda
��, 2
<
��2 3
Func
��3 7
<
��7 8
T
��8 9
,
��9 :
object
��; A
>
��A B
>
��B C
(
��C D

Expression
��D N
.
��N O
TypeAs
��O U
(
��U V
expr
��V Z
,
��Z [
typeof
��\ b
(
��b c
object
��c i
)
��i j
)
��j k
,
��k l
	parameter
��m v
)
��v w
;
��w x
}
�� 
else
�� 
{
�� 
lambda
�� 
=
��  

Expression
��! +
.
��+ ,
Lambda
��, 2
<
��2 3
Func
��3 7
<
��7 8
T
��8 9
,
��9 :
object
��; A
>
��A B
>
��B C
(
��C D
expr
��D H
,
��H I
	parameter
��J S
)
��S T
;
��T U
}
�� 
func
�� 
=
�� 
lambda
�� !
.
��! "
Compile
��" )
(
��) *
)
��* +
;
��+ ,
}
�� 
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
pi
�� 
!=
�� 
null
�� 
)
�� 
func
�� 
=
�� 
o
�� 
=>
�� 
pi
��  "
.
��" #
GetValue
��# +
(
��+ ,
o
��, -
,
��- .
null
��/ 3
)
��3 4
;
��4 5
else
�� 
if
�� 
(
�� 
fi
�� 
!=
�� 
null
�� #
)
��# $
func
�� 
=
�� 
o
�� 
=>
�� 
fi
��  "
.
��" #
GetValue
��# +
(
��+ ,
o
��, -
)
��- .
;
��. /
}
�� 
return
�� 
func
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
CreateGetters
�� "
(
��" #
)
��# $
{
�� 	
var
�� 
list
�� 
=
�� 
new
�� 
List
�� 
<
��  
Func
��  $
<
��$ %
T
��% &
,
��& '
object
��( .
>
��. /
>
��/ 0
(
��0 1
)
��1 2
;
��2 3
foreach
�� 
(
�� 
var
�� 

columnName
�� #
in
��$ &
columns
��' .
)
��. /
{
�� 
Func
�� 
<
�� 
T
�� 
,
�� 
Object
�� 
>
�� 
func
��  $
=
��% &
null
��' +
;
��+ ,
var
�� 
propertyName
��  
=
��! "
(
��# $

columnName
��$ .
.
��. /
IndexOf
��/ 6
(
��6 7
$char
��7 :
)
��: ;
<
��< =
$num
��> ?
?
��@ A

columnName
��B L
:
��M N

columnName
��O Y
.
��Y Z
Replace
��Z a
(
��a b
$str
��b e
,
��e f
$str
��g i
)
��i j
)
��j k
;
��k l
func
�� 
=
�� 

FindGetter
�� !
(
��! "

columnName
��" ,
,
��, -
false
��. 3
)
��3 4
??
��5 7

FindGetter
��8 B
(
��B C

columnName
��C M
,
��M N
true
��O S
)
��S T
;
��T U
list
�� 
.
�� 
Add
�� 
(
�� 
func
�� 
)
�� 
;
�� 
}
�� 
this
�� 
.
�� 
getters
�� 
=
�� 
list
�� 
.
��  
ToArray
��  '
(
��' (
)
��( )
;
��) *
}
�� 	
private
�� 
string
�� 
ToCsv
�� 
(
�� 
T
�� 
record
�� %
)
��% &
{
�� 	
if
�� 
(
�� 
record
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
$str
��, <
,
��< =
$str
��> F
)
��F G
;
��G H
string
�� 
[
�� 
]
�� 

csvStrings
�� 
=
��  !
new
��" %
string
��& ,
[
��, -
getters
��- 4
.
��4 5
Length
��5 ;
]
��; <
;
��< =
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
getters
��  '
.
��' (
Length
��( .
;
��. /
i
��0 1
++
��1 3
)
��3 4
{
�� 
var
�� 
getter
�� 
=
�� 
getters
�� $
[
��$ %
i
��% &
]
��& '
;
��' (
object
�� 

fieldValue
�� !
=
��" #
getter
��$ *
==
��+ -
null
��. 2
?
��3 4
null
��5 9
:
��: ;
getter
��< B
(
��B C
record
��C I
)
��I J
;
��J K

csvStrings
�� 
[
�� 
i
�� 
]
�� 
=
�� 
this
��  $
.
��$ %
ToCsvString
��% 0
(
��0 1

fieldValue
��1 ;
)
��; <
;
��< =
}
�� 
return
�� 
string
�� 
.
�� 
Join
�� 
(
�� 
this
�� #
.
��# $$
fieldSeparatorAsString
��$ :
,
��: ;

csvStrings
��< F
)
��F G
;
��G H
}
�� 	
private
�� 
string
�� 
ToCsvString
�� "
(
��" #
object
��# )
o
��* +
)
��+ ,
{
�� 	
if
�� 
(
�� 
o
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
string
�� 
valueString
�� "
=
��# $
o
��% &
as
��' )
string
��* 0
??
��1 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
o
��E F
,
��F G
CultureInfo
��H S
.
��S T
CurrentUICulture
��T d
)
��d e
;
��e f
if
�� 
(
�� 
RequiresQuotes
�� "
(
��" #
valueString
��# .
)
��. /
)
��/ 0
{
�� 
var
�� 
csvLine
�� 
=
��  !
new
��" %
StringBuilder
��& 3
(
��3 4
)
��4 5
;
��5 6
csvLine
�� 
.
�� 
Append
�� "
(
��" #
this
��# '
.
��' (
textQualifier
��( 5
)
��5 6
;
��6 7
foreach
�� 
(
�� 
char
�� !
c
��" #
in
��$ &
valueString
��' 2
)
��2 3
{
�� 
if
�� 
(
�� 
c
�� 
==
��  
this
��! %
.
��% &
textQualifier
��& 3
)
��3 4
csvLine
�� #
.
��# $
Append
��$ *
(
��* +
c
��+ ,
)
��, -
;
��- .
csvLine
�� 
.
��  
Append
��  &
(
��& '
c
��' (
)
��( )
;
��) *
}
�� 
csvLine
�� 
.
�� 
Append
�� "
(
��" #
this
��# '
.
��' (
textQualifier
��( 5
)
��5 6
;
��6 7
return
�� 
csvLine
�� "
.
��" #
ToString
��# +
(
��+ ,
)
��, -
;
��- .
}
�� 
else
�� 
return
�� 
valueString
�� &
;
��& '
}
�� 
return
�� 
string
�� 
.
�� 
Empty
�� 
;
��  
}
�� 	
private
�� 
bool
�� 
RequiresQuotes
�� #
(
��# $
string
��$ *
valueString
��+ 6
)
��6 7
{
�� 	
if
�� 
(
�� 
CsvFile
�� 
.
�� 
FastIndexOfAny
�� &
)
��& '
{
�� 
var
�� 
len
�� 
=
�� 
valueString
�� %
.
��% &
Length
��& ,
;
��, -
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #
len
��$ '
;
��' (
i
��) *
++
��* ,
)
��, -
{
�� 
char
�� 
c
�� 
=
�� 
valueString
�� (
[
��( )
i
��) *
]
��* +
;
��+ ,
if
�� 
(
�� 
c
�� 
<=
�� 
$num
��  
&&
��! #
this
��$ (
.
��( )#
isInvalidCharInFields
��) >
[
��> ?
c
��? @
]
��@ A
)
��A B
return
�� 
true
�� #
;
��# $
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
valueString
�� "
.
��" #

IndexOfAny
��# -
(
��- .
this
��. 2
.
��2 3"
invalidCharsInFields
��3 G
)
��G H
>=
��I K
$num
��L M
;
��M N
}
�� 
}
�� 	
private
�� 
void
�� 
WriteHeader
��  
(
��  !
)
��! "
{
�� 	
var
�� 
csvLine
�� 
=
�� 
new
�� 
StringBuilder
�� +
(
��+ ,
)
��, -
;
��- .
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
this
��  $
.
��$ %
columns
��% ,
.
��, -
Length
��- 3
;
��3 4
i
��5 6
++
��6 8
)
��8 9
{
�� 
if
�� 
(
�� 
i
�� 
>
�� 
$num
�� 
)
�� 
csvLine
�� 
.
�� 
Append
�� "
(
��" #
this
��# '
.
��' (
fieldSeparator
��( 6
)
��6 7
;
��7 8
csvLine
�� 
.
�� 
Append
�� 
(
�� 
this
�� #
.
��# $
ToCsvString
��$ /
(
��/ 0
this
��0 4
.
��4 5
columns
��5 <
[
��< =
i
��= >
]
��> ?
)
��? @
)
��@ A
;
��A B
}
�� 
this
�� 
.
�� 
streamWriter
�� 
.
�� 
	WriteLine
�� '
(
��' (
csvLine
��( /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
)
��: ;
;
��; <
}
�� 	
}
�� 
internal
�� 
class
�� 
CsvFileReader
��  
<
��  !
T
��! "
>
��" #
:
��$ %
CsvFile
��& -
,
��- .
IEnumerable
��/ :
<
��: ;
T
��; <
>
��< =
,
��= >
IEnumerator
��? J
<
��J K
T
��K L
>
��L M
where
�� 

T
�� 
:
�� 
new
�� 
(
�� 
)
�� 
{
�� 
private
�� 
readonly
�� 

Dictionary
�� #
<
��# $
Type
��$ (
,
��( )
List
��* .
<
��. /
Action
��/ 5
<
��5 6
T
��6 7
,
��7 8
String
��9 ?
>
��? @
>
��@ A
>
��A B

allSetters
��C M
=
��N O
new
��P S

Dictionary
��T ^
<
��^ _
Type
��_ c
,
��c d
List
��e i
<
��i j
Action
��j p
<
��p q
T
��q r
,
��r s
String
��t z
>
��z {
>
��{ |
>
��| }
(
��} ~
)
��~ 
;�� �
private
�� 
string
�� 
[
�� 
]
�� 
columns
��  
;
��  !
private
�� 
char
�� 
curChar
�� 
;
�� 
private
�� 
int
�� 
len
�� 
;
�� 
private
�� 
string
�� 
line
�� 
;
�� 
private
�� 
int
�� 
pos
�� 
;
�� 
private
�� 
T
�� 
record
�� 
;
�� 
private
�� 
readonly
�� 
char
�� 
fieldSeparator
�� ,
;
��, -
private
�� 
readonly
�� 

TextReader
�� #

textReader
��$ .
;
��. /
private
�� 
readonly
�� 
char
�� 
textQualifier
�� +
;
��+ ,
private
�� 
readonly
�� 
StringBuilder
�� &
parseFieldResult
��' 7
=
��8 9
new
��: =
StringBuilder
��> K
(
��K L
)
��L M
;
��M N
public
�� 
CsvFileReader
�� 
(
�� 
	CsvSource
�� &
	csvSource
��' 0
)
��0 1
:
�� 
this
�� 
(
�� 
	csvSource
�� 
,
�� 
null
�� "
)
��" #
{
�� 	
}
�� 	
public
�� 
CsvFileReader
�� 
(
�� 
	CsvSource
�� &
	csvSource
��' 0
,
��0 1
CsvDefinition
��2 ?
csvDefinition
��@ M
)
��M N
{
�� 	
var
�� 
streamReader
�� 
=
�� 
	csvSource
�� (
.
��( )

TextReader
��) 3
as
��4 6
StreamReader
��7 C
;
��C D
if
�� 
(
�� 
streamReader
�� 
!=
�� 
null
��  $
)
��$ %
this
�� 
.
�� 

BaseStream
�� 
=
��  !
streamReader
��" .
.
��. /

BaseStream
��/ 9
;
��9 :
if
�� 
(
�� 
csvDefinition
�� 
==
��  
null
��! %
)
��% &
csvDefinition
�� 
=
�� "
DefaultCsvDefinition
��  4
;
��4 5
this
�� 
.
�� 
fieldSeparator
�� 
=
��  !
csvDefinition
��" /
.
��/ 0
FieldSeparator
��0 >
;
��> ?
this
�� 
.
�� 
textQualifier
�� 
=
��  
csvDefinition
��! .
.
��. /
TextQualifier
��/ <
;
��< =
this
�� 
.
�� 

textReader
�� 
=
�� 
	csvSource
�� '
.
��' (

TextReader
��( 2
;
��2 3
this
�� 
.
�� 

ReadHeader
�� 
(
�� 
csvDefinition
�� )
.
��) *
Header
��* 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
T
�� 
Current
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
this
�� 
.
�� 
record
�� $
;
��$ %
}
��& '
}
�� 	
public
�� 
bool
�� 
Eof
�� 
{
�� 	
get
�� 
{
�� 
return
�� 
this
�� 
.
�� 
line
�� "
==
��# %
null
��& *
;
��* +
}
��, -
}
�� 	
object
�� 
IEnumerator
�� 
.
�� 
Current
�� "
{
�� 	
get
�� 
{
�� 
return
�� 
this
�� 
.
�� 
Current
�� %
;
��% &
}
��' (
}
�� 	
	protected
�� 
override
�� 
void
�� 
Dispose
��  '
(
��' (
bool
��( ,
	disposing
��- 6
)
��6 7
{
�� 	
if
�� 
(
�� 
	disposing
�� 
)
�� 
{
�� 
this
�� 
.
�� 

textReader
�� 
.
��  
Dispose
��  '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
IEnumerator
�� 
IEnumerable
�� 
.
��  
GetEnumerator
��  -
(
��- .
)
��. /
{
�� 	
return
�� 
this
�� 
.
�� 
GetEnumerator
�� %
(
��% &
)
��& '
;
��' (
}
�� 	
public
�� 
IEnumerator
�� 
<
�� 
T
�� 
>
�� 
GetEnumerator
�� +
(
��+ ,
)
��, -
{
�� 	
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
MoveNext
�� 
(
�� 
)
�� 
{
�� 	
this
�� 
.
�� 
ReadNextLine
�� 
(
�� 
)
�� 
;
��  
if
�� 
(
�� 
this
�� 
.
�� 
line
�� 
==
�� 
null
�� !
&&
��" $
(
��% &
this
��& *
.
��* +
line
��+ /
=
��0 1
this
��2 6
.
��6 7

textReader
��7 A
.
��A B
ReadLine
��B J
(
��J K
)
��K L
)
��L M
==
��N P
null
��Q U
)
��U V
{
�� 
this
�� 
.
�� 
record
�� 
=
�� 
default
�� %
(
��% &
T
��& '
)
��' (
;
��( )
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
record
�� 
=
�� 
new
�� !
T
��" #
(
��# $
)
��$ %
;
��% &
Type
�� 

recordType
�� 
=
��  !
typeof
��" (
(
��( )
T
��) *
)
��* +
;
��+ ,
List
�� 
<
�� 
Action
�� 
<
�� 
T
�� 
,
�� 
String
�� %
>
��% &
>
��& '
setters
��( /
;
��/ 0
if
�� 
(
�� 
!
�� 
this
�� 
.
�� 

allSetters
�� $
.
��$ %
TryGetValue
��% 0
(
��0 1

recordType
��1 ;
,
��; <
out
��= @
setters
��A H
)
��H I
)
��I J
{
�� 
setters
�� 
=
�� 
this
�� "
.
��" #
CreateSetters
��# 0
(
��0 1
)
��1 2
;
��2 3
this
�� 
.
�� 

allSetters
�� #
[
��# $

recordType
��$ .
]
��. /
=
��0 1
setters
��2 9
;
��9 :
}
�� 
var
�� 
fieldValues
�� 
=
��  !
new
��" %
string
��& ,
[
��, -
setters
��- 4
.
��4 5
Count
��5 :
]
��: ;
;
��; <
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #
setters
��$ +
.
��+ ,
Count
��, 1
;
��1 2
i
��3 4
++
��4 6
)
��6 7
{
�� 
fieldValues
�� 
[
��  
i
��  !
]
��! "
=
��# $
this
��% )
.
��) *

ParseField
��* 4
(
��4 5
)
��5 6
;
��6 7
if
�� 
(
�� 
this
�� 
.
�� 
curChar
�� $
==
��% '
this
��( ,
.
��, -
fieldSeparator
��- ;
)
��; <
this
�� 
.
�� 
NextChar
�� %
(
��% &
)
��& '
;
��' (
else
�� 
break
�� 
;
�� 
}
�� 
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #
setters
��$ +
.
��+ ,
Count
��, 1
;
��1 2
i
��3 4
++
��4 6
)
��6 7
{
�� 
var
�� 
setter
�� 
=
��  
setters
��! (
[
��( )
i
��) *
]
��* +
;
��+ ,
if
�� 
(
�� 
setter
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
setter
�� 
(
�� 
this
�� #
.
��# $
record
��$ *
,
��* +
fieldValues
��, 7
[
��7 8
i
��8 9
]
��9 :
)
��: ;
;
��; <
}
�� 
}
�� 
}
�� 
return
�� 
(
�� 
this
�� 
.
�� 
record
�� 
!=
��  "
null
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
void
�� 
Reset
�� 
(
�� 
)
�� 
{
�� 	
throw
�� 
new
�� %
NotImplementedException
�� -
(
��- .
$str
��. W
)
��W X
;
��X Y
}
�� 	
private
�� 
static
�� 
Action
�� 
<
�� 
T
�� 
,
��  
string
��! '
>
��' ( 
EmitSetValueAction
��) ;
(
��; <

MemberInfo
��< F
mi
��G I
,
��I J
Func
��K O
<
��O P
string
��P V
,
��V W
object
��X ^
>
��^ _
func
��` d
)
��d e
{
�� 	!
ParameterExpression
�� 
paramExpObj
��  +
=
��, -

Expression
��. 8
.
��8 9
	Parameter
��9 B
(
��B C
typeof
��C I
(
��I J
object
��J P
)
��P Q
,
��Q R
$str
��S X
)
��X Y
;
��Y Z!
ParameterExpression
�� 
	paramExpT
��  )
=
��* +

Expression
��, 6
.
��6 7
	Parameter
��7 @
(
��@ A
typeof
��A G
(
��G H
T
��H I
)
��I J
,
��J K
$str
��L V
)
��V W
;
��W X
{
�� 
var
�� 
pi
�� 
=
�� 
mi
�� 
as
�� 
PropertyInfo
�� +
;
��+ ,
if
�� 
(
�� 
pi
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� 
CsvFile
�� 
.
��  

UseLambdas
��  *
)
��* +
{
�� 
var
�� 
callExpr
�� $
=
��% &

Expression
��' 1
.
��1 2
Call
��2 6
(
��6 7
	paramExpT
�� %
,
��% &
pi
�� 
.
�� 
GetSetMethod
�� +
(
��+ ,
)
��, -
,
��- .

Expression
�� &
.
��& '
ConvertChecked
��' 5
(
��5 6
paramExpObj
��6 A
,
��A B
pi
��C E
.
��E F
PropertyType
��F R
)
��R S
)
��S T
;
��T U
var
�� 
setter
�� "
=
��# $

Expression
��% /
.
��/ 0
Lambda
��0 6
<
��6 7
Action
��7 =
<
��= >
T
��> ?
,
��? @
object
��A G
>
��G H
>
��H I
(
��I J
callExpr
�� $
,
��$ %
	paramExpT
�� %
,
��% &
paramExpObj
�� '
)
��' (
.
��( )
Compile
��) 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
(
��  
o
��  !
,
��! "
s
��# $
)
��$ %
=>
��& (
setter
��) /
(
��/ 0
o
��0 1
,
��1 2
func
��3 7
(
��7 8
s
��8 9
)
��9 :
)
��: ;
;
��; <
}
�� 
return
�� 
(
�� 
o
�� 
,
�� 
v
��  
)
��  !
=>
��" $
pi
��% '
.
��' (
SetValue
��( 0
(
��0 1
o
��1 2
,
��2 3
(
��4 5
object
��5 ;
)
��; <
func
��< @
(
��@ A
v
��A B
)
��B C
,
��C D
null
��E I
)
��I J
;
��J K
}
�� 
}
�� 
{
�� 
var
�� 
fi
�� 
=
�� 
mi
�� 
as
�� 
	FieldInfo
�� (
;
��( )
if
�� 
(
�� 
fi
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� 
CsvFile
�� 
.
��  

UseLambdas
��  *
)
��* +
{
�� 
var
�� 
valueExp
�� $
=
��% &

Expression
��' 1
.
��1 2
ConvertChecked
��2 @
(
��@ A
paramExpObj
��A L
,
��L M
fi
��N P
.
��P Q
	FieldType
��Q Z
)
��Z [
;
��[ \
MemberExpression
�� (
fieldExp
��) 1
=
��2 3

Expression
��4 >
.
��> ?
Field
��? D
(
��D E
	paramExpT
��E N
,
��N O
fi
��P R
)
��R S
;
��S T
BinaryExpression
�� (
	assignExp
��) 2
=
��3 4

Expression
��5 ?
.
��? @
Assign
��@ F
(
��F G
fieldExp
��G O
,
��O P
valueExp
��Q Y
)
��Y Z
;
��Z [
var
�� 
setter
�� "
=
��# $

Expression
��% /
.
��/ 0
Lambda
��0 6
<
��6 7
Action
��7 =
<
��= >
T
��> ?
,
��? @
object
��A G
>
��G H
>
��H I
(
�� 
	assignExp
�� &
,
��& '
	paramExpT
��( 1
,
��1 2
paramExpObj
��3 >
)
��> ?
.
��? @
Compile
��@ G
(
��G H
)
��H I
;
��I J
return
�� 
(
��  
o
��  !
,
��! "
s
��# $
)
��$ %
=>
��& (
setter
��) /
(
��/ 0
o
��0 1
,
��1 2
func
��3 7
(
��7 8
s
��8 9
)
��9 :
)
��: ;
;
��; <
}
�� 
return
�� 
(
�� 
(
�� 
o
�� 
,
�� 
v
��  !
)
��! "
=>
��# %
fi
��& (
.
��( )
SetValue
��) 1
(
��1 2
o
��2 3
,
��3 4
func
��5 9
(
��9 :
v
��: ;
)
��; <
)
��< =
)
��= >
;
��> ?
}
�� 
}
�� 
throw
�� 
new
�� %
NotImplementedException
�� -
(
��- .
)
��. /
;
��/ 0
}
�� 	
private
�� 
static
�� 
Action
�� 
<
�� 
T
�� 
,
��  
string
��! '
>
��' (

FindSetter
��) 3
(
��3 4
string
��4 :
c
��; <
,
��< =
bool
��> B
staticMember
��C O
)
��O P
{
�� 	
var
�� 
flags
�� 
=
�� 
BindingFlags
�� $
.
��$ %
Public
��% +
|
��, -
BindingFlags
��. :
.
��: ;
	NonPublic
��; D
|
��E F
BindingFlags
��G S
.
��S T

IgnoreCase
��T ^
|
��_ `
(
��a b
staticMember
��b n
?
��o p
BindingFlags
��q }
.
��} ~
Static��~ �
:��� �
BindingFlags��� �
.��� �
Instance��� �
)��� �
;��� �
Action
�� 
<
�� 
T
�� 
,
�� 
string
�� 
>
�� 
action
�� $
=
��% &
null
��' +
;
��+ ,
PropertyInfo
�� 
pi
�� 
=
�� 
typeof
�� $
(
��$ %
T
��% &
)
��& '
.
��' (
GetProperty
��( 3
(
��3 4
c
��4 5
,
��5 6
flags
��7 <
)
��< =
;
��= >
if
�� 
(
�� 
pi
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
var
�� 
pFunc
�� 
=
�� 
StringToObject
�� *
(
��* +
pi
��+ -
.
��- .
PropertyType
��. :
)
��: ;
;
��; <
action
�� 
=
��  
EmitSetValueAction
�� +
(
��+ ,
pi
��, .
,
��. /
pFunc
��0 5
)
��5 6
;
��6 7
}
�� 
	FieldInfo
�� 
fi
�� 
=
�� 
typeof
�� !
(
��! "
T
��" #
)
��# $
.
��$ %
GetField
��% -
(
��- .
c
��. /
,
��/ 0
flags
��1 6
)
��6 7
;
��7 8
if
�� 
(
�� 
fi
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
var
�� 
fFunc
�� 
=
�� 
StringToObject
�� *
(
��* +
fi
��+ -
.
��- .
	FieldType
��. 7
)
��7 8
;
��8 9
action
�� 
=
��  
EmitSetValueAction
�� +
(
��+ ,
fi
��, .
,
��. /
fFunc
��0 5
)
��5 6
;
��6 7
}
�� 
return
�� 
action
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
Func
�� 
<
�� 
string
�� "
,
��" #
object
��$ *
>
��* +
StringToObject
��, :
(
��: ;
Type
��; ?
propertyType
��@ L
)
��L M
{
�� 	
if
�� 
(
�� 
propertyType
�� 
==
�� 
typeof
��  &
(
��& '
string
��' -
)
��- .
)
��. /
return
�� 
(
�� 
s
�� 
)
�� 
=>
�� 
s
�� 
??
��  "
String
��# )
.
��) *
Empty
��* /
;
��/ 0
else
�� 
if
�� 
(
�� 
propertyType
�� !
==
��" $
typeof
��% +
(
��+ ,
Int32
��, 1
)
��1 2
)
��2 3
return
�� 
(
�� 
s
�� 
)
�� 
=>
�� 
String
�� $
.
��$ %
IsNullOrEmpty
��% 2
(
��2 3
s
��3 4
)
��4 5
?
��6 7
$num
��8 9
:
��: ;
Int32
��< A
.
��A B
Parse
��B G
(
��G H
s
��H I
)
��I J
;
��J K
if
�� 
(
�� 
propertyType
�� 
==
�� 
typeof
��  &
(
��& '
DateTime
��' /
)
��/ 0
)
��0 1
return
�� 
(
�� 
s
�� 
)
�� 
=>
�� 
String
�� $
.
��$ %
IsNullOrEmpty
��% 2
(
��2 3
s
��3 4
)
��4 5
?
��6 7
DateTimeZero
��8 D
:
��E F
DateTime
��G O
.
��O P
Parse
��P U
(
��U V
s
��V W
)
��W X
;
��X Y
else
�� 
throw
�� 
new
�� %
NotImplementedException
�� 1
(
��1 2
)
��2 3
;
��3 4
}
�� 	
private
�� 
List
�� 
<
�� 
Action
�� 
<
�� 
T
�� 
,
�� 
string
�� %
>
��% &
>
��& '
CreateSetters
��( 5
(
��5 6
)
��6 7
{
�� 	
var
�� 
list
�� 
=
�� 
new
�� 
List
�� 
<
��  
Action
��  &
<
��& '
T
��' (
,
��( )
string
��* 0
>
��0 1
>
��1 2
(
��2 3
)
��3 4
;
��4 5
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
this
��  $
.
��$ %
columns
��% ,
.
��, -
Length
��- 3
;
��3 4
i
��5 6
++
��6 8
)
��8 9
{
�� 
string
�� 

columnName
�� !
=
��" #
this
��$ (
.
��( )
columns
��) 0
[
��0 1
i
��1 2
]
��2 3
;
��3 4
Action
�� 
<
�� 
T
�� 
,
�� 
string
��  
>
��  !
action
��" (
=
��) *
null
��+ /
;
��/ 0
if
�� 
(
�� 

columnName
�� 
.
�� 
IndexOf
�� &
(
��& '
$char
��' *
)
��* +
>=
��, .
$num
��/ 0
)
��0 1

columnName
�� 
=
��  

columnName
��! +
.
��+ ,
Replace
��, 3
(
��3 4
$str
��4 7
,
��7 8
$str
��9 ;
)
��; <
;
��< =
action
�� 
=
�� 

FindSetter
�� #
(
��# $

columnName
��$ .
,
��. /
false
��0 5
)
��5 6
??
��7 9

FindSetter
��: D
(
��D E

columnName
��E O
,
��O P
true
��Q U
)
��U V
;
��V W
list
�� 
.
�� 
Add
�� 
(
�� 
action
�� 
)
��  
;
��  !
}
�� 
return
�� 
list
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
NextChar
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
this
�� 
.
�� 
pos
�� 
<
�� 
this
�� 
.
��  
len
��  #
)
��# $
{
�� 
this
�� 
.
�� 
pos
�� 
++
�� 
;
�� 
this
�� 
.
�� 
curChar
�� 
=
�� 
this
�� #
.
��# $
pos
��$ '
<
��( )
this
��* .
.
��. /
len
��/ 2
?
��3 4
this
��5 9
.
��9 :
line
��: >
[
��> ?
this
��? C
.
��C D
pos
��D G
]
��G H
:
��I J
$char
��K O
;
��O P
}
�� 
}
�� 	
private
�� 
void
�� 
ParseEndOfLine
�� #
(
��# $
)
��$ %
{
�� 	
throw
�� 
new
�� %
NotImplementedException
�� -
(
��- .
)
��. /
;
��/ 0
}
�� 	
private
�� 
string
�� 

ParseField
�� !
(
��! "
)
��" #
{
�� 	
parseFieldResult
�� 
.
�� 
Length
�� #
=
��$ %
$num
��& '
;
��' (
if
�� 
(
�� 
this
�� 
.
�� 
line
�� 
==
�� 
null
�� !
||
��" $
this
��% )
.
��) *
pos
��* -
>=
��. 0
this
��1 5
.
��5 6
len
��6 9
)
��9 :
return
�� 
null
�� 
;
�� 
while
�� 
(
�� 
this
�� 
.
�� 
curChar
�� 
==
��  "
$char
��# &
||
��' )
this
��* .
.
��. /
curChar
��/ 6
==
��7 9
$char
��: >
)
��> ?
{
�� 
this
�� 
.
�� 
NextChar
�� 
(
�� 
)
�� 
;
��  
}
�� 
if
�� 
(
�� 
this
�� 
.
�� 
curChar
�� 
==
�� 
this
��  $
.
��$ %
textQualifier
��% 2
)
��2 3
{
�� 
this
�� 
.
�� 
NextChar
�� 
(
�� 
)
�� 
;
��  
while
�� 
(
�� 
this
�� 
.
�� 
curChar
�� #
!=
��$ &
$num
��' (
)
��( )
{
�� 
if
�� 
(
�� 
this
�� 
.
�� 
curChar
�� $
==
��% '
this
��( ,
.
��, -
textQualifier
��- :
)
��: ;
{
�� 
this
�� 
.
�� 
NextChar
�� %
(
��% &
)
��& '
;
��' (
if
�� 
(
�� 
this
��  
.
��  !
curChar
��! (
==
��) +
this
��, 0
.
��0 1
textQualifier
��1 >
)
��> ?
{
�� 
this
��  
.
��  !
NextChar
��! )
(
��) *
)
��* +
;
��+ ,
parseFieldResult
�� ,
.
��, -
Append
��- 3
(
��3 4
this
��4 8
.
��8 9
textQualifier
��9 F
)
��F G
;
��G H
}
�� 
else
�� 
return
�� "
parseFieldResult
��# 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
;
��> ?
}
�� 
else
�� 
if
�� 
(
�� 
this
�� !
.
��! "
curChar
��" )
==
��* ,
$char
��- 1
)
��1 2
{
�� 
if
�� 
(
�� 
this
��  
.
��  !
line
��! %
==
��& (
null
��) -
)
��- .
return
�� "
parseFieldResult
��# 3
.
��3 4
ToString
��4 <
(
��< =
)
��= >
;
��> ?
this
�� 
.
�� 
ReadNextLine
�� )
(
��) *
)
��* +
;
��+ ,
}
�� 
else
�� 
{
�� 
parseFieldResult
�� (
.
��( )
Append
��) /
(
��/ 0
this
��0 4
.
��4 5
curChar
��5 <
)
��< =
;
��= >
this
�� 
.
�� 
NextChar
�� %
(
��% &
)
��& '
;
��' (
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
while
�� 
(
�� 
this
�� 
.
�� 
curChar
�� #
!=
��$ &
$num
��' (
&&
��) +
this
��, 0
.
��0 1
curChar
��1 8
!=
��9 ;
this
��< @
.
��@ A
fieldSeparator
��A O
&&
��P R
this
��S W
.
��W X
curChar
��X _
!=
��` b
$char
��c g
&&
��h j
this
��k o
.
��o p
curChar
��p w
!=
��x z
$char
��{ 
)�� �
{
�� 
parseFieldResult
�� $
.
��$ %
Append
��% +
(
��+ ,
this
��, 0
.
��0 1
curChar
��1 8
)
��8 9
;
��9 :
this
�� 
.
�� 
NextChar
�� !
(
��! "
)
��" #
;
��# $
}
�� 
}
�� 
return
�� 
parseFieldResult
�� #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
;
��. /
}
�� 	
private
�� 
void
�� 

ReadHeader
�� 
(
��  
string
��  &
header
��' -
)
��- .
{
�� 	
if
�� 
(
�� 
header
�� 
==
�� 
null
�� 
)
�� 
{
�� 
this
�� 
.
�� 
ReadNextLine
�� !
(
��! "
)
��" #
;
��# $
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
line
�� 
=
�� 
header
�� "
;
��" #
this
�� 
.
�� 
pos
�� 
=
�� 
-
�� 
$num
�� 
;
�� 
this
�� 
.
�� 
len
�� 
=
�� 
this
�� 
.
��  
line
��  $
.
��$ %
Length
��% +
;
��+ ,
this
�� 
.
�� 
NextChar
�� 
(
�� 
)
�� 
;
��  
}
�� 
var
�� 
readColumns
�� 
=
�� 
new
�� !
List
��" &
<
��& '
string
��' -
>
��- .
(
��. /
)
��/ 0
;
��0 1
string
�� 

columnName
�� 
;
�� 
while
�� 
(
�� 
(
�� 

columnName
�� 
=
��  
this
��! %
.
��% &

ParseField
��& 0
(
��0 1
)
��1 2
)
��2 3
!=
��4 6
null
��7 ;
)
��; <
{
�� 
readColumns
�� 
.
�� 
Add
�� 
(
��  

columnName
��  *
)
��* +
;
��+ ,
if
�� 
(
�� 
this
�� 
.
�� 
curChar
��  
==
��! #
this
��$ (
.
��( )
fieldSeparator
��) 7
)
��7 8
this
�� 
.
�� 
NextChar
�� !
(
��! "
)
��" #
;
��# $
else
�� 
break
�� 
;
�� 
}
�� 
this
�� 
.
�� 
columns
�� 
=
�� 
readColumns
�� &
.
��& '
ToArray
��' .
(
��. /
)
��/ 0
;
��0 1
}
�� 	
private
�� 
void
�� 
ReadNextLine
�� !
(
��! "
)
��" #
{
�� 	
this
�� 
.
�� 
line
�� 
=
�� 
this
�� 
.
�� 

textReader
�� '
.
��' (
ReadLine
��( 0
(
��0 1
)
��1 2
;
��2 3
this
�� 
.
�� 
pos
�� 
=
�� 
-
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
this
�� 
.
�� 
line
�� 
==
�� 
null
�� !
)
��! "
{
�� 
this
�� 
.
�� 
len
�� 
=
�� 
$num
�� 
;
�� 
this
�� 
.
�� 
curChar
�� 
=
�� 
$char
�� #
;
��# $
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
len
�� 
=
�� 
this
�� 
.
��  
line
��  $
.
��$ %
Length
��% +
;
��+ ,
this
�� 
.
�� 
NextChar
�� 
(
�� 
)
�� 
;
��  
}
�� 
}
�� 	
}
�� 
public
�� 

class
�� 
CsvDefinition
�� 
{
�� 
public
�� 
string
�� 
Header
�� 
{
�� 
get
�� "
;
��" #
set
��$ '
;
��' (
}
��) *
public
�� 
char
�� 
FieldSeparator
�� "
{
��# $
get
��% (
;
��( )
set
��* -
;
��- .
}
��/ 0
public
�� 
char
�� 
TextQualifier
�� !
{
��" #
get
��$ '
;
��' (
set
��) ,
;
��, -
}
��. /
public
�� 
IEnumerable
�� 
<
�� 
String
�� !
>
��! "
Columns
��# *
{
��+ ,
get
��- 0
;
��0 1
set
��2 5
;
��5 6
}
��7 8
public
�� 
string
�� 
	EndOfLine
�� 
{
��  !
get
��" %
;
��% &
set
��' *
;
��* +
}
��, -
public
�� 
CsvDefinition
�� 
(
�� 
)
�� 
{
�� 	
if
�� 
(
�� 
CsvFile
�� 
.
�� "
DefaultCsvDefinition
�� ,
!=
��- /
null
��0 4
)
��4 5
{
�� 
FieldSeparator
�� 
=
��  
CsvFile
��! (
.
��( )"
DefaultCsvDefinition
��) =
.
��= >
FieldSeparator
��> L
;
��L M
TextQualifier
�� 
=
�� 
CsvFile
��  '
.
��' ("
DefaultCsvDefinition
��( <
.
��< =
TextQualifier
��= J
;
��J K
	EndOfLine
�� 
=
�� 
CsvFile
�� #
.
��# $"
DefaultCsvDefinition
��$ 8
.
��8 9
	EndOfLine
��9 B
;
��B C
}
�� 
}
�� 	
}
�� 
public
�� 

class
�� 
	CsvSource
�� 
{
�� 
public
�� 
readonly
�� 

TextReader
�� "

TextReader
��# -
;
��- .
public
�� 
static
�� 
implicit
�� 
operator
�� '
	CsvSource
��( 1
(
��1 2
CsvFile
��2 9
csvFile
��: A
)
��A B
{
�� 	
return
�� 
new
�� 
	CsvSource
��  
(
��  !
csvFile
��! (
)
��( )
;
��) *
}
�� 	
public
�� 
static
�� 
implicit
�� 
operator
�� '
	CsvSource
��( 1
(
��1 2
string
��2 8
path
��9 =
)
��= >
{
�� 	
return
�� 
new
�� 
	CsvSource
��  
(
��  !
path
��! %
)
��% &
;
��& '
}
�� 	
public
�� 
static
�� 
implicit
�� 
operator
�� '
	CsvSource
��( 1
(
��1 2

TextReader
��2 <

textReader
��= G
)
��G H
{
�� 	
return
�� 
new
�� 
	CsvSource
��  
(
��  !

textReader
��! +
)
��+ ,
;
��, -
}
�� 	
public
�� 
	CsvSource
�� 
(
�� 

TextReader
�� #

textReader
��$ .
)
��. /
{
�� 	
this
�� 
.
�� 

TextReader
�� 
=
�� 

textReader
�� (
;
��( )
}
�� 	
public
�� 
	CsvSource
�� 
(
�� 
Stream
�� 
stream
��  &
)
��& '
{
�� 	
this
�� 
.
�� 

TextReader
�� 
=
�� 
new
�� !
StreamReader
��" .
(
��. /
stream
��/ 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
	CsvSource
�� 
(
�� 
string
�� 
path
��  $
)
��$ %
{
�� 	
this
�� 
.
�� 

TextReader
�� 
=
�� 
new
�� !
StreamReader
��" .
(
��. /
path
��/ 3
)
��3 4
;
��4 5
}
�� 	
public
�� 
	CsvSource
�� 
(
�� 
CsvFile
��  
csvFile
��! (
)
��( )
{
�� 	
this
�� 
.
�� 

TextReader
�� 
=
�� 
new
�� !
StreamReader
��" .
(
��. /
csvFile
��/ 6
.
��6 7

BaseStream
��7 A
)
��A B
;
��B C
}
�� 	
}
�� 
public
�� 

class
�� 
CsvDestination
�� 
{
�� 
private
�� 
StreamWriter
�� 
streamWriter
�� )
;
��) *
public
�� 
StreamWriter
�� 
StreamWriter
�� (
{
�� 	
get
�� 
{
�� 
return
�� 
streamWriter
�� %
;
��% &
}
��' (
}
�� 	
public
�� 
static
�� 
implicit
�� 
operator
�� '
CsvDestination
��( 6
(
��6 7
string
��7 =
path
��> B
)
��B C
{
�� 	
return
�� 
new
�� 
CsvDestination
�� %
(
��% &
path
��& *
)
��* +
;
��+ ,
}
�� 	
private
�� 
CsvDestination
�� 
(
�� 
StreamWriter
�� +
streamWriter
��, 8
)
��8 9
{
�� 	
this
�� 
.
�� 
streamWriter
�� 
=
�� 
streamWriter
��  ,
;
��, -
}
�� 	
private
�� 
CsvDestination
�� 
(
�� 
Stream
�� %
stream
��& ,
)
��, -
{
�� 	
this
�� 
.
�� 
streamWriter
�� 
=
�� 
new
��  #
StreamWriter
��$ 0
(
��0 1
stream
��1 7
)
��7 8
;
��8 9
}
�� 	
public
�� 
CsvDestination
�� 
(
�� 
string
�� $
fullName
��% -
)
��- .
{
�� 	
FixCsvFileName
�� 
(
�� 
ref
�� 
fullName
�� '
)
��' (
;
��( )
this
�� 
.
�� 
streamWriter
�� 
=
�� 
new
��  #
StreamWriter
��$ 0
(
��0 1
fullName
��1 9
)
��9 :
;
��: ;
}
�� 	
private
�� 
static
�� 
void
�� 
FixCsvFileName
�� *
(
��* +
ref
��+ .
string
��/ 5
fullName
��6 >
)
��> ?
{
�� 	
fullName
�� 
=
�� 
Path
�� 
.
�� 
GetFullPath
�� '
(
��' (
fullName
��( 0
)
��0 1
;
��1 2
var
�� 
path
�� 
=
�� 
Path
�� 
.
�� 
GetDirectoryName
�� ,
(
��, -
fullName
��- 5
)
��5 6
;
��6 7
if
�� 
(
�� 
path
�� 
!=
�� 
null
�� 
&&
�� 
!
��  !
	Directory
��! *
.
��* +
Exists
��+ 1
(
��1 2
path
��2 6
)
��6 7
)
��7 8
	Directory
�� 
.
�� 
CreateDirectory
�� )
(
��) *
path
��* .
)
��. /
;
��/ 0
if
�� 
(
�� 
!
�� 
String
�� 
.
�� 
Equals
�� 
(
�� 
Path
�� #
.
��# $
GetExtension
��$ 0
(
��0 1
fullName
��1 9
)
��9 :
,
��: ;
$str
��< B
)
��B C
)
��C D
fullName
�� 
+=
�� 
$str
�� "
;
��" #
}
�� 	
}
�� 
public
�� 

static
�� 
class
�� #
CsvFileLinqExtensions
�� -
{
�� 
public
�� 
static
�� 
void
�� 
ToCsv
��  
<
��  !
T
��! "
>
��" #
(
��# $
this
��$ (
IEnumerable
��) 4
<
��4 5
T
��5 6
>
��6 7
source
��8 >
,
��> ?
CsvDestination
��@ N
csvDestination
��O ]
)
��] ^
{
�� 	
source
�� 
.
�� 
ToCsv
�� 
(
�� 
csvDestination
�� '
,
��' (
null
��) -
)
��- .
;
��. /
}
�� 	
public
�� 
static
�� 
void
�� 
ToCsv
��  
<
��  !
T
��! "
>
��" #
(
��# $
this
��$ (
IEnumerable
��) 4
<
��4 5
T
��5 6
>
��6 7
source
��8 >
,
��> ?
CsvDestination
��@ N
csvDestination
��O ]
,
��] ^
CsvDefinition
��_ l
csvDefinition
��m z
)
��z {
{
�� 	
using
�� 
(
�� 
var
�� 
csvFile
�� 
=
��  
new
��! $
CsvFile
��% ,
<
��, -
T
��- .
>
��. /
(
��/ 0
csvDestination
��0 >
,
��> ?
csvDefinition
��@ M
)
��M N
)
��N O
{
�� 
foreach
�� 
(
�� 
var
�� 
record
�� #
in
��$ &
source
��' -
)
��- .
{
�� 
csvFile
�� 
.
�� 
Append
�� "
(
��" #
record
��# )
)
��) *
;
��* +
}
�� 
}
�� 
}
�� 	
}
�� 
public
�� 

class
�� (
CsvIgnorePropertyAttribute
�� +
:
��, -
	Attribute
��. 7
{
�� 
public
�� 
override
�� 
string
�� 
ToString
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
$str
�� $
;
��$ %
}
�� 	
}
�� 
}�� �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\EmailChecker.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{		 
public

 

class

 
EmailChecker

 
{ 
private 
static 
bool 
invalid #
=$ %
false& +
;+ ,
public 
static 
bool 
IsValidEmail '
(' (
string( .
strIn/ 4
)4 5
{ 	
invalid 
= 
false 
; 
if 
( 
string 
. 
IsNullOrEmpty $
($ %
strIn% *
)* +
)+ ,
return 
false 
; 
try 
{ 
strIn 
= 
Regex 
. 
Replace %
(% &
strIn& +
,+ ,
$str- 8
,8 9
DomainMapper: F
,F G
RegexOptions& 2
.2 3
None3 7
,7 8
TimeSpan9 A
.A B
FromMillisecondsB R
(R S
$numS V
)V W
)W X
;X Y
} 
catch 
( &
RegexMatchTimeoutException -
)- .
{ 
return 
false 
; 
} 
try   
{!! 
return"" 
Regex"" 
."" 
IsMatch"" $
(""$ %
strIn""% *
,""* +
$str## y
+##z {
$str$$ {
,$${ |
RegexOptions%% "
.%%" #

IgnoreCase%%# -
,%%- .
TimeSpan%%/ 7
.%%7 8
FromMilliseconds%%8 H
(%%H I
$num%%I L
)%%L M
)%%M N
;%%N O
}&& 
catch'' 
('' &
RegexMatchTimeoutException'' -
)''- .
{(( 
return)) 
false)) 
;)) 
}** 
}++ 	
private-- 
static-- 
string-- 
DomainMapper-- *
(--* +
Match--+ 0
match--1 6
)--6 7
{.. 	

IdnMapping00 
idn00 
=00 
new00  

IdnMapping00! +
(00+ ,
)00, -
;00- .
string22 

domainName22 
=22 
match22  %
.22% &
Groups22& ,
[22, -
$num22- .
]22. /
.22/ 0
Value220 5
;225 6
try33 
{44 

domainName55 
=55 
idn55  
.55  !
GetAscii55! )
(55) *

domainName55* 4
)554 5
;555 6
}66 
catch77 
(77 
ArgumentException77 $
)77$ %
{88 
invalid99 
=99 
true99 
;99 
}:: 
return;; 
match;; 
.;; 
Groups;; 
[;;  
$num;;  !
];;! "
.;;" #
Value;;# (
+;;) *

domainName;;+ 5
;;;5 6
}<< 	
}== 
}>> ��
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ExcelHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
ExcelHelper 
{ 
public 
static 
void "
GenerateTrackingReport 1
(1 2
CampaignReportVM2 B
modelC H
,H I
stringJ P
logoFilePathQ ]
,] ^
string_ e
imageFilePathf s
,s t
stringu {

outputFile	| �
)
� �
{ 	
string 

sourceFile 
= 
HttpContext  +
.+ ,
Current, 3
.3 4
Server4 :
.: ;
MapPath; B
(B C
$strC _
)_ `
;` a
File 
. 
Copy 
( 

sourceFile  
,  !

outputFile" ,
,, -
true. 2
)2 3
;3 4
try 
{ 
byte 
[ 
] 
	byteArray  
=! "
File# '
.' (
ReadAllBytes( 4
(4 5

outputFile5 ?
)? @
;@ A
using 
( 
MemoryStream #
stream$ *
=+ ,
new- 0
MemoryStream1 =
(= >
)> ?
)? @
{ 
stream 
. 
Write  
(  !
	byteArray! *
,* +
$num, -
,- .
(/ 0
int0 3
)3 4
	byteArray4 =
.= >
Length> D
)D E
;E F
using   
(   
SpreadsheetDocument   .
spreadSheet  / :
=  ; <
SpreadsheetDocument  = P
.  P Q
Open  Q U
(  U V
stream  V \
,  \ ]
true  ^ b
)  b c
)  c d
{!! 
WorkbookPart## $
workbookPart##% 1
=##2 3
spreadSheet##4 ?
.##? @
WorkbookPart##@ L
;##L M
IEnumerable$$ #
<$$# $
Sheet$$$ )
>$$) *
Sheets$$+ 1
=$$2 3
spreadSheet$$4 ?
.$$? @
WorkbookPart$$@ L
.$$L M
Workbook$$M U
.%% 
GetFirstChild%% *
<%%* +
Sheets%%+ 1
>%%1 2
(%%2 3
)%%3 4
.%%4 5
Elements%%5 =
<%%= >
Sheet%%> C
>%%C D
(%%D E
)%%E F
.&& 
Where&& "
(&&" #
s&&# $
=>&&% '
s&&( )
.&&) *
Name&&* .
==&&/ 1
$str&&2 B
)&&B C
;&&C D
if(( 
((( 
Sheets(( "
.((" #
Count((# (
(((( )
)(() *
==((+ -
$num((. /
)((/ 0
{)) 
throw** !
new**" %
	Exception**& /
(**/ 0
$str**0 ;
)**; <
;**< =
}++ 
string-- 
relationshipId-- -
=--. /
Sheets--0 6
.--6 7
First--7 <
(--< =
)--= >
.--> ?
Id--? A
.--A B
Value--B G
;--G H
WorksheetPart.. %
worksheetPart..& 3
=..4 5
(..6 7
WorksheetPart..7 D
)..D E
spreadSheet..E P
...P Q
WorkbookPart..Q ]
...] ^
GetPartById..^ i
(..i j
relationshipId..j x
)..x y
;..y z
AddImage22  
(22  !
worksheetPart22! .
,22. /
logoFilePath220 <
,22< =
$num22> ?
,22? @
$num22A B
)22B C
;22C D
AddImage33  
(33  !
worksheetPart33! .
,33. /
logoFilePath330 <
,33< =
$num33> @
,33@ A
$num33B C
)33C D
;33D E
Cell55 
cell55 !
=55" #
GetCell55$ +
(55+ ,
worksheetPart55, 9
.559 :
	Worksheet55: C
,55C D
$str55E H
,55H I
$num55J K
)55K L
;55L M
cell66 
.66 
	CellValue66 &
=66' (
new66) ,
	CellValue66- 6
(666 7
model667 <
.66< =
OrderNumber66= H
)66H I
;66I J
cell77 
.77 
DataType77 %
=77& '
new77( +
	EnumValue77, 5
<775 6

CellValues776 @
>77@ A
(77A B

CellValues77B L
.77L M
String77M S
)77S T
;77T U
cell99 
=99 
GetCell99 &
(99& '
worksheetPart99' 4
.994 5
	Worksheet995 >
,99> ?
$str99@ C
,99C D
$num99E F
)99F G
;99G H
cell:: 
.:: 
	CellValue:: &
=::' (
new::) ,
	CellValue::- 6
(::6 7
model::7 <
.::< =
	StartDate::= F
)::F G
;::G H
cell;; 
.;; 
DataType;; %
=;;& '
new;;( +
	EnumValue;;, 5
<;;5 6

CellValues;;6 @
>;;@ A
(;;A B

CellValues;;B L
.;;L M
String;;M S
);;S T
;;;T U
cell== 
=== 
GetCell== &
(==& '
worksheetPart==' 4
.==4 5
	Worksheet==5 >
,==> ?
$str==@ C
,==C D
$num==E G
)==G H
;==H I
cell>> 
.>> 
	CellValue>> &
=>>' (
new>>) ,
	CellValue>>- 6
(>>6 7
DateTime>>7 ?
.>>? @
Now>>@ C
.>>C D
ToString>>D L
(>>L M
StringConstants>>M \
.>>\ ]
DateFormatSlashes>>] n
)>>n o
)>>o p
;>>p q
cell?? 
.?? 
DataType?? %
=??& '
new??( +
	EnumValue??, 5
<??5 6

CellValues??6 @
>??@ A
(??A B

CellValues??B L
.??L M
String??M S
)??S T
;??T U
cellAA 
=AA 
GetCellAA &
(AA& '
worksheetPartAA' 4
.AA4 5
	WorksheetAA5 >
,AA> ?
$strAA@ C
,AAC D
$numAAE F
)AAF G
;AAG H
cellBB 
.BB 
	CellValueBB &
=BB' (
newBB) ,
	CellValueBB- 6
(BB6 7
modelBB7 <
.BB< =
CampaignNameBB= I
)BBI J
;BBJ K
cellCC 
.CC 
DataTypeCC %
=CC& '
newCC( +
	EnumValueCC, 5
<CC5 6

CellValuesCC6 @
>CC@ A
(CCA B

CellValuesCCB L
.CCL M
StringCCM S
)CCS T
;CCT U
cellFF 
=FF 
GetCellFF &
(FF& '
worksheetPartFF' 4
.FF4 5
	WorksheetFF5 >
,FF> ?
$strFF@ C
,FFC D
$numFFE G
)FFG H
;FFH I
cellGG 
.GG 
	CellValueGG &
=GG' (
newGG) ,
	CellValueGG- 6
(GG6 7
modelGG7 <
.GG< =
OpenedPercentageGG= M
)GGM N
;GGN O
cellHH 
.HH 
DataTypeHH %
=HH& '
newHH( +
	EnumValueHH, 5
<HH5 6

CellValuesHH6 @
>HH@ A
(HHA B

CellValuesHHB L
.HHL M
StringHHM S
)HHS T
;HHT U
cellJJ 
=JJ 
GetCellJJ &
(JJ& '
worksheetPartJJ' 4
.JJ4 5
	WorksheetJJ5 >
,JJ> ?
$strJJ@ C
,JJC D
$numJJE G
)JJG H
;JJH I
cellKK 
.KK 
	CellValueKK &
=KK' (
newKK) ,
	CellValueKK- 6
(KK6 7
modelKK7 <
.KK< =
QuantityKK= E
)KKE F
;KKF G
cellLL 
.LL 
DataTypeLL %
=LL& '
newLL( +
	EnumValueLL, 5
<LL5 6

CellValuesLL6 @
>LL@ A
(LLA B

CellValuesLLB L
.LLL M
StringLLM S
)LLS T
;LLT U
cellNN 
=NN 
GetCellNN &
(NN& '
worksheetPartNN' 4
.NN4 5
	WorksheetNN5 >
,NN> ?
$strNN@ C
,NNC D
$numNNE G
)NNG H
;NNH I
cellOO 
.OO 
	CellValueOO &
=OO' (
newOO) ,
	CellValueOO- 6
(OO6 7
modelOO7 <
.OO< =
OpenedOO= C
)OOC D
;OOD E
cellPP 
.PP 
DataTypePP %
=PP& '
newPP( +
	EnumValuePP, 5
<PP5 6

CellValuesPP6 @
>PP@ A
(PPA B

CellValuesPPB L
.PPL M
StringPPM S
)PPS T
;PPT U
cellSS 
=SS 
GetCellSS &
(SS& '
worksheetPartSS' 4
.SS4 5
	WorksheetSS5 >
,SS> ?
$strSS@ C
,SSC D
$numSSE G
)SSG H
;SSH I
cellTT 
.TT 
	CellValueTT &
=TT' (
newTT) ,
	CellValueTT- 6
(TT6 7
modelTT7 <
.TT< =
OpenedPercentageTT= M
)TTM N
;TTN O
cellUU 
.UU 
DataTypeUU %
=UU& '
newUU( +
	EnumValueUU, 5
<UU5 6

CellValuesUU6 @
>UU@ A
(UUA B

CellValuesUUB L
.UUL M
StringUUM S
)UUS T
;UUT U
cellWW 
=WW 
GetCellWW &
(WW& '
worksheetPartWW' 4
.WW4 5
	WorksheetWW5 >
,WW> ?
$strWW@ C
,WWC D
$numWWE G
)WWG H
;WWH I
cellXX 
.XX 
	CellValueXX &
=XX' (
newXX) ,
	CellValueXX- 6
(XX6 7
modelXX7 <
.XX< =
OpenedXX= C
)XXC D
;XXD E
cellYY 
.YY 
DataTypeYY %
=YY& '
newYY( +
	EnumValueYY, 5
<YY5 6

CellValuesYY6 @
>YY@ A
(YYA B

CellValuesYYB L
.YYL M
StringYYM S
)YYS T
;YYT U
cell\\ 
=\\ 
GetCell\\ &
(\\& '
worksheetPart\\' 4
.\\4 5
	Worksheet\\5 >
,\\> ?
$str\\@ C
,\\C D
$num\\E G
)\\G H
;\\H I
cell]] 
.]] 
	CellValue]] &
=]]' (
new]]) ,
	CellValue]]- 6
(]]6 7
model]]7 <
.]]< =
Clicked]]= D
)]]D E
;]]E F
cell^^ 
.^^ 
DataType^^ %
=^^& '
new^^( +
	EnumValue^^, 5
<^^5 6

CellValues^^6 @
>^^@ A
(^^A B

CellValues^^B L
.^^L M
String^^M S
)^^S T
;^^T U
cell`` 
=`` 
GetCell`` &
(``& '
worksheetPart``' 4
.``4 5
	Worksheet``5 >
,``> ?
$str``@ C
,``C D
$num``E G
)``G H
;``H I
cellaa 
.aa 
	CellValueaa &
=aa' (
newaa) ,
	CellValueaa- 6
(aa6 7
modelaa7 <
.aa< =
ClickedPercentageaa= N
)aaN O
;aaO P
cellbb 
.bb 
DataTypebb %
=bb& '
newbb( +
	EnumValuebb, 5
<bb5 6

CellValuesbb6 @
>bb@ A
(bbA B

CellValuesbbB L
.bbL M
StringbbM S
)bbS T
;bbT U
celldd 
=dd 
GetCelldd &
(dd& '
worksheetPartdd' 4
.dd4 5
	Worksheetdd5 >
,dd> ?
$strdd@ C
,ddC D
$numddE G
)ddG H
;ddH I
cellee 
.ee 
	CellValueee &
=ee' (
newee) ,
	CellValueee- 6
(ee6 7
modelee7 <
.ee< =
CTRPercentageee= J
)eeJ K
;eeK L
cellff 
.ff 
DataTypeff %
=ff& '
newff( +
	EnumValueff, 5
<ff5 6

CellValuesff6 @
>ff@ A
(ffA B

CellValuesffB L
.ffL M
StringffM S
)ffS T
;ffT U
cellii 
=ii 
GetCellii &
(ii& '
worksheetPartii' 4
.ii4 5
	Worksheetii5 >
,ii> ?
$strii@ C
,iiC D
$numiiE G
)iiG H
;iiH I
celljj 
.jj 
	CellValuejj &
=jj' (
newjj) ,
	CellValuejj- 6
(jj6 7
newjj7 :
Randomjj; A
(jjA B
)jjB C
.jjC D
NextjjD H
(jjH I
$numjjI J
,jjJ K
$numjjK M
)jjM N
.jjN O
ToStringjjO W
(jjW X
)jjX Y
)jjY Z
;jjZ [
cellkk 
.kk 
DataTypekk %
=kk& '
newkk( +
	EnumValuekk, 5
<kk5 6

CellValueskk6 @
>kk@ A
(kkA B

CellValueskkB L
.kkL M
StringkkM S
)kkS T
;kkT U
cellmm 
=mm 
GetCellmm &
(mm& '
worksheetPartmm' 4
.mm4 5
	Worksheetmm5 >
,mm> ?
$strmm@ C
,mmC D
$nummmE G
)mmG H
;mmH I
cellnn 
.nn 
	CellValuenn &
=nn' (
newnn) ,
	CellValuenn- 6
(nn6 7
newnn7 :
Randomnn; A
(nnA B
)nnB C
.nnC D
NextnnD H
(nnH I
$numnnI J
,nnJ K
$numnnL N
)nnN O
.nnO P
ToStringnnP X
(nnX Y
)nnY Z
)nnZ [
;nn[ \
celloo 
.oo 
DataTypeoo %
=oo& '
newoo( +
	EnumValueoo, 5
<oo5 6

CellValuesoo6 @
>oo@ A
(ooA B

CellValuesooB L
.ooL M
StringooM S
)ooS T
;ooT U
cellrr 
=rr 
GetCellrr &
(rr& '
worksheetPartrr' 4
.rr4 5
	Worksheetrr5 >
,rr> ?
$strrr@ C
,rrC D
$numrrE G
)rrG H
;rrH I
cellss 
.ss 
	CellValuess &
=ss' (
newss) ,
	CellValuess- 6
(ss6 7
modelss7 <
.ss< =
Desktopss= D
)ssD E
;ssE F
celltt 
.tt 
DataTypett %
=tt& '
newtt( +
	EnumValuett, 5
<tt5 6

CellValuestt6 @
>tt@ A
(ttA B

CellValuesttB L
.ttL M
StringttM S
)ttS T
;ttT U
cellvv 
=vv 
GetCellvv &
(vv& '
worksheetPartvv' 4
.vv4 5
	Worksheetvv5 >
,vv> ?
$strvv@ C
,vvC D
$numvvE G
)vvG H
;vvH I
cellww 
.ww 
	CellValueww &
=ww' (
newww) ,
	CellValueww- 6
(ww6 7
modelww7 <
.ww< =
Mobileww= C
)wwC D
;wwD E
cellxx 
.xx 
DataTypexx %
=xx& '
newxx( +
	EnumValuexx, 5
<xx5 6

CellValuesxx6 @
>xx@ A
(xxA B

CellValuesxxB L
.xxL M
StringxxM S
)xxS T
;xxT U
cell{{ 
={{ 
GetCell{{ &
({{& '
worksheetPart{{' 4
.{{4 5
	Worksheet{{5 >
,{{> ?
$str{{@ C
,{{C D
$num{{E G
){{G H
;{{H I
cell|| 
.|| 
	CellValue|| &
=||' (
new||) ,
	CellValue||- 6
(||6 7
model||7 <
.||< =
SubjectLine||= H
)||H I
;||I J
cell}} 
.}} 
DataType}} %
=}}& '
new}}( +
	EnumValue}}, 5
<}}5 6

CellValues}}6 @
>}}@ A
(}}A B

CellValues}}B L
.}}L M
String}}M S
)}}S T
;}}T U
cell 
= 
GetCell &
(& '
worksheetPart' 4
.4 5
	Worksheet5 >
,> ?
$str@ C
,C D
$numE G
)G H
;H I
cell
�� 
.
�� 
	CellValue
�� &
=
��' (
new
��) ,
	CellValue
��- 6
(
��6 7
model
��7 <
.
��< =
FromLine
��= E
)
��E F
;
��F G
cell
�� 
.
�� 
DataType
�� %
=
��& '
new
��( +
	EnumValue
��, 5
<
��5 6

CellValues
��6 @
>
��@ A
(
��A B

CellValues
��B L
.
��L M
String
��M S
)
��S T
;
��T U
if
�� 
(
�� 
System
�� !
.
��! "
IO
��" $
.
��$ %
File
��% )
.
��) *
Exists
��* 0
(
��0 1
imageFilePath
��1 >
)
��> ?
)
��? @
AddImage
�� $
(
��$ %
worksheetPart
��% 2
,
��2 3
imageFilePath
��4 A
,
��A B
$num
��C E
,
��E F
$num
��G H
)
��H I
;
��I J
cell
�� 
=
�� 
GetCell
�� &
(
��& '
worksheetPart
��' 4
.
��4 5
	Worksheet
��5 >
,
��> ?
$str
��@ C
,
��C D
$num
��E G
)
��G H
;
��H I
cell
�� 
.
�� 
	CellValue
�� &
=
��' (
new
��) ,
	CellValue
��- 6
(
��6 7
model
��7 <
.
��< =
OrderNumber
��= H
)
��H I
;
��I J
cell
�� 
.
�� 
DataType
�� %
=
��& '
new
��( +
	EnumValue
��, 5
<
��5 6

CellValues
��6 @
>
��@ A
(
��A B

CellValues
��B L
.
��L M
String
��M S
)
��S T
;
��T U
cell
�� 
=
�� 
GetCell
�� &
(
��& '
worksheetPart
��' 4
.
��4 5
	Worksheet
��5 >
,
��> ?
$str
��@ C
,
��C D
$num
��E G
)
��G H
;
��H I
cell
�� 
.
�� 
	CellValue
�� &
=
��' (
new
��) ,
	CellValue
��- 6
(
��6 7
model
��7 <
.
��< =
	StartDate
��= F
)
��F G
;
��G H
cell
�� 
.
�� 
DataType
�� %
=
��& '
new
��( +
	EnumValue
��, 5
<
��5 6

CellValues
��6 @
>
��@ A
(
��A B

CellValues
��B L
.
��L M
String
��M S
)
��S T
;
��T U
cell
�� 
=
�� 
GetCell
�� &
(
��& '
worksheetPart
��' 4
.
��4 5
	Worksheet
��5 >
,
��> ?
$str
��@ C
,
��C D
$num
��E G
)
��G H
;
��H I
cell
�� 
.
�� 
	CellValue
�� &
=
��' (
new
��) ,
	CellValue
��- 6
(
��6 7
DateTime
��7 ?
.
��? @
Now
��@ C
.
��C D
ToString
��D L
(
��L M
StringConstants
��M \
.
��\ ]
DateFormatSlashes
��] n
)
��n o
)
��o p
;
��p q
cell
�� 
.
�� 
DataType
�� %
=
��& '
new
��( +
	EnumValue
��, 5
<
��5 6

CellValues
��6 @
>
��@ A
(
��A B

CellValues
��B L
.
��L M
String
��M S
)
��S T
;
��T U
uint
�� 
start
�� "
=
��# $
$num
��% '
;
��' (
foreach
�� 
(
��  !
var
��! $
vm
��% '
in
��( *
model
��+ 0
.
��0 1
PerLink
��1 8
)
��8 9
{
�� 
PopulateRow
�� '
(
��' (
worksheetPart
��( 5
.
��5 6
	Worksheet
��6 ?
,
��? @
vm
��A C
,
��C D
start
��E J
)
��J K
;
��K L
start
�� !
++
��! #
;
��# $
}
�� 
worksheetPart
�� %
.
��% &
	Worksheet
��& /
.
��/ 0
Save
��0 4
(
��4 5
)
��5 6
;
��6 7
spreadSheet
�� #
.
��# $
Close
��$ )
(
��) *
)
��* +
;
��+ ,
}
�� 
File
�� 
.
�� 
WriteAllBytes
�� &
(
��& '

outputFile
��' 1
,
��1 2
stream
��3 9
.
��9 :
ToArray
��: A
(
��A B
)
��B C
)
��C D
;
��D E
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
PopulateRow
�� &
(
��& '
	Worksheet
��' 0
	worksheet
��1 :
,
��: ;$
CampaignReportDetailVM
��< R
row
��S V
,
��V W
uint
��X \
	rowNumber
��] f
)
��f g
{
�� 	
Cell
�� 
cell
�� 
=
�� 
GetCell
�� 
(
��  
	worksheet
��  )
,
��) *
$str
��+ .
,
��. /
	rowNumber
��0 9
)
��9 :
;
��: ;
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
Link
��/ 3
)
��3 4
;
��4 5
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /

ClickCount
��/ 9
)
��9 :
;
��: ;
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
UniqueCount
��/ :
)
��: ;
;
��; <
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
MobileCount
��/ :
)
��: ;
;
��; <
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
}
�� 	
private
�� 
static
�� 
Cell
�� 
GetCell
�� #
(
��# $
	Worksheet
��$ -
	worksheet
��. 7
,
��7 8
string
��9 ?

columnName
��@ J
,
��J K
uint
��L P
rowIndex
��Q Y
)
��Y Z
{
�� 	
Row
�� 
row
�� 
=
�� 
GetRow
�� 
(
�� 
	worksheet
�� &
,
��& '
rowIndex
��( 0
)
��0 1
;
��1 2
if
�� 
(
�� 
row
�� 
!=
�� 
null
�� 
)
�� 
return
�� 
row
�� 
.
�� 
Elements
�� #
<
��# $
Cell
��$ (
>
��( )
(
��) *
)
��* +
.
��+ ,
FirstOrDefault
��, :
(
��: ;
c
��; <
=>
��= ?
string
��@ F
.
��F G
Compare
��G N
(
��N O
c
��O P
.
��P Q
CellReference
��Q ^
.
��^ _
Value
��_ d
,
��d e

columnName
��f p
+
��q r
rowIndex
��s {
,
��{ |
true��} �
)��� �
==��� �
$num��� �
)��� �
;��� �
var
�� 
firstRow
�� 
=
�� 
GetRow
�� !
(
��! "
	worksheet
��" +
,
��+ ,
$num
��- /
)
��/ 0
;
��0 1
var
�� 
lastRow
�� 
=
�� 
GetRow
��  
(
��  !
	worksheet
��! *
,
��* +
$num
��, .
)
��. /
;
��/ 0
var
�� 
newRow
�� 
=
�� 
	InsertRow
�� "
(
��" #
rowIndex
��# +
,
��+ ,
	worksheet
��- 6
.
��6 7
WorksheetPart
��7 D
,
��D E
null
��F J
,
��J K
true
��L P
)
��P Q
;
��Q R
return
�� 
newRow
�� 
.
�� 
Elements
�� "
<
��" #
Cell
��# '
>
��' (
(
��( )
)
��) *
.
��* +
FirstOrDefault
��+ 9
(
��9 :
c
��: ;
=>
��< >
string
��? E
.
��E F
Compare
��F M
(
��M N
c
��N O
.
��O P
CellReference
��P ]
.
��] ^
Value
��^ c
,
��c d

columnName
��e o
+
��p q
rowIndex
��r z
,
��z {
true��| �
)��� �
==��� �
$num��� �
)��� �
;��� �
}
�� 	
private
�� 
static
�� 
Row
�� 
	CreateRow
�� $
(
��$ %
Row
��% (
firstRow
��) 1
,
��1 2
Row
��3 6
lastRow
��7 >
,
��> ?
uint
��@ D
newRowIndex
��E P
,
��P Q
	SheetData
��R [
	sheetData
��\ e
)
��e f
{
�� 	
var
�� 
newRow
�� 
=
�� 
(
�� 
Row
�� 
)
�� 
firstRow
�� &
.
��& '
	CloneNode
��' 0
(
��0 1
true
��1 5
)
��5 6
;
��6 7
foreach
�� 
(
�� 
Cell
�� 
cell
�� 
in
�� !
newRow
��" (
.
��( )
Elements
��) 1
<
��1 2
Cell
��2 6
>
��6 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
string
�� 
cellReference
�� $
=
��% &
cell
��' +
.
��+ ,
CellReference
��, 9
.
��9 :
Value
��: ?
;
��? @
cell
�� 
.
�� 
CellReference
�� "
=
��# $
new
��% (
StringValue
��) 4
(
��4 5
cellReference
��5 B
.
��B C
Replace
��C J
(
��J K
firstRow
��K S
.
��S T
RowIndex
��T \
.
��\ ]
Value
��] b
.
��b c
ToString
��c k
(
��k l
)
��l m
,
��m n
newRowIndex
��o z
.
��z {
ToString��{ �
(��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
newRow
�� 
.
�� 
RowIndex
�� 
=
�� 
new
�� !
UInt32Value
��" -
(
��- .
newRowIndex
��. 9
)
��9 :
;
��: ;
	sheetData
�� 
.
�� 
InsertAfter
�� !
(
��! "
newRow
��" (
,
��( )
lastRow
��* 1
)
��1 2
;
��2 3
return
�� 
newRow
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
Row
�� 
GetRow
�� !
(
��! "
	Worksheet
��" +
	worksheet
��, 5
,
��5 6
uint
��7 ;
rowIndex
��< D
)
��D E
{
�� 	
return
�� 
	worksheet
�� 
.
�� 
GetFirstChild
�� *
<
��* +
	SheetData
��+ 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
Elements
��8 @
<
��@ A
Row
��A D
>
��D E
(
��E F
)
��F G
.
��G H
FirstOrDefault
��H V
(
��V W
r
��W X
=>
��Y [
r
��\ ]
.
��] ^
RowIndex
��^ f
==
��g i
rowIndex
��j r
)
��r s
;
��s t
}
�� 	
public
�� 
static
�� 
Row
�� 
	InsertRow
�� #
(
��# $
uint
��$ (
rowIndex
��) 1
,
��1 2
WorksheetPart
��3 @
worksheetPart
��A N
,
��N O
Row
��P S
	insertRow
��T ]
,
��] ^
bool
��_ c
isNewLastRow
��d p
=
��q r
false
��s x
)
��x y
{
�� 	
	Worksheet
�� 
	worksheet
�� 
=
��  !
worksheetPart
��" /
.
��/ 0
	Worksheet
��0 9
;
��9 :
	SheetData
�� 
	sheetData
�� 
=
��  !
	worksheet
��" +
.
��+ ,
GetFirstChild
��, 9
<
��9 :
	SheetData
��: C
>
��C D
(
��D E
)
��E F
;
��F G
Row
�� 
retRow
�� 
=
�� 
!
�� 
isNewLastRow
�� &
?
��' (
	sheetData
��) 2
.
��2 3
Elements
��3 ;
<
��; <
Row
��< ?
>
��? @
(
��@ A
)
��A B
.
��B C
FirstOrDefault
��C Q
(
��Q R
r
��R S
=>
��T V
r
��W X
.
��X Y
RowIndex
��Y a
==
��b d
rowIndex
��e m
)
��m n
:
��o p
null
��q u
;
��u v
if
�� 
(
�� 
retRow
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� 
	insertRow
�� 
!=
��  
null
��! %
)
��% &
{
�� 
UpdateRowIndexes
�� $
(
��$ %
worksheetPart
��% 2
,
��2 3
rowIndex
��4 <
,
��< =
false
��> C
)
��C D
;
��D E(
UpdateMergedCellReferences
�� .
(
��. /
worksheetPart
��/ <
,
��< =
rowIndex
��> F
,
��F G
false
��H M
)
��M N
;
��N O'
UpdateHyperlinkReferences
�� -
(
��- .
worksheetPart
��. ;
,
��; <
rowIndex
��= E
,
��E F
false
��G L
)
��L M
;
��M N
retRow
�� 
=
�� 
	sheetData
�� &
.
��& '
InsertBefore
��' 3
(
��3 4
	insertRow
��4 =
,
��= >
retRow
��? E
)
��E F
;
��F G
string
�� 
curIndex
�� #
=
��$ %
retRow
��& ,
.
��, -
RowIndex
��- 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
;
��@ A
string
�� 
newIndex
�� #
=
��$ %
rowIndex
��& .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
;
��9 :
foreach
�� 
(
�� 
Cell
�� !
cell
��" &
in
��' )
retRow
��* 0
.
��0 1
Elements
��1 9
<
��9 :
Cell
��: >
>
��> ?
(
��? @
)
��@ A
)
��A B
{
�� 
cell
�� 
.
�� 
CellReference
�� *
=
��+ ,
new
��- 0
StringValue
��1 <
(
��< =
cell
��= A
.
��A B
CellReference
��B O
.
��O P
Value
��P U
.
��U V
Replace
��V ]
(
��] ^
curIndex
��^ f
,
��f g
newIndex
��h p
)
��p q
)
��q r
;
��r s
}
�� 
retRow
�� 
.
�� 
RowIndex
�� #
=
��$ %
rowIndex
��& .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
Row
�� 
refRow
�� 
=
�� 
!
�� 
isNewLastRow
�� *
?
��+ ,
	sheetData
��- 6
.
��6 7
Elements
��7 ?
<
��? @
Row
��@ C
>
��C D
(
��D E
)
��E F
.
��F G
FirstOrDefault
��G U
(
��U V
row
��V Y
=>
��Z \
row
��] `
.
��` a
RowIndex
��a i
>
��j k
rowIndex
��l t
)
��t u
:
��v w
null
��x |
;
��| }
retRow
�� 
=
�� 
	insertRow
�� "
??
��# %
new
��& )
Row
��* -
(
��- .
)
��. /
{
��0 1
RowIndex
��2 :
=
��; <
rowIndex
��= E
}
��F G
;
��G H
IEnumerable
�� 
<
�� 
Cell
��  
>
��  !

cellsInRow
��" ,
=
��- .
retRow
��/ 5
.
��5 6
Elements
��6 >
<
��> ?
Cell
��? C
>
��C D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 

cellsInRow
�� 
.
�� 
Any
�� "
(
��" #
)
��# $
)
��$ %
{
�� 
string
�� 
curIndex
�� #
=
��$ %
retRow
��& ,
.
��, -
RowIndex
��- 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
;
��@ A
string
�� 
newIndex
�� #
=
��$ %
rowIndex
��& .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
;
��9 :
foreach
�� 
(
�� 
Cell
�� !
cell
��" &
in
��' )

cellsInRow
��* 4
)
��4 5
{
�� 
cell
�� 
.
�� 
CellReference
�� *
=
��+ ,
new
��- 0
StringValue
��1 <
(
��< =
cell
��= A
.
��A B
CellReference
��B O
.
��O P
Value
��P U
.
��U V
Replace
��V ]
(
��] ^
curIndex
��^ f
,
��f g
newIndex
��h p
)
��p q
)
��q r
;
��r s
}
�� 
retRow
�� 
.
�� 
RowIndex
�� #
=
��$ %
rowIndex
��& .
;
��. /
}
�� 
	sheetData
�� 
.
�� 
InsertBefore
�� &
(
��& '
retRow
��' -
,
��- .
refRow
��/ 5
)
��5 6
;
��6 7
}
�� 
return
�� 
retRow
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
UpdateRowIndexes
�� ,
(
��, -
WorksheetPart
��- :
worksheetPart
��; H
,
��H I
uint
��J N
rowIndex
��O W
,
��W X
bool
��Y ]
isDeletedRow
��^ j
)
��j k
{
�� 	
IEnumerable
�� 
<
�� 
Row
�� 
>
�� 
rows
�� !
=
��" #
worksheetPart
��$ 1
.
��1 2
	Worksheet
��2 ;
.
��; <
Descendants
��< G
<
��G H
Row
��H K
>
��K L
(
��L M
)
��M N
.
��N O
Where
��O T
(
��T U
r
��U V
=>
��W Y
r
��Z [
.
��[ \
RowIndex
��\ d
.
��d e
Value
��e j
>=
��k m
rowIndex
��n v
)
��v w
;
��w x
foreach
�� 
(
�� 
Row
�� 
row
�� 
in
�� 
rows
��  $
)
��$ %
{
�� 
uint
�� 
newIndex
�� 
=
�� 
(
��  !
isDeletedRow
��! -
?
��. /
row
��0 3
.
��3 4
RowIndex
��4 <
-
��= >
$num
��? @
:
��A B
row
��C F
.
��F G
RowIndex
��G O
+
��P Q
$num
��R S
)
��S T
;
��T U
string
�� 
curRowIndex
�� "
=
��# $
row
��% (
.
��( )
RowIndex
��) 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
;
��< =
string
�� 
newRowIndex
�� "
=
��# $
newIndex
��% -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
;
��8 9
foreach
�� 
(
�� 
Cell
�� 
cell
�� "
in
��# %
row
��& )
.
��) *
Elements
��* 2
<
��2 3
Cell
��3 7
>
��7 8
(
��8 9
)
��9 :
)
��: ;
{
�� 
cell
�� 
.
�� 
CellReference
�� &
=
��' (
new
��) ,
StringValue
��- 8
(
��8 9
cell
��9 =
.
��= >
CellReference
��> K
.
��K L
Value
��L Q
.
��Q R
Replace
��R Y
(
��Y Z
curRowIndex
��Z e
,
��e f
newRowIndex
��g r
)
��r s
)
��s t
;
��t u
}
�� 
row
�� 
.
�� 
RowIndex
�� 
=
�� 
newIndex
�� '
;
��' (
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� (
UpdateMergedCellReferences
�� 6
(
��6 7
WorksheetPart
��7 D
worksheetPart
��E R
,
��R S
uint
��T X
rowIndex
��Y a
,
��a b
bool
��c g
isDeletedRow
��h t
)
��t u
{
�� 	
if
�� 
(
�� 
worksheetPart
�� 
.
�� 
	Worksheet
�� '
.
��' (
Elements
��( 0
<
��0 1

MergeCells
��1 ;
>
��; <
(
��< =
)
��= >
.
��> ?
Count
��? D
(
��D E
)
��E F
>
��G H
$num
��I J
)
��J K
{
�� 

MergeCells
�� 

mergeCells
�� %
=
��& '
worksheetPart
��( 5
.
��5 6
	Worksheet
��6 ?
.
��? @
Elements
��@ H
<
��H I

MergeCells
��I S
>
��S T
(
��T U
)
��U V
.
��V W
FirstOrDefault
��W e
(
��e f
)
��f g
;
��g h
if
�� 
(
�� 

mergeCells
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
List
�� 
<
�� 
	MergeCell
�� "
>
��" #
mergeCellsList
��$ 2
=
��3 4

mergeCells
��5 ?
.
��? @
Elements
��@ H
<
��H I
	MergeCell
��I R
>
��R S
(
��S T
)
��T U
.
��U V
Where
��V [
(
��[ \
r
��\ ]
=>
��^ `
r
��a b
.
��b c
	Reference
��c l
.
��l m
HasValue
��m u
)
��u v
.
��U V
Where
��V [
(
��[ \
r
��\ ]
=>
��^ `
GetRowIndex
��a l
(
��l m
r
��m n
.
��n o
	Reference
��o x
.
��x y
Value
��y ~
.
��~ 
Split�� �
(��� �
$char��� �
)��� �
.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
>=��� �
rowIndex��� �
||��� �
GetRowIndex
��a l
(
��l m
r
��m n
.
��n o
	Reference
��o x
.
��x y
Value
��y ~
.
��~ 
Split�� �
(��� �
$char��� �
)��� �
.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
>=��� �
rowIndex��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
isDeletedRow
�� $
)
��$ %
{
�� 
List
�� 
<
�� 
	MergeCell
�� &
>
��& ' 
mergeCellsToDelete
��( :
=
��; <
mergeCellsList
��= K
.
��K L
Where
��L Q
(
��Q R
r
��R S
=>
��T V
GetRowIndex
��W b
(
��b c
r
��c d
.
��d e
	Reference
��e n
.
��n o
Value
��o t
.
��t u
Split
��u z
(
��z {
$char
��{ ~
)
��~ 
.�� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
==��� �
rowIndex��� �
||��� �
GetRowIndex
��W b
(
��b c
r
��c d
.
��d e
	Reference
��e n
.
��n o
Value
��o t
.
��t u
Split
��u z
(
��z {
$char
��{ ~
)
��~ 
.�� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
==��� �
rowIndex��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
��  !
	MergeCell
��! *
cellToDelete
��+ 7
in
��8 : 
mergeCellsToDelete
��; M
)
��M N
{
�� 
cellToDelete
�� (
.
��( )
Remove
��) /
(
��/ 0
)
��0 1
;
��1 2
}
�� 
mergeCellsList
�� &
=
��' (

mergeCells
��) 3
.
��3 4
Elements
��4 <
<
��< =
	MergeCell
��= F
>
��F G
(
��G H
)
��H I
.
��I J
Where
��J O
(
��O P
r
��P Q
=>
��R T
r
��U V
.
��V W
	Reference
��W `
.
��` a
HasValue
��a i
)
��i j
.
��I J
Where
��J O
(
��O P
r
��P Q
=>
��R T
GetRowIndex
��U `
(
��` a
r
��a b
.
��b c
	Reference
��c l
.
��l m
Value
��m r
.
��r s
Split
��s x
(
��x y
$char
��y |
)
��| }
.
��} ~
	ElementAt��~ �
(��� �
$num��� �
)��� �
)��� �
>��� �
rowIndex��� �
||��� �
GetRowIndex
��U `
(
��` a
r
��a b
.
��b c
	Reference
��c l
.
��l m
Value
��m r
.
��r s
Split
��s x
(
��x y
$char
��y |
)
��| }
.
��} ~
	ElementAt��~ �
(��� �
$num��� �
)��� �
)��� �
>��� �
rowIndex��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
foreach
�� 
(
�� 
	MergeCell
�� &
	mergeCell
��' 0
in
��1 3
mergeCellsList
��4 B
)
��B C
{
�� 
string
�� 
[
�� 
]
��  
cellReference
��! .
=
��/ 0
	mergeCell
��1 :
.
��: ;
	Reference
��; D
.
��D E
Value
��E J
.
��J K
Split
��K P
(
��P Q
$char
��Q T
)
��T U
;
��U V
if
�� 
(
�� 
GetRowIndex
�� '
(
��' (
cellReference
��( 5
.
��5 6
	ElementAt
��6 ?
(
��? @
$num
��@ A
)
��A B
)
��B C
>=
��D F
rowIndex
��G O
)
��O P
{
�� 
string
�� "

columnName
��# -
=
��. /
GetColumnName
��0 =
(
��= >
cellReference
��> K
.
��K L
	ElementAt
��L U
(
��U V
$num
��V W
)
��W X
)
��X Y
;
��Y Z
cellReference
�� )
[
��) *
$num
��* +
]
��+ ,
=
��- .
isDeletedRow
��/ ;
?
��< =

columnName
��> H
+
��I J
(
��K L
GetRowIndex
��L W
(
��W X
cellReference
��X e
.
��e f
	ElementAt
��f o
(
��o p
$num
��p q
)
��q r
)
��r s
-
��t u
$num
��v w
)
��w x
.
��x y
ToString��y �
(��� �
)��� �
:��� �&
IncrementCellReference��� �
(��� �
cellReference��� �
.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
,��� �%
CellReferencePartEnum��� �
.��� �
Row��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
GetRowIndex
�� '
(
��' (
cellReference
��( 5
.
��5 6
	ElementAt
��6 ?
(
��? @
$num
��@ A
)
��A B
)
��B C
>=
��D F
rowIndex
��G O
)
��O P
{
�� 
string
�� "

columnName
��# -
=
��. /
GetColumnName
��0 =
(
��= >
cellReference
��> K
.
��K L
	ElementAt
��L U
(
��U V
$num
��V W
)
��W X
)
��X Y
;
��Y Z
cellReference
�� )
[
��) *
$num
��* +
]
��+ ,
=
��- .
isDeletedRow
��/ ;
?
��< =

columnName
��> H
+
��I J
(
��K L
GetRowIndex
��L W
(
��W X
cellReference
��X e
.
��e f
	ElementAt
��f o
(
��o p
$num
��p q
)
��q r
)
��r s
-
��t u
$num
��v w
)
��w x
.
��x y
ToString��y �
(��� �
)��� �
:��� �&
IncrementCellReference��� �
(��� �
cellReference��� �
.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
,��� �%
CellReferencePartEnum��� �
.��� �
Row��� �
)��� �
;��� �
}
�� 
	mergeCell
�� !
.
��! "
	Reference
��" +
=
��, -
new
��. 1
StringValue
��2 =
(
��= >
cellReference
��> K
[
��K L
$num
��L M
]
��M N
+
��O P
$str
��Q T
+
��U V
cellReference
��W d
[
��d e
$num
��e f
]
��f g
)
��g h
;
��h i
}
�� 
}
�� 
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� '
UpdateHyperlinkReferences
�� 5
(
��5 6
WorksheetPart
��6 C
worksheetPart
��D Q
,
��Q R
uint
��S W
rowIndex
��X `
,
��` a
bool
��b f
isDeletedRow
��g s
)
��s t
{
�� 	

Hyperlinks
�� 

hyperlinks
�� !
=
��" #
worksheetPart
��$ 1
.
��1 2
	Worksheet
��2 ;
.
��; <
Elements
��< D
<
��D E

Hyperlinks
��E O
>
��O P
(
��P Q
)
��Q R
.
��R S
FirstOrDefault
��S a
(
��a b
)
��b c
;
��c d
if
�� 
(
�� 

hyperlinks
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
Match
�� $
hyperlinkRowIndexMatch
�� ,
;
��, -
uint
�� 
hyperlinkRowIndex
�� &
;
��& '
foreach
�� 
(
�� 
	Hyperlink
�� "
	hyperlink
��# ,
in
��- /

hyperlinks
��0 :
.
��: ;
Elements
��; C
<
��C D
	Hyperlink
��D M
>
��M N
(
��N O
)
��O P
)
��P Q
{
�� $
hyperlinkRowIndexMatch
�� *
=
��+ ,
Regex
��- 2
.
��2 3
Match
��3 8
(
��8 9
	hyperlink
��9 B
.
��B C
	Reference
��C L
.
��L M
Value
��M R
,
��R S
$str
��T \
)
��\ ]
;
��] ^
if
�� 
(
�� $
hyperlinkRowIndexMatch
�� .
.
��. /
Success
��/ 6
&&
��7 9
uint
��: >
.
��> ?
TryParse
��? G
(
��G H$
hyperlinkRowIndexMatch
��H ^
.
��^ _
Value
��_ d
,
��d e
out
��f i
hyperlinkRowIndex
��j {
)
��{ |
&&
��} !
hyperlinkRowIndex��� �
>=��� �
rowIndex��� �
)��� �
{
�� 
if
�� 
(
�� 
isDeletedRow
�� (
)
��( )
{
�� 
if
�� 
(
��  
hyperlinkRowIndex
��  1
==
��2 4
rowIndex
��5 =
)
��= >
{
�� 
	hyperlink
��  )
.
��) *
Remove
��* 0
(
��0 1
)
��1 2
;
��2 3
}
�� 
else
��  
{
�� 
	hyperlink
��  )
.
��) *
	Reference
��* 3
.
��3 4
Value
��4 9
=
��: ;
	hyperlink
��< E
.
��E F
	Reference
��F O
.
��O P
Value
��P U
.
��U V
Replace
��V ]
(
��] ^$
hyperlinkRowIndexMatch
��^ t
.
��t u
Value
��u z
,
��z {
(
��| } 
hyperlinkRowIndex��} �
-��� �
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
	hyperlink
�� %
.
��% &
	Reference
��& /
.
��/ 0
Value
��0 5
=
��6 7
	hyperlink
��8 A
.
��A B
	Reference
��B K
.
��K L
Value
��L Q
.
��Q R
Replace
��R Y
(
��Y Z$
hyperlinkRowIndexMatch
��Z p
.
��p q
Value
��q v
,
��v w
(
��x y 
hyperlinkRowIndex��y �
+��� �
$num��� �
)��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 
if
�� 
(
�� 

hyperlinks
�� 
.
�� 
Elements
�� '
<
��' (
	Hyperlink
��( 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
Count
��5 :
(
��: ;
)
��; <
==
��= ?
$num
��@ A
)
��A B
{
�� 

hyperlinks
�� 
.
�� 
Remove
�� %
(
��% &
)
��& '
;
��' (
}
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
uint
�� 
GetRowIndex
�� &
(
��& '
string
��' -
cellReference
��. ;
)
��; <
{
�� 	
Regex
�� 
regex
�� 
=
�� 
new
�� 
Regex
�� #
(
��# $
$str
��$ *
)
��* +
;
��+ ,
Match
�� 
match
�� 
=
�� 
regex
�� 
.
��  
Match
��  %
(
��% &
cellReference
��& 3
)
��3 4
;
��4 5
return
�� 
uint
�� 
.
�� 
Parse
�� 
(
�� 
match
�� #
.
��# $
Value
��$ )
)
��) *
;
��* +
}
�� 	
public
�� 
static
�� 
string
�� $
IncrementCellReference
�� 3
(
��3 4
string
��4 :
	reference
��; D
,
��D E#
CellReferencePartEnum
��F [
cellRefPart
��\ g
)
��g h
{
�� 	
string
�� 
newReference
�� 
=
��  !
	reference
��" +
;
��+ ,
if
�� 
(
�� 
cellRefPart
�� 
!=
�� #
CellReferencePartEnum
�� 4
.
��4 5
None
��5 9
&&
��: <
!
��= >
String
��> D
.
��D E
IsNullOrEmpty
��E R
(
��R S
	reference
��S \
)
��\ ]
)
��] ^
{
�� 
string
�� 
[
�� 
]
�� 
parts
�� 
=
��  
Regex
��! &
.
��& '
Split
��' ,
(
��, -
	reference
��- 6
,
��6 7
$str
��8 B
)
��B C
;
��C D
if
�� 
(
�� 
cellRefPart
�� 
==
��  "#
CellReferencePartEnum
��# 8
.
��8 9
Column
��9 ?
||
��@ B
cellRefPart
��C N
==
��O Q#
CellReferencePartEnum
��R g
.
��g h
Both
��h l
)
��l m
{
�� 
List
�� 
<
�� 
char
�� 
>
�� 
col
�� "
=
��# $
parts
��% *
[
��* +
$num
��+ ,
]
��, -
.
��- .
ToCharArray
��. 9
(
��9 :
)
��: ;
.
��; <
ToList
��< B
(
��B C
)
��C D
;
��D E
bool
�� 
needsIncrement
�� '
=
��( )
true
��* .
;
��. /
int
�� 
index
�� 
=
�� 
col
��  #
.
��# $
Count
��$ )
-
��* +
$num
��, -
;
��- .
do
�� 
{
�� 
col
�� 
[
�� 
index
�� !
]
��! "
=
��# $
Letters
��% ,
[
��, -
Letters
��- 4
.
��4 5
IndexOf
��5 <
(
��< =
col
��= @
[
��@ A
index
��A F
]
��F G
)
��G H
+
��I J
$num
��K L
]
��L M
;
��M N
if
�� 
(
�� 
col
�� 
[
��  
index
��  %
]
��% &
==
��' )
Letters
��* 1
[
��1 2
Letters
��2 9
.
��9 :
Count
��: ?
-
��@ A
$num
��B C
]
��C D
)
��D E
{
�� 
col
�� 
[
��  
index
��  %
]
��% &
=
��' (
Letters
��) 0
[
��0 1
$num
��1 2
]
��2 3
;
��3 4
}
�� 
else
�� 
{
�� 
needsIncrement
�� *
=
��+ ,
false
��- 2
;
��2 3
}
�� 
}
�� 
while
�� 
(
�� 
needsIncrement
�� +
&&
��, .
--
��/ 1
index
��1 6
>=
��7 9
$num
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
needsIncrement
�� &
)
��& '
{
�� 
col
�� 
.
�� 
Add
�� 
(
��  
Letters
��  '
[
��' (
$num
��( )
]
��) *
)
��* +
;
��+ ,
}
�� 
parts
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
new
�� "
String
��# )
(
��) *
col
��* -
.
��- .
ToArray
��. 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
cellRefPart
�� 
==
��  "#
CellReferencePartEnum
��# 8
.
��8 9
Row
��9 <
||
��= ?
cellRefPart
��@ K
==
��L N#
CellReferencePartEnum
��O d
.
��d e
Both
��e i
)
��i j
{
�� 
parts
�� 
[
�� 
$num
�� 
]
�� 
=
�� 
(
��  
int
��  #
.
��# $
Parse
��$ )
(
��) *
parts
��* /
[
��/ 0
$num
��0 1
]
��1 2
)
��2 3
+
��4 5
$num
��6 7
)
��7 8
.
��8 9
ToString
��9 A
(
��A B
)
��B C
;
��C D
}
�� 
newReference
�� 
=
�� 
parts
�� $
[
��$ %
$num
��% &
]
��& '
+
��( )
parts
��* /
[
��/ 0
$num
��0 1
]
��1 2
;
��2 3
}
�� 
return
�� 
newReference
�� 
;
��  
}
�� 	
private
�� 
static
�� 
string
�� 
GetColumnName
�� +
(
��+ ,
string
��, 2
cellName
��3 ;
)
��; <
{
�� 	
Regex
�� 
regex
�� 
=
�� 
new
�� 
Regex
�� #
(
��# $
$str
��$ /
)
��/ 0
;
��0 1
Match
�� 
match
�� 
=
�� 
regex
�� 
.
��  
Match
��  %
(
��% &
cellName
��& .
)
��. /
;
��/ 0
return
�� 
match
�� 
.
�� 
Value
�� 
;
�� 
}
�� 	
public
�� 
enum
�� #
CellReferencePartEnum
�� )
{
�� 	
None
�� 
,
�� 
Column
�� 
,
�� 
Row
�� 
,
�� 
Both
�� 
}
�� 	
private
�� 
static
�� 
List
�� 
<
�� 
char
��  
>
��  !
Letters
��" )
=
��* +
new
��, /
List
��0 4
<
��4 5
char
��5 9
>
��9 :
(
��: ;
)
��; <
{
��= >
$char
��? B
,
��B C
$char
��D G
,
��G H
$char
��I L
,
��L M
$char
��N Q
,
��Q R
$char
��S V
,
��V W
$char
��X [
,
��[ \
$char
��] `
,
��` a
$char
��b e
,
��e f
$char
��g j
,
��j k
$char
��l o
,
��o p
$char
��q t
,
��t u
$char
��v y
,
��y z
$char
��{ ~
,
��~ 
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
,��� �
$char��� �
}��� �
;��� �
private
�� 
static
�� 
void
�� 
AddImage
�� $
(
��$ %
WorksheetPart
��% 2
worksheetPart
��3 @
,
��@ A
string
��B H
imageFilePath
��I V
,
��V W
int
��X [
	rowNumber
��\ e
,
��e f
int
��g j
	colNumber
��k t
)
��t u
{
�� 	
Bitmap
�� 
bm
�� 
=
�� 
new
�� 
Bitmap
�� "
(
��" #
imageFilePath
��# 0
)
��0 1
;
��1 2
DocumentFormat
�� 
.
�� 
OpenXml
�� "
.
��" #
Drawing
��# *
.
��* +
Extents
��+ 2
extents
��3 :
=
��; <
new
��= @
DocumentFormat
��A O
.
��O P
OpenXml
��P W
.
��W X
Drawing
��X _
.
��_ `
Extents
��` g
(
��g h
)
��h i
;
��i j
var
�� 
	extentsCx
�� 
=
�� 
(
�� 
long
�� !
)
��! "
bm
��" $
.
��$ %
Width
��% *
*
��+ ,
(
��- .
long
��. 2
)
��2 3
(
��3 4
(
��4 5
float
��5 :
)
��: ;
$num
��; A
/
��B C
bm
��D F
.
��F G"
HorizontalResolution
��G [
)
��[ \
;
��\ ]
var
�� 
	extentsCy
�� 
=
�� 
(
�� 
long
�� !
)
��! "
bm
��" $
.
��$ %
Height
��% +
*
��, -
(
��. /
long
��/ 3
)
��3 4
(
��4 5
(
��5 6
float
��6 ;
)
��; <
$num
��< B
/
��C D
bm
��E G
.
��G H 
VerticalResolution
��H Z
)
��Z [
;
��[ \
bm
�� 
.
�� 
Dispose
�� 
(
�� 
)
�� 
;
�� 
var
�� 
	colOffset
�� 
=
�� 
$num
�� 
;
�� 
var
�� 
	rowOffset
�� 
=
�� 
$num
�� 
;
�� 
var
�� 
drawingsPart
�� 
=
�� 
worksheetPart
�� ,
.
��, -
DrawingsPart
��- 9
;
��9 :
var
�� 
worksheetDrawing
��  
=
��! "
drawingsPart
��# /
.
��/ 0
WorksheetDrawing
��0 @
;
��@ A
var
�� 
	imagePart
�� 
=
�� 
drawingsPart
�� (
.
��( )
AddImagePart
��) 5
(
��5 6
ImagePartType
��6 C
.
��C D
Jpeg
��D H
)
��H I
;
��I J
using
�� 
(
�� 
var
�� 
stream
�� 
=
�� 
new
��  #

FileStream
��$ .
(
��. /
imageFilePath
��/ <
,
��< =
FileMode
��> F
.
��F G
Open
��G K
)
��K L
)
��L M
{
�� 
	imagePart
�� 
.
�� 
FeedData
�� "
(
��" #
stream
��# )
)
��) *
;
��* +
}
�� 
var
�� 
nvps
�� 
=
�� 
worksheetDrawing
�� '
.
��' (
Descendants
��( 3
<
��3 4
Xdr
��4 7
.
��7 8(
NonVisualDrawingProperties
��8 R
>
��R S
(
��S T
)
��T U
;
��U V
var
�� 
nvpId
�� 
=
�� 
nvps
�� 
.
�� 
Count
�� "
(
��" #
)
��# $
>
��% &
$num
��' (
?
��) *
(
�� 
UInt32Value
�� 
)
�� 
worksheetDrawing
�� -
.
��- .
Descendants
��. 9
<
��9 :
Xdr
��: =
.
��= >(
NonVisualDrawingProperties
��> X
>
��X Y
(
��Y Z
)
��Z [
.
��[ \
Max
��\ _
(
��_ `
p
��` a
=>
��b d
p
��e f
.
��f g
Id
��g i
.
��i j
Value
��j o
)
��o p
+
��q r
$num
��s t
:
��u v
$num
�� 
;
�� 
var
�� 
oneCellAnchor
�� 
=
�� 
new
��  #
Xdr
��$ '
.
��' (
OneCellAnchor
��( 5
(
��5 6
new
�� 
Xdr
�� 
.
�� 

FromMarker
�� "
{
�� 
ColumnId
�� 
=
�� 
new
�� "
Xdr
��# &
.
��& '
ColumnId
��' /
(
��/ 0
(
��0 1
	colNumber
��1 :
-
��; <
$num
��= >
)
��> ?
.
��? @
ToString
��@ H
(
��H I
)
��I J
)
��J K
,
��K L
RowId
�� 
=
�� 
new
�� 
Xdr
��  #
.
��# $
RowId
��$ )
(
��) *
(
��* +
	rowNumber
��+ 4
-
��5 6
$num
��7 8
)
��8 9
.
��9 :
ToString
��: B
(
��B C
)
��C D
)
��D E
,
��E F
ColumnOffset
��  
=
��! "
new
��# &
Xdr
��' *
.
��* +
ColumnOffset
��+ 7
(
��7 8
	colOffset
��8 A
.
��A B
ToString
��B J
(
��J K
)
��K L
)
��L M
,
��M N
	RowOffset
�� 
=
�� 
new
��  #
Xdr
��$ '
.
��' (
	RowOffset
��( 1
(
��1 2
	rowOffset
��2 ;
.
��; <
ToString
��< D
(
��D E
)
��E F
)
��F G
}
�� 
,
�� 
new
�� 
Xdr
�� 
.
�� 
Extent
�� 
{
��  
Cx
��! #
=
��$ %
	extentsCx
��& /
,
��/ 0
Cy
��1 3
=
��4 5
	extentsCy
��6 ?
}
��@ A
,
��A B
new
�� 
Xdr
�� 
.
�� 
Picture
�� 
(
��  
new
�� 
Xdr
�� 
.
�� (
NonVisualPictureProperties
�� 6
(
��6 7
new
�� 
Xdr
�� 
.
��  (
NonVisualDrawingProperties
��  :
{
��; <
Id
��= ?
=
��@ A
nvpId
��B G
,
��G H
Name
��I M
=
��N O
$str
��P Z
+
��[ \
nvpId
��] b
,
��b c
Description
��d o
=
��p q
imageFilePath
��r 
}��� �
,��� �
new
�� 
Xdr
�� 
.
��  /
!NonVisualPictureDrawingProperties
��  A
(
��A B
new
��B E
A
��F G
.
��G H
PictureLocks
��H T
{
��U V
NoChangeAspect
��W e
=
��f g
true
��h l
}
��m n
)
��n o
)
�� 
,
�� 
new
�� 
Xdr
�� 
.
�� 
BlipFill
�� $
(
��$ %
new
�� 
A
�� 
.
�� 
Blip
�� "
{
��# $
Embed
��% *
=
��+ ,
drawingsPart
��- 9
.
��9 :
GetIdOfPart
��: E
(
��E F
	imagePart
��F O
)
��O P
,
��P Q
CompressionState
��R b
=
��c d
A
��e f
.
��f g#
BlipCompressionValues
��g |
.
��| }
Print��} �
}��� �
,��� �
new
�� 
A
�� 
.
�� 
Stretch
�� %
(
��% &
new
��& )
A
��* +
.
��+ ,
FillRectangle
��, 9
(
��9 :
)
��: ;
)
��; <
)
�� 
,
�� 
new
�� 
Xdr
�� 
.
�� 
ShapeProperties
�� +
(
��+ ,
new
�� 
A
�� 
.
�� 
Transform2D
�� )
(
��) *
new
�� 
A
��  !
.
��! "
Offset
��" (
{
��) *
X
��+ ,
=
��- .
$num
��/ 0
,
��0 1
Y
��2 3
=
��4 5
$num
��6 7
}
��8 9
,
��9 :
new
�� 
A
��  !
.
��! "
Extents
��" )
{
��* +
Cx
��, .
=
��/ 0
	extentsCx
��1 :
,
��: ;
Cy
��< >
=
��? @
	extentsCy
��A J
}
��K L
)
�� 
,
�� 
new
�� 
A
�� 
.
�� 
PresetGeometry
�� ,
{
��- .
Preset
��/ 5
=
��6 7
A
��8 9
.
��9 :
ShapeTypeValues
��: I
.
��I J
	Rectangle
��J S
}
��T U
)
�� 
)
�� 
,
�� 
new
�� 
Xdr
�� 
.
�� 

ClientData
�� "
(
��" #
)
��# $
)
�� 
;
�� 
worksheetDrawing
�� 
.
�� 
Append
�� #
(
��# $
oneCellAnchor
��$ 1
)
��1 2
;
��2 3
}
�� 	
}
�� 
}�� �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ExcelUtility.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
ExcelUtility 
{ 
public 
static 
int 
GetRow  
(  !
int! $

itemNumber% /
)/ 0
{ 	
int 
	rowNumber 
= 
$num 
; 
int 
firstStartingRow  
=! "
$num# $
;$ %
int		 
secondStartingRow		 !
=		" #
$num		$ &
;		& '
if 
( 

itemNumber 
<= 
$num  
)  !
	rowNumber 
= 

itemNumber &
+' (
firstStartingRow) 9
;9 :
if 
( 

itemNumber 
> 
$num 
&&  "

itemNumber# -
<. /
$num0 3
)3 4
	rowNumber 
= 

itemNumber &
+' (
firstStartingRow) 9
-: ;
$num< >
;> ?
if 
( 

itemNumber 
> 
$num  
&&! #

itemNumber$ .
<=/ 1
$num2 5
)5 6
	rowNumber 
= 

itemNumber &
-' (
$num) ,
+- .
secondStartingRow/ @
;@ A
if 
( 

itemNumber 
> 
$num  
)  !
	rowNumber 
= 

itemNumber &
-' (
$num) ,
+- .
secondStartingRow/ @
-A B
$numC E
;E F
return 
	rowNumber 
; 
} 	
public 
static 
string 
	GetColumn &
(& '
int' *

itemNumber+ 5
,5 6
string7 =

columnName> H
)H I
{ 	
string 
columnNumber 
=  !
string" (
.( )
Empty) .
;. /
if 
( 
( 

itemNumber 
<= 
$num !
)! "
||# %
(& '

itemNumber' 1
>2 3
$num4 7
&&8 :

itemNumber; E
<=F H
$numI L
)L M
)M N
{ 
columnNumber   
=   

columnName   )
.  ) *
Equals  * 0
(  0 1
$str  1 7
)  7 8
?  9 :
$str  ; >
:  ? @
(  A B

columnName  B L
.  L M
Equals  M S
(  S T
$str  T ^
)  ^ _
?  ` a
$str  b e
:  f g
$str  h k
)  k l
;  l m
}!! 
if## 
(## 
(## 

itemNumber## 
>## 
$num##  
&&##! #

itemNumber##$ .
<##/ 0
$num##1 4
)##4 5
||##6 8
(##9 :

itemNumber##: D
>##E F
$num##G J
)##J K
)##K L
{$$ 
columnNumber%% 
=%% 

columnName%% )
.%%) *
Equals%%* 0
(%%0 1
$str%%1 7
)%%7 8
?%%9 :
$str%%; >
:%%? @
(%%A B

columnName%%B L
.%%L M
Equals%%M S
(%%S T
$str%%T ^
)%%^ _
?%%` a
$str%%b e
:%%f g
$str%%h k
)%%k l
;%%l m
}&& 
return'' 
columnNumber'' 
;''  
}(( 	
})) 
}** �u
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\FileManager.cs
	namespace		 	
WFP		
 
.		 
ICT		 
.		 
Web		 
.		 
Async		 
{

 
public 

class 
FileManager 
{ 
static 
string 
OptOut 
= 
$str	 �
;
� �
static 
string 
ViewInBrowser #
=$ %
$str	& �
;
� �
static 
string 
_orderNumber "
;" #
static 
bool 
_isAddOptout  
;  !
static 
bool 
_isAddViewinBrowser '
;' (
static 
string 
serverPrefix "
=# $
string% +
.+ ,
Format, 2
(2 3
$str3 R
,R S
S3FileManagerT a
.a b
bucketb h
)h i
;i j
public 
static 
HtmlProcessResult '
ProcessHtmlZip( 6
(6 7
string7 =

UploadPath> H
,H I
stringJ P
zipFilePathQ \
,\ ]
string^ d
orderNumbere p
,p q
boolr v
isAddOptout	w �
,
� �
bool
� � 
isAddViewinBrowser
� �
)
� �
{ 	
_orderNumber 
= 
orderNumber &
;& '
_isAddOptout 
= 
isAddOptout &
;& '
_isAddViewinBrowser 
=  !
isAddViewinBrowser" 4
;4 5
var 
	directory 
= 
string "
." #
Format# )
() *
$str* 4
,4 5

UploadPath6 @
,@ A
orderNumberB M
)M N
;N O
if 
( 
! 
	Directory 
. 
Exists !
(! "
	directory" +
)+ ,
), -
{ 
	Directory 
. 
CreateDirectory )
() *
	directory* 3
)3 4
;4 5
} 
ZipFile   
.   
ExtractToDirectory   &
(  & '
zipFilePath  ' 2
,  2 3
	directory  4 =
)  = >
;  > ?
var## 

imagesLive## 
=## 
string## #
.### $
Format##$ *
(##* +
$str##+ 7
,##7 8
orderNumber##9 D
)##D E
;##E F
string$$ 
htmlFileName$$ 
=$$  !
string$$" (
.$$( )
Format$$) /
($$/ 0
$str$$0 9
,$$9 :
orderNumber$$; F
)$$F G
;$$G H
string%% 
htmlFileKey%% 
=%%  
string%%! '
.%%' (
Format%%( .
(%%. /
$str%%/ <
,%%< =
orderNumber%%> I
)%%I J
;%%J K
string&& 
htmlFilePath&& 
=&&  !
string&&" (
.&&( )
Format&&) /
(&&/ 0
$str&&0 :
,&&: ;
	directory&&< E
,&&E F
htmlFileName&&G S
)&&S T
;&&T U
string(( 
htmlFile(( 
=(( 
	Directory(( '
.((' (
EnumerateFiles((( 6
(((6 7
	directory((7 @
)((@ A
.((A B
FirstOrDefault((B P
(((P Q
x((Q R
=>((S U
x((V W
.((W X
EndsWith((X `
(((` a
$str((a f
)((f g
||((h j
x((k l
.((l m
EndsWith((m u
(((u v
$str((v |
)((| }
)((} ~
;((~ 
if)) 
()) 
string)) 
.)) 
IsNullOrEmpty)) #
())# $
htmlFile))$ ,
))), -
)))- .
throw** 
new** 
	Exception** #
(**# $
$str**$ 4
)**4 5
;**5 6
UploadFileStatus,, 
status,, #
=,,$ %
ProcessHtml,,& 1
(,,1 2
htmlFile,,2 :
,,,: ;
htmlFilePath,,< H
),,H I
;,,I J
S3FileManager// 
.// 
CreateDirectory// )
(//) *
orderNumber//* 5
)//5 6
;//6 7
S3FileManager22 
.22 
Upload22  
(22  !
htmlFileKey22! ,
,22, -
htmlFilePath22. :
,22: ;
true22< @
)22@ A
;22A B
string33 
filePathLive33 
=33  !
string33" (
.33( )
Format33) /
(33/ 0
$str330 8
,338 9
serverPrefix33: F
,33F G
htmlFileKey33H S
)33S T
;33T U
S3FileManager66 
.66 
CreateDirectory66 )
(66) *

imagesLive66* 4
)664 5
;665 6
var99 
images99 
=99 
	Directory99 "
.99" # 
EnumerateDirectories99# 7
(997 8
	directory998 A
)99A B
.99B C
FirstOrDefault99C Q
(99Q R
)99R S
;99S T
if:: 
(:: 
images:: 
!=:: 
null:: 
):: 
foreach;; 
(;; 
var;; 
imgFile;;  
in;;! #
	Directory;;$ -
.;;- .
EnumerateFiles;;. <
(;;< =
images;;= C
);;C D
);;D E
{<< 
var== 
	imageLive== 
=== 
string==  &
.==& '
Format==' -
(==- .
$str==. 7
,==7 8

imagesLive==9 C
,==C D
new==E H
FileInfo==I Q
(==Q R
imgFile==R Y
)==Y Z
.==Z [
Name==[ _
)==_ `
;==` a
S3FileManager>> 
.>> 
Upload>> $
(>>$ %
	imageLive>>% .
,>>. /
imgFile>>0 7
,>>7 8
true>>9 =
)>>= >
;>>> ?
}?? 
newBB 
DirectoryInfoBB 
(BB 
	directoryBB '
)BB' (
.BB( )
DeleteBB) /
(BB/ 0
trueBB0 4
)BB4 5
;BB5 6
returnDD 
newDD 
HtmlProcessResultDD (
(DD( )
)DD) *
{DD+ ,
StatusDD, 2
=DD3 4
statusDD5 ;
,DD; <
filePathLiveDD= I
=DDJ K
filePathLiveDDL X
}DDX Y
;DDY Z
}EE 	
publicGG 
staticGG 
UploadFileStatusGG &
ProcessHtmlGG' 2
(GG2 3
stringGG3 9
htmlFileGG: B
,GGB C
stringGGD J
outputFilePathGGK Y
)GGY Z
{HH 	
stringII 

imagesPathII 
=II 
stringII  &
.II& '
FormatII' -
(II- .
$strII. >
,II> ?
serverPrefixII@ L
,IIL M
_orderNumberIIN Z
)IIZ [
;II[ \
HtmlDocumentKK 
docKK 
=KK 
newKK "
HtmlDocumentKK# /
(KK/ 0
)KK0 1
;KK1 2
docLL 
.LL 
LoadLL 
(LL 
htmlFileLL 
)LL 
;LL 
varMM 
allSrcsMM 
=MM 
docMM 
.MM 
DocumentNodeMM *
.MM* +
SelectNodesMM+ 6
(MM6 7
$strMM7 D
)MMD E
;MME F
boolNN 
alreadyHostedNN 
=NN  
falseNN! &
;NN& '
foreachOO 
(OO 
HtmlNodeOO 
nodeOO "
inOO# %
allSrcsOO& -
)OO- .
{PP 
varQQ 
srcQQ 
=QQ 
nodeQQ 
.QQ 

AttributesQQ )
[QQ) *
$strQQ* /
]QQ/ 0
.QQ0 1
ValueQQ1 6
;QQ6 7
ifSS 
(SS 
srcSS 
.SS 
ContainsSS  
(SS  !
$strSS! *
)SS* +
)SS+ ,
{TT 
alreadyHostedUU !
=UU" #
trueUU$ (
;UU( )
breakVV 
;VV 
;VV 
}WW 
elseXX 
{YY 
var\\ 
srcs\\ 
=\\ 
src\\ "
.\\" #
Split\\# (
(\\( )
$str\\) ,
.\\, -
ToCharArray\\- 8
(\\8 9
)\\9 :
)\\: ;
;\\; <
string]] 
imgFileName]] &
=]]' (
srcs]]) -
.]]- .
Length]]. 4
>]]5 6
$num]]7 8
?]]9 :
srcs]]; ?
[]]? @
$num]]@ A
]]]A B
:]]C D
string]]E K
.]]K L
Empty]]L Q
;]]Q R
src^^ 
=^^ 
string^^  
.^^  !
Format^^! '
(^^' (
$str^^( 0
,^^0 1

imagesPath^^2 <
,^^< =
imgFileName^^> I
)^^I J
;^^J K
}__ 
node`` 
.`` 
SetAttributeValue`` &
(``& '
$str``' ,
,``, -
src``. 1
)``1 2
;``2 3
}aa 
HtmlNodecc 
bodycc 
=cc 
doccc 
.cc  
DocumentNodecc  ,
.cc, -
SelectSingleNodecc- =
(cc= >
$strcc> F
)ccF G
;ccG H
ifdd 
(dd 
_isAddViewinBrowserdd #
)dd# $
{ee 
HtmlNodeff 
newNodeff  
=ff! "
HtmlNodeff# +
.ff+ ,

CreateNodeff, 6
(ff6 7
ViewInBrowserff7 D
)ffD E
;ffE F
bodygg 
.gg 
PrependChildgg !
(gg! "
newNodegg" )
)gg) *
;gg* +
}hh 
ifii 
(ii 
_isAddOptoutii 
)ii 
{jj 
HtmlNodekk 
newNodekk  
=kk! "
HtmlNodekk# +
.kk+ ,

CreateNodekk, 6
(kk6 7
OptOutkk7 =
)kk= >
;kk> ?
bodyll 
.ll 
AppendChildll  
(ll  !
newNodell! (
)ll( )
;ll) *
}mm 
docoo 
.oo 
Saveoo 
(oo 
outputFilePathoo #
)oo# $
;oo$ %
returnqq 
alreadyHostedqq  
?qq! "
UploadFileStatusqq# 3
.qq3 4
HostedWithOutImagesqq4 G
:qqH I
UploadFileStatusqqK [
.qq[ \
HostedWithImagesqq\ l
;qql m
}rr 	
publictt 
statictt 
stringtt 
GetFilePathLivett ,
(tt, -
UploadFileTypett- ;
uploadFileTypett< J
,ttJ K
stringttL R
orderNumberttS ^
,tt^ _
stringtt` f
	extensionttg p
=ttq r
$strtts u
,ttu v
stringttw }
segmentNumber	tt~ �
=
tt� �
$str
tt� �
)
tt� �
{uu 	
stringvv 
fileNamevv 
=vv 
$strvv  
;vv  !
switchww 
(ww 
uploadFileTypeww "
)ww" #
{xx 
caseyy 
UploadFileTypeyy '
.yy' (
ZipFileyy( /
:yy/ 0
fileNamezz  
=zz! "
stringzz# )
.zz) *
Formatzz* 0
(zz0 1
$strzz1 D
,zzD E
serverPrefixzzF R
,zzR S
orderNumberzzT _
)zz_ `
;zz` a
break{{ 
;{{ 
case|| 
UploadFileType|| '
.||' (
TestSeedFile||( 4
:||4 5
fileName}}  
=}}! "
string}}# )
.}}) *
Format}}* 0
(}}0 1
$str}}1 E
,}}E F
serverPrefix}}G S
,}}S T
orderNumber}}U `
)}}` a
;}}a b
break~~ 
;~~ 
case 
UploadFileType '
.' (
LiveSeedFile( 4
:4 5
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 E
,
��E F
serverPrefix
��G S
,
��S T
orderNumber
��U `
)
��` a
;
��a b
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
SuppressionFile
��( 7
:
��7 8
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 E
,
��E F
serverPrefix
��G S
,
��S T
orderNumber
��U `
)
��` a
;
��a b
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
BannersFile
��( 3
:
��3 4
fileName
�� $
=
��% &
string
��' -
.
��- .
Format
��. 4
(
��4 5
$str
��5 H
,
��H I
serverPrefix
��J V
,
��V W
orderNumber
��X c
,
��c d
	extension
��e n
)
��n o
;
��o p
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
BannersLinksFile
��( 8
:
��8 9
fileName
�� $
=
��% &
string
��' -
.
��- .
Format
��. 4
(
��4 5
$str
��5 M
,
��M N
serverPrefix
��O [
,
��[ \
orderNumber
��] h
,
��h i
	extension
��j s
)
��s t
;
��t u
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
MiscFile
��( 0
:
��0 1
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 B
,
��B C
serverPrefix
��D P
,
��P Q
orderNumber
��R ]
,
��] ^
	extension
��_ h
)
��h i
;
��i j
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
DataFile
��( 0
:
��0 1
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 E
,
��E F
serverPrefix
��G S
,
��S T
orderNumber
��U `
,
��` a
segmentNumber
��b o
)
��o p
;
��p q
break
�� 
;
�� 
}
�� 
return
�� 
fileName
�� 
;
�� 
}
�� 	
}
�� 
}�� �e
IE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\FileManagerFTP.cs
	namespace		 	
WFP		
 
.		 
ICT		 
.		 
Web		 
.		 
Async		 
{

 
public 

class 
FileManagerFTP 
{ 
static 
string 
OptOut 
= 
$str	 �
;
� �
static 
string 
ViewInBrowser #
=$ %
$str	& �
;
� �
private 
static 
string 
_orderNumber *
;* +
private 
static 
bool 
_isAddOptout (
;( )
private 
static 
bool 
_isAddViewinBrowser /
;/ 0
public 
static 
HtmlProcessResult '
ProcessHtmlZip( 6
(6 7
string7 =

UploadPath> H
,H I
stringJ P
zipFilePathQ \
,\ ]
string^ d
orderNumbere p
,p q
boolr v
isAddOptout	w �
,
� �
bool
� � 
isAddViewinBrowser
� �
)
� �
{ 	
_orderNumber 
= 
orderNumber &
;& '
_isAddOptout 
= 
isAddOptout &
;& '
_isAddViewinBrowser 
=  !
isAddViewinBrowser" 4
;4 5
FileUploader 
uploader !
=" #
new$ '
FileUploader( 4
(4 5
)5 6
;6 7
var 
	directory 
= 
string "
." #
Format# )
() *
$str* 8
,8 9

UploadPath: D
,D E
orderNumberF Q
)Q R
;R S
if 
( 
	Directory 
. 
Exists  
(  !
	directory! *
)* +
)+ ,
{ 
new 
DirectoryInfo !
(! "
	directory" +
)+ ,
., -
Delete- 3
(3 4
true4 8
)8 9
;9 :
} 
else   
{!! 
	Directory"" 
."" 
CreateDirectory"" )
("") *
	directory""* 3
)""3 4
;""4 5
}## 
ZipFile$$ 
.$$ 
ExtractToDirectory$$ &
($$& '
zipFilePath$$' 2
,$$2 3
	directory$$4 =
)$$= >
;$$> ?
string'' 
htmlFileName'' 
=''  !
string''" (
.''( )
Format'') /
(''/ 0
$str''0 9
,''9 :
orderNumber''; F
)''F G
;''G H
string(( 
htmlFilePath(( 
=((  !
string((" (
.((( )
Format(() /
(((/ 0
$str((0 :
,((: ;
	directory((< E
,((E F
htmlFileName((G S
)((S T
;((T U
string** 
htmlFile** 
=** 
	Directory** '
.**' (
EnumerateFiles**( 6
(**6 7
	directory**7 @
)**@ A
.**A B
FirstOrDefault**B P
(**P Q
x**Q R
=>**S U
x**V W
.**W X
EndsWith**X `
(**` a
$str**a f
)**f g
||**h j
x**k l
.**l m
EndsWith**m u
(**u v
$str**v |
)**| }
)**} ~
;**~ 
if++ 
(++ 
string++ 
.++ 
IsNullOrEmpty++ #
(++# $
htmlFile++$ ,
)++, -
)++- .
throw,, 
new,, 
	Exception,, #
(,,# $
$str,,$ 4
),,4 5
;,,5 6
UploadFileStatus.. 
status.. #
=..$ %
ProcessHtml..& 1
(..1 2
htmlFile..2 :
,..: ;
htmlFilePath..< H
)..H I
;..I J
uploader11 
.11 
CreateDirectory11 $
(11$ %
orderNumber11% 0
)110 1
;111 2
string44 
filePathLive44 
=44  !
uploader44" *
.44* +
Upload44+ 1
(441 2
orderNumber442 =
,44= >
htmlFileName44? K
,44K L
htmlFilePath44M Y
)44Y Z
;44Z [
var77 

imagesLive77 
=77 
string77 #
.77# $
Format77$ *
(77* +
$str77+ 7
,777 8
orderNumber779 D
)77D E
;77E F
uploader88 
.88 
CreateDirectory88 $
(88$ %

imagesLive88% /
)88/ 0
;880 1
var;; 
images;; 
=;; 
	Directory;; "
.;;" # 
EnumerateDirectories;;# 7
(;;7 8
	directory;;8 A
);;A B
.;;B C
FirstOrDefault;;C Q
(;;Q R
);;R S
;;;S T
foreach<< 
(<< 
var<< 
imgFile<<  
in<<! #
	Directory<<$ -
.<<- .
EnumerateFiles<<. <
(<<< =
images<<= C
)<<C D
)<<D E
{== 
var>> 
file>> 
=>> 
new>> 
FileInfo>> '
(>>' (
imgFile>>( /
)>>/ 0
;>>0 1
uploader?? 
.?? 
Upload?? 
(??  

imagesLive??  *
,??* +
file??, 0
.??0 1
Name??1 5
,??5 6
imgFile??7 >
)??> ?
;??? @
}@@ 
newCC 
DirectoryInfoCC 
(CC 
	directoryCC '
)CC' (
.CC( )
DeleteCC) /
(CC/ 0
trueCC0 4
)CC4 5
;CC5 6
returnEE 
newEE 
HtmlProcessResultEE (
(EE( )
)EE) *
{EE+ ,
StatusEE, 2
=EE3 4
statusEE5 ;
,EE; <
filePathLiveEE= I
=EEJ K
filePathLiveEEL X
}EEX Y
;EEY Z
}FF 	
publicHH 
staticHH 
UploadFileStatusHH &
ProcessHtmlHH' 2
(HH2 3
stringHH3 9
htmlFileHH: B
,HHB C
stringHHD J
outputFilePathHHK Y
)HHY Z
{II 	
stringJJ 

imagesPathJJ 
=JJ 
stringJJ  &
.JJ& '
FormatJJ' -
(JJ- .
$strJJ. ^
,JJ^ _
_orderNumberJJ` l
)JJl m
;JJm n
HtmlDocumentLL 
docLL 
=LL 
newLL "
HtmlDocumentLL# /
(LL/ 0
)LL0 1
;LL1 2
docMM 
.MM 
LoadMM 
(MM 
htmlFileMM 
)MM 
;MM 
varNN 
allSrcsNN 
=NN 
docNN 
.NN 
DocumentNodeNN *
.NN* +
SelectNodesNN+ 6
(NN6 7
$strNN7 D
)NND E
;NNE F
boolOO 
alreadyHostedOO 
=OO  
falseOO! &
;OO& '
foreachPP 
(PP 
HtmlNodePP 
nodePP "
inPP# %
allSrcsPP& -
)PP- .
{QQ 
varRR 
srcRR 
=RR 
nodeRR 
.RR 

AttributesRR )
[RR) *
$strRR* /
]RR/ 0
.RR0 1
ValueRR1 6
;RR6 7
ifTT 
(TT 
srcTT 
.TT 
ContainsTT  
(TT  !
$strTT! *
)TT* +
)TT+ ,
{UU 
alreadyHostedVV !
=VV" #
trueVV$ (
;VV( )
breakWW 
;WW 
;WW 
}XX 
elseYY 
{ZZ 
var]] 
srcs]] 
=]] 
src]] "
.]]" #
Split]]# (
(]]( )
$str]]) ,
.]], -
ToCharArray]]- 8
(]]8 9
)]]9 :
)]]: ;
;]]; <
string^^ 
imgFileName^^ &
=^^' (
srcs^^) -
.^^- .
Length^^. 4
>^^5 6
$num^^7 8
?^^9 :
srcs^^; ?
[^^? @
$num^^@ A
]^^A B
:^^C D
string^^E K
.^^K L
Empty^^L Q
;^^Q R
src__ 
=__ 
string__  
.__  !
Format__! '
(__' (
$str__( 0
,__0 1

imagesPath__2 <
,__< =
imgFileName__> I
)__I J
;__J K
}`` 
nodeaa 
.aa 
SetAttributeValueaa &
(aa& '
$straa' ,
,aa, -
srcaa. 1
)aa1 2
;aa2 3
}bb 
HtmlNodedd 
bodydd 
=dd 
docdd 
.dd  
DocumentNodedd  ,
.dd, -
SelectSingleNodedd- =
(dd= >
$strdd> F
)ddF G
;ddG H
ifee 
(ee 
_isAddViewinBrowseree #
)ee# $
{ff 
HtmlNodegg 
newNodegg  
=gg! "
HtmlNodegg# +
.gg+ ,

CreateNodegg, 6
(gg6 7
ViewInBrowsergg7 D
)ggD E
;ggE F
bodyhh 
.hh 
PrependChildhh !
(hh! "
newNodehh" )
)hh) *
;hh* +
}ii 
ifjj 
(jj 
_isAddOptoutjj 
)jj 
{kk 
HtmlNodell 
newNodell  
=ll! "
HtmlNodell# +
.ll+ ,

CreateNodell, 6
(ll6 7
OptOutll7 =
)ll= >
;ll> ?
bodymm 
.mm 
AppendChildmm  
(mm  !
newNodemm! (
)mm( )
;mm) *
}nn 
docpp 
.pp 
Savepp 
(pp 
outputFilePathpp #
)pp# $
;pp$ %
returnrr 
alreadyHostedrr  
?rr! "
UploadFileStatusrr# 3
.rr3 4
HostedWithOutImagesrr4 G
:rrH I
UploadFileStatusrrK [
.rr[ \
HostedWithImagesrr\ l
;rrl m
}ss 	
publicuu 
staticuu 
stringuu 

UploadFileuu '
(uu' (
UploadFileTypeuu( 6
uploadFileTypeuu7 E
,uuE F
stringuuG M
filePathuuN V
,uuV W
stringuuX ^
orderNumberuu_ j
)uuj k
{vv 	
FileUploaderww 
uploaderww !
=ww" #
newww$ '
FileUploaderww( 4
(ww4 5
)ww5 6
;ww6 7
uploaderzz 
.zz 
CreateDirectoryzz $
(zz$ %
orderNumberzz% 0
)zz0 1
;zz1 2
string|| 
fileName|| 
=|| 
$str||  
;||  !
switch}} 
(}} 
uploadFileType}} "
)}}" #
{~~ 
case 
UploadFileType '
.' (
ZipFile( /
:/ 0
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 =
,
��= >
orderNumber
��? J
)
��J K
;
��K L
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
TestSeedFile
��( 4
:
��4 5
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 >
,
��> ?
orderNumber
��@ K
)
��K L
;
��L M
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
LiveSeedFile
��( 4
:
��4 5
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 >
,
��> ?
orderNumber
��@ K
)
��K L
;
��L M
break
�� 
;
�� 
case
�� 
UploadFileType
�� '
.
��' (
SuppressionFile
��( 7
:
��7 8
fileName
��  
=
��! "
string
��# )
.
��) *
Format
��* 0
(
��0 1
$str
��1 >
,
��> ?
orderNumber
��@ K
)
��K L
;
��L M
break
�� 
;
�� 
}
�� 
return
�� 
uploader
�� 
.
�� 
Upload
�� "
(
��" #
orderNumber
��# .
,
��. /
fileName
��0 8
,
��8 9
filePath
��: B
)
��B C
;
��C D
}
�� 	
}
�� 
}�� ސ
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\FileProcessor.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Async 
{ 
public 

class 
FileProcessor 
{ 
public 
FileProcessor 
( 
) 
{ 	
} 	
public 
static 
void 
ProcessNewOrder *
(* +
string+ 1
OrderNumber2 =
,= >
string? E
UserNameF N
)N O
{ 	
using 
( 
var 
db 
= 
new 
WfpictContext  -
(- .
). /
)/ 0
{ 
var 
campaign 
= 
db !
.! "
	Campaigns" +
.+ ,
Include, 3
(3 4
x4 5
=>6 8
x9 :
.: ;
Assets; A
)A B
.B C
IncludeC J
(J K
xK L
=>M O
xP Q
.Q R
SegmentsR Z
)Z [
.! "
FirstOrDefault" 0
(0 1
x1 2
=>3 5
x6 7
.7 8
OrderNumber8 C
==D F
OrderNumberG R
)R S
;S T
var 
user 
= 
db 
. 
Users #
.# $
FirstOrDefault$ 2
(2 3
x3 4
=>5 7
x8 9
.9 :
UserName: B
==C E
UserNameF N
)N O
;O P
var 
ads 
= 
db 
. 
Vendors $
.$ %
FirstOrDefault% 3
(3 4
x4 5
=>6 8
x9 :
.: ;
Name; ?
.? @
Contains@ H
(H I
$strI N
)N O
)O P
;P Q
if   
(   
!   
string   
.   
IsNullOrEmpty   )
(  ) *
campaign  * 2
.  2 3
Assets  3 9
.  9 :
CreativeFiles  : G
)  G H
)  H I
{!! 
string"" 
amazonFileKey"" (
="") *
string""+ 1
.""1 2
Format""2 8
(""8 9
$str""9 K
,""K L
campaign""M U
.""U V
OrderNumber""V a
)""a b
;""b c
S3FileManager## !
.##! "
Move##" &
(##& '
campaign##' /
.##/ 0
Assets##0 6
.##6 7
CreativeFiles##7 D
,##D E
amazonFileKey##F S
,##S T
campaign##U ]
.##] ^
OrderNumber##^ i
,##i j
true##k o
)##o p
;##p q
campaign$$ 
.$$ 
Assets$$ #
.$$# $
CreativeFiles$$$ 1
=$$2 3
amazonFileKey$$4 A
;$$A B
	LogHelper%% 
.%% 
AddLog%% $
(%%$ %
db%%% '
,%%' (
LogType%%) 0
.%%0 1
FileProcessing%%1 ?
,%%? @
OrderNumber%%A L
,%%L M
$str%%N g
+%%h i
amazonFileKey%%j w
)%%w x
;%%x y
}&& 
if'' 
('' 
!'' 
string'' 
.'' 
IsNullOrEmpty'' )
('') *
campaign''* 2
.''2 3
Assets''3 9
.''9 :
ZipCodeFile'': E
)''E F
)''F G
{(( 
string)) 
amazonFileKey)) (
=))) *
string))+ 1
.))1 2
Format))2 8
())8 9
$str))9 I
,))I J
campaign))K S
.))S T
OrderNumber))T _
)))_ `
;))` a
S3FileManager** !
.**! "
Move**" &
(**& '
campaign**' /
.**/ 0
Assets**0 6
.**6 7
ZipCodeFile**7 B
,**B C
amazonFileKey**D Q
,**Q R
campaign**S [
.**[ \
OrderNumber**\ g
,**g h
true**i m
)**m n
;**n o
campaign++ 
.++ 
Assets++ #
.++# $
ZipCodeFile++$ /
=++0 1
amazonFileKey++2 ?
;++? @
	LogHelper,, 
.,, 
AddLog,, $
(,,$ %
db,,% '
,,,' (
LogType,,) 0
.,,0 1
FileProcessing,,1 ?
,,,? @
OrderNumber,,A L
,,,L M
$str,,N e
+,,f g
amazonFileKey,,h u
),,u v
;,,v w
}-- 
if.. 
(.. 
!.. 
string.. 
... 
IsNullOrEmpty.. )
(..) *
campaign..* 2
...2 3
Assets..3 9
...9 :
TestSeedFile..: F
)..F G
)..G H
{// 
string00 
amazonFileKey00 (
=00) *
string00+ 1
.001 2
Format002 8
(008 9
$str009 J
,00J K
campaign00L T
.00T U
OrderNumber00U `
)00` a
;00a b
S3FileManager11 !
.11! "
Move11" &
(11& '
campaign11' /
.11/ 0
Assets110 6
.116 7
TestSeedFile117 C
,11C D
amazonFileKey11E R
,11R S
campaign11T \
.11\ ]
OrderNumber11] h
,11h i
true11j n
)11n o
;11o p
campaign22 
.22 
Assets22 #
.22# $
TestSeedFile22$ 0
=221 2
amazonFileKey223 @
;22@ A
	LogHelper33 
.33 
AddLog33 $
(33$ %
db33% '
,33' (
LogType33) 0
.330 1
FileProcessing331 ?
,33? @
OrderNumber33A L
,33L M
$str33N f
+33g h
amazonFileKey33i v
)33v w
;33w x
}44 
if55 
(55 
!55 
string55 
.55 
IsNullOrEmpty55 )
(55) *
campaign55* 2
.552 3
Assets553 9
.559 :
LiveSeedFile55: F
)55F G
)55G H
{66 
string77 
amazonFileKey77 (
=77) *
string77+ 1
.771 2
Format772 8
(778 9
$str779 J
,77J K
campaign77L T
.77T U
OrderNumber77U `
)77` a
;77a b
S3FileManager88 !
.88! "
Move88" &
(88& '
campaign88' /
.88/ 0
Assets880 6
.886 7
LiveSeedFile887 C
,88C D
amazonFileKey88E R
,88R S
campaign88T \
.88\ ]
OrderNumber88] h
,88h i
true88j n
)88n o
;88o p
campaign99 
.99 
Assets99 #
.99# $
LiveSeedFile99$ 0
=991 2
amazonFileKey993 @
;99@ A
	LogHelper:: 
.:: 
AddLog:: $
(::$ %
db::% '
,::' (
LogType::) 0
.::0 1
FileProcessing::1 ?
,::? @
OrderNumber::A L
,::L M
$str::N f
+::g h
amazonFileKey::i v
)::v w
;::w x
};; 
if<< 
(<< 
!<< 
string<< 
.<< 
IsNullOrEmpty<< )
(<<) *
campaign<<* 2
.<<2 3
Assets<<3 9
.<<9 :
SuppressionFile<<: I
)<<I J
)<<J K
{== 
string>> 
amazonFileKey>> (
=>>) *
string>>+ 1
.>>1 2
Format>>2 8
(>>8 9
$str>>9 J
,>>J K
campaign>>L T
.>>T U
OrderNumber>>U `
)>>` a
;>>a b
S3FileManager?? !
.??! "
Move??" &
(??& '
campaign??' /
.??/ 0
Assets??0 6
.??6 7
SuppressionFile??7 F
,??F G
amazonFileKey??H U
,??U V
campaign??W _
.??_ `
OrderNumber??` k
,??k l
true??m q
)??q r
;??r s
campaign@@ 
.@@ 
Assets@@ #
.@@# $
SuppressionFile@@$ 3
=@@4 5
amazonFileKey@@6 C
;@@C D
	LogHelperAA 
.AA 
AddLogAA $
(AA$ %
dbAA% '
,AA' (
LogTypeAA) 0
.AA0 1
FileProcessingAA1 ?
,AA? @
OrderNumberAAA L
,AAL M
$strAAN i
+AAj k
amazonFileKeyAAl y
)AAy z
;AAz {
}BB 
ifCC 
(CC 
!CC 
stringCC 
.CC 
IsNullOrEmptyCC )
(CC) *
campaignCC* 2
.CC2 3
AssetsCC3 9
.CC9 :
BannersFileCC: E
)CCE F
)CCF G
{DD 
stringEE 
amazonFileKeyEE (
=EE) *
stringEE+ 1
.EE1 2
FormatEE2 8
(EE8 9
$strEE9 L
,EEL M
campaignEEN V
.EEV W
OrderNumberEEW b
,EEb c
PathEEd h
.EEh i
GetExtensionEEi u
(EEu v
campaignEEv ~
.EE~ 
Assets	EE �
.
EE� �
BannersFile
EE� �
)
EE� �
)
EE� �
;
EE� �
S3FileManagerFF !
.FF! "
MoveFF" &
(FF& '
campaignFF' /
.FF/ 0
AssetsFF0 6
.FF6 7
BannersFileFF7 B
,FFB C
amazonFileKeyFFD Q
,FFQ R
campaignFFS [
.FF[ \
OrderNumberFF\ g
,FFg h
trueFFi m
)FFm n
;FFn o
campaignGG 
.GG 
AssetsGG #
.GG# $
BannersFileGG$ /
=GG0 1
amazonFileKeyGG2 ?
;GG? @
	LogHelperHH 
.HH 
AddLogHH $
(HH$ %
dbHH% '
,HH' (
LogTypeHH) 0
.HH0 1
FileProcessingHH1 ?
,HH? @
OrderNumberHHA L
,HHL M
$strHHN e
+HHf g
amazonFileKeyHHh u
)HHu v
;HHv w
}II 
ifJJ 
(JJ 
!JJ 
stringJJ 
.JJ 
IsNullOrEmptyJJ )
(JJ) *
campaignJJ* 2
.JJ2 3
AssetsJJ3 9
.JJ9 :
BannerLinksFileJJ: I
)JJI J
)JJJ K
{KK 
stringLL 
amazonFileKeyLL (
=LL) *
stringLL+ 1
.LL1 2
FormatLL2 8
(LL8 9
$strLL9 Q
,LLQ R
campaignLLS [
.LL[ \
OrderNumberLL\ g
,LLg h
PathLLi m
.LLm n
GetExtensionLLn z
(LLz {
campaign	LL{ �
.
LL� �
Assets
LL� �
.
LL� �
BannerLinksFile
LL� �
)
LL� �
)
LL� �
;
LL� �
S3FileManagerMM !
.MM! "
MoveMM" &
(MM& '
campaignMM' /
.MM/ 0
AssetsMM0 6
.MM6 7
BannerLinksFileMM7 F
,MMF G
amazonFileKeyMMH U
,MMU V
campaignMMW _
.MM_ `
OrderNumberMM` k
,MMk l
trueMMm q
)MMq r
;MMr s
campaignNN 
.NN 
AssetsNN #
.NN# $
BannerLinksFileNN$ 3
=NN4 5
amazonFileKeyNN6 C
;NNC D
	LogHelperOO 
.OO 
AddLogOO $
(OO$ %
dbOO% '
,OO' (
LogTypeOO) 0
.OO0 1
FileProcessingOO1 ?
,OO? @
OrderNumberOOA L
,OOL M
$strOON i
+OOj k
amazonFileKeyOOl y
)OOy z
;OOz {
}PP 
ifQQ 
(QQ 
!QQ 
stringQQ 
.QQ 
IsNullOrEmptyQQ )
(QQ) *
campaignQQ* 2
.QQ2 3
AssetsQQ3 9
.QQ9 :
MiscFileQQ: B
)QQB C
)QQC D
{RR 
stringSS 
amazonFileKeySS (
=SS) *
stringSS+ 1
.SS1 2
FormatSS2 8
(SS8 9
$strSS9 J
,SSJ K
campaignSSL T
.SST U
OrderNumberSSU `
,SS` a
PathSSb f
.SSf g
GetExtensionSSg s
(SSs t
campaignSSt |
.SS| }
Assets	SS} �
.
SS� �
MiscFile
SS� �
)
SS� �
)
SS� �
;
SS� �
S3FileManagerTT !
.TT! "
MoveTT" &
(TT& '
campaignTT' /
.TT/ 0
AssetsTT0 6
.TT6 7
MiscFileTT7 ?
,TT? @
amazonFileKeyTTA N
,TTN O
campaignTTP X
.TTX Y
OrderNumberTTY d
,TTd e
trueTTf j
)TTj k
;TTk l
campaignUU 
.UU 
AssetsUU #
.UU# $
MiscFileUU$ ,
=UU- .
amazonFileKeyUU/ <
;UU< =
	LogHelperVV 
.VV 
AddLogVV $
(VV$ %
dbVV% '
,VV' (
LogTypeVV) 0
.VV0 1
FileProcessingVV1 ?
,VV? @
OrderNumberVVA L
,VVL M
$strVVN b
+VVc d
amazonFileKeyVVe r
)VVr s
;VVs t
}WW 
foreachYY 
(YY 
varYY 
segmentYY $
inYY% '
campaignYY( 0
.YY0 1
SegmentsYY1 9
)YY9 :
{ZZ 
string[[ 
amazonFileKey[[ (
=[[) *
string[[+ 1
.[[1 2
Format[[2 8
([[8 9
$str[[9 K
,[[K L
campaign[[M U
.[[U V
OrderNumber[[V a
,[[a b
segment[[c j
.[[j k
SegmentNumber[[k x
)[[x y
;[[y z
S3FileManager\\ !
.\\! "
Move\\" &
(\\& '
segment\\' .
.\\. /
CreativeFiles\\/ <
,\\< =
amazonFileKey\\> K
,\\K L
campaign\\M U
.\\U V
OrderNumber\\V a
,\\a b
true\\c g
)\\g h
;\\h i
segment]] 
.]] 
CreativeFiles]] )
=]]* +
amazonFileKey]], 9
;]]9 :
	LogHelper^^ 
.^^ 
AddLog^^ $
(^^$ %
db^^% '
,^^' (
LogType^^) 0
.^^0 1
FileProcessing^^1 ?
,^^? @
OrderNumber^^A L
,^^L M
$str^^N Y
+^^Z [
segment^^\ c
.^^c d
SegmentNumber^^d q
+^^r s
$str	^^t �
+
^^� �
amazonFileKey
^^� �
)
^^� �
;
^^� �
}__ 
dbaa 
.aa 
SaveChangesaa 
(aa 
)aa  
;aa  !
EmailHelpercc 
.cc "
SendOrderEmailToClientcc 2
(cc2 3
campaigncc3 ;
,cc; <
usercc= A
,ccA B
adsccC F
?ccF G
.ccG H
CCEmailsccH P
)ccP Q
;ccQ R
	LogHelperee 
.ee 
AddLogee  
(ee  !
dbee! #
,ee# $
LogTypeee% ,
.ee, -
Ordersee- 3
,ee3 4
campaignee5 =
.ee= >
OrderNumberee> I
,eeI J
$streeK W
+eeX Y
campaigneeZ b
.eeb c
CampaignNameeec o
+eep q
$str	eer �
+
ee� �
campaign
ee� �
.
ee� � 
RepresentativeName
ee� �
)
ee� �
;
ee� �
}ff 
}gg 	
publicii 
staticii 
voidii "
ProcessAssetUpdateUrlsii 1
(ii1 2
stringii2 8

UploadPathii9 C
,iiC D
stringiiE K
OrderNumberiiL W
)iiW X
{jj 	
usingkk 
(kk 
varkk 
dbkk 
=kk 
newkk 
WfpictContextkk  -
(kk- .
)kk. /
)kk/ 0
{ll 
varmm 
campaignmm 
=mm 
dbmm !
.mm! "
	Campaignsmm" +
.mm+ ,
Includemm, 3
(mm3 4
xmm4 5
=>mm6 8
xmm9 :
.mm: ;
Assetsmm; A
)mmA B
.mmB C
FirstOrDefaultmmC Q
(mmQ R
xmmR S
=>mmT V
xmmW X
.mmX Y
OrderNumbermmY d
==mme g
OrderNumbermmh s
)mms t
;mmt u
varoo 
	directoryoo 
=oo 
stringoo  &
.oo& '
Formatoo' -
(oo- .
$stroo. 8
,oo8 9

UploadPathoo: D
,ooD E
campaignooF N
.ooN O
OrderNumberooO Z
)ooZ [
;oo[ \
ifpp 
(pp 
!pp 
	Directorypp 
.pp 
Existspp %
(pp% &
	directorypp& /
)pp/ 0
)pp0 1
	Directorypp2 ;
.pp; <
CreateDirectorypp< K
(ppK L
	directoryppL U
)ppU V
;ppV W
tryss 
{tt 
ifuu 
(uu 
!uu 
stringuu 
.uu  
IsNullOrEmptyuu  -
(uu- .
campaignuu. 6
.uu6 7
Assetsuu7 =
.uu= >
CreativeFilesuu> K
)uuK L
)uuL M
{vv 
stringww 
filePathww '
=ww( )
Pathww* .
.ww. /
Combineww/ 6
(ww6 7

UploadPathww7 A
,wwA B
campaignwwC K
.wwK L
AssetswwL R
.wwR S
CreativeFileswwS `
)ww` a
;wwa b
S3FileManagerxx %
.xx% &
Downloadxx& .
(xx. /
campaignxx/ 7
.xx7 8
Assetsxx8 >
.xx> ?
CreativeFilesxx? L
,xxL M
filePathxxN V
)xxV W
;xxW X
varyy 
resultyy "
=yy# $
FileManageryy% 0
.yy0 1
ProcessHtmlZipyy1 ?
(yy? @

UploadPathyy@ J
,yyJ K
filePathyyL T
,yyT U
campaignyyV ^
.yy^ _
OrderNumberyy_ j
,yyj k
campaignyyl t
.yyt u
IsAddOptOut	yyu �
,
yy� �
campaign
yy� �
.
yy� � 
IsAddViewInBrowser
yy� �
)
yy� �
;
yy� �
campaignzz  
.zz  !
Assetszz! '
.zz' (
CreativeUrlzz( 3
=zz4 5
resultzz6 <
.zz< =
filePathLivezz= I
;zzI J
campaign{{  
.{{  !
Assets{{! '
.{{' (
CreativeStatus{{( 6
={{7 8
({{9 :
int{{: =
){{= >
result{{> D
.{{D E
Status{{E K
;{{K L
	LogHelper|| !
.||! "
AddLog||" (
(||( )
db||) +
,||+ ,
LogType||- 4
.||4 5
FileProcessing||5 C
,||C D
OrderNumber||E P
,||P Q
$str||R m
+||n o
campaign||p x
.||x y
Assets||y 
.	|| �
CreativeUrl
||� �
+
||� �
$str
||� �
+
||� �
System
||� �
.
||� �
Enum
||� �
.
||� �
GetName
||� �
(
||� �
typeof
||� �
(
||� �
UploadFileStatus
||� �
)
||� �
,
||� �
campaign
||� �
.
||� �
Assets
||� �
.
||� �
CreativeStatus
||� �
)
||� �
)
||� �
;
||� �
}}} 
}~~ 
catch 
( 
	Exception  
ex! #
)# $
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $
CreativeStatus
��$ 2
=
��3 4
(
��5 6
int
��6 9
)
��9 :
UploadFileStatus
��: J
.
��J K
Failed
��K Q
;
��Q R
	LogHelper
�� 
.
�� 
AddError
�� &
(
��& '
db
��' )
,
��) *
LogType
��+ 2
.
��2 3
FileProcessing
��3 A
,
��A B
OrderNumber
��C N
,
��N O
$str
��P s
+
��t u
ex
��v x
.
��x y
Message��y �
+��� �
$str��� �
+��� �
System��� �
.��� �
Enum��� �
.��� �
GetName��� �
(��� �
typeof��� �
(��� � 
UploadFileStatus��� �
)��� �
,��� �
campaign��� �
.��� �
Assets��� �
.��� �
CreativeStatus��� �
)��� �
)��� �
;��� �
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
ZipCodeFile
��: E
)
��E F
)
��F G
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $

ZipCodeUrl
��$ .
=
��/ 0
FileManager
��1 <
.
��< =
GetFilePathLive
��= L
(
��L M
UploadFileType
��M [
.
��[ \
ZipFile
��\ c
,
��c d
campaign
��  
.
��  !
OrderNumber
��! ,
)
��, -
;
��- .
campaign
�� 
.
�� 
Assets
�� #
.
��# $
ZipCodeStatus
��$ 1
=
��2 3
(
��4 5
int
��5 8
)
��8 9
UploadFileStatus
��: J
.
��J K
	Completed
��K T
;
��T U
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� 1
+
��2 3
campaign
��4 <
.
��< =
Assets
��= C
.
��C D

ZipCodeUrl
��D N
+
��O P
$str
��Q ]
+
��^ _
System
�� 
.
�� 
Enum
�� #
.
��# $
GetName
��$ +
(
��+ ,
typeof
��, 2
(
��2 3
UploadFileStatus
��3 C
)
��C D
,
��D E
campaign
��F N
.
��N O
Assets
��O U
.
��U V
ZipCodeStatus
��V c
)
��c d
)
��d e
;
��e f
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
TestSeedFile
��: F
)
��F G
)
��G H
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $
TestSeedUrl
��$ /
=
��0 1
FileManager
��2 =
.
��= >
GetFilePathLive
��> M
(
��M N
UploadFileType
��N \
.
��\ ]
TestSeedFile
��] i
,
��i j
campaign
��  
.
��  !
OrderNumber
��! ,
)
��, -
;
��- .
campaign
�� 
.
�� 
Assets
�� #
.
��# $
TestSeedStatus
��$ 2
=
��3 4
(
��5 6
int
��6 9
)
��9 :
UploadFileStatus
��; K
.
��K L
	Completed
��L U
;
��U V
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� 2
+
��3 4
campaign
��5 =
.
��= >
Assets
��> D
.
��D E
TestSeedUrl
��E P
+
��Q R
$str
��S _
+
��` a
System
�� 
.
�� 
Enum
�� "
.
��" #
GetName
��# *
(
��* +
typeof
��+ 1
(
��1 2
UploadFileStatus
��2 B
)
��B C
,
��C D
campaign
��E M
.
��M N
Assets
��N T
.
��T U
TestSeedStatus
��U c
)
��c d
)
��d e
;
��e f
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
LiveSeedFile
��: F
)
��F G
)
��G H
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $
LiveSeedUrl
��$ /
=
��0 1
FileManager
��2 =
.
��= >
GetFilePathLive
��> M
(
��M N
UploadFileType
��N \
.
��\ ]
LiveSeedFile
��] i
,
��i j
campaign
��  
.
��  !
OrderNumber
��! ,
)
��, -
;
��- .
campaign
�� 
.
�� 
Assets
�� #
.
��# $
LiveSeedStatus
��$ 2
=
��3 4
(
��5 6
int
��6 9
)
��9 :
UploadFileStatus
��; K
.
��K L
	Completed
��L U
;
��U V
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� 2
+
��3 4
campaign
��5 =
.
��= >
Assets
��> D
.
��D E
LiveSeedUrl
��E P
+
��Q R
$str
��S _
+
��` a
System
�� 
.
�� 
Enum
�� #
.
��# $
GetName
��$ +
(
��+ ,
typeof
��, 2
(
��2 3
UploadFileStatus
��3 C
)
��C D
,
��D E
campaign
��F N
.
��N O
Assets
��O U
.
��U V
LiveSeedStatus
��V d
)
��d e
)
��e f
;
��f g
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
SuppressionFile
��: I
)
��I J
)
��J K
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $
SuppressionUrl
��$ 2
=
��3 4
FileManager
��5 @
.
��@ A
GetFilePathLive
��A P
(
��P Q
UploadFileType
��Q _
.
��_ `
SuppressionFile
��` o
,
��o p
campaign
��  
.
��  !
OrderNumber
��! ,
)
��, -
;
��- .
campaign
�� 
.
�� 
Assets
�� #
.
��# $
SuppressionStatus
��$ 5
=
��6 7
(
��8 9
int
��9 <
)
��< =
UploadFileStatus
��> N
.
��N O
	Completed
��O X
;
��X Y
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� 5
+
��6 7
campaign
��8 @
.
��@ A
Assets
��A G
.
��G H
SuppressionUrl
��H V
+
��W X
$str
��Y e
+
��f g
System
�� 
.
�� 
Enum
�� #
.
��# $
GetName
��$ +
(
��+ ,
typeof
��, 2
(
��2 3
UploadFileStatus
��3 C
)
��C D
,
��D E
campaign
��F N
.
��N O
Assets
��O U
.
��U V
SuppressionStatus
��V g
)
��g h
)
��h i
;
��i j
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
BannersFile
��: E
)
��E F
)
��F G
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $

BannersUrl
��$ .
=
��/ 0
FileManager
��1 <
.
��< =
GetFilePathLive
��= L
(
��L M
UploadFileType
��M [
.
��[ \
BannersFile
��\ g
,
��g h
campaign
��  
.
��  !
OrderNumber
��! ,
,
��, -
Path
��. 2
.
��2 3
GetExtension
��3 ?
(
��? @
campaign
��@ H
.
��H I
Assets
��I O
.
��O P
BannersFile
��P [
)
��[ \
)
��\ ]
;
��] ^
campaign
�� 
.
�� 
Assets
�� #
.
��# $
BannersStatus
��$ 1
=
��2 3
(
��4 5
int
��5 8
)
��8 9
UploadFileStatus
��9 I
.
��I J
	Completed
��J S
;
��S T
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� 1
+
��2 3
campaign
��4 <
.
��< =
Assets
��= C
.
��C D

BannersUrl
��D N
+
��O P
$str
��Q ]
+
��^ _
System
�� 
.
�� 
Enum
�� #
.
��# $
GetName
��$ +
(
��+ ,
typeof
��, 2
(
��2 3
UploadFileStatus
��3 C
)
��C D
,
��D E
campaign
��F N
.
��N O
Assets
��O U
.
��U V
BannersStatus
��V c
)
��c d
)
��d e
;
��e f
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
BannerLinksFile
��: I
)
��I J
)
��J K
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $
BannerLinksUrl
��$ 2
=
��3 4
FileManager
��5 @
.
��@ A
GetFilePathLive
��A P
(
��P Q
UploadFileType
��Q _
.
��_ `
BannersLinksFile
��` p
,
��p q
campaign
�� 
.
��  
OrderNumber
��  +
,
��+ ,
Path
��- 1
.
��1 2
GetExtension
��2 >
(
��> ?
campaign
��? G
.
��G H
Assets
��H N
.
��N O
BannerLinksFile
��O ^
)
��^ _
)
��_ `
;
��` a
campaign
�� 
.
�� 
Assets
�� #
.
��# $
BannerLinksStatus
��$ 5
=
��6 7
(
��8 9
int
��9 <
)
��< =
UploadFileStatus
��= M
.
��M N
	Completed
��N W
;
��W X
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� 5
+
��6 7
campaign
��8 @
.
��@ A
Assets
��A G
.
��G H
BannerLinksUrl
��H V
+
��W X
$str
��Y e
+
��f g
System
�� 
.
�� 
Enum
�� #
.
��# $
GetName
��$ +
(
��+ ,
typeof
��, 2
(
��2 3
UploadFileStatus
��3 C
)
��C D
,
��D E
campaign
��F N
.
��N O
Assets
��O U
.
��U V
BannerLinksStatus
��V g
)
��g h
)
��h i
;
��i j
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *
campaign
��* 2
.
��2 3
Assets
��3 9
.
��9 :
MiscFile
��: B
)
��B C
)
��C D
{
�� 
campaign
�� 
.
�� 
Assets
�� #
.
��# $
MiscUrl
��$ +
=
��, -
FileManager
��. 9
.
��9 :
GetFilePathLive
��: I
(
��I J
UploadFileType
��J X
.
��X Y
MiscFile
��Y a
,
��a b
campaign
�� 
.
��  
OrderNumber
��  +
,
��+ ,
Path
��- 1
.
��1 2
GetExtension
��2 >
(
��> ?
campaign
��? G
.
��G H
Assets
��H N
.
��N O
MiscFile
��O W
)
��W X
)
��X Y
;
��Y Z
campaign
�� 
.
�� 
Assets
�� #
.
��# $

MiscStatus
��$ .
=
��/ 0
(
��1 2
int
��2 5
)
��5 6
UploadFileStatus
��6 F
.
��F G
	Completed
��G P
;
��P Q
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
FileProcessing
��1 ?
,
��? @
OrderNumber
��A L
,
��L M
$str
�� .
+
��/ 0
campaign
��1 9
.
��9 :
Assets
��: @
.
��@ A
MiscUrl
��A H
+
��I J
$str
��K W
+
��X Y
System
�� 
.
�� 
Enum
�� #
.
��# $
GetName
��$ +
(
��+ ,
typeof
��, 2
(
��2 3
UploadFileStatus
��3 C
)
��C D
,
��D E
campaign
��F N
.
��N O
Assets
��O U
.
��U V

MiscStatus
��V `
)
��` a
)
��a b
;
��b c
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �8
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\FileUploader.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Async 
{ 
public 

class 
FileUploader 
{ 
private		 
bool		 
_uploadCompleted		 %
;		% &
private

 
bool

 
_status

 
;

 
private 
string 

_ftpServer !
;! "
private 
string 
_ftpUsername #
;# $
private 
string 
_ftpPassword #
;# $
private 
string 
_baseURL 
;  
private 
string 
serverPrefix #
=$ %
$str& K
;K L
public 
FileUploader 
( 
) 
{ 	
if 
(  
ConfigurationManager $
.$ %
AppSettings% 0
[0 1
$str1 <
]< =
==> @
nullA E
)E F
throw 
new 
	Exception #
(# $
$str$ >
)> ?
;? @
if 
(  
ConfigurationManager $
.$ %
AppSettings% 0
[0 1
$str1 >
]> ?
==@ B
nullC G
)G H
throw 
new 
	Exception #
(# $
$str$ @
)@ A
;A B
if 
(  
ConfigurationManager $
.$ %
AppSettings% 0
[0 1
$str1 >
]> ?
==@ B
nullC G
)G H
throw 
new 
	Exception #
(# $
$str$ @
)@ A
;A B

_ftpServer 
=  
ConfigurationManager -
.- .
AppSettings. 9
[9 :
$str: E
]E F
;F G
_ftpUsername 
=  
ConfigurationManager /
./ 0
AppSettings0 ;
[; <
$str< I
]I J
;J K
_ftpPassword 
=  
ConfigurationManager /
./ 0
AppSettings0 ;
[; <
$str< I
]I J
;J K
_baseURL 
= 
String 
. 
Format $
($ %
$str% A
,A B

_ftpServerC M
)M N
;N O
} 	
public!! 
bool!! 
DirectoryExists!! #
(!!# $
string!!$ *
directoryPath!!+ 8
)!!8 9
{"" 	
bool## 
directoryExists##  
;##  !
var$$ 
request$$ 
=$$ 
($$ 
FtpWebRequest$$ (
)$$( )

WebRequest$$) 3
.$$3 4
Create$$4 :
($$: ;
directoryPath$$; H
+$$I J
$str$$K N
)$$N O
;$$O P
request%% 
.%% 
Method%% 
=%% 
WebRequestMethods%% .
.%%. /
Ftp%%/ 2
.%%2 3
ListDirectory%%3 @
;%%@ A
request&& 
.&& 
Credentials&& 
=&&  !
new&&" %
NetworkCredential&&& 7
(&&7 8
_ftpUsername&&8 D
,&&D E
_ftpPassword&&F R
)&&R S
;&&S T
try'' 
{(( 
using)) 
()) 
request)) 
.)) 
GetResponse)) *
())* +
)))+ ,
))), -
{** 
directoryExists++ #
=++$ %
true++& *
;++* +
},, 
}-- 
catch.. 
(.. 
WebException.. 
ex..  "
).." #
{// 
directoryExists00 
=00  !
false00" '
;00' (
}11 
return22 
directoryExists22 "
;22" #
}33 	
public55 
void55 
CreateDirectory55 #
(55# $
string55$ *
directoryName55+ 8
)558 9
{66 	
string77 
directoryPath77  
=77! "
_baseURL77# +
+77, -
directoryName77. ;
;77; <
if99 
(99 
DirectoryExists99 
(99 
directoryPath99 ,
)99, -
)99- .
return99/ 5
;995 6

WebRequest;; 
request;; 
=;;  

WebRequest;;! +
.;;+ ,
Create;;, 2
(;;2 3
directoryPath;;3 @
);;@ A
;;;A B
request<< 
.<< 
Method<< 
=<< 
WebRequestMethods<< .
.<<. /
Ftp<</ 2
.<<2 3
MakeDirectory<<3 @
;<<@ A
request== 
.== 
Credentials== 
===  !
new==" %
NetworkCredential==& 7
(==7 8
_ftpUsername==8 D
,==D E
_ftpPassword==F R
)==R S
;==S T
try>> 
{?? 
var@@ 
resp@@ 
=@@ 
(@@ 
FtpWebResponse@@ *
)@@* +
request@@, 3
.@@3 4
GetResponse@@4 ?
(@@? @
)@@@ A
;@@A B
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
}DD 
}EE 	
publicGG 
stringGG 
UploadGG 
(GG 
stringGG #
directoryNameGG$ 1
,GG1 2
stringGG3 9
fileNameGG: B
,GGB C
stringGGD J
filePathGGK S
)GGS T
{HH 	
usingII 
(II 
	WebClientII 
_clientII $
=II% &
newII' *
	WebClientII+ 4
(II4 5
)II5 6
)II6 7
{JJ 
_clientKK 
.KK 
CredentialsKK #
=KK$ %
newKK& )
NetworkCredentialKK* ;
(KK; <
_ftpUsernameKK< H
,KKH I
_ftpPasswordKKJ V
)KKV W
;KKW X
stringLL 
filePathFTPLL "
=LL# $
_baseURLLL% -
+LL. /
directoryNameLL0 =
+LL> ?
$strLL@ C
+LLD E
fileNameLLF N
;LLN O
UriMM 
addressMM 
=MM 
newMM !
UriMM" %
(MM% &
filePathFTPMM& 1
)MM1 2
;MM2 3
_clientNN 
.NN 

UploadFileNN "
(NN" #
addressNN# *
,NN* +
filePathNN, 4
)NN4 5
;NN5 6
stringOO 
filePathLiveOO #
=OO$ %
serverPrefixOO& 2
+OO3 4
directoryNameOO5 B
+OOC D
$strOOE H
+OOI J
fileNameOOK S
;OOS T
returnPP 
filePathLivePP #
;PP# $
}QQ 
}RR 	
}SS 
}TT �O
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ImageHelper.cs
	namespace

 	
WFP


 
.

 
ICT

 
.

 
Web

 
.

 
Helpers

 
{ 
public 

class 
ImageHelper 
{ 
private 
string 
_url 
; 
private 
string 
	_filePath  
;  !
public 
ImageHelper 
( 
string !
url" %
,% &
string' -
filePath. 6
)6 7
{ 	
_url 
= 
url 
; 
	_filePath 
= 
filePath  
;  !
} 	
public 
void 
Capture 
( 
) 
{ 	
Thread 
thread 
= 
new 
Thread  &
(& '
delegate' /
(0 1
)1 2
{ 
using 
( 

WebBrowser !
browser" )
=* +
new, /

WebBrowser0 :
(: ;
); <
)< =
{ 
browser 
. 
ScrollBarsEnabled -
=. /
false0 5
;5 6
browser 
. 
AllowNavigation +
=, -
true. 2
;2 3
browser 
. "
ScriptErrorsSuppressed 2
=3 4
true5 9
;9 :
browser 
. 
Navigate $
($ %
_url% )
)) *
;* +
browser"" 
."" 
DocumentCompleted"" -
+="". 0
new""1 43
'WebBrowserDocumentCompletedEventHandler""5 \
(""\ ]
DocumentCompleted""] n
)""n o
;""o p
while## 
(## 
browser## "
.##" #

ReadyState### -
!=##. 0 
WebBrowserReadyState##1 E
.##E F
Complete##F N
)##N O
{$$ 
System%% 
.%% 
Windows%% &
.%%& '
Forms%%' ,
.%%, -
Application%%- 8
.%%8 9
DoEvents%%9 A
(%%A B
)%%B C
;%%C D
}&& 
}'' 
}(( 
)(( 
;(( 
thread)) 
.)) 
SetApartmentState)) $
())$ %
ApartmentState))% 3
.))3 4
STA))4 7
)))7 8
;))8 9
thread** 
.** 
Start** 
(** 
)** 
;** 
thread++ 
.++ 
Join++ 
(++ 
)++ 
;++ 
},, 	
private.. 
void.. 
DocumentCompleted.. &
(..& '
object..' -
sender... 4
,..4 50
$WebBrowserDocumentCompletedEventArgs..6 Z
e..[ \
)..\ ]
{// 	

WebBrowser00 
wb00 
=00 
sender00 "
as00# %

WebBrowser00& 0
;000 1
if11 
(11 
!11 
wb11 
.11 
Document11 
.11 
Title11 "
.11" #
Equals11# )
(11) *
$str11* >
)11> ?
)11? @
{22 
int33 
scrollWidth33 
=33  !
$num33" #
;33# $
int44 
scrollHeight44  
=44! "
$num44# $
;44$ %
scrollHeight66 
=66 
wb66 !
.66! "
Document66" *
.66* +
Body66+ /
.66/ 0
ScrollRectangle660 ?
.66? @
Height66@ F
;66F G
scrollWidth77 
=77 
wb77  
.77  !
Document77! )
.77) *
Body77* .
.77. /
ScrollRectangle77/ >
.77> ?
Width77? D
;77D E
wb88 
.88 
Size88 
=88 
new88 
Size88 "
(88" #
scrollWidth88# .
,88. /
scrollHeight880 <
)88< =
;88= >
Bitmap;; 
bitmap;; 
=;; 
new;;  #
Bitmap;;$ *
(;;* +
wb;;+ -
.;;- .
Width;;. 3
,;;3 4
wb;;5 7
.;;7 8
Height;;8 >
);;> ?
;;;? @
for<< 
(<< 
int<< 
Xcount<< 
=<<  !
$num<<" #
;<<# $
Xcount<<% +
<<<, -
bitmap<<. 4
.<<4 5
Width<<5 :
;<<: ;
Xcount<<< B
++<<B D
)<<D E
for== 
(== 
int== 
Ycount== #
===$ %
$num==& '
;==' (
Ycount==) /
<==0 1
bitmap==2 8
.==8 9
Height==9 ?
;==? @
Ycount==A G
++==G I
)==I J
bitmap>> 
.>> 
SetPixel>> '
(>>' (
Xcount>>( .
,>>. /
Ycount>>0 6
,>>6 7
Color>>8 =
.>>= >
Black>>> C
)>>C D
;>>D E
wb?? 
.?? 
DrawToBitmap?? 
(??  
bitmap??  &
,??& '
new??( +
	Rectangle??, 5
(??5 6
$num??6 7
,??7 8
$num??9 :
,??: ;
wb??< >
.??> ?
Width??? D
,??D E
wb??F H
.??H I
Height??I O
)??O P
)??P Q
;??Q R
bitmap@@ 
.@@ 
Save@@ 
(@@ 
	_filePath@@ %
,@@% &
ImageFormat@@' 2
.@@2 3
Png@@3 6
)@@6 7
;@@7 8
}AA 
}BB 	
publicCC 
staticCC 
stringCC 
GetCapturedImageCC -
(CC- .
stringCC. 4
urlCC5 8
,CC8 9
stringCC: @
filePathCCA I
)CCI J
{DD 	
tryEE 
{FF 
HttpWebRequestGG 
requestGG &
=GG' (
HttpWebRequestGG) 7
.GG7 8
CreateGG8 >
(GG> ?
urlGG? B
)GGB C
asGGD F
HttpWebRequestGGG U
;GGU V
BitmapHH 
bitmapHH 
;HH 
usingII 
(II 
StreamII 
streamII $
=II% &
requestII' .
.II. /
GetResponseII/ :
(II: ;
)II; <
.II< =
GetResponseStreamII= N
(IIN O
)IIO P
)IIP Q
{JJ 
bitmapKK 
=KK 
newKK  
BitmapKK! '
(KK' (
streamKK( .
)KK. /
;KK/ 0
bitmapLL 
.LL 
SaveLL 
(LL  
filePathLL  (
)LL( )
;LL) *
}MM 
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
}QQ 
returnRR 
filePathRR 
;RR 
}SS 	
publicUU 
voidUU 
ResizeImageUU 
(UU  
stringUU  &
OriginalFileUU' 3
,UU3 4
stringUU5 ;
NewFileUU< C
,UUC D
intUUE H
NewWidthUUI Q
,UUQ R
intUUS V
	MaxHeightUUW `
,UU` a
boolUUb f
OnlyResizeIfWiderUUg x
)UUx y
{VV 	
SystemWW 
.WW 
DrawingWW 
.WW 
ImageWW  
FullsizeImageWW! .
=WW/ 0
SystemWW1 7
.WW7 8
DrawingWW8 ?
.WW? @
ImageWW@ E
.WWE F
FromFileWWF N
(WWN O
OriginalFileWWO [
)WW[ \
;WW\ ]
FullsizeImageZZ 
.ZZ 

RotateFlipZZ $
(ZZ$ %
SystemZZ% +
.ZZ+ ,
DrawingZZ, 3
.ZZ3 4
RotateFlipTypeZZ4 B
.ZZB C
Rotate180FlipNoneZZC T
)ZZT U
;ZZU V
FullsizeImage[[ 
.[[ 

RotateFlip[[ $
([[$ %
System[[% +
.[[+ ,
Drawing[[, 3
.[[3 4
RotateFlipType[[4 B
.[[B C
Rotate180FlipNone[[C T
)[[T U
;[[U V
if]] 
(]] 
OnlyResizeIfWider]] !
)]]! "
{^^ 
if__ 
(__ 
FullsizeImage__ !
.__! "
Width__" '
<=__( *
NewWidth__+ 3
)__3 4
{`` 
NewWidthaa 
=aa 
FullsizeImageaa ,
.aa, -
Widthaa- 2
;aa2 3
}bb 
}cc 
intee 
	NewHeightee 
=ee 
FullsizeImageee )
.ee) *
Heightee* 0
*ee1 2
NewWidthee3 ;
/ee< =
FullsizeImageee> K
.eeK L
WidtheeL Q
;eeQ R
ifff 
(ff 
	NewHeightff 
>ff 
	MaxHeightff %
)ff% &
{gg 
NewWidthii 
=ii 
FullsizeImageii (
.ii( )
Widthii) .
*ii/ 0
	MaxHeightii1 :
/ii; <
FullsizeImageii= J
.iiJ K
HeightiiK Q
;iiQ R
	NewHeightjj 
=jj 
	MaxHeightjj %
;jj% &
}kk 
Systemmm 
.mm 
Drawingmm 
.mm 
Imagemm  
NewImagemm! )
=mm* +
FullsizeImagemm, 9
.mm9 :
GetThumbnailImagemm: K
(mmK L
NewWidthmmL T
,mmT U
	NewHeightmmV _
,mm_ `
nullmma e
,mme f
IntPtrmmg m
.mmm n
Zerommn r
)mmr s
;mms t
FullsizeImagepp 
.pp 
Disposepp !
(pp! "
)pp" #
;pp# $
NewImagess 
.ss 
Savess 
(ss 
NewFiless !
)ss! "
;ss" #
}tt 	
}uu 
}vv �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\KeyGenerator.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
KeyGenerator 
{ 
public 
static 
string 
GetUniqueKey )
() *
int* -
maxSize. 5
)5 6
{		 	
char

 
[

 
]

 
chars

 
=

 
new

 
char

 #
[

# $
$num

$ &
]

& '
;

' (
chars 
= 
$str :
.: ;
ToCharArray; F
(F G
)G H
;H I
byte 
[ 
] 
data 
= 
new 
byte "
[" #
$num# $
]$ %
;% &
using 
( $
RNGCryptoServiceProvider +
crypto, 2
=3 4
new5 8$
RNGCryptoServiceProvider9 Q
(Q R
)R S
)S T
{ 
crypto 
. 
GetNonZeroBytes &
(& '
data' +
)+ ,
;, -
data 
= 
new 
byte 
[  
maxSize  '
]' (
;( )
crypto 
. 
GetNonZeroBytes &
(& '
data' +
)+ ,
;, -
} 
StringBuilder 
result  
=! "
new# &
StringBuilder' 4
(4 5
maxSize5 <
)< =
;= >
foreach 
( 
byte 
b 
in 
data #
)# $
{ 
result 
. 
Append 
( 
chars #
[# $
b$ %
%& '
(( )
chars) .
.. /
Length/ 5
)5 6
]6 7
)7 8
;8 9
} 
return 
result 
. 
ToString "
(" #
)# $
;$ %
} 	
} 
} �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ListExtensions.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

static 
class 
ListExtensions &
{ 
public		 
static		 
DataSet		 
	ToDataSet		 '
<		' (
T		( )
>		) *
(		* +
this		+ /
IList		0 5
<		5 6
T		6 7
>		7 8
list		9 =
)		= >
{

 	
var 
ds 
= 
new 
DataSet  
(  !
)! "
;" #
ds 
. 
Tables 
. 
Add 
( 
list 
. 
ToDataTable *
(* +
)+ ,
), -
;- .
return 
ds 
; 
} 	
public 
static 
	DataTable 
ToDataTable  +
<+ ,
T, -
>- .
(. /
this/ 3
IList4 9
<9 :
T: ;
>; <
list= A
)A B
{ 	
Type 
elementType 
= 
typeof %
(% &
T& '
)' (
;( )
	DataTable 
t 
= 
new 
	DataTable '
(' (
)( )
;) *
foreach 
( 
var 
propInfo !
in" $
elementType% 0
.0 1
GetProperties1 >
(> ?
)? @
)@ A
{ 
Type 
ColType 
= 
Nullable '
.' (
GetUnderlyingType( 9
(9 :
propInfo: B
.B C
PropertyTypeC O
)O P
??Q S
propInfoT \
.\ ]
PropertyType] i
;i j
t 
. 
Columns 
. 
Add 
( 
propInfo &
.& '
Name' +
,+ ,
ColType- 4
)4 5
;5 6
} 
foreach 
( 
T 
item 
in 
list #
)# $
{ 
DataRow   
row   
=   
t   
.    
NewRow    &
(  & '
)  ' (
;  ( )
foreach"" 
("" 
var"" 
propInfo"" %
in""& (
elementType"") 4
.""4 5
GetProperties""5 B
(""B C
)""C D
)""D E
{## 
row$$ 
[$$ 
propInfo$$  
.$$  !
Name$$! %
]$$% &
=$$' (
propInfo$$) 1
.$$1 2
GetValue$$2 :
($$: ;
item$$; ?
,$$? @
null$$A E
)$$E F
??$$G I
DBNull$$J P
.$$P Q
Value$$Q V
;$$V W
}%% 
t'' 
.'' 
Rows'' 
.'' 
Add'' 
('' 
row'' 
)'' 
;''  
}(( 
return)) 
t)) 
;)) 
}** 	
}++ 
}-- �
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\LogHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{		 
public

 

class

 
	LogHelper

 
{ 
public 
static 
void 
AddLog !
(! "
WfpictContext" /
db0 2
,2 3
LogType4 ;
logType< C
,C D
stringE K
OrderNumberL W
,W X
stringY _
Message` g
)g h
{ 	
Add 
( 
db 
, 
logType 
, 
	LogStatus &
.& '
Success' .
,. /
OrderNumber0 ;
,; <
Message= D
)D E
;E F
} 	
public 
static 
void 
AddError #
(# $
WfpictContext$ 1
db2 4
,4 5
LogType6 =
logType> E
,E F
stringG M
OrderNumberN Y
,Y Z
string[ a
Messageb i
)i j
{ 	
Add 
( 
db 
, 
logType 
, 
	LogStatus &
.& '
Error' ,
,, -
OrderNumber. 9
,9 :
Message; B
)B C
;C D
} 	
private 
static 
void 
Add 
(  
WfpictContext  -
db. 0
,0 1
LogType2 9
logType: A
,A B
	LogStatusC L
	logStatusM V
,V W
stringX ^
OrderNumber_ j
,j k
stringl r
Messages z
)z {
{ 	
db 
. 

SystemLogs 
. 
Add 
( 
new !
	SystemLog" +
(+ ,
), -
{ 
Id 
= 
Guid 
. 
NewGuid !
(! "
)" #
,# $
	CreatedAt 
= 
DateTime $
.$ %
Now% (
,( )
LogType 
= 
( 
int 
) 
logType &
,& '
	LogStatus 
= 
( 
int  
)  !
	logStatus! *
,* +
OrderNumber 
= 
OrderNumber )
,) *
Message 
= 
Message !
}   
)   
;   
db!! 
.!! 
SaveChanges!! 
(!! 
)!! 
;!! 
}"" 	
}## 
}$$ �
LE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\MultipleButtonAttribute.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Method% +
,+ ,
AllowMultiple- :
=; <
false= B
,B C
	InheritedD M
=N O
trueP T
)T U
]U V
public 

class #
MultipleButtonAttribute (
:) *'
ActionNameSelectorAttribute+ F
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Argument 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
override 
bool 
IsValidName (
(( )
ControllerContext) :
controllerContext; L
,L M
stringN T

actionNameU _
,_ `

MethodInfoa k

methodInfol v
)v w
{ 	
var 
isValidName 
= 
false #
;# $
var 
keyValue 
= 
string !
.! "
Format" (
(( )
$str) 2
,2 3
Name4 8
,8 9
Argument: B
)B C
;C D
var 
value 
= 
controllerContext )
.) *

Controller* 4
.4 5
ValueProvider5 B
.B C
GetValueC K
(K L
keyValueL T
)T U
;U V
if 
( 
value 
!= 
null 
) 
{ 
controllerContext !
.! "

Controller" ,
., -
ControllerContext- >
.> ?
	RouteData? H
.H I
ValuesI O
[O P
NameP T
]T U
=V W
ArgumentX `
;` a
isValidName 
= 
true "
;" #
} 
return 
isValidName 
; 
} 	
} 
} �
PE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\HangfireAuthorizationFilter.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class '
HangfireAuthorizationFilter ,
:- .)
IDashboardAuthorizationFilter/ L
{ 
public 
bool 
	Authorize 
( 
DashboardContext .
context/ 6
)6 7
{		 	
var 
owinContext 
= 
new !
OwinContext" -
(- .
context. 5
.5 6
GetOwinEnvironment6 H
(H I
)I J
)J K
;K L
return 
owinContext 
. 
Authentication -
.- .
User. 2
.2 3
Identity3 ;
.; <
IsAuthenticated< K
;K L
} 	
} 
} ��
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\ProDataAPIManager.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
ProData 
{ 
public 

class 
ProDataAPIManager "
{ 
private 
static 
string 
_urlTracking *
=+ ,
$str- t
;t u
private 
static 
string 
_urlCreateOrder -
=. /
$str0 x
;x y
private 
static 
string 
prodataAuth )
=* +
$str, N
;N O
public 
static 
readonly 
string %
SUCCESS& -
=. /
$str0 9
;9 :
public 
static 
readonly 
string %
ERROR& +
=, -
$str. 5
;5 6
private 
static 
readonly 

Dictionary  *
<* +
string+ 1
,1 2
string3 9
>9 : 
whiteLabelDictionary; O
=P Q
newR U

DictionaryV `
<` a
stringa g
,g h
stringi o
>o p
(p q
)q r
{ 	
{ 
$str 
, 
$str -
}- .
,. /
{ 
$str 
, 
$str +
}+ ,
,, -
{ 
$str 
, 
$str 6
}6 7
,7 8
{ 
$str 
, 
$str 5
}5 6
,6 7
{ 
$str 
, 
$str 5
}5 6
,6 7
{ 
$str 
, 
$str 1
}1 2
,2 3
{   
$str   
,   
$str   .
}  . /
,  / 0
{!! 
$str!! 
,!! 
$str!! -
}!!- .
}"" 	
;""	 

public$$ 
static$$ 
void$$ 
Load$$ 
($$  
)$$  !
{%% 	
string&& 
json&& 
=&& 
File&& 
.&& 
ReadAllText&& *
(&&* +
$str&&+ 9
)&&9 :
;&&: ;
ProDataResponse'' 
m'' 
='' 
JsonConvert''  +
.''+ ,
DeserializeObject'', =
<''= >
ProDataResponse''> M
>''M N
(''N O
json''O S
)''S T
;''T U
}(( 	
public,, 
static,, 
ProDataResponse,, %
Create,,& ,
(,,, -
Campaign,,- 5
campaign,,6 >
,,,> ?
CampaignSegment,,@ O
segment,,P W
),,W X
{-- 	
string.. 

whiteLabel.. 
=..  
whiteLabelDictionary..  4
...4 5
ContainsKey..5 @
(..@ A
campaign..A I
...I J
Approved..J R
...R S

WhiteLabel..S ]
)..] ^
?//  
whiteLabelDictionary// &
[//& '
campaign//' /
./// 0
Approved//0 8
.//8 9

WhiteLabel//9 C
]//C D
:00  
whiteLabelDictionary00 &
[00& '
$str00' +
]00+ ,
;00, -
ProDataRequest22 
request22 "
=22# $
new22% (
ProDataRequest22) 7
(227 8
)228 9
{33 
io44 
=44 
campaign44 
.44 
OrderNumber44 )
,44) *
campaign_name55 
=55 
campaign55  (
.55( )
Approved55) 1
.551 2
CampaignName552 >
,55> ?
is_rebroadcast66 
=66  
campaign66! )
.66) *
Approved66* 2
.662 3
ReBroadCast663 >
?66? @
$str66A D
:66E F
$str66G J
,66J K
white_label77 
=77 

whiteLabel77 (
,77( )
creative_url88 
=88 
campaign88 '
.88' (
Assets88( .
.88. /
CreativeUrl88/ :
,88: ;
quantity99 
=99 
campaign99 #
.99# $
Approved99$ ,
.99, -
Quantity99- 5
,995 6
geo_type:: 
=:: 
$str:: '
,::' (
geo_url;; 
=;; 
campaign;; "
.;;" #
Assets;;# )
.;;) *

ZipCodeUrl;;* 4
,;;4 5
ctr_percent<< 
=<< 
$num<< #
,<<# $
subject== 
=== 
campaign== "
.==" #
Approved==# +
.==+ ,
SubjectLine==, 7
,==7 8
	from_name>> 
=>> 
campaign>> $
.>>$ %
Approved>>% -
.>>- .
FromLine>>. 6
,>>6 7

from_email?? 
=?? 
campaign?? %
.??% &
RepresentativeEmail??& 9
,??9 :
deploy_date@@ 
=@@ 
campaign@@ &
.@@& '
Approved@@' /
.@@/ 0

DeployDate@@0 :
?@@: ;
.@@; <
ToString@@< D
(@@D E
StringConstants@@E T
.@@T U 
DateTimeFormatDashes@@U i
)@@i j
,@@j k
}AA 
;AA 
ifCC 
(CC 
campaignCC 
.CC 
ApprovedCC !
.CC! "
IsOpenPixelCC" -
)CC- .
{DD 
requestEE 
.EE 
is_open_pixelEE %
=EE& '
$strEE( +
;EE+ ,
requestFF 
.FF 
open_percentFF $
=FF% &
(FF' (
doubleFF( .
)FF. /
campaignFF/ 7
.FF7 8
ApprovedFF8 @
.FF@ A
	OpenGoalsFFA J
/FFK L
campaignFFM U
.FFU V
ApprovedFFV ^
.FF^ _
QuantityFF_ g
;FFg h
requestGG 
.GG 

open_pixelGG "
=GG# $
campaignGG% -
.GG- .
ApprovedGG. 6
.GG6 7
OpenPixelUrlGG7 C
;GGC D
}HH 
elseII 
requestJJ 
.JJ 
is_open_pixelJJ %
=JJ& '
$strJJ( +
;JJ+ ,
ifLL 
(LL 
segmentLL 
!=LL 
nullLL 
)LL  
{MM 
requestNN 
.NN 
is_data_fileNN $
=NN% &
$strNN' *
;NN* +
requestOO 
.OO 
data_file_urlOO %
=OO& '
segmentOO( /
.OO/ 0
SegmentDataFileUrlOO0 B
;OOB C
requestPP 
.PP '
data_file_replacement_paramPP 3
=PP4 5
segmentPP6 =
.PP= >
SegmentNumberPP> K
;PPK L
requestQQ 
.QQ (
data_file_replacement_columnQQ 4
=QQ5 6
$strQQ7 :
;QQ: ;
requestRR 
.RR 
data_file_unique_ipRR +
=RR, -
$strRR. 1
;RR1 2
}SS 
elseTT 
requestUU 
.UU 
is_data_fileUU $
=UU% &
$strUU' *
;UU* +
returnWW 
CreateWW 
(WW 
requestWW !
)WW! "
;WW" #
}XX 	
privateZZ 
staticZZ 
ProDataResponseZZ &
CreateZZ' -
(ZZ- .
ProDataRequestZZ. <
requestZZ= D
)ZZD E
{[[ 	
using\\ 
(\\ 

HttpClient\\ 
client\\ $
=\\% &
new\\' *

HttpClient\\+ 5
(\\5 6
)\\6 7
)\\7 8
{]] 
client^^ 
.^^ 
Timeout^^ 
=^^  
TimeSpan^^! )
.^^) *
FromMinutes^^* 5
(^^5 6
$num^^6 7
)^^7 8
;^^8 9
client__ 
.__ !
DefaultRequestHeaders__ ,
.__, -
Add__- 0
(__0 1
$str__1 E
,__E F
prodataAuth__G R
)__R S
;__S T
var`` 
httpContent`` 
=``  !
new``" %
StringContent``& 3
(``3 4
request``4 ;
.``; <
ToJson``< B
(``B C
)``C D
,``D E
Encoding``F N
.``N O
UTF8``O S
,``S T
$str``U g
)``g h
;``h i
usingaa 
(aa 
HttpResponseMessageaa *
responseaa+ 3
=aa4 5
clientaa6 <
.aa< =
	PostAsyncaa= F
(aaF G
_urlCreateOrderaaG V
,aaV W
httpContentaaX c
)aac d
.aad e
Resultaae k
)aak l
usingbb 
(bb 
HttpContentbb "
contentbb# *
=bb+ ,
responsebb- 5
.bb5 6
Contentbb6 =
)bb= >
{cc 
stringdd 
responseContentdd *
=dd+ ,
contentdd- 4
.dd4 5
ReadAsStringAsyncdd5 F
(ddF G
)ddG H
.ddH I
ResultddI O
;ddO P
ProDataResponseee #
proDataResponseee$ 3
;ee3 4
tryff 
{gg 
proDataResponsehh '
=hh( )
JsonConverthh* 5
.hh5 6
DeserializeObjecthh6 G
<hhG H
ProDataResponsehhH W
>hhW X
(hhX Y
responseContenthhY h
)hhh i
;hhi j
}ii 
catchjj 
(jj 
	Exceptionjj $
exjj% '
)jj' (
{kk 
throwll 
newll !
	Exceptionll" +
(ll+ ,
$strll, r
)llr s
;lls t
}mm 
returnoo 
proDataResponseoo *
;oo* +
}pp 
}qq 
}rr 	
privatevv 
staticvv 
ProDataResponsevv &
Fetchvv' ,
(vv, -
stringvv- 3
OrderNumbervv4 ?
)vv? @
{ww 	
ifxx 
(xx  
ConfigurationManagerxx $
.xx$ %
AppSettingsxx% 0
[xx0 1
$strxx1 9
]xx9 :
==xx; =
$strxx> E
)xxE F
{yy 
OrderNumberzz 
=zz 
$strzz !
;zz! "
}{{ 
ProDataResponse}} 
proDataResponse}} +
=}}, -
null}}. 2
;}}2 3
string~~ 
url~~ 
=~~ 
string~~ 
.~~  
Format~~  &
(~~& '
_urlTracking~~' 3
,~~3 4
OrderNumber~~5 @
)~~@ A
;~~A B
using 
( 

HttpClient 
client $
=% &
new' *

HttpClient+ 5
(5 6
)6 7
)7 8
{
�� 
client
�� 
.
�� 
Timeout
�� 
=
��  
TimeSpan
��! )
.
��) *
FromMinutes
��* 5
(
��5 6
$num
��6 7
)
��7 8
;
��8 9
client
�� 
.
�� #
DefaultRequestHeaders
�� ,
.
��, -
Add
��- 0
(
��0 1
$str
��1 E
,
��E F
prodataAuth
��G R
)
��R S
;
��S T
using
�� 
(
�� !
HttpResponseMessage
�� *
response
��+ 3
=
��4 5
client
��6 <
.
��< =
GetAsync
��= E
(
��E F
url
��F I
)
��I J
.
��J K
Result
��K Q
)
��Q R
using
�� 
(
�� 
HttpContent
�� "
content
��# *
=
��+ ,
response
��- 5
.
��5 6
Content
��6 =
)
��= >
{
�� 
string
�� 
responseContent
�� *
=
��+ ,
content
��- 4
.
��4 5
ReadAsStringAsync
��5 F
(
��F G
)
��G H
.
��H I
Result
��I O
;
��O P
try
�� 
{
�� 
proDataResponse
�� '
=
��( )
JsonConvert
��* 5
.
��5 6
DeserializeObject
��6 G
<
��G H
ProDataResponse
��H W
>
��W X
(
��X Y
responseContent
��Y h
)
��h i
;
��i j
proDataResponse
�� '
.
��' (
ResponseStatus
��( 6
=
��7 8#
ProDataResponseStatus
��9 N
.
��N O
Found
��O T
.
��T U
ToString
��U ]
(
��] ^
)
��^ _
;
��_ `
}
�� 
catch
�� 
(
�� 
	Exception
�� $
ex
��% '
)
��' (
{
�� 
if
�� 
(
�� 
ex
�� 
.
�� 
Message
�� &
.
��& '
ToLowerInvariant
��' 7
(
��7 8
)
��8 9
.
��9 :
Contains
��: B
(
��B C
$str
��C P
)
��P Q
)
��Q R
{
�� 
proDataResponse
�� +
=
��, -
new
��. 1
ProDataResponse
��2 A
(
��A B
)
��B C
{
�� 
ResponseStatus
��  .
=
��/ 0#
ProDataResponseStatus
��1 F
.
��F G
NotFound
��G O
.
��O P
ToString
��P X
(
��X Y
)
��Y Z
,
��Z [
ResponseMessage
��  /
=
��0 1
$str
��2 M
}
�� 
;
�� 
}
�� 
else
�� 
{
�� 
proDataResponse
�� +
=
��, -
new
��. 1
ProDataResponse
��2 A
(
��A B
)
��B C
{
�� 
ResponseStatus
��  .
=
��/ 0#
ProDataResponseStatus
��1 F
.
��F G
Error
��G L
.
��L M
ToString
��M U
(
��U V
)
��V W
,
��W X
ResponseMessage
��  /
=
��0 1
$str
��2 x
}
�� 
;
�� 
}
�� 
}
�� 
return
�� 
proDataResponse
�� *
;
��* +
}
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� $
FetchAndUpdateProDatas
�� 1
(
��1 2
WfpictContext
��2 ?
db
��@ B
,
��B C
string
��D J
OrderNumber
��K V
)
��V W
{
�� 	
var
�� 
logs
�� 
=
�� 
db
�� 
.
�� 

SystemLogs
�� $
.
��$ %
Where
��% *
(
��* +
x
��+ ,
=>
��- /
x
��0 1
.
��1 2
OrderNumber
��2 =
==
��> @
OrderNumber
��A L
&&
��M O
x
��P Q
.
��Q R
LogType
��R Y
==
��Z \
(
��] ^
int
��^ a
)
��a b
LogType
��b i
.
��i j
ProData
��j q
)
��q r
;
��r s
foreach
�� 
(
�� 
var
�� 
log
�� 
in
�� 
logs
��  $
)
��$ %
{
�� 
db
�� 
.
�� 

SystemLogs
�� 
.
�� 
Remove
�� $
(
��$ %
log
��% (
)
��( )
;
��) *
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
ProData
��) 0
,
��0 1
OrderNumber
��2 =
,
��= >
string
��? E
.
��E F
Format
��F L
(
��L M
$str
��M y
,
��y z
OrderNumber��{ �
,��� �
DateTime��� �
.��� �
Now��� �
)��� �
)��� �
;��� �
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
ProData
��) 0
,
��0 1
OrderNumber
��2 =
,
��= >
string
��? E
.
��E F
Format
��F L
(
��L M
$str
��M v
,
��v w
OrderNumber��x �
)��� �
)��� �
;��� �
var
�� 
campagin
�� 
=
�� 
db
�� 
.
�� 
	Campaigns
�� '
.
��' (
FirstOrDefault
��( 6
(
��6 7
x
��7 8
=>
��9 ;
x
��< =
.
��= >
OrderNumber
��> I
==
��J L
OrderNumber
��M X
)
��X Y
;
��Y Z
var
�� 
proDatas
�� 
=
�� 
db
�� 
.
�� 
ProDatas
�� &
.
��& '
Where
��' ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4

CampaignId
��4 >
==
��? A
campagin
��B J
.
��J K
Id
��K M
)
��M N
;
��N O
foreach
�� 
(
�� 
var
�� 
proData
��  
in
��! #
proDatas
��$ ,
)
��, -
{
�� 
db
�� 
.
�� 
ProDatas
�� 
.
�� 
Remove
�� "
(
��" #
proData
��# *
)
��* +
;
��+ ,
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
var
�� 
data
�� 
=
�� 
Fetch
�� 
(
�� 
OrderNumber
�� (
)
��( )
;
��) *
if
�� 
(
�� 
data
�� 
.
�� 
reports
�� 
!=
�� 
null
��  $
&&
��% '
data
��( ,
.
��, -
reports
��- 4
.
��4 5
report
��5 ;
!=
��< >
null
��? C
)
��C D
{
�� 
var
�� 
reports
�� 
=
�� 
data
�� "
.
��" #
reports
��# *
.
��* +
report
��+ 1
;
��1 2
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
ProData
��- 4
,
��4 5
OrderNumber
��6 A
,
��A B
string
��C I
.
��I J
Format
��J P
(
��P Q
$str��Q �
,��� �
OrderNumber��� �
,��� �
reports��� �
.��� �
Length��� �
)��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
report
�� #
in
��$ &
reports
��' .
)
��. /
{
�� 
db
�� 
.
�� 
ProDatas
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
Data
��( ,
.
��, -
Entities
��- 5
.
��5 6
ProData
��6 =
(
��= >
)
��> ?
{
�� 
Id
�� 
=
�� 
Guid
�� !
.
��! "
NewGuid
��" )
(
��) *
)
��* +
,
��+ ,
	CreatedAt
�� !
=
��" #
DateTime
��$ ,
.
��, -
Now
��- 0
,
��0 1

CampaignId
�� "
=
��# $
campagin
��% -
.
��- .
Id
��. 0
,
��0 1
CampaignName
�� $
=
��% &
report
��' -
.
��- .
CampaignName
��. :
,
��: ;
Reportsite_URL
�� &
=
��' (
report
��) /
.
��/ 0
Reportsite_URL
��0 >
,
��> ?
Destination_URL
�� '
=
��( )
report
��* 0
.
��0 1
Destination_URL
��1 @
,
��@ A
CampaignStartDate
�� )
=
��* +
report
��, 2
.
��2 3
CampaignStartDate
��3 D
,
��D E

ClickCount
�� "
=
��# $
long
��% )
.
��) *
Parse
��* /
(
��/ 0
report
��0 6
.
��6 7

ClickCount
��7 A
)
��A B
,
��B C
	UniqueCnt
�� !
=
��" #
report
��$ *
.
��* +
	UniqueCnt
��+ 4
,
��4 5
	MobileCnt
�� !
=
��" #
report
��$ *
.
��* +
	MobileCnt
��+ 4
,
��4 5
ImpressionCnt
�� %
=
��& '
report
��( .
.
��. /
ImpressionCnt
��/ <
,
��< =
IO
�� 
=
�� 
report
�� #
.
��# $
IO
��$ &
}
�� 
)
�� 
;
�� 
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
ProData
��- 4
,
��4 5
OrderNumber
��6 A
,
��A B
string
��C I
.
��I J
Format
��J P
(
��P Q
$str��Q �
,��� �
OrderNumber��� �
,��� �
DateTime��� �
.��� �
Now��� �
)��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
ProData
��- 4
,
��4 5
OrderNumber
��6 A
,
��A B
string
��C I
.
��I J
Format
��J P
(
��P Q
$str
��Q {
,
��{ |
OrderNumber��} �
,��� �
data��� �
.��� �
ToJson��� �
(��� �
)��� �
)��� �
)��� �
;��� �
throw
�� 
new
�� 
	Exception
�� #
(
��# $
$str
��$ j
)
��j k
;
��k l
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� %
FetchAndUpdateTrackings
�� 2
(
��2 3
WfpictContext
��3 @
db
��A C
,
��C D
Campaign
��E M
campaign
��N V
)
��V W
{
�� 	
string
�� 
OrderNumber
�� 
=
��  
campaign
��! )
.
��) *
ReBroadcasted
��* 7
?
��8 9
campaign
��: B
.
��B C&
ReBroadcastedOrderNumber
��C [
:
��\ ]
campaign
��^ f
.
��f g
OrderNumber
��g r
;
��r s
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
ProData
��) 0
,
��0 1
OrderNumber
��2 =
,
��= >
string
��? E
.
��E F
Format
��F L
(
��L M
$str
��M y
,
��y z
OrderNumber��{ �
,��� �
DateTime��� �
.��� �
Now��� �
)��� �
)��� �
;��� �
var
�� 
data
�� 
=
�� 
Fetch
�� 
(
�� 
OrderNumber
�� (
)
��( )
;
��) *
SaveProData
�� 
(
�� 
db
�� 
,
�� 
campaign
�� $
.
��$ %
Id
��% '
,
��' (
OrderNumber
��) 4
,
��4 5
string
��6 <
.
��< =
Empty
��= B
,
��B C
data
��D H
)
��H I
;
��I J/
!UpdateTrackingAndSaveNotification
�� -
(
��- .
db
��. 0
,
��0 1
campaign
��2 :
.
��: ;
Id
��; =
,
��= >
OrderNumber
��? J
,
��J K
string
��L R
.
��R S
Empty
��S X
,
��X Y
data
��Z ^
)
��^ _
;
��_ `
foreach
�� 
(
�� 
var
�� 
segment
��  
in
��! #
campaign
��$ ,
.
��, -
Segments
��- 5
.
��5 6
Where
��6 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
SegmentStatus
��C P
==
��Q S
(
��T U
int
��U X
)
��X Y
SegmentStatus
��Y f
.
��f g

Monitoring
��g q
)
��q r
)
��r s
{
�� 
var
�� 
data1
�� 
=
�� 
Fetch
�� !
(
��! "
segment
��" )
.
��) *
SegmentNumber
��* 7
)
��7 8
;
��8 9
SaveProData
�� 
(
�� 
db
�� 
,
�� 
campaign
��  (
.
��( )
Id
��) +
,
��+ ,
OrderNumber
��- 8
,
��8 9
segment
��: A
.
��A B
SegmentNumber
��B O
,
��O P
data1
��Q V
)
��V W
;
��W X/
!UpdateTrackingAndSaveNotification
�� 1
(
��1 2
db
��2 4
,
��4 5
campaign
��6 >
.
��> ?
Id
��? A
,
��A B
segment
��C J
.
��J K
OrderNumber
��K V
,
��V W
segment
��X _
.
��_ `
SegmentNumber
��` m
,
��m n
data1
��o t
)
��t u
;
��u v
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
SaveProData
�� '
(
��' (
WfpictContext
��( 5
db
��6 8
,
��8 9
Guid
��: >
?
��> ?

campaignId
��@ J
,
��J K
string
��L R
OrderNumber
��S ^
,
��^ _
string
��` f
SegmentNumber
��g t
,
��t u
ProDataResponse��v �
data��� �
)��� �
{
�� 	
	LogHelper
�� 
.
�� 
AddLog
�� 
(
�� 
db
�� 
,
��  
LogType
��! (
.
��( )
ProData
��) 0
,
��0 1
OrderNumber
��2 =
,
��= >
string
��? E
.
��E F
Format
��F L
(
��L M
$str
��M v
,
��v w
OrderNumber��x �
)��� �
)��� �
;��� �
var
�� 
proDatas
�� 
=
�� 
db
�� 
.
�� 
ProDatas
�� &
.
��& '
Where
��' ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4

CampaignId
��4 >
==
��? A

campaignId
��B L
&&
��M O
x
��P Q
.
��Q R
OrderNumber
��R ]
==
��^ `
OrderNumber
��a l
&&
��m o
x
��p q
.
��q r
SegmentNumber
��r 
==��� �
SegmentNumber��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
proData
��  
in
��! #
proDatas
��$ ,
)
��, -
{
�� 
db
�� 
.
�� 
ProDatas
�� 
.
�� 
Remove
�� "
(
��" #
proData
��# *
)
��* +
;
��+ ,
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
if
�� 
(
�� 
data
�� 
.
�� 
reports
�� 
!=
�� 
null
��  $
&&
��% '
data
��( ,
.
��, -
reports
��- 4
.
��4 5
report
��5 ;
!=
��< >
null
��? C
)
��C D
{
�� 
var
�� 
reports
�� 
=
�� 
data
�� "
.
��" #
reports
��# *
.
��* +
report
��+ 1
;
��1 2
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
ProData
��- 4
,
��4 5
OrderNumber
��6 A
,
��A B
string
��C I
.
��I J
Format
��J P
(
��P Q
$str��Q �
,��� �
OrderNumber��� �
,��� �
reports��� �
.��� �
Length��� �
)��� �
)��� �
;��� �
foreach
�� 
(
�� 
var
�� 
report
�� #
in
��$ &
reports
��' .
)
��. /
{
�� 
db
�� 
.
�� 
ProDatas
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
Data
��( ,
.
��, -
Entities
��- 5
.
��5 6
ProData
��6 =
(
��= >
)
��> ?
{
�� 
Id
�� 
=
�� 
Guid
�� !
.
��! "
NewGuid
��" )
(
��) *
)
��* +
,
��+ ,
	CreatedAt
�� !
=
��" #
DateTime
��$ ,
.
��, -
Now
��- 0
,
��0 1

CampaignId
�� "
=
��# $

campaignId
��% /
,
��/ 0
OrderNumber
�� #
=
��$ %
OrderNumber
��& 1
,
��1 2
SegmentNumber
�� %
=
��& '
SegmentNumber
��( 5
,
��5 6
CampaignName
�� $
=
��% &
report
��' -
.
��- .
CampaignName
��. :
,
��: ;
Reportsite_URL
�� &
=
��' (
report
��) /
.
��/ 0
Reportsite_URL
��0 >
,
��> ?
Destination_URL
�� '
=
��( )
report
��* 0
.
��0 1
Destination_URL
��1 @
,
��@ A
CampaignStartDate
�� )
=
��* +
report
��, 2
.
��2 3
CampaignStartDate
��3 D
,
��D E

ClickCount
�� "
=
��# $
long
��% )
.
��) *
Parse
��* /
(
��/ 0
report
��0 6
.
��6 7

ClickCount
��7 A
)
��A B
,
��B C
	UniqueCnt
�� !
=
��" #
report
��$ *
.
��* +
	UniqueCnt
��+ 4
,
��4 5
	MobileCnt
�� !
=
��" #
report
��$ *
.
��* +
	MobileCnt
��+ 4
,
��4 5
ImpressionCnt
�� %
=
��& '
report
��( .
.
��. /
ImpressionCnt
��/ <
,
��< =
IO
�� 
=
�� 
report
�� #
.
��# $
IO
��$ &
}
�� 
)
�� 
;
�� 
}
�� 
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
ProData
��- 4
,
��4 5
OrderNumber
��6 A
,
��A B
string
��C I
.
��I J
Format
��J P
(
��P Q
$str��Q �
,��� �
OrderNumber��� �
,��� �
DateTime��� �
.��� �
Now��� �
)��� �
)��� �
;��� �
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� /
!UpdateTrackingAndSaveNotification
�� =
(
��= >
WfpictContext
��> K
db
��L N
,
��N O
Guid
��P T
?
��T U

campaignId
��V `
,
��` a
string
��b h
OrderNumber
��i t
,
��t u
string
��v |
SegmentNumber��} �
,��� �
ProDataResponse��� �
data��� �
)��� �
{
�� 	
var
�� 
campaignTracking
��  
=
��! "
db
�� 
.
�� 
CampaignTrackings
�� .
.
��. /
FirstOrDefault
��/ =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E

CampaignId
��E O
==
��P R

campaignId
��S ]
&&
��^ `
x
��a b
.
��b c
OrderNumber
��c n
==
��o q
OrderNumber
��r }
&&��~ �
x��� �
.��� �
SegmentNumber��� �
==��� �
SegmentNumber��� �
)��� �
;��� �
if
�� 
(
�� 
campaignTracking
��  
==
��! #
null
��$ (
)
��( )
return
��* 0
;
��0 1
if
�� 
(
�� 
data
�� 
.
�� 
reports
�� 
?
�� 
.
�� 
report
�� $
!=
��% '
null
��( ,
)
��, -
{
�� 
var
�� 
reports
�� 
=
�� 
data
�� "
.
��" #
reports
��# *
.
��* +
report
��+ 1
;
��1 2
campaignTracking
��  
.
��  !
IONumber
��! )
=
��* +
reports
��, 3
[
��3 4
$num
��4 5
]
��5 6
.
��6 7
IO
��7 9
;
��9 :
campaignTracking
��  
.
��  !
	StartDate
��! *
=
��+ ,
reports
��- 4
[
��4 5
$num
��5 6
]
��6 7
.
��7 8
CampaignStartDate
��8 I
;
��I J
campaignTracking
��  
.
��  !
Opened
��! '
=
��( )
reports
��* 1
[
��1 2
$num
��2 3
]
��3 4
.
��4 5
ImpressionCnt
��5 B
;
��B C
campaignTracking
��  
.
��  !
Clicked
��! (
=
��) *
long
��+ /
.
��/ 0
Parse
��0 5
(
��5 6
reports
��6 =
[
��= >
$num
��> ?
]
��? @
.
��@ A

ClickCount
��A K
)
��K L
;
��L M
campaignTracking
��  
.
��  !
IONumber
��! )
=
��* +
reports
��, 3
[
��3 4
$num
��4 5
]
��5 6
.
��6 7
IO
��7 9
;
��9 :
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
��  
;
��  !
}
�� 
if
�� 
(
�� 
data
�� 
.
�� 
ResponseStatus
�� #
==
��$ &#
ProDataResponseStatus
��' <
.
��< =
NotFound
��= E
.
��E F
ToString
��F N
(
��N O
)
��O P
&&
��Q S
DateTime
��T \
.
��\ ]
Now
��] `
.
��` a
Hour
��a e
-
��f g
campaignTracking
��h x
.
��x y
DateSent��y �
?��� �
.��� �
Hour��� �
>=��� �
$num��� �
)��� �
{
�� 
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
ProData
��- 4
,
��4 5
OrderNumber
��6 A
,
��A B
string
��C I
.
��I J
Format
��J P
(
��P Q
$str
��Q {
,
��{ |
OrderNumber��} �
,��� �
data��� �
.��� �
ToJson��� �
(��� �
)��� �
)��� �
)��� �
;��� �
var
�� 
qcRule
�� 
=
�� 
QCRule
�� #
.
��# $%
NotStartedInFirst4Hours
��$ ;
;
��; <
var
�� 
alreadyNoted
��  
=
��! "
db
��# %
.
��% &
Notifications
��& 3
.
��3 4
FirstOrDefault
��4 B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J

CampaignId
��J T
==
��U W

campaignId
��X b
&&
��c e
x
��f g
.
��g h
OrderNumber
��h s
==
��t v
OrderNumber��w �
&&��� �
x��� �
.��� �
SegmentNumber��� �
==��� �
SegmentNumber��� �
&&
�� 
x
�� 
.
�� 
QCRule
�� 
==
��  "
(
��# $
int
��$ '
)
��' (
qcRule
��( .
&&
��/ 1
x
��2 3
.
��3 4
Status
��4 :
==
��; =
(
��> ?
int
��? B
)
��B C 
NotificationStatus
��C U
.
��U V
Found
��V [
)
��[ \
;
��\ ]
if
�� 
(
�� 
alreadyNoted
��  
==
��! #
null
��$ (
)
��( )
{
�� 
	LogHelper
�� 
.
�� 
AddLog
�� $
(
��$ %
db
��% '
,
��' (
LogType
��) 0
.
��0 1
RulesProcessing
��1 @
,
��@ A
OrderNumber
��B M
,
��M N
$str
��O g
+
��h i
qcRule
��j p
)
��p q
;
��q r
db
�� 
.
�� 
Notifications
�� $
.
��$ %
Add
��% (
(
��( )
new
��) ,
Notification
��- 9
(
��9 :
)
��: ;
{
�� 
Id
�� 
=
�� 
Guid
�� !
.
��! "
NewGuid
��" )
(
��) *
)
��* +
,
��+ ,
	CreatedAt
�� !
=
��" #
DateTime
��$ ,
.
��, -
Now
��- 0
,
��0 1

CampaignId
�� "
=
��# $

campaignId
��% /
,
��/ 0
OrderNumber
�� #
=
��$ %
OrderNumber
��& 1
,
��1 2
SegmentNumber
�� %
=
��& '
SegmentNumber
��( 5
,
��5 6
Status
�� 
=
��  
(
��! "
int
��" %
)
��% & 
NotificationStatus
��& 8
.
��8 9
Found
��9 >
,
��> ?
	CheckTime
�� !
=
��" #
DateTime
��$ ,
.
��, -
Now
��- 0
,
��0 1
FoundAt
�� 
=
��  !
DateTime
��" *
.
��* +
Now
��+ .
,
��. /
QCRule
�� 
=
��  
(
��! "
int
��" %
)
��% &
qcRule
��& ,
}
�� 
)
�� 
;
�� 
db
�� 
.
�� 
SaveChanges
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �A
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\S3FileManager.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Async 
{ 
public 

class 
S3FileManager 
{		 
public

 
readonly

 
static

 
string

 %
bucket

& ,
=

- .
$str

/ =
;

= >
public 
static 
void 
Upload !
(! "
string" (
fileKey) 0
,0 1
string2 8
localFilePath9 F
,F G
boolH L
ifMakePublicM Y
=Z [
true\ `
,` a
boolb f
	overWriteg p
=q r
falses x
)x y
{ 	
if 
( 
	overWrite 
) 
Delete !
(! "
fileKey" )
)) *
;* +
using 
( 
	IAmazonS3 
client #
=$ %
new& )
AmazonS3Client* 8
(8 9
RegionEndpoint9 G
.G H
USWest2H O
)O P
)P Q
{ 
PutObjectRequest  
request! (
=) *
new+ .
PutObjectRequest/ ?
(? @
)@ A
;A B
request 
. 

BucketName "
=# $
bucket% +
;+ ,
request 
. 
Key 
= 
fileKey %
;% &
request 
. 
FilePath  
=! "
localFilePath# 0
;0 1
client 
. 
	PutObject  
(  !
request! (
)( )
;) *
} 
if 
( 
ifMakePublic 
) 

MakePublic 
( 
fileKey "
)" #
;# $
} 	
public 
static 
void 
Download #
(# $
string$ *
fileKey+ 2
,2 3
string4 :
localFilePath; H
)H I
{ 	
using 
( 
	IAmazonS3 
client #
=$ %
new& )
AmazonS3Client* 8
(8 9
RegionEndpoint9 G
.G H
USWest2H O
)O P
)P Q
{   
GetObjectRequest!!  
request!!! (
=!!) *
new!!+ .
GetObjectRequest!!/ ?
(!!? @
)!!@ A
;!!A B
request"" 
."" 

BucketName"" "
=""# $
bucket""% +
;""+ ,
request## 
.## 
Key## 
=## 
fileKey## %
;##% &
GetObjectResponse$$ !
response$$" *
=$$+ ,
client$$- 3
.$$3 4
	GetObject$$4 =
($$= >
request$$> E
)$$E F
;$$F G
response%% 
.%% %
WriteResponseStreamToFile%% 2
(%%2 3
localFilePath%%3 @
)%%@ A
;%%A B
}&& 
}'' 	
public)) 
static)) 
void)) 
Delete)) !
())! "
string))" (
fileKey))) 0
)))0 1
{** 	
using++ 
(++ 
	IAmazonS3++ 
client++ #
=++$ %
new++& )
AmazonS3Client++* 8
(++8 9
RegionEndpoint++9 G
.++G H
USWest2++H O
)++O P
)++P Q
{,, 
DeleteObjectRequest-- #
request--$ +
=--, -
new--. 1
DeleteObjectRequest--2 E
(--E F
)--F G
;--G H
request.. 
... 

BucketName.. "
=..# $
bucket..% +
;..+ ,
request// 
.// 
Key// 
=// 
fileKey// %
;//% &
client00 
.00 
DeleteObject00 #
(00# $
request00$ +
)00+ ,
;00, -
}11 
}22 	
public44 
static44 
void44 
CreateDirectory44 *
(44* +
string44+ 1

folderName442 <
)44< =
{55 	
using66 
(66 
	IAmazonS366 
client66 #
=66$ %
new66& )
AmazonS3Client66* 8
(668 9
RegionEndpoint669 G
.66G H
USWest266H O
)66O P
)66P Q
{77 
S3DirectoryInfo88 
destination88  +
=88, -
new88. 1
S3DirectoryInfo882 A
(88A B
client88B H
,88H I
bucket88J P
,88P Q

folderName88R \
)88\ ]
;88] ^
if99 
(99 
!99 
destination99  
.99  !
Exists99! '
)99' (
destination99) 4
.994 5
Create995 ;
(99; <
)99< =
;99= >
}:: 
};; 	
public== 
static== 
void== 
Move== 
(==  
string==  &

oldFileKey==' 1
,==1 2
string==2 8

newFileKey==9 C
,==C D
string==E K

folderName==L V
,==V W
bool==X \
	overWrite==] f
===g h
false==i n
)==n o
{>> 	
if?? 
(?? 
string?? 
.?? 
IsNullOrEmpty?? #
(??# $

oldFileKey??$ .
)??. /
)??/ 0
return??1 7
;??7 8
ifAA 
(AA 
	overWriteAA 
)AA 
DeleteAA  
(AA  !

newFileKeyAA! +
)AA+ ,
;AA, -
usingCC 
(CC 
	IAmazonS3CC 
clientCC #
=CC$ %
newCC& )
AmazonS3ClientCC* 8
(CC8 9
RegionEndpointCC9 G
.CCG H
USWest2CCH O
)CCO P
)CCP Q
{DD 

S3FileInfoEE 
currentObjectEE (
=EE) *
newEE+ .

S3FileInfoEE/ 9
(EE9 :
clientEE: @
,EE@ A
bucketEEB H
,EEH I

oldFileKeyEEJ T
)EET U
;EEU V
S3DirectoryInfoFF 
destinationFF  +
=FF, -
newFF. 1
S3DirectoryInfoFF2 A
(FFA B
clientFFB H
,FFH I
bucketFFJ P
,FFP Q

folderNameFFR \
)FF\ ]
;FF] ^
ifGG 
(GG 
!GG 
destinationGG 
.GG  
ExistsGG  &
)GG& '
destinationGG( 3
.GG3 4
CreateGG4 :
(GG: ;
)GG; <
;GG< =

S3FileInfoHH 
movedObjectHH &
=HH' (
currentObjectHH) 6
.HH6 7
MoveToHH7 =
(HH= >
bucketHH> D
,HHD E

newFileKeyHHF P
)HHP Q
;HHQ R
}II 

MakePublicJJ 
(JJ 

newFileKeyJJ !
)JJ! "
;JJ" #
}KK 	
publicMM 
staticMM 
voidMM 

MakePublicMM %
(MM% &
stringMM& ,
fileKeyMM- 4
)MM4 5
{NN 	
usingOO 
(OO 
	IAmazonS3OO 
clientOO #
=OO$ %
newOO& )
AmazonS3ClientOO* 8
(OO8 9
RegionEndpointOO9 G
.OOG H
USWest2OOH O
)OOO P
)OOP Q
{PP 
PutACLRequestQQ 
requestQQ %
=QQ& '
newQQ( +
PutACLRequestQQ, 9
(QQ9 :
)QQ: ;
;QQ; <
requestRR 
.RR 

BucketNameRR "
=RR# $
bucketRR% +
;RR+ ,
requestSS 
.SS 
KeySS 
=SS 
fileKeySS %
;SS% &
requestTT 
.TT 
	CannedACLTT !
=TT" #
S3CannedACLTT$ /
.TT/ 0

PublicReadTT0 :
;TT: ;
clientUU 
.UU 
PutACLUU 
(UU 
requestUU %
)UU% &
;UU& '
}VV 
}WW 	
}XX 
}YY �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\NumberHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
NumberHelper 
{		 
private

 
static

 
int

 
GetTotalFromRange

 ,
(

, -
int

- 0
firstNumber

1 <
,

< =
int

> A
secondNumber

B N
)

N O
{ 	
if 
( 
firstNumber 
== 
$num  
||! #
secondNumber$ 0
==1 3
$num4 5
)5 6
return 
$num 
; 
return 
secondNumber 
-  !
firstNumber" -
+. /
$num0 1
;1 2
} 	
public 
static 
int 
GetTotal "
(" #
int# &

firstStart' 1
,1 2
int3 6
firstEnd7 ?
,? @
intA D
secondStartE P
,P Q
intR U
	secondEndV _
,_ `
inta d

thirdStarte o
,o p
intq t
thirdEndu }
)} ~
{ 	
return 
GetTotalFromRange $
($ %

firstStart% /
,/ 0
firstEnd1 9
)9 :
+; <
GetTotalFromRange= N
(N O
secondStartO Z
,Z [
	secondEnd\ e
)e f
+g h
GetTotalFromRange $
($ %

thirdStart% /
,/ 0
thirdEnd1 9
)9 :
;: ;
} 	
} 
} �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\QCRuleUtility.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public		 

class		 
QCRuleUtility		 
{

 
public 
static 
string 
	GetString &
(& '
int' *
QCRule+ 1
)1 2
{ 	
switch 
( 
QCRule 
) 
{ 
case 
( 
int 
) 
ADSDataDirect '
.' (
Enums( -
.- .
QCRule. 4
.4 5#
NotStartedInFirst4Hours5 L
:L M
return 
$str T
;T U
case 
( 
int 
) 
ADSDataDirect '
.' (
Enums( -
.- .
QCRule. 4
.4 5$
NotHitOpenRate5In24Hours5 M
:M N
return 
$str V
;V W
case 
( 
int 
) 
ADSDataDirect '
.' (
Enums( -
.- .
QCRule. 4
.4 5%
NotHitOpenRate10In72Hours5 N
:N O
return 
$str W
;W X
case 
( 
int 
) 
ADSDataDirect '
.' (
Enums( -
.- .
QCRule. 4
.4 5'
NotHitClickRate750In24Hours5 P
:P Q
return 
$str Y
;Y Z
case 
( 
int 
) 
ADSDataDirect '
.' (
Enums( -
.- .
QCRule. 4
.4 5(
NotHitClickRate1500In72Hours5 Q
:Q R
return 
$str Y
;Y Z
} 
return 
$str 
; 
} 	
} 
} �#
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\SortSearchExtension.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

static 
class 
SortSearchExtension +
{		 
public 
static 
IHtmlString !
SortIdentifier" 0
(0 1
this1 5

HtmlHelper6 @

htmlHelperA K
,K L
stringM S
	sortOrderT ]
,] ^
string_ e
fieldf k
)k l
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
	sortOrder% .
). /
||0 2
(3 4
	sortOrder4 =
.= >
Trim> B
(B C
)C D
!=E G
fieldH M
&&N P
	sortOrderQ Z
.Z [
Replace[ b
(b c
$strc j
,j k
$strl n
)n o
.o p
Trimp t
(t u
)u v
!=w y
fieldz 
)	 �
)
� �
return
� �
null
� �
;
� �
string 
glyph 
= 
$str ;
;; <
if 
( 
	sortOrder 
. 
ToLower !
(! "
)" #
.# $
Contains$ ,
(, -
$str- 3
)3 4
)4 5
{ 
glyph 
= 
$str :
;: ;
} 
var 
span 
= 
new 

TagBuilder %
(% &
$str& ,
), -
;- .
span 
. 

Attributes 
[ 
$str #
]# $
=% &
glyph' ,
;, -
return 
MvcHtmlString  
.  !
Create! '
(' (
span( ,
., -
ToString- 5
(5 6
)6 7
)7 8
;8 9
} 	
public)) 
static))  
RouteValueDictionary)) *"
ToRouteValueDictionary))+ A
())A B
this))B F
NameValueCollection))G Z

collection))[ e
,))e f
string))g m
newKey))n t
,))t u
string))v |
newValue	))} �
)
))� �
{** 	
var++  
routeValueDictionary++ $
=++% &
new++' * 
RouteValueDictionary+++ ?
(++? @
)++@ A
;++A B
foreach,, 
(,, 
var,, 
key,, 
in,, 

collection,,  *
.,,* +
AllKeys,,+ 2
),,2 3
{-- 
if.. 
(.. 
key.. 
==.. 
null.. 
)..  
continue..! )
;..) *
if// 
(//  
routeValueDictionary// (
.//( )
ContainsKey//) 4
(//4 5
key//5 8
)//8 9
)//9 : 
routeValueDictionary00 (
.00( )
Remove00) /
(00/ 0
key000 3
)003 4
;004 5 
routeValueDictionary22 $
.22$ %
Add22% (
(22( )
key22) ,
,22, -

collection22. 8
[228 9
key229 <
]22< =
)22= >
;22> ?
}33 
if44 
(44 
string44 
.44 
IsNullOrEmpty44 $
(44$ %
newValue44% -
)44- .
)44. /
{55  
routeValueDictionary66 $
.66$ %
Remove66% +
(66+ ,
newKey66, 2
)662 3
;663 4
}77 
else88 
{99 
if:: 
(::  
routeValueDictionary:: (
.::( )
ContainsKey::) 4
(::4 5
newKey::5 ;
)::; <
)::< = 
routeValueDictionary;; (
.;;( )
Remove;;) /
(;;/ 0
newKey;;0 6
);;6 7
;;;7 8 
routeValueDictionary== $
.==$ %
Add==% (
(==( )
newKey==) /
,==/ 0
newValue==1 9
)==9 :
;==: ;
}>> 
return??  
routeValueDictionary?? '
;??' (
}@@ 	
}AA 
}BB �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\StringHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
StringHelper 
{ 
public		 
static		 
bool		 
Contains		 #
(		# $
string		$ *
Source		+ 1
,		1 2
string		3 9
ToCheck		: A
)		A B
{

 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
Source% +
)+ ,
), -
return. 4
false5 :
;: ;
return 
Source 
. 
ToLowerInvariant *
(* +
)+ ,
., -
Contains- 5
(5 6
ToCheck6 =
.= >
ToLowerInvariant> N
(N O
)O P
)P Q
;Q R
} 	
public 
static 
string 
URLSubstring )
() *
string* 0
Source1 7
)7 8
{ 	
var 
parts 
= 
Source 
. 
Split $
($ %
$str% )
.) *
ToCharArray* 5
(5 6
)6 7
)7 8
;8 9
return 
string 
. 
Join 
( 
$str "
," #
parts$ )
.) *
ToList* 0
(0 1
)1 2
.2 3
Skip3 7
(7 8
parts8 =
.= >
Length> D
-E F
$numG H
)H I
)I J
;J K
} 	
public 
static 
string 
Trim !
(! "
string" (
source) /
)/ 0
{ 	
var 
lineTrimmed 
= 
Regex #
.# $
Replace$ +
(+ ,
source, 2
,2 3
$str4 @
,@ A
$strB D
,D E
RegexOptions +
.+ ,
None, 0
,0 1
TimeSpan2 :
.: ;
FromSeconds; F
(F G
$numG J
)J K
)K L
;L M
return 
lineTrimmed 
. 
Trim #
(# $
)$ %
;% &
} 	
} 
} �
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\Extensions.cs
	namespace 	
WFP
 
. 
ICT 
{ 
public 

static 
class 

Extensions "
{		 
public

 
static

 
string

 
ToJson

 #
(

# $
this

$ (
object

) /
value

0 5
)

5 6
{ 	
return 
JsonConvert 
. 
SerializeObject .
(. /
value/ 4
,4 5

Formatting6 @
.@ A
IndentedA I
)I J
;J K
} 	
public 
static 
string 
ToCapitalized *
(* +
this+ /
string0 6
value7 <
)< =
{ 	
return 
CultureInfo 
. 
CurrentCulture -
.- .
TextInfo. 6
.6 7
ToTitleCase7 B
(B C
valueC H
.H I
ReplaceI P
(P Q
$strQ T
,T U
$strV X
)X Y
)Y Z
;Z [
} 	
public 
static 
bool 
Contains #
(# $
this$ (
string) /
source0 6
,6 7
string8 >
search? E
, 
StringComparison 
compare &
)& '
{ 	
return 
source 
. 
IndexOf !
(! "
search" (
,( )
compare* 1
)1 2
>=3 5
$num6 7
;7 8
} 	
static 
Regex 
r 
= 
new 
Regex "
(" #
$str# ,
,, -
RegexOptions. :
.: ;#
IgnorePatternWhitespace; R
)R S
;S T
public 
static 
string !
ToCapitalLetterString 2
(2 3
this3 7
string8 >
s? @
)@ A
{   	
return!! 
r!! 
.!! 
Replace!! 
(!! 
s!! 
,!! 
$str!!  #
)!!# $
;!!$ %
}"" 	
public$$ 
static$$ 
string$$ 
ToSafeString$$ )
($$) *
this$$* .
Guid$$/ 3
?$$3 4
value$$5 :
)$$: ;
{%% 	
return&& 
value&& 
.&& 
HasValue&& !
?&&" #
value&&$ )
.&&) *
Value&&* /
.&&/ 0
ToString&&0 8
(&&8 9
)&&9 :
:&&; <
string&&= C
.&&C D
Empty&&D I
;&&I J
}'' 	
public)) 
static)) 
string)) 
ToSafeString)) )
())) *
this))* .
DateTime))/ 7
?))7 8
value))9 >
,))> ?
string))@ F
format))G M
)))M N
{** 	
return++ 
value++ 
.++ 
HasValue++ !
?++" #
value++$ )
.++) *
Value++* /
.++/ 0
ToString++0 8
(++8 9
format++9 ?
)++? @
:++A B
string++C I
.++I J
Empty++J O
;++O P
},, 	
}-- 
}.. ��
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\EmailHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Async 
{ 
public 

class 
EmailHelper 
{ 
private 
const 
string 
Footer #
=$ %
$str& `
;` a
public 
static 
async 
Task  "
SendOrderEmailToClient! 7
(7 8
Campaign8 @
campaignA I
,I J
WfpUserK R
loggedInUserS _
,_ `
stringa g
	bccEmailsh q
)q r
{ 	
string 
subject 
= 
string #
.# $
Format$ *
(* +
$str+ i
,i j
campaign$ ,
., -
OrderNumber- 8
,8 9
campaign: B
.B C
BroadcastDateC P
.P Q
ValueQ V
.V W
ToStringW _
(_ `
$str` c
)c d
,d e
campaignf n
.n o
Quantityo w
,w x
campaign	y �
.
� �
	CreatedAt
� �
.
� �
ToString
� �
(
� �
$str
� �
)
� �
)
� �
;
� �
string 
body 
= 
string  
.  !
Format! '
(' (
$str1( {
,22& '
loggedInUser22( 4
.224 5
UserName225 =
.22= >!
ToCapitalLetterString22> S
(22S T
)22T U
.22U V
ToCapitalized22V c
(22c d
)22d e
,22e f
campaign22g o
.22o p
OrderNumber22p {
,22{ |
(22} ~
CampaignStatus	22~ �
)
22� �
campaign
22� �
.
22� �
Status
22� �
,33& '
loggedInUser33( 4
.334 5
UserName335 =
,33= >
loggedInUser33? K
.33K L
Email33L Q
,33Q R
campaign33S [
.33[ \
CampaignName33\ h
,33h i
campaign33j r
.33r s
BroadcastDate	33s �
.
33� �
Value
33� �
.
33� �
ToString
33� �
(
33� �
$str
33� �
)
33� �
,44& '
campaign44( 0
.440 1
ReBroadCast441 <
?44= >
$str44? D
:44E F
$str44G K
,44K L
campaign44M U
.44U V
ReBroadcastDate44V e
.44e f
HasValue44f n
?44o p
campaign44q y
.44y z
ReBroadcastDate	44z �
.
44� �
ToString
44� �
(
44� �
)
44� �
:
44� �
$str
44� �
,
44� �
campaign
44� �
.
44� �
FromLine
44� �
,
44� �
campaign
44� �
.
44� �
SubjectLine
44� �
,
44� �
campaign
44� �
.
44� �
IsPersonalization
44� �
?
44� �
$str
44� �
:
44� �
$str
44� �
,55& '
campaign55( 0
.550 1
IsMatchback551 <
?55= >
$str55? D
:55E F
$str55G K
,55K L
campaign55M U
.55U V
IsSuppression55V c
?55d e
$str55f k
:55l m
$str55n r
,66& '
campaign66( 0
.660 1

WhiteLabel661 ;
,66; <
campaign66= E
.66E F
Assets66F L
.66L M
CreativeUrl66M X
,66X Y
campaign66Z b
.66b c
Assets66c i
.66i j
TestSeedUrl66j u
,66u v
campaign66w 
.	66 �
Assets
66� �
.
66� �
LiveSeedUrl
66� �
,
66� �
campaign
66� �
.
66� �!
SpecialInstructions
66� �
,77& '
campaign77( 0
.770 1
	CreatedAt771 :
.77: ;

AddMinutes77; E
(77E F
$num77F G
)77G H
.77H I

AddSeconds77I S
(77S T
$num77T V
)77V W
.77W X
ToString77X `
(77` a
)77a b
,88& '
campaign88( 0
.880 1
IP881 3
,883 4
campaign885 =
.88= >
Browser88> E
,88E F
campaign88G O
.88O P
OS88P R
,88R S
campaign88T \
.88\ ]
Referrer88] e
,99& '
Footer99( .
)99. /
;99/ 0
await:: 
SendEmailAsync::  
(::  !
loggedInUser::! -
.::- .
Email::. 3
,::3 4
subject::5 <
,::< =
body::> B
,::B C
string::D J
.::J K
Empty::K P
,::P Q
	bccEmails::R [
)::[ \
;::\ ]
};; 	
public== 
static== 
async== 
Task==   
SendApprovedToVendor==! 5
(==5 6
Vendor==6 <
vendor=== C
,==C D
Campaign==E M
campaign==N V
,==V W
CampaignSegment==X g
segment==h o
)==o p
{>> 	
string?? 
newOld?? 
=?? 
!?? 
campaign?? %
.??% &
ReBroadcasted??& 3
???4 5
$str??6 ;
:??< =
$str??> C
;??C D
string@@ 
orderNumber@@ 
=@@  
campaign@@! )
.@@) *
OrderNumber@@* 5
;@@5 6
stringAA 

deployDateAA 
=AA 
campaignAA  (
.AA( )
ApprovedAA) 1
.AA1 2

DeployDateAA2 <
.AA< =
ValueAA= B
.AAB C
ToStringAAC K
(AAK L
$strAAL O
)AAO P
;AAP Q
stringBB 

deployTimeBB 
=BB 
campaignBB  (
.BB( )
ApprovedBB) 1
.BB1 2

DeployDateBB2 <
.BB< =
ValueBB= B
.BBB C
ToStringBBC K
(BBK L
$strBBL S
)BBS T
;BBT U
stringCC 
quantityCC 
=CC 
campaignCC &
.CC& '
ApprovedCC' /
.CC/ 0
QuantityCC0 8
.CC8 9
ToStringCC9 A
(CCA B
)CCB C
;CCC D
stringEE 
subjectEE 
;EE 
stringFF 
segmentsHtmlFF 
=FF  !
stringFF" (
.FF( )
EmptyFF) .
;FF. /
ifGG 
(GG 
segmentGG 
==GG 
nullGG 
)GG  
{HH 
subjectII 
=II 
stringII  
.II  !
FormatII! '
(II' (
$strII( D
,IID E
newOldIIF L
,IIL M
campaignIIN V
.IIV W
ApprovedIIW _
.II_ `
CampaignNameII` l
,IIl m
campaignIIn v
.IIv w
OrderNumber	IIw �
)
II� �
;
II� �
}JJ 
elseJJ 
{KK 
subjectLL 
=LL 
stringLL  
.LL  !
FormatLL! '
(LL' (
$strLL( D
,LLD E
newOldLLF L
,LLL M
campaignLLN V
.LLV W
ApprovedLLW _
.LL_ `
CampaignNameLL` l
,LLl m
segmentLLn u
.LLu v
SegmentNumber	LLv �
)
LL� �
;
LL� �
segmentsHtmlMM 
+=MM 
stringMM  &
.MM& '
FormatMM' -
(MM- .
$strMT. c
,TTc d
segmentUU  '
.UU' (
SegmentNumberUU( 5
,UU5 6
segmentUU7 >
.UU> ?
SubjectLineUU? J
,UUJ K
segmentUUL S
.UUS T
FromLineUUT \
,UU\ ]
segmentUU^ e
.UUe f

WhiteLabelUUf p
,UUp q
segmentUUr y
.UUy z
DeploymentDate	UUz �
,
UU� �
segment
UU� �
.
UU� � 
SegmentDataFileUrl
UU� �
,
UU� �
NumberHelperVV  ,
.VV, -
GetTotalVV- 5
(VV5 6
segmentVV6 =
.VV= >
FirstRangeStartVV> M
,VVM N
segmentVVO V
.VVV W
FirstRangeEndVVW d
,VVd e
segmentVVf m
.VVm n
SecondRangeStartVVn ~
,VV~ 
segment
VV� �
.
VV� �
SecondRangeEnd
VV� �
,
VV� �
segment
VV� �
.
VV� �
ThirdRangeStart
VV� �
,
VV� �
segment
VV� �
.
VV� �
ThirdRangeEnd
VV� �
)
VV� �
)
VV� �
;
VV� �
}WW 
stringXX 
bodyXX 
=XX 
stringXX  
.XX  !
FormatXX! '
(XX' (
$strXt( B
,uu& '
vendoruu( .
.uu. /
Nameuu/ 3
,uu3 4
campaignuu5 =
.uu= >
Approveduu> F
.uuF G
ReferenceNumberuuG V
,uuV W
orderNumberuuX c
,uuc d
campaignuue m
.uum n
Approveduun v
.uuv w
CampaignName	uuw �
,vv& '
campaignvv( 0
.vv0 1
Approvedvv1 9
.vv9 :
ReBroadCastvv: E
?vvF G
$strvvH M
:vvN O
$strvvP T
,vvT U
campaignvvV ^
.vv^ _
Approvedvv_ g
.vvg h

DeployDatevvh r
.vvr s
Valuevvs x
.vvx y
ToString	vvy �
(
vv� �
$str
vv� �
)
vv� �
,ww& '
campaignww( 0
.ww0 1
Approvedww1 9
.ww9 :
FromLineww: B
,wwB C
campaignwwD L
.wwL M
ApprovedwwM U
.wwU V
SubjectLinewwV a
,wwa b
campaignwwc k
.wwk l
OptOutwwl r
,wwr s
campaignwwt |
.ww| }
Approved	ww} �
.
ww� �

WhiteLabel
ww� �
,xx& '
campaignxx( 0
.xx0 1
IsPersonalizationxx1 B
?xxC D
$strxxE J
:xxK L
$strxxM Q
,xxQ R
campaignxxS [
.xx[ \
Assetsxx\ b
.xxb c
CreativeUrlxxc n
,xxn o
quantityxxp x
,yy& '
campaignyy( 0
.yy0 1
Approvedyy1 9
.yy9 :

GeoDetailsyy: D
,yyD E
campaignyyF N
.yyN O
ApprovedyyO W
.yyW X
DemographicsyyX d
,yyd e
campaignyyf n
.yyn o
Assetsyyo u
.yyu v

ZipCodeUrl	yyv �
,zz& '
campaignzz( 0
.zz0 1
Approvedzz1 9
.zz9 :
SpecialInstructionszz: M
,zzM N

deployDatezzO Y
,zzY Z

deployTimezz[ e
,{{& '
campaign{{( 0
.{{0 1
Approved{{1 9
.{{9 :
ReportSiteLink{{: H
,{{H I
campaign{{J R
.{{R S
Approved{{S [
.{{[ \
LinkBreakout{{\ h
,||& '
campaign||( 0
.||0 1
Approved||1 9
.||9 :
IsOpenPixel||: E
?||F G
$str||H M
:||N O
$str||P T
,||T U
campaign||V ^
.||^ _
Approved||_ g
.||g h
OpenPixelUrl||h t
,}}& '
campaign}}( 0
.}}0 1
Approved}}1 9
.}}9 :
	OpenGoals}}: C
,}}C D
campaign}}E M
.}}M N
Approved}}N V
.}}V W

ClickGoals}}W a
,~~& '
segmentsHtml~~( 4
,& '
Footer( .
). /
;/ 0
await
�� 
SendEmailAsync
��  
(
��  !
vendor
��! '
.
��' (
Email
��( -
,
��- .
subject
��/ 6
,
��6 7
body
��8 <
,
��< =
vendor
��> D
.
��D E
CCEmails
��E M
)
��M N
;
��N O
}
�� 	
public
�� 
static
�� 
async
�� 
Task
��  '
SendNotificationsToVendor
��! :
(
��: ;
Vendor
��; A
vendor
��B H
,
��H I
List
��J N
<
��N O
Campaign
��O W
>
��W X
	campaigns
��Y b
)
��b c
{
�� 	
string
�� 
subject
�� 
=
�� 
string
�� #
.
��# $
Format
��$ *
(
��* +
$str
��+ J
)
��J K
;
��K L
string
�� 
problems
�� 
=
�� 
$str�� �
;��� �
foreach
�� 
(
�� 
var
�� 
campaign
�� !
in
��" $
	campaigns
��% .
)
��. /
{
�� 
foreach
�� 
(
�� 
var
�� 
notification
�� )
in
��* ,
campaign
��- 5
.
��5 6
Notifications
��6 C
)
��C D
{
�� 
problems
�� 
+=
�� 
string
��  &
.
��& '
Format
��' -
(
��- .
$str
��. u
,
��u v
campaign
��  
.
��  !
OrderNumber
��! ,
,
��, -
campaign
��. 6
.
��6 7
CampaignName
��7 C
,
��C D
notification
��E Q
.
��Q R
	CheckTime
��R [
,
��[ \
(
�� 
QCRule
�� 
)
��  
notification
��  ,
.
��, -
QCRule
��- 3
,
��3 4
QCRuleUtility
��5 B
.
��B C
	GetString
��C L
(
��L M
notification
��M Y
.
��Y Z
QCRule
��Z `
)
��` a
)
��a b
;
��b c
}
�� 
}
�� 
problems
�� 
+=
�� 
$str
�� "
;
��" #
string
�� 
body
�� 
=
�� 
string
��  
.
��  !
Format
��! '
(
��' (
$str
��( <
,
��& '
vendor
��( .
.
��. /
Name
��/ 3
,
��3 4
problems
��5 =
,
��& '
Footer
��( .
)
��. /
;
��/ 0
await
�� 
SendEmailAsync
��  
(
��  !
vendor
��! '
.
��' (
Email
��( -
,
��- .
subject
��/ 6
,
��6 7
body
��8 <
,
��< =
vendor
��> D
.
��D E
CCEmails
��E M
)
��M N
;
��N O
}
�� 	
public
�� 
static
�� 
void
�� 
SendErrorEmail
�� )
(
��) *
string
��* 0
to
��1 3
,
��3 4
	Exception
��5 >
ex
��? A
,
��A B
string
��C I
currentController
��J [
,
��[ \
string
��] c
currentAction
��d q
)
��q r
{
�� 	
if
�� 
(
�� "
ConfigurationManager
�� $
.
��$ %
AppSettings
��% 0
[
��0 1
$str
��1 9
]
��9 :
==
��; =
$str
��> D
)
��D E
{
�� 
string
�� 
subject
�� 
=
��  
$str
��! F
;
��F G
string
�� 
body
�� 
=
�� 
string
�� $
.
��$ %
Format
��% +
(
��+ ,
$str
��, 7
,
��7 8
currentController
��9 J
,
��J K
currentAction
��L Y
,
��Y Z
ex
��[ ]
.
��] ^!
GetExceptionMessage
��^ q
(
��q r
)
��r s
)
��s t
;
��t u
	SendEmail
�� 
(
�� 
to
�� 
,
�� 
subject
�� %
,
��% &
body
��' +
)
��+ ,
;
��, -
}
�� 
}
�� 	
public
�� 
static
�� 
async
�� 
Task
��  
SendEmailAsync
��! /
(
��/ 0
string
��0 6
to
��7 9
,
��9 :
string
��; A
subject
��B I
,
��I J
string
��K Q
body
��R V
,
��V W
string
��X ^
ccEmails
��_ g
=
��h i
$str
��j l
,
��l m
string
��n t
	bccEmails
��u ~
=�� �
$str��� �
,��� �
List��� �
<��� �
string��� �
>��� �
attachments��� �
=��� �
null��� �
)��� �
{
�� 	
using
�� 
(
�� 
var
�� 

smtpClient
�� !
=
��" #
new
��$ '

SmtpClient
��( 2
(
��2 3
)
��3 4
)
��4 5
{
�� 
var
�� 
msg
�� 
=
�� 
CreateMessage
�� '
(
��' (
to
��( *
,
��* +
subject
��, 3
,
��3 4
body
��5 9
,
��9 :
ccEmails
��; C
,
��C D
	bccEmails
��E N
,
��N O
attachments
��P [
)
��[ \
;
��\ ]
await
�� 

smtpClient
��  
.
��  !
SendMailAsync
��! .
(
��. /
msg
��/ 2
)
��2 3
;
��3 4
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
	SendEmail
�� $
(
��$ %
string
��% +
to
��, .
,
��. /
string
��0 6
subject
��7 >
,
��> ?
string
��@ F
body
��G K
,
��K L
string
��M S
ccEmails
��T \
=
��] ^
$str
��_ a
,
��a b
string
��c i
	bccEmails
��j s
=
��t u
$str
��v x
,
��x y
List
��z ~
<
��~ 
string�� �
>��� �
attachments��� �
=��� �
null��� �
)��� �
{
�� 	
using
�� 
(
�� 
var
�� 

smtpClient
�� !
=
��" #
new
��$ '

SmtpClient
��( 2
(
��2 3
)
��3 4
)
��4 5
{
�� 
var
�� 
msg
�� 
=
�� 
CreateMessage
�� '
(
��' (
to
��( *
,
��* +
subject
��, 3
,
��3 4
body
��5 9
,
��9 :
ccEmails
��; C
,
��C D
	bccEmails
��E N
,
��N O
attachments
��P [
)
��[ \
;
��\ ]

smtpClient
�� 
.
�� 
Send
�� 
(
��  
msg
��  #
)
��# $
;
��$ %
}
�� 
}
�� 	
private
�� 
static
�� 
MailMessage
�� "
CreateMessage
��# 0
(
��0 1
string
��1 7
to
��8 :
,
��: ;
string
��< B
subject
��C J
,
��J K
string
��L R
body
��S W
,
��W X
string
��Y _
ccEmails
��` h
=
��i j
$str
��k m
,
��m n
string
��o u
	bccEmails
��v 
=��� �
$str��� �
,��� �
List��� �
<��� �
string��� �
>��� �
attachments��� �
=��� �
null��� �
)��� �
{
�� 	
MailMessage
�� 
msg
�� 
=
�� 
new
�� !
MailMessage
��" -
(
��- .
)
��. /
;
��/ 0
msg
�� 
.
�� 
To
�� 
.
�� 
Add
�� 
(
�� 
new
�� 
MailAddress
�� &
(
��& '
to
��' )
)
��) *
)
��* +
;
��+ ,
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
ccEmails
��& .
)
��. /
)
��/ 0
{
�� 
foreach
�� 
(
�� 
var
�� 
ccEmail
�� $
in
��% '
ccEmails
��( 0
.
��0 1
Split
��1 6
(
��6 7
$str
��7 ;
.
��; <
ToCharArray
��< G
(
��G H
)
��H I
,
��I J 
StringSplitOptions
��K ]
.
��] ^ 
RemoveEmptyEntries
��^ p
)
��p q
)
��q r
{
�� 
msg
�� 
.
�� 
CC
�� 
.
�� 
Add
�� 
(
�� 
ccEmail
�� &
)
��& '
;
��' (
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
	bccEmails
��& /
)
��/ 0
)
��0 1
{
�� 
foreach
�� 
(
�� 
var
�� 
bccEmail
�� %
in
��& (
	bccEmails
��) 2
.
��2 3
Split
��3 8
(
��8 9
$str
��9 =
.
��= >
ToCharArray
��> I
(
��I J
)
��J K
,
��K L 
StringSplitOptions
��M _
.
��_ ` 
RemoveEmptyEntries
��` r
)
��r s
)
��s t
{
�� 
msg
�� 
.
�� 
Bcc
�� 
.
�� 
Add
�� 
(
��  
bccEmail
��  (
)
��( )
;
��) *
}
�� 
}
�� 
msg
�� 
.
�� 
Subject
�� 
=
�� 
subject
�� !
;
��! "
msg
�� 
.
�� 

IsBodyHtml
�� 
=
�� 
true
�� !
;
��! "
msg
�� 
.
�� 
Body
�� 
=
�� 
body
�� 
;
�� 
if
�� 
(
�� 
attachments
�� 
!=
�� 
null
�� #
)
��# $
foreach
�� 
(
�� 
var
�� 

attachment
�� '
in
��( *
attachments
��+ 6
)
��6 7
{
�� 
msg
�� 
.
�� 
Attachments
�� #
.
��# $
Add
��$ '
(
��' (
new
��( +
System
��, 2
.
��2 3
Net
��3 6
.
��6 7
Mail
��7 ;
.
��; <

Attachment
��< F
(
��F G

attachment
��G Q
)
��Q R
)
��R S
;
��S T
}
�� 
return
�� 
msg
�� 
;
�� 
}
�� 	
}
�� 
}�� �D
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ExceptionHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

static 
class 
ExceptionHelper '
{ 
public 
static 
string 
GetExceptionMessage 0
(0 1
this1 5
	Exception6 ?
ex@ B
,B C
stringD J
customMessageK X
=Y Z
$str[ ]
)] ^
{ 	
var 
message 
= 
( 
customMessage (
!=) +
$str, .
). /
? 
customMessage 
+  !
$str" %
+& '
ex( *
.* +
GetBaseException+ ;
(; <
)< =
.= >
Message> E
: 
ex 
. 
GetBaseException %
(% &
)& '
.' (
Message( /
;/ 0
message 
+= 
$str #
+$ %
ex& (
.( )

StackTrace) 3
+3 4
$str5 =
;= >
if 
( 
ex 
is 
SqlException "
)" #
{ 
return 
$str 6
+7 8
message9 @
;@ A
} 
else 
if 
( 
ex 
is $
IndexOutOfRangeException 3
)3 4
{ 
return 
$str 1
+2 3
message4 ;
;; <
} 
else 
if 
( 
ex 
is '
DbEntityValidationException 6
)6 7
{   
var!! 
	exception!! 
=!! 
(!!  !'
DbEntityValidationException!!! <
)!!< =
ex!!= ?
;!!? @
var"" 
errorMessages"" !
=""" #
	exception""$ -
.""- ."
EntityValidationErrors"". D
.## 

SelectMany## 
(##  
x##  !
=>##" $
x##% &
.##& '
ValidationErrors##' 7
)##7 8
.$$ 
Select$$ 
($$ 
x$$ 
=>$$  
x$$! "
.$$" #
ErrorMessage$$# /
)$$/ 0
;$$0 1
var%% 
messages%% 
=%% 
errorMessages%% ,
.%%, -
	Aggregate%%- 6
(%%6 7
$str%%7 9
,%%9 :
(&& 
current&& 
,&& 
errorMessage&& *
)&&* +
=>&&, .
current&&/ 6
+&&7 8
(&&9 :
$str&&: @
+&&A B
errorMessage&&C O
+&&P Q
$str&&R Y
)&&Y Z
)&&Z [
;&&[ \
return'' 
message'' 
+''  
$str''! (
+'') *
messages''+ 3
;''3 4
}(( 
else)) 
if)) 
()) 
ex)) 
is)) +
EntityCommandExecutionException)) :
))): ;
{** 
return++ 
$str++ >
+++? @
message++A H
;++H I
},, 
else-- 
if-- 
(-- 
ex-- 
is-- 
SecurityException-- ,
)--, -
{.. 
return// 
$str// *
+//+ ,
message//- 4
;//4 5
}00 
else11 
if11 
(11 
ex11 
is11 
SystemException11 *
)11* +
{22 
return33 
message33 
;33 
}44 
else55 
if55 
(55 
ex55 
is55  
ApplicationException55 /
)55/ 0
{66 
return77 
message77 
;77 
}88 
else99 
{:: 
return;; 
message;; 
;;; 
}<< 
}== 	
public>> 
static>> 
void>> 
HandleException>> *
(>>* +
this>>+ /
	Exception>>0 9
ex>>: <
,>>< =
string>>> D
customMessage>>E R
=>>S T
$str>>U W
)>>W X
{?? 	
var@@ 
message@@ 
=@@ 
(@@ 
customMessage@@ (
!=@@) +
$str@@, .
)@@. /
?AA 
customMessageAA 
+AA  !
$strAA" %
+AA& '
exAA( *
.AA* +
GetBaseExceptionAA+ ;
(AA; <
)AA< =
.AA= >
MessageAA> E
:BB 
exBB 
.BB 
GetBaseExceptionBB %
(BB% &
)BB& '
.BB' (
MessageBB( /
;BB/ 0
ifCC 
(CC 
exCC 
isCC 
SqlExceptionCC "
)CC" #
{DD 
}FF 
elseGG 
ifGG 
(GG 
exGG 
isGG $
IndexOutOfRangeExceptionGG 3
)GG3 4
{HH 
}JJ 
elseKK 
ifKK 
(KK 
exKK 
isKK '
DbEntityValidationExceptionKK 6
)KK6 7
{LL 
varMM 
	exceptionMM 
=MM 
(MM  !'
DbEntityValidationExceptionMM! <
)MM< =
exMM= ?
;MM? @
varNN 
errorMessagesNN !
=NN" #
	exceptionNN$ -
.NN- ."
EntityValidationErrorsNN. D
.OO 

SelectManyOO 
(OO  
xOO  !
=>OO" $
xOO% &
.OO& '
ValidationErrorsOO' 7
)OO7 8
.PP 
SelectPP 
(PP 
xPP 
=>PP  
xPP! "
.PP" #
ErrorMessagePP# /
)PP/ 0
;PP0 1
varQQ 
messagesQQ 
=QQ 
errorMessagesQQ ,
.QQ, -
	AggregateQQ- 6
(QQ6 7
$strQQ7 9
,QQ9 :
(RR 
currentRR 
,RR 
errorMessageRR *
)RR* +
=>RR, .
currentRR/ 6
+RR7 8
(RR9 :
$strRR: @
+RRA B
errorMessageRRC O
+RRP Q
$strRRR Y
)RRY Z
)RRZ [
;RR[ \
}TT 
elseUU 
ifUU 
(UU 
exUU 
isUU +
EntityCommandExecutionExceptionUU :
)UU: ;
{VV 
}XX 
elseYY 
ifYY 
(YY 
exYY 
isYY 
SecurityExceptionYY ,
)YY, -
{ZZ 
}\\ 
else]] 
if]] 
(]] 
ex]] 
is]] 
SystemException]] *
)]]* +
{^^ 
}`` 
elseaa 
ifaa 
(aa 
exaa 
isaa  
ApplicationExceptionaa /
)aa/ 0
{bb 
}dd 
elseee 
{ff 
}hh 
}ii 	
}jj 
publicnn 

staticnn 
classnn %
ControllerExceptionHelpernn 1
{oo 
publicpp 
staticpp 
stringpp 
GetModelStateErrorspp 0
(pp0 1
thispp1 5
ICollectionpp6 A
<ppA B

ModelStateppB L
>ppL M
valuesppN T
)ppT U
{qq 	
varrr 
sbrr 
=rr 
newrr 
StringBuilderrr &
(rr& '
)rr' (
;rr( )
foreachss 
(ss 
varss 

modelStatess #
inss$ &
valuesss' -
)ss- .
{tt 
foreachuu 
(uu 
varuu 
erroruu "
inuu# %

modelStateuu& 0
.uu0 1
Errorsuu1 7
)uu7 8
{vv 
varww 
liww 
=ww 
newww  

TagBuilderww! +
(ww+ ,
$strww, 0
)ww0 1
;ww1 2
lixx 
.xx 
SetInnerTextxx #
(xx# $
errorxx$ )
.xx) *
ErrorMessagexx* 6
)xx6 7
;xx7 8
sbyy 
.yy 
Appendyy 
(yy 
liyy  
)yy  !
;yy! "
}zz 
}{{ 
return|| 
sb|| 
.|| 
ToString|| 
(|| 
)||  
;||  !
}}} 	
}~~ 
} �
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\FileHelper.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 

FileHelper 
{ 
public 
static 
readonly 
string %&
UploadsSupplierListingPath& @
=A B
HttpContextC N
.N O
CurrentO V
.V W
ServerW ]
.] ^
MapPath^ e
(e f
$str	f �
)
� �
;
� �
public		 
static		 
string		 
GetImagePath		 )
(		) *
string		* 0
fileName		1 9
)		9 :
{

 	
return &
UploadsSupplierListingPath -
+- .
$str. 2
+2 3
fileName3 ;
+; <
$str< B
;B C
} 	
} 
} �
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\GatePassGenerator.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 
GatePassGenerator "
{ 
public 
static 
string 

GetNewPass '
(' (
)( )
{		 	
byte

 
[

 
]

 
buffer

 
=

 
Guid

  
.

  !
NewGuid

! (
(

( )
)

) *
.

* +
ToByteArray

+ 6
(

6 7
)

7 8
;

8 9
var 

FormNumber 
= 
BitConverter )
.) *
ToUInt32* 2
(2 3
buffer3 9
,9 :
$num; <
)< =
^> ?
BitConverter@ L
.L M
ToUInt32M U
(U V
bufferV \
,\ ]
$num^ _
)_ `
^a b
BitConverterc o
.o p
ToUInt32p x
(x y
buffery 
,	 �
$num
� �
)
� �
^
� �
BitConverter
� �
.
� �
ToUInt32
� �
(
� �
buffer
� �
,
� �
$num
� �
)
� �
;
� �
return 

FormNumber 
. 
ToString &
(& '
$str' *
)* +
;+ ,
} 	
static 
Random 
random 
= 
new "
Random# )
() *
)* +
;+ ,
public 
static 
string 

GetNewPass '
(' (
int( +
digits, 2
)2 3
{ 	
byte 
[ 
] 
buffer 
= 
new 
byte  $
[$ %
digits% +
/, -
$num. /
]/ 0
;0 1
random 
. 
	NextBytes 
( 
buffer #
)# $
;$ %
string 
result 
= 
string "
." #
Concat# )
() *
buffer* 0
.0 1
Select1 7
(7 8
x8 9
=>: <
x= >
.> ?
ToString? G
(G H
$strH L
)L M
)M N
.N O
ToArrayO V
(V W
)W X
)X Y
;Y Z
if 
( 
digits 
% 
$num 
== 
$num 
)  
return 
result 
; 
return 
result 
+ 
random "
." #
Next# '
(' (
$num( *
)* +
.+ ,
ToString, 4
(4 5
$str5 8
)8 9
;9 :
} 	
} 
} �
;E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Hubs\WFPICTHub.cs
	namespace 	
WFP
 
. 
ICT 
. 
Hubs 
{ 
[		 
HubName		 
(		 
$str		 
)		 
]		 
public

 

class

 
	WFPICTHub

 
:

 
Hub

  
{ 
private 
readonly 
WFPICTUpdater &
_wfpictUpdater' 5
;5 6
public 
	WFPICTHub 
( 
) 
: 
this !
(! "
WFPICTUpdater" /
./ 0
Instance0 8
)8 9
{ 	
} 	
public 
	WFPICTHub 
( 
WFPICTUpdater &
wfpictUpdater' 4
)4 5
{ 	
_wfpictUpdater 
= 
wfpictUpdater *
;* +
} 	
public 
void  
StartUpdatingClients (
(( )
)) *
{ 	
_wfpictUpdater 
.  
StartUpdatingClients /
(/ 0
)0 1
;1 2
} 	
public!! 
void!! 
StopUpdatingClients!! '
(!!' (
)!!( )
{"" 	
_wfpictUpdater## 
.## 
StopUpdatingClients## .
(##. /
)##/ 0
;##0 1
}$$ 	
}%% 
}&& �,
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Hubs\WFPICTUpdater.cs
	namespace 	
WFP
 
. 
ICT 
. 
Hubs 
{ 
public 

class 
WFPICTUpdater 
{ 
private 
readonly 
static 
Lazy  $
<$ %
WFPICTUpdater% 2
>2 3
	_instance4 =
=> ?
new 
Lazy 
< 
WFPICTUpdater "
>" #
(# $
( 
) 
=> 
new 
WFPICTUpdater '
(' (

GlobalHost 
. 
ConnectionManager 0
.0 1
GetHubContext1 >
<> ?
	WFPICTHub? H
>H I
(I J
)J K
.K L
ClientsL S
)S T
)T U
;U V
private 
readonly 
object 
_lock  %
=& '
new( +
object, 2
(2 3
)3 4
;4 5
private 
readonly 
TimeSpan !
_updateInterval" 1
=2 3
TimeSpan4 <
.< =
FromSeconds= H
(H I
$numI K
)K L
;L M
private 
Timer 
_timer 
; 
private 
volatile 
bool 
_isUpdating )
;) *
private 
WFPICTUpdater 
( !
IHubConnectionContext 3
<3 4
dynamic4 ;
>; <
clients= D
)D E
{   	
Clients!! 
=!! 
clients!! 
;!! 
}"" 	
public$$ 
static$$ 
WFPICTUpdater$$ #
Instance$$$ ,
{%% 	
get&& 
{'' 
return(( 
	_instance((  
.((  !
Value((! &
;((& '
})) 
}** 	
private,, !
IHubConnectionContext,, %
<,,% &
dynamic,,& -
>,,- .
Clients,,/ 6
{-- 	
get.. 
;.. 
set// 
;// 
}00 	
public22 
void22  
StartUpdatingClients22 (
(22( )
)22) *
{33 	
lock44 
(44 
_lock44 
)44 
{55 
_timer66 
=66 
new66 
Timer66 "
(66" #
UpdateClients66# 0
,660 1
null662 6
,666 7
_updateInterval668 G
,66G H
_updateInterval66I X
)66X Y
;66Y Z
}77 
}88 	
private:: 
void:: 
UpdateClients:: "
(::" #
object::# )
state::* /
)::/ 0
{;; 	
lock<< 
(<< 
_lock<< 
)<< 
{== 
if>> 
(>> 
!>> 
_isUpdating>>  
)>>  !
{?? 
_isUpdating@@ 
=@@  !
true@@" &
;@@& '
usingBB 
(BB 
varBB 
dbBB !
=BB" #
newBB$ '
WfpictContextBB( 5
(BB5 6
)BB6 7
)BB7 8
{CC 
varDD 
logsDD  
=DD! "
dbDD# %
.DD% &

SystemLogsDD& 0
.DD0 1
OrderByDescendingDD1 B
(DDB C
xDDC D
=>DDE G
xDDH I
.DDI J
	CreatedAtDDJ S
)DDS T
.EE 
TakeEE !
(EE! "
$numEE" %
)EE% &
.FF 
ToListFF #
(FF# $
)FF$ %
.GG 
SelectGG #
(GG# $
xGG$ %
=>GG& (
newGG) ,
SystemLogVMGG- 8
(GG8 9
)GG9 :
{HH 
	CreatedAtII  )
=II* +
xII, -
.II- .
	CreatedAtII. 7
.II7 8
ToStringII8 @
(II@ A
StringConstantsIIA P
.IIP Q 
DateTimeFormatDashesIIQ e
)IIe f
,IIf g
LogTypeJJ  '
=JJ( )
SystemJJ* 0
.JJ0 1
EnumJJ1 5
.JJ5 6
GetNameJJ6 =
(JJ= >
typeofJJ> D
(JJD E
LogTypeJJE L
)JJL M
,JJM N
(JJO P
LogTypeJJP W
)JJW X
xJJX Y
.JJY Z
LogTypeJJZ a
)JJa b
,JJb c
OrderNumberKK  +
=KK, -
xKK. /
.KK/ 0
OrderNumberKK0 ;
,KK; <
MessageLL  '
=LL( )
xLL* +
.LL+ ,
MessageLL, 3
}MM 
)MM 
.NN 
ToListNN #
(NN# $
)NN$ %
;NN% &
ClientsOO 
.OO  
AllOO  #
.OO# $
refreshOO$ +
(OO+ ,
logsOO, 0
)OO0 1
;OO1 2
}PP 
_isUpdatingQQ 
=QQ  !
falseQQ" '
;QQ' (
}RR 
}SS 
}TT 	
publicVV 
voidVV 
StopUpdatingClientsVV '
(VV' (
)VV( )
{WW 	
lockXX 
(XX 
_lockXX 
)XX 
{YY 
ifZZ 
(ZZ 
_timerZZ 
!=ZZ 
nullZZ "
)ZZ" #
{[[ 
_timer\\ 
.\\ 
Dispose\\ "
(\\" #
)\\# $
;\\$ %
}]] 
}^^ 
}__ 	
}`` 
}aa ��
<E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\Campaign.cs
	namespace 	
ADS
 
. 
API 
. 
Models 
{ 
public 

class 
Campaign 
{ 
private		 
static		 
readonly		 
SortedDictionary		  0
<		0 1
int		1 4
,		4 5
KeyValuePair		6 B
<		B C
int		C F
,		F G
int		H K
>		K L
>		L M,
 hoursPercentageDictionaryDynamic		N n
=

 
new

 
SortedDictionary

 "
<

" #
int

# &
,

& '
KeyValuePair

( 4
<

4 5
int

5 8
,

8 9
int

: =
>

= >
>

> ?
(

? @
)

@ A
{ 	
{ 
$num 
, 
new 
KeyValuePair  
<  !
int! $
,$ %
int& )
>) *
(* +
$num+ .
,. /
$num0 3
)3 4
}5 6
,6 7
{ 
$num 
, 
new 
KeyValuePair  
<  !
int! $
,$ %
int& )
>) *
(* +
$num+ -
,- .
$num/ 2
)2 3
}4 5
,5 6
{ 
$num 
, 
new 
KeyValuePair  
<  !
int! $
,$ %
int& )
>) *
(* +
$num+ -
,- .
$num/ 2
)2 3
}4 5
,5 6
{ 
$num 
, 
new 
KeyValuePair  
<  !
int! $
,$ %
int& )
>) *
(* +
$num+ .
,. /
$num0 3
)3 4
}5 6
,6 7
{ 
$num 
, 
new 
KeyValuePair  
<  !
int! $
,$ %
int& )
>) *
(* +
$num+ .
,. /
$num0 3
)3 4
}5 6
,6 7
{ 
$num 
, 
new 
KeyValuePair !
<! "
int" %
,% &
int' *
>* +
(+ ,
$num, .
,. /
$num0 3
)3 4
}5 6
,6 7
{ 
$num 
, 
new 
KeyValuePair !
<! "
int" %
,% &
int' *
>* +
(+ ,
$num, .
,. /
$num0 3
)3 4
}5 6
,6 7
{ 
$num 
, 
new 
KeyValuePair !
<! "
int" %
,% &
int' *
>* +
(+ ,
$num, .
,. /
$num0 3
)3 4
}5 6
,6 7
{ 
$num 
, 
new 
KeyValuePair !
<! "
int" %
,% &
int' *
>* +
(+ ,
$num, .
,. /
$num0 2
)2 3
}4 5
,5 6
{ 
$num 
, 
new 
KeyValuePair !
<! "
int" %
,% &
int' *
>* +
(+ ,
$num, .
,. /
$num0 2
)2 3
}4 5
,5 6
{ 
$num 
, 
new 
KeyValuePair !
<! "
int" %
,% &
int' *
>* +
(+ ,
$num, .
,. /
$num0 2
)2 3
}4 5
} 	
;	 

public 
static 
double  
GetPercentageDynamic 1
(1 2
int2 5
hr6 8
)8 9
{ 	
var 
r 
= 
new 
Random 
( 
)  
;  !
double 
finalPercentage "
=# $
$num% (
;( )
if 
( 
hr 
>= 
$num 
) 
finalPercentage 
+=  "
r# $
.$ %
Next% )
() *,
 hoursPercentageDictionaryDynamic* J
[J K
$numK L
]L M
.M N
KeyN Q
,Q R,
 hoursPercentageDictionaryDynamicS s
[s t
$numt u
]u v
.v w
Valuew |
)| }
/~ 
$num
� �
;
� �
if 
( 
hr 
>= 
$num 
) 
finalPercentage   
+=    "
r  # $
.  $ %
Next  % )
(  ) *,
 hoursPercentageDictionaryDynamic  * J
[  J K
$num  K L
]  L M
.  M N
Key  N Q
,  Q R,
 hoursPercentageDictionaryDynamic  S s
[  s t
$num  t u
]  u v
.  v w
Value  w |
)  | }
/  ~ 
$num
  � �
;
  � �
if!! 
(!! 
hr!! 
>=!! 
$num!! 
)!! 
finalPercentage"" 
+=""  "
r""# $
.""$ %
Next""% )
("") *,
 hoursPercentageDictionaryDynamic""* J
[""J K
$num""K L
]""L M
.""M N
Key""N Q
,""Q R,
 hoursPercentageDictionaryDynamic""S s
[""s t
$num""t u
]""u v
.""v w
Value""w |
)""| }
/""~ 
$num
""� �
;
""� �
if## 
(## 
hr## 
>=## 
$num## 
)## 
finalPercentage$$ 
+=$$  "
r$$# $
.$$$ %
Next$$% )
($$) *,
 hoursPercentageDictionaryDynamic$$* J
[$$J K
$num$$K L
]$$L M
.$$M N
Key$$N Q
,$$Q R,
 hoursPercentageDictionaryDynamic$$S s
[$$s t
$num$$t u
]$$u v
.$$v w
Value$$w |
)$$| }
/$$~ 
$num
$$� �
;
$$� �
if%% 
(%% 
hr%% 
>=%% 
$num%% 
)%% 
finalPercentage&& 
+=&&  "
r&&# $
.&&$ %
Next&&% )
(&&) *,
 hoursPercentageDictionaryDynamic&&* J
[&&J K
$num&&K L
]&&L M
.&&M N
Key&&N Q
,&&Q R,
 hoursPercentageDictionaryDynamic&&S s
[&&s t
$num&&t u
]&&u v
.&&v w
Value&&w |
)&&| }
/&&~ 
$num
&&� �
;
&&� �
if'' 
('' 
hr'' 
>='' 
$num'' 
)'' 
finalPercentage(( 
+=((  "
r((# $
.(($ %
Next((% )
((() *,
 hoursPercentageDictionaryDynamic((* J
[((J K
$num((K M
]((M N
.((N O
Key((O R
,((R S,
 hoursPercentageDictionaryDynamic((T t
[((t u
$num((u w
]((w x
.((x y
Value((y ~
)((~ 
/
((� �
$num
((� �
;
((� �
if)) 
()) 
hr)) 
>=)) 
$num)) 
))) 
finalPercentage** 
+=**  "
r**# $
.**$ %
Next**% )
(**) *,
 hoursPercentageDictionaryDynamic*** J
[**J K
$num**K M
]**M N
.**N O
Key**O R
,**R S,
 hoursPercentageDictionaryDynamic**T t
[**t u
$num**u w
]**w x
.**x y
Value**y ~
)**~ 
/
**� �
$num
**� �
;
**� �
if++ 
(++ 
hr++ 
>=++ 
$num++ 
)++ 
finalPercentage,, 
+=,,  "
r,,# $
.,,$ %
Next,,% )
(,,) *,
 hoursPercentageDictionaryDynamic,,* J
[,,J K
$num,,K M
],,M N
.,,N O
Key,,O R
,,,R S,
 hoursPercentageDictionaryDynamic,,T t
[,,t u
$num,,u w
],,w x
.,,x y
Value,,y ~
),,~ 
/
,,� �
$num
,,� �
;
,,� �
if-- 
(-- 
hr-- 
>=-- 
$num-- 
)-- 
finalPercentage.. 
+=..  "
r..# $
...$ %
Next..% )
(..) *,
 hoursPercentageDictionaryDynamic..* J
[..J K
$num..K M
]..M N
...N O
Key..O R
,..R S,
 hoursPercentageDictionaryDynamic..T t
[..t u
$num..u w
]..w x
...x y
Value..y ~
)..~ 
/
..� �
$num
..� �
;
..� �
if// 
(// 
hr// 
>=// 
$num// 
)// 
finalPercentage00 
+=00  "
r00# $
.00$ %
Next00% )
(00) *,
 hoursPercentageDictionaryDynamic00* J
[00J K
$num00K M
]00M N
.00N O
Key00O R
,00R S,
 hoursPercentageDictionaryDynamic00T t
[00t u
$num00u w
]00w x
.00x y
Value00y ~
)00~ 
/
00� �
$num
00� �
;
00� �
if11 
(11 
hr11 
>=11 
$num11 
)11 
finalPercentage22 
+=22  "
r22# $
.22$ %
Next22% )
(22) *,
 hoursPercentageDictionaryDynamic22* J
[22J K
$num22K M
]22M N
.22N O
Key22O R
,22R S,
 hoursPercentageDictionaryDynamic22T t
[22t u
$num22u w
]22w x
.22x y
Value22y ~
)22~ 
/
22� �
$num
22� �
;
22� �
return33 
finalPercentage33 "
;33" #
}44 	
private66 
static66 
readonly66 
SortedDictionary66  0
<660 1
int661 4
,664 5
double666 <
>66< =%
hoursPercentageDictionary66> W
=66X Y
new66Z ]
SortedDictionary66^ n
<66n o
int66o r
,66r s
double66t z
>66z {
(66{ |
)66| }
{77 	
{88 
$num88 
,88 
$num88 
}88 
,88 
{88 
$num88 
,88 
$num88 $
}88$ %
,88% &
{88' (
$num88( )
,88) *
$num88+ 1
}881 2
,882 3
{884 5
$num885 7
,887 8
$num889 ?
}88? @
,88@ A
{88B C
$num88C E
,88E F
$num88G M
}88M N
,88N O
{88P Q
$num88Q S
,88S T
$num88U [
}88[ \
,88\ ]
{88^ _
$num88_ a
,88a b
$num88c i
}88i j
,88j k
{88l m
$num88m o
,88o p
$num88q w
}88w x
,88x y
{88z {
$num88{ }
,88} ~
$num	88 �
}
88� �
}99 	
;99	 

public?? 
static?? 
double?? 
GetPercentage?? *
(??* +
int??+ .
hr??/ 1
)??1 2
{@@ 	
ifAA 
(AA 
hrAA 
>=AA 
$numAA 
)AA 
returnAA  %
hoursPercentageDictionaryAA! :
[AA: ;
$numAA; =
]AA= >
;AA> ?
intCC 
actualHrCC 
=CC 
-CC 
$numCC 
;CC 
intDD 
[DD 
]DD 
hrsDD 
=DD %
hoursPercentageDictionaryDD 1
.DD1 2
KeysDD2 6
.DD6 7
ToArrayDD7 >
(DD> ?
)DD? @
;DD@ A
forEE 
(EE 
intEE 
iEE 
=EE 
$numEE 
;EE 
iEE 
<EE 
hrsEE "
.EE" #
LengthEE# )
;EE) *
iEE* +
++EE+ -
)EE- .
{FF 
ifGG 
(GG 
hrGG 
>=GG 
hrsGG 
[GG 
iGG 
]GG  
&&GG! #
hrGG$ &
<GG' (
hrsGG) ,
[GG, -
iGG- .
+GG/ 0
$numGG1 2
]GG2 3
)GG3 4
{HH 
actualHrII 
=II 
hrsII "
[II" #
iII# $
]II$ %
;II% &
breakJJ 
;JJ 
}KK 
}LL 
returnMM %
hoursPercentageDictionaryMM ,
[MM, -
actualHrMM- 5
]MM5 6
;MM6 7
}NN 	
publicPP 
staticPP 
intPP 
GetOpensPP "
(PP" #
longPP# '
QuantityPP( 0
,PP0 1
DateTimePP2 :
startDateTimePP; H
)PPH I
{QQ 	
intRR 
	hrsPassedRR 
=RR 
(RR 
intRR  
)RR  !
MathRR! %
.RR% &
RoundRR& +
(RR+ ,
(RR, -
DateTimeRR- 5
.RR5 6
NowRR6 9
-RR: ;
startDateTimeRR< I
)RRI J
.RRJ K

TotalHoursRRK U
)RRU V
;RRV W
returnSS 
(SS 
intSS 
)SS 
MathSS 
.SS 
RoundSS #
(SS# $
QuantitySS$ ,
*SS- . 
GetPercentageDynamicSS/ C
(SSC D
	hrsPassedSSD M
)SSM N
)SSN O
;SSO P
}TT 	
publicVV 
stringVV 
CampaignNameVV "
{VV# $
getVV% (
;VV( )
setVV* -
;VV- .
}VV/ 0
publicWW 
stringWW 
OrderNumberWW !
{WW" #
getWW$ '
;WW' (
setWW) ,
;WW, -
}WW. /
publicXX 
stringXX 
IONumberXX 
{XX  
getXX! $
;XX$ %
setXX& )
;XX) *
}XX+ ,
publicYY 
stringYY 
	StartDateYY 
{YY  !
getYY" %
;YY% &
setYY' *
;YY* +
}YY, -
publicZZ 
stringZZ 

EmailsSentZZ  
{ZZ! "
getZZ# &
;ZZ& '
setZZ( +
;ZZ+ ,
}ZZ- .
public[[ 
string[[ 
EmailsOpened[[ "
{[[# $
get[[% (
;[[( )
set[[* -
;[[- .
}[[/ 0
public\\ 
string\\ 
EmailsClicked\\ #
{\\$ %
get\\& )
;\\) *
set\\+ .
;\\. /
}\\0 1
public^^ 
List^^ 
<^^ 
LinkBreakout^^  
>^^  !
LinkBreakout^^" .
{^^/ 0
get^^1 4
;^^4 5
set^^6 9
;^^9 :
}^^; <
public`` 
static`` 
ADS`` 
.`` 
API`` 
.`` 
Models`` $
.``$ %
Campaign``% -
FromCampaign``. :
(``: ;
WFP``; >
.``> ?
ICT``? B
.``B C
Data``C G
.``G H
Entities``H P
.``P Q
Campaign``Q Y
campaign``Z b
)``b c
{aa 	
longbb 
clickedbb 
=bb 
$numbb 
,bb 
openedbb $
=bb% &
$numbb' (
;bb( )
DateTimecc 
startDateTimecc "
=cc# $
DateTimecc% -
.cc- .
MinValuecc. 6
;cc6 7
stringdd 
IONumberdd 
=dd 
$strdd "
;dd" #
ifee 
(ee 
campaignee 
.ee 
ProDatasee !
.ee! "
Countee" '
>ee( )
$numee* +
)ee+ ,
{ff 
clickedgg 
=gg 
campaigngg "
.gg" #
ProDatasgg# +
.gg+ ,
Sumgg, /
(gg/ 0
xgg0 1
=>gg2 4
xgg5 6
.gg6 7

ClickCountgg7 A
)ggA B
;ggB C
startDateTimehh 
=hh 
DateTimehh  (
.hh( )
Parsehh) .
(hh. /
campaignhh/ 7
.hh7 8
ProDatashh8 @
.hh@ A
FirstOrDefaulthhA O
(hhO P
)hhP Q
.hhQ R
CampaignStartDatehhR c
)hhc d
;hhd e
openedii 
=ii 
GetOpensii !
(ii! "
campaignii" *
.ii* +
Approvedii+ 3
.ii3 4
Quantityii4 <
,ii< =
startDateTimeii> K
)iiK L
;iiL M
}jj 
varkk 
modelkk 
=kk 
newkk 
ADSkk 
.kk  
APIkk  #
.kk# $
Modelskk$ *
.kk* +
Campaignkk+ 3
(kk3 4
)kk4 5
{ll 
CampaignNamemm 
=mm 
campaignmm '
.mm' (
Approvedmm( 0
.mm0 1
CampaignNamemm1 =
,mm= >
EmailsClickednn 
=nn 
clickednn  '
==nn( *
$numnn+ ,
?nn- .
$strnn/ 3
:nn4 5
clickednn6 =
.nn= >
ToStringnn> F
(nnF G
)nnG H
,nnH I
EmailsOpenedoo 
=oo 
openedoo %
==oo& (
$numoo) *
?oo+ ,
$stroo- 1
:oo2 3
openedoo4 :
.oo: ;
ToStringoo; C
(ooC D
)ooD E
,ooE F
IONumberpp 
=pp 
campaignpp #
.pp# $
ProDataspp$ ,
.pp, -
FirstOrDefaultpp- ;
(pp; <
)pp< =
.pp= >
IOpp> @
,pp@ A
	StartDateqq 
=qq 
startDateTimeqq )
==qq* ,
DateTimeqq- 5
.qq5 6
MinValueqq6 >
?qq? @
$strqqA E
:qqF G
startDateTimeqqH U
.qqU V
ToStringqqV ^
(qq^ _
)qq_ `
,qq` a

EmailsSentrr 
=rr 
campaignrr %
.rr% &
Quantityrr& .
.rr. /
ToStringrr/ 7
(rr7 8
)rr8 9
,rr9 :
}ss 
;ss 
modeltt 
.tt 
LinkBreakouttt 
=tt  
newtt! $
Listtt% )
<tt) *
LinkBreakouttt* 6
>tt6 7
(tt7 8
)tt8 9
;tt9 :
foreachuu 
(uu 
varuu 
proDatauu  
inuu! #
campaignuu$ ,
.uu, -
ProDatasuu- 5
)uu5 6
{vv 
modelww 
.ww 
LinkBreakoutww "
.ww" #
Addww# &
(ww& '
newww' *
LinkBreakoutww+ 7
(ww7 8
)ww8 9
{xx 
Linkyy 
=yy 
proDatayy "
.yy" #
Destination_URLyy# 2
,yy2 3
Quantityzz 
=zz 
proDatazz &
.zz& '

ClickCountzz' 1
.zz1 2
ToStringzz2 :
(zz: ;
)zz; <
}{{ 
){{ 
;{{ 
}|| 
return}} 
model}} 
;}} 
}~~ 	
} 
public
�� 

class
�� 
LinkBreakout
�� 
{
�� 
public
�� 
string
�� 
Link
�� 
{
�� 
get
��  
;
��  !
set
��" %
;
��% &
}
��' (
public
�� 
string
�� 
Quantity
�� 
{
��  
get
��! $
;
��$ %
set
��& )
;
��) *
}
��+ ,
}
�� 
}�� �	
JE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignReportDetailVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class "
CampaignReportDetailVM '
:( )
CampaignReportVM* :
{ 
public 
string 
IONumber 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Link 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 

ClickCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
UniqueCount !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
MobileCount		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
} 
} �
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignSegmentVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CampaignSegmentVM "
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 

CampaignId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
string

 
OrderNumber

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
DateTime 
? 
DeploymentDate '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
long 
DataQuantity  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
CreativeFiles #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
FirstRangeStart "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
FirstRangeEnd  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SecondRangeStart #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
SecondRangeEnd !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
ThirdRangeStart "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
ThirdRangeEnd  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
SegmentNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
SegmentDataFileUrl (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DateTime 
? 
DateFetched $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
UploadStatus 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
SegmentStatus  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DateTime 
? 
DateApproved %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public   
DateTime   
?   
DateComplete   %
{  & '
get  ( +
;  + ,
set  - 0
;  0 1
}  2 3
}"" 
}## �.
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignApprovedVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{		 
public

 

class

 
CampaignApprovedVM

 #
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
? 

CampaignId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
long 
ReferenceNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ReBroadCast 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
ReBroadcastDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

DeployDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 

GeoDetails  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Demographics "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Range	 
( 
$num 
, 
int 
. 
MaxValue 
, 
ErrorMessage  ,
=- .
$str/ T
)T U
]U V
public 
long 
Quantity 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
SpecialInstructions )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public   
string   
ReportSiteLink   $
{  % &
get  ' *
;  * +
set  , /
;  / 0
}  1 2
public!! 
string!! 
LinkBreakout!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
public$$ 
long$$ 
	OpenGoals$$ 
{$$ 
get$$  #
;$$# $
set$$% (
;$$( )
}$$* +
public%% 
long%% 

ClickGoals%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
public&& 
long&& 
DataFileQuantity&& $
{&&% &
get&&' *
;&&* +
set&&, /
;&&/ 0
}&&1 2
public'' 
string'' 
DataFileUrl'' !
{''" #
get''$ '
;''' (
set'') ,
;'', -
}''. /
public** 
bool** 
IsOpenPixel** 
{**  !
get**" %
;**% &
set**' *
;*** +
}**, -
public++ 
string++ 
OpenPixelUrl++ "
{++# $
get++% (
;++( )
set++* -
;++- .
}++/ 0
public,, 
bool,, 
IsOmniOrder,, 
{,,  !
get,," %
;,,% &
set,,' *
;,,* +
},,, -
public-- 
DateTime-- 
?-- 
OmniDeployDate-- '
{--( )
get--* -
;--- .
set--/ 2
;--2 3
}--4 5
public.. 
long.. 
Impressions.. 
{..  !
get.." %
;..% &
set..' *
;..* +
}.., -
public00 
bool00 
IsUseApiDataForOpen00 '
{00( )
get00* -
;00- .
set00/ 2
;002 3
}004 5
public22 
List22 
<22 
ChannelType22 
>22  
ChannelTypes22! -
{22. /
get220 3
;223 4
set225 8
;228 9
}22: ;
public44 
virtual44 
CampaignAsset44 $
Assets44% +
{44, -
get44. 1
;441 2
set443 6
;446 7
}448 9
public66 
ICollection66 
<66 
CampaignSegmentVM66 ,
>66, -
Segments66. 6
{667 8
get669 <
;66< =
set66> A
;66A B
}66C D
public88 
CampaignApprovedVM88 !
(88! "
)88" #
{99 	
Segments:: 
=:: 
new:: 
HashSet:: "
<::" #
CampaignSegmentVM::# 4
>::4 5
(::5 6
)::6 7
;::7 8
};; 	
}<< 
}== �.
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignTestingVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{		 
public

 

class

 
CampaignTestingVM

 "
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
? 

CampaignId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ReBroadCast 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
ReBroadcastDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsTested 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
? 
TestingTime $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
TestingUrgency !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

DeployDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 

GeoDetails  
{! "
get# &
;& '
set( +
;+ ,
}- .
public   
string   
Demographics   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
[!! 	
Range!!	 
(!! 
$num!! 
,!! 
int!! 
.!! 
MaxValue!! 
,!! 
ErrorMessage!!  ,
=!!- .
$str!!/ T
)!!T U
]!!U V
public"" 
long"" 
Quantity"" 
{"" 
get"" "
;""" #
set""$ '
;""' (
}"") *
public## 
string## 
SpecialInstructions## )
{##* +
get##, /
;##/ 0
set##1 4
;##4 5
}##6 7
public&& 
long&& 
	OpenGoals&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
public'' 
long'' 

ClickGoals'' 
{''  
get''! $
;''$ %
set''& )
;'') *
}''+ ,
public(( 
long(( 
DataFileQuantity(( $
{((% &
get((' *
;((* +
set((, /
;((/ 0
}((1 2
public)) 
string)) 
DataFileUrl)) !
{))" #
get))$ '
;))' (
set))) ,
;)), -
})). /
public** 
DateTime** 
?** 
DateFetched** $
{**% &
get**' *
;*** +
set**, /
;**/ 0
}**1 2
public-- 
bool-- 
IsOpenPixel-- 
{--  !
get--" %
;--% &
set--' *
;--* +
}--, -
public.. 
string.. 
OpenPixelUrl.. "
{..# $
get..% (
;..( )
set..* -
;..- .
}../ 0
public// 
bool// 
IsOmniOrder// 
{//  !
get//" %
;//% &
set//' *
;//* +
}//, -
public00 
DateTime00 
?00 
OmniDeployDate00 '
{00( )
get00* -
;00- .
set00/ 2
;002 3
}004 5
public11 
long11 
Impressions11 
{11  !
get11" %
;11% &
set11' *
;11* +
}11, -
public22 
List22 
<22 
ChannelType22 
>22  
ChannelTypes22! -
{22. /
get220 3
;223 4
set225 8
;228 9
}22: ;
public44 
virtual44 
CampaignAsset44 $
Assets44% +
{44, -
get44. 1
;441 2
set443 6
;446 7
}448 9
public66 
ICollection66 
<66 
CampaignSegmentVM66 ,
>66, -
Segments66. 6
{667 8
get669 <
;66< =
set66> A
;66A B
}66C D
public88 
CampaignTestingVM88  
(88  !
)88! "
{99 	
Segments:: 
=:: 
new:: 
HashSet:: "
<::" #
CampaignSegmentVM::# 4
>::4 5
(::5 6
)::6 7
;::7 8
};; 	
}<< 
}== �M
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignVM.cs
	namespace

 	
WFP


 
.

 
ICT

 
.

 
Web

 
.

 
Models

 
{ 
public 

class 

CampaignVM 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
public 
DateTime 
? 
BroadcastDate &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
RepresentativeName (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
RepresentativeEmail )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
ReBroadCast 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
ReBroadcastDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
long 
Price 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
TestingUrgency !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Status 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 

GeoDetails  
{! "
get# &
;& '
set( +
;+ ,
}- .
public   
string   
Demographics   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
["" 	
Range""	 
("" 
$num"" 
,"" 
int"" 
."" 
MaxValue"" 
,"" 
ErrorMessage""  ,
=""- .
$str""/ T
)""T U
]""U V
public## 
long## 
Quantity## 
{## 
get## "
;##" #
set##$ '
;##' (
}##) *
public&& 
string&& 
FromLine&& 
{&&  
get&&! $
;&&$ %
set&&& )
;&&) *
}&&+ ,
public'' 
string'' 
SubjectLine'' !
{''" #
get''$ '
;''' (
set'') ,
;'', -
}''. /
public)) 
bool)) 
IsPersonalization)) %
{))& '
get))( +
;))+ ,
set))- 0
;))0 1
}))2 3
public** 
bool** 
IsMatchback** 
{**  !
get**" %
;**% &
set**' *
;*** +
}**, -
public++ 
bool++ 
IsSuppression++ !
{++" #
get++$ '
;++' (
set++) ,
;++, -
}++. /
public,, 
string,, 

WhiteLabel,,  
{,,! "
get,,# &
;,,& '
set,,( +
;,,+ ,
},,- .
public-- 
string-- 
OptOut-- 
{-- 
get-- "
;--" #
set--$ '
;--' (
}--) *
public.. 
bool.. 
IsAddViewInBrowser.. &
{..' (
get..) ,
;.., -
set... 1
;..1 2
}..3 4
public// 
bool// 
IsAddOptOut// 
{//  !
get//" %
;//% &
set//' *
;//* +
}//, -
public00 
string00 
SpecialInstructions00 )
{00* +
get00, /
;00/ 0
set001 4
;004 5
}006 7
public11 
string11 
IP11 
{11 
get11 
;11 
set11  #
;11# $
}11% &
public22 
string22 
Browser22 
{22 
get22  #
;22# $
set22% (
;22( )
}22* +
public33 
string33 
OS33 
{33 
get33 
;33 
set33  #
;33# $
}33% &
public44 
string44 
Referrer44 
{44  
get44! $
;44$ %
set44& )
;44) *
}44+ ,
public66 
string66 
AssignedToCustomer66 (
{66) *
get66+ .
;66. /
set660 3
;663 4
}665 6
public99 
long99 
DataFileQuantity99 $
{99% &
get99' *
;99* +
set99, /
;99/ 0
}991 2
public<< 
bool<< 
IsOpenPixel<< 
{<<  !
get<<" %
;<<% &
set<<' *
;<<* +
}<<, -
public== 
string== 
OpenPixelUrl== "
{==# $
get==% (
;==( )
set==* -
;==- .
}==/ 0
public>> 
bool>> 
IsOmniOrder>> 
{>>  !
get>>" %
;>>% &
set>>' *
;>>* +
}>>, -
public?? 
DateTime?? 
??? 
OmniDeployDate?? '
{??( )
get??* -
;??- .
set??/ 2
;??2 3
}??4 5
public@@ 
long@@ 
Impressions@@ 
{@@  !
get@@" %
;@@% &
set@@' *
;@@* +
}@@, -
publicAA 
ListAA 
<AA 
ChannelTypeAA 
>AA  
ChannelTypesAA! -
{AA. /
getAA0 3
;AA3 4
setAA5 8
;AA8 9
}AA: ;
publicCC 
boolCC 
ReBroadcastedCC !
{CC" #
getCC$ '
;CC' (
setCC) ,
;CC, -
}CC. /
publicDD 
DateTimeDD 
?DD 
ReBroadcastedDateDD *
{DD+ ,
getDD- 0
;DD0 1
setDD2 5
;DD5 6
}DD7 8
publicEE 
longEE !
ReBroadcastedQuantityEE )
{EE* +
getEE, /
;EE/ 0
setEE1 4
;EE4 5
}EE6 7
publicFF 
stringFF $
ReBroadcastedOrderNumberFF .
{FF/ 0
getFF1 4
;FF4 5
setFF6 9
;FF9 :
}FF; <
publicHH 
GuidHH 
?HH 
AssetsIdHH 
{HH 
getHH  #
;HH# $
setHH% (
;HH( )
}HH* +
publicII 
virtualII 
CampaignAssetII $
AssetsII% +
{II, -
getII. 1
;II1 2
setII3 6
;II6 7
}II8 9
publicKK 
GuidKK 
?KK 
	TestingIdKK 
{KK  
getKK! $
;KK$ %
setKK& )
;KK) *
}KK+ ,
publicLL 
virtualLL 
CampaignTestingLL &
TestingLL' .
{LL/ 0
getLL1 4
;LL4 5
setLL6 9
;LL9 :
}LL; <
publicNN 
GuidNN 
?NN 

CreativeIdNN 
{NN  !
getNN" %
;NN% &
setNN' *
;NN* +
}NN, -
publicOO 
virtualOO 
CampaignCreativeOO '
CreativeOO( 0
{OO1 2
getOO3 6
;OO6 7
setOO8 ;
;OO; <
}OO= >
publicQQ 
GuidQQ 
?QQ 

ApprovedIdQQ 
{QQ  !
getQQ" %
;QQ% &
setQQ' *
;QQ* +
}QQ, -
publicRR 
virtualRR 
CampaignApprovedRR '
ApprovedRR( 0
{RR1 2
getRR3 6
;RR6 7
setRR8 ;
;RR; <
}RR= >
publicTT 
ICollectionTT 
<TT 
CampaignSegmentVMTT ,
>TT, -
SegmentsTT. 6
{TT7 8
getTT9 <
;TT< =
setTT> A
;TTA B
}TTC D
publicYY 

CampaignVMYY 
(YY 
)YY 
{ZZ 	
Segments[[ 
=[[ 
new[[ 
HashSet[[ "
<[[" #
CampaignSegmentVM[[# 4
>[[4 5
([[5 6
)[[6 7
;[[7 8
}__ 	
publicaa 
Campaignaa 

ToCampaignaa "
(aa" #
)aa# $
{bb 	
varcc 
ccc 
=cc 
newcc 
Campaigncc  
(cc  !
)cc! "
{dd 
Idee 
=ee 
Idee 
,ee 
OrderNumberff 
=ff 
OrderNumberff )
,ff) *
}gg 
;gg 
foreachhh 
(hh 
varhh 
	segmentVmhh "
inhh# %
Segmentshh& .
)hh. /
{ii 
cjj 
.jj 
Segmentsjj 
.jj 
Addjj 
(jj 

TinyMapperjj )
.jj) *
Mapjj* -
<jj- .
CampaignSegmentjj. =
>jj= >
(jj> ?
	segmentVmjj? H
)jjH I
)jjI J
;jjJ K
}kk 
returnll 
cll 
;ll 
}mm 	
}nn 
}pp �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CreativeUtility.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CreativeUtility  
{ 
public 
static 
List 
< 
SelectItemPair )
>) *

ReadEmails+ 5
(5 6
string6 <
filePath= E
)E F
{ 	
List 
< 
SelectItemPair 
>  
emails! '
=( )
new* -
List. 2
<2 3
SelectItemPair3 A
>A B
(B C
)C D
;D E
foreach 
( 
var 
line 
in  
File! %
.% &
ReadAllLines& 2
(2 3
filePath3 ;
); <
)< =
{ 
var 
trimmed 
= 
StringHelper *
.* +
Trim+ /
(/ 0
line0 4
)4 5
;5 6
if 
( 
string 
. 
IsNullOrEmpty (
(( )
trimmed) 0
)0 1
)1 2
continue3 ;
;; <
if 
( 
! 
EmailChecker  
.  !
IsValidEmail! -
(- .
trimmed. 5
)5 6
)6 7
continue8 @
;@ A
emails 
. 
Add 
( 
new 
SelectItemPair -
(- .
). /
{0 1
Selected2 :
=; <
true= A
,A B
TextC G
=H I
trimmedJ Q
,Q R
ValueS X
=Y Z
trimmed[ b
}c d
)d e
;e f
} 
return 
emails 
; 
} 	
public 
void 
Add 
( 
string 
filePath '
,' (
string) /
email0 5
)5 6
{ 	
File   
.   
AppendAllLines   
(    
filePath    (
,  ( )
new  * -
string  . 4
[  4 5
]  5 6
{  7 8
email  8 =
}  = >
)  > ?
;  ? @
}!! 	
public## 
void## 
Remove## 
(## 
string## !
filePath##" *
,##* +
string##, 2
email##3 8
)##8 9
{$$ 	
File%% 
.%% 
WriteAllLines%% 
(%% 
filePath%% '
,%%' (
File%%) -
.%%- .
ReadAllLines%%. :
(%%: ;
filePath%%; C
)%%C D
.%%D E
Where%%E J
(%%J K
x%%K L
=>%%M O
StringHelper%%P \
.%%\ ]
Trim%%] a
(%%a b
x%%b c
)%%c d
!=%%e g
email%%h m
)%%m n
)%%n o
;%%o p
}&& 	
}'' 
}(( �
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CreativeVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 

CreativeVM 
{ 
public		 
string		 
Id		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
string

 

CampaignId

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
TestSeedFile "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
LiveSeedFile "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
	AllowHtml	 
] 
public 
string 
	Creatives 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List 
< 
SelectItemPair "
>" #

TestEmails$ .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
List 
< 
SelectItemPair "
>" #

LiveEmails$ .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
QuickTestEmails %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
MailChimpList #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
MailChimpCampaign '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} �
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignReportVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CampaignReportVM !
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
CampaignName		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 

WhiteLabel

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Opened 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Clicked 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
IONumber 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	OrderDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	StartDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

EmailsSent  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
OpenedPercentage &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ClickedPercentage '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
CTRPercentage #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Desktop 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Mobile 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
BroadcastDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public   
List   
<   "
CampaignReportDetailVM   *
>  * +
PerLink  , 3
{  4 5
get  6 9
;  9 :
set  ; >
;  > ?
}  @ A
}!! 
}"" �
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\HtmlProcessResult.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
HtmlProcessResult "
{ 
public 
string 
filePathLive "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
UploadFileStatus 
Status  &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
}		 
}

 �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\ProDataRequest.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
ProData 
{ 
public 

class 
ProDataRequest 
{ 
public 
string 
io 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
campaign_name #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
is_rebroadcast $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
white_label !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
string		 
creative_url		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
long

 
quantity

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
geo_type 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
geo_url 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
ctr_percent !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
subject 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	from_name 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

from_email  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
deploy_date !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
is_open_pixel #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
double 
open_percent "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

open_pixel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
is_data_file "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
data_file_url #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string '
data_file_replacement_param 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
string (
data_file_replacement_column 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
string 
data_file_unique_ip )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} �
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\ProDataResponse.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
ProData 
{ 
public 

class 
ProDataResponse  
{ 
public 
string 
status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Reports 
reports 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
	timestamp		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
message

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
List 
< 
string 
> 
error_fields (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
long &
queued_pending_campaign_id .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
ResponseStatus $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
ResponseMessage %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
public 

class 
Reports 
{ 
public 
Report 
[ 
] 
report 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
public 

class 
Report 
{ 
public 
string 
IO 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Reportsite_URL $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
Destination_URL %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
CampaignStartDate '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 

ClickCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
long 
	UniqueCnt 
{ 
get  #
;# $
set% (
;( )
}* +
public   
long   
	MobileCnt   
{   
get    #
;  # $
set  % (
;  ( )
}  * +
public!! 
long!! 
ImpressionCnt!! !
{!!" #
get!!$ '
;!!' (
set!!) ,
;!!, -
}!!. /
}"" 
}$$ �
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CompanyPermissionVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CompanyPermissionVM $
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 

ClaimValue		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
string

 
	ClaimType

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 

RolesCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 

IsEditable 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
IsDeletable 
{  !
get" %
;% &
set' *
;* +
}, -
public 
IEnumerable 
< 
SelectListItem )
>) *

ClaimTypes+ 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CompanyRoleVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CompanyRoleVM 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
bool 

IsEditable 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
IsDeletable 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
InUsers 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Action 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
PermissionId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
List 
< 
SelectItemPair "
>" #
Permissions$ /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} �
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignSearchVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CampaignSearchVM !
{ 
public 
string 
	sortOrder 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
page 
{ 
get 
; 
set  #
;# $
}% &
public 
string 

searchType  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
basicString		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
string

 
basicOrderNumber

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
string 
basicStatus !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
advancedStatus $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
advancedUser "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
campaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
isTested 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
orderedFrom !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	orderedTo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
broadcastFrom #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
broadcastTo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
clearSessionId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �R
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\OfficeUserVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class .
"ExternalLoginConfirmationViewModel 3
{ 
[ 	
Required	 
] 
[		 	
Display			 
(		 
Name		 
=		 
$str		 
)		  
]		  !
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
} 
public 

class &
ExternalLoginListViewModel +
{ 
public 
string 
	ReturnUrl 
{  !
get" %
;% &
set' *
;* +
}, -
} 
public 

class 
SendCodeViewModel "
{ 
public 
string 
SelectedProvider &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICollection 
< 
System !
.! "
Web" %
.% &
Mvc& )
.) *
SelectListItem* 8
>8 9
	Providers: C
{D E
getF I
;I J
setK N
;N O
}P Q
public 
string 
	ReturnUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 

RememberMe 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
public 

class 
VerifyCodeViewModel $
{ 
[ 	
Required	 
] 
public 
string 
Provider 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[   	
Display  	 
(   
Name   
=   
$str   
)   
]    
public!! 
string!! 
Code!! 
{!! 
get!!  
;!!  !
set!!" %
;!!% &
}!!' (
public"" 
string"" 
	ReturnUrl"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
[$$ 	
Display$$	 
($$ 
Name$$ 
=$$ 
$str$$ 0
)$$0 1
]$$1 2
public%% 
bool%% 
RememberBrowser%% #
{%%$ %
get%%& )
;%%) *
set%%+ .
;%%. /
}%%0 1
public'' 
bool'' 

RememberMe'' 
{''  
get''! $
;''$ %
set''& )
;'') *
}''+ ,
}(( 
public** 

class** 
ForgotViewModel**  
{++ 
[,, 	
Required,,	 
],, 
[-- 	
Display--	 
(-- 
Name-- 
=-- 
$str-- 
)--  
]--  !
public.. 
string.. 
Email.. 
{.. 
get.. !
;..! "
set..# &
;..& '
}..( )
}// 
public11 

class11 
LoginViewModel11 
{22 
[33 	
Required33	 
(33 
ErrorMessage33 
=33  
$str33! 8
)338 9
]339 :
[44 	
Display44	 
(44 
Name44 
=44 
$str44 "
)44" #
]44# $
public66 
string66 
Username66 
{66  
get66! $
;66$ %
set66& )
;66) *
}66+ ,
[88 	
Required88	 
(88 
ErrorMessage88 
=88  
$str88  7
)887 8
]888 9
[99 	
DataType99	 
(99 
DataType99 
.99 
Password99 #
)99# $
]99$ %
[:: 	
Display::	 
(:: 
Name:: 
=:: 
$str:: "
)::" #
]::# $
public;; 
string;; 
Password;; 
{;;  
get;;! $
;;;$ %
set;;& )
;;;) *
};;+ ,
[== 	
Display==	 
(== 
Name== 
=== 
$str== &
)==& '
]==' (
public>> 
bool>> 

RememberMe>> 
{>>  
get>>! $
;>>$ %
set>>& )
;>>) *
}>>+ ,
}?? 
publicAA 

classAA 
RegisterViewModelAA "
{BB 
[CC 	
RequiredCC	 
]CC 
[DD 	
DisplayDD	 
(DD 
NameDD 
=DD 
$strDD #
)DD# $
]DD$ %
publicEE 
stringEE 
UserNameEE 
{EE  
getEE! $
;EE$ %
setEE& )
;EE) *
}EE+ ,
[GG 	
RequiredGG	 
]GG 
[HH 	
DisplayHH	 
(HH 
NameHH 
=HH 
$strHH '
)HH' (
]HH( )
publicII 
boolII 
IsAdminUserII 
{II  !
getII" %
;II% &
setII' *
;II* +
}II, -
[KK 	
RequiredKK	 
]KK 
[LL 	
DisplayLL	 
(LL 
NameLL 
=LL 
$strLL %
)LL% &
]LL& '
publicMM 
boolMM 
	IsUsesAPIMM 
{MM 
getMM  #
;MM# $
setMM% (
;MM( )
}MM* +
[OO 	
RequiredOO	 
]OO 
[PP 	
DisplayPP	 
(PP 
NamePP 
=PP 
$strPP 2
)PP2 3
]PP3 4
publicQQ 
boolQQ 
IsTestsCreativesQQ $
{QQ% &
getQQ' *
;QQ* +
setQQ, /
;QQ/ 0
}QQ1 2
[SS 	
RequiredSS	 
]SS 
[TT 	
EmailAddressTT	 
]TT 
[UU 	
DisplayUU	 
(UU 
NameUU 
=UU 
$strUU 
)UU  
]UU  !
publicVV 
stringVV 
EmailVV 
{VV 
getVV !
;VV! "
setVV# &
;VV& '
}VV( )
[XX 	
RequiredXX	 
]XX 
[YY 	
StringLengthYY	 
(YY 
$numYY 
,YY 
ErrorMessageYY '
=YY( )
$strYY* Y
,YYY Z
MinimumLengthYY[ h
=YYi j
$numYYk l
)YYl m
]YYm n
[ZZ 	
DataTypeZZ	 
(ZZ 
DataTypeZZ 
.ZZ 
PasswordZZ #
)ZZ# $
]ZZ$ %
[[[ 	
Display[[	 
([[ 
Name[[ 
=[[ 
$str[[ "
)[[" #
][[# $
public\\ 
string\\ 
Password\\ 
{\\  
get\\! $
;\\$ %
set\\& )
;\\) *
}\\+ ,
[^^ 	
DataType^^	 
(^^ 
DataType^^ 
.^^ 
Password^^ #
)^^# $
]^^$ %
[__ 	
Display__	 
(__ 
Name__ 
=__ 
$str__ *
)__* +
]__+ ,
[`` 	
Compare``	 
(`` 
$str`` 
,`` 
ErrorMessage`` )
=``* +
$str``, b
)``b c
]``c d
publicaa 
stringaa 
ConfirmPasswordaa %
{aa& '
getaa( +
;aa+ ,
setaa- 0
;aa0 1
}aa2 3
}bb 
publicdd 

classdd "
ResetPasswordViewModeldd '
{ee 
[ff 	
Requiredff	 
]ff 
[gg 	
EmailAddressgg	 
]gg 
[hh 	
Displayhh	 
(hh 
Namehh 
=hh 
$strhh 
)hh  
]hh  !
publicii 
stringii 
Emailii 
{ii 
getii !
;ii! "
setii# &
;ii& '
}ii( )
[kk 	
Requiredkk	 
]kk 
[ll 	
StringLengthll	 
(ll 
$numll 
,ll 
ErrorMessagell '
=ll( )
$strll* Y
,llY Z
MinimumLengthll[ h
=lli j
$numllk l
)lll m
]llm n
[mm 	
DataTypemm	 
(mm 
DataTypemm 
.mm 
Passwordmm #
)mm# $
]mm$ %
[nn 	
Displaynn	 
(nn 
Namenn 
=nn 
$strnn "
)nn" #
]nn# $
publicoo 
stringoo 
Passwordoo 
{oo  
getoo! $
;oo$ %
setoo& )
;oo) *
}oo+ ,
[qq 	
DataTypeqq	 
(qq 
DataTypeqq 
.qq 
Passwordqq #
)qq# $
]qq$ %
[rr 	
Displayrr	 
(rr 
Namerr 
=rr 
$strrr *
)rr* +
]rr+ ,
[ss 	
Comparess	 
(ss 
$strss 
,ss 
ErrorMessagess )
=ss* +
$strss, b
)ssb c
]ssc d
publictt 
stringtt 
ConfirmPasswordtt %
{tt& '
gettt( +
;tt+ ,
settt- 0
;tt0 1
}tt2 3
publicvv 
stringvv 
Codevv 
{vv 
getvv  
;vv  !
setvv" %
;vv% &
}vv' (
}ww 
publicyy 

classyy #
ForgotPasswordViewModelyy (
{zz 
[{{ 	
Required{{	 
]{{ 
[|| 	
EmailAddress||	 
]|| 
[}} 	
Display}}	 
(}} 
Name}} 
=}} 
$str}} 
)}}  
]}}  !
public~~ 
string~~ 
Email~~ 
{~~ 
get~~ !
;~~! "
set~~# &
;~~& '
}~~( )
} 
}�� �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CompanyUsersVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
CompanyUsersVM 
{ 
public		 
Guid		 
ID		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Action 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
OfficeID 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UnitID 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 

OfficeName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
UnitName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
SelectItemPair "
>" #
Roles$ )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
IsLocalUser 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} �
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\JsonResponse.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
JsonResponse 
{ 
public 
bool 
IsSucess 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ErrorMessage "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
object 
Result 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}		 �8
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\ManageViewModels.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
IndexViewModel 
{		 
public

 
bool

 
HasPassword

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
IList 
< 
UserLoginInfo "
>" #
Logins$ *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
	TwoFactor 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
BrowserRemembered %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
public 

class !
ManageLoginsViewModel &
{ 
public 
IList 
< 
UserLoginInfo "
>" #
CurrentLogins$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
IList 
< %
AuthenticationDescription .
>. /
OtherLogins0 ;
{< =
get> A
;A B
setC F
;F G
}H I
} 
public 

class 
FactorViewModel  
{ 
public 
string 
Purpose 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

class  
SetPasswordViewModel %
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* Y
,Y Z
MinimumLength[ h
=i j
$numk l
)l m
]m n
[   	
DataType  	 
(   
DataType   
.   
Password   #
)  # $
]  $ %
[!! 	
Display!!	 
(!! 
Name!! 
=!! 
$str!! &
)!!& '
]!!' (
public"" 
string"" 
NewPassword"" !
{""" #
get""$ '
;""' (
set"") ,
;"", -
}"". /
[$$ 	
DataType$$	 
($$ 
DataType$$ 
.$$ 
Password$$ #
)$$# $
]$$$ %
[%% 	
Display%%	 
(%% 
Name%% 
=%% 
$str%% .
)%%. /
]%%/ 0
[&& 	
Compare&&	 
(&& 
$str&& 
,&& 
ErrorMessage&&  ,
=&&- .
$str&&/ i
)&&i j
]&&j k
public'' 
string'' 
ConfirmPassword'' %
{''& '
get''( +
;''+ ,
set''- 0
;''0 1
}''2 3
}(( 
public** 

class** #
ChangePasswordViewModel** (
{++ 
[,, 	
Required,,	 
],, 
[-- 	
DataType--	 
(-- 
DataType-- 
.-- 
Password-- #
)--# $
]--$ %
[.. 	
Display..	 
(.. 
Name.. 
=.. 
$str.. *
)..* +
]..+ ,
public// 
string// 
OldPassword// !
{//" #
get//$ '
;//' (
set//) ,
;//, -
}//. /
[11 	
Required11	 
]11 
[22 	
StringLength22	 
(22 
$num22 
,22 
ErrorMessage22 '
=22( )
$str22* Y
,22Y Z
MinimumLength22[ h
=22i j
$num22k l
)22l m
]22m n
[33 	
DataType33	 
(33 
DataType33 
.33 
Password33 #
)33# $
]33$ %
[44 	
Display44	 
(44 
Name44 
=44 
$str44 &
)44& '
]44' (
public55 
string55 
NewPassword55 !
{55" #
get55$ '
;55' (
set55) ,
;55, -
}55. /
[77 	
DataType77	 
(77 
DataType77 
.77 
Password77 #
)77# $
]77$ %
[88 	
Display88	 
(88 
Name88 
=88 
$str88 .
)88. /
]88/ 0
[99 	
Compare99	 
(99 
$str99 
,99 
ErrorMessage99  ,
=99- .
$str99/ i
)99i j
]99j k
public:: 
string:: 
ConfirmPassword:: %
{::& '
get::( +
;::+ ,
set::- 0
;::0 1
}::2 3
};; 
public== 

class== #
AddPhoneNumberViewModel== (
{>> 
[?? 	
Required??	 
]?? 
[@@ 	
Phone@@	 
]@@ 
[AA 	
DisplayAA	 
(AA 
NameAA 
=AA 
$strAA &
)AA& '
]AA' (
publicBB 
stringBB 
NumberBB 
{BB 
getBB "
;BB" #
setBB$ '
;BB' (
}BB) *
}CC 
publicEE 

classEE &
VerifyPhoneNumberViewModelEE +
{FF 
[GG 	
RequiredGG	 
]GG 
[HH 	
DisplayHH	 
(HH 
NameHH 
=HH 
$strHH 
)HH 
]HH  
publicII 
stringII 
CodeII 
{II 
getII  
;II  !
setII" %
;II% &
}II' (
[KK 	
RequiredKK	 
]KK 
[LL 	
PhoneLL	 
]LL 
[MM 	
DisplayMM	 
(MM 
NameMM 
=MM 
$strMM &
)MM& '
]MM' (
publicNN 
stringNN 
PhoneNumberNN !
{NN" #
getNN$ '
;NN' (
setNN) ,
;NN, -
}NN. /
}OO 
publicQQ 

classQQ '
ConfigureTwoFactorViewModelQQ ,
{RR 
publicSS 
stringSS 
SelectedProviderSS &
{SS' (
getSS) ,
;SS, -
setSS. 1
;SS1 2
}SS3 4
publicTT 
ICollectionTT 
<TT 
SystemTT !
.TT! "
WebTT" %
.TT% &
MvcTT& )
.TT) *
SelectListItemTT* 8
>TT8 9
	ProvidersTT: C
{TTD E
getTTF I
;TTI J
setTTK N
;TTN O
}TTP Q
}UU 
}VV �
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\SystemLogVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public		 

class		 
SystemLogVM		 
{

 
public 
string 
	CreatedAt 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LogType 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
SystemLogVM 
( 
) 
{ 	
} 	
} 
} �
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\UploadFileVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public		 

class		 
UploadFileVM		 
{

 
public 
string 
FileType 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
SegmentNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsValid 
( 
string "
filePath# +
)+ ,
{ 	
bool 
isValid 
= 
true 
;  
switch 
( 
FileType 
) 
{ 
case 
$str )
:) *
foreach 
( 
var  
line! %
in& (
File) -
.- .
ReadAllLines. :
(: ;
filePath; C
)C D
)D E
{ 
if 
( 
line  
.  !
Trim! %
(% &
)& '
.' (
Length( .
!=/ 1
$num2 3
)3 4
{ 
isValid #
=$ %
false& +
;+ ,
break !
;! "
} 
} 
break 
; 
} 
return 
isValid 
; 
}   	
}"" 
}## �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\UserProfileVM.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
UserProfileVM 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
CCEmails

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Status 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Type 
{ 
get 
; 
set "
;" #
}$ %
public 
string 
DateCreated !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
	IsUsesAPI 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
APIKey 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
IsTestsCreatives $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
CompanyLogo !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} �
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str &
)& '
]' (
[ 
assembly 	
:	 

AssemblyDescription 
( 
$str !
)! "
]" #
[		 
assembly		 	
:			 
!
AssemblyConfiguration		  
(		  !
$str		! #
)		# $
]		$ %
[

 
assembly

 	
:

	 

AssemblyCompany

 
(

 
$str

 
)

 
]

 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str (
)( )
]) *
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
[!! 
assembly!! 	
:!!	 

AssemblyVersion!! 
(!! 
$str!! $
)!!$ %
]!!% &
["" 
assembly"" 	
:""	 

AssemblyFileVersion"" 
("" 
$str"" (
)""( )
]"") *�
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Reports\ReportModel.cs
	namespace 	
WFP
 
. 
ICT 
. 
Web 
. 
Reports 
{ 
public 

sealed 
class 
ReportModel #
{ 
public 
DataSet 
DataSet 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 

Dictionary		 
<		 
string		  
,		  !
object		" (
>		( )

Parameters		* 4
{		5 6
get		7 :
;		: ;
set		< ?
;		? @
}		A B
public 
ReportModel 
( 
) 
{ 	

Parameters 
= 
new 

Dictionary '
<' (
string( .
,. /
object0 6
>6 7
(7 8
)8 9
;9 :
} 	
} 
} �
4E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Startup.cs
[ 
assembly 	
:	 

OwinStartup 
( 
typeof 
( 
WFP !
.! "
ICT" %
.% &
Web& )
.) *
Startup* 1
)1 2
)2 3
]3 4
	namespace 	
WFP
 
. 
ICT 
. 
Web 
{ 
public 

partial 
class 
Startup  
{ 
public 
void 
Configuration !
(! "
IAppBuilder" -
app. 1
)1 2
{ 	
CultureInfo 
. '
DefaultThreadCurrentCulture 3
=4 5
CultureInfo6 A
.A B
GetCultureInfoB P
(P Q
$strQ X
)X Y
;Y Z
CultureInfo 
. )
DefaultThreadCurrentUICulture 5
=6 7
CultureInfo8 C
.C D
GetCultureInfoD R
(R S
$strS Z
)Z [
;[ \
ConfigureAuth 
( 
app 
) 
;  
SetupInitialSettings  
(  !
)! "
;" #
GlobalConfiguration 
.  
Configuration  -
.- .
UseSqlServerStorage. A
(A B
$strB Q
)Q R
;R S
app 
.  
UseHangfireDashboard $
($ %
$str% 0
,0 1
new2 5
DashboardOptions6 F
{ 
Authorization 
= 
new  #
[# $
]$ %
{& '
new( +'
HangfireAuthorizationFilter, G
(G H
)H I
}J K
}   
)   
;   
app!! 
.!! 
UseHangfireServer!! !
(!!! "
)!!" #
;!!# $
app## 
.## 

MapSignalR## 
(## 
)## 
;## 
WFPICTUpdater%% 
.%% 
Instance%% "
.%%" # 
StartUpdatingClients%%# 7
(%%7 8
)%%8 9
;%%9 :
}-- 	
private// 
void//  
SetupInitialSettings// )
(//) *
)//* +
{00 	
using11 
(11 
WfpictContext11  
ctx11! $
=11% &
new11' *
WfpictContext11+ 8
(118 9
)119 :
)11: ;
{22 
var33 
UserManager33 
=33  !
new33" %
UserManager33& 1
<331 2
Data332 6
.336 7
Entities337 ?
.33? @
WfpUser33@ G
>33G H
(33H I
new33I L
	UserStore33M V
<33V W
Data33W [
.33[ \
Entities33\ d
.33d e
WfpUser33e l
>33l m
(33m n
ctx33n q
)33q r
)33r s
;33s t
var44 
alreadyAdminUser44 $
=44% &
UserManager44' 2
.442 3

FindByName443 =
(44= >
$str44> E
)44E F
;44F G
}55 
}66 	
}77 
}88 