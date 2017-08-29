�
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Hangfire\HangfireBootstrapper .cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Hangfire 
{ 
public 

class  
HangfireBootstrapper %
:& '
IRegisteredObject( 9
{ 
public 
static 
readonly  
HangfireBootstrapper 3
Instance4 <
== >
new? B 
HangfireBootstrapperC W
(W X
)X Y
;Y Z
private

 
readonly

 
object

 
_lockObject

  +
=

, -
new

. 1
object

2 8
(

8 9
)

9 :
;

: ;
private 
bool 
_started 
; 
private
BackgroundJobServer
_backgroundJobServer
;
private  
HangfireBootstrapper $
($ %
)% &
{ 	
} 	
public 
void 
Start 
( 
) 
{ 	
lock 
( 
_lockObject 
) 
{ 
if 
( 
_started 
) 
return $
;$ %
_started 
= 
true 
;  
HostingEnvironment "
." #
RegisterObject# 1
(1 2
this2 6
)6 7
;7 8
GlobalConfiguration #
.# $

.1 2
UseSqlServerStorage2 E
(E F
$strF U
)U V
;V W 
_backgroundJobServer $
=% &
new' *
BackgroundJobServer+ >
(> ?
)? @
;@ A
}   
}!! 	
public## 
void## 
Stop## 
(## 
)## 
{$$ 	
lock%% 
(%% 
_lockObject%% 
)%% 
{&& 
_backgroundJobServer'' $
?''$ %
.''% &
Dispose''& -
(''- .
)''. /
;''/ 0
HostingEnvironment)) "
.))" #
UnregisterObject))# 3
())3 4
this))4 8
)))8 9
;))9 :
}** 
}++ 	
void-- 
IRegisteredObject--
.-- 
Stop-- #
(--# $
bool--$ (
	immediate--) 2
)--2 3
{.. 	
Stop// 
(// 
)// 
;// 
}00 	
}11 
}22 �
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Hangfire\ApplicationPreload.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Hangfire 
{ 
public 

class 
ApplicationPreload #
:$ %
System& ,
., -
Web- 0
.0 1
Hosting1 8
.8 9%
IProcessHostPreloadClient9 R
{ 
public 
void 
Preload 
( 
string "
[" #
]# $

parameters% /
)/ 0
{ 	 
HangfireBootstrapper  
.  !
Instance! )
.) *
Start* /
(/ 0
)0 1
;1 2
} 	
}		 
}

 �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\BundleConfig.cs
	namespace 	
WFP
 
.
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
)II 
)II
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
)NN 
)NN
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
 
.
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
 
.
ICT 
. 
Web 
{ 
public

class
EmailService
:
IIdentityMessageService
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

>((e f
(((f g
)((g h
)((h i
)((i j
;((j k
manager** 
.** 

=**" #
new**$ '

<**5 6
WfpUser**6 =
>**= >
(**> ?
manager**? F
)**F G
{++ 
AllowOnlyAlphanumericUserNames,, .
=,,/ 0
false,,1 6
,,,6 7
RequireUniqueEmail-- "
=--# $
true--% )
}.. 
;..
manager11 
.11 
PasswordValidator11 %
=11& '
new11( +
PasswordValidator11, =
{22 
}88 
;88
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
{BB 

=CC 
$strCC  ;
}DD 
)DD
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
{FF 
SubjectGG 
=GG 
$strGG )
,GG) *

BodyFormatHH 
=HH 
$strHH 8
}II 
)II
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
{NN 
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
}QQ 
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
{dd 
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
}ii 
)ii
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
:rr 
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
 
.
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
routes
.
MapRoute
(
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
) 
;
} 	
} 
} �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\Startup.Auth.cs
	namespace		 	
WFP		
 
.		
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

(! "
IAppBuilder" -
app. 1
)1 2
{ 	
app 
.  
CreatePerOwinContext $
($ %

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
{ 
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
}%% 
)%%
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
 
.
ICT 
. 
Web 
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
private
static
Lazy
<
IUnityContainer
>
	container
=
new
Lazy
<
IUnityContainer
>
(
(
)
=>
{ 	
var 
	container 
= 
new 
UnityContainer  .
(. /
)/ 0
;0 1

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
}.. �
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\UnityMvcActivator.cs
[ 
assembly 	
:	 

WebActivatorEx 
. %
PreApplicationStartMethod 3
(3 4
typeof4 :
(: ;
UnityWebActivator; L
)L M
,M N
$strO V
)V W
]W X
[ 
assembly 	
:	 

WebActivatorEx 
. %
ApplicationShutdownMethod 3
(3 4
typeof4 :
(: ;
UnityWebActivator; L
)L M
,M N
$strO Y
)Y Z
]Z [
	namespace		 	
WFP		
 
.		
ICT		 
.		 
Web		 
{

 
public 

static 
class 
UnityWebActivator )
{
public 
static 
void 
Start  
(  !
)! "
{ 	
var 
	container 
= 
UnityConfig '
.' ("
GetConfiguredContainer( >
(> ?
)? @
;@ A
FilterProviders 
. 
	Providers %
.% &
Remove& ,
(, -
FilterProviders- <
.< =
	Providers= F
.F G
OfTypeG M
<M N)
FilterAttributeFilterProviderN k
>k l
(l m
)m n
.n o
Firsto t
(t u
)u v
)v w
;w x
FilterProviders 
. 
	Providers %
.% &
Add& )
() *
new* -.
"UnityFilterAttributeFilterProvider. P
(P Q
	containerQ Z
)Z [
)[ \
;\ ]
DependencyResolver 
. 
SetResolver *
(* +
new+ .#
UnityDependencyResolver/ F
(F G
	containerG P
)P Q
)Q R
;R S
} 	
public 
static 
void 
Shutdown #
(# $
)$ %
{ 	
var 
	container 
= 
UnityConfig '
.' ("
GetConfiguredContainer( >
(> ?
)? @
;@ A
	container   
.   
Dispose   
(   
)   
;    
}!! 	
}"" 
}## �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\App_Start\WebApiConfig.cs
	namespace 	
WFP
 
.
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
) 
;
var 

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
} �]
JE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CompanyController.cs
	namespace
WFP
 
.
ICT
.
Web
.
Controllers
{ 
public 

class 
CompanyController "
:# $
BaseController% 3
{ 
private 
const 
int 
PageSize "
=# $
$num% '
;' (
private "
ApplicationUserManager &
_userManager' 3
;3 4
private "
ApplicationUserManager &
UserManager' 2
{ 	
get 
{ 
return 
_userManager #
??$ &
HttpContext' 2
.2 3
GetOwinContext3 A
(A B
)B C
.C D
GetUserManagerD R
<R S"
ApplicationUserManagerS i
>i j
(j k
)k l
;l m
} 
} 	
public 
ActionResult 
Users !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
var 
model 
= 
UserManager #
.# $
Users$ )
.) *
Select* 0
(0 1
x1 2
=>3 5
new   

(   
)   
{!! 
Id"" 
="" 
x"" 
."" 
Id"" 
,"" 
UserName## 
=## 
x## 
.## 
UserName## %
,##% &
Email$$ 
=$$ 
x$$ 
.$$ 
Email$$ 
,$$  
DateCreated%% 
=%% 
x%% 
.%%  
	CreatedAt%%  )
.%%) *
ToString%%* 2
(%%2 3
)%%3 4
,%%4 5
Status&& 
=&& 
x&& 
.&& 
Status&& !
,&&! "
Type'' 
='' 
x'' 
.'' 
UserType'' !
,''! "
	FirstName(( 
=(( 
x(( 
.(( 
	FirstName(( '
,((' (
LastName)) 
=)) 
x)) 
.)) 
LastName)) %
,))% &
CompanyName** 
=** 
x** 
.**  
CompanyName**  +
,**+ ,
CompanyLogo++ 
=++ 
x++ 
.++  
CompanyLogo++  +
,+++ ,

WhiteLabel,, 
=,, 
x,, 
.,, 

WhiteLabel,, )
,,,) *
ReportTemplate-- 
=--  
x--! "
.--" #
ReportTemplate--# 1
,--1 2
IsTestsCreatives..  
=..! "
x..# $
...$ %
IsTestsCreatives..% 5
,..5 6
	IsUsesApi// 
=// 
x// 
.// 
	IsUsesApi// '
}00 
)00
.00 
ToList00 
(00 
)00 
;00 
int22 

pageNumber22 
=22 
(22 
sc22  
.22  !
page22! %
??22& (
$num22) *
)22* +
;22+ ,
var33 
Model33 
=33 
model33 
.33 
ToPagedList33 )
(33) *

pageNumber33* 4
,334 5
PageSize336 >
)33> ?
;33? @
ViewBag44 
.44 

WhiteLabel44 
=44  

;44. /
return55 
View55 
(55 
$str55 
,55  
Model55! &
)55& '
;55' (
}66 	
public88 
ActionResult88 
ChangeWhiteLabel88 ,
(88, -
Guid88- 1
?881 2
userId883 9
,889 :
string88; A

whiteLabel88B L
)88L M
{99 	
try:: 
{;; 
var<< 
user<< 
=<< 
UserManager<< &
.<<& '
FindById<<' /
(<</ 0
userId<<0 6
.<<6 7
ToString<<7 ?
(<<? @
)<<@ A
)<<A B
;<<B C
user== 
.== 

WhiteLabel== 
===  !

whiteLabel==" ,
;==, -
Db>> 
.>> 
SaveChanges>> 
(>> 
)>>  
;>>  !
return?? 
Json?? 
(?? 
new?? 
JsonResponse??  ,
(??, -
)??- .
{??/ 0
IsSucess??1 9
=??: ;
true??< @
}??A B
,??B C
JsonRequestBehavior??D W
.??W X
AllowGet??X `
)??` a
;??a b
}@@ 
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA  
{BB 
returnCC 
JsonCC 
(CC 
newCC 
JsonResponseCC  ,
(CC, -
)CC- .
{CC/ 0
IsSucessCC1 9
=CC: ;
falseCC< A
,CCA B
ErrorMessageCCC O
=CCP Q
exCCR T
.CCT U
MessageCCU \
}CC] ^
,CC^ _
JsonRequestBehaviorCC` s
.CCs t
AllowGetCCt |
)CC| }
;CC} ~
}DD 
}EE 	
publicFF 
ActionResultFF 
SaveUserFF $
(FF$ %
CompanyUsersVMFF% 3
modelFF4 9
)FF9 :
{GG 	
tryHH 
{II 
varJJ 
userJJ 
=JJ 
UserManagerJJ &
.JJ& '
FindByIdJJ' /
(JJ/ 0
modelJJ0 5
.JJ5 6
IDJJ6 8
.JJ8 9
ToStringJJ9 A
(JJA B
)JJB C
)JJC D
;JJD E
switchKK 
(KK 
modelKK 
.KK 
ActionKK $
)KK$ %
{LL 
caseMM 
$strMM 
:MM  
ifNN 
(NN 
userNN  
.NN  !
StatusNN! '
==NN( *
(NN+ ,
intNN, /
)NN/ 0

UserStatusNN0 :
.NN: ;
ActiveNN; A
)NNA B
{OO 
userPP  
.PP  !
StatusPP! '
=PP( )
(PP* +
intPP+ .
)PP. /

UserStatusPP/ 9
.PP9 :
LockedPP: @
;PP@ A
userQQ  
.QQ  !
LockoutEndDateUtcQQ! 2
=QQ3 4
newQQ5 8
DateTimeQQ9 A
(QQA B
$numQQB F
,QQF G
$numQQH J
,QQJ K
$numQQL N
)QQN O
;QQO P
boolRR  
aRR! "
=RR# $
UserManagerRR% 0
.RR0 1
IsLockedOutRR1 <
(RR< =
userRR= A
.RRA B
IdRRB D
)RRD E
;RRE F
}SS 
elseTT 
ifTT 
(TT  !
userTT! %
.TT% &
StatusTT& ,
==TT- /
(TT0 1
intTT1 4
)TT4 5

UserStatusTT5 ?
.TT? @
LockedTT@ F
)TTF G
{UU 
userVV  
.VV  !
StatusVV! '
=VV( )
(VV* +
intVV+ .
)VV. /

UserStatusVV/ 9
.VV9 :
ActiveVV: @
;VV@ A
userWW  
.WW  !
LockoutEndDateUtcWW! 2
=WW3 4
nullWW5 9
;WW9 :
boolXX  
aXX! "
=XX# $
UserManagerXX% 0
.XX0 1
IsLockedOutXX1 <
(XX< =
userXX= A
.XXA B
IdXXB D
)XXD E
;XXE F
}YY 
breakZZ 
;ZZ 
case[[ 
$str[[ 
:[[  
if\\ 
(\\ 
user\\  
.\\  !
UserType\\! )
==\\* ,
(\\- .
int\\. 1
)\\1 2
UserType\\2 :
.\\: ;
Admin\\; @
)\\@ A
{]] 
user^^  
.^^  !
UserType^^! )
=^^* +
(^^, -
int^^- 0
)^^0 1
UserType^^1 9
.^^9 :
User^^: >
;^^> ?
}__ 
else`` 
if`` 
(``  !
user``! %
.``% &
UserType``& .
==``/ 1
(``2 3
int``3 6
)``6 7
UserType``7 ?
.``? @
User``@ D
)``D E
{aa 
userbb  
.bb  !
UserTypebb! )
=bb* +
(bb, -
intbb- 0
)bb0 1
UserTypebb1 9
.bb9 :
Adminbb: ?
;bb? @
}cc 
breakdd 
;dd 
caseee 
$stree  
:ee  !
ifff 
(ff 
userff  
.ff  !
IsTestsCreativesff! 1
)ff1 2
{gg 
userhh  
.hh  !
IsTestsCreativeshh! 1
=hh2 3
falsehh4 9
;hh9 :
}ii 
elsejj 
{kk 
userll  
.ll  !
IsTestsCreativesll! 1
=ll2 3
truell4 8
;ll8 9
}mm 
breaknn 
;nn 
caseoo 
$stroo #
:oo# $
ifpp 
(pp 
!pp 
stringpp #
.pp# $

(pp1 2
modelpp2 7
.pp7 8
Passwordpp8 @
)pp@ A
)ppA B
{qq 
stringrr "

resetTokenrr# -
=rr. /
UserManagerrr0 ;
.rr; <&
GeneratePasswordResetTokenrr< V
(rrV W
userrrW [
.rr[ \
Idrr\ ^
)rr^ _
;rr_ `
IdentityResultss * 
passwordChangeResultss+ ?
=ss@ A
UserManagerssB M
.ssM N

(ss[ \
userss\ `
.ss` a
Idssa c
,ssc d

resetTokensse o
,sso p
modelssq v
.ssv w
Passwordssw 
)	ss �
;
ss� �
iftt 
(tt   
passwordChangeResulttt  4
!=tt5 7
IdentityResulttt8 F
.ttF G
SuccessttG N
)ttN O
{uu 
throwvv  %
newvv& )
AdsExceptionvv* 6
(vv6 7 
passwordChangeResultvv7 K
.vvK L
ErrorsvvL R
.vvR S
FirstOrDefaultvvS a
(vva b
)vvb c
)vvc d
;vvd e
}ww 
}xx 
breakyy 
;yy 
casezz 
$strzz !
:zz! "
UserManager{{ #
.{{# $
Delete{{$ *
({{* +
user{{+ /
){{/ 0
;{{0 1
break|| 
;|| 
}}} 
Db~~ 
.~~ 
SaveChanges~~ 
(~~ 
)~~  
;~~  !
return 
Json 
( 
new 
JsonResponse  ,
(, -
)- .
{/ 0
IsSucess1 9
=: ;
true< @
}A B
,B C
JsonRequestBehaviorD W
.W X
AllowGetX `
)` a
;a b
}
�� 
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
�� 
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
�� 
}
�� 	
}
�� 
}�� �
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\TestController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{		 
public

 

class

 
TestController

 
:

  !
BaseController

" 0
{ 
public 
ActionResult 
AddCustomers (
(( )
)) *
{

Dictionary 
< 
string 
, 
string %
>% & 
whiteLabelDictionary' ;
=< =
new> A

DictionaryB L
<L M
stringM S
,S T
stringU [
>[ \
(\ ]
)] ^
{ 
{ 
$str 
, 
$str 2
}2 3
,3 4
{ 
$str 
, 
$str .
}. /
,/ 0
{ 
$str 
, 
$str 1
}1 2
,2 3
{ 
$str 
, 
$str =
}= >
,> ?
{ 
$str 
, 
$str :
}: ;
,; <
{ 
$str 
, 
$str =
}= >
,> ?
{ 
$str !
,! "
$str# B
}B C
,C D
{ 
$str 
, 
$str >
}> ?
,? @
{ 
$str 
, 
$str <
}< =
,= >
{ 
$str 
, 
$str :
}: ;
,; <
{ 
$str 
, 
$str ;
}; <
,< =
{ 
$str 
, 
$str 3
}3 4
,4 5
{ 
$str 
, 
$str 2
}2 3
} 
;
foreach 
( 
var 
dic 
in  
whiteLabelDictionary  4
)4 5
{   
Db!! 
.!! 
	Customers!! 
.!! 
Add!!  
(!!  !
new!!! $
Customer!!% -
(!!- .
)!!. /
{"" 
Id## 
=## 
Guid## 
.## 
NewGuid## %
(##% &
)##& '
,##' (
	CreatedAt$$ 
=$$ 
DateTime$$  (
.$$( )
Now$$) ,
,$$, -
Code%% 
=%% 
dic%% 
.%% 
Key%% "
,%%" #
Name&& 
=&& 
dic&& 
.&& 
Key&& "
,&&" #
	WebDomain'' 
='' 
dic''  #
.''# $
Value''$ )
}(( 
)(( 
;(( 
})) 
Db** 
.** 
SaveChanges** 
(** 
)** 
;** 
return++ 
View++ 
(++ 
$str++ !
)++! "
;++" #
},, 	
}-- 
}.. �S
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CustomerController.cs
	namespace
WFP
 
.
ICT
.
Web
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class 
CustomerController #
:$ %
BaseController& 4
{ 
private 
const 
int 
PageSize "
=# $
$num% '
;' (
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
var 
customer 
= 
Db 
. 
	Customers '
.' (
Select( .
(. /
x/ 0
=>1 3
new 

CustomerVm 
{ 
Id 
= 
x 
. 
Id 
. 
ToString "
(" #
)# $
,$ %
Code 
= 
x 
. 
Code 
, 
Name 
= 
x 
. 
Name 
, 
	WebDomain 
= 
x 
. 
	WebDomain '
,' (
Phone 
= 
x 
. 
Phone 
,  
Email 
= 
x 
. 
Email 
,  
DateCreated 
= 
x 
.  
	CreatedAt  )
.) *
ToString* 2
(2 3
)3 4
} 
)
. 
ToList 
( 
) 
; 
int!! 

pageNumber!! 
=!! 
(!! 
sc!!  
.!!  !
page!!! %
??!!& (
$num!!) *
)!!* +
;!!+ ,
var"" 
model"" 
="" 
customer""  
.""  !
ToPagedList""! ,
("", -

pageNumber""- 7
,""7 8
PageSize""9 A
)""A B
;""B C
return## 
View## 
(## 
model## 
)## 
;## 
}$$ 	
public&& 
ActionResult&& 
New&& 
(&&  
)&&  !
{'' 	
return(( 
View(( 
((( 
)(( 
;(( 
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
ActionResult,, 
New,, 
(,,  

CustomerVm,,  *

customerVm,,+ 5
),,5 6
{-- 	
try.. 
{// 
var00 
customer00 
=00 
new00 "
Customer00# +
{11 
Id22 
=22 
Guid22 
.22 
NewGuid22 %
(22% &
)22& '
,22' (
	CreatedAt33 
=33 
DateTime33  (
.33( )
Now33) ,
,33, -
	CreatedBy44 
=44 
LoggedInUser44  ,
.44, -
Id44- /
,44/ 0
Code55 
=55 

customerVm55 %
.55% &
Code55& *
,55* +
Name66 
=66 

customerVm66 %
.66% &
Name66& *
,66* +
Email77 
=77 

customerVm77 &
.77& '
Email77' ,
,77, -
Phone88 
=88 

customerVm88 &
.88& '
Phone88' ,
,88, -
	WebDomain99 
=99 

customerVm99  *
.99* +
	WebDomain99+ 4
,994 5
}:: 
;:: 
Db;; 
.;; 
	Customers;; 
.;; 
Add;;  
(;;  !
customer;;! )
);;) *
;;;* +
Db<< 
.<< 
SaveChanges<< 
(<< 
)<<  
;<<  !
ForceCustomers>> 
=>>  
true>>! %
;>>% &
TempData@@ 
[@@ 
$str@@ "
]@@" #
=@@$ %
$str@@& T
;@@T U
returnAA 
RedirectToActionAA '
(AA' (
$strAA( /
)AA/ 0
;AA0 1
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
}FF 
returnGG 
ViewGG 
(GG 
$strGG 
)GG  
;GG  !
}HH 	
publicJJ 
ActionResultJJ 
EditJJ  
(JJ  !
GuidJJ! %
?JJ% &
idJJ' )
)JJ) *
{KK 	
ifLL 
(LL 
idLL 
==LL 
nullLL 
)LL 
{MM 
throwNN 
newNN 

(NN' (
$numNN( +
,NN+ ,
$strNN- :
)NN: ;
;NN; <
}OO 
varPP 
xPP 
=PP 
DbPP 
.PP 
	CustomersPP  
.PP  !
FindPP! %
(PP% &
idPP& (
)PP( )
;PP) *
ifQQ 
(QQ 
xQQ 
==QQ 
nullQQ 
)QQ 
{RR 
throwSS 
newSS 

(SS' (
$numSS( +
,SS+ ,
$strSS- 8
)SS8 9
;SS9 :
}TT 
varUU 
vendorUU 
=UU 
newUU 

CustomerVmUU '
{VV 
IdWW 
=WW 
xWW 
.WW 
IdWW 
.WW 
ToStringWW "
(WW" #
)WW# $
,WW$ %
CodeXX 
=XX 
xXX 
.XX 
CodeXX 
,XX 
NameYY 
=YY 
xYY 
.YY 
NameYY 
,YY 
EmailZZ 
=ZZ 
xZZ 
.ZZ 
EmailZZ 
,ZZ  
Phone[[ 
=[[ 
x[[ 
.[[ 
Phone[[ 
,[[  
	WebDomain\\ 
=\\ 
x\\ 
.\\ 
	WebDomain\\ '
,\\' (
DateCreated]] 
=]] 
x]] 
.]]  
	CreatedAt]]  )
.]]) *
ToString]]* 2
(]]2 3
)]]3 4
}^^ 
;^^
return`` 
View`` 
(`` 
$str`` 
,`` 
vendor`` %
)``% &
;``& '
}aa 	
[cc 	
HttpPostcc	 
]cc 
publicdd 
ActionResultdd 
Editdd  
(dd  !

CustomerVmdd! +

customerVmdd, 6
)dd6 7
{ee 	
tryff 
{gg 
varhh 
customerhh 
=hh 
Dbhh !
.hh! "
	Customershh" +
.hh+ ,
Findhh, 0
(hh0 1
Guidhh1 5
.hh5 6
Parsehh6 ;
(hh; <

customerVmhh< F
.hhF G
IdhhG I
)hhI J
)hhJ K
;hhK L
ifii 
(ii 
customerii 
!=ii 
nullii  $
)ii$ %
{jj 
customerkk 
.kk 
Codekk !
=kk" #

customerVmkk$ .
.kk. /
Codekk/ 3
;kk3 4
customerll 
.ll 
Namell !
=ll" #

customerVmll$ .
.ll. /
Namell/ 3
;ll3 4
customermm 
.mm 
	WebDomainmm &
=mm' (

customerVmmm) 3
.mm3 4
	WebDomainmm4 =
;mm= >
customernn 
.nn 
Emailnn "
=nn# $

customerVmnn% /
.nn/ 0
Emailnn0 5
;nn5 6
customeroo 
.oo 
Phoneoo "
=oo# $

customerVmoo% /
.oo/ 0
Phoneoo0 5
;oo5 6
}pp 
Dbqq 
.qq 
SaveChangesqq 
(qq 
)qq  
;qq  !
TempDatarr 
[rr 
$strrr "
]rr" #
=rr$ %
$strrr& [
;rr[ \
ForceCustomerstt 
=tt  
truett! %
;tt% &
returnuu 
RedirectToActionuu '
(uu' (
$struu( /
)uu/ 0
;uu0 1
}vv 
catchww 
(ww 
	Exceptionww 
exww 
)ww  
{xx 
}zz 
return{{ 
View{{ 
({{ 
$str{{ 
){{  
;{{  !
}|| 	
public~~ 
ActionResult~~ 
Delete~~ "
(~~" #
Guid~~# '
?~~' (
id~~) +
)~~+ ,
{ 	
try
�� 
{
�� 
var
�� 
customer
�� 
=
�� 
Db
�� !
.
��! "
	Customers
��" +
.
��+ ,
Find
��, 0
(
��0 1
id
��1 3
)
��3 4
;
��4 5
if
�� 
(
�� 
customer
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
Db
�� 
.
�� 
	Customers
��  
.
��  !
Remove
��! '
(
��' (
customer
��( 0
)
��0 1
;
��1 2
Db
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
��$ %
ForceCustomers
�� "
=
��# $
true
��% )
;
��) *
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
�� 
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
�� 
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
�� 
}
�� 	
}
�� 
}�� �S
IE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\VendorController.cs
	namespace
WFP
 
.
ICT
.
Web
.
Controllers
{ 
[ 
	Authorize 
] 
public 

class 
VendorController !
:" #
BaseController$ 2
{ 
private 
const 
int 
PageSize "
=# $
$num% '
;' (
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
var 
vendors 
= 
Db 
. 
Vendors $
.$ %
Select% +
(+ ,
x, -
=>. 0
new 
VendorVm 
{ 
Id 
= 
x 
. 
Id 
. 
ToString "
(" #
)# $
,$ %
Name 
= 
x 
. 
Name 
, 
CompanyName 
= 
x 
.  
CompanyName  +
,+ ,
Phone 
= 
x 
. 
Phone 
,  
Email 
= 
x 
. 
Email 
,  
CcEmails 
= 
x 
. 
CcEmails %
,% &
DateCreated 
= 
x 
.  
	CreatedAt  )
.) *
ToString* 2
(2 3
)3 4
} 
)
. 
ToList 
( 
) 
; 
int!! 

pageNumber!! 
=!! 
(!! 
sc!!  
.!!  !
page!!! %
??!!& (
$num!!) *
)!!* +
;!!+ ,
var"" 
model"" 
="" 
vendors"" 
.""  
ToPagedList""  +
(""+ ,

pageNumber"", 6
,""6 7
PageSize""8 @
)""@ A
;""A B
return## 
View## 
(## 
model## 
)## 
;## 
}$$ 	
public&& 
ActionResult&& 
New&& 
(&&  
)&&  !
{'' 	
return(( 
View(( 
((( 
)(( 
;(( 
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
ActionResult,, 
New,, 
(,,  
VendorVm,,  (
vendorVm,,) 1
),,1 2
{-- 	
try.. 
{// 
var00 
vendor00 
=00 
new00  
Vendor00! '
(00' (
)00( )
{11 
Id22 
=22 
Guid22 
.22 
NewGuid22 %
(22% &
)22& '
,22' (
	CreatedAt33 
=33 
DateTime33  (
.33( )
Now33) ,
,33, -
	CreatedBy44 
=44 
LoggedInUser44  ,
.44, -
Id44- /
,44/ 0
Name55 
=55 
vendorVm55 #
.55# $
Name55$ (
,55( )
CompanyName66 
=66  !
vendorVm66" *
.66* +
CompanyName66+ 6
,666 7
Email77 
=77 
vendorVm77 $
.77$ %
Email77% *
,77* +
CcEmails88 
=88 
vendorVm88 '
.88' (
CcEmails88( 0
,880 1
Phone99 
=99 
vendorVm99 $
.99$ %
Phone99% *
,99* +
}:: 
;:: 
Db;; 
.;; 
Vendors;; 
.;; 
Add;; 
(;; 
vendor;; %
);;% &
;;;& '
Db<< 
.<< 
SaveChanges<< 
(<< 
)<<  
;<<  !
ForceVendors>> 
=>> 
true>> #
;>># $
TempData@@ 
[@@ 
$str@@ "
]@@" #
=@@$ %
$str@@& T
;@@T U
returnAA 
RedirectToActionAA '
(AA' (
$strAA( /
)AA/ 0
;AA0 1
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
}FF 
returnGG 
ViewGG 
(GG 
$strGG 
)GG  
;GG  !
}HH 	
publicJJ 
ActionResultJJ 
EditJJ  
(JJ  !
GuidJJ! %
?JJ% &
idJJ' )
)JJ) *
{KK 	
ifLL 
(LL 
idLL 
==LL 
nullLL 
)LL 
{MM 
throwNN 
newNN 

(NN' (
$numNN( +
,NN+ ,
$strNN- :
)NN: ;
;NN; <
}OO 
varPP 
xPP 
=PP 
DbPP 
.PP 
VendorsPP 
.PP 
FindPP #
(PP# $
idPP$ &
)PP& '
;PP' (
ifQQ 
(QQ 
xQQ 
==QQ 
nullQQ 
)QQ 
{RR 
throwSS 
newSS 

(SS' (
$numSS( +
,SS+ ,
$strSS- 8
)SS8 9
;SS9 :
}TT 
varUU 
vendorUU 
=UU 
newUU 
VendorVmUU %
{VV 
IdWW 
=WW 
xWW 
.WW 
IdWW 
.WW 
ToStringWW "
(WW" #
)WW# $
,WW$ %
NameXX 
=XX 
xXX 
.XX 
NameXX 
,XX 
CompanyNameYY 
=YY 
xYY 
.YY  
CompanyNameYY  +
,YY+ ,
EmailZZ 
=ZZ 
xZZ 
.ZZ 
EmailZZ 
,ZZ  
CcEmails[[ 
=[[ 
x[[ 
.[[ 
CcEmails[[ %
,[[% &
Phone\\ 
=\\ 
x\\ 
.\\ 
Phone\\ 
,\\  
DateCreated]] 
=]] 
x]] 
.]]  
	CreatedAt]]  )
.]]) *
ToString]]* 2
(]]2 3
)]]3 4
}^^ 
;^^
return`` 
View`` 
(`` 
$str`` 
,`` 
vendor`` %
)``% &
;``& '
}aa 	
[cc 	
HttpPostcc	 
]cc 
publicdd 
ActionResultdd 
Editdd  
(dd  !
VendorVmdd! )
vendorVmdd* 2
)dd2 3
{ee 	
tryff 
{gg 
varhh 
vendorhh 
=hh 
Dbhh 
.hh  
Vendorshh  '
.hh' (
Findhh( ,
(hh, -
Guidhh- 1
.hh1 2
Parsehh2 7
(hh7 8
vendorVmhh8 @
.hh@ A
IdhhA C
)hhC D
)hhD E
;hhE F
ifii 
(ii 
vendorii 
!=ii 
nullii "
)ii" #
{jj 
vendorkk 
.kk 
Namekk 
=kk  !
vendorVmkk" *
.kk* +
Namekk+ /
;kk/ 0
vendorll 
.ll 
CompanyNamell &
=ll' (
vendorVmll) 1
.ll1 2
CompanyNamell2 =
;ll= >
vendormm 
.mm 
Emailmm  
=mm! "
vendorVmmm# +
.mm+ ,
Emailmm, 1
;mm1 2
vendornn 
.nn 
Phonenn  
=nn! "
vendorVmnn# +
.nn+ ,
Phonenn, 1
;nn1 2
vendoroo 
.oo 
CcEmailsoo #
=oo$ %
vendorVmoo& .
.oo. /
CcEmailsoo/ 7
;oo7 8
}pp 
Dbqq 
.qq 
SaveChangesqq 
(qq 
)qq  
;qq  !
TempDatarr 
[rr 
$strrr "
]rr" #
=rr$ %
$strrr& V
;rrV W
ForceVendorstt 
=tt 
truett #
;tt# $
returnuu 
RedirectToActionuu '
(uu' (
$struu( /
)uu/ 0
;uu0 1
}vv 
catchww 
(ww 
	Exceptionww 
exww 
)ww  
{xx 
}zz 
return{{ 
View{{ 
({{ 
$str{{ 
){{  
;{{  !
}|| 	
public~~ 
ActionResult~~ 
Delete~~ "
(~~" #
Guid~~# '
?~~' (
id~~) +
)~~+ ,
{ 	
try
�� 
{
�� 
var
�� 
vendor
�� 
=
�� 
Db
�� 
.
��  
Vendors
��  '
.
��' (
Find
��( ,
(
��, -
id
��- /
)
��/ 0
;
��0 1
if
�� 
(
�� 
vendor
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
Db
�� 
.
�� 
Vendors
�� 
.
�� 
Remove
�� %
(
��% &
vendor
��& ,
)
��, -
;
��- .
Db
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
��$ %
ForceVendors
��  
=
��! "
true
��# '
;
��' (
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
�� 
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
�� 
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
�� 
}
�� 	
}
�� 
}�� �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\AdsException.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Helpers 
{ 
[		 
Serializable		 
]		 
public

 

class

 
AdsException

 
:

 
	Exception

  )
{ 
public 
AdsException 
( 
) 
:
base
 
(
)
{
}
public 
AdsException 
( 
string "
message# *
)* +
: 	
base
 
( 
message 
) 
{ 
} 
public 
AdsException 
( 
string "
format# )
,) *
params+ 1
object2 8
[8 9
]9 :
args; ?
)? @
: 	
base
 
( 
string 
. 
Format 
( 
format #
,# $
args% )
)) *
)* +
{, -
}. /
public 
AdsException 
( 
string "
message# *
,* +
	Exception, 5
innerException6 D
)D E
: 	
base
 
( 
message 
, 
innerException &
)& '
{( )
}* +
public 
AdsException 
( 
string "
format# )
,) *
	Exception+ 4
innerException5 C
,C D
paramsE K
objectL R
[R S
]S T
argsU Y
)Y Z
: 	
base
 
( 
string 
. 
Format 
( 
format #
,# $
args% )
)) *
,* +
innerException, :
): ;
{< =
}> ?
	protected 
AdsException 
( 
SerializationInfo 0
info1 5
,5 6
StreamingContext7 G
contextH O
)O P
: 	
base
 
( 
info 
, 
context 
) 
{ 
}  !
} 
} �

>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CustomerVm.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Models 
{ 
public 

class 

CustomerVm 
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
string 
Code 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	WebDomain 
{  !
get" %
;% &
set' *
;* +
}, -
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
 
Phone
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
( )
public 
string 
DateCreated !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
}

<E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\VendorVm.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Models 
{ 
public 

class 
VendorVm 
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
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
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
CcEmails
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
string 
DateCreated !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
}
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\NotificationsProcessor.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
ProData 
{ 
public

static
class
NotificationsProcessor
{ 
public 
static 
void #
FetchAndCheckForQcRules 2
(2 3
)3 4
{ 	
using 
( 
var 
db 
= 
new 

(- .
). /
)/ 0
{ 
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
,@ A
$"B D/
#FetchAndCheckForQCRules started at D g
{g h
DateTimeh p
.p q
Nowq t
}t u
"u v
)v w
;w x
List 
< 
Campaign 
> 
	campaigns (
=) *
db+ -
.- .
	Campaigns. 7
. 
Include 
( 
x 
=> !
x" #
.# $
Approved$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
Segments$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
	Trackings$ -
)- .
. 
Where 
( 
x 
=> 
x  !
.! "
Status" (
==) +
(, -
int- 0
)0 1
CampaignStatus1 ?
.? @

Monitoring@ J
||K M
xN O
.O P
SegmentsP X
.X Y
AnyY \
(\ ]
s] ^
=>_ a
sb c
.c d

==r t
(u v
intv y
)y z

.
� �

Monitoring
� �
)
� �
)
� �
. 
Where 
( 
x 
=> 
x  !
.! "
Approved" *
!=+ -
null. 2
)2 3
. 
ToList 
( 
) 
; 
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
RulesProcessing- <
,< =
$str> @
,@ A
$"B D/
#FetchAndCheckForQCRules processing D g
{g h
	campaignsh q
.q r
Countr w
}w x
 campaigns.	x �
"
� �
)
� �
;
� �
int"" 
index"" 
="" 
$num"" 
;"" 
foreach## 
(## 
var## 
campaign## %
in##& (
	campaigns##) 2
)##2 3
{$$ 
ProDataApiManager%% %
.%%% &#
FetchAndUpdateTrackings%%& =
(%%= >
db%%> @
,%%@ A
campaign%%B J
)%%J K
;%%K L
	LogHelper&& 
.&& 
AddLog&& $
(&&$ %
db&&% '
,&&' (
LogType&&) 0
.&&0 1
RulesProcessing&&1 @
,&&@ A
$str&&B D
,&&D E
$"&&F H.
"FetchAndCheckForQCRules completed &&H j
{&&j k
index&&k p
}&&p q
 out of &&q y
{&&y z
	campaigns	&&z �
.
&&� �
Count
&&� �
}
&&� �
 campaigns.
&&� �
"
&&� �
)
&&� �
;
&&� �
index'' 
++'' 
;'' 
}(( 
var,, 
toBeExpired,, 
=,,  !
db,," $
.,,$ %

.,,2 3
ToList,,3 9
(,,9 :
),,: ;
.-- 
Where-- 
(-- 
x--  
=>--! #
(--$ %
DateTime--% -
.--- .
Now--. 1
.--1 2
	TimeOfDay--2 ;
.--; <
Hours--< A
---B C
x--D E
.--E F
FoundAt--F M
?--M N
.--N O
	TimeOfDay--O X
.--X Y
Hours--Y ^
)--^ _
>=--` b
$num--c f
)--f g
... 
ToList.. 
(..  
)..  !
;..! "
if// 
(// 
toBeExpired// 
.//  
Count//  %
>//& '
$num//( )
)//) *
{00 
	LogHelper11 
.11 
AddLog11 $
(11$ %
db11% '
,11' (
LogType11) 0
.110 1
RulesProcessing111 @
,11@ A
$str11B D
,11D E
$str11F i
)11i j
;11j k
foreach22 
(22 
var22  
notification22! -
in22. 0
toBeExpired221 <
)22< =
{33 
notification44 $
.44$ %
Status44% +
=44, -
(44. /
int44/ 2
)442 3
NotificationStatus443 E
.44E F
Expired44F M
;44M N
}55 
db66 
.66 
SaveChanges66 "
(66" #
)66# $
;66$ %
}77 
var:: 
logs:: 
=:: 
db:: 
.:: 

SystemLogs:: (
.::( )
Where::) .
(::. /
x::/ 0
=>::1 3
(::4 5
x::5 6
.::6 7
LogType::7 >
==::? A
(::B C
int::C F
)::F G
LogType::G N
.::N O
RulesProcessing::O ^
||::_ a
x::b c
.::c d
LogType::d k
==::l n
(::o p
int::p s
)::s t
LogType::t {
.::{ |
ProData	::| �
)
::� �
&&
::� �
(;;4 5
DateTime;;5 =
.;;= >
Now;;> A
.;;A B
	TimeOfDay;;B K
.;;K L
Hours;;L Q
-;;R S
x;;T U
.;;U V
	CreatedAt;;V _
.;;_ `
	TimeOfDay;;` i
.;;i j
Hours;;j o
);;o p
>=;;q s
$num;;t v
);;v w
.;;w x
ToList;;x ~
(;;~ 
)	;; �
;
;;� �
if<< 
(<< 
logs<< 
.<< 
Count<< 
><<  
$num<<! "
)<<" #
{== 
foreach>> 
(>> 
var>>  
log>>! $
in>>% '
logs>>( ,
)>>, -
{?? 
db@@ 
.@@ 

SystemLogs@@ %
.@@% &
Remove@@& ,
(@@, -
log@@- 0
)@@0 1
;@@1 2
}AA 
dbBB 
.BB 
SaveChangesBB "
(BB" #
)BB# $
;BB$ %
}CC 
	LogHelperEE 
.EE 
AddLogEE  
(EE  !
dbEE! #
,EE# $
LogTypeEE% ,
.EE, -
RulesProcessingEE- <
,EE< =
$strEE> @
,EE@ A
$"EEB D0
$FetchAndCheckForQCRules finished at EED h
{EEh i
DateTimeEEi q
.EEq r
NowEEr u
}EEu v
, EEv x
{EEx y
	campaigns	EEy �
.
EE� �
Count
EE� �
}
EE� �#
 campaigns refreshed.
EE� �
"
EE� �
)
EE� �
;
EE� �
}GG 
}HH 	
publicJJ 
staticJJ 
voidJJ "
SendNotificationEmailsJJ 1
(JJ1 2
)JJ2 3
{KK 	
usingLL 
(LL 
varLL 
dbLL 
=LL 
newLL 

(LL- .
)LL. /
)LL/ 0
{MM 
varWW 
	campaignsWW 
=WW 
(WW  !
fromWW! %
cWW& '
inWW( *
dbWW+ -
.WW- .
	CampaignsWW. 7
joinXX  $
nXX% &
inXX' )
dbXX* ,
.XX, -

onXX; =
cXX> ?
.XX? @
IdXX@ B
equalsXXC I
nXXJ K
.XXK L

CampaignIdXXL V
whereYY  %
nYY& '
.YY' (
StatusYY( .
==YY/ 1
(YY2 3
intYY3 6
)YY6 7
NotificationStatusYY7 I
.YYI J
FoundYYJ O
selectZZ  &
cZZ' (
)ZZ( )
.ZZ) *
DistinctZZ* 2
(ZZ2 3
)ZZ3 4
.ZZ4 5
IncludeZZ5 <
(ZZ< =
xZZ= >
=>ZZ? A
xZZB C
.ZZC D

)ZZQ R
.ZZR S
ToListZZS Y
(ZZY Z
)ZZZ [
;ZZ[ \
var\\ 
vendor\\ 
=\\ 
db\\ 
.\\  
Vendors\\  '
.\\' (
FirstOrDefault\\( 6
(\\6 7
x\\7 8
=>\\9 ;
x\\< =
.\\= >
Name\\> B
.\\B C
Contains\\C K
(\\K L
$str\\L Q
)\\Q R
||\\S U
x\\V W
.\\W X
Name\\X \
.\\\ ]
Contains\\] e
(\\e f
$str\\f l
)\\l m
)\\m n
;\\n o
if^^ 
(^^ 
	campaigns^^ 
.^^ 
Count^^ #
>^^$ %
$num^^& '
)^^' (
{__ 
	LogHelper`` 
.`` 
AddLog`` $
(``$ %
db``% '
,``' (
LogType``) 0
.``0 1
RulesProcessing``1 @
,``@ A
$str``B D
,``D E
$str``F c
)``c d
;``d e
EmailHelperaa 
.aa  %
SendNotificationsToVendoraa  9
(aa9 :
vendoraa: @
,aa@ A
	campaignsaaB K
)aaK L
;aaL M
}bb 
}cc 
}dd 	
}ff 
}gg �U
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\CampaignProcessor.cs
	namespace

 	
WFP


 
.


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
 
Async

 
{ 
public 

static 
class 
CampaignProcessor )
{
public 
static 
void 
SendVendorEmail *
(* +
Guid+ /
?/ 0
vendorId1 9
,9 :
string; A
orderNumberB M
,M N
stringO U
[U V
]V W
segmentsSelectedX h
)h i
{ 	
using 
( 
var 
db 
= 
new 

(- .
). /
)/ 0
{ 
Campaign 
campaign !
=" #
db$ &
.& '
	Campaigns' 0
. 
Include 
( 
x 
=> !
x" #
.# $
Assets$ *
)* +
. 
Include 
( 
x 
=> !
x" #
.# $
Segments$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
Approved$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
	Trackings$ -
)- .
. 
FirstOrDefault #
(# $
x$ %
=>& (
x) *
.* +
OrderNumber+ 6
==7 9
orderNumber: E
)E F
;F G
var 
vendor 
= 
db 
.  
Vendors  '
.' (
FirstOrDefault( 6
(6 7
x7 8
=>9 ;
x< =
.= >
Id> @
==A C
vendorIdD L
)L M
;M N
if 
( 
segmentsSelected $
==% '
null( ,
), -
{ 
EmailHelper 
.   
SendApprovedToVendor  4
(4 5
vendor5 ;
,; <
campaign= E
,E F
nullG K
)K L
;L M
string 
orderNumberRdp )
;) *
long   
quantity   !
;  ! "
if!! 
(!! 
campaign!!  
.!!  !

)!!. /
{"" 
orderNumberRdp## &
=##' (
campaign##) 1
.##1 2$
ReBroadcastedOrderNumber##2 J
;##J K
quantity$$  
=$$! "
campaign$$# +
.$$+ ,!
ReBroadcastedQuantity$$, A
;$$A B
}%% 
else&& 
{'' 
orderNumberRdp(( &
=((' (
campaign(() 1
.((1 2
OrderNumber((2 =
;((= >
quantity))  
=))! "
campaign))# +
.))+ ,
Approved)), 4
.))4 5
Quantity))5 =
;))= >
}** 
var,, 
campaignTracking,, (
=,,) *
db-- 
.-- 
CampaignTrackings-- /
.--/ 0
FirstOrDefault--0 >
(--> ?
x--? @
=>--A C
x--D E
.--E F

CampaignId--F P
==--Q S
campaign--T \
.--\ ]
Id--] _
&&--` b
x--c d
.--d e
OrderNumber--e p
==--q s
orderNumberRdp	--t �
&&
--� �
x
--� �
.
--� �

--� �
==
--� �
$str
--� �
)
--� �
;
--� �
if// 
(// 
campaignTracking// (
==//) +
null//, 0
)//0 1
{00 
var11 

trackingId11 &
=11' (
Guid11) -
.11- .
NewGuid11. 5
(115 6
)116 7
;117 8
var22 
tracking22 $
=22% &
new22' *
CampaignTracking22+ ;
(22; <
)22< =
{33 
Id44 
=44  

trackingId44! +
,44+ ,
	CreatedAt55 %
=55& '
DateTime55( 0
.550 1
Now551 4
,554 5

CampaignId66 &
=66' (
campaign66) 1
.661 2
Id662 4
,664 5
OrderNumber77 '
=77( )
orderNumberRdp77* 8
,778 9

=88* +
string88, 2
.882 3
Empty883 8
,888 9
Quantity99 $
=99% &
quantity99' /
,99/ 0
DateSent:: $
=::% &
DateTime::' /
.::/ 0
Now::0 3
,::3 4
IsCreatedThroughApi;; /
=;;0 1
false;;2 7
}<< 
;<< 
db== 
.== 
CampaignTrackings== ,
.==, -
Add==- 0
(==0 1
tracking==1 9
)==9 :
;==: ;
}>> 
if@@ 
(@@ 
!@@ 
campaign@@ !
.@@! "

)@@/ 0
{AA 
	LogHelperBB !
.BB! "
AddLogBB" (
(BB( )
dbBB) +
,BB+ ,
LogTypeBB- 4
.BB4 5
ProDataBB5 <
,BB< =
orderNumberBB> I
,BBI J
$strBBK x
)BBx y
;BBy z
}CC 
elseDD 
{EE 
	LogHelperFF !
.FF! "
AddLogFF" (
(FF( )
dbFF) +
,FF+ ,
LogTypeFF- 4
.FF4 5
ProDataFF5 <
,FF< =
orderNumberFF> I
,FFI J
$strFFK 
)	FF �
;
FF� �
}GG 
dbHH 
.HH 
SaveChangesHH "
(HH" #
)HH# $
;HH$ %
}JJ 
elseKK 
{LL 
varMM 
segmentsMM  
=MM! "
dbMM# %
.MM% &
CampaignSegmentsMM& 6
.NN# $
WhereNN$ )
(NN) *
cNN* +
=>NN, .
cNN/ 0
.NN0 1

CampaignIdNN1 ;
==NN< >
campaignNN? G
.NNG H
IdNNH J
&&NNK M
segmentsSelectedNNN ^
.NN^ _
ContainsNN_ g
(NNg h
cNNh i
.NNi j

)NNw x
)NNx y
.OO# $
ToListOO$ *
(OO* +
)OO+ ,
;OO, -
foreachQQ 
(QQ 
varQQ  
segmentQQ! (
inQQ) +
segmentsQQ, 4
)QQ4 5
{RR 
EmailHelperSS #
.SS# $ 
SendApprovedToVendorSS$ 8
(SS8 9
vendorSS9 ?
,SS? @
campaignSSA I
,SSI J
segmentSSK R
)SSR S
;SSS T
segmentUU 
.UU  

=UU. /
(UU0 1
intUU1 4
)UU4 5

.UUB C

MonitoringUUC M
;UUM N
varWW 
campaignTrackingWW ,
=WW- .
dbXX 
.XX 
CampaignTrackingsXX 0
.XX0 1
FirstOrDefaultXX1 ?
(XX? @
xXX@ A
=>XXB D
xXXE F
.XXF G

CampaignIdXXG Q
==XXR T
campaignXXU ]
.XX] ^
IdXX^ `
&&XXa c
xXXd e
.XXe f

==XXt v
segmentXXw ~
.XX~ 

)
XX� �
;
XX� �
ifZZ 
(ZZ 
campaignTrackingZZ ,
==ZZ- /
nullZZ0 4
)ZZ4 5
{[[ 
var\\ 

trackingId\\  *
=\\+ ,
Guid\\- 1
.\\1 2
NewGuid\\2 9
(\\9 :
)\\: ;
;\\; <
var]] 
tracking]]  (
=]]) *
new]]+ .
CampaignTracking]]/ ?
(]]? @
)]]@ A
{^^ 
Id__  "
=__# $

trackingId__% /
,__/ 0
	CreatedAt``  )
=``* +
DateTime``, 4
.``4 5
Now``5 8
,``8 9

CampaignIdaa  *
=aa+ ,
campaignaa- 5
.aa5 6
Idaa6 8
,aa8 9
OrderNumberbb  +
=bb, -
orderNumberbb. 9
,bb9 :

=cc. /
segmentcc0 7
.cc7 8

,ccE F
Quantitydd  (
=dd) *
segmentdd+ 2
.dd2 3
Quantitydd3 ;
,dd; <
DateSentee  (
=ee) *
DateTimeee+ 3
.ee3 4
Nowee4 7
,ee7 8
IsCreatedThroughApiff  3
=ff4 5
falseff6 ;
}gg 
;gg 
dbhh 
.hh 
CampaignTrackingshh 0
.hh0 1
Addhh1 4
(hh4 5
trackinghh5 =
)hh= >
;hh> ?
}ii 
	LogHelperjj !
.jj! "
AddLogjj" (
(jj( )
dbjj) +
,jj+ ,
LogTypejj- 4
.jj4 5
ProDatajj5 <
,jj< =
orderNumberjj> I
,jjI J
$"jjK M
Segment jjM U
{jjU V
segmentjjV ]
.jj] ^

}jjk l3
& has been sent to vendor successfully.	jjl �
"
jj� �
)
jj� �
;
jj� �
}kk 
}ll 
varoo #
ifSomeSegmentsRemainingoo +
=oo, -
dboo. 0
.oo0 1
CampaignSegmentsoo1 A
.pp 
Wherepp $
(pp$ %
cpp% &
=>pp' )
cpp* +
.pp+ ,

CampaignIdpp, 6
==pp7 9
campaignpp: B
.ppB C
IdppC E
)ppE F
.qq 
Anyqq "
(qq" #
xqq# $
=>qq% '
xqq( )
.qq) *

==qq8 :
(qq; <
intqq< ?
)qq? @

.qqM N
	GeneratedqqN W
||qqX Z
xqq[ \
.qq\ ]

==qqk m
(qqn o
intqqo r
)qqr s

.
qq� �
Approved
qq� �
)
qq� �
;
qq� �
ifrr 
(rr 
!rr #
ifSomeSegmentsRemainingrr ,
)rr, -
{ss 
campaigntt 
.tt 
Statustt #
=tt$ %
(tt& '
inttt' *
)tt* +
CampaignStatustt+ 9
.tt9 :

Monitoringtt: D
;ttD E
dbuu 
.uu 
SaveChangesuu "
(uu" #
)uu# $
;uu$ %
}vv 
}xx 
}yy 	
}{{ 
}|| �n
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\DataFileProcessor.cs
	namespace 	
WFP
 
.
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

(- .
). /
)/ 0
{ 
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

.MM% &
UploadMM& ,
(MM, -

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

)
||� �
;
||� �

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

��$ 1
=
��2 3
(
��4 5
int
��5 8
)
��8 9

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
�� 
}
�� 	
}
�� 
}�� ��
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\MailChimpProcessor.cs
	namespace 	
WFP
 
.
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
{## 
Emails%% 
=%% 

testEmails%% #
,%%# $
	EmailType&& 
=&& 
$str&& "
}'' 
)''
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

(--- .
)--. /
)--/ 0
{.. 
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
}EE 
}FF 	
privateHH 
staticHH 
voidHH 
SendCampaignHH (
(HH( )

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
{UU 
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
}^^ 
)^^
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
{cc 
Htmlee 
=ee 
modelee 
.ee 
	Creativesee &
,ee& '
}ff 
;ff
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
{pp 

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
}~~ 
)~~
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
�� 
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
�� 
if
�� 
(
�� 

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
�� 
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
�� 
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

�� )
(
��) *

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
�� 
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
�� 
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
�� 
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
�� 
if
�� 
(
�� 
isListExists
�� 
)
�� 
{
�� 
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
�� 
else
�� 
{
�� 
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
�� 
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
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
ProData 
{ 
public 

static 
class 

{		 
public

 
static

 
int

 
GetIndex

 "
(

" #
string

# )


* 7
)

7 8
{ 	
var
parts
=

.
Split
(
$char
)
;
return 
int 
. 
Parse 
( 
parts "
[" #
parts# (
.( )
Length) /
-0 1
$num2 3
]3 4
)4 5
;5 6
} 	
} 
} ��
JE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\AccountController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
AccountController "
:# $
BaseController% 3
{ 
private "
ApplicationUserManager &
_userManager' 3
;3 4
private $
ApplicationSignInManager (
_signInManager) 7
;7 8
public 
AccountController  
(  !
)! "
{ 	
} 	
public 
AccountController  
(  !"
ApplicationUserManager! 7
userManager8 C
,C D$
ApplicationSignInManagerE ]

)l m
{ 	
UserManager 
= 
userManager %
;% &

= 

;) *
} 	
public   "
ApplicationUserManager   %
UserManager  & 1
{!! 	
get"" 
{## 
return$$ 
_userManager$$ #
??$$$ &
HttpContext$$' 2
.$$2 3
GetOwinContext$$3 A
($$A B
)$$B C
.$$C D
GetUserManager$$D R
<$$R S"
ApplicationUserManager$$S i
>$$i j
($$j k
)$$k l
;$$l m
}%% 
set&& 
{'' 
_userManager(( 
=(( 
value(( $
;(($ %
})) 
}** 	
public,, $
ApplicationSignInManager,, '

{-- 	
get.. 
{// 
return00 
_signInManager00 %
??00& (
HttpContext00) 4
.004 5
GetOwinContext005 C
(00C D
)00D E
.00E F
Get00F I
<00I J$
ApplicationSignInManager00J b
>00b c
(00c d
)00d e
;00e f
}11 
private22 
set22 
{33 
_signInManager44 
=44  
value44! &
;44& '
}55 
}66 	
[:: 	
AllowAnonymous::	 
]:: 
public;; 
ActionResult;; 
Login;; !
(;;! "
string;;" (
	returnUrl;;) 2
);;2 3
{<< 	
ViewBag== 
.== 
	ReturnUrl== 
=== 
	returnUrl==  )
;==) *
if>> 
(>> 
LoggedInUser>> 
!=>> 
null>>  $
)>>$ %
{?? 
if@@ 
(@@ 
	returnUrl@@ 
!=@@  
null@@! %
)@@% &
returnAA 
RedirectAA #
(AA# $
	returnUrlAA$ -
)AA- .
;AA. /
elseBB 
returnCC 
RedirectToActionCC +
(CC+ ,
$strCC, 3
,CC3 4
$strCC5 ;
)CC; <
;CC< =
}DD 
elseEE 
returnFF 
ViewFF 
(FF 
)FF 
;FF 
}GG 	
[KK 	
HttpPostKK	 
]KK 
[LL 	
AllowAnonymousLL	 
]LL 
[MM 	$
ValidateAntiForgeryTokenMM	 !
]MM! "
publicNN 
asyncNN 
TaskNN 
<NN 
ActionResultNN &
>NN& '
LoginNN( -
(NN- .
LoginViewModelNN. <
modelNN= B
,NNB C
stringNND J
	returnUrlNNK T
)NNT U
{OO 	
tryRR 
{SS 
ifTT 
(TT 
!TT 

ModelStateTT 
.TT  
IsValidTT  '
)TT' (
{UU 

errorsVV" (
=VV) *
newVV+ .

(VV< =
)VV= >
;VV> ?
foreachWW 
(WW 
varWW  
msWW! #
inWW$ &

ModelStateWW' 1
.WW1 2
ValuesWW2 8
)WW8 9
{XX 
foreachYY 
(YY  !
varYY! $
errorYY% *
inYY+ -
msYY. 0
.YY0 1
ErrorsYY1 7
)YY7 8
{ZZ 
errors[[ "
.[[" #
Append[[# )
([[) *
$"[[* ,
{[[, -
error[[- 2
.[[2 3
ErrorMessage[[3 ?
}[[? @
<br/>[[@ E
"[[E F
)[[F G
;[[G H
}\\ 
}]] 
if^^ 
(^^ 
!^^ 
string^^ 
.^^  

(^^- .
errors^^. 4
.^^4 5
ToString^^5 =
(^^= >
)^^> ?
)^^? @
)^^@ A
throw__ 
new__ !
AdsException__" .
(__. /
errors__/ 5
.__5 6
ToString__6 >
(__> ?
)__? @
)__@ A
;__A B
}`` 
varbb 
resultbb 
=bb 
awaitbb "

.bb0 1
PasswordSignInAsyncbb1 D
(bbD E
modelbbE J
.bbJ K
UsernamebbK S
,bbS T
modelbbU Z
.bbZ [
Passwordbb[ c
,bbc d
modelbbe j
.bbj k

RememberMebbk u
,bbu v

:
bb� �
false
bb� �
)
bb� �
;
bb� �
switchcc 
(cc 
resultcc 
)cc 
{dd 
caseee 
SignInStatusee %
.ee% &
Successee& -
:ee- .
SetupLoggedInUserff )
(ff) *
modelff* /
.ff/ 0
Usernameff0 8
)ff8 9
;ff9 :
returngg 
Jsongg #
(gg# $
newgg$ '
JsonResponsegg( 4
(gg4 5
)gg5 6
{gg7 8
IsSucessgg9 A
=ggB C
trueggD H
}ggI J
,ggJ K
JsonRequestBehaviorggL _
.gg_ `
AllowGetgg` h
)ggh i
;ggi j
caseii 
SignInStatusii %
.ii% & 
RequiresVerificationii& :
:ii: ;
returnss 
RedirectToLocalss .
(ss. /
	returnUrlss/ 8
)ss8 9
;ss9 :
casevv 
SignInStatusvv %
.vv% &
	LockedOutvv& /
:vv/ 0
throwww 
newww !
AdsExceptionww" .
(ww. /
$strww/ ?
)ww? @
;ww@ A
caseyy 
SignInStatusyy %
.yy% &
Failureyy& -
:yy- .
throwzz 
newzz !
AdsExceptionzz" .
(zz. /
$strzz/ S
)zzS T
;zzT U
default{{ 
:{{ 
throw|| 
new|| !
AdsException||" .
(||. /
$str||/ S
)||S T
;||T U
} 
}
�� 
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
�� 
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
�� 
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
�� 	
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
)
��N O
;
��O P
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
�� 
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
��, -

WhiteLabel
�� 
=
��  
model
��! &
.
��& '

WhiteLabel
��' 1
,
��1 2
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
��5 >
)
��> ?
;
��? @
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
�� 
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
)
��N O
;
��O P
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 

ModelState
�� 
.
�� 

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
�� 
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
�� 
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
�� 
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
�� 
}
�� 
public
�� 
ChallengeResult
�� "
(
��" #
string
��# )
provider
��* 2
,
��2 3
string
��4 :
redirectUri
��; F
,
��F G
string
��H N
userId
��O U
)
��U V
{
�� 

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
�� 
public
�� 
string
�� 

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
�� 
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

��Z g
)
��g h
;
��h i
}
�� 
}
�� 	
}
�� 
}�� �W
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\API\AdsController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
API 
{ 
public

class

:

{ 
private 
readonly 
string '
AuthenticationParameterName  ;
=< =
$str> J
;J K
private 
readonly 
int 
APIMaxDailyLimit -
=. /
$num0 2
;2 3
private 
readonly 

_db' *
=+ ,
new- 0

(> ?
)? @
;@ A
public 

JsonResult 
< 
JsonResponse &
>& '
Get( +
(+ ,
), -
{ 	
try 
{ 
if 
( 
! 
Request 
. 
Headers $
.$ %
Contains% -
(- .'
AuthenticationParameterName. I
)I J
)J K
{ 
throw 
new 
AdsException *
(* +
$str+ N
)N O
;O P
} 
string 
token 
= 
Request &
.& '
Headers' .
.. /
	GetValues/ 8
(8 9'
AuthenticationParameterName9 T
)T U
.U V
FirstV [
([ \
)\ ]
;] ^
var!! 
user!! 
=!! 
_db!! 
.!! 
Users!! $
.!!$ %
FirstOrDefault!!% 3
(!!3 4
x!!4 5
=>!!6 8
x!!9 :
.!!: ;
ApiKey!!; A
.!!A B
Equals!!B H
(!!H I
token!!I N
)!!N O
)!!O P
;!!P Q
var"" 
isValidUser"" 
=""  !
user""" &
!=""' )
null""* .
;"". /
if## 
(## 
!## 
isValidUser##  
)##  !
{$$ 
throw%% 
new%% 
AdsException%% *
(%%* +
$str%%+ K
)%%K L
;%%L M
}&& 
int(( 
todaysRequests(( "
=((# $
_db((% (
.((( )
ApiRequests(() 4
.((4 5
Count((5 :
(((: ;
x((; <
=>((= ?
x((@ A
.((A B
APIKey((B H
==((I K
token((L Q
&&((R T
x((U V
.((V W
	CreatedAt((W `
.((` a
Date((a e
==((f h
DateTime((i q
.((q r
Now((r u
.((u v
Date((v z
)((z {
;(({ |
if)) 
()) 
todaysRequests)) "
>))# $
APIMaxDailyLimit))% 5
)))5 6
{** 
throw++ 
new++ 
AdsException++ *
(++* +
$str+++ A
+++B C
APIMaxDailyLimit++D T
+++U V
$str,,( N
),,N O
;,,O P
}-- 
_db// 
.// 
ApiRequests// 
.//  
Add//  #
(//# $
new//$ '

ApiRequest//( 2
(//2 3
)//3 4
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
;44 
_db55 
.55 
SaveChanges55 
(55  
)55  !
;55! "
var77 
	campaigns77 
=77 
_db77  #
.77# $
	Campaigns77$ -
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
=>==  
Campaign==! )
.==) *
FromCampaign==* 6
(==6 7
x==7 8
)==8 9
)==9 :
;==: ;
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
}@@ 
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA  
{BB 
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
}DD 
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
]HH6 7
CampaignHH8 @
campaginHHA I
)HHI J
{II 	
tryJJ 
{KK 
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
newNN 
AdsExceptionNN *
(NN* +
$strNN+ N
)NNN O
;NNO P
}OO 
ifPP 
(PP 
stringPP 
.PP 

(PP( )
campaginPP) 1
.PP1 2
OrderNumberPP2 =
)PP= >
)PP> ?
{QQ 
throwRR 
newRR 
AdsExceptionRR *
(RR* +
$strRR+ C
)RRC D
;RRD E
}SS 
ifTT 
(TT 
stringTT 
.TT 

(TT( )
campaginTT) 1
.TT1 2
IoNumberTT2 :
)TT: ;
)TT; <
{UU 
throwVV 
newVV 
AdsExceptionVV *
(VV* +
$strVV+ @
)VV@ A
;VVA B
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
=[[ 
_db[[ 
.[[ 
Users[[ $
.[[$ %
FirstOrDefault[[% 3
([[3 4
x[[4 5
=>[[6 8
x[[9 :
.[[: ;
ApiKey[[; A
.[[A B
Equals[[B H
([[H I
token[[I N
)[[N O
)[[O P
;[[P Q
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
new__ 
AdsException__ *
(__* +
$str__+ K
)__K L
;__L M
}`` 
_dbbb 
.bb 
ApiRequestsbb 
.bb  
Addbb  #
(bb# $
newbb$ '

ApiRequestbb( 2
(bb2 3
)bb3 4
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
;gg 
_dbhh 
.hh 
SaveChangeshh 
(hh  
)hh  !
;hh! "
varjj 
campaignTrackingjj $
=jj% &
_dbjj' *
.jj* +
CampaignTrackingsjj+ <
.kk  !
FirstOrDefaultkk! /
(kk/ 0
xkk0 1
=>kk2 4
xkk5 6
.kk6 7

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
newoo 
AdsExceptionoo *
(oo* +
$stroo+ H
+ooI J
campaginooK S
.ooS T
OrderNumberooT _
+oo` a
$stroob t
)oot u
;oou v
}pp 
campaignTrackingrr  
.rr  !
IoNumberrr! )
=rr* +
campaginrr, 4
.rr4 5
IoNumberrr5 =
.rr= >
Trimrr> B
(rrB C
)rrC D
;rrD E
_dbss 
.ss 
SaveChangesss 
(ss  
)ss  !
;ss! "
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
IoNumbervvP X
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
}yy 
catchzz 
(zz 
	Exceptionzz 
exzz 
)zz  
{{{ 
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
}}} 
}~~ 	
}
�� 
}�� Ղ
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\ApprovedController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
ApprovedController #
:$ %
BaseController& 4
{ 
public 
ActionResult 
Index !
(! "
Guid" &
?& '
id( *
)* +
{ 	
var 
campaign 
= 
Db 
. 
	Campaigns '
. 
Include 
( 
c 
=> 
c 
.  
Testing  '
)' (
. 
Include 
( 
c 
=> 
c 
.  
Approved  (
)( )
. 
FirstOrDefault 
(  
c  !
=>" $
c% &
.& '
Id' )
==* ,
id- /
)/ 0
;0 1
Session 
[ 
$str 
] 
= 
id 
; 
Session 
[ 
$str !
]! "
=# $
campaign% -
.- .
OrderNumber. 9
;9 :
if   
(   
campaign   
.   
Testing    
==  ! #
null  $ (
)  ( )
{!! 
TempData"" 
["" 
$str""  
]""  !
=""" #
$str""$ H
;""H I
return## 
RedirectToAction## '
(##' (
$str##( /
,##/ 0
$str##1 <
)##< =
;##= >
}$$ 
if&& 
(&& 
campaign&& 
.&& 
Approved&& !
==&&" $
null&&% )
)&&) *
{'' 
var(( 
testing(( 
=(( 
campaign(( &
.((& '
Testing((' .
;((. /
var)) 

approvedId)) 
=))  
Guid))! %
.))% &
NewGuid))& -
())- .
))). /
;))/ 0
var** 
approved** 
=** 
new** "
CampaignApproved**# 3
(**3 4
)**4 5
{++ 
Id,, 
=,, 

approvedId,, #
,,,# $

CampaignId-- 
=--  
campaign--! )
.--) *
Id--* ,
,--, -
	CreatedAt.. 
=.. 
DateTime..  (
...( )
Now..) ,
,.., -
	CreatedBy// 
=// 
campaign//  (
.//( )
	CreatedBy//) 2
,//2 3
CampaignName00  
=00! "
testing00# *
.00* +
CampaignName00+ 7
,007 8

WhiteLabel11 
=11  
testing11! (
.11( )

WhiteLabel11) 3
,113 4
ReBroadCast22 
=22  !
testing22" )
.22) *
ReBroadCast22* 5
,225 6
ReBroadcastDate33 #
=33$ %
testing33& -
.33- .
ReBroadcastDate33. =
,33= >
FromLine44 
=44 
testing44 &
.44& '
FromLine44' /
,44/ 0
SubjectLine55 
=55  !
testing55" )
.55) *
SubjectLine55* 5
,555 6

DeployDate66 
=66  
testing66! (
.66( )

DeployDate66) 3
,663 4

GeoDetails88 
=88  
testing88! (
.88( )

GeoDetails88) 3
,883 4
Demographics99  
=99! "
testing99# *
.99* +
Demographics99+ 7
,997 8
Quantity:: 
=:: 
testing:: &
.::& '
Quantity::' /
,::/ 0
SpecialInstructions;; '
=;;( )
testing;;* 1
.;;1 2
SpecialInstructions;;2 E
,;;E F
ReportSiteLink<< "
=<<# $
$"<<% '(
http://report-site.com/c/ADS<<' C
{<<C D
campaign<<D L
.<<L M
OrderNumber<<M X
}<<X Y
"<<Y Z
,<<Z [
LinkBreakout==  
===! "
$"==# %/
#http://www.digitaldynamixs.net/ep2/==% H
{==H I
campaign==I Q
.==Q R
OrderNumber==R ]
}==] ^
/==^ _
{==_ `
campaign==` h
.==h i
OrderNumber==i t
}==t u
	linkr.csv==u ~
"==~ 
,	== �
IsOpenPixel>> 
=>>  !
testing>>" )
.>>) *
IsOpenPixel>>* 5
,>>5 6
OpenPixelUrl??  
=??! "
testing??# *
.??* +
OpenPixelUrl??+ 7
,??7 8
	OpenGoals@@ 
=@@ 
testing@@  '
.@@' (
	OpenGoals@@( 1
,@@1 2

ClickGoalsAA 
=AA  
testingAA! (
.AA( )

ClickGoalsAA) 3
,AA3 4
DataFileQuantityBB $
=BB% &
testingBB' .
.BB. /
DataFileQuantityBB/ ?
,BB? @
DataFileUrlCC 
=CC  !
testingCC" )
.CC) *
DataFileUrlCC* 5
,CC5 6
IsOmniOrderEE 
=EE  !
testingEE" )
.EE) *
IsOmniOrderEE* 5
,EE5 6
OmniDeployDateFF "
=FF# $
testingFF% ,
.FF, -
OmniDeployDateFF- ;
,FF; <
ImpressionsGG 
=GG  !
testingGG" )
.GG) *
ImpressionsGG* 5
,GG5 6
ChannelTypesHH  
=HH! "
testingHH# *
.HH* +
ChannelTypesHH+ 7
,HH7 8
}II 
;II 
DbJJ 
.JJ 
CampaignsApprovedJJ $
.JJ$ %
AddJJ% (
(JJ( )
approvedJJ) 1
)JJ1 2
;JJ2 3
DbKK 
.KK 
SaveChangesKK 
(KK 
)KK  
;KK  !
campaignLL 
.LL 

ApprovedIdLL #
=LL$ %

approvedIdLL& 0
;LL0 1
DbMM 
.MM 
SaveChangesMM 
(MM 
)MM  
;MM  !
}NN 
campaignOO 
.OO 
StatusOO 
=OO 
(OO 
intOO "
)OO" #
CampaignStatusOO# 1
.OO1 2
ApprovedOO2 :
;OO: ;
DbPP 
.PP 
SaveChangesPP 
(PP 
)PP 
;PP 
returnQQ 
RedirectToActionQQ #
(QQ# $
$strQQ$ 2
,QQ2 3
$strQQ4 >
,QQ> ?
newQQ@ C
{QQD E
idQQF H
=QQI J
campaignQQK S
.QQS T

ApprovedIdQQT ^
}QQ_ `
)QQ` a
;QQa b
}SS 	
publicVV 
ActionResultVV 
EditApprovedVV (
(VV( )
GuidVV) -
?VV- .
idVV/ 1
)VV1 2
{WW 	
CampaignApprovedXX 
campaignApprovedXX -
=XX. /
DbXX0 2
.XX2 3
CampaignsApprovedXX3 D
.XXD E
FirstOrDefaultXXE S
(XXS T
cXXT U
=>XXV X
cXXY Z
.XXZ [
IdXX[ ]
==XX^ `
idXXa c
)XXc d
;XXd e
ifYY 
(YY 
campaignApprovedYY  
==YY! #
nullYY$ (
)YY( )
{ZZ 
throw[[ 
new[[ 

([[' (
$num[[( +
,[[+ ,
$str[[- 8
)[[8 9
;[[9 :
}\\ 

TinyMapper^^ 
.^^ 
Bind^^ 
<^^ 
CampaignApproved^^ ,
,^^, -
CampaignApprovedVM^^. @
>^^@ A
(^^A B
config^^B H
=>^^I K
{__ 
config`` 
.`` 
Ignore`` 
(`` 
x`` 
=>``  "
x``# $
.``$ %
ChannelTypes``% 1
)``1 2
;``2 3
}aa 
)aa
;aa 
varcc 
campaignApprovedVmcc "
=cc# $

TinyMappercc% /
.cc/ 0
Mapcc0 3
<cc3 4
CampaignApprovedVMcc4 F
>ccF G
(ccG H
campaignApprovedccH X
)ccX Y
;ccY Z
Campaigndd 
campaigndd 
=dd 
Dbdd  "
.dd" #
	Campaignsdd# ,
.ee 
Includeee 
(ee 
xee 
=>ee  
xee! "
.ee" #
Assetsee# )
)ee) *
.ff 
Includeff 
(ff 
xff 
=>ff  
xff! "
.ff" #
Segmentsff# +
)ff+ ,
.gg 
FirstOrDefaultgg "
(gg" #
xgg# $
=>gg% '
xgg( )
.gg) *
Idgg* ,
==gg- /
campaignApprovedVmgg0 B
.ggB C

CampaignIdggC M
)ggM N
;ggN O
campaignApprovedVmhh 
.hh 
OrderNumberhh *
=hh+ ,
campaignhh- 5
.hh5 6
OrderNumberhh6 A
;hhA B
campaignApprovedVmii 
.ii 
Assetsii %
=ii& '
campaignii( 0
.ii0 1
Assetsii1 7
;ii7 8
foreachjj 
(jj 
varjj 
segmentjj  
injj! #
campaignjj$ ,
.jj, -
Segmentsjj- 5
)jj5 6
{kk 
varll 
	segmentVmll 
=ll 

TinyMapperll  *
.ll* +
Mapll+ .
<ll. /
CampaignSegmentVMll/ @
>ll@ A
(llA B
segmentllB I
)llI J
;llJ K
campaignApprovedVmmm "
.mm" #
Segmentsmm# +
.mm+ ,
Addmm, /
(mm/ 0
	segmentVmmm0 9
)mm9 :
;mm: ;
}nn 
campaignApprovedVmpp 
.pp 
ChannelTypespp +
=pp, -
stringpp. 4
.pp4 5

(ppB C
campaignApprovedppC S
.ppS T
ChannelTypesppT `
)pp` a
?ppb c
newppd g
Listpph l
<ppl m
ChannelTypeppm x
>ppx y
{ppz {
}pp| }
:pp~ 
campaignApprovedqq  
.qq  !
ChannelTypesqq! -
.rr 
Splitrr 
(rr 
$strrr 
.rr 
ToCharArrayrr *
(rr* +
)rr+ ,
)rr, -
.ss 
Selectss 
(ss 
xss 
=>ss  
(ss! "
ChannelTypess" -
)ss- .
Systemss. 4
.ss4 5
Enumss5 9
.ss9 :
Parsess: ?
(ss? @
typeofss@ F
(ssF G
ChannelTypessG R
)ssR S
,ssS T
xssU V
)ssV W
)ssW X
.ssX Y
ToListssY _
(ss_ `
)ss` a
;ssa b
varuu 
proDatauu 
=uu 
VendorsListuu %
.uu% &
FirstOrDefaultuu& 4
(uu4 5
xuu5 6
=>uu7 9
xuu: ;
.uu; <
Textuu< @
.uu@ A
ToLowerInvariantuuA Q
(uuQ R
)uuR S
.uuS T
ContainsuuT \
(uu\ ]
$struu] b
)uub c
)uuc d
;uud e
ViewBagvv 
.vv 
Vendorvv 
=vv 
newvv  

SelectListvv! +
(vv+ ,
VendorsListvv, 7
,vv7 8
$strvv9 @
,vv@ A
$strvvB H
,vvH I
proDatavvJ Q
)vvQ R
;vvR S
ViewBagww 
.ww 

WhiteLabelww 
=ww  
newww! $

SelectListww% /
(ww/ 0

,ww= >
$strww? F
,wwF G
$strwwH N
,wwN O
campaignApprovedVmwwP b
.wwb c

WhiteLabelwwc m
)wwm n
;wwn o
returnxx 
Viewxx 
(xx 
campaignApprovedVmxx *
)xx* +
;xx+ ,
}yy 	
[{{ 	
HttpPost{{	 
]{{ 
[|| 	$
ValidateAntiForgeryToken||	 !
]||! "
public}} 
ActionResult}} 
EditApproved}} (
(}}( )
[}}) *
Bind}}* .
(}}. /
Include}}/ 6
=}}7 8
$str	}}9 �
)
}}� �
]
}}� � 
CampaignApprovedVM
}}� � 
campaignApprovedVm
}}� �
)
}}� �
{~~ 	
if 
( 

ModelState 
. 
IsValid "
)" #
{
�� 

TinyMapper
�� 
.
�� 
Bind
�� 
<
��   
CampaignApprovedVM
��  2
,
��2 3
CampaignApproved
��4 D
>
��D E
(
��E F
config
��F L
=>
��M O
{
�� 
config
�� 
.
�� 
Ignore
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
ChannelTypes
��) 5
)
��5 6
;
��6 7
config
�� 
.
�� 
Ignore
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
Assets
��) /
)
��/ 0
;
��0 1
config
�� 
.
�� 
Ignore
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
Segments
��) 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
var
�� 
campaignApproved
�� $
=
��% &

TinyMapper
��' 1
.
��1 2
Map
��2 5
<
��5 6
CampaignApproved
��6 F
>
��F G
(
��G H 
campaignApprovedVm
��H Z
)
��Z [
;
��[ \
campaignApproved
��  
.
��  !
ChannelTypes
��! -
=
��. / 
campaignApprovedVm
��0 B
.
��B C
ChannelTypes
��C O
==
��P R
null
��S W
?
��X Y
null
��Z ^
:
��_ `
string
�� 
.
�� 
Join
�� 
(
��  
$str
��  #
,
��# $ 
campaignApprovedVm
��% 7
.
��7 8
ChannelTypes
��8 D
)
��D E
;
��E F
Db
�� 
.
�� 
Entry
�� 
(
�� 
campaignApproved
�� )
)
��) *
.
��* +
State
��+ 0
=
��1 2
EntityState
��3 >
.
��> ?
Modified
��? G
;
��G H
Db
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
��  !
var
�� 
campaignAssets
�� "
=
��# $
Db
��% '
.
��' (
CampaignAssets
��( 6
.
��6 7
FirstOrDefault
��7 E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M

CampaignId
��M W
==
��X Z 
campaignApprovedVm
��[ m
.
��m n

CampaignId
��n x
)
��x y
;
��y z
campaignAssets
�� 
.
�� 

�� ,
=
��- . 
campaignApprovedVm
��/ A
.
��A B
Assets
��B H
.
��H I

��I V
;
��V W
campaignAssets
�� 
.
�� 
CreativeUrl
�� *
=
��+ , 
campaignApprovedVm
��- ?
.
��? @
Assets
��@ F
.
��F G
CreativeUrl
��G R
;
��R S
campaignAssets
�� 
.
�� 
ZipCodeFile
�� *
=
��+ , 
campaignApprovedVm
��- ?
.
��? @
Assets
��@ F
.
��F G
ZipCodeFile
��G R
;
��R S
campaignAssets
�� 
.
�� 

ZipCodeUrl
�� )
=
��* + 
campaignApprovedVm
��, >
.
��> ?
Assets
��? E
.
��E F

ZipCodeUrl
��F P
;
��P Q
campaignAssets
�� 
.
�� 
TestSeedFile
�� +
=
��, - 
campaignApprovedVm
��. @
.
��@ A
Assets
��A G
.
��G H
TestSeedFile
��H T
;
��T U
campaignAssets
�� 
.
�� 
LiveSeedFile
�� +
=
��, - 
campaignApprovedVm
��. @
.
��@ A
Assets
��A G
.
��G H
LiveSeedFile
��H T
;
��T U
Db
�� 
.
�� 
Entry
�� 
(
�� 
campaignAssets
�� '
)
��' (
.
��( )
State
��) .
=
��/ 0
EntityState
��1 <
.
��< =
Modified
��= E
;
��E F
Db
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
��  !
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
��& I
;
��I J
}
�� 
else
�� 
{
�� 
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
�� 
var
�� 
proData
�� 
=
�� 
VendorsList
�� %
.
��% &
FirstOrDefault
��& 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Text
��< @
.
��@ A
Contains
��A I
(
��I J
$str
��J O
)
��O P
)
��P Q
;
��Q R
ViewBag
�� 
.
�� 
Vendor
�� 
=
�� 
new
��  

SelectList
��! +
(
��+ ,
VendorsList
��, 7
,
��7 8
$str
��9 @
,
��@ A
$str
��B H
,
��H I
proData
��J Q
)
��Q R
;
��R S
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
,
��N O 
campaignApprovedVm
��P b
.
��b c

WhiteLabel
��c m
)
��m n
;
��n o
return
�� 
View
�� 
(
��  
campaignApprovedVm
�� *
)
��* +
;
��+ ,
}
�� 	
public
�� 
ActionResult
�� 
CompleteSegment
�� +
(
��+ ,
Guid
��, 0
?
��0 1
id
��2 4
)
��4 5
{
�� 	
try
�� 
{
�� 
var
�� 
segment
�� 
=
�� 
Db
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
id
��N P
)
��P Q
;
��Q R
segment
�� 
.
�� 

�� %
=
��& '
(
��( )
int
��) ,
)
��, -

��- :
.
��: ;
Complete
��; C
;
��C D
segment
�� 
.
�� 
DateComplete
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
Db
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
�� 
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
�� 
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
�� 
}
�� 	
public
�� 
ActionResult
�� 
SendToVendor
�� (
(
��( )
Guid
��) -
?
��- .
vendorId
��/ 7
,
��7 8
Guid
��9 =
?
��= >
id
��? A
,
��A B
string
��C I
[
��I J
]
��J K
segmentsSelected
��L \
)
��\ ]
{
�� 	
try
�� 
{
�� 
Campaign
�� 
campaign
�� !
=
��" #
Db
��$ &
.
��& '
	Campaigns
��' 0
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
��I J
FirstOrDefault
��J X
(
��X Y
x
��Y Z
=>
��[ ]
x
��^ _
.
��_ `
Id
��` b
==
��c e
id
��f h
)
��h i
;
��i j
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
�� 
AdsException
�� *
(
��* +
$str
��+ ?
+
��@ A
id
��B D
+
��E F
$str
��G T
)
��T U
;
��U V
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
�� 
AdsException
�� *
(
��* +
$str
��+ 7
+
��8 9
campaign
��: B
.
��B C
CampaignName
��C O
+
��P Q
$str
��R i
)
��i j
;
��j k
}
�� 

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
vendorId
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
segmentsSelected
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
�� 
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
�� 
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
�� 
}
�� 	
public
�� 
ActionResult
�� 

SendViaApi
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
�� 	
try
�� 
{
�� 
Campaign
�� 
campaign
�� !
=
��" #
Db
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
id
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
�� 
AdsException
�� *
(
��* +
$str
��+ ?
+
��@ A
id
��B D
+
��E F
$str
��G T
)
��T U
;
��U V
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
�� 
AdsException
�� *
(
��* +
$str
��+ 7
+
��8 9
campaign
��: B
.
��B C
CampaignName
��C O
+
��P Q
$str
��R i
)
��i j
;
��j k
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
��@ A
string
�� 

whiteLabel
�� !
=
��" #
string
��$ *
.
��* +

��+ 8
(
��8 9
LoggedInUser
��9 E
?
��E F
.
��F G

WhiteLabel
��G Q
)
��Q R
?
��S T
$str
��U Y
:
��Z [
LoggedInUser
��\ h
?
��h i
.
��i j

WhiteLabel
��j t
;
��t u
string
�� 
whiteLabelDomain
�� '
=
��( )

��* 7
.
��7 8
FirstOrDefault
��8 F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Value
��N S
==
��T V

whiteLabel
��W a
)
��a b
?
��b c
.
��c d
Text
��d h
.
��h i
Split
��i n
(
��n o
$str
��o r
.
��r s
ToCharArray
��s ~
(
��~ 
)�� �
)��� �
.��� �

(��� �
)��� �
?��� �
.��� �
Trim��� �
(��� �
)��� �
;��� �
var
�� 
response
�� 
=
�� 
ProDataApiManager
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
,
��I J
whiteLabelDomain
��K [
)
��[ \
;
��\ ]
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
ProDataApiManager
��' 8
.
��8 9
Success
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
Db
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

��a n
==
��o q
(
��r s
segment
��s z
!=
��{ }
null��~ �
?��� �
segment��� �
.��� �

:��� �
null��� �
)��� �
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

�� )
=
��* +
segment
��, 3
?
��3 4
.
��4 5

��5 B
,
��B C
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
Db
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
Db
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
�� 
{
�� 

�� !
message
��" )
=
��* +
new
��, /

��0 =
(
��= >
response
��> F
.
��F G
message
��G N
)
��N O
;
��O P
foreach
�� 
(
�� 
var
��  
field
��! &
in
��' )
response
��* 2
.
��2 3
error_fields
��3 ?
)
��? @
{
�� 
message
�� 
.
��  
Append
��  &
(
��& '
$"
��' )
<br/>
��) .
{
��. /
field
��/ 4
}
��4 5
"
��5 6
)
��6 7
;
��7 8
}
�� 
throw
�� 
new
�� 
AdsException
�� *
(
��* +
message
��+ 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
)
��= >
;
��> ?
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
�� 
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
�� 
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
�� 
}
�� 	
}
�� 
}�� ��
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\BaseController.cs
	namespace
WFP
 
.
ICT
.
Web
.
Controllers
{ 
public 

class 
BaseController 
:  !

Controller" ,
{ 
	protected 
readonly 
Random !
Random" (
=) *
new+ .
Random/ 5
(5 6
)6 7
;7 8
	protected 
const 
int 
PageSize $
=% &
$num' )
;) *
private 

_db !
;! "
	protected 

Db  "
{ 	
get 
{ 
if 
( 
_db 
!= 
null 
)  
return! '
_db( +
;+ ,
_db 
= 
HttpContext !
.! "
GetOwinContext" 0
(0 1
)1 2
.2 3
Get3 6
<6 7

>D E
(E F
)F G
;G H
return 
_db 
; 
} 
private 
set 
{ 
_db 
= 
value 
; 
}   
}!! 	
public## 
void## 
SetupLoggedInUser## %
(##% &
string##& ,
userName##- 5
)##5 6
{$$ 	
var%% 
user%% 
=%% 
Db%% 
.%% 
Users%% 
.%%  
Include%%  '
(%%' (
u%%( )
=>%%* ,
u%%- .
.%%. /
Roles%%/ 4
)%%4 5
.%%5 6
FirstOrDefault%%6 D
(%%D E
x%%E F
=>%%G I
x%%J K
.%%K L
UserName%%L T
==%%U W
userName%%X `
)%%` a
;%%a b
Session&& 
[&& 
$str&& 
]&& 
=&& 
user&& "
;&&" #
}'' 	
	protected)) 
WfpUser)) 
LoggedInUser)) &
{** 	
get++ 
{,, 
return-- 
Session-- 
[-- 
$str-- %
]--% &
as--' )
WfpUser--* 1
;--1 2
}.. 
}// 	
	protected11 
bool11 
IsAdmin11 
{22 	
get33 
{44 
return55 
LoggedInUser55 #
!=55$ &
null55' +
&&55, .
(55/ 0
LoggedInUser550 <
.55< =
UserType55= E
==55F H
(55I J
int55J M
)55M N
UserType55N V
.55V W
Admin55W \
)55\ ]
;55] ^
}66 
}77 	
readonly99 
string99 
_uploadPath99 #
=99$ %
$"99& (
	~/Uploads99( 1
"991 2
;992 3
	protected:: 
string:: 

UploadPath:: #
{;; 	
get<< 
{== 
string>> 

uploadPath>> !
=>>" #
Server>>$ *
.>>* +
MapPath>>+ 2
(>>2 3
_uploadPath>>3 >
)>>> ?
;>>? @
if?? 
(?? 
!?? 
System?? 
.?? 
IO?? 
.?? 
	Directory?? (
.??( )
Exists??) /
(??/ 0

uploadPath??0 :
)??: ;
)??; <
System??= C
.??C D
IO??D F
.??F G
	Directory??G P
.??P Q
CreateDirectory??Q `
(??` a

uploadPath??a k
)??k l
;??l m
return@@ 

uploadPath@@ !
;@@! "
}AA 
}BB 	
readonlyDD 
stringDD 

=DD& '
$"DD( *
~/DownloadsDD* 5
"DD5 6
;DD6 7
	protectedEE 
stringEE 
DownloadPathEE %
{FF 	
getGG 
{HH 
stringII 
downloadPathII #
=II$ %
ServerII& ,
.II, -
MapPathII- 4
(II4 5

)IIB C
;IIC D
ifJJ 
(JJ 
!JJ 
SystemJJ 
.JJ 
IOJJ 
.JJ 
	DirectoryJJ (
.JJ( )
ExistsJJ) /
(JJ/ 0
downloadPathJJ0 <
)JJ< =
)JJ= >
SystemJJ? E
.JJE F
IOJJF H
.JJH I
	DirectoryJJI R
.JJR S
CreateDirectoryJJS b
(JJb c
downloadPathJJc o
)JJo p
;JJp q
returnKK 
downloadPathKK #
;KK# $
}LL 
}MM 	
readonlyOO 
stringOO 
_imagesPathOO #
=OO$ %
$"OO& (
~/imagesOO( 0
"OO0 1
;OO1 2
	protectedPP 
stringPP 

ImagesPathPP #
{QQ 	
getRR 
{SS 
returnTT 
ServerTT 
.TT 
MapPathTT %
(TT% &
_imagesPathTT& 1
)TT1 2
;TT2 3
}UU 
}VV 	
	protectedXX 

SelectListXX 

StatusListXX '
{YY 	
getZZ 
{[[ 
var\\ 
items\\ 
=\\ 

EnumHelper\\ &
.\\& '
GetEnumTextValues\\' 8
(\\8 9
typeof\\9 ?
(\\? @
CampaignStatus\\@ N
)\\N O
)\\O P
.]] 
Select]] 
(]] 
x]] 
=>]]  
new]]! $
SelectListItem]]% 3
(]]3 4
)]]4 5
{^^ 
Text__ 
=__ 
x__  
.__  !
Text__! %
,__% &
Value`` 
=`` 
x``  !
.``! "
Value``" '
}aa 
)aa 
.aa 
ToListaa 
(aa 
)aa 
;aa  
itemsbb 
.bb 
Insertbb 
(bb 
$numbb 
,bb 
newbb  #
SelectListItembb$ 2
(bb2 3
)bb3 4
{cc 
Textdd 
=dd 
$strdd *
,dd* +
Valueee 
=ee 
stringee "
.ee" #
Emptyee# (
}ff 
)ff 
;ff 
returngg 
newgg 

SelectListgg %
(gg% &
itemsgg& +
,gg+ ,
$strgg- 4
,gg4 5
$strgg6 <
)gg< =
;gg= >
}hh 
}ii 	
	protectedkk 
IEnumerablekk 
<kk 
SelectListItemkk ,
>kk, -
ReportTemplateskk. =
{ll 	
getmm 
{nn 
varoo 
itemsoo 
=oo 

EnumHelperoo &
.oo& '
GetEnumTextValuesoo' 8
(oo8 9
typeofoo9 ?
(oo? @
ReportTemplateoo@ N
)ooN O
)ooO P
.pp 
Selectpp 
(pp 
xpp 
=>pp  
newpp! $
SelectListItempp% 3
(pp3 4
)pp4 5
{qq 
Textrr 
=rr 
xrr  
.rr  !
Textrr! %
,rr% &
Valuess 
=ss 
xss  !
.ss! "
Valuess" '
}tt 
)tt 
.tt 
ToListtt 
(tt 
)tt 
;tt  
itemsuu 
.uu 
Insertuu 
(uu 
$numuu 
,uu 
newuu  #
SelectListItemuu$ 2
(uu2 3
)uu3 4
{vv 
Textww 
=ww 
$strww ,
,ww, -
Valuexx 
=xx 
stringxx "
.xx" #
Emptyxx# (
}yy 
)yy 
;yy 
returnzz 
itemszz 
;zz 
}{{ 
}|| 	
public~~ 
IEnumerable~~ 
<~~ 
SelectListItem~~ )
>~~) *

MonthsList~~+ 5
{ 	
get
�� 
{
�� 
var
�� 
months
�� 
=
�� 
new
��  
List
��! %
<
��% &
SelectListItem
��& 4
>
��4 5
(
��5 6
)
��6 7
;
��7 8
for
�� 
(
�� 
int
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #
$num
��$ &
;
��& '
i
��( )
++
��) +
)
��+ ,
{
�� 
months
�� 
.
�� 
Add
�� 
(
�� 
new
�� "
SelectListItem
��# 1
(
��1 2
)
��2 3
{
�� 
Text
�� 
=
�� 
CultureInfo
�� *
.
��* +
CurrentCulture
��+ 9
.
��9 :
DateTimeFormat
��: H
.
��H I
GetMonthName
��I U
(
��U V
i
��V W
+
��X Y
$num
��Z [
)
��[ \
,
��\ ]
Value
�� 
=
�� 
i
��  !
.
��! "
ToString
��" *
(
��* +
)
��+ ,
}
�� 
)
�� 
;
�� 
}
�� 
months
�� 
.
�� 
Insert
�� 
(
�� 
$num
�� 
,
��  
new
��! $
SelectListItem
��% 3
(
��3 4
)
��4 5
{
�� 
Text
�� 
=
�� 
$str
�� )
,
��) *
Value
�� 
=
�� 
string
�� "
.
��" #
Empty
��# (
}
�� 
)
�� 
;
�� 
return
�� 
months
�� 
;
�� 
}
�� 
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
��* +
_users
��, 2
;
��2 3
	protected
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� ,
>
��, -
	UsersList
��. 7
{
�� 	
get
�� 
{
�� 
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
Db
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
�� 
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
�� 
List
�� 
<
�� 
SelectListItem
�� #
>
��# $

��% 2
;
��2 3
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
�� 
if
�� 
(
�� 

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

�� !
=
��" #
Db
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

�� $
;
��$ %
}
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 

�� )
;
��) *
	protected
�� 
static
�� 
bool
�� 
ForceVendors
�� *
{
�� 	
get
�� 
{
�� 
return
�� 

�� &
;
��& '
}
��( )
set
�� 
{
�� 

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
�� 
List
�� 
<
�� 
SelectListItem
�� #
>
��# $
_vendors
��% -
;
��- .
	protected
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� ,
>
��, -
VendorsList
��. 9
{
�� 	
get
�� 
{
�� 
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

��( 5
)
��5 6
{
�� 
_vendors
�� 
=
�� 
Db
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
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
_forceCustomers
�� +
;
��+ ,
	protected
�� 
static
�� 
bool
�� 
ForceCustomers
�� ,
{
�� 	
get
�� 
{
�� 
return
�� 
_forceCustomers
�� (
;
��( )
}
��* +
set
�� 
{
�� 
_forceCustomers
�� !
=
��" #
value
��$ )
;
��) *
}
��+ ,
}
�� 	
private
�� 
List
�� 
<
�� 
SelectListItem
�� #
>
��# $

_customers
��% /
;
��/ 0
	protected
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� ,
>
��, -

��. ;
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 

_customers
�� 
==
�� !
null
��" &
||
��' )
_forceCustomers
��* 9
)
��9 :
{
�� 

_customers
�� 
=
��  
Db
��! #
.
��# $
	Customers
��$ -
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
+
��/ 0
$str
��1 6
+
��7 8
x
��9 :
.
��: ;
	WebDomain
��; D
,
��D E
Value
��! &
=
��' (
x
��) *
.
��* +
Code
��+ /
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
��( )

_customers
�� 
.
�� 
Insert
�� %
(
��% &
$num
��& '
,
��' (
new
��) ,
SelectListItem
��- ;
(
��; <
)
��< =
{
�� 
Text
�� 
=
�� 
$str
�� 0
,
��0 1
Value
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 

_customers
�� !
;
��! "
}
�� 
}
�� 	
private
�� 
List
�� 
<
�� 
SelectListItem
�� #
>
��# $
_claimTypes
��% 0
;
��0 1
public
�� 
IEnumerable
�� 
<
�� 
SelectListItem
�� )
>
��) *

ClaimTypes
��+ 5
{
�� 	
get
�� 
{
�� 
if
�� 
(
�� 
_claimTypes
�� 
==
��  "
null
��# '
)
��' (
{
�� 
var
�� 
mgr
�� 
=
�� 
new
�� !!
AspNetClaimsManager
��" 5
(
��5 6
)
��6 7
;
��7 8
_claimTypes
�� 
=
��  !
mgr
��" %
.
��% &
GetAll
��& ,
(
��, -
)
��- .
.
��. /
Select
��/ 5
(
��5 6
x
�� 
=>
�� 
new
�� 
SelectListItem
�� +
(
��+ ,
)
��, -
{
�� 
Text
�� 
=
�� 
x
��  
.
��  !
	ClaimType
��! *
,
��* +
Value
�� 
=
�� 
x
��  !
.
��! "
	ClaimType
��" +
}
�� 
)
�� 
.
�� 
Distinct
�� 
(
��  
)
��  !
.
��! "
ToList
��" (
(
��( )
)
��) *
;
��* +
_claimTypes
�� 
.
��  
Insert
��  &
(
��& '
$num
��' (
,
��( )
new
��* -
SelectListItem
��. <
(
��< =
)
��= >
{
�� 
Text
�� 
=
�� 
$str
�� 0
,
��0 1
Value
�� 
=
�� 
string
��  &
.
��& '
Empty
��' ,
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
_claimTypes
�� "
;
��" #
}
�� 
}
�� 	
}
�� 
}�� �
OE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\NotificationController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{ 
[		 
	Authorize		 
]		 
public

 

class

 "
NotificationController

 '
:

( )
BaseController

* 8
{ 
public
ActionResult
Index
(
CampaignSearchVM
sc
)
{ 	
var 

= 
Db  "
." #

.0 1
Where1 6
(6 7
x7 8
=>9 ;
x< =
.= >
Status> D
==E G
(H I
intI L
)L M
NotificationStatusM _
._ `
Found` e
)e f
.f g
ToListg m
(m n
)n o
;o p
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

.% &
ToPagedList& 1
(1 2

pageNumber2 <
,< =
PageSize> F
)F G
)G H
;H I
} 	
}
�� 
}�� ��
IE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\StatusController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{
[ 
	Authorize 
] 
public 

class 
StatusController !
:" #
BaseController$ 2
{ 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
if 
( 
! 
string 
. 

(% &
sc& (
.( )
clearSessionId) 7
)7 8
)8 9
{ 
Session 
[ 
$str 
] 
= 
null  $
;$ %
sc 
. 
basicString 
=  
string! '
.' (
Empty( -
;- .
} 
ViewBag 
. 
CurrentSort 
=  !
sc" $
.$ %
	sortOrder% .
;. /
ViewBag 
.  
CampaignNameSortParm (
=) *
sc+ -
.- .
	sortOrder. 7
==8 :
$str; I
?J K
$strL _
:` a
$strb p
;p q
ViewBag 
. !
BroadcastDateSortParm )
=* +
sc, .
.. /
	sortOrder/ 8
==9 ;
$str< K
?L M
$strN b
:c d
$stre t
;t u
ViewBag 
. 
CreatedBySortParm %
=& '
sc( *
.* +
	sortOrder+ 4
==5 7
$str8 C
?D E
$strF V
:W X
$strY d
;d e
ViewBag 
. 
StatusSortParm "
=# $
sc% '
.' (
	sortOrder( 1
==2 4
$str5 =
?> ?
$str@ M
:N O
$strP X
;X Y
ViewBag 
. 
OrderNumberSortParm '
=( )
sc* ,
., -
	sortOrder- 6
==7 9
$str: G
?H I
$strJ \
:] ^
$str_ l
;l m
var!! 
	campagins!! 
=!! 
Db!! 
.!! 
	Campaigns!! (
."" 
Include"" 
("" 
x"" 
=>"" 
x"" 
.""  
Testing""  '
)""' (
.## 
Include## 
(## 
x## 
=>## 
x## 
.##  
Approved##  (
)##( )
.$$ 
Include$$ 
($$ 
x$$ 
=>$$ 
x$$ 
.$$  
	Trackings$$  )
)$$) *
.%% 
ToList%% 
(%% 
)%% 
;%% 
switch'' 
('' 
sc'' 
.'' 
	sortOrder''  
)''  !
{(( 
case)) 
$str)) #
:))# $
	campagins** 
=** 
	campagins**  )
.**) *
OrderBy*** 1
(**1 2
s**2 3
=>**4 6
s**7 8
.**8 9
CampaignName**9 E
)**E F
.**F G
ToList**G M
(**M N
)**N O
;**O P
break++ 
;++ 
case,, 
$str,, (
:,,( )
	campagins-- 
=-- 
	campagins--  )
.--) *
OrderByDescending--* ;
(--; <
s--< =
=>--> @
s--A B
.--B C
CampaignName--C O
)--O P
.--P Q
ToList--Q W
(--W X
)--X Y
;--Y Z
break.. 
;.. 
case// 
$str// $
://$ %
	campagins00 
=00 
	campagins00  )
.00) *
OrderBy00* 1
(001 2
s002 3
=>004 6
s007 8
.008 9

)00F G
.00G H
ToList00H N
(00N O
)00O P
;00P Q
break11 
;11 
case22 
$str22 )
:22) *
	campagins33 
=33 
	campagins33  )
.33) *
OrderByDescending33* ;
(33; <
s33< =
=>33> @
s33A B
.33B C

)33P Q
.33Q R
ToList33R X
(33X Y
)33Y Z
;33Z [
break44 
;44 
case55 
$str55  
:55  !
	campagins66 
=66 
	campagins66  )
.66) *
OrderBy66* 1
(661 2
s662 3
=>664 6
s667 8
.668 9
	CreatedBy669 B
)66B C
.66C D
ToList66D J
(66J K
)66K L
;66L M
break77 
;77 
case88 
$str88 %
:88% &
	campagins99 
=99 
	campagins99  )
.99) *
OrderByDescending99* ;
(99; <
s99< =
=>99> @
s99A B
.99B C
	CreatedBy99C L
)99L M
.99M N
ToList99N T
(99T U
)99U V
;99V W
break:: 
;:: 
case;; 
$str;; 
:;; 
	campagins<< 
=<< 
	campagins<<  )
.<<) *
OrderBy<<* 1
(<<1 2
s<<2 3
=><<4 6
s<<7 8
.<<8 9
Status<<9 ?
)<<? @
.<<@ A
ToList<<A G
(<<G H
)<<H I
;<<I J
break== 
;== 
case>> 
$str>> "
:>>" #
	campagins?? 
=?? 
	campagins??  )
.??) *
OrderByDescending??* ;
(??; <
s??< =
=>??> @
s??A B
.??B C
Status??C I
)??I J
.??J K
ToList??K Q
(??Q R
)??R S
;??S T
break@@ 
;@@ 
caseAA 
$strAA "
:AA" #
	campaginsBB 
=BB 
	campaginsBB  )
.BB) *
OrderByBB* 1
(BB1 2
sBB2 3
=>BB4 6
sBB7 8
.BB8 9
OrderNumberBB9 D
)BBD E
.BBE F
ToListBBF L
(BBL M
)BBM N
;BBN O
breakCC 
;CC 
caseDD 
$strDD '
:DD' (
	campaginsEE 
=EE 
	campaginsEE  )
.EE) *
OrderByDescendingEE* ;
(EE; <
sEE< =
=>EE> @
sEEA B
.EEB C
OrderNumberEEC N
)EEN O
.EEO P
ToListEEP V
(EEV W
)EEW X
;EEX Y
breakFF 
;FF 
defaultGG 
:GG 
	campaginsHH 
=HH 
	campaginsHH  )
.HH) *
OrderByDescendingHH* ;
(HH; <
sHH< =
=>HH> @
sHHA B
.HHB C
	CreatedAtHHC L
)HHL M
.HHM N
ToListHHN T
(HHT U
)HHU V
;HHV W
breakII 
;II 
}JJ 
ViewBagLL 
.LL 

SearchTypeLL 
=LL  
scLL! #
.LL# $

searchTypeLL$ .
;LL. /
ifMM 
(MM 
scMM 
.MM 

searchTypeMM 
==MM  
$strMM! (
)MM( )
{NN 
ifOO 
(OO 
!OO 
stringOO 
.OO 

(OO) *
scOO* ,
.OO, -
basicStringOO- 8
)OO8 9
)OO9 :
{PP 
	campaginsQQ 
=QQ 
	campaginsQQ  )
.QQ) *
WhereQQ* /
(QQ/ 0
sQQ0 1
=>QQ2 4
sRR 
.RR 
OrderNumberRR !
.RR! "
EqualsRR" (
(RR( )
scRR) +
.RR+ ,
basicStringRR, 7
)RR7 8
||RR9 ;
sSS 
.SS $
ReBroadcastedOrderNumberSS .
==SS/ 1
scSS2 4
.SS4 5
basicStringSS5 @
||SSA C
sTT 
.TT 
CampaignNameTT "
.TT" #
IndexOfTT# *
(TT* +
scTT+ -
.TT- .
basicStringTT. 9
,TT9 :
StringComparisonTT; K
.TTK L&
InvariantCultureIgnoreCaseTTL f
)TTf g
>=TTh j
$numTTk l
)TTl m
.TTm n
ToListTTn t
(TTt u
)TTu v
;TTv w
ViewBagUU 
.UU 
BasicStringSearchedUU /
=UU0 1
scUU2 4
.UU4 5
basicStringUU5 @
;UU@ A
}VV 
elseWW 
ifWW 
(WW 
!WW 
stringWW  
.WW  !

(WW. /
scWW/ 1
.WW1 2
basicStatusWW2 =
)WW= >
)WW> ?
{XX 
intYY 
statusYY 
=YY  
intYY! $
.YY$ %
ParseYY% *
(YY* +
scYY+ -
.YY- .
basicStatusYY. 9
)YY9 :
;YY: ;
ifZZ 
(ZZ 
statusZZ 
==ZZ !
(ZZ" #
intZZ# &
)ZZ& '
CampaignStatusZZ' 5
.ZZ5 6

)ZZC D
	campagins[[ !
=[[" #
	campagins[[$ -
.[[- .
Where[[. 3
([[3 4
s[[4 5
=>[[6 8
s[[9 :
.[[: ;

)[[H I
.[[I J
ToList[[J P
([[P Q
)[[Q R
;[[R S
else\\ 
if\\ 
(\\ 
status\\ #
==\\$ &
(\\' (
int\\( +
)\\+ ,
CampaignStatus\\, :
.\\: ;
NotRebroadcasted\\; K
)\\K L
	campagins]] !
=]]" #
	campagins]]$ -
.]]- .
Where]]. 3
(]]3 4
s]]4 5
=>]]6 8
s]]9 :
.]]: ;
ReBroadCast]]; F
&&]]G I
!]]J K
s]]K L
.]]L M

)]]Z [
.]][ \
ToList]]\ b
(]]b c
)]]c d
;]]d e
else^^ 
	campagins__ !
=__" #
	campagins__$ -
.__- .
Where__. 3
(__3 4
s__4 5
=>__6 8
s__9 :
.__: ;
Status__; A
==__B D
status__E K
)__K L
.__L M
ToList__M S
(__S T
)__T U
;__U V
ViewBag`` 
.`` 
BasicStatusSearched`` /
=``0 1
sc``2 4
.``4 5
basicStatus``5 @
;``@ A
}aa 
elsebb 
ifbb 
(bb 
!bb 
stringbb  
.bb  !

(bb. /
scbb/ 1
.bb1 2
basicOrderNumberbb2 B
)bbB C
)bbC D
{cc 
	campaginsdd 
=dd 
	campaginsdd  )
.dd) *
Wheredd* /
(dd/ 0
sdd0 1
=>dd2 4
sdd5 6
.dd6 7
Iddd7 9
.dd9 :
ToStringdd: B
(ddB C
)ddC D
.ddD E
EqualsddE K
(ddK L
scddL N
.ddN O
basicOrderNumberddO _
)dd_ `
)dd` a
.dda b
ToListddb h
(ddh i
)ddi j
;ddj k
}ee 
}ff 
elsegg 
ifgg 
(gg 
scgg 
.gg 

searchTypegg "
==gg# %
$strgg& 0
)gg0 1
{hh 
ifii 
(ii 
!ii 
stringii 
.ii 

(ii) *
scii* ,
.ii, -
advancedStatusii- ;
)ii; <
)ii< =
{jj 
intkk 
statuskk 
=kk  
intkk! $
.kk$ %
Parsekk% *
(kk* +
sckk+ -
.kk- .
advancedStatuskk. <
)kk< =
;kk= >
ifll 
(ll 
statusll 
==ll !
(ll" #
intll# &
)ll& '
CampaignStatusll' 5
.ll5 6

)llC D
	campaginsmm !
=mm" #
	campaginsmm$ -
.mm- .
Wheremm. 3
(mm3 4
smm4 5
=>mm6 8
smm9 :
.mm: ;
OrderNumbermm; F
.mmF G
EndsWithmmG O
(mmO P
$strmmP U
)mmU V
)mmV W
.mmW X
ToListmmX ^
(mm^ _
)mm_ `
;mm` a
elsenn 
	campaginsoo !
=oo" #
	campaginsoo$ -
.oo- .
Whereoo. 3
(oo3 4
soo4 5
=>oo6 8
soo9 :
.oo: ;
Statusoo; A
==ooB D
statusooE K
)ooK L
.ooL M
ToListooM S
(ooS T
)ooT U
;ooU V
ViewBagpp 
.pp "
AdvancedStatusSearchedpp 2
=pp3 4
scpp5 7
.pp7 8
advancedStatuspp8 F
;ppF G
}qq 
ifrr 
(rr 
!rr 
stringrr 
.rr 

(rr) *
scrr* ,
.rr, -
advancedUserrr- 9
)rr9 :
)rr: ;
{ss 
	campaginstt 
=tt 
	campaginstt  )
.tt) *
Wherett* /
(tt/ 0
stt0 1
=>tt2 4
stt5 6
.tt6 7
	CreatedBytt7 @
==ttA C
scttD F
.ttF G
advancedUserttG S
)ttS T
.ttT U
ToListttU [
(tt[ \
)tt\ ]
;tt] ^
ViewBaguu 
.uu  
AdvancedUserSearcheduu 0
=uu1 2
scuu3 5
.uu5 6
advancedUseruu6 B
;uuB C
}vv 
ifxx 
(xx 
!xx 
stringxx 
.xx 

(xx) *
scxx* ,
.xx, -
campaignNamexx- 9
)xx9 :
)xx: ;
{yy 
sczz 
.zz 
campaignNamezz #
=zz$ %
sczz& (
.zz( )
campaignNamezz) 5
.zz5 6
ToLowerInvariantzz6 F
(zzF G
)zzG H
;zzH I
	campagins{{ 
={{ 
	campagins{{  )
.{{) *
Where{{* /
({{/ 0
s{{0 1
=>{{2 4
s{{5 6
.{{6 7
CampaignName{{7 C
.{{C D
IndexOf{{D K
({{K L
sc{{L N
.{{N O
campaignName{{O [
,{{[ \
StringComparison{{] m
.{{m n%
CurrentCultureIgnoreCase	{{n �
)
{{� �
>=
{{� �
$num
{{� �
)
{{� �
.
{{� �
ToList
{{� �
(
{{� �
)
{{� �
;
{{� �
ViewBag|| 
.|| 
CampaignName|| (
=||) *
sc||+ -
.||- .
campaignName||. :
;||: ;
}}} 
if 
( 
! 
string 
. 

() *
sc* ,
., -
isTested- 5
)5 6
)6 7
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

�� )
(
��) *
sc
��* ,
.
��, -

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

�� )
=
��* +
sc
��, .
.
��. /

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
�� 
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
�� 
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
�� 
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
PageSize
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
Db
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
�� 
throw
�� 
new
�� 

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
�� 
try
�� 
{
�� 
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
Db
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
�� 
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
�� 
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
�� 
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
id
��1 3
,
��3 4
string
��5 ;

��< I
,
��I J
string
��K Q
ioNumber
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
Db
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
id
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
�� 
throw
�� 
new
�� 

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
�� 
try
�� 
{
�� 
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

�� '
(
��' (

��( 5
)
��5 6
)
��6 7
campaignTracking
�� $
=
��% &
Db
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
id
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
Db
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
id
��` b
&&
��c e
x
��f g
.
��g h

��h u
==
��v x

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
IoNumber
��% -
=
��. /
ioNumber
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
Db
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
�� 
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
�� 
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
�� 
}
�� 	
}
�� 
}�� ��
LE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CampaignsController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
CampaignsController $
:% &
BaseController' 5
{ 
private 
static 
char 
c1 
; 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
if 
( 
LoggedInUser 
== 
null  $
)$ %
return& ,
RedirectToAction- =
(= >
$str> F
,F G
$strH Q
)Q R
;R S
ViewBag!! 
.!! 
CurrentSort!! 
=!!  !
sc!!" $
.!!$ %
	sortOrder!!% .
;!!. /
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
;""l m
ViewBag## 
.##  
CampaignNameSortParm## (
=##) *
sc##+ -
.##- .
	sortOrder##. 7
==##8 :
$str##; I
?##J K
$str##L _
:##` a
$str##b p
;##p q
ViewBag$$ 
.$$ 
CreatedBySortParm$$ %
=$$& '
sc$$( *
.$$* +
	sortOrder$$+ 4
==$$5 7
$str$$8 C
?$$D E
$str$$F V
:$$W X
$str$$Y d
;$$d e
ViewBag%% 
.%% 
CreatedAtSortParm%% %
=%%& '
sc%%( *
.%%* +
	sortOrder%%+ 4
==%%5 7
$str%%8 C
?%%D E
$str%%F V
:%%W X
$str%%Y d
;%%d e
ViewBag&& 
.&& !
BroadcastDateSortParm&& )
=&&* +
sc&&, .
.&&. /
	sortOrder&&/ 8
==&&9 ;
$str&&< K
?&&L M
$str&&N b
:&&c d
$str&&e t
;&&t u
ViewBag'' 
.'' 
QuantitySortParm'' $
=''% &
sc''' )
.'') *
	sortOrder''* 3
==''4 6
$str''7 A
?''B C
$str''D S
:''T U
$str''V `
;''` a
ViewBag(( 
.(( 
StatusSortParm(( "
=((# $
sc((% '
.((' (
	sortOrder((( 1
==((2 4
$str((5 =
?((> ?
$str((@ M
:((N O
$str((P X
;((X Y
var** 
	campagins** 
=** 
Db++ 
.++ 
	Campaigns++ 
.,, 
Include,, 
(,, 
x,, 
=>,, 
x,, 
.,,  
Testing,,  '
),,' (
.,,( )
Include,,) 0
(,,0 1
x,,1 2
=>,,3 5
x,,6 7
.,,7 8
Approved,,8 @
),,@ A
.-- 
ToList-- 
(-- 
)-- 
;-- 
switch// 
(// 
sc// 
.// 
	sortOrder//  
)//  !
{00 
case11 
$str11 "
:11" #
	campagins22 
=22 
	campagins22  )
.22) *
OrderBy22* 1
(221 2
s222 3
=>224 6
s227 8
.228 9
OrderNumber229 D
)22D E
.22E F
ToList22F L
(22L M
)22M N
;22N O
break33 
;33 
case44 
$str44 '
:44' (
	campagins55 
=55 
	campagins55  )
.55) *
OrderByDescending55* ;
(55; <
s55< =
=>55> @
s55A B
.55B C
OrderNumber55C N
)55N O
.55O P
ToList55P V
(55V W
)55W X
;55X Y
break66 
;66 
case77 
$str77 #
:77# $
	campagins88 
=88 
	campagins88  )
.88) *
OrderBy88* 1
(881 2
s882 3
=>884 6
s887 8
.888 9
CampaignName889 E
)88E F
.88F G
ToList88G M
(88M N
)88N O
;88O P
break99 
;99 
case:: 
$str:: (
:::( )
	campagins;; 
=;; 
	campagins;;  )
.;;) *
OrderByDescending;;* ;
(;;; <
s;;< =
=>;;> @
s;;A B
.;;B C
CampaignName;;C O
);;O P
.;;P Q
ToList;;Q W
(;;W X
);;X Y
;;;Y Z
break<< 
;<< 
case== 
$str==  
:==  !
	campagins>> 
=>> 
	campagins>>  )
.>>) *
OrderBy>>* 1
(>>1 2
s>>2 3
=>>>4 6
s>>7 8
.>>8 9
	CreatedBy>>9 B
)>>B C
.>>C D
ToList>>D J
(>>J K
)>>K L
;>>L M
break?? 
;?? 
case@@ 
$str@@ %
:@@% &
	campaginsAA 
=AA 
	campaginsAA  )
.AA) *
OrderByDescendingAA* ;
(AA; <
sAA< =
=>AA> @
sAAA B
.AAB C
	CreatedByAAC L
)AAL M
.AAM N
ToListAAN T
(AAT U
)AAU V
;AAV W
breakBB 
;BB 
caseCC 
$strCC  
:CC  !
	campaginsDD 
=DD 
	campaginsDD  )
.DD) *
OrderByDD* 1
(DD1 2
sDD2 3
=>DD4 6
sDD7 8
.DD8 9
	CreatedAtDD9 B
)DDB C
.DDC D
ToListDDD J
(DDJ K
)DDK L
;DDL M
breakEE 
;EE 
caseFF 
$strFF %
:FF% &
	campaginsGG 
=GG 
	campaginsGG  )
.GG) *
OrderByDescendingGG* ;
(GG; <
sGG< =
=>GG> @
sGGA B
.GGB C
	CreatedAtGGC L
)GGL M
.GGM N
ToListGGN T
(GGT U
)GGU V
;GGV W
breakHH 
;HH 
caseII 
$strII $
:II$ %
	campaginsJJ 
=JJ 
	campaginsJJ  )
.JJ) *
OrderByJJ* 1
(JJ1 2
sJJ2 3
=>JJ4 6
sJJ7 8
.JJ8 9

)JJF G
.JJG H
ToListJJH N
(JJN O
)JJO P
;JJP Q
breakKK 
;KK 
caseLL 
$strLL )
:LL) *
	campaginsMM 
=MM 
	campaginsMM  )
.MM) *
OrderByDescendingMM* ;
(MM; <
sMM< =
=>MM> @
sMMA B
.MMB C

)MMP Q
.MMQ R
ToListMMR X
(MMX Y
)MMY Z
;MMZ [
breakNN 
;NN 
caseOO 
$strOO 
:OO  
	campaginsPP 
=PP 
	campaginsPP  )
.PP) *
OrderByPP* 1
(PP1 2
sPP2 3
=>PP4 6
sPP7 8
.PP8 9
QuantityPP9 A
)PPA B
.PPB C
ToListPPC I
(PPI J
)PPJ K
;PPK L
breakQQ 
;QQ 
caseRR 
$strRR $
:RR$ %
	campaginsSS 
=SS 
	campaginsSS  )
.SS) *
OrderByDescendingSS* ;
(SS; <
sSS< =
=>SS> @
sSSA B
.SSB C
QuantitySSC K
)SSK L
.SSL M
ToListSSM S
(SSS T
)SST U
;SSU V
breakTT 
;TT 
caseUU 
$strUU 
:UU 
	campaginsVV 
=VV 
	campaginsVV  )
.VV) *
OrderByVV* 1
(VV1 2
sVV2 3
=>VV4 6
sVV7 8
.VV8 9
StatusVV9 ?
)VV? @
.VV@ A
ToListVVA G
(VVG H
)VVH I
;VVI J
breakWW 
;WW 
caseXX 
$strXX "
:XX" #
	campaginsYY 
=YY 
	campaginsYY  )
.YY) *
OrderByDescendingYY* ;
(YY; <
sYY< =
=>YY> @
sYYA B
.YYB C
StatusYYC I
)YYI J
.YYJ K
ToListYYK Q
(YYQ R
)YYR S
;YYS T
breakZZ 
;ZZ 
default[[ 
:[[ 
	campagins\\ 
=\\ 
	campagins\\  )
.\\) *
OrderByDescending\\* ;
(\\; <
s\\< =
=>\\> @
s\\A B
.\\B C
	CreatedAt\\C L
)\\L M
.\\M N
ToList\\N T
(\\T U
)\\U V
;\\V W
break]] 
;]] 
}^^ 
ViewBag`` 
.`` 

SearchType`` 
=``  
sc``! #
.``# $

searchType``$ .
;``. /
ifaa 
(aa 
scaa 
.aa 

searchTypeaa 
==aa  
$straa! (
)aa( )
{bb 
ifcc 
(cc 
!cc 
stringcc 
.cc 

(cc) *
sccc* ,
.cc, -
basicStringcc- 8
)cc8 9
)cc9 :
{dd 
	campaginsee 
=ee 
	campaginsee  )
.ee) *
Whereee* /
(ee/ 0
see0 1
=>ee2 4
sff 
.ff 
OrderNumberff !
.ff! "
Equalsff" (
(ff( )
scff) +
.ff+ ,
basicStringff, 7
)ff7 8
||ff9 ;
sgg 
.gg $
ReBroadcastedOrderNumbergg .
==gg/ 1
scgg2 4
.gg4 5
basicStringgg5 @
||ggA C
shh 
.hh 
CampaignNamehh "
.hh" #
IndexOfhh# *
(hh* +
schh+ -
.hh- .
basicStringhh. 9
,hh9 :
StringComparisonhh; K
.hhK L&
InvariantCultureIgnoreCasehhL f
)hhf g
>=hhh j
$numhhk l
)hhl m
.hhm n
ToListhhn t
(hht u
)hhu v
;hhv w
ViewBagii 
.ii 
BasicStringSearchedii /
=ii0 1
scii2 4
.ii4 5
basicStringii5 @
;ii@ A
}jj 
elsejj 
ifjj 
(jj 
!jj 
stringjj "
.jj" #

(jj0 1
scjj1 3
.jj3 4
basicStatusjj4 ?
)jj? @
)jj@ A
{kk 
intll 
statusll 
=ll  
intll! $
.ll$ %
Parsell% *
(ll* +
scll+ -
.ll- .
basicStatusll. 9
)ll9 :
;ll: ;
ifmm 
(mm 
statusmm 
==mm !
(mm" #
intmm# &
)mm& '
CampaignStatusmm' 5
.mm5 6

)mmC D
	campaginsnn !
=nn" #
	campaginsnn$ -
.nn- .
Wherenn. 3
(nn3 4
snn4 5
=>nn6 8
snn9 :
.nn: ;

)nnH I
.nnI J
ToListnnJ P
(nnP Q
)nnQ R
;nnR S
elseoo 
ifoo 
(oo 
statusoo #
==oo$ &
(oo' (
intoo( +
)oo+ ,
CampaignStatusoo, :
.oo: ;
NotRebroadcastedoo; K
)ooK L
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
ReBroadCastpp; F
&&ppG I
!ppJ K
sppK L
.ppL M

)ppZ [
.pp[ \
ToListpp\ b
(ppb c
)ppc d
;ppd e
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
.ss 
BasicStatusSearchedss /
=ss0 1
scss2 4
.ss4 5
basicStatusss5 @
;ss@ A
}tt 
elsett 
iftt 
(tt 
!tt 
stringtt "
.tt" #

(tt0 1
sctt1 3
.tt3 4
basicOrderNumbertt4 D
)ttD E
)ttE F
{uu 
	campaginsvv 
=vv 
	campaginsvv  )
.vv) *
Wherevv* /
(vv/ 0
svv0 1
=>vv2 4
svv5 6
.vv6 7
Idvv7 9
.vv9 :
ToStringvv: B
(vvB C
)vvC D
.vvD E
EqualsvvE K
(vvK L
scvvL N
.vvN O
basicOrderNumbervvO _
)vv_ `
)vv` a
.vva b
ToListvvb h
(vvh i
)vvi j
;vvj k
}ww 
}yy 
elsezz 
ifzz 
(zz 
sczz 
.zz 

searchTypezz "
==zz# %
$strzz& 0
)zz0 1
{{{ 
if|| 
(|| 
!|| 
string|| 
.|| 

(||) *
sc||* ,
.||, -
advancedStatus||- ;
)||; <
)||< =
{}} 
int~~ 
status~~ 
=~~  
int~~! $
.~~$ %
Parse~~% *
(~~* +
sc~~+ -
.~~- .
advancedStatus~~. <
)~~< =
;~~= >
if 
( 
status 
== !
(" #
int# &
)& '
CampaignStatus' 5
.5 6

)C D
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

�� )
(
��) *
sc
��* ,
.
��, -

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

�� )
=
��* +
sc
��, .
.
��. /

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
�� 
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
�� 
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
�� 
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
PageSize
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
�� 
$"
��  
Orders_
��  '
{
��' (
DateTime
��( 0
.
��0 1
Now
��1 4
:
��4 5
yyyyMMdd_HHmmss
��5 D
}
��D E
.csv
��E I
"
��I J
;
��J K
var
�� 
filePath
�� 
=
�� 
$"
�� 
{
�� 
DownloadPath
�� *
}
��* +
\\
��+ -
{
��- .
fileName
��. 6
}
��6 7
"
��7 8
;
��8 9
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
�� 
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
�� 
Session
�� "
[
��" #
$str
��# 0
]
��0 1
as
��2 4
string
��5 ;
)
��; <
?
��< =
.
��= >
Split
��> C
(
��C D
$str
��D G
.
��G H
ToCharArray
��H S
(
��S T
)
��T U
)
��U V
.
��V W
Select
��W ]
(
��] ^
Guid
��^ b
.
��b c
Parse
��c h
)
��h i
.
��i j
ToList
��j p
(
��p q
)
��q r
;
��r s
var
�� 
	campagins
�� !
=
��" #
Db
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
��% (

CampaignVM
��) 3
(
��3 4
)
��4 5
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

�� )
=
��* +
x
��, -
.
��- .

��. ;
,
��; <
Quantity
�� $
=
��% &
x
��' (
.
��( )
Approved
��) 1
?
��1 2
.
��2 3
Quantity
��3 ;
??
��< >
(
��? @
x
��@ A
.
��A B
Testing
��B I
?
��I J
.
��J K
Quantity
��K S
??
��T V
x
��W X
.
��X Y
Quantity
��Y a
)
��a b
,
��b c
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
�� 
AdsException
�� *
(
��* +
$str
��+ :
+
��; <
ex
��= ?
.
��? @
Message
��@ G
)
��G H
;
��H I
}
�� 
}
�� 
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
�� 
throw
�� 
new
�� 

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
�� 
return
�� 
View
�� 
(
�� 
campaign
��  
)
��  !
;
��! "
}
�� 	
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
�� 
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
,
��) *

WhiteLabel
�� 
=
�� 
LoggedInUser
�� )
.
��) *

WhiteLabel
��* 4
}
�� 
;
��
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
�� 
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
�� 
;
��
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
��- .
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
,
��N O
LoggedInUser
��P \
?
��\ ]
.
��] ^

WhiteLabel
��^ h
)
��h i
;
��i j
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
�� 
Bind
��
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
�� 
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
Db
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
Db
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
Db
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
�� 

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
��2 3
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
,
��N O
LoggedInUser
��P \
?
��\ ]
.
��] ^

WhiteLabel
��^ h
)
��h i
;
��i j
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
�� 
throw
�� 
new
�� 

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
�� 
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
�� 
Bind
��
(
�� 
Include
�� 
=
�� 
$str�� �
)
��
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
�� 
Db
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
Db
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
�� 
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
Db
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
�� 
throw
�� 
new
�� 

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
�� 
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
Db
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
Db
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
Db
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
Db
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

�� (
.
��( )
	SetValues
��) 2
(
��2 3
Db
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
Db
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

��! .
(
��. /
)
��/ 0
;
��0 1
Db
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
Db
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

��! .
.
��. /
	SetValues
��/ 8
(
��8 9
Db
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
Db
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
Db
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
�� 
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
Db
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
Db
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

��& 3
.
��3 4
	SetValues
��4 =
(
��= >
Db
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
Db
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
�� 
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
�� 
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
Db
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
Db
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

��" /
.
��/ 0
	SetValues
��0 9
(
��9 :
Db
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
Db
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
Db
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
�� 
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
�� 
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
Db
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
Db
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

��# 0
.
��0 1
	SetValues
��1 :
(
��: ;
Db
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
Db
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
Db
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
�� 
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
�� 
throw
�� 
new
�� 

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
�� 
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
Db
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
Db
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
�� 
Db
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
�� 
Db
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
Db
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
�� 
Db
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
�� 
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
Db
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
�� 
throw
�� 
new
�� 

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
�� 
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
Db
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
Db
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
�� 
throw
�� 
new
�� 

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
�� 
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
Db
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
�� 
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
�� 
var
�� "
notCompletedSegments
�� $
=
��% &
Db
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

��= J
!=
��K M
(
��N O
int
��O R
)
��R S

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
�� 
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
�� 
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
Db
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
�� 
throw
�� 
new
�� 

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
�� 
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
��R S
var
�� 
campaignTracking
��  
=
��! "
campaign
��# +
.
��+ ,
	Trackings
��, 5
.
��5 6
FirstOrDefault
��6 D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L

��L Y
==
��Z \
string
��] c
.
��c d
Empty
��d i
)
��i j
;
��j k
long
��  
opennedFromOrignal
�� #
=
��$ %
campaignTracking
��& 6
?
��6 7
.
��7 8
Opened
��8 >
??
��? A
campaign
��B J
.
��J K
Quantity
��K S
;
��S T
campaign
�� 
.
�� #
ReBroadcastedQuantity
�� *
=
��+ , 
opennedFromOrignal
��- ?
;
��? @
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
�� 	
HttpPost
��	 
,
�� 

ActionName
�� 
(
�� 
$str
�� '
)
��' (
]
��( )
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
�� 	
if
�� 
(
�� 
ReBroadcastedDate
�� !
==
��" $
null
��% )
||
��* ,
Vendor
��- 3
==
��4 6
null
��7 ;
)
��; <
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$"
��$ &7
)ReBroadcastedDate and Vendor is required.
��& O
"
��O P
;
��P Q
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 1
,
��1 2
$str
��3 >
,
��> ?
new
��@ C
{
��D E
id
��F H
=
��J K
Id
��L N
}
��N O
)
��O P
;
��P Q
}
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
��  "
.
��" #
	Campaigns
��# ,
.
��, -
FirstOrDefault
��- ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
==
��F H
Id
��I K
)
��K L
;
��L M
if
�� 
(
�� 
campaign
�� 
.
�� 

�� &
)
��& '
{
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
$"
��$ &$
Already rebroadcasted.
��& <
"
��< =
;
��= >
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 1
,
��1 2
$str
��3 >
,
��> ?
new
��@ C
{
��D E
id
��F H
=
��I J
Id
��K M
}
��N O
)
��O P
;
��P Q
}
�� 
campaign
�� 
.
�� 

�� "
=
��# $
true
��% )
;
��) *
campaign
�� 
.
�� 
ReBroadcastedDate
�� &
=
��' (
ReBroadcastedDate
��) :
;
��: ;
campaign
�� 
.
�� #
ReBroadcastedQuantity
�� *
=
��+ ,#
ReBroadcastedQuantity
��- B
;
��B C
campaign
�� 
.
�� &
ReBroadcastedOrderNumber
�� -
=
��. /
campaign
��0 8
.
��8 9
OrderNumber
��9 D
+
��E F
$str
��G L
;
��L M
Db
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
��P Q
campaign
��R Z
.
��Z [
OrderNumber
��[ f
,
��f g
SegmentsSelected
��h x
)
��x y
)
��y z
;
��z {
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
��- .
campaign
��/ 7
.
��7 8
OrderNumber
��8 C
+
��D E
$str
��F S
+
��T U
campaign
��V ^
.
��^ _
CampaignName
��_ k
+
��l m
$str��n �
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
}�� �
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\ErrorController.cs
	namespace 	
WFP
 
.
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
}
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
}&& �j
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\FileController.cs
	namespace

 	
WFP


 
.


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
public 

sealed 
class 
FileController &
:' (
BaseController) 7
{
[ 	
HttpPost	 
] 
public 

JsonResult 

UploadFile $
($ %
UploadFileVM% 1
fileVm2 8
)8 9
{ 	
try 
{ 
string 

=% &
$str' )
;) *
foreach 
( 
string 
selectedFile  ,
in- /
Request0 7
.7 8
Files8 =
)= >
{ 
var 
fileContent #
=$ %
Request& -
.- .
Files. 3
[3 4
selectedFile4 @
]@ A
;A B
if 
( 
fileContent #
!=$ &
null' +
&&, .
fileContent/ :
.: ;

>I J
$numK L
)L M
{ 
var 
stream "
=# $
fileContent% 0
.0 1
InputStream1 <
;< =
string 
filePath '
=( )
Path* .
.. /
Combine/ 6
(6 7

UploadPath7 A
,A B
fileContentC N
.N O
FileNameO W
)W X
;X Y
using 
( 
var "

fileStream# -
=. /
System0 6
.6 7
IO7 9
.9 :
File: >
.> ?
Create? E
(E F
filePathF N
)N O
)O P
{ 
stream "
." #
CopyTo# )
() *

fileStream* 4
)4 5
;5 6
} 
if!! 
(!! 
!!! 
fileVm!! #
.!!# $
IsValid!!$ +
(!!+ ,
filePath!!, 4
)!!4 5
)!!5 6
{"" 
if## 
(##  
System##  &
.##& '
IO##' )
.##) *
File##* .
.##. /
Exists##/ 5
(##5 6
filePath##6 >
)##> ?
)##? @
System$$  &
.$$& '
IO$$' )
.$$) *
File$$* .
.$$. /
Delete$$/ 5
($$5 6
filePath$$6 >
)$$> ?
;$$? @
throw%% !
new%%" %
AdsException%%& 2
(%%2 3
fileVm%%3 9
.%%9 :
FileType%%: B
+%%C D
$str%%E o
)%%o p
;%%p q
}&& 
if(( 
((( 
fileVm(( "
.((" #
FileType((# +
==((, .
$str((/ <
)((< =
{)) 
string** "
logoFileName**# /
=**0 1

FileHelper**2 <
.**< =
GetValidFileName**= M
(**M N
LoggedInUser**N Z
?**Z [
.**[ \
Id**\ ^
+**_ `
System**a g
.**g h
IO**h j
.**j k
Path**k o
.**o p
GetExtension**p |
(**| }
fileContent	**} �
.
**� �
FileName
**� �
)
**� �
)
**� �
;
**� �
string++ "
logoFilePath++# /
=++0 1
Path++2 6
.++6 7
Combine++7 >
(++> ?

ImagesPath++? I
,++I J
logoFileName++K W
)++W X
;++X Y
System,, "
.,," #
IO,,# %
.,,% &
File,,& *
.,,* +
Copy,,+ /
(,,/ 0
filePath,,0 8
,,,8 9
logoFilePath,,: F
,,,F G
true,,H L
),,L M
;,,M N

=--* +
logoFileName--, 8
;--8 9
}.. 
else// 
if// 
(//  !
string//! '
.//' (

(//5 6
fileVm//6 <
.//< =
OrderNumber//= H
)//H I
)//I J
{00 

=11* +
$"11, .
{11. /
DateTime11/ 7
.117 8
Now118 ;
:11; <
yyyyMMddHHmmss11< J
}11J K
_11K L
{11L M
fileContent11M X
.11X Y
FileName11Y a
}11a b
"11b c
;11c d

.22) *
Upload22* 0
(220 1

,22> ?
filePath22@ H
)22H I
;22I J
}33 
else44 
if44 
(44  !
!44! "
string44" (
.44( )

(446 7
fileVm447 =
.44= >

)44K L
)44L M
{55 

=66* +
$"66, .
{66. /
fileVm66/ 5
.665 6
OrderNumber666 A
}66A B
/66B C
{66C D
fileVm66D J
.66J K

}66X Y
	_html.zip66Y b
"66b c
;66c d

.77) *
Upload77* 0
(770 1

,77> ?
filePath77@ H
,77H I
true77J N
,77N O
true77P T
)77T U
;77U V
}88 
else99 
{:: 
switch;; "
(;;# $
fileVm;;$ *
.;;* +
FileType;;+ 3
);;3 4
{<< 
case==  $
$str==% ;
:==; <

=>>2 3
string>>4 :
.>>: ;
Format>>; A
(>>A B
$str>>B T
,>>T U
fileVm>>V \
.>>\ ]
OrderNumber>>] h
)>>h i
;>>i j
break??$ )
;??) *
case@@  $
$str@@% 9
:@@9 :

=AA2 3
stringAA4 :
.AA: ;
FormatAA; A
(AAA B
$strAAB R
,AAR S
fileVmAAT Z
.AAZ [
OrderNumberAA[ f
)AAf g
;AAg h
breakBB$ )
;BB) *
caseCC  $
$strCC% :
:CC: ;

=DD2 3
stringDD4 :
.DD: ;
FormatDD; A
(DDA B
$strDDB S
,DDS T
fileVmDDU [
.DD[ \
OrderNumberDD\ g
)DDg h
;DDh i
breakEE$ )
;EE) *
caseFF  $
$strFF% :
:FF: ;

=GG2 3
stringGG4 :
.GG: ;
FormatGG; A
(GGA B
$strGGB S
,GGS T
fileVmGGU [
.GG[ \
OrderNumberGG\ g
)GGg h
;GGh i
breakHH$ )
;HH) *
caseII  $
$strII% 9
:II9 :

=JJ2 3
stringJJ4 :
.JJ: ;
FormatJJ; A
(JJA B
$strJJB U
,JJU V
fileVmJJW ]
.JJ] ^
OrderNumberJJ^ i
,JJi j
PathJJk o
.JJo p
GetExtensionJJp |
(JJ| }
filePath	JJ} �
)
JJ� �
)
JJ� �
;
JJ� �
breakKK$ )
;KK) *
caseLL  $
$strLL% =
:LL= >

=MM2 3
stringMM4 :
.MM: ;
FormatMM; A
(MMA B
$strMMB Z
,MMZ [
fileVmMM\ b
.MMb c
OrderNumberMMc n
,MMn o
PathMMp t
.MMt u
GetExtension	MMu �
(
MM� �
filePath
MM� �
)
MM� �
)
MM� �
;
MM� �
breakNN$ )
;NN) *
caseOO  $
$strOO% 6
:OO6 7

=PP2 3
stringPP4 :
.PP: ;
FormatPP; A
(PPA B
$strPPB S
,PPS T
fileVmPPU [
.PP[ \
OrderNumberPP\ g
,PPg h
PathPPi m
.PPm n
GetExtensionPPn z
(PPz {
filePath	PP{ �
)
PP� �
)
PP� �
;
PP� �
breakQQ$ )
;QQ) *
}RR 

.SS) *
UploadSS* 0
(SS0 1

,SS> ?
filePathSS@ H
,SSH I
trueSSJ N
,SSN O
trueSSP T
)SST U
;SSU V
}TT 
ifWW 
(WW 
SystemWW "
.WW" #
IOWW# %
.WW% &
FileWW& *
.WW* +
ExistsWW+ 1
(WW1 2
filePathWW2 :
)WW: ;
)WW; <
SystemXX "
.XX" #
IOXX# %
.XX% &
FileXX& *
.XX* +
DeleteXX+ 1
(XX1 2
filePathXX2 :
)XX: ;
;XX; <
}YY 
}ZZ 
return\\ 
Json\\ 
(\\ 
new\\ 
JsonResponse\\  ,
(\\, -
)\\- .
{\\/ 0
IsSucess\\1 9
=\\: ;
true\\< @
,\\@ A
Result\\B H
=\\I J

}\\Y Z
)\\Z [
;\\[ \
}]] 
catch^^ 
(^^ 
	Exception^^ 
ex^^ 
)^^  
{__ 
return`` 
Json`` 
(`` 
new`` 
JsonResponse``  ,
(``, -
)``- .
{``/ 0
IsSucess``1 9
=``: ;
false``< A
,``A B
ErrorMessage``C O
=``P Q
$str``R b
+``c d
ex``e g
.``g h
Message``h o
}``p q
)``q r
;``r s
}aa 
}bb 	
[dd 	
HttpGetdd	 
]dd 
publicee 
ActionResultee 
DownloadFileee (
(ee( )
UploadFileVMee) 5
fileVmee6 <
)ee< =
{ff 	
stringgg 
filePathgg 
=gg 
Pathgg "
.gg" #
Combinegg# *
(gg* +

UploadPathgg+ 5
,gg5 6
fileVmgg7 =
.gg= >
FileNamegg> F
)ggF G
;ggG H
ifhh 
(hh 
fileVmhh 
.hh 
FileTypehh 
==hh  "
$strhh# 0
)hh0 1
{ii 
filePathjj 
=jj 
Pathjj 
.jj  
Combinejj  '
(jj' (

ImagesPathjj( 2
,jj2 3
fileVmjj4 :
.jj: ;
FileNamejj; C
)jjC D
;jjD E
}kk 
elsell 
{mm 

.nn 
Downloadnn &
(nn& '
fileVmnn' -
.nn- .
FileNamenn. 6
,nn6 7
filePathnn8 @
)nn@ A
;nnA B
}oo 
returnpp 
Filepp 
(pp 
filePathpp  
,pp  !
$strpp" ,
,pp, -
fileVmpp. 4
.pp4 5
FileNamepp5 =
)pp= >
;pp> ?
}qq 	
[ss 	
HttpPostss	 
]ss 
publictt 

JsonResulttt 

DeleteFilett $
(tt$ %
UploadFileVMtt% 1
fileVmtt2 8
)tt8 9
{uu 	
tryvv 
{ww 
ifxx 
(xx 
fileVmxx 
.xx 
FileTypexx #
==xx$ &
$strxx' 4
)xx4 5
{yy 
stringzz 
filePathzz #
=zz$ %
Pathzz& *
.zz* +
Combinezz+ 2
(zz2 3

ImagesPathzz3 =
,zz= >
fileVmzz? E
.zzE F
FileNamezzF N
)zzN O
;zzO P
if{{ 
({{ 
System{{ 
.{{ 
IO{{ !
.{{! "
File{{" &
.{{& '
Exists{{' -
({{- .
filePath{{. 6
){{6 7
){{7 8
System|| 
.|| 
IO|| !
.||! "
File||" &
.||& '
Delete||' -
(||- .
filePath||. 6
)||6 7
;||7 8
}}} 
else~~ 
{ 

�� !
.
��! "
Delete
��" (
(
��( )
fileVm
��) /
.
��/ 0
FileName
��0 8
)
��8 9
;
��9 :
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
��0 8
=
��9 :
true
��; ?
}
��? @
)
��@ A
;
��A B
}
�� 
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
�� 
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
��O P
$str
��Q g
+
��h i
ex
��j l
.
��l m
Message
��m t
}
��u v
)
��v w
;
��w x
}
�� 
}
�� 	
}
�� 
}�� �4
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\HomeController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
HomeController 
:  !
BaseController" 0
{ 
public 
ActionResult 
Index !
(! "
)" #
{ 	
return 
RedirectToAction #
(# $
$str$ +
,+ ,
$str- 8
)8 9
;9 :
} 	
public 
ActionResult 
Settings $
($ %
)% &
{ 	

profile !
=" #
null$ (
;( )
if 
( 
LoggedInUser 
== 
null  $
)$ %
return& ,
View- 1
(1 2
$str2 <
,< =
(> ?

)L M
nullN R
)R S
;S T
if 
( 
string 
. 

($ %
LoggedInUser% 1
?1 2
.2 3
ApiKey3 9
)9 :
): ;
{   
var!! 
user!! 
=!! 
Db!! 
.!! 
Users!! #
.!!# $
FirstOrDefault!!$ 2
(!!2 3
x!!3 4
=>!!5 7
x!!8 9
.!!9 :
Id!!: <
==!!= ?
LoggedInUser!!@ L
.!!L M
Id!!M O
)!!O P
;!!P Q
if"" 
("" 
user"" 
!="" 
null""  
)""  !
user""" &
.""& '
ApiKey""' -
="". /
KeyGenerator""0 <
.""< =
GetUniqueKey""= I
(""I J
$num""J L
)""L M
;""M N
Db## 
.## 
SaveChanges## 
(## 
)##  
;##  !
SetupLoggedInUser$$ !
($$! "
LoggedInUser$$" .
.$$. /
UserName$$/ 7
)$$7 8
;$$8 9
}%% 
profile'' 
='' 
new'' 

(''' (
)''( )
{(( 
UserName)) 
=)) 
LoggedInUser)) '
.))' (
UserName))( 0
,))0 1
	FirstName** 
=** 
LoggedInUser** (
.**( )
	FirstName**) 2
,**2 3
LastName++ 
=++ 
LoggedInUser++ '
.++' (
LastName++( 0
,++0 1
Email,, 
=,, 
LoggedInUser,, $
.,,$ %
Email,,% *
,,,* +
CompanyName-- 
=-- 
LoggedInUser-- *
.--* +
CompanyName--+ 6
,--6 7

WhiteLabel.. 
=.. 
LoggedInUser.. )
...) *

WhiteLabel..* 4
,..4 5
CompanyLogo// 
=// 
LoggedInUser// *
.//* +
CompanyLogo//+ 6
,//6 7
ReportTemplate00 
=00  
LoggedInUser00! -
.00- .
ReportTemplate00. <
,00< =
	IsUsesApi11 
=11 
LoggedInUser11 (
.11( )
	IsUsesApi11) 2
,112 3
ApiKey22 
=22 
LoggedInUser22 %
.22% &
ApiKey22& ,
,22, -
}33 
;33
ViewBag55 
.55 
ReportTemplate55 "
=55# $
new55% (

SelectList55) 3
(553 4
ReportTemplates554 C
,55C D
$str55E L
,55L M
$str55N T
,55T U
profile55V ]
.55] ^
ReportTemplate55^ l
)55l m
;55m n
return77 
View77 
(77 
$str77 "
,77" #
profile77$ +
)77+ ,
;77, -
}88 	
[:: 	
HttpPost::	 
]:: 
public;; 
ActionResult;; 
Settings;; $
(;;$ %

profile;;3 :
);;: ;
{<< 	
var== 
user== 
=== 
Db== 
.== 
Users== 
.==  
FirstOrDefault==  .
(==. /
x==/ 0
=>==1 3
x==4 5
.==5 6
Id==6 8
====9 ;
LoggedInUser==< H
.==H I
Id==I K
)==K L
;==L M
if>> 
(>> 
user>> 
==>> 
null>> 
)>> 
return>> $
View>>% )
(>>) *
$str>>* 1
)>>1 2
;>>2 3
user@@ 
.@@ 
	FirstName@@ 
=@@ 
profile@@ $
.@@$ %
	FirstName@@% .
;@@. /
userAA 
.AA 
LastNameAA 
=AA 
profileAA #
.AA# $
LastNameAA$ ,
;AA, -
userBB 
.BB 
EmailBB 
=BB 
profileBB  
.BB  !
EmailBB! &
;BB& '
userCC 
.CC 
CompanyNameCC 
=CC 
profileCC &
.CC& '
CompanyNameCC' 2
;CC2 3
userDD 
.DD 

WhiteLabelDD 
=DD 
profileDD %
.DD% &

WhiteLabelDD& 0
;DD0 1
userEE 
.EE 
CompanyLogoEE 
=EE 
profileEE &
.EE& '
CompanyLogoEE' 2
;EE2 3
userFF 
.FF 
ReportTemplateFF 
=FF  !
profileFF" )
.FF) *
ReportTemplateFF* 8
;FF8 9
DbGG 
.GG 
SaveChangesGG 
(GG 
)GG 
;GG 
SetupLoggedInUserII 
(II 
LoggedInUserII *
.II* +
UserNameII+ 3
)II3 4
;II4 5
ViewBagKK 
.KK 
ReportTemplateKK "
=KK# $
newKK% (

SelectListKK) 3
(KK3 4
ReportTemplatesKK4 C
,KKC D
$strKKE L
,KKL M
$strKKM S
,KKS T
profileKKU \
.KK\ ]
ReportTemplateKK] k
)KKk l
;KKl m
TempDataLL 
[LL 
$strLL 
]LL 
=LL  !
$strLL" I
;LLI J
returnMM 
RedirectToActionMM #
(MM# $
$strMM$ .
)MM. /
;MM/ 0
}NN 	
}RR 
}SS ��
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\CreativeController.cs
	namespace 	
WFP
 
.
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
Db 
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
{&& 

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
}11 
;11
if33 
(33 
!33 
string33 
.33 

(33% &
campaign33& .
.33. /
Assets33/ 5
.335 6
TestSeedFile336 B
)33B C
)33C D
{44 
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

(66L M
campaign66M U
.66U V
Assets66V \
.66\ ]
TestSeedFile66] i
)66i j
)66j k

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
}99 
if;; 
(;; 
!;; 
string;; 
.;; 

(;;% &
campaign;;& .
.;;. /
Assets;;/ 5
.;;5 6
LiveSeedFile;;6 B
);;B C
);;C D
{<< 
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

(>>Q R
campaign>>R Z
.>>Z [
Assets>>[ a
.>>a b
LiveSeedFile>>b n
)>>n o
)>>o p

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
}AA 
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
{PP 
varQQ 
alreayQQ 
=QQ 
DbQQ 
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
Db\\ 
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
Db]]# %
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
Dbdd 
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
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
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
}jj 
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
{qq 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
MailChimpProcessor
�� "
.
��" #

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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
AdsException
�� *
(
��* +
$str
��+ A
)
��A B
;
��B C
}
�� 
var
�� 
messages
�� 
=
�� 
Db
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
�� 
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
�� 
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
�� 
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
 
.


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
public

class
ManageController
:

Controller
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

)j k
{ 	
UserManager 
= 
userManager %
;% &

= 

;) *
} 	
public $
ApplicationSignInManager '

{ 	
get 
{ 
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
}!! 
private"" 
set"" 
{## 
_signInManager$$ 
=$$  
value$$! &
;$$& '
}%% 
}&& 	
public(( "
ApplicationUserManager(( %
UserManager((& 1
{)) 	
get** 
{++ 
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
}-- 
private.. 
set.. 
{// 
_userManager00 
=00 
value00 $
;00$ %
}11 
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
{CC 
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
}II 
;II
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

(TTh i

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
{VV 
varWW 
userWW 
=WW 
awaitWW  
UserManagerWW! ,
.WW, -

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
}]] 
else^^ 
{__ 
message`` 
=`` 
ManageMessageId`` )
.``) *
Error``* /
;``/ 0
}aa 
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
{ss 
returntt 
Viewtt 
(tt 
modeltt !
)tt! "
;tt" #
}uu 
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
{yy 
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
�� 
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
�� 
await
�� 

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
�� 
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
�� 
await
�� 

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
�� 
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
�� 
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
�� 
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
�� 
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
�� 

ModelState
�� 
.
�� 

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
�� 
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
�� 
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
�� 
await
�� 

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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 

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
�� 
)
��
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 

ModelState
�� 
.
�� 

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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
}�� Ȧ
JE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\TestingController.cs
	namespace 	
WFP
 
.
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
TestingController "
:# $
BaseController% 3
{ 
public 
ActionResult 
Index !
(! "
Guid" &
?& '
id( *
)* +
{ 	
var 
campaign 
= 
Db 
. 
	Campaigns '
. 
Include 
( 
c 
=> 
c 
.  
Assets  &
)& '
. 
Include 
( 
c 
=> 
c 
.  
Testing  '
)' (
. 
FirstOrDefault 
(  
c  !
=>" $
c% &
.& '
Id' )
==* ,
id- /
)/ 0
;0 1
if 
( 
campaign 
== 
null  
)  !
return" (
View) -
(- .
$str. 5
)5 6
;6 7
Session 
[ 
$str 
] 
= 
id 
; 
Session 
[ 
$str !
]! "
=# $
campaign% -
.- .
OrderNumber. 9
;9 :
if   
(   
campaign   
.   
Testing    
==  ! #
null  $ (
)  ( )
{!! 
campaign"" 
."" 
Assets"" 
.""  

ZipCodeUrl""  *
=""+ ,
$"""- //
#http://www.digitaldynamixs.net/ep2/""/ R
{""R S
campaign""S [
.""[ \
OrderNumber""\ g
}""g h
/""h i
{""i j
campaign""j r
.""r s
OrderNumber""s ~
}""~ 
zip.csv	"" �
"
""� �
;
""� �
campaign## 
.## 
Assets## 
.##  
CreativeUrl##  +
=##, -
$"##- //
#http://www.digitaldynamixs.net/ep2/##/ R
{##R S
campaign##S [
.##[ \
OrderNumber##\ g
}##g h
/##h i
{##i j
campaign##j r
.##r s
OrderNumber##s ~
}##~ 
.htm	## �
"
##� �
;
##� �
var%% 
	testingId%% 
=%% 
Guid%%  $
.%%$ %
NewGuid%%% ,
(%%, -
)%%- .
;%%. /
var&& 
testing&& 
=&& 
new&& !
CampaignTesting&&" 1
(&&1 2
)&&2 3
{'' 
Id(( 
=(( 
	testingId(( "
,((" #

CampaignId)) 
=))  
campaign))! )
.))) *
Id))* ,
,)), -
	CreatedAt** 
=** 
DateTime**  (
.**( )
Now**) ,
,**, -
	CreatedBy++ 
=++ 
campaign++  (
.++( )
	CreatedBy++) 2
,++2 3
CampaignName,,  
=,,! "
campaign,,# +
.,,+ ,
CampaignName,,, 8
,,,8 9

WhiteLabel-- 
=--  
campaign--! )
.--) *

WhiteLabel--* 4
,--4 5
ReBroadCast.. 
=..  !
campaign.." *
...* +
ReBroadCast..+ 6
,..6 7
ReBroadcastDate// #
=//$ %
campaign//& .
.//. /
ReBroadcastDate/// >
,//> ?
FromLine00 
=00 
campaign00 '
.00' (
FromLine00( 0
,000 1
SubjectLine11 
=11  !
campaign11" *
.11* +
SubjectLine11+ 6
,116 7
TestingUrgency33 "
=33# $
campaign33% -
.33- .
TestingUrgency33. <
,33< =

DeployDate44 
=44  
campaign44! )
.44) *

,447 8

GeoDetails55 
=55  
campaign55! )
.55) *

GeoDetails55* 4
,554 5
Demographics66  
=66! "
campaign66# +
.66+ ,
Demographics66, 8
,668 9
Quantity77 
=77 
campaign77 '
.77' (
Quantity77( 0
,770 1
SpecialInstructions88 '
=88( )
campaign88* 2
.882 3
SpecialInstructions883 F
,88F G
IsOpenPixel:: 
=::  !
campaign::" *
.::* +
IsOpenPixel::+ 6
,::6 7
OpenPixelUrl;;  
=;;! "
campaign;;# +
.;;+ ,
OpenPixelUrl;;, 8
,;;8 9
	OpenGoals<< 
=<< 
campaign<<  (
.<<( )
Quantity<<) 1
*<<2 3
$num<<4 6
/<<7 8
$num<<9 <
,<<< =

ClickGoals== 
===  
campaign==! )
.==) *
Quantity==* 2
*==3 4
$num==5 7
/==8 9
$num==: =
,=== >
DataFileQuantity>> $
=>>% &
campaign>>' /
.>>/ 0
DataFileQuantity>>0 @
,>>@ A
IsOmniOrderAA 
=AA  !
campaignAA" *
.AA* +
IsOmniOrderAA+ 6
,AA6 7
OmniDeployDateBB "
=BB# $
campaignBB% -
.BB- .
OmniDeployDateBB. <
,BB< =
ImpressionsCC 
=CC  !
campaignCC" *
.CC* +
ImpressionsCC+ 6
,CC6 7
ChannelTypesDD  
=DD! "
campaignDD# +
.DD+ ,
ChannelTypesDD, 8
,DD8 9
}FF 
;FF 
DbGG 
.GG 
CampaignsTestingGG #
.GG# $
AddGG$ '
(GG' (
testingGG( /
)GG/ 0
;GG0 1
DbHH 
.HH 
SaveChangesHH 
(HH 
)HH  
;HH  !
campaignJJ 
.JJ 
	TestingIdJJ "
=JJ# $
	testingIdJJ% .
;JJ. /
DbKK 
.KK 
SaveChangesKK 
(KK 
)KK  
;KK  !
}LL 
campaignMM 
.MM 
StatusMM 
=MM 
(MM 
intMM "
)MM" #
CampaignStatusMM# 1
.MM1 2
TestingMM2 9
;MM9 :
DbNN 
.NN 
SaveChangesNN 
(NN 
)NN 
;NN 
returnOO 
RedirectToActionOO #
(OO# $
$strOO$ 1
,OO1 2
$strOO3 <
,OO< =
newOO> A
{OOB C
idOOD F
=OOG H
campaignOOI Q
.OOQ R
	TestingIdOOR [
}OO\ ]
)OO] ^
;OO^ _
}PP 	
staticSS 
charSS 
c1SS 
;SS 
publicTT 
ActionResultTT 
EditTestingTT '
(TT' (
GuidTT( ,
?TT, -
idTT. 0
)TT0 1
{UU 	
varVV 
campaignTestingVV 
=VV  !
DbVV" $
.VV$ %
CampaignsTestingVV% 5
.VV5 6
FirstOrDefaultVV6 D
(VVD E
cVVE F
=>VVG I
cVVJ K
.VVK L
IdVVL N
==VVO Q
idVVR T
)VVT U
;VVU V
ifXX 
(XX 
campaignTestingXX 
==XX  "
nullXX# '
)XX' (
{YY 
throwZZ 
newZZ 

(ZZ' (
$numZZ( +
,ZZ+ ,
$strZZ- 8
)ZZ8 9
;ZZ9 :
}[[ 

TinyMapper]] 
.]] 
Bind]] 
<]] 
CampaignTesting]] +
,]]+ ,
CampaignTestingVM]]- >
>]]> ?
(]]? @
config]]@ F
=>]]G I
{^^ 
config__ 
.__ 
Ignore__ 
(__ 
x__ 
=>__  "
x__# $
.__$ %
ChannelTypes__% 1
)__1 2
;__2 3
}`` 
)``
;`` 
varbb 
campaignTestingVmbb !
=bb" #

TinyMapperbb$ .
.bb. /
Mapbb/ 2
<bb2 3
CampaignTestingVMbb3 D
>bbD E
(bbE F
campaignTestingbbF U
)bbU V
;bbV W
Campaigncc 
campaigncc 
=cc 
Dbcc  "
.cc" #
	Campaignscc# ,
.dd 
Includedd 
(dd 
xdd 
=>dd  
xdd! "
.dd" #
Assetsdd# )
)dd) *
.ee 
Includeee 
(ee 
xee 
=>ee  
xee! "
.ee" #
Segmentsee# +
)ee+ ,
.ff 
FirstOrDefaultff "
(ff" #
xff# $
=>ff% '
xff( )
.ff) *
Idff* ,
==ff- /
campaignTestingff0 ?
.ff? @

CampaignIdff@ J
)ffJ K
;ffK L
campaignTestingVmgg 
.gg 
OrderNumbergg )
=gg* +
campaigngg, 4
.gg4 5
OrderNumbergg5 @
;gg@ A
ifhh 
(hh 
campaignhh 
.hh 
Assetshh 
==hh  "
nullhh# '
)hh' (
{ii 
varjj 
assetIdjj 
=jj 
Guidjj "
.jj" #
NewGuidjj# *
(jj* +
)jj+ ,
;jj, -
Dbkk 
.kk 
CampaignAssetskk !
.kk! "
Addkk" %
(kk% &
newkk& )

(kk7 8
)kk8 9
{ll 
Idmm 
=mm 
assetIdmm  
,mm  !

CampaignIdnn 
=nn  
campaignnn! )
.nn) *
Idnn* ,
,nn, -
	CreatedAtoo 
=oo 
DateTimeoo  (
.oo( )
Nowoo) ,
}pp 
)pp 
;pp 
campaignqq 
.qq 
AssetsIdqq !
=qq" #
assetIdqq$ +
;qq+ ,
Dbrr 
.rr 
SaveChangesrr 
(rr 
)rr  
;rr  !
campaignss 
=ss 
Dbss 
.ss 
	Campaignsss '
.tt 
Includett 
(tt 
xtt 
=>tt  
xtt! "
.tt" #
Assetstt# )
)tt) *
.uu 
Includeuu 
(uu 
xuu 
=>uu  
xuu! "
.uu" #
Segmentsuu# +
)uu+ ,
.vv 
FirstOrDefaultvv "
(vv" #
xvv# $
=>vv% '
xvv( )
.vv) *
Idvv* ,
==vv- /
campaignTestingvv0 ?
.vv? @

CampaignIdvv@ J
)vvJ K
;vvK L
}ww 
campaignTestingVmxx 
.xx 
Assetsxx $
=xx% &
campaignxx' /
.xx/ 0
Assetsxx0 6
;xx6 7
c1yy 
=yy 
$charyy 
;yy 
foreachzz 
(zz 
varzz 
segmentzz  
inzz! #
campaignzz$ ,
.zz, -
Segmentszz- 5
.zz5 6
OrderByzz6 =
(zz= >
xzz> ?
=>zz@ B
xzzC D
.zzD E

)zzR S
)zzS T
{{{ 
var|| 
	segmentVm|| 
=|| 

TinyMapper||  *
.||* +
Map||+ .
<||. /
CampaignSegmentVM||/ @
>||@ A
(||A B
segment||B I
)||I J
;||J K
campaignTestingVm}} !
.}}! "
Segments}}" *
.}}* +
Add}}+ .
(}}. /
	segmentVm}}/ 8
)}}8 9
;}}9 :
c1~~ 
=~~ 
segment~~ 
.~~ 

.~~* +
Replace~~+ 2
(~~2 3
campaignTestingVm~~3 D
.~~D E
OrderNumber~~E P
,~~P Q
string~~R X
.~~X Y
Empty~~Y ^
)~~^ _
.~~_ `
ToCharArray~~` k
(~~k l
)~~l m
.~~m n
Select~~n t
(~~t u
x~~u v
=>~~w y
++~~z |
x~~| }
)~~} ~
.~~~ 
FirstOrDefault	~~ �
(
~~� �
)
~~� �
;
~~� �
} 
campaignTestingVm
�� 
.
�� 
ChannelTypes
�� *
=
��+ ,
string
��- 3
.
��3 4

��4 A
(
��A B
campaignTesting
��B Q
.
��Q R
ChannelTypes
��R ^
)
��^ _
?
��` a
new
��b e
List
��f j
<
��j k
ChannelType
��k v
>
��v w
{
��x y
}
��z {
:
��| }
campaignTesting
�� 
.
��  
ChannelTypes
��  ,
.
�� 
Split
�� 
(
�� 
$str
�� 
.
�� 
ToCharArray
�� *
(
��* +
)
��+ ,
)
��, -
.
�� 
Select
�� 
(
�� 
x
�� 
=>
��  
(
��! "
ChannelType
��" -
)
��- .
System
��. 4
.
��4 5
Enum
��5 9
.
��9 :
Parse
��: ?
(
��? @
typeof
��@ F
(
��F G
ChannelType
��G R
)
��R S
,
��S T
x
��T U
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
��` a
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
��9 :
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
,
��N O
campaignTestingVm
��P a
.
��a b

WhiteLabel
��b l
)
��l m
;
��m n
return
�� 
View
�� 
(
�� 
campaignTestingVm
�� )
)
��) *
;
��* +
}
�� 	
public
�� 
ActionResult
�� 

NewSegment
�� &
(
��& '
string
��' -
orderNumber
��. 9
)
��9 :
{
�� 	
var
�� 
segment
�� 
=
�� 
new
�� 
CampaignSegment
�� -
(
��- .
)
��. /
{
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� !
(
��! "
)
��" #
,
��# $
	CreatedAt
�� 
=
�� 
DateTime
�� $
.
��$ %
Now
��% (
,
��( )

�� 
=
�� 
orderNumber
��  +
+
��, -
c1
��. 0
++
��0 2
}
�� 
;
��
return
�� 
PartialView
�� 
(
�� 
$str
�� J
,
��J K
segment
��L S
)
��S T
;
��T U
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
��4 A
)
��A B
]
��B C
public
�� 
ActionResult
�� 
EditTesting
�� '
(
��' (
[
��( )
Bind
��) -
(
��- .
Include
��. 5
=
��6 7
$str�� �
)
��
]
�� 
CampaignTestingVM
��  
campaignTestingVm
��! 2
)
��2 3
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
�� 

TinyMapper
�� 
.
�� 
Bind
�� 
<
��  
CampaignTestingVM
��  1
,
��1 2
CampaignTesting
��3 B
>
��B C
(
��C D
config
��D J
=>
��K M
{
�� 
config
�� 
.
�� 
Ignore
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
ChannelTypes
��) 5
)
��5 6
;
��6 7
config
�� 
.
�� 
Ignore
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
Assets
��) /
)
��/ 0
;
��0 1
config
�� 
.
�� 
Ignore
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
Segments
��) 1
)
��1 2
;
��2 3
}
�� 
)
�� 
;
�� 
var
�� 
campaignTesting
�� #
=
��$ %

TinyMapper
��& 0
.
��0 1
Map
��1 4
<
��4 5
CampaignTesting
��5 D
>
��D E
(
��E F
campaignTestingVm
��F W
)
��W X
;
��X Y
campaignTesting
�� 
.
��  
ChannelTypes
��  ,
=
��- .
campaignTestingVm
��/ @
.
��@ A
ChannelTypes
��A M
==
��N P
null
��Q U
?
��V W
null
��X \
:
��] ^
string
�� 
.
�� 
Join
�� 
(
��  
$str
��  #
,
��# $
campaignTestingVm
��% 6
.
��6 7
ChannelTypes
��7 C
)
��C D
;
��D E
Db
�� 
.
�� 
Entry
�� 
(
�� 
campaignTesting
�� (
)
��( )
.
��) *
State
��* /
=
��0 1
EntityState
��2 =
.
��= >
Modified
��> F
;
��F G
Db
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
��  !
var
�� 
campaignAssets
�� "
=
��# $
Db
��% '
.
��' (
CampaignAssets
��( 6
.
��6 7
FirstOrDefault
��7 E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M

CampaignId
��M W
==
��X Z
campaignTestingVm
��[ l
.
��l m

CampaignId
��m w
)
��w x
;
��x y
campaignAssets
�� 
.
�� 

�� ,
=
��- .
campaignTestingVm
��/ @
.
��@ A
Assets
��A G
.
��G H

��H U
;
��U V
campaignAssets
�� 
.
�� 
CreativeUrl
�� *
=
��+ ,
campaignTestingVm
��- >
.
��> ?
Assets
��? E
.
��E F
CreativeUrl
��F Q
;
��Q R
campaignAssets
�� 
.
�� 
ZipCodeFile
�� *
=
��+ ,
campaignTestingVm
��- >
.
��> ?
Assets
��? E
.
��E F
ZipCodeFile
��F Q
;
��Q R
campaignAssets
�� 
.
�� 

ZipCodeUrl
�� )
=
��* +
campaignTestingVm
��, =
.
��= >
Assets
��> D
.
��D E

ZipCodeUrl
��E O
;
��O P
campaignAssets
�� 
.
�� 
TestSeedFile
�� +
=
��, -
campaignTestingVm
��. ?
.
��? @
Assets
��@ F
.
��F G
TestSeedFile
��G S
;
��S T
campaignAssets
�� 
.
�� 
LiveSeedFile
�� +
=
��, -
campaignTestingVm
��. ?
.
��? @
Assets
��@ F
.
��F G
LiveSeedFile
��G S
;
��S T
Db
�� 
.
�� 
Entry
�� 
(
�� 
campaignAssets
�� '
)
��' (
.
��( )
State
��) .
=
��/ 0
EntityState
��1 <
.
��< =
Modified
��= E
;
��E F
Db
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
�� 
campaignTestingVm
�� $
.
��$ %
Segments
��% -
!=
��. 0
null
��1 5
)
��5 6
foreach
�� 
(
�� 
var
�� 
	segmentVm
�� &
in
��' )
campaignTestingVm
��* ;
.
��; <
Segments
��< D
)
��D E
{
�� 
var
�� 
segment
�� 
=
��  !
Db
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

�� )
=
��* +
	segmentVm
��, 5
.
��5 6

��6 C
}
�� 
;
�� 
Db
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
Db
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
�� 
Quantity
�� $
=
��% &
	segmentVm
��' 0
.
��0 1
Quantity
��1 9
;
��9 :
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

�� )
=
��* +
	segmentVm
��, 5
.
��5 6

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

�� )
=
��* +
	segmentVm
��, 5
.
��5 6

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

�� )
=
��* +
	segmentVm
��, 5
.
��5 6

��6 C
;
��C D
Db
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
Db
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
�� 
else
�� 
{
�� 
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
�� 
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
��9 :
ViewBag
�� 
.
�� 

WhiteLabel
�� 
=
��  
new
��! $

SelectList
��% /
(
��/ 0

��0 =
,
��= >
$str
��? F
,
��F G
$str
��H N
,
��N O
campaignTestingVm
��P a
.
��a b

WhiteLabel
��b l
)
��l m
;
��m n
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
�� 
var
�� 
segment
�� 
=
�� 
Db
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

�� %
=
��& '
(
��( )
int
��) ,
)
��, -

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
Db
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
�� 
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
�� 
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
�� 
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
�� 
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
��1 ;
,
��; <
new
��= @
{
��A B
id
��C E
=
��F G
Session
��H O
[
��O P
$str
��P T
]
��T U
}
��V W
)
��W X
;
��X Y
}
�� 
else
�� 
{
�� 
var
�� 
	errorList
�� 
=
�� 
(
��  !
from
��! %
item
��& *
in
��+ -

ModelState
��. 8
.
��8 9
Values
��9 ?
from
��! %
error
��& +
in
��, .
item
��/ 3
.
��3 4
Errors
��4 :
select
��! '
error
��( -
.
��- .
ErrorMessage
��. :
)
��: ;
.
��; <
ToList
��< B
(
��B C
)
��C D
;
��D E
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
��$ D
+
��E F
string
��G M
.
��M N
Join
��N R
(
��R S
$str
��S Z
,
��Z [
	errorList
��\ e
)
��e f
;
��f g
}
�� 
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
�� 
campaignTestingVm
�� )
.
��) *
TestingUrgency
��* 8
)
��8 9
;
��9 :
return
�� 
View
�� 
(
�� 
$str
�� %
,
��% &
campaignTestingVm
��' 8
)
��8 9
;
��9 :
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
��! "
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 B
)
��B C
]
��C D
public
�� 
ActionResult
�� 
ProcessFiles
�� (
(
��( )
[
��) *
Bind
��* .
(
��. /
Include
��/ 6
=
��7 8
$str
��9 T
)
��T U
]
��U V
CampaignTestingVM
��W h
campaignTestingVm
��i z
)
��z {
{
�� 	
var
�� 
campaign
�� 
=
�� 
Db
�� 
.
�� 
	Campaigns
�� '
.
��' (
FirstOrDefault
��( 6
(
��6 7
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Id
��> @
==
��A C
campaignTestingVm
��D U
.
��U V

CampaignId
��V `
)
��` a
;
��a b

�� 
.
�� 
Enqueue
�� !
(
��! "
(
��" #
)
��# $
=>
��% '

��( 5
.
��5 6$
ProcessAssetUpdateUrls
��6 L
(
��L M

UploadPath
��M W
,
��W X
campaign
��Y a
.
��a b
OrderNumber
��b m
)
��m n
)
��n o
;
��o p
TempData
�� 
[
�� 
$str
�� 
]
�� 
=
��  !
$str
��" Q
;
��Q R
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 1
,
��1 2
new
��3 6
{
��7 8
id
��9 ;
=
��< =
campaignTestingVm
��> O
.
��O P
Id
��P R
}
��S T
)
��T U
;
��U V
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
��! "
[
�� 	
MultipleButton
��	 
(
�� 
Name
�� 
=
�� 
$str
�� '
,
��' (
Argument
��) 1
=
��2 3
$str
��4 K
)
��K L
]
��L M
public
�� 
ActionResult
�� #
FetchProcessDataFiles
�� 1
(
��1 2
[
��2 3
Bind
��3 7
(
��7 8
Include
��8 ?
=
��@ A
$str��B �
)��� �
]��� �!
CampaignTestingVM��� �!
campaignTestingVm��� �
)��� �
{
�� 	
try
�� 
{
�� 
var
�� 
campaign
�� 
=
�� 
Db
�� !
.
��! "
	Campaigns
��" +
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
��* ,
campaignTestingVm
��- >
.
��> ?

CampaignId
��? I
)
��I J
;
��J K
if
�� 
(
�� 
campaign
�� 
.
�� 
Segments
�� $
.
��$ %
Count
��% *
==
��+ -
$num
��. /
)
��/ 0
throw
�� 
new
�� 
AdsException
�� *
(
��* +
$str
��+ H
)
��H I
;
��I J

�� 
.
�� 
Enqueue
�� %
(
��% &
(
��& '
)
��' (
=>
��) +
DataFileProcessor
��, =
.
��= >
FetchSQLDataFile
��> N
(
��N O

UploadPath
��O Y
,
��Y Z
campaign
��[ c
.
��c d
OrderNumber
��d o
,
��o p
campaign
��q y
.
��y z
Assets��z �
.��� �
ZipCodeFile��� �
,��� �!
campaignTestingVm��� �
.��� � 
DataFileQuantity��� �
)��� �
)��� �
;��� �
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
��& i
;
��i j
}
�� 
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
�� 
TempData
�� 
[
�� 
$str
��  
]
��  !
=
��" #
ex
��$ &
.
��& '
Message
��' .
;
��. /
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 1
,
��1 2
new
��3 6
{
��7 8
id
��9 ;
=
��< =
campaignTestingVm
��> O
.
��O P
Id
��P R
}
��S T
)
��T U
;
��U V
}
�� 	
}
�� 
}�� ��
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Controllers\TrackingController.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Controllers !
{ 
[ 
	Authorize 
] 
public 

class 
TrackingController #
:$ %
BaseController& 4
{ 
public 
ActionResult 
Index !
(! "
CampaignSearchVM" 2
sc3 5
)5 6
{ 	
ViewBag 
. 
CurrentSort 
=  !
sc" $
.$ %
	sortOrder% .
;. /
ViewBag 
.  
CampaignNameSortParm (
=) *
sc+ -
.- .
	sortOrder. 7
==8 :
$str; I
?J K
$strL _
:` a
$strb p
;p q
ViewBag 
. !
BroadcastDateSortParm )
=* +
sc, .
.. /
	sortOrder/ 8
==9 ;
$str< K
?L M
$strN b
:c d
$stre t
;t u
ViewBag 
. 
CreatedBySortParm %
=& '
sc( *
.* +
	sortOrder+ 4
==5 7
$str8 C
?D E
$strF V
:W X
$strY d
;d e
ViewBag 
. 
StatusSortParm "
=# $
sc% '
.' (
	sortOrder( 1
==2 4
$str5 =
?> ?
$str@ M
:N O
$strP X
;X Y
ViewBag 
. 
OrderNumberSortParm '
=( )
sc* ,
., -
	sortOrder- 6
==7 9
$str: G
?H I
$strJ \
:] ^
$str_ l
;l m
var 
	campagins 
= 
Db 
. 
	Campaigns (
.   
Include   
(   
x   
=>   
x   
.    
Approved    (
)  ( )
.!! 
Include!! 
(!! 
x!! 
=>!! 
x!! 
.!!  
ProDatas!!  (
)!!( )
."" 
Include"" 
("" 
x"" 
=>"" 
x"" 
.""  
	Trackings""  )
)"") *
.## 
OrderByDescending## "
(##" #
x### $
=>##% '
x##( )
.##) *
	CreatedAt##* 3
)##3 4
.$$ 
Where$$ 
($$ 
x$$ 
=>$$ 
x$$ 
.$$ 
Status$$ $
==$$% '
($$( )
int$$) ,
)$$, -
CampaignStatus$$- ;
.$$; <

Monitoring$$< F
)$$F G
.%% 
ToList%% 
(%% 
)%% 
;%% 
switch'' 
('' 
sc'' 
.'' 
	sortOrder''  
)''  !
{(( 
case)) 
$str)) #
:))# $
	campagins** 
=** 
	campagins**  )
.**) *
OrderBy*** 1
(**1 2
s**2 3
=>**4 6
s**7 8
.**8 9
CampaignName**9 E
)**E F
.**F G
ToList**G M
(**M N
)**N O
;**O P
break++ 
;++ 
case,, 
$str,, (
:,,( )
	campagins-- 
=-- 
	campagins--  )
.--) *
OrderByDescending--* ;
(--; <
s--< =
=>--> @
s--A B
.--B C
CampaignName--C O
)--O P
.--P Q
ToList--Q W
(--W X
)--X Y
;--Y Z
break.. 
;.. 
case// 
$str// $
://$ %
	campagins00 
=00 
	campagins00  )
.00) *
OrderBy00* 1
(001 2
s002 3
=>004 6
s007 8
.008 9

)00F G
.00G H
ToList00H N
(00N O
)00O P
;00P Q
break11 
;11 
case22 
$str22 )
:22) *
	campagins33 
=33 
	campagins33  )
.33) *
OrderByDescending33* ;
(33; <
s33< =
=>33> @
s33A B
.33B C

)33P Q
.33Q R
ToList33R X
(33X Y
)33Y Z
;33Z [
break44 
;44 
case55 
$str55  
:55  !
	campagins66 
=66 
	campagins66  )
.66) *
OrderBy66* 1
(661 2
s662 3
=>664 6
s667 8
.668 9
	CreatedBy669 B
)66B C
.66C D
ToList66D J
(66J K
)66K L
;66L M
break77 
;77 
case88 
$str88 %
:88% &
	campagins99 
=99 
	campagins99  )
.99) *
OrderByDescending99* ;
(99; <
s99< =
=>99> @
s99A B
.99B C
	CreatedBy99C L
)99L M
.99M N
ToList99N T
(99T U
)99U V
;99V W
break:: 
;:: 
case;; 
$str;; 
:;; 
	campagins<< 
=<< 
	campagins<<  )
.<<) *
OrderBy<<* 1
(<<1 2
s<<2 3
=><<4 6
s<<7 8
.<<8 9
Status<<9 ?
)<<? @
.<<@ A
ToList<<A G
(<<G H
)<<H I
;<<I J
break== 
;== 
case>> 
$str>> "
:>>" #
	campagins?? 
=?? 
	campagins??  )
.??) *
OrderByDescending??* ;
(??; <
s??< =
=>??> @
s??A B
.??B C
Status??C I
)??I J
.??J K
ToList??K Q
(??Q R
)??R S
;??S T
break@@ 
;@@ 
caseAA 
$strAA "
:AA" #
	campaginsBB 
=BB 
	campaginsBB  )
.BB) *
OrderByBB* 1
(BB1 2
sBB2 3
=>BB4 6
sBB7 8
.BB8 9
OrderNumberBB9 D
)BBD E
.BBE F
ToListBBF L
(BBL M
)BBM N
;BBN O
breakCC 
;CC 
caseDD 
$strDD '
:DD' (
	campaginsEE 
=EE 
	campaginsEE  )
.EE) *
OrderByDescendingEE* ;
(EE; <
sEE< =
=>EE> @
sEEA B
.EEB C
OrderNumberEEC N
)EEN O
.EEO P
ToListEEP V
(EEV W
)EEW X
;EEX Y
breakFF 
;FF 
defaultGG 
:GG 
	campaginsHH 
=HH 
	campaginsHH  )
.HH) *
OrderByDescendingHH* ;
(HH; <
sHH< =
=>HH> @
sHHA B
.HHB C
	CreatedAtHHC L
)HHL M
.HHM N
ToListHHN T
(HHT U
)HHU V
;HHV W
breakII 
;II 
}JJ 
ViewBagLL 
.LL 

SearchTypeLL 
=LL  
scLL! #
.LL# $

searchTypeLL$ .
;LL. /
switchMM 
(MM 
scMM 
.MM 

searchTypeMM !
)MM! "
{NN 
caseOO 
$strOO 
:OO 
ifPP 
(PP 
!PP 
stringPP 
.PP  

(PP- .
scPP. 0
.PP0 1
basicStringPP1 <
)PP< =
)PP= >
{QQ 
	campaginsRR !
=RR" #
	campaginsRR$ -
.RR- .
WhereRR. 3
(RR3 4
sRR4 5
=>RR6 8
sSS 
.SS 
OrderNumberSS %
.SS% &
EqualsSS& ,
(SS, -
scSS- /
.SS/ 0
basicStringSS0 ;
)SS; <
||SS= ?
sTT 
.TT $
ReBroadcastedOrderNumberTT 2
==TT3 5
scTT6 8
.TT8 9
basicStringTT9 D
||TTE G
sUU 
.UU 
CampaignNameUU &
.UU& '
IndexOfUU' .
(UU. /
scUU/ 1
.UU1 2
basicStringUU2 =
,UU= >
StringComparisonUU? O
.UUO P&
InvariantCultureIgnoreCaseUUP j
)UUj k
>=UUl n
$numUUo p
)UUp q
.UUq r
ToListUUr x
(UUx y
)UUy z
;UUz {
ViewBagVV 
.VV  
BasicStringSearchedVV  3
=VV4 5
scVV6 8
.VV8 9
basicStringVV9 D
;VVD E
}WW 
elseXX 
ifXX 
(XX 
!XX 
stringXX $
.XX$ %

(XX2 3
scXX3 5
.XX5 6
basicStatusXX6 A
)XXA B
)XXB C
{YY 
intZZ 
statusZZ "
=ZZ# $
intZZ% (
.ZZ( )
ParseZZ) .
(ZZ. /
scZZ/ 1
.ZZ1 2
basicStatusZZ2 =
)ZZ= >
;ZZ> ?
if[[ 
([[ 
status[[ "
==[[# %
([[& '
int[[' *
)[[* +
CampaignStatus[[+ 9
.[[9 :

)[[G H
	campagins\\ %
=\\& '
	campagins\\( 1
.\\1 2
Where\\2 7
(\\7 8
s\\8 9
=>\\: <
s\\= >
.\\> ?

)\\L M
.\\M N
ToList\\N T
(\\T U
)\\U V
;\\V W
else]] 
if]] 
(]]  !
status]]! '
==]]( *
(]]+ ,
int]], /
)]]/ 0
CampaignStatus]]0 >
.]]> ?
NotRebroadcasted]]? O
)]]O P
	campagins^^ %
=^^& '
	campagins^^( 1
.^^1 2
Where^^2 7
(^^7 8
s^^8 9
=>^^: <
s^^= >
.^^> ?
ReBroadCast^^? J
&&^^K M
!^^N O
s^^O P
.^^P Q

)^^^ _
.^^_ `
ToList^^` f
(^^f g
)^^g h
;^^h i
else__ 
	campagins`` %
=``& '
	campagins``( 1
.``1 2
Where``2 7
(``7 8
s``8 9
=>``: <
s``= >
.``> ?
Status``? E
==``F H
status``I O
)``O P
.``P Q
ToList``Q W
(``W X
)``X Y
;``Y Z
ViewBagaa 
.aa  
BasicStatusSearchedaa  3
=aa4 5
scaa6 8
.aa8 9
basicStatusaa9 D
;aaD E
}bb 
elsecc 
ifcc 
(cc 
!cc 
stringcc $
.cc$ %

(cc2 3
sccc3 5
.cc5 6
basicOrderNumbercc6 F
)ccF G
)ccG H
{dd 
	campaginsee !
=ee" #
	campaginsee$ -
.ee- .
Whereee. 3
(ee3 4
see4 5
=>ee6 8
see9 :
.ee: ;
Idee; =
.ee= >
ToStringee> F
(eeF G
)eeG H
.eeH I
EqualseeI O
(eeO P
sceeP R
.eeR S
basicOrderNumbereeS c
)eec d
)eed e
.eee f
ToListeef l
(eel m
)eem n
;een o
}ff 
breakgg 
;gg 
casehh 
$strhh 
:hh  
ifii 
(ii 
!ii 
stringii 
.ii  

(ii- .
scii. 0
.ii0 1
advancedStatusii1 ?
)ii? @
)ii@ A
{jj 
intkk 
statuskk "
=kk# $
intkk% (
.kk( )
Parsekk) .
(kk. /
sckk/ 1
.kk1 2
advancedStatuskk2 @
)kk@ A
;kkA B
ifll 
(ll 
statusll "
==ll# %
(ll& '
intll' *
)ll* +
CampaignStatusll+ 9
.ll9 :

)llG H
	campaginsmm %
=mm& '
	campaginsmm( 1
.mm1 2
Wheremm2 7
(mm7 8
smm8 9
=>mm: <
smm= >
.mm> ?
OrderNumbermm? J
.mmJ K
EndsWithmmK S
(mmS T
$strmmT Y
)mmY Z
)mmZ [
.mm[ \
ToListmm\ b
(mmb c
)mmc d
;mmd e
elsenn 
	campaginsoo %
=oo& '
	campaginsoo( 1
.oo1 2
Whereoo2 7
(oo7 8
soo8 9
=>oo: <
soo= >
.oo> ?
Statusoo? E
==ooF H
statusooI O
)ooO P
.ooP Q
ToListooQ W
(ooW X
)ooX Y
;ooY Z
ViewBagpp 
.pp  "
AdvancedStatusSearchedpp  6
=pp7 8
scpp9 ;
.pp; <
advancedStatuspp< J
;ppJ K
}qq 
ifrr 
(rr 
!rr 
stringrr 
.rr  

(rr- .
scrr. 0
.rr0 1
advancedUserrr1 =
)rr= >
)rr> ?
{ss 
	campaginstt !
=tt" #
	campaginstt$ -
.tt- .
Wherett. 3
(tt3 4
stt4 5
=>tt6 8
stt9 :
.tt: ;
	CreatedBytt; D
==ttE G
scttH J
.ttJ K
advancedUserttK W
)ttW X
.ttX Y
ToListttY _
(tt_ `
)tt` a
;tta b
ViewBaguu 
.uu   
AdvancedUserSearcheduu  4
=uu5 6
scuu7 9
.uu9 :
advancedUseruu: F
;uuF G
}vv 
ifxx 
(xx 
!xx 
stringxx 
.xx  

(xx- .
scxx. 0
.xx0 1
campaignNamexx1 =
)xx= >
)xx> ?
{yy 
sczz 
.zz 
campaignNamezz '
=zz( )
sczz* ,
.zz, -
campaignNamezz- 9
.zz9 :
ToLowerInvariantzz: J
(zzJ K
)zzK L
;zzL M
	campagins{{ !
={{" #
	campagins{{$ -
.{{- .
Where{{. 3
({{3 4
s{{4 5
=>{{6 8
s{{9 :
.{{: ;
CampaignName{{; G
.{{G H
IndexOf{{H O
({{O P
sc{{P R
.{{R S
campaignName{{S _
,{{_ `
StringComparison{{a q
.{{q r%
CurrentCultureIgnoreCase	{{r �
)
{{� �
>=
{{� �
$num
{{� �
)
{{� �
.
{{� �
ToList
{{� �
(
{{� �
)
{{� �
;
{{� �
ViewBag|| 
.||  
CampaignName||  ,
=||- .
sc||/ 1
.||1 2
campaignName||2 >
;||> ?
}}} 
if 
( 
! 
string 
.  

(- .
sc. 0
.0 1
isTested1 9
)9 :
): ;
{
�� 
bool
�� 
isTested
�� %
=
��& '
bool
��( ,
.
��, -
Parse
��- 2
(
��2 3
sc
��3 5
.
��5 6
isTested
��6 >
)
��> ?
;
��? @
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
��: ;
Testing
��; B
!=
��C E
null
��F J
&&
��6 8
s
��9 :
.
��: ;
Testing
��; B
?
��B C
.
��C D
IsTested
��D L
==
��M O
isTested
��P X
)
��X Y
.
��Y Z
ToList
��Z `
(
��` a
)
��a b
;
��b c
ViewBag
�� 
.
��  
IsTested
��  (
=
��) *
sc
��+ -
.
��- .
isTested
��. 6
;
��6 7
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
��  

��  -
(
��- .
sc
��. 0
.
��0 1
orderedFrom
��1 <
)
��< =
)
��= >
{
�� 
DateTime
��  
dateFrom
��! )
=
��* +
DateTime
��, 4
.
��4 5

ParseExact
��5 ?
(
��? @
sc
��@ B
.
��B C
orderedFrom
��C N
,
��N O
$str
��P \
,
��\ ]
CultureInfo
��^ i
.
��i j
InvariantCulture
��j z
)
��z {
;
��{ |
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
��: ;
	CreatedAt
��; D
.
��D E
Date
��E I
>=
��J L
dateFrom
��M U
.
��U V
Date
��V Z
)
��Z [
.
��[ \
ToList
��\ b
(
��b c
)
��c d
;
��d e
ViewBag
�� 
.
��  
OrderedFrom
��  +
=
��, -
sc
��. 0
.
��0 1
orderedFrom
��1 <
;
��< =
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
��  

��  -
(
��- .
sc
��. 0
.
��0 1
	orderedTo
��1 :
)
��: ;
)
��; <
{
�� 
DateTime
��  
dateTo
��! '
=
��( )
DateTime
��* 2
.
��2 3

ParseExact
��3 =
(
��= >
sc
��> @
.
��@ A
	orderedTo
��A J
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
��: ;
	CreatedAt
��; D
.
��D E
Date
��E I
<=
��J L
dateTo
��M S
.
��S T
Date
��T X
)
��X Y
.
��Y Z
ToList
��Z `
(
��` a
)
��a b
;
��b c
ViewBag
�� 
.
��  
	OrderedTo
��  )
=
��* +
sc
��, .
.
��. /
	orderedTo
��/ 8
;
��8 9
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
��  

��  -
(
��- .
sc
��. 0
.
��0 1

��1 >
)
��> ?
)
��? @
{
�� 
DateTime
��  
dateFrom
��! )
=
��* +
DateTime
��, 4
.
��4 5

ParseExact
��5 ?
(
��? @
sc
��@ B
.
��B C

��C P
,
��P Q
$str
��R ^
,
��^ _
CultureInfo
��` k
.
��k l
InvariantCulture
��l |
)
��| }
;
��} ~
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
��: ;

��; H
?
��H I
.
��I J
Date
��J N
>=
��O Q
dateFrom
��R Z
.
��Z [
Date
��[ _
)
��_ `
.
��` a
ToList
��a g
(
��g h
)
��h i
;
��i j
ViewBag
�� 
.
��  

��  -
=
��. /
sc
��0 2
.
��2 3

��3 @
;
��@ A
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
��  

��  -
(
��- .
sc
��. 0
.
��0 1
broadcastTo
��1 <
)
��< =
)
��= >
{
�� 
DateTime
��  
dateTo
��! '
=
��( )
DateTime
��* 2
.
��2 3

ParseExact
��3 =
(
��= >
sc
��> @
.
��@ A
broadcastTo
��A L
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
��: ;

��; H
?
��H I
.
��I J
Date
��J N
<=
��O Q
dateTo
��R X
.
��X Y
Date
��Y ]
)
��] ^
.
��^ _
ToList
��_ e
(
��e f
)
��f g
;
��g h
ViewBag
�� 
.
��  
BroadcastTo
��  +
=
��, -
sc
��. 0
.
��0 1
broadcastTo
��1 <
;
��< =
}
�� 
break
�� 
;
�� 
}
�� 
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
�� 
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
�� 
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
�� 
trackingVms
�� 
=
�� 
new
�� !
List
��" &
<
��& ' 
CampaignTrackingVm
��' 9
>
��9 :
(
��: ;
)
��; <
;
��< =
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
�� 
foreach
�� 
(
�� 
var
�� 
campaignTracking
�� -
in
��. 0
campaign
��1 9
.
��9 :
	Trackings
��: C
)
��C D
{
�� 
var
�� 
model
�� 
=
��  
CampaignTrackingVm
��  2
.
��2 3"
FromCampaignTracking
��3 G
(
��G H
campaign
��H P
,
��P Q
campaignTracking
��R b
)
��b c
;
��c d
trackingVms
�� 
.
��  
Add
��  #
(
��# $
model
��$ )
)
��) *
;
��* +
}
�� 
}
�� 
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
�� 
trackingVms
�� #
.
��# $
OrderBy
��$ +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3
OrderNumber
��3 >
)
��> ?
.
��? @
ToPagedList
��@ K
(
��K L

pageNumber
��L V
,
��V W
PageSize
��X `
)
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
�� 
Report
�� "
(
��" #
Guid
��# '
?
��' (
id
��) +
)
��+ ,
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
��  
Approved
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
��  
	Trackings
��  )
)
��) *
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
�� 
throw
�� 
new
�� 

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
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� !
==
��" $
null
��% )
)
��) *
{
�� 
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
��$ `
;
��` a
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
var
�� 
trackingVms
�� 
=
�� 
new
�� !
List
��" &
<
��& ' 
CampaignTrackingVm
��' 9
>
��9 :
(
��: ;
)
��; <
;
��< =
foreach
�� 
(
�� 
var
�� 
campaignTracking
�� )
in
��* ,
campaign
��- 5
.
��5 6
	Trackings
��6 ?
)
��? @
{
�� 
var
�� 
model
�� 
=
��  
CampaignTrackingVm
�� .
.
��. /"
FromCampaignTracking
��/ C
(
��C D
campaign
��D L
,
��L M
campaignTracking
��N ^
)
��^ _
;
��_ `
trackingVms
�� 
.
�� 
Add
�� 
(
��  
model
��  %
)
��% &
;
��& '
}
�� 
trackingVms
�� 
=
�� 
trackingVms
�� %
.
��% &
OrderBy
��& -
(
��- .
x
��. /
=>
��0 2
x
��3 4
.
��4 5
OrderNumber
��5 @
)
��@ A
.
��A B
ToList
��B H
(
��H I
)
��I J
;
��J K
return
�� 
View
�� 
(
�� 
trackingVms
�� #
)
��# $
;
��$ %
}
�� 	
public
�� 
ActionResult
�� 
DownloadReport
�� *
(
��* +
Guid
��+ /
?
��/ 0
id
��1 3
,
��3 4
Guid
��5 9
?
��9 :

trackingId
��; E
)
��E F
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
�� 
throw
�� 
new
�� 

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
�� 
Campaign
�� 
campaign
�� 
=
�� 
Db
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
��  
	Trackings
��  )
)
��) *
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
�� 
throw
�� 
new
�� 

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
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 
Approved
�� !
==
��" $
null
��% )
)
��) *
{
�� 
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
��$ `
;
��` a
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
var
�� 
campaignTracking
��  
=
��! "
campaign
��# +
.
��+ ,
	Trackings
��, 5
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
��O Q

trackingId
��R \
)
��\ ]
;
��] ^
if
�� 
(
�� 
campaignTracking
��  
==
��! #
null
��$ (
)
��( )
{
�� 
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
��$ A
;
��A B
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
,
��/ 0
$str
��1 <
)
��< =
;
��= >
}
�� 
var
�� 
model
�� 
=
��  
CampaignTrackingVm
�� *
.
��* +"
FromCampaignTracking
��+ ?
(
��? @
campaign
��@ H
,
��H I
campaignTracking
��J Z
)
��Z [
;
��[ \
string
�� 
creativeUrl
�� 
=
��  
campaign
��! )
.
��) *
Assets
��* 0
.
��0 1
CreativeUrl
��1 <
,
��< =

�� 
=
�� 
$"
��  "
{
��" #

UploadPath
��# -
}
��- .
\\
��. 0
{
��0 1
model
��1 6
.
��6 7
OrderNumber
��7 B
}
��B C
t.png
��C H
"
��H I
,
��I J
	imagePath
�� 
=
�� 
$"
�� 
{
�� 

UploadPath
�� )
}
��) *
\\
��* ,
{
��, -
model
��- 2
.
��2 3
OrderNumber
��3 >
}
��> ?
.png
��? C
"
��C D
,
��D E
fileName
�� 
=
�� 
$"
�� 
{
�� 
model
�� #
.
��# $
OrderNumber
��$ /
}
��/ 0
.xlsx
��0 5
"
��5 6
,
��6 7
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
DownloadPath
��( 4
,
��4 5
fileName
��6 >
)
��> ?
;
��? @
string
�� 
logoFilePath
�� 
=
��  !
!
��" #
string
��# )
.
��) *

��* 7
(
��7 8
LoggedInUser
��8 D
?
��D E
.
��E F
CompanyLogo
��F Q
)
��Q R
?
�� 
$"
�� 
{
�� 

ImagesPath
�� 
}
��  
\\
��  "
{
��" #
LoggedInUser
��# /
.
��/ 0
CompanyLogo
��0 ;
}
��; <
"
��< =
:
�� 
$"
�� 
{
�� 

ImagesPath
�� 
}
��  
\\logo1.png
��  +
"
��+ ,
;
��, -
var
�� 
helper
�� 
=
�� 
new
�� 
ImageHelper
�� (
(
��( )
creativeUrl
��) 4
,
��4 5

��6 C
)
��C D
;
��D E
if
�� 
(
�� 
!
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� 
.
��  
Exists
��  &
(
��& '
	imagePath
��' 0
)
��0 1
)
��1 2
{
�� 
helper
�� 
.
�� 
Capture
�� 
(
�� 
)
��  
;
��  !
if
�� 
(
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Exists
��# )
(
��) *

��* 7
)
��7 8
)
��8 9
helper
�� 
.
�� 
ResizeImage
�� &
(
��& '

��' 4
,
��4 5
	imagePath
��6 ?
,
��? @
$num
��A D
,
��D E
$num
��F I
,
��I J
true
��K O
)
��O P
;
��P Q
if
�� 
(
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Exists
��# )
(
��) *

��* 7
)
��7 8
)
��8 9
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Delete
��# )
(
��) *

��* 7
)
��7 8
;
��8 9
}
�� 
string
�� 
templateFile
�� 
;
��  
if
�� 
(
�� 
LoggedInUser
�� 
?
�� 
.
�� 
ReportTemplate
�� ,
==
��- /
$str
��0 3
||
��4 6
string
��7 =
.
��= >

��> K
(
��K L
LoggedInUser
��L X
?
��X Y
.
��Y Z
ReportTemplate
��Z h
)
��h i
)
��i j
templateFile
�� 
=
�� 
$"
�� !(
~/Templates/Tracking1.xlsx
��! ;
"
��; <
;
��< =
else
�� 
templateFile
�� 
=
�� 
$"
�� !(
~/Templates/Tracking2.xlsx
��! ;
"
��; <
;
��< =
string
�� 
logoResized
�� 
=
��  
$"
��! #
{
��# $

ImagesPath
��$ .
}
��. /
\\logoResized.png
��/ @
"
��@ A
;
��A B
if
�� 
(
�� 
templateFile
�� 
==
�� 
$"
��  "(
~/Templates/Tracking1.xlsx
��" <
"
��< =
)
��= >
{
�� 
helper
�� 
.
�� 
ResizeImage
�� "
(
��" #
logoFilePath
��# /
,
��/ 0
logoResized
��1 <
,
��< =
$num
��> A
,
��A B
$num
��C F
,
��F G
true
��H L
)
��L M
;
��M N
TrackingReports
�� 
.
��  
GenerateTemplate1
��  1
(
��1 2
model
��2 7
,
��7 8
Server
��9 ?
.
��? @
MapPath
��@ G
(
��G H
templateFile
��H T
)
��T U
,
��U V
logoResized
��W b
,
��b c
	imagePath
��d m
,
��m n
filePath
��o w
)
��w x
;
��x y
}
�� 
else
�� 
{
�� 
helper
�� 
.
�� 
ResizeImage
�� "
(
��" #
logoFilePath
��# /
,
��/ 0
logoResized
��1 <
,
��< =
$num
��> A
,
��A B
$num
��C E
,
��E F
true
��G K
)
��K L
;
��L M
TrackingReports
�� 
.
��  
GenerateTemplate2
��  1
(
��1 2
model
��2 7
,
��7 8
Server
��9 ?
.
��? @
MapPath
��@ G
(
��G H
templateFile
��H T
)
��T U
,
��U V
logoResized
��W b
,
��b c
	imagePath
��d m
,
��m n
filePath
��o w
)
��w x
;
��x y
}
�� 
return
�� 
File
�� 
(
�� 
filePath
��  
,
��  !
$str
��" e
,
��e f
fileName
��g o
)
��o p
;
��p q
}
�� 	
public
�� 

JsonResult
�� 
RefreshProData
�� (
(
��( )
string
��) /
orderNumber
��0 ;
)
��; <
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
orderNumber
�� 
==
��  "
null
��# '
)
��' (
{
�� 
throw
�� 
new
�� 
AdsException
�� *
(
��* +
$str
��+ A
)
��A B
;
��B C
}
�� 
Campaign
�� 
campaign
�� !
=
��" #
Db
��$ &
.
��& '
	Campaigns
��' 0
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� !
x
��" #
.
��# $
Approved
��$ ,
)
��, -
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� !
x
��" #
.
��# $
Segments
��$ ,
)
��, -
.
�� 
Include
�� 
(
�� 
x
�� 
=>
�� !
x
��" #
.
��# $
	Trackings
��$ -
)
��- .
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Status
��" (
==
��) +
(
��, -
int
��- 0
)
��0 1
CampaignStatus
��1 ?
.
��? @

Monitoring
��@ J
||
��K M
x
��N O
.
��O P
Segments
��P X
.
��X Y
Any
��Y \
(
��\ ]
s
��] ^
=>
��_ a
s
��b c
.
��c d

��d q
==
��r t
(
��u v
int
��v y
)
��y z

.��� �

Monitoring��� �
)��� �
)��� �
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
Approved
��" *
!=
��+ -
null
��. 2
)
��2 3
.
�� 
FirstOrDefault
�� #
(
��# $
x
��$ %
=>
��& (
x
��) *
.
��* +
OrderNumber
��+ 6
==
��7 9
orderNumber
��: E
)
��E F
;
��F G
if
�� 
(
�� 
campaign
�� 
!=
�� 
null
�� #
)
��# $
ProDataApiManager
�� %
.
��% &%
FetchAndUpdateTrackings
��& =
(
��= >
Db
��> @
,
��@ A
campaign
��B J
)
��J K
;
��K L
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
)
��B C
;
��C D
}
�� 
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
�� 
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
)
��^ _
;
��_ `
}
�� 
}
�� 	
}
�� 
}�� �@
8E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Global.asax.cs
	namespace
WFP
 
.
ICT
.
Web
{ 
public 

class 
MvcApplication 
:  !
HttpApplication" 1
{ 
	protected 
void 
Application_Start (
(( )
)) *
{ 	
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
GlobalConfiguration 
.  
	Configure  )
() *
WebApiConfig* 6
.6 7
Register7 ?
)? @
;@ A
FilterConfig 
. !
RegisterGlobalFilters .
(. /

.< =
Filters= D
)D E
;E F
RouteConfig 
. 
RegisterRoutes &
(& '

RouteTable' 1
.1 2
Routes2 8
)8 9
;9 :
BundleConfig 
. 
RegisterBundles (
(( )
BundleTable) 4
.4 5
Bundles5 <
)< =
;= > 
HangfireBootstrapper  
.  !
Instance! )
.) *
Start* /
(/ 0
)0 1
;1 2
} 	
	protected   
void   
Application_End   &
(  & '
object  ' -
sender  . 4
,  4 5
	EventArgs  6 ?
e  @ A
)  A B
{!! 	 
HangfireBootstrapper""  
.""  !
Instance""! )
."") *
Stop""* .
("". /
)""/ 0
;""0 1
}## 	
	protected%% 
void%% 
Application_Error%% (
(%%( )
object%%) /
sender%%0 6
,%%6 7
	EventArgs%%8 A
e%%B C
)%%C D
{&& 	
var'' 
httpContext'' 
='' 
('' 
(''  
MvcApplication''  .
)''. /
sender''/ 5
)''5 6
.''6 7
Context''7 >
;''> ?
var(( 
currentController(( !
=((" #
$str(($ '
;((' (
var)) 

=)) 
$str))  #
;))# $
var** 
currentRouteData**  
=**! "

RouteTable**# -
.**- .
Routes**. 4
.**4 5
GetRouteData**5 A
(**A B
new**B E
HttpContextWrapper**F X
(**X Y
httpContext**Y d
)**d e
)**e f
;**f g
if,, 
(,, 
currentRouteData,,  
!=,,! #
null,,$ (
),,( )
{-- 
if.. 
(.. 
currentRouteData.. $
...$ %
Values..% +
[..+ ,
$str.., 8
]..8 9
!=..: <
null..= A
&&..B D
!..E F
string..F L
...L M

(..Z [
currentRouteData..[ k
...k l
Values..l r
[..r s
$str..s 
]	.. �
.
..� �
ToString
..� �
(
..� �
)
..� �
)
..� �
)
..� �
{// 
currentController00 %
=00& '
currentRouteData00( 8
.008 9
Values009 ?
[00? @
$str00@ L
]00L M
.00M N
ToString00N V
(00V W
)00W X
;00X Y
}11 
if33 
(33 
currentRouteData33 $
.33$ %
Values33% +
[33+ ,
$str33, 4
]334 5
!=336 8
null339 =
&&33> @
!33A B
string33B H
.33H I

(33V W
currentRouteData33W g
.33g h
Values33h n
[33n o
$str33o w
]33w x
.33x y
ToString	33y �
(
33� �
)
33� �
)
33� �
)
33� �
{44 

=55" #
currentRouteData55$ 4
.554 5
Values555 ;
[55; <
$str55< D
]55D E
.55E F
ToString55F N
(55N O
)55O P
;55P Q
}66 
}77 
var88 
ex88 
=88 
Server88 
.88 
GetLastError88 (
(88( )
)88) *
;88* +
try:: 
{;; 
EmailHelper<< 
.<< 
SendErrorEmail<< *
(<<* + 
ConfigurationManager<<+ ?
.<<? @
AppSettings<<@ K
[<<K L
$str<<L _
]<<_ `
,<<` a
ex<<b d
,<<d e
currentController<<f w
,<<w x

)==! "
;==" #
}>> 
catch?? 
(?? 
	Exception?? 
exx??  
)??  !
{@@ 
}AA 
varCC 
	routeDataCC 
=CC 
newCC 
	RouteDataCC  )
(CC) *
)CC* +
;CC+ ,
varDD 
actionDD 
=DD 
$strDD '
;DD' (
ifFF 
(FF 
exFF 
isFF 

)FF# $
{GG 
varHH 
httpExHH 
=HH 
exHH 
asHH  "

;HH0 1
switchJJ 
(JJ 
httpExJJ 
.JJ 
GetHttpCodeJJ *
(JJ* +
)JJ+ ,
)JJ, -
{KK 
caseLL 
$numLL 
:LL 
actionMM 
=MM  
$strMM! -
;MM- .
breakNN 
;NN 
caseOO 
$numOO 
:OO 
actionPP 
=PP  
$strPP! +
;PP+ ,
breakQQ 
;QQ 
}SS 
}TT 
httpContextVV 
.VV 

ClearErrorVV "
(VV" #
)VV# $
;VV$ %
httpContextWW 
.WW 
ResponseWW  
.WW  !
ClearWW! &
(WW& '
)WW' (
;WW( )
httpContextXX 
.XX 
ResponseXX  
.XX  !

StatusCodeXX! +
=XX, -
exXX. 0
isXX1 3

?XXB C
(XXD E
(XXE F

)XXS T
exXXT V
)XXV W
.XXW X
GetHttpCodeXXX c
(XXc d
)XXd e
:XXf g
$numXXh k
;XXk l
httpContextYY 
.YY 
ResponseYY  
.YY  !"
TrySkipIisCustomErrorsYY! 7
=YY8 9
trueYY: >
;YY> ?
	routeData[[ 
.[[ 
Values[[ 
[[[ 
$str[[ )
][[) *
=[[+ ,
$str[[- 4
;[[4 5
	routeData\\ 
.\\ 
Values\\ 
[\\ 
$str\\ %
]\\% &
=\\' (
action\\) /
;\\/ 0
	routeData]] 
.]] 
Values]] 
[]] 
$str]] (
]]]( )
=]]* +
new]], /
HandleErrorInfo]]0 ?
(]]? @
ex]]@ B
,]]B C
currentController]]D U
,]]U V

)]]d e
;]]e f
IController__ 
errorController__ '
=__( )
new__* -
ErrorController__. =
(__= >
)__> ?
;__? @
HttpContextWrapper`` 
wrapper`` &
=``' (
new``) ,
HttpContextWrapper``- ?
(``? @
httpContext``@ K
)``K L
;``L M
varaa 
rcaa 
=aa 
newaa 
RequestContextaa '
(aa' (
wrapperaa( /
,aa/ 0
	routeDataaa1 :
)aa: ;
;aa; <
errorControllerbb 
.bb 
Executebb #
(bb# $
rcbb$ &
)bb& '
;bb' (
}cc 	
}dd 
}ee �
KE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\AjaxAuthorizeAttribute.cs
	namespace 	
WFP
 
.
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

(		9 :
)		: ;
)		; <
{

 
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
context
.
Result
=
new

JsonResult
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
} 
else 
{ 
base 
. %
HandleUnauthorizedRequest .
(. /
context/ 6
)6 7
;7 8
} 
} 	
} 
} �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\AuthorizeRole.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Helpers 
{ 
public		 

class		 

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

)S T
{ 	
bool 
	IfAllowed 
= 
false "
;" #
try 
{ 
var 
userIdentity  
=! "

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

)))8 9
;))9 :
return** 
;** 
}++ 
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)-- 
{.. 
}00 

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
 
.
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

)S T
{ 	
bool 
	IfAllowed 
= 
false "
;" #
try 
{ 
var 
userIdentity  
=! "

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

)**8 9
;**9 :
return++ 
;++ 
},, 
}-- 
catch.. 
(.. 
	Exception.. 
ex.. 
).. 
{// 
}11 

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
 
.
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

{&& 
	EndOfLine'' 
='' 
$str'' "
,''" #
FieldSeparator(( 
=((  
$char((! $
,(($ %

=)) 
$char))  #
}** 
;**

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

=88 
new88  #

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
:^^ 
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


)ffQ R
{gg 	
ifhh 
(hh 

==hh  
nullhh! %
)hh% &

=ii  
DefaultCsvDefinitionii  4
;ii4 5
thisjj 
.jj 
columnsjj 
=jj 
(jj 

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

=mm  

.mm. /

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
{tt 
thisuu 
.uu !
isInvalidCharInFieldsuu *
[uu* +
cuu+ ,
]uu, -
=uu. /
trueuu0 4
;uu4 5
}vv 
thisww 
.ww 
WriteHeaderww 
(ww 
)ww 
;ww 
thisyy 
.yy 

(yy 
)yy  
;yy  !
if{{ 
({{ 
CsvFile{{ 
.{{ 
UseTasks{{  
){{  !
{|| 
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
} 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
else
�� 
{
�� 
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
�� 
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
�� 

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
�� 
else
�� 
{
�� 
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
�� 
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
�� 
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
�� 
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
�� 
AdsException
�� &
(
��& '
$str
��' 7
,
��7 8
$str
��9 A
)
��A B
;
��B C
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
else
�� 
{
�� 
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
�� 
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
�� 
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
�� 
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
��

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
��
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

�� +
;
��+ ,
private
�� 
readonly
�� 

�� &
parseFieldResult
��' 7
=
��8 9
new
��: =

��> K
(
��K L
)
��L M
;
��M N
public
�� 

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
�� 
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

�� 
(
�� 
	CsvSource
�� &
	csvSource
��' 0
,
��0 1

��2 ?

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

�� 
==
��  
null
��! %
)
��% &

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

�� 
=
��  

��! .
.
��. /

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
�� 
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
�� 
}
�� 	
IEnumerator
�� 
IEnumerable
�� 
.
��  

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
�� 
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
�� 
else
�� 
{
�� 
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
�� 
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
�� 
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
�� 
{
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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

��% 2
)
��2 3
{
�� 
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
�� 
else
�� 
{
�� 
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
�� 
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
�� 
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
�� 
else
�� 
{
�� 
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
�� 
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
�� 
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
�� 
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
�� 
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
�� 
else
�� 
{
�� 
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
�� 
}
�� 	
}
�� 
public
�� 

class
�� 

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
�� 
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
�� 
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

��_ l

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

��@ M
)
��M N
)
��N O
{
�� 
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
�� 
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
 
.
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

($ %
strIn% *
)* +
)+ ,
return 
false 
; 
try 
{ 
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
} 
catch 
( &
RegexMatchTimeoutException -
)- .
{ 
return 
false 
; 
} 
try   
{!! 
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
}&& 
catch'' 
('' &
RegexMatchTimeoutException'' -
)''- .
{(( 
return)) 
false)) 
;)) 
}** 
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
{44 

domainName55 
=55 
idn55  
.55  !
GetAscii55! )
(55) *

domainName55* 4
)554 5
;555 6
}66 
catch77 
(77 
ArgumentException77 $
)77$ %
{88 
invalid99 
=99 
true99 
;99 
}:: 
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
}>> �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ExcelUtility.cs
	namespace 	
WFP
 
.
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
{ 
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
}!! 
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
{$$ 
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
}&& 
return'' 
columnNumber'' 
;''  
}(( 	
})) 
}** �v
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\FileManager.cs
	namespace

 	
WFP


 
.


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
 
Async

 
.

 
Helpers

 #
{ 
public 

class 
FileManager 
{
static 
string 
OptOut 
= 
$str	 �
;
� �
static 
string 

=$ %
$str	& �
;
� �
static 
string 
_orderNumber "
;" #
static 
bool 
_isAddOptout  
;  !
static 
bool 
_isAddViewinBrowser '
;' (
static 
string 
serverPrefix "
=# $
string% +
.+ ,
Format, 2
(2 3
$str3 R
,R S

.a b
bucketb h
)h i
;i j
public 
static 
HtmlProcessResult '
ProcessHtmlZip( 6
(6 7
string7 =

UploadPath> H
,H I
stringJ P
zipFilePathQ \
,\ ]
string^ d
orderNumbere p
,p q
boolr v
isAddOptout	w �
,
� �
bool
� � 
isAddViewinBrowser
� �
)
� �
{ 	
_orderNumber 
= 
orderNumber &
;& '
_isAddOptout 
= 
isAddOptout &
;& '
_isAddViewinBrowser 
=  !
isAddViewinBrowser" 4
;4 5
var 
	directory 
= 
string "
." #
Format# )
() *
$str* 4
,4 5

UploadPath6 @
,@ A
orderNumberB M
)M N
;N O
if 
( 
! 
	Directory 
. 
Exists !
(! "
	directory" +
)+ ,
), -
{ 
	Directory 
. 
CreateDirectory )
() *
	directory* 3
)3 4
;4 5
}   
ZipFile!! 
.!! 
ExtractToDirectory!! &
(!!& '
zipFilePath!!' 2
,!!2 3
	directory!!4 =
)!!= >
;!!> ?
var$$ 

imagesLive$$ 
=$$ 
string$$ #
.$$# $
Format$$$ *
($$* +
$str$$+ 7
,$$7 8
orderNumber$$9 D
)$$D E
;$$E F
string%% 
htmlFileName%% 
=%%  !
string%%" (
.%%( )
Format%%) /
(%%/ 0
$str%%0 9
,%%9 :
orderNumber%%; F
)%%F G
;%%G H
string&& 
htmlFileKey&& 
=&&  
string&&! '
.&&' (
Format&&( .
(&&. /
$str&&/ <
,&&< =
orderNumber&&> I
)&&I J
;&&J K
string'' 
htmlFilePath'' 
=''  !
string''" (
.''( )
Format'') /
(''/ 0
$str''0 :
,'': ;
	directory''< E
,''E F
htmlFileName''G S
)''S T
;''T U
string)) 
htmlFile)) 
=)) 
	Directory)) '
.))' (
EnumerateFiles))( 6
())6 7
	directory))7 @
)))@ A
.))A B
FirstOrDefault))B P
())P Q
x))Q R
=>))S U
x))V W
.))W X
EndsWith))X `
())` a
$str))a f
)))f g
||))h j
x))k l
.))l m
EndsWith))m u
())u v
$str))v |
)))| }
)))} ~
;))~ 
if** 
(** 
string** 
.** 

(**# $
htmlFile**$ ,
)**, -
)**- .
throw++ 
new++ 
AdsException++ &
(++& '
$str++' 7
)++7 8
;++8 9
UploadFileStatus-- 
status-- #
=--$ %
ProcessHtml--& 1
(--1 2
htmlFile--2 :
,--: ;
htmlFilePath--< H
)--H I
;--I J

.00 
CreateDirectory00 )
(00) *
orderNumber00* 5
)005 6
;006 7

.33 
Upload33  
(33  !
htmlFileKey33! ,
,33, -
htmlFilePath33. :
,33: ;
true33< @
)33@ A
;33A B
string44 
filePathLive44 
=44  !
string44" (
.44( )
Format44) /
(44/ 0
$str440 8
,448 9
serverPrefix44: F
,44F G
htmlFileKey44H S
)44S T
;44T U

.77 
CreateDirectory77 )
(77) *

imagesLive77* 4
)774 5
;775 6
var:: 
images:: 
=:: 
	Directory:: "
.::" # 
EnumerateDirectories::# 7
(::7 8
	directory::8 A
)::A B
.::B C
FirstOrDefault::C Q
(::Q R
)::R S
;::S T
if;; 
(;; 
images;; 
!=;; 
null;; 
);; 
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
{== 
var>> 
	imageLive>> 
=>> 
string>>  &
.>>& '
Format>>' -
(>>- .
$str>>. 7
,>>7 8

imagesLive>>9 C
,>>C D
new>>E H
FileInfo>>I Q
(>>Q R
imgFile>>R Y
)>>Y Z
.>>Z [
Name>>[ _
)>>_ `
;>>` a

.?? 
Upload?? $
(??$ %
	imageLive??% .
,??. /
imgFile??0 7
,??7 8
true??9 =
)??= >
;??> ?
}@@ 
newCC 

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
$strJJ. >
,JJ> ?
serverPrefixJJ@ L
,JJL M
_orderNumberJJN Z
)JJZ [
;JJ[ \
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
{QQ 
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
}bb 
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
{ff 
HtmlNodegg 
newNodegg  
=gg! "
HtmlNodegg# +
.gg+ ,

CreateNodegg, 6
(gg6 7

)ggD E
;ggE F
bodyhh 
.hh 
PrependChildhh !
(hh! "
newNodehh" )
)hh) *
;hh* +
}ii 
ifjj 
(jj 
_isAddOptoutjj 
)jj 
{kk 
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
}nn 
docpp 
.pp 
Savepp 
(pp 
outputFilePathpp #
)pp# $
;pp$ %
returnrr 

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
stringuu 
GetFilePathLiveuu ,
(uu, -
UploadFileTypeuu- ;
uploadFileTypeuu< J
,uuJ K
stringuuL R
orderNumberuuS ^
,uu^ _
stringuu` f
	extensionuug p
=uuq r
$struus u
,uuu v
stringuuw }

=
uu� �
$str
uu� �
)
uu� �
{vv 	
stringww 
fileNameww 
=ww 
$strww  
;ww  !
switchxx 
(xx 
uploadFileTypexx "
)xx" #
{yy 
casezz 
UploadFileTypezz '
.zz' (
ZipFilezz( /
:zz/ 0
fileName{{  
={{! "
string{{# )
.{{) *
Format{{* 0
({{0 1
$str{{1 D
,{{D E
serverPrefix{{F R
,{{R S
orderNumber{{T _
){{_ `
;{{` a
break|| 
;|| 
case}} 
UploadFileType}} '
.}}' (
TestSeedFile}}( 4
:}}4 5
fileName~~  
=~~! "
string~~# )
.~~) *
Format~~* 0
(~~0 1
$str~~1 E
,~~E F
serverPrefix~~G S
,~~S T
orderNumber~~U `
)~~` a
;~~a b
break 
; 
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
�� 
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
}�� �f
IE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\FileManagerFTP.cs
	namespace

 	
WFP


 
.


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
 
Async

 
.

 
Helpers

 #
{ 
public 

class 
FileManagerFTP 
{
static 
string 
OptOut 
= 
$str	 �
;
� �
static 
string 

=$ %
$str	& �
;
� �
private 
static 
string 
_orderNumber *
;* +
private 
static 
bool 
_isAddOptout (
;( )
private 
static 
bool 
_isAddViewinBrowser /
;/ 0
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
;4 5
FileUploader 
uploader !
=" #
new$ '
FileUploader( 4
(4 5
)5 6
;6 7
var 
	directory 
= 
$" 
{ 

UploadPath )
}) *
\\* ,
{, -
orderNumber- 8
}8 9
temp9 =
"= >
;> ?
if 
( 
	Directory 
. 
Exists  
(  !
	directory! *
)* +
)+ ,
{ 
new 

(! "
	directory" +
)+ ,
., -
Delete- 3
(3 4
true4 8
)8 9
;9 :
}   
else!! 
{"" 
	Directory## 
.## 
CreateDirectory## )
(##) *
	directory##* 3
)##3 4
;##4 5
}$$ 
ZipFile%% 
.%% 
ExtractToDirectory%% &
(%%& '
zipFilePath%%' 2
,%%2 3
	directory%%4 =
)%%= >
;%%> ?
string(( 
htmlFileName(( 
=((  !
$"((" $
{(($ %
orderNumber((% 0
}((0 1
.htm((1 5
"((5 6
;((6 7
string)) 
htmlFilePath)) 
=))  !
$"))" $
{))$ %
	directory))% .
})). /
\\))/ 1
{))1 2
htmlFileName))2 >
}))> ?
"))? @
;))@ A
string++ 
htmlFile++ 
=++ 
	Directory++ '
.++' (
EnumerateFiles++( 6
(++6 7
	directory++7 @
)++@ A
.++A B
FirstOrDefault++B P
(++P Q
x++Q R
=>++S U
x++V W
.++W X
EndsWith++X `
(++` a
$str++a f
)++f g
||++h j
x++k l
.++l m
EndsWith++m u
(++u v
$str++v |
)++| }
)++} ~
;++~ 
if,, 
(,, 
string,, 
.,, 

(,,# $
htmlFile,,$ ,
),,, -
),,- .
throw-- 
new-- 
AdsException-- &
(--& '
$str--' 7
)--7 8
;--8 9
UploadFileStatus// 
status// #
=//$ %
ProcessHtml//& 1
(//1 2
htmlFile//2 :
,//: ;
htmlFilePath//< H
)//H I
;//I J
uploader22 
.22 
CreateDirectory22 $
(22$ %
orderNumber22% 0
)220 1
;221 2
string55 
filePathLive55 
=55  !
uploader55" *
.55* +
Upload55+ 1
(551 2
orderNumber552 =
,55= >
htmlFileName55? K
,55K L
htmlFilePath55M Y
)55Y Z
;55Z [
var88 

imagesLive88 
=88 
$"88 
{88  
orderNumber88  +
}88+ ,
/88, -
{88- .
orderNumber88. 9
}889 :
img88: =
"88= >
;88> ?
uploader99 
.99 
CreateDirectory99 $
(99$ %

imagesLive99% /
)99/ 0
;990 1
var<< 
images<< 
=<< 
	Directory<< "
.<<" # 
EnumerateDirectories<<# 7
(<<7 8
	directory<<8 A
)<<A B
.<<B C
FirstOrDefault<<C Q
(<<Q R
)<<R S
;<<S T
if== 
(== 
images== 
!=== 
null== 
)== 
foreach>> 
(>> 
var>> 
imgFile>> $
in>>% '
	Directory>>( 1
.>>1 2
EnumerateFiles>>2 @
(>>@ A
images>>A G
)>>G H
)>>H I
{?? 
var@@ 
file@@ 
=@@ 
new@@ "
FileInfo@@# +
(@@+ ,
imgFile@@, 3
)@@3 4
;@@4 5
uploaderAA 
.AA 
UploadAA #
(AA# $

imagesLiveAA$ .
,AA. /
fileAA0 4
.AA4 5
NameAA5 9
,AA9 :
imgFileAA; B
)AAB C
;AAC D
}BB 
newEE 

(EE 
	directoryEE '
)EE' (
.EE( )
DeleteEE) /
(EE/ 0
trueEE0 4
)EE4 5
;EE5 6
returnGG 
newGG 
HtmlProcessResultGG (
(GG( )
)GG) *
{GG+ ,
StatusGG, 2
=GG3 4
statusGG5 ;
,GG; <
filePathLiveGG= I
=GGJ K
filePathLiveGGL X
}GGX Y
;GGY Z
}HH 	
publicJJ 
staticJJ 
UploadFileStatusJJ &
ProcessHtmlJJ' 2
(JJ2 3
stringJJ3 9
htmlFileJJ: B
,JJB C
stringJJD J
outputFilePathJJK Y
)JJY Z
{KK 	
stringLL 

imagesPathLL 
=LL 
stringLL  &
.LL& '
FormatLL' -
(LL- .
$strLL. ^
,LL^ _
_orderNumberLL` l
)LLl m
;LLm n
HtmlDocumentNN 
docNN 
=NN 
newNN "
HtmlDocumentNN# /
(NN/ 0
)NN0 1
;NN1 2
docOO 
.OO 
LoadOO 
(OO 
htmlFileOO 
)OO 
;OO 
varPP 
allSrcsPP 
=PP 
docPP 
.PP 
DocumentNodePP *
.PP* +
SelectNodesPP+ 6
(PP6 7
$strPP7 D
)PPD E
;PPE F
boolQQ 

=QQ  
falseQQ! &
;QQ& '
foreachRR 
(RR 
HtmlNodeRR 
nodeRR "
inRR# %
allSrcsRR& -
)RR- .
{SS 
varTT 
srcTT 
=TT 
nodeTT 
.TT 

AttributesTT )
[TT) *
$strTT* /
]TT/ 0
.TT0 1
ValueTT1 6
;TT6 7
ifVV 
(VV 
srcVV 
.VV 
ContainsVV  
(VV  !
$strVV! *
)VV* +
)VV+ ,
{WW 

=XX" #
trueXX$ (
;XX( )
breakYY 
;YY 
;YY 
}ZZ 
else[[ 
{\\ 
var__ 
srcs__ 
=__ 
src__ "
.__" #
Split__# (
(__( )
$str__) ,
.__, -
ToCharArray__- 8
(__8 9
)__9 :
)__: ;
;__; <
string`` 
imgFileName`` &
=``' (
srcs``) -
.``- .
Length``. 4
>``5 6
$num``7 8
?``9 :
srcs``; ?
[``? @
$num``@ A
]``A B
:``C D
string``E K
.``K L
Empty``L Q
;``Q R
srcaa 
=aa 
stringaa  
.aa  !
Formataa! '
(aa' (
$straa( 0
,aa0 1

imagesPathaa2 <
,aa< =
imgFileNameaa> I
)aaI J
;aaJ K
}bb 
nodecc 
.cc 
SetAttributeValuecc &
(cc& '
$strcc' ,
,cc, -
srccc. 1
)cc1 2
;cc2 3
}dd 
HtmlNodeff 
bodyff 
=ff 
docff 
.ff  
DocumentNodeff  ,
.ff, -
SelectSingleNodeff- =
(ff= >
$strff> F
)ffF G
;ffG H
ifgg 
(gg 
_isAddViewinBrowsergg #
)gg# $
{hh 
HtmlNodeii 
newNodeii  
=ii! "
HtmlNodeii# +
.ii+ ,

CreateNodeii, 6
(ii6 7

)iiD E
;iiE F
bodyjj 
.jj 
PrependChildjj !
(jj! "
newNodejj" )
)jj) *
;jj* +
}kk 
ifll 
(ll 
_isAddOptoutll 
)ll 
{mm 
HtmlNodenn 
newNodenn  
=nn! "
HtmlNodenn# +
.nn+ ,

CreateNodenn, 6
(nn6 7
OptOutnn7 =
)nn= >
;nn> ?
bodyoo 
.oo 
AppendChildoo  
(oo  !
newNodeoo! (
)oo( )
;oo) *
}pp 
docrr 
.rr 
Saverr 
(rr 
outputFilePathrr #
)rr# $
;rr$ %
returntt 

?tt! "
UploadFileStatustt# 3
.tt3 4
HostedWithOutImagestt4 G
:ttH I
UploadFileStatusttK [
.tt[ \
HostedWithImagestt\ l
;ttl m
}uu 	
publicww 
staticww 
stringww 

UploadFileww '
(ww' (
UploadFileTypeww( 6
uploadFileTypeww7 E
,wwE F
stringwwG M
filePathwwN V
,wwV W
stringwwX ^
orderNumberww_ j
)wwj k
{xx 	
FileUploaderyy 
uploaderyy !
=yy" #
newyy$ '
FileUploaderyy( 4
(yy4 5
)yy5 6
;yy6 7
uploader|| 
.|| 
CreateDirectory|| $
(||$ %
orderNumber||% 0
)||0 1
;||1 2
string~~ 
fileName~~ 
=~~ 
$str~~  
;~~  !
switch 
( 
uploadFileType "
)" #
{
�� 
case
�� 
UploadFileType
�� '
.
��' (
ZipFile
��( /
:
��/ 0
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
�� 
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
}�� ��
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\FileProcessor.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Async 
{
public 

static 
class 

{ 
public 
static 
void 
ProcessNewOrder *
(* +
string+ 1
orderNumber2 =
,= >
string? E
userNameF N
)N O
{ 	
using 
( 
var 
db 
= 
new 

(- .
). /
)/ 0
{ 
var 
campaign 
= 
db !
.! "
	Campaigns" +
.+ ,
Include, 3
(3 4
x4 5
=>6 8
x9 :
.: ;
Assets; A
)A B
.B C
IncludeC J
(J K
xK L
=>M O
xP Q
.Q R
SegmentsR Z
)Z [
.! "
FirstOrDefault" 0
(0 1
x1 2
=>3 5
x6 7
.7 8
OrderNumber8 C
==D F
orderNumberG R
)R S
;S T
var 
user 
= 
db 
. 
Users #
.# $
FirstOrDefault$ 2
(2 3
x3 4
=>5 7
x8 9
.9 :
UserName: B
==C E
userNameF N
)N O
;O P
var 
ads 
= 
db 
. 
Vendors $
.$ %
FirstOrDefault% 3
(3 4
x4 5
=>6 8
x9 :
.: ;
Name; ?
.? @
Contains@ H
(H I
$strI N
)N O
)O P
;P Q
if 
( 
! 
string 
. 

() *
campaign* 2
.2 3
Assets3 9
.9 :

)G H
)H I
{ 
string 

=) *
string+ 1
.1 2
Format2 8
(8 9
$str9 K
,K L
campaignM U
.U V
OrderNumberV a
)a b
;b c

.! "
Move" &
(& '
campaign' /
./ 0
Assets0 6
.6 7

,D E

,S T
campaignU ]
.] ^
OrderNumber^ i
,i j
truek o
)o p
;p q
campaign 
. 
Assets #
.# $

=2 3

;A B
	LogHelper   
.   
AddLog   $
(  $ %
db  % '
,  ' (
LogType  ) 0
.  0 1
FileProcessing  1 ?
,  ? @
orderNumber  A L
,  L M
$str  N g
+  h i

)  w x
;  x y
}!! 
if"" 
("" 
!"" 
string"" 
."" 

("") *
campaign""* 2
.""2 3
Assets""3 9
.""9 :
ZipCodeFile"": E
)""E F
)""F G
{## 
string$$ 

=$$) *
string$$+ 1
.$$1 2
Format$$2 8
($$8 9
$str$$9 I
,$$I J
campaign$$K S
.$$S T
OrderNumber$$T _
)$$_ `
;$$` a

.%%! "
Move%%" &
(%%& '
campaign%%' /
.%%/ 0
Assets%%0 6
.%%6 7
ZipCodeFile%%7 B
,%%B C

,%%Q R
campaign%%S [
.%%[ \
OrderNumber%%\ g
,%%g h
true%%i m
)%%m n
;%%n o
campaign&& 
.&& 
Assets&& #
.&&# $
ZipCodeFile&&$ /
=&&0 1

;&&? @
	LogHelper'' 
.'' 
AddLog'' $
(''$ %
db''% '
,''' (
LogType'') 0
.''0 1
FileProcessing''1 ?
,''? @
orderNumber''A L
,''L M
$str''N e
+''f g

)''u v
;''v w
}(( 
if)) 
()) 
!)) 
string)) 
.)) 

())) *
campaign))* 2
.))2 3
Assets))3 9
.))9 :
TestSeedFile)): F
)))F G
)))G H
{** 
string++ 

=++) *
string+++ 1
.++1 2
Format++2 8
(++8 9
$str++9 J
,++J K
campaign++L T
.++T U
OrderNumber++U `
)++` a
;++a b

.,,! "
Move,," &
(,,& '
campaign,,' /
.,,/ 0
Assets,,0 6
.,,6 7
TestSeedFile,,7 C
,,,C D

,,,R S
campaign,,T \
.,,\ ]
OrderNumber,,] h
,,,h i
true,,j n
),,n o
;,,o p
campaign-- 
.-- 
Assets-- #
.--# $
TestSeedFile--$ 0
=--1 2

;--@ A
	LogHelper.. 
... 
AddLog.. $
(..$ %
db..% '
,..' (
LogType..) 0
...0 1
FileProcessing..1 ?
,..? @
orderNumber..A L
,..L M
$str..N f
+..g h

)..v w
;..w x
}// 
if00 
(00 
!00 
string00 
.00 

(00) *
campaign00* 2
.002 3
Assets003 9
.009 :
LiveSeedFile00: F
)00F G
)00G H
{11 
string22 

=22) *
string22+ 1
.221 2
Format222 8
(228 9
$str229 J
,22J K
campaign22L T
.22T U
OrderNumber22U `
)22` a
;22a b

.33! "
Move33" &
(33& '
campaign33' /
.33/ 0
Assets330 6
.336 7
LiveSeedFile337 C
,33C D

,33R S
campaign33T \
.33\ ]
OrderNumber33] h
,33h i
true33j n
)33n o
;33o p
campaign44 
.44 
Assets44 #
.44# $
LiveSeedFile44$ 0
=441 2

;44@ A
	LogHelper55 
.55 
AddLog55 $
(55$ %
db55% '
,55' (
LogType55) 0
.550 1
FileProcessing551 ?
,55? @
orderNumber55A L
,55L M
$str55N f
+55g h

)55v w
;55w x
}66 
if77 
(77 
!77 
string77 
.77 

(77) *
campaign77* 2
.772 3
Assets773 9
.779 :
SuppressionFile77: I
)77I J
)77J K
{88 
string99 

=99) *
string99+ 1
.991 2
Format992 8
(998 9
$str999 J
,99J K
campaign99L T
.99T U
OrderNumber99U `
)99` a
;99a b

.::! "
Move::" &
(::& '
campaign::' /
.::/ 0
Assets::0 6
.::6 7
SuppressionFile::7 F
,::F G

,::U V
campaign::W _
.::_ `
OrderNumber::` k
,::k l
true::m q
)::q r
;::r s
campaign;; 
.;; 
Assets;; #
.;;# $
SuppressionFile;;$ 3
=;;4 5

;;;C D
	LogHelper<< 
.<< 
AddLog<< $
(<<$ %
db<<% '
,<<' (
LogType<<) 0
.<<0 1
FileProcessing<<1 ?
,<<? @
orderNumber<<A L
,<<L M
$str<<N i
+<<j k

)<<y z
;<<z {
}== 
if>> 
(>> 
!>> 
string>> 
.>> 

(>>) *
campaign>>* 2
.>>2 3
Assets>>3 9
.>>9 :
BannersFile>>: E
)>>E F
)>>F G
{?? 
string@@ 

=@@) *
string@@+ 1
.@@1 2
Format@@2 8
(@@8 9
$str@@9 L
,@@L M
campaign@@N V
.@@V W
OrderNumber@@W b
,@@b c
Path@@d h
.@@h i
GetExtension@@i u
(@@u v
campaign@@v ~
.@@~ 
Assets	@@ �
.
@@� �
BannersFile
@@� �
)
@@� �
)
@@� �
;
@@� �

.AA! "
MoveAA" &
(AA& '
campaignAA' /
.AA/ 0
AssetsAA0 6
.AA6 7
BannersFileAA7 B
,AAB C

,AAQ R
campaignAAS [
.AA[ \
OrderNumberAA\ g
,AAg h
trueAAi m
)AAm n
;AAn o
campaignBB 
.BB 
AssetsBB #
.BB# $
BannersFileBB$ /
=BB0 1

;BB? @
	LogHelperCC 
.CC 
AddLogCC $
(CC$ %
dbCC% '
,CC' (
LogTypeCC) 0
.CC0 1
FileProcessingCC1 ?
,CC? @
orderNumberCCA L
,CCL M
$strCCN e
+CCf g

)CCu v
;CCv w
}DD 
ifEE 
(EE 
!EE 
stringEE 
.EE 

(EE) *
campaignEE* 2
.EE2 3
AssetsEE3 9
.EE9 :
BannerLinksFileEE: I
)EEI J
)EEJ K
{FF 
stringGG 

=GG) *
stringGG+ 1
.GG1 2
FormatGG2 8
(GG8 9
$strGG9 Q
,GGQ R
campaignGGS [
.GG[ \
OrderNumberGG\ g
,GGg h
PathGGi m
.GGm n
GetExtensionGGn z
(GGz {
campaign	GG{ �
.
GG� �
Assets
GG� �
.
GG� �
BannerLinksFile
GG� �
)
GG� �
)
GG� �
;
GG� �

.HH! "
MoveHH" &
(HH& '
campaignHH' /
.HH/ 0
AssetsHH0 6
.HH6 7
BannerLinksFileHH7 F
,HHF G

,HHU V
campaignHHW _
.HH_ `
OrderNumberHH` k
,HHk l
trueHHm q
)HHq r
;HHr s
campaignII 
.II 
AssetsII #
.II# $
BannerLinksFileII$ 3
=II4 5

;IIC D
	LogHelperJJ 
.JJ 
AddLogJJ $
(JJ$ %
dbJJ% '
,JJ' (
LogTypeJJ) 0
.JJ0 1
FileProcessingJJ1 ?
,JJ? @
orderNumberJJA L
,JJL M
$strJJN i
+JJj k

)JJy z
;JJz {
}KK 
ifLL 
(LL 
!LL 
stringLL 
.LL 

(LL) *
campaignLL* 2
.LL2 3
AssetsLL3 9
.LL9 :
MiscFileLL: B
)LLB C
)LLC D
{MM 
stringNN 

=NN) *
stringNN+ 1
.NN1 2
FormatNN2 8
(NN8 9
$strNN9 J
,NNJ K
campaignNNL T
.NNT U
OrderNumberNNU `
,NN` a
PathNNb f
.NNf g
GetExtensionNNg s
(NNs t
campaignNNt |
.NN| }
Assets	NN} �
.
NN� �
MiscFile
NN� �
)
NN� �
)
NN� �
;
NN� �

.OO! "
MoveOO" &
(OO& '
campaignOO' /
.OO/ 0
AssetsOO0 6
.OO6 7
MiscFileOO7 ?
,OO? @

,OON O
campaignOOP X
.OOX Y
OrderNumberOOY d
,OOd e
trueOOf j
)OOj k
;OOk l
campaignPP 
.PP 
AssetsPP #
.PP# $
MiscFilePP$ ,
=PP- .

;PP< =
	LogHelperQQ 
.QQ 
AddLogQQ $
(QQ$ %
dbQQ% '
,QQ' (
LogTypeQQ) 0
.QQ0 1
FileProcessingQQ1 ?
,QQ? @
orderNumberQQA L
,QQL M
$strQQN b
+QQc d

)QQr s
;QQs t
}RR 
foreachTT 
(TT 
varTT 
segmentTT $
inTT% '
campaignTT( 0
.TT0 1
SegmentsTT1 9
)TT9 :
{UU 
stringVV 

=VV) *
stringVV+ 1
.VV1 2
FormatVV2 8
(VV8 9
$strVV9 K
,VVK L
campaignVVM U
.VVU V
OrderNumberVVV a
,VVa b
segmentVVc j
.VVj k

)VVx y
;VVy z

.WW! "
MoveWW" &
(WW& '
segmentWW' .
.WW. /

,WW< =

,WWK L
campaignWWM U
.WWU V
OrderNumberWWV a
,WWa b
trueWWc g
)WWg h
;WWh i
segmentXX 
.XX 

=XX* +

;XX9 :
	LogHelperYY 
.YY 
AddLogYY $
(YY$ %
dbYY% '
,YY' (
LogTypeYY) 0
.YY0 1
FileProcessingYY1 ?
,YY? @
orderNumberYYA L
,YYL M
$strYYN Y
+YYZ [
segmentYY\ c
.YYc d

+YYr s
$str	YYt �
+
YY� �

YY� �
)
YY� �
;
YY� �
}ZZ 
db\\ 
.\\ 
SaveChanges\\ 
(\\ 
)\\  
;\\  !
EmailHelper^^ 
.^^ "
SendOrderEmailToClient^^ 2
(^^2 3
campaign^^3 ;
,^^; <
user^^= A
,^^A B
ads^^C F
?^^F G
.^^G H
CcEmails^^H P
)^^P Q
;^^Q R
	LogHelper`` 
.`` 
AddLog``  
(``  !
db``! #
,``# $
LogType``% ,
.``, -
Orders``- 3
,``3 4
campaign``5 =
.``= >
OrderNumber``> I
,``I J
$str``K W
+``X Y
campaign``Z b
.``b c
CampaignName``c o
+``p q
$str	``r �
+
``� �
campaign
``� �
.
``� � 
RepresentativeName
``� �
)
``� �
;
``� �
}aa 
}bb 	
publicdd 
staticdd 
voiddd "
ProcessAssetUpdateUrlsdd 1
(dd1 2
stringdd2 8

uploadPathdd9 C
,ddC D
stringddE K
orderNumberddL W
)ddW X
{ee 	
usingff 
(ff 
varff 
dbff 
=ff 
newff 

(ff- .
)ff. /
)ff/ 0
{gg 
varhh 
campaignhh 
=hh 
dbhh !
.hh! "
	Campaignshh" +
.hh+ ,
Includehh, 3
(hh3 4
xhh4 5
=>hh6 8
xhh9 :
.hh: ;
Assetshh; A
)hhA B
.hhB C
FirstOrDefaulthhC Q
(hhQ R
xhhR S
=>hhT V
xhhW X
.hhX Y
OrderNumberhhY d
==hhe g
orderNumberhhh s
)hhs t
;hht u
varjj 
	directoryjj 
=jj 
stringjj  &
.jj& '
Formatjj' -
(jj- .
$strjj. 8
,jj8 9

uploadPathjj: D
,jjD E
campaignjjF N
.jjN O
OrderNumberjjO Z
)jjZ [
;jj[ \
ifkk 
(kk 
!kk 
	Directorykk 
.kk 
Existskk %
(kk% &
	directorykk& /
)kk/ 0
)kk0 1
	Directorykk2 ;
.kk; <
CreateDirectorykk< K
(kkK L
	directorykkL U
)kkU V
;kkV W
trynn 
{oo 
ifpp 
(pp 
!pp 
stringpp 
.pp  

(pp- .
campaignpp. 6
.pp6 7
Assetspp7 =
.pp= >

)ppK L
)ppL M
{qq 
stringrr 
filePathrr '
=rr( )
Pathrr* .
.rr. /
Combinerr/ 6
(rr6 7

uploadPathrr7 A
,rrA B
campaignrrC K
.rrK L
AssetsrrL R
.rrR S

)rr` a
;rra b

.ss% &
Downloadss& .
(ss. /
campaignss/ 7
.ss7 8
Assetsss8 >
.ss> ?

,ssL M
filePathssN V
)ssV W
;ssW X
vartt 
resulttt "
=tt# $
FileManagertt% 0
.tt0 1
ProcessHtmlZiptt1 ?
(tt? @

uploadPathtt@ J
,ttJ K
filePathttL T
,ttT U
campaignttV ^
.tt^ _
OrderNumbertt_ j
,ttj k
campaignttl t
.ttt u
IsAddOptOut	ttu �
,
tt� �
campaign
tt� �
.
tt� � 
IsAddViewInBrowser
tt� �
)
tt� �
;
tt� �
campaignuu  
.uu  !
Assetsuu! '
.uu' (
CreativeUrluu( 3
=uu4 5
resultuu6 <
.uu< =
filePathLiveuu= I
;uuI J
campaignvv  
.vv  !
Assetsvv! '
.vv' (
CreativeStatusvv( 6
=vv7 8
(vv9 :
intvv: =
)vv= >
resultvv> D
.vvD E
StatusvvE K
;vvK L
	LogHelperww !
.ww! "
AddLogww" (
(ww( )
dbww) +
,ww+ ,
LogTypeww- 4
.ww4 5
FileProcessingww5 C
,wwC D
orderNumberwwE P
,wwP Q
$strwwR m
+wwn o
campaignwwp x
.wwx y
Assetswwy 
.	ww �
CreativeUrl
ww� �
+
ww� �
$str
ww� �
+
ww� �
System
ww� �
.
ww� �
Enum
ww� �
.
ww� �
GetName
ww� �
(
ww� �
typeof
ww� �
(
ww� �
UploadFileStatus
ww� �
)
ww� �
,
ww� �
campaign
ww� �
.
ww� �
Assets
ww� �
.
ww� �
CreativeStatus
ww� �
)
ww� �
)
ww� �
;
ww� �
}xx 
}yy 
catchzz 
(zz 
	Exceptionzz  
exzz! #
)zz# $
{{{ 
campaign|| 
.|| 
Assets|| #
.||# $
CreativeStatus||$ 2
=||3 4
(||5 6
int||6 9
)||9 :
UploadFileStatus||: J
.||J K
Failed||K Q
;||Q R
	LogHelper}} 
.}} 
AddError}} &
(}}& '
db}}' )
,}}) *
LogType}}+ 2
.}}2 3
FileProcessing}}3 A
,}}A B
orderNumber}}C N
,}}N O
$str}}P s
+}}t u
ex}}v x
.}}x y
Message	}}y �
+
}}� �
$str
}}� �
+
}}� �
System
}}� �
.
}}� �
Enum
}}� �
.
}}� �
GetName
}}� �
(
}}� �
typeof
}}� �
(
}}� �
UploadFileStatus
}}� �
)
}}� �
,
}}� �
campaign
}}� �
.
}}� �
Assets
}}� �
.
}}� �
CreativeStatus
}}� �
)
}}� �
)
}}� �
;
}}� �
}~~ 
db 
. 
SaveChanges 
( 
)  
;  !
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
orderNumber
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
orderNumber
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
orderNumber
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
orderNumber
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
orderNumber
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
orderNumber
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
orderNumber
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
�� 
}
�� 	
}
�� 
}�� �8
GE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\FileUploader.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Async 
. 
Helpers #
{ 
public 

class 
FileUploader 
{		 
private

 
string

 
_ftpUsername

 #
;

# $
private 
string 
_ftpPassword #
;# $
private 
string 
_baseURL 
;  
private
string
serverPrefix
=
$str
;
public 
FileUploader 
( 
) 
{ 	
if 
(  
ConfigurationManager $
.$ %
AppSettings% 0
[0 1
$str1 <
]< =
==> @
nullA E
)E F
throw 
new 
AdsException &
(& '
$str' A
)A B
;B C
if 
(  
ConfigurationManager $
.$ %
AppSettings% 0
[0 1
$str1 >
]> ?
==@ B
nullC G
)G H
throw 
new 
AdsException &
(& '
$str' C
)C D
;D E
if 
(  
ConfigurationManager $
.$ %
AppSettings% 0
[0 1
$str1 >
]> ?
==@ B
nullC G
)G H
throw 
new 
AdsException &
(& '
$str' C
)C D
;D E
var 
	ftpServer 
=  
ConfigurationManager 0
.0 1
AppSettings1 <
[< =
$str= H
]H I
;I J
_ftpUsername 
=  
ConfigurationManager /
./ 0
AppSettings0 ;
[; <
$str< I
]I J
;J K
_ftpPassword 
=  
ConfigurationManager /
./ 0
AppSettings0 ;
[; <
$str< I
]I J
;J K
_baseURL 
= 
$" 
ftp:// 
{  
	ftpServer  )
}) *
/public_html/ep2/* ;
"; <
;< =
} 	
public 
bool 
DirectoryExists #
(# $
string$ *

)8 9
{ 	
bool   
directoryExists    
;    !
var!! 
request!! 
=!! 
(!! 

)!!( )

WebRequest!!) 3
.!!3 4
Create!!4 :
(!!: ;

+!!I J
$str!!K N
)!!N O
;!!O P
request"" 
."" 
Method"" 
="" 
WebRequestMethods"" .
."". /
Ftp""/ 2
.""2 3

;""@ A
request## 
.## 
Credentials## 
=##  !
new##" %
NetworkCredential##& 7
(##7 8
_ftpUsername##8 D
,##D E
_ftpPassword##F R
)##R S
;##S T
try$$ 
{%% 
using&& 
(&& 
request&& 
.&& 
GetResponse&& *
(&&* +
)&&+ ,
)&&, -
{'' 
directoryExists(( #
=(($ %
true((& *
;((* +
})) 
}** 
catch++ 
(++ 
WebException++ 
ex++  "
)++" #
{,, 
directoryExists-- 
=--  !
false--" '
;--' (
}.. 
return// 
directoryExists// "
;//" #
}00 	
public22 
void22 
CreateDirectory22 #
(22# $
string22$ *

)228 9
{33 	
string44 

=44! "
_baseURL44# +
+44, -

;44; <
if66 
(66 
DirectoryExists66 
(66 

)66, -
)66- .
return66/ 5
;665 6

WebRequest88 
request88 
=88  

WebRequest88! +
.88+ ,
Create88, 2
(882 3

)88@ A
;88A B
request99 
.99 
Method99 
=99 
WebRequestMethods99 .
.99. /
Ftp99/ 2
.992 3

;99@ A
request:: 
.:: 
Credentials:: 
=::  !
new::" %
NetworkCredential::& 7
(::7 8
_ftpUsername::8 D
,::D E
_ftpPassword::F R
)::R S
;::S T
try;; 
{<< 
var== 
resp== 
=== 
(== 
FtpWebResponse== *
)==* +
request==, 3
.==3 4
GetResponse==4 ?
(==? @
)==@ A
;==A B
}>> 
catch?? 
(?? 
	Exception?? 
ex?? 
)??  
{@@ 
}BB 
}CC 	
publicEE 
stringEE 
UploadEE 
(EE 
stringEE #

,EE1 2
stringEE3 9
fileNameEE: B
,EEB C
stringEED J
filePathEEK S
)EES T
{FF 	
usingGG 
(GG 
	WebClientGG 
clientGG #
=GG$ %
newGG& )
	WebClientGG* 3
(GG3 4
)GG4 5
)GG5 6
{HH 
clientII 
.II 
CredentialsII "
=II# $
newII% (
NetworkCredentialII) :
(II: ;
_ftpUsernameII; G
,IIG H
_ftpPasswordIII U
)IIU V
;IIV W
stringJJ 
filePathFtpJJ "
=JJ# $
$"JJ% '
{JJ' (
_baseURLJJ( 0
}JJ0 1
{JJ1 2

}JJ? @
/JJ@ A
{JJA B
fileNameJJB J
}JJJ K
"JJK L
;JJL M
UriKK 
addressKK 
=KK 
newKK !
UriKK" %
(KK% &
filePathFtpKK& 1
)KK1 2
;KK2 3
clientLL 
.LL 

UploadFileLL !
(LL! "
addressLL" )
,LL) *
filePathLL+ 3
)LL3 4
;LL4 5
stringMM 
filePathLiveMM #
=MM$ %
$"MM& (
{MM( )
serverPrefixMM) 5
}MM5 6
{MM6 7

}MMD E
/MME F
{MMF G
fileNameMMG O
}MMO P
"MMP Q
;MMQ R
returnNN 
filePathLiveNN #
;NN# $
}OO 
}PP 	
}QQ 
}RR �O
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\ImageHelper.cs
	namespace

 	
WFP


 
.


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
{
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
{ 
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
}(( 
)((
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
{22 
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
}AA 
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
{FF 
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
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
}RR 
returnSS 
filePathSS 
;SS 
}TT 	
publicVV 
voidVV 
ResizeImageVV 
(VV  
stringVV  &
originalFileVV' 3
,VV3 4
stringVV5 ;
newFileVV< C
,VVC D
intVVE H
newWidthVVI Q
,VVQ R
intVVS V
	maxHeightVVW `
,VV` a
boolVVb f
onlyResizeIfWiderVVg x
)VVx y
{WW 	
SystemXX 
.XX 
DrawingXX 
.XX 
ImageXX  

=XX/ 0
SystemXX1 7
.XX7 8
DrawingXX8 ?
.XX? @
ImageXX@ E
.XXE F
FromFileXXF N
(XXN O
originalFileXXO [
)XX[ \
;XX\ ]

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
;[[U V

.\\ 

RotateFlip\\ $
(\\$ %
System\\% +
.\\+ ,
Drawing\\, 3
.\\3 4
RotateFlipType\\4 B
.\\B C
Rotate180FlipNone\\C T
)\\T U
;\\U V
if^^ 
(^^ 
onlyResizeIfWider^^ !
&&^^" $

.^^2 3
Width^^3 8
<=^^9 ;
newWidth^^< D
)^^D E
newWidth__ 
=__ 

.__( )
Width__) .
;__. /
intaa 
	newHeightaa 
=aa 

.aa) *
Heightaa* 0
*aa1 2
newWidthaa3 ;
/aa< =

.aaK L
WidthaaL Q
;aaQ R
ifbb 
(bb 
	newHeightbb 
>bb 
	maxHeightbb %
)bb% &
{cc 
newWidthee 
=ee 

.ee( )
Widthee) .
*ee/ 0
	maxHeightee1 :
/ee; <

.eeJ K
HeighteeK Q
;eeQ R
	newHeightff 
=ff 
	maxHeightff %
;ff% &
}gg 
Systemii 
.ii 
Drawingii 
.ii 
Imageii  
newImageii! )
=ii* +

.ii9 :
GetThumbnailImageii: K
(iiK L
newWidthiiL T
,iiT U
	newHeightiiV _
,ii_ `
nulliia e
,iie f
IntPtriig m
.iim n
Zeroiin r
)iir s
;iis t

.ll 
Disposell !
(ll! "
)ll" #
;ll# $
newImageoo 
.oo 
Saveoo 
(oo 
newFileoo !
)oo! "
;oo" #
}pp 	
}qq 
}rr �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\KeyGenerator.cs
	namespace 	
WFP
 
.
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
byte
[
]
data
=
new
byte
[
$num
]
;
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
{ 
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
} 

result  
=! "
new# &

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
{ 
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
} 
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
 
.
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
return
ds
;
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

(> ?
)? @
)@ A
{ 
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
} 
foreach 
( 
T 
item 
in 
list #
)# $
{ 
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
}(( 
return)) 
t)) 
;)) 
}** 	
}++ 
}-- �
>E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\LogHelper.cs
	namespace 	
WFP
 
.
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
{
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
{ 
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
}   
)  
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
 
.
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
public
override
bool
IsValidName
(
ControllerContext
controllerContext
,
string

actionName
,

MethodInfo

methodInfo
)
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
{ 
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
} 
return 
isValidName 
; 
} 	
} 
} �
QE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Hangfire\HangfireAuthorizationFilter.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Hangfire 
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
} ��
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\ProData\ProDataApiManager.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
ProData 
{ 
public 

static 
class 
ProDataApiManager )
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
Success& -
=. /
$str0 9
;9 :
public 
static 
readonly 
string %
Error& +
=, -
$str. 5
;5 6
static 
readonly 
Random 
Random %
=& '
new( +
Random, 2
(2 3
)3 4
;4 5
public 
static 
void 
Load 
(  
)  !
{ 	
string 
json 
= 
File 
. 
ReadAllText *
(* +
$"+ -
C:\\resp.txt- 9
"9 :
): ;
;; <
ProDataResponse 
m 
= 
JsonConvert  +
.+ ,
DeserializeObject, =
<= >
ProDataResponse> M
>M N
(N O
jsonO S
)S T
;T U
} 	
public!! 
static!! 
ProDataResponse!! %
Create!!& ,
(!!, -
Campaign!!- 5
campaign!!6 >
,!!> ?
CampaignSegment!!@ O
segment!!P W
,!!W X
string!!Y _
whiteLabelDomain!!` p
)!!p q
{"" 	
ProDataRequest## 
request## "
=### $
new##% (
ProDataRequest##) 7
(##7 8
)##8 9
{$$ 
io%% 
=%% 
campaign%% 
.%% 
OrderNumber%% )
,%%) *

=&& 
campaign&&  (
.&&( )
Approved&&) 1
.&&1 2
CampaignName&&2 >
,&&> ?
is_rebroadcast'' 
=''  
campaign''! )
.'') *
Approved''* 2
.''2 3
ReBroadCast''3 >
?''? @
$str''A D
:''E F
$str''G J
,''J K
white_label(( 
=(( 
whiteLabelDomain(( .
,((. /
creative_url)) 
=)) 
campaign)) '
.))' (
Assets))( .
.)). /
CreativeUrl))/ :
,)): ;
quantity** 
=** 
campaign** #
.**# $
Approved**$ ,
.**, -
Quantity**- 5
,**5 6
geo_type++ 
=++ 
$str++ '
,++' (
geo_url,, 
=,, 
campaign,, "
.,," #
Assets,,# )
.,,) *

ZipCodeUrl,,* 4
,,,4 5
ctr_percent-- 
=-- 
$num-- #
,--# $
subject.. 
=.. 
campaign.. "
..." #
Approved..# +
...+ ,
SubjectLine.., 7
,..7 8
	from_name// 
=// 
campaign// $
.//$ %
Approved//% -
.//- .
FromLine//. 6
,//6 7

from_email00 
=00 
campaign00 %
.00% &
RepresentativeEmail00& 9
,009 :
deploy_date11 
=11 
campaign11 &
.11& '
Approved11' /
.11/ 0

DeployDate110 :
?11: ;
.11; <
ToString11< D
(11D E
StringConstants11E T
.11T U 
DateTimeFormatDashes11U i
)11i j
,11j k
}22 
;22
if44 
(44 
campaign44 
.44 
Approved44 !
.44! "
IsOpenPixel44" -
)44- .
{55 
request66 
.66 

=66& '
$str66( +
;66+ ,
request77 
.77 
open_percent77 $
=77% &
(77' (
double77( .
)77. /
campaign77/ 7
.777 8
Approved778 @
.77@ A
	OpenGoals77A J
/77K L
campaign77M U
.77U V
Approved77V ^
.77^ _
Quantity77_ g
;77g h
request88 
.88 

open_pixel88 "
=88# $
campaign88% -
.88- .
Approved88. 6
.886 7
OpenPixelUrl887 C
;88C D
}99 
else:: 
request;; 
.;; 

=;;& '
$str;;( +
;;;+ ,
if== 
(== 
segment== 
!=== 
null== 
)==  
{>> 
request?? 
.?? 
is_data_file?? $
=??% &
$str??' *
;??* +
request@@ 
.@@ 

=@@& '
segment@@( /
.@@/ 0
SegmentDataFileUrl@@0 B
;@@B C
requestAA 
.AA '
data_file_replacement_paramAA 3
=AA4 5
segmentAA6 =
.AA= >

;AAK L
requestBB 
.BB (
data_file_replacement_columnBB 4
=BB5 6
$strBB7 :
;BB: ;
requestCC 
.CC 
data_file_unique_ipCC +
=CC, -
$strCC. 1
;CC1 2
}DD 
elseEE 
requestFF 
.FF 
is_data_fileFF $
=FF% &
$strFF' *
;FF* +
returnHH 
CreateHH 
(HH 
requestHH !
)HH! "
;HH" #
}II 	
privateKK 
staticKK 
ProDataResponseKK &
CreateKK' -
(KK- .
ProDataRequestKK. <
requestKK= D
)KKD E
{LL 	
usingMM 
(MM 

HttpClientMM 
clientMM $
=MM% &
newMM' *

HttpClientMM+ 5
(MM5 6
)MM6 7
)MM7 8
{NN 
clientOO 
.OO 
TimeoutOO 
=OO  
TimeSpanOO! )
.OO) *
FromMinutesOO* 5
(OO5 6
$numOO6 7
)OO7 8
;OO8 9
clientPP 
.PP !
DefaultRequestHeadersPP ,
.PP, -
AddPP- 0
(PP0 1
$strPP1 E
,PPE F
prodataAuthPPG R
)PPR S
;PPS T
varQQ 
httpContentQQ 
=QQ  !
newQQ" %

(QQ3 4
requestQQ4 ;
.QQ; <
ToJsonQQ< B
(QQB C
)QQC D
,QQD E
EncodingQQF N
.QQN O
UTF8QQO S
,QQS T
$strQQU g
)QQg h
;QQh i
usingRR 
(RR 
HttpResponseMessageRR *
responseRR+ 3
=RR4 5
clientRR6 <
.RR< =
	PostAsyncRR= F
(RRF G
_urlCreateOrderRRG V
,RRV W
httpContentRRX c
)RRc d
.RRd e
ResultRRe k
)RRk l
usingSS 
(SS 
HttpContentSS "
contentSS# *
=SS+ ,
responseSS- 5
.SS5 6
ContentSS6 =
)SS= >
{TT 
stringUU 
responseContentUU *
=UU+ ,
contentUU- 4
.UU4 5
ReadAsStringAsyncUU5 F
(UUF G
)UUG H
.UUH I
ResultUUI O
;UUO P
ProDataResponseVV #
proDataResponseVV$ 3
;VV3 4
tryWW 
{XX 
proDataResponseYY '
=YY( )
JsonConvertYY* 5
.YY5 6
DeserializeObjectYY6 G
<YYG H
ProDataResponseYYH W
>YYW X
(YYX Y
responseContentYYY h
)YYh i
;YYi j
}ZZ 
catch[[ 
([[ 
	Exception[[ $
ex[[% '
)[[' (
{\\ 
throw]] 
new]] !
AdsException]]" .
(]]. /
$str]]/ u
)]]u v
;]]v w
}^^ 
return`` 
proDataResponse`` *
;``* +
}aa 
}bb 
}cc 	
privategg 
staticgg 
ProDataResponsegg &
Fetchgg' ,
(gg, -
stringgg- 3
orderNumbergg4 ?
)gg? @
{hh 	
ifii 
(ii  
ConfigurationManagerii $
.ii$ %
AppSettingsii% 0
[ii0 1
$strii1 9
]ii9 :
==ii; =
$strii> E
)iiE F
{jj 
orderNumberkk 
=kk 
$strkk $
;kk$ %
}ll 
ProDataResponsenn 
proDataResponsenn +
=nn, -
nullnn. 2
;nn2 3
stringoo 
urloo 
=oo 
stringoo 
.oo  
Formatoo  &
(oo& '
_urlTrackingoo' 3
,oo3 4
orderNumberoo5 @
)oo@ A
;ooA B
usingpp 
(pp 

HttpClientpp 
clientpp $
=pp% &
newpp' *

HttpClientpp+ 5
(pp5 6
)pp6 7
)pp7 8
{qq 
clientrr 
.rr 
Timeoutrr 
=rr  
TimeSpanrr! )
.rr) *
FromMinutesrr* 5
(rr5 6
$numrr6 7
)rr7 8
;rr8 9
clientss 
.ss !
DefaultRequestHeadersss ,
.ss, -
Addss- 0
(ss0 1
$strss1 E
,ssE F
prodataAuthssG R
)ssR S
;ssS T
usingtt 
(tt 
HttpResponseMessagett *
responsett+ 3
=tt4 5
clienttt6 <
.tt< =
GetAsynctt= E
(ttE F
urlttF I
)ttI J
.ttJ K
ResultttK Q
)ttQ R
usinguu 
(uu 
HttpContentuu "
contentuu# *
=uu+ ,
responseuu- 5
.uu5 6
Contentuu6 =
)uu= >
{vv 
stringww 
responseContentww *
=ww+ ,
contentww- 4
.ww4 5
ReadAsStringAsyncww5 F
(wwF G
)wwG H
.wwH I
ResultwwI O
;wwO P
tryxx 
{yy 
proDataResponsezz '
=zz( )
JsonConvertzz* 5
.zz5 6
DeserializeObjectzz6 G
<zzG H
ProDataResponsezzH W
>zzW X
(zzX Y
responseContentzzY h
)zzh i
;zzi j
proDataResponse{{ '
.{{' (
ResponseStatus{{( 6
={{7 8!
ProDataResponseStatus{{9 N
.{{N O
Found{{O T
.{{T U
ToString{{U ]
({{] ^
){{^ _
;{{_ `
}|| 
catch}} 
(}} 
	Exception}} $
ex}}% '
)}}' (
{~~ 
if 
( 
ex 
. 
Message &
.& '
ToLowerInvariant' 7
(7 8
)8 9
.9 :
Contains: B
(B C
$strC P
)P Q
)Q R
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
�� 
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

��2 ?
db
��@ B
,
��B C
string
��D J
orderNumber
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
orderNumber
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
�� 
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
�� 
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
orderNumber
��2 =
,
��= >
$"
�� "
Starting refresh at 
�� &
{
��& '
DateTime
��' /
.
��/ 0
Now
��0 3
}
��3 4
"
��5 6
)
��6 7
;
��7 8
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
orderNumber
��2 =
,
��= >
$"
��? A#
Deleting Old ProData 
��A V
"
��V W
)
��W X
;
��X Y
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
orderNumber
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
�� 
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
�� 
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
orderNumber
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
�� 
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
orderNumber
��6 A
,
��A B
$"
��C E
{
��E F
reports
��F M
.
��M N
Length
��N T
}
��T U,
 records fetched from ProData 
��U s
"
��s t
)
��t u
;
��u v
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

�� %
=
��& '
report
��( .
.
��. /

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
orderNumber
��6 A
,
��A B
$"
��B D0
"Refresh completed successfully at 
��D f
{
��f g
DateTime
��g o
.
��o p
Now
��p s
}
��s t
"
��u v
)
��v w
;
��w x
}
�� 
else
�� 
{
�� 
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
orderNumber
��6 A
,
��A B
$"
��C E 
Prodata response. 
��E W
{
��W X
data
��X \
.
��\ ]
ToJson
��] c
(
��c d
)
��d e
}
��e f
"
��g h
)
��h i
;
��i j
throw
�� 
new
�� 
AdsException
�� &
(
��& '
$str
��' m
)
��m n
;
��n o
}
�� 
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
��0 1
campaign
��2 :
.
��: ;
OrderNumber
��; F
,
��F G
$"
��H J"
Starting refresh at 
��J ^
{
��^ _
DateTime
��_ g
.
��g h
Now
��h k
}
��k l
"
��m n
)
��n o
;
��o p
var
�� 
data
�� 
=
�� 
Fetch
�� 
(
�� 
campaign
�� %
.
��% &
OrderNumber
��& 1
)
��1 2
;
��2 3
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
��' (
campaign
��) 1
.
��1 2
OrderNumber
��2 =
,
��= >
string
��? E
.
��E F
Empty
��F K
,
��K L
data
��M Q
)
��Q R
;
��R S
var
�� 
campaignTracking
��  
=
��! "
UpdateTracking
��# 1
(
��1 2
db
��2 4
,
��4 5
campaign
��6 >
,
��> ?
campaign
��@ H
.
��H I
OrderNumber
��I T
,
��T U
string
��V \
.
��\ ]
Empty
��] b
,
��b c
data
��d h
)
��h i
;
��i j
SaveNotification
�� 
(
�� 
db
�� 
,
��  
campaign
��! )
.
��) *
Id
��* ,
,
��, -
campaign
��. 6
.
��6 7
OrderNumber
��7 B
,
��B C
string
��D J
.
��J K
Empty
��K P
,
��P Q
data
��R V
.
��V W
ResponseStatus
��W e
,
��e f
campaignTracking
��g w
)
��w x
;
��x y
if
�� 
(
�� 
campaign
�� 
.
�� 

�� &
)
��& '
{
�� 
var
�� 
data1
�� 
=
�� 
Fetch
�� !
(
��! "
campaign
��" *
.
��* +&
ReBroadcastedOrderNumber
��+ C
)
��C D
;
��D E
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
��+ ,
campaign
��- 5
.
��5 6&
ReBroadcastedOrderNumber
��6 N
,
��N O
string
��P V
.
��V W
Empty
��W \
,
��\ ]
data1
��^ c
)
��c d
;
��d e
var
�� 
campaignTracking1
�� %
=
��& '
UpdateTracking
��( 6
(
��6 7
db
��7 9
,
��9 :
campaign
��; C
,
��C D
campaign
��E M
.
��M N&
ReBroadcastedOrderNumber
��N f
,
��f g
string
��h n
.
��n o
Empty
��o t
,
��t u
data1
��v {
)
��{ |
;
��| }
SaveNotification
��  
(
��  !
db
��! #
,
��# $
campaign
��% -
.
��- .
Id
��. 0
,
��0 1
campaign
��2 :
.
��: ;&
ReBroadcastedOrderNumber
��; S
,
��S T
string
��U [
.
��[ \
Empty
��\ a
,
��a b
data1
��c h
.
��h i
ResponseStatus
��i w
,
��w x 
campaignTracking1��y �
)��� �
;��� �
}
�� 
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

��C P
==
��Q S
(
��T U
int
��U X
)
��X Y

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
�� 
if
�� 
(
�� 
segment
�� 
.
�� 

�� )
!=
��* ,
(
��- .
int
��. 1
)
��1 2

��3 @
.
��@ A

Monitoring
��A K
)
��K L
continue
��M U
;
��U V
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
��+ ,
campaign
��- 5
.
��5 6
OrderNumber
��6 A
,
��A B
segment
��C J
.
��J K

��K X
,
��X Y
data1
��Z _
)
��_ `
;
��` a
var
�� 
campaignTracking1
�� %
=
��& '
UpdateTracking
��( 6
(
��6 7
db
��7 9
,
��9 :
campaign
��; C
,
��C D
campaign
��E M
.
��M N
OrderNumber
��N Y
,
��Y Z
segment
��[ b
.
��b c

��c p
,
��p q
data1
��r w
)
��w x
;
��x y
SaveNotification
��  
(
��  !
db
��! #
,
��# $
campaign
��% -
.
��- .
Id
��. 0
,
��0 1
campaign
��2 :
.
��: ;
OrderNumber
��; F
,
��F G
segment
��H O
.
��O P

��P ]
,
��] ^
data
��_ c
.
��c d
ResponseStatus
��d r
,
��r s 
campaignTracking1��t �
)��� �
;��� �
}
�� 
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
orderNumber
��S ^
,
��^ _
string
��` f

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
orderNumber
��2 =
,
��= >
$"
��? A#
Deleting Old ProData 
��A V
"
��V W
)
��W X
;
��X Y
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
orderNumber
��a l
&&
��m o
x
��p q
.
��q r

��r 
==��� �

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
�� 
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
�� 
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
�� 
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
orderNumber
��6 A
,
��A B
$"
��C E
{
��E F
reports
��F M
.
��M N
Length
��N T
}
��T U,
 records fetched from ProData 
��U s
"
��s t
)
��t u
;
��u v
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
orderNumber
��& 1
,
��1 2

�� %
=
��& '

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

�� %
=
��& '
report
��( .
.
��. /

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
orderNumber
��6 A
,
��A B
$"
��C E0
"Refresh completed successfully at 
��E g
{
��g h
DateTime
��h p
.
��p q
Now
��q t
}
��t u
"
��v w
)
��w x
;
��x y
}
�� 
}
�� 	
private
�� 
static
�� 
CampaignTracking
�� '
UpdateTracking
��( 6
(
��6 7

��7 D
db
��E G
,
��G H
Campaign
��I Q
campaign
��R Z
,
��Z [
string
��\ b
orderNumber
��c n
,
��n o
string
��p v

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
��! "
campaign
��# +
.
��+ ,
	Trackings
��, 5
.
��5 6
FirstOrDefault
��6 D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
OrderNumber
��L W
==
��X Z
orderNumber
��[ f
&&
��g i
x
��j k
.
��k l

��l y
==
��z |

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
��( )
{
�� 
string
�� 
orderNumberRdp
�� %
;
��% &
long
�� 
quantity
�� 
;
�� 
if
�� 
(
�� 
campaign
�� 
.
�� 

�� *
)
��* +
{
�� 
orderNumberRdp
�� "
=
��# $
campaign
��% -
.
��- .&
ReBroadcastedOrderNumber
��. F
;
��F G
quantity
�� 
=
�� 
campaign
�� '
.
��' (#
ReBroadcastedQuantity
��( =
;
��= >
}
�� 
else
�� 
{
�� 
orderNumberRdp
�� "
=
��# $
campaign
��% -
.
��- .
OrderNumber
��. 9
;
��9 :
quantity
�� 
=
�� 
campaign
�� '
.
��' (
Approved
��( 0
.
��0 1
Quantity
��1 9
;
��9 :
}
�� 
var
�� 

trackingId
�� 
=
��  
Guid
��! %
.
��% &
NewGuid
��& -
(
��- .
)
��. /
;
��/ 0
campaignTracking
��  
=
��! "
new
��# &
CampaignTracking
��' 7
(
��7 8
)
��8 9
{
�� 
Id
�� 
=
�� 

trackingId
�� #
,
��# $
	CreatedAt
�� 
=
�� 
DateTime
��  (
.
��( )
Now
��) ,
,
��, -

CampaignId
�� 
=
��  
campaign
��! )
.
��) *
Id
��* ,
,
��, -
OrderNumber
�� 
=
��  !
orderNumberRdp
��" 0
,
��0 1

�� !
=
��" #
string
��$ *
.
��* +
Empty
��+ 0
,
��0 1
Quantity
�� 
=
�� 
quantity
�� '
,
��' (
DateSent
�� 
=
�� 
DateTime
�� '
.
��' (
Now
��( +
,
��+ ,!
IsCreatedThroughApi
�� '
=
��( )
false
��* /
}
�� 
;
�� 
db
�� 
.
�� 
CampaignTrackings
�� $
.
��$ %
Add
��% (
(
��( )
campaignTracking
��) 9
)
��9 :
;
��: ;
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
�� 
if
�� 
(
�� 
campaignTracking
��  
?
��  !
.
��! "
DateSent
��" *
==
��+ -
null
��. 2
||
��3 5
data
��6 :
.
��: ;
reports
��; B
?
��B C
.
��C D
report
��D J
==
��K M
null
��N R
||
��S U
data
��V Z
.
��Z [
reports
��[ b
.
��b c
report
��c i
.
��i j
Length
��j p
==
��q s
$num
��t u
)
��u v
return
��w }
campaignTracking��~ �
;��� �
var
�� 
reports
�� 
=
�� 
data
�� 
.
�� 
reports
�� &
.
��& '
report
��' -
;
��- .
var
�� 
report
�� 
=
�� 
reports
��  
[
��  !
$num
��! "
]
��" #
;
��# $
DateTime
�� 

�� "
;
��" #
DateTime
�� 
.
�� 
TryParse
�� 
(
�� 
report
�� $
.
��$ %
CampaignStartDate
��% 6
,
��6 7
out
��8 ;

��< I
)
��I J
;
��J K
campaignTracking
�� 
.
�� 
IoNumber
�� %
=
��& '
report
��( .
.
��. /
IO
��/ 1
;
��1 2
campaignTracking
�� 
.
�� 
	StartDate
�� &
=
��' (

��) 6
;
��6 7
campaignTracking
�� 
.
�� 
Opened
�� #
=
��$ %
campaign
��& .
.
��. /
Approved
��/ 7
.
��7 8!
IsUseApiDataForOpen
��8 K
?
��L M
report
��N T
.
��T U

��U b
:
��c d
API
��e h
.
��h i
Campaign
��i q
.
��q r
GetOpens
��r z
(
��z {
campaignTracking��{ �
.��� �
Quantity��� �
,��� �

)��� �
;��� �
campaignTracking
�� 
.
�� 
Clicked
�� $
=
��% &
reports
��' .
.
��. /
Sum
��/ 2
(
��2 3
x
��3 4
=>
��5 7
long
��8 <
.
��< =
Parse
��= B
(
��B C
x
��C D
.
��D E

ClickCount
��E O
)
��O P
)
��P Q
;
��Q R
campaignTracking
�� 
.
�� 
Mobile
�� #
=
��$ %
reports
��& -
.
��- .
Sum
��. 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
	MobileCnt
��9 B
)
��B C
;
��C D
campaignTracking
�� 
.
�� 
Desktop
�� $
=
��% &
report
��' -
.
��- .
	UniqueCnt
��. 7
;
��7 8
campaignTracking
�� 
.
�� 
Unsub
�� "
=
��# $
Random
��% +
.
��+ ,
Next
��, 0
(
��0 1
$num
��1 2
,
��2 3
$num
��4 7
)
��7 8
;
��8 9
campaignTracking
�� 
.
�� 
Forwards
�� %
=
��& '
Random
��( .
.
��. /
Next
��/ 3
(
��3 4
$num
��4 5
,
��5 6
$num
��7 :
)
��: ;
;
��; <
campaignTracking
�� 
.
�� 
Bounce
�� #
=
��$ %
Random
��& ,
.
��, -
Next
��- 1
(
��1 2
$num
��2 3
,
��3 4
$num
��5 7
)
��7 8
;
��8 9
campaignTracking
�� 
.
�� 
Opt
��  
=
��! "
Random
��# )
.
��) *
Next
��* .
(
��. /
$num
��/ 0
,
��0 1
$num
��2 4
)
��4 5
;
��5 6
campaignTracking
�� 
.
�� 
OpenedPercentage
�� -
=
��. /
campaignTracking
��0 @
.
��@ A
Quantity
��A I
==
��J L
$num
��M N
?
��O P
$num
��Q R
:
��S T
(
��U V
double
��V \
)
��\ ]
campaignTracking
��] m
.
��m n
Opened
��n t
/
��u v
campaignTracking��w �
.��� �
Quantity��� �
;��� �
campaignTracking
�� 
.
�� 
ClickedPercentage
�� .
=
��/ 0
campaignTracking
��1 A
.
��A B
Quantity
��B J
==
��K M
$num
��N O
?
��P Q
$num
��R S
:
��T U
(
��V W
double
��W ]
)
��] ^
campaignTracking
��^ n
.
��n o
Clicked
��o v
/
��w x
campaignTracking��y �
.��� �
Quantity��� �
;��� �
campaignTracking
�� 
.
�� 
UnsubPercentage
�� ,
=
��- .
campaignTracking
��/ ?
.
��? @
Quantity
��@ H
==
��I K
$num
��L M
?
��N O
$num
��P Q
:
��R S
(
��T U
double
��U [
)
��[ \
campaignTracking
��\ l
.
��l m
Unsub
��m r
/
��s t
campaignTracking��u �
.��� �
Quantity��� �
;��� �
campaignTracking
�� 
.
�� #
ClickToOpenPercentage
�� 2
=
��3 4
campaignTracking
��5 E
.
��E F
Opened
��F L
==
��M O
$num
��P Q
?
��R S
$num
��T U
:
��V W
(
��X Y
double
��Y _
)
��_ `
campaignTracking
��` p
.
��p q
Clicked
��q x
/
��y z
campaignTracking��{ �
.��� �
Opened��� �
;��� �
campaignTracking
�� 
.
�� #
UnsubToOpenPercentage
�� 2
=
��3 4
campaignTracking
��5 E
.
��E F
Opened
��F L
==
��M O
$num
��P Q
?
��R S
$num
��T U
:
��V W
(
��X Y
double
��Y _
)
��_ `
campaignTracking
��` p
.
��p q
Unsub
��q v
/
��w x
campaignTracking��y �
.��� �
Opened��� �
;��� �
db
�� 
.
�� 
SaveChanges
�� 
(
�� 
)
�� 
;
�� 
return
�� 
campaignTracking
�� #
;
��# $
}
�� 	
private
�� 
static
�� 
void
�� 
SaveNotification
�� ,
(
��, -

��- :
db
��; =
,
��= >
Guid
��? C
?
��C D

campaignId
��E O
,
��O P
string
��Q W
orderNumber
��X c
,
��c d
string
��e k

��l y
,
��y z
string��{ �
responseStatus��� �
,��� � 
CampaignTracking��� � 
campaignTracking��� �
)��� �
{
�� 	
int
�� 
?
�� 
hoursPassed
�� 
=
�� 
DateTime
�� '
.
��' (
Now
��( +
.
��+ ,
Hour
��, 0
-
��1 2
campaignTracking
��3 C
.
��C D
DateSent
��D L
?
��L M
.
��M N
Hour
��N R
;
��R S
bool
�� 
problemFound
�� 
=
�� 
false
��  %
;
��% &
QcRule
�� 
qcRule
�� 
=
�� 
QcRule
�� "
.
��" #%
NotStartedInFirst4Hours
��# :
;
��: ;
if
�� 
(
�� 
responseStatus
�� 
==
�� !#
ProDataResponseStatus
��" 7
.
��7 8
NotFound
��8 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
&&
��L N
hoursPassed
��O Z
>=
��[ ]
$num
��^ _
)
��_ `
{
�� 
problemFound
�� 
=
�� 
true
�� #
;
��# $
qcRule
�� 
=
�� 
QcRule
�� 
.
��  %
NotStartedInFirst4Hours
��  7
;
��7 8
}
�� 
if
�� 
(
�� 
campaignTracking
��  
.
��  !
OpenedPercentage
��! 1
<
��2 3
$num
��4 8
&&
��9 ;
hoursPassed
��< G
>=
��H J
$num
��K M
)
��M N
{
�� 
problemFound
�� 
=
�� 
true
�� #
;
��# $
qcRule
�� 
=
�� 
QcRule
�� 
.
��  &
NotHitOpenRate5In24Hours
��  8
;
��8 9
}
�� 
if
�� 
(
�� 
campaignTracking
��  
.
��  !
OpenedPercentage
��! 1
<
��2 3
$num
��4 8
&&
��9 ;
hoursPassed
��< G
>=
��H J
$num
��K M
)
��M N
{
�� 
problemFound
�� 
=
�� 
true
�� #
;
��# $
qcRule
�� 
=
�� 
QcRule
�� 
.
��  '
NotHitOpenRate10In72Hours
��  9
;
��9 :
}
�� 
if
�� 
(
�� 
campaignTracking
��  
.
��  !
ClickedPercentage
��! 2
<
��3 4
$num
��5 :
&&
��; =
hoursPassed
��> I
>=
��J L
$num
��M O
)
��O P
{
�� 
problemFound
�� 
=
�� 
true
�� #
;
��# $
qcRule
�� 
=
�� 
QcRule
�� 
.
��  )
NotHitClickRate750In24Hours
��  ;
;
��; <
}
�� 
if
�� 
(
�� 
campaignTracking
��  
.
��  !
ClickedPercentage
��! 2
<
��3 4
$num
��5 9
&&
��: <
hoursPassed
��= H
>=
��I K
$num
��L N
)
��N O
{
�� 
problemFound
�� 
=
�� 
true
�� #
;
��# $
qcRule
�� 
=
�� 
QcRule
�� 
.
��  *
NotHitClickRate1500In72Hours
��  <
;
��< =
}
�� 
if
�� 
(
�� 
!
�� 
problemFound
�� 
)
�� 
return
�� %
;
��% &
var
�� 
alreadyNoted
�� 
=
�� 
db
�� !
.
��! "

��" /
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
��& '

CampaignId
��' 1
==
��2 4

campaignId
��5 ?
&&
��@ B
x
��C D
.
��D E
OrderNumber
��E P
==
��Q S
orderNumber
��T _
&&
��` b
x
��c d
.
��d e

��e r
==
��s u

&&
�� 
x
��  !
.
��! "
QCRule
��" (
==
��) +
(
��, -
int
��- 0
)
��0 1
qcRule
��1 7
&&
��8 :
x
��; <
.
��< =
Status
��= C
==
��D F
(
��G H
int
��H K
)
��K L 
NotificationStatus
��L ^
.
��^ _
Found
��_ d
)
��d e
;
��e f
if
�� 
(
�� 
alreadyNoted
�� 
==
�� 
null
��  $
)
��$ %
{
�� 
	LogHelper
�� 
.
�� 
AddLog
��  
(
��  !
db
��! #
,
��# $
LogType
��% ,
.
��, -
RulesProcessing
��- <
,
��< =
orderNumber
��> I
,
��I J
$str
��K c
+
��d e
qcRule
��f l
)
��l m
;
��m n
db
�� 
.
�� 

��  
.
��  !
Add
��! $
(
��$ %
new
��% (
Notification
��) 5
(
��5 6
)
��6 7
{
�� 
Id
�� 
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
,
��' (
	CreatedAt
�� 
=
�� 
DateTime
��  (
.
��( )
Now
��) ,
,
��, -

CampaignId
�� 
=
��  

campaignId
��! +
,
��+ ,
OrderNumber
�� 
=
��  !
orderNumber
��" -
,
��- .

�� !
=
��" #

��$ 1
,
��1 2
Status
�� 
=
�� 
(
�� 
int
�� !
)
��! " 
NotificationStatus
��" 4
.
��4 5
Found
��5 :
,
��: ;
	CheckTime
�� 
=
�� 
DateTime
��  (
.
��( )
Now
��) ,
,
��, -
FoundAt
�� 
=
�� 
DateTime
�� &
.
��& '
Now
��' *
,
��* +
QCRule
�� 
=
�� 
(
�� 
int
�� !
)
��! "
qcRule
��" (
}
�� 
)
�� 
;
�� 
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
�� 
}
�� 	
}
�� 
}�� �B
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\S3FileManager.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Async 
. 
Helpers #
{ 
public 

class 

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
{
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
{ 
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

;0 1
client 
. 
	PutObject  
(  !
request! (
)( )
;) *
} 
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
{   
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

)%%@ A
;%%A B
}&& 
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
{,, 
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
}11 
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
{77 
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
}:: 
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
{DD 

S3FileInfoEE 

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

.HH6 7
MoveToHH7 =
(HH= >
bucketHH> D
,HHD E

newFileKeyHHF P
)HHP Q
;HHQ R
}II 

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
{PP 

requestQQ %
=QQ& '
newQQ( +

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
}VV 
}WW 	
}XX 
}YY �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\NumberHelper.cs
	namespace 	
WFP
 
.
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
return
$num
;
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
} �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\QCRuleUtility.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Helpers 
{ 
public		 

static		 
class		 

{

 
public 
static 
string 
	GetString &
(& '
int' *
qcRule+ 1
)1 2
{ 	
switch
(
qcRule
)
{ 
case 
( 
int 
) 
QcRule  
.  !#
NotStartedInFirst4Hours! 8
:8 9
return 
$str T
;T U
case 
( 
int 
) 
QcRule  
.  !$
NotHitOpenRate5In24Hours! 9
:9 :
return 
$str V
;V W
case 
( 
int 
) 
QcRule  
.  !%
NotHitOpenRate10In72Hours! :
:: ;
return 
$str W
;W X
case 
( 
int 
) 
QcRule  
.  !'
NotHitClickRate750In24Hours! <
:< =
return 
$str Y
;Y Z
case 
( 
int 
) 
QcRule  
.  !(
NotHitClickRate1500In72Hours! =
:= >
return 
$str Y
;Y Z
} 
return 
$str 
; 
} 	
} 
} �#
HE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\SortSearchExtension.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Helpers 
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
{ 
glyph 
= 
$str :
;: ;
} 
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
{-- 
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
}33 
if44 
(44 
string44 
.44 

(44$ %
newValue44% -
)44- .
)44. /
{55 
routeValueDictionary66 $
.66$ %
Remove66% +
(66+ ,
newKey66, 2
)662 3
;663 4
}77 
else88 
{99 
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
}>> 
return??  
routeValueDictionary?? '
;??' (
}@@ 	
}AA 
}BB �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\StringHelper.cs
	namespace 	
WFP
 
.
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
}
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
} �
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\Extensions.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Helpers 
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
}
public 
static 
string 

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
, 
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
?&& 
.&& 
ToString&& "
(&&" #
)&&# $
??&&% '
string&&( .
.&&. /
Empty&&/ 4
;&&4 5
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
?++ 
.++ 
ToString++ "
(++" #
format++# )
)++) *
??+++ -
string++. 4
.++4 5
Empty++5 :
;++: ;
},, 	
}-- 
}.. ��
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Async\Helpers\EmailHelper.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Async 
. 
Helpers #
{ 
public

static
class
EmailHelper
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
= 
$" 
Order #  '
{' (
campaign( 0
.0 1
OrderNumber1 <
}< =
, Campaign Date = M
{M N
campaignN V
.V W

?d e
.e f
ToStringf n
(n o
$stro r
)r s
}s t
, QTY t z
{z {
campaign	{ �
.
� �
Quantity
� �
}
� � 
 , Date Submitted 
� �
{
� �
campaign
� �
.
� �
	CreatedAt
� �
:
� �
d
� �
}
� �
"
� �
;
� �
string 
body 
= 
$@" 

{* +
loggedInUser+ 7
.7 8
UserName8 @
.@ A!
ToCapitalLetterStringA V
(V W
)W X
.X Y

(f g
)g h
}h i�
�</p><br/>We have recevied your order.<br/><br/>
                        <table border=""2"">
                        <tr><th align=""left"">Order #:</th><td>i @
{@ A
campaignA I
.I J
OrderNumberJ U
}U VW
K</td></tr>
                        <tr><th align=""left"">Status:</th><td>V ?
{? @
(@ A
CampaignStatusA O
)O P
campaignQ Y
.Y Z
StatusZ `
}` aY
M</td></tr>
                        <tr><th align=""left"">Username:</th><td>a A
{A B
loggedInUserB N
.N O
UserNameO W
}W X[
O</td></tr>
                        <tr><th align=""left"">User Email:</th><td>X C
{C D
loggedInUserD P
.P Q
EmailQ V
}V W^
R</td></tr>
                        <tr><th align=""left"">Campaign Name:</th><td>W F
{F G
campaignG O
.O P
CampaignNameP \
}\ ]_
S</td></tr>
                        <tr><th align=""left"">Broadcast Date:</th><td>] G
{G H
campaignH P
.P Q

.^ _
Value_ d
.d e
ToStringe m
(m n
$strn q
)q r
}r s\
P</td></tr>
                        <tr><th align=""left"">Rebroadcast:</th><td>s D
{D E
(E F
campaignF N
.N O
ReBroadCastO Z
?Z [
$str\ a
:a b
$strc g
)g h
}h ia
U</td></tr>
                        <tr><th align=""left"">Rebroadcast Date:</th><td>i I
{I J
(J K
campaignK S
.S T
ReBroadcastDateT c
.c d
HasValued l
?l m
campaignn v
.v w
ReBroadcastDate	w �
.
� �
ToString
� �
(
� �
)
� �
:
� �
$str
� �
)
� �
}
� �[
N</td></tr>
                        <tr><th align=""left"">From Line:</th><td>	 � B
{  B C
campaign  C K
.  K L
FromLine  L T
}  T U]
Q</td></tr>
                        <tr><th align=""left"">Subject Line:</th><td> !U E
{!!E F
campaign!!F N
.!!N O
SubjectLine!!O Z
}!!Z [`
T</td></tr>
                        <tr><th align=""left"">Personalization:</th><td>!"[ H
{""H I
(""I J
campaign""J R
.""R S
IsPersonalization""S d
?""d e
$str""f k
:""k l
$str""m q
)""q r
}""r sZ
N</td></tr>
                        <tr><th align=""left"">Matchback:</th><td>"#s B
{##B C
(##C D
campaign##D L
.##L M
IsMatchback##M X
?##Y Z
$str##[ `
:##a b
$str##c g
)##g h
}##h i\
P</td></tr>
                        <tr><th align=""left"">Suppression:</th><td>#$i D
{$$D E
($$E F
campaign$$F N
.$$N O

?$$\ ]
$str$$^ c
:$$c d
$str$$e i
)$$i j
}$$j k\
P</td></tr>
                        <tr><th align=""left"">White Label:</th><td>$%k D
{%%D E
campaign%%E M
.%%M N

WhiteLabel%%N X
}%%X YZ
N</td></tr>
                        <tr><th align=""left"">HTML File:</th><td>%&Y B
{&&B C
campaign&&C K
.&&K L
Assets&&L R
.&&R S
CreativeUrl&&S ^
}&&^ _Z
N</td></tr>
                        <tr><th align=""left"">Test Seed:</th><td>&'_ B
{''B C
campaign''C K
.''K L
Assets''L R
.''R S
TestSeedUrl''S ^
}''^ _\
P</td></tr>  
                        <tr><th align=""left"">Live Seed:</th><td>'(_ B
{((B C
campaign((C K
.((K L
Assets((L R
.((R S
LiveSeedUrl((S ^
}((^ _h
\</td></tr>   
                        <tr><th align=""left"">Special Instructions:</th><td>()_ M
{))M N
campaign))N V
.))V W
SpecialInstructions))W j
}))j k�
t</td></tr>                                     
                        <tr><th align=""left"">Start Time:</th><td>)*k C
{**C D
campaign**D L
.**L M
	CreatedAt**M V
.**V W

AddMinutes**W a
(**a b
$num**b c
)**c d
.**d e

AddSeconds**e o
(**o p
$num**p r
)**r s
}**s tS
G</td></tr>
                        <tr><th align=""left"">IP:</th><td>*+t ;
{++; <
campaign++< D
.++D E
IP++E G
}++G HX
L</td></tr>
                        <tr><th align=""left"">Browser:</th><td>+,H @
{,,@ A
campaign,,A I
.,,I J
Browser,,J Q
},,Q RS
G</td></tr>
                        <tr><th align=""left"">OS:</th><td>,-R ;
{--; <
campaign--< D
.--D E
OS--E G
}--G HY
M</td></tr>
                        <tr><th align=""left"">Referrer:</th><td>-.H A
{..A B
campaign..B J
...J K
Referrer..K S
}..S T~
r</td></tr>
                        </table></p> <p>We will soon contact you and update you about your order.</p> ./T f
{//f g
Footer//g m
}//m n
"//n o
;//o p
await11 
SendEmailAsync11  
(11  !
loggedInUser11! -
.11- .
Email11. 3
,113 4
subject115 <
,11< =
body11> B
,11B C
string11D J
.11J K
Empty11K P
,11P Q
	bccEmails11R [
)11[ \
;11\ ]
}22 	
public44 
static44 
async44 
Task44   
SendApprovedToVendor44! 5
(445 6
Vendor446 <
vendor44= C
,44C D
Campaign44E M
campaign44N V
,44V W
CampaignSegment44X g
segment44h o
)44o p
{55 	
string66 
newOld66 
=66 
!66 
campaign66 %
.66% &

?664 5
$str666 ;
:66< =
$str66> C
;66C D
string77 
orderNumber77 
=77  
campaign77! )
.77) *
OrderNumber77* 5
;775 6
string88 

deployDate88 
=88 
campaign88  (
.88( )
Approved88) 1
.881 2

DeployDate882 <
?88< =
.88= >
ToString88> F
(88F G
$str88G J
)88J K
;88K L
string99 

deployTime99 
=99 
campaign99  (
.99( )
Approved99) 1
.991 2

DeployDate992 <
?99< =
.99= >
ToString99> F
(99F G
$str99G N
)99N O
;99O P
string:: 
quantity:: 
=:: 
campaign:: &
.::& '
Approved::' /
.::/ 0
Quantity::0 8
.::8 9
ToString::9 A
(::A B
)::B C
;::C D
string<< 
subject<< 
;<< 
string== 
segmentsHtml== 
===  !
string==" (
.==( )
Empty==) .
;==. /
if>> 
(>> 
segment>> 
==>> 
null>> 
)>>  
{?? 
subject@@ 
=@@ 
$"@@ 
{@@ 
newOld@@ #
}@@# $
 Order @@$ +
{@@+ ,
campaign@@, 4
.@@4 5
Approved@@5 =
.@@= >
CampaignName@@> J
}@@J K

, Order # @@K U
{@@U V
campaign@@V ^
.@@^ _
OrderNumber@@_ j
}@@j k
"@@k l
;@@l m
}AA 
elseAA 
{BB 
subjectCC 
=CC 
$"CC 
{CC 
newOldCC #
}CC# $
 Order CC$ +
{CC+ ,
campaignCC, 4
.CC4 5
ApprovedCC5 =
.CC= >
CampaignNameCC> J
}CCJ K

, Order # CCK U
{CCU V
segmentCCV ]
.CC] ^

}CCk l
"CCl m
;CCm n
segmentsHtmlDD 
+=DD 
$@"DD  #i
]<table border=""1"">
                                <tr><th align=""left"">Segment</th><td>DE# G
{EEG H
segmentEEH O
.EEO P

}EE] ^d
X</td></tr>
                                <tr><th align=""left"">Subject Line</th><td>EF^ L
{FFL M
segmentFFM T
.FFT U
SubjectLineFFU `
}FF` aa
U</td></tr>
                                <tr><th align=""left"">From Line</th><td>FGa I
{GGI J
segmentGGJ Q
.GGQ R
FromLineGGR Z
}GGZ [c
W</td></tr>
                                <tr><th align=""left"">White Label</th><td>GH[ K
{HHK L
segmentHHL S
.HHS T

WhiteLabelHHT ^
}HH^ _g
[</td></tr>
                                <tr><th align=""left"">Deployment Date</th><td>HI_ O
{IIO P
segmentIIP W
.IIW X
DeploymentDateIIX f
}IIf ga
U</td></tr>
                                <tr><th align=""left"">Data File</th><td>IJg I
{JJI J
segmentJJJ Q
.JJQ R
SegmentDataFileUrlJJR d
}JJd ee
Y</td></tr>
                                <tr><th align=""left"">Total Records</th><td>JKe M
{KKM N
NumberHelperKKN Z
.KKZ [
GetTotalKK[ c
(KKc d
segmentLL 
.LL 
FirstRangeStartLL +
,LL+ ,
segmentLL- 4
.LL4 5

,LLB C
segmentLLD K
.LLK L
SecondRangeStartLLL \
,LL\ ]
segmentLL^ e
.LLe f
SecondRangeEndLLf t
,LLt u
segmentMM 
.MM 
ThirdRangeStartMM +
,MM+ ,
segmentMM- 4
.MM4 5

)MMB C
}MMC D
</td></tr></table>MMD V
"MMV W
;MMW X
}NN 
stringPP 
bodyPP 
=PP 
$@"PP 

{PP* +
vendorPP+ 1
.PP1 2
NamePP2 6
}PP6 7�
�</p><br/>
                    Please find below Order details<br/><br/>
                    <table border=""2"">
                    <tr><th align=""left""> Reference #:</th><td>PS7 A
{SSA B
campaignSSB J
.SSJ K
ApprovedSSK S
.SSS T
ReferenceNumberSST c
}SSc dT
H</td></tr>
                    <tr><th align=""left"">Order #:</th><td>STd <
{TT< =
orderNumberTT= H
}TTH IZ
N</td></tr>
                    <tr><th align=""left"">Campaign Name:</th><td>TUI B
{UUB C
campaignUUC K
.UUK L
ApprovedUUL T
.UUT U
CampaignNameUUU a
}UUa bX
L</td></tr>
                    <tr><th align=""left"">Rebroadcast:</th><td>UVb @
{VV@ A
(VVA B
campaignVVB J
.VVJ K
ApprovedVVK S
.VVS T
ReBroadCastVVT _
?VV_ `
$strVVa f
:VVf g
$strVVh l
)VVl m
}VVm n�
w</td></tr>                                        
                    <tr><th align=""left"">Broadcast Date:</th><td>VWn C
{WWC D
campaignWWD L
.WWL M
ApprovedWWM U
.WWU V

DeployDateWWV `
.WW` a
ValueWWa f
:WWf g
dWWg h
}WWh iV
J</td></tr>
                    <tr><th align=""left"">From Line:</th><td>WXi >
{XX> ?
campaignXX? G
.XXG H
ApprovedXXH P
.XXP Q
FromLineXXQ Y
}XXY ZY
M</td></tr>
                    <tr><th align=""left"">Subject Line:</th><td>XYZ A
{YYA B
campaignYYB J
.YYJ K
ApprovedYYK S
.YYS T
SubjectLineYYT _
}YY_ `T
H</td></tr>
                    <tr><th align=""left"">Opt Out:</th><td>YZ` <
{ZZ< =
campaignZZ= E
.ZZE F
OptOutZZF L
}ZZL MX
L</td></tr>
                    <tr><th align=""left"">White Label:</th><td>Z[M @
{[[@ A
campaign[[A I
.[[I J
Approved[[J R
.[[R S

WhiteLabel[[S ]
}[[] ^�
x</td></tr>                                        
                    <tr><th align=""left"">Personalization:</th><td>[\^ D
{\\D E
(\\E F
campaign\\F N
.\\N O
IsPersonalization\\O `
?\\` a
$str\\b g
:\\g h
$str\\i m
)\\m n
}\\n oY
M</td></tr>
                    <tr><th align=""left"">Creative URL:</th><td>\]o A
{]]A B
campaign]]B J
.]]J K
Assets]]K Q
.]]Q R
CreativeUrl]]R ]
}]]] ^U
I</td></tr>
                    <tr><th align=""left"">Quantity:</th><td>]^^ =
{^^= >
quantity^^> F
}^^F GT
H</td></tr>
                    <tr><th align=""left"">Geo (s):</th><td>^_G <
{__< =
campaign__= E
.__E F
Approved__F N
.__N O

GeoDetails__O Y
}__Y ZY
M</td></tr>
                    <tr><th align=""left"">Demographics:</th><td>_`Z A
{``A B
campaign``B J
.``J K
Approved``K S
.``S T
Demographics``T `
}``` aX
L</td></tr>
                    <tr><tr><th align=""left"">Zip URL:</th><td>`aa @
{aa@ A
campaignaaA I
.aaI J
AssetsaaJ P
.aaP Q

ZipCodeUrlaaQ [
}aa[ \a
U</td></tr>
                    <tr><th align=""left"">Special Instructions:</th><td>ab\ I
{bbI J
campaignbbJ R
.bbR S
ApprovedbbS [
.bb[ \
SpecialInstructionsbb\ o
}bbo pX
L</td></tr>
                    <tr><th align=""left"">Deploy Date:</th><td>bcp @
{cc@ A

deployDateccA K
}ccK LX
L</td></tr>
                    <tr><th align=""left"">Deploy Time:</th><td>cdL @
{dd@ A

deployTimeddA K
}ddK L\
P</td></tr>
                    <tr><th align=""left"">ReportSite Link:</th><td>deL D
{eeD E
campaigneeE M
.eeM N
ApprovedeeN V
.eeV W
ReportSiteLinkeeW e
}eee fZ
N</td></tr>
                    <tr><th align=""left"">Link Breakout:</th><td>eff B
{ffB C
campaignffC K
.ffK L
ApprovedffL T
.ffT U
LinkBreakoutffU a
}ffa b[
O</td></tr>
                    <tr><th align=""left"">Has Open Pixel:</th><td>fgb C
{ggC D
(ggD E
campaignggE M
.ggM N
ApprovedggN V
.ggV W
IsOpenPixelggW b
?ggb c
$strggd i
:ggi j
$strggk o
)ggo p
}ggp q[
O</td></tr>
                    <tr><th align=""left"">Open Pixel URL:</th><td>ghq C
{hhC D
campaignhhD L
.hhL M
ApprovedhhM U
.hhU V
OpenPixelUrlhhV b
}hhb cW
K</td></tr>
                    <tr><th align=""left"">Open Goals:</th><td>hic ?
{ii? @
campaignii@ H
.iiH I
ApprovediiI Q
.iiQ R
	OpenGoalsiiR [
}ii[ \X
L</td></tr>
                    <tr><th align=""left"">Click Goals:</th><td>ij\ @
{jj@ A
campaignjjA I
.jjI J
ApprovedjjJ R
.jjR S

ClickGoalsjjS ]
}jj] ^Y
M</td></tr>
                    <tr><th align=""left"">Segment Data:</th><td>jk^ A
{kkA B
segmentsHtmlkkB N
}kkN OA
5</td></tr>
                    </table></p> <p></p> klO )
{ll) *
Footerll* 0
}ll0 1
"ll1 2
;ll2 3
awaitmm 
SendEmailAsyncmm  
(mm  !
vendormm! '
.mm' (
Emailmm( -
,mm- .
subjectmm/ 6
,mm6 7
bodymm8 <
,mm< =
vendormm> D
.mmD E
CcEmailsmmE M
)mmM N
;mmN O
}nn 	
publicpp 
staticpp 
asyncpp 
Taskpp  %
SendNotificationsToVendorpp! :
(pp: ;
Vendorpp; A
vendorppB H
,ppH I
ListppJ N
<ppN O
CampaignppO W
>ppW X
	campaignsppY b
)ppb c
{qq 	
stringrr 
subjectrr 
=rr 
$strrr <
;rr< =

problemstt "
=tt# $
newtt% (

(tt6 7
$str	tt7 �
)
tt� �
;
tt� �
foreachuu 
(uu 
varuu 
campaignuu !
inuu" $
	campaignsuu% .
)uu. /
{vv 
foreachww 
(ww 
varww 
notificationww )
inww* ,
campaignww- 5
.ww5 6

)wwC D
{xx 
problemsyy 
.yy 
Appendyy #
(yy# $
$"yy$ &
<tr><td>yy& .
{yy. /
campaignyy/ 7
.yy7 8
OrderNumberyy8 C
}yyC D
	</td><td>yyD M
{yyM N
campaignyyN V
.yyV W
CampaignNameyyW c
}yyc d
	</td><td>yyd m
{yym n
notificationyyn z
.yyz {
	CheckTime	yy{ �
}
yy� �
	</td><td>
yy� �
{
yy� �
(
yy� �
QcRule
yy� �
)
yy� �
notification
yy� �
.
yy� �
QCRule
yy� �
}
yy� �
	</td><td>
yy� �
{
yy� �

yy� �
.
yy� �
	GetString
yy� �
(
yy� �
notification
yy� �
.
yy� �
QCRule
yy� �
)
yy� �
}
yy� �

</td></tr>
yy� �
"
yy� �
)
yy� �
;
yy� �
}zz 
}{{ 
problems|| 
.|| 
Append|| 
(|| 
$str|| &
)||& '
;||' (
string}} 
body}} 
=}} 
$@"}} 

{}}* +
vendor}}+ 1
.}}1 2
Name}}2 6
}}}6 7I
=</p><br/>There is problem with these orders<br/><br/></p> <p>}}7 t
{}}t u
problems}}u }
}}}} ~
</p> 	}}~ �
{
}}� �
Footer
}}� �
}
}}� �
"
}}� �
;
}}� �
await~~ 
SendEmailAsync~~  
(~~  !
vendor~~! '
.~~' (
Email~~( -
,~~- .
subject~~/ 6
,~~6 7
body~~8 <
,~~< =
vendor~~> D
.~~D E
CcEmails~~E M
)~~M N
;~~N O
} 	
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
�� 
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
�� 
$@"
�� !f
X<p>ADSLive: An error has been occured.</p>
                            <p>Controller : 
��! ,
{
��, -
currentController
��- >
}
��> ?
</p><p>Action : 
��? O
{
��O P

��P ]
}
��] ^C
5</p>
                            <p>Error Details : 
��^ /
{
��/ 0
ex
��0 2
.
��2 3!
GetExceptionMessage
��3 F
(
��F G
)
��G H
}
��H I
</p>
��I M
"
��M N
;
��N O
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
�� 
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
�� 
var
�� 
msg
�� 
=
�� 

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
�� 
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
�� 
var
�� 
msg
�� 
=
�� 

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
�� 
}
�� 	
private
�� 
static
�� 
MailMessage
�� "

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
�� 
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
�� 
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
�� 
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
�� 
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
 
.
ICT 
. 
Web 
. 
Helpers 
{ 
public

static
class
ExceptionHelper
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

=Y Z
$str[ ]
)] ^
{ 	
var 
message 
= 
( 

!=) +
$str, .
). /
? 

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
{ 
return 
$str 6
+7 8
message9 @
;@ A
} 
else 
if 
( 
ex 
is $
IndexOutOfRangeException 3
)3 4
{ 
return 
$str 1
+2 3
message4 ;
;; <
} 
else 
if 
( 
ex 
is '
DbEntityValidationException 6
)6 7
{   
var!! 
	exception!! 
=!! 
(!!  !'
DbEntityValidationException!!! <
)!!< =
ex!!= ?
;!!? @
var"" 

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
}(( 
else)) 
if)) 
()) 
ex)) 
is)) +
EntityCommandExecutionException)) :
))): ;
{** 
return++ 
$str++ >
+++? @
message++A H
;++H I
},, 
else-- 
if-- 
(-- 
ex-- 
is-- 
SecurityException-- ,
)--, -
{.. 
return// 
$str// *
+//+ ,
message//- 4
;//4 5
}00 
else11 
if11 
(11 
ex11 
is11 
SystemException11 *
)11* +
{22 
return33 
message33 
;33 
}44 
else55 
if55 
(55 
ex55 
is55  
ApplicationException55 /
)55/ 0
{66 
return77 
message77 
;77 
}88 
else99 
{:: 
return;; 
message;; 
;;; 
}<< 
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

=>>S T
$str>>U W
)>>W X
{?? 	
var@@ 
message@@ 
=@@ 
(@@ 

!=@@) +
$str@@, .
)@@. /
?AA 

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
{DD 
}FF 
elseGG 
ifGG 
(GG 
exGG 
isGG $
IndexOutOfRangeExceptionGG 3
)GG3 4
{HH 
}JJ 
elseKK 
ifKK 
(KK 
exKK 
isKK '
DbEntityValidationExceptionKK 6
)KK6 7
{LL 
varMM 
	exceptionMM 
=MM 
(MM  !'
DbEntityValidationExceptionMM! <
)MM< =
exMM= ?
;MM? @
varNN 

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
}TT 
elseUU 
ifUU 
(UU 
exUU 
isUU +
EntityCommandExecutionExceptionUU :
)UU: ;
{VV 
}XX 
elseYY 
ifYY 
(YY 
exYY 
isYY 
SecurityExceptionYY ,
)YY, -
{ZZ 
}\\ 
else]] 
if]] 
(]] 
ex]] 
is]] 
SystemException]] *
)]]* +
{^^ 
}`` 
elseaa 
ifaa 
(aa 
exaa 
isaa  
ApplicationExceptionaa /
)aa/ 0
{bb 
}dd 
elseee 
{ff 
}hh 
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
{tt 
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
}{{ 
return|| 
sb|| 
.|| 
ToString|| 
(|| 
)||  
;||  !
}}} 	
}~~ 
} �
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\FileHelper.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Helpers 
{ 
public 

class 

FileHelper 
{ 
public 
static 
readonly 
string %&
UploadsSupplierListingPath& @
=A B
HttpContextC N
.N O
CurrentO V
.V W
ServerW ]
.] ^
MapPath^ e
(e f
$str	f �
)
� �
;
� �
public

 
static

 
string

 
GetImagePath

 )
(

) *
string

* 0
fileName

1 9
)

9 :
{ 	
return &
UploadsSupplierListingPath -
+- .
$str. 2
+2 3
fileName3 ;
+; <
$str< B
;B C
}
public 
static 
string 
GetValidFileName -
(- .
string. 4
fileName5 =
)= >
{ 	
string 
ret 
= 
Regex 
. 
Replace &
(& '
fileName' /
./ 0
Trim0 4
(4 5
)5 6
,6 7
$str8 J
,J K
$strL N
)N O
;O P
return 
ret 
. 
Replace 
( 
$str "
," #
string$ *
.* +
Empty+ 0
)0 1
;1 2
} 	
} 
} �
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Helpers\GatePassGenerator.cs
	namespace 	
WFP
 
.
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
}
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
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Hubs 
{ 
[ 
HubName 
( 
$str
) 
] 
public 

class 
	WFPICTHub 
: 
Hub  
{ 
private		 
readonly		 

_wfpictUpdater		' 5
;		5 6
public 
	WFPICTHub 
( 
) 
: 
this !
(! "

./ 0
Instance0 8
)8 9
{ 	
}
public 
	WFPICTHub 
( 


)4 5
{ 	
_wfpictUpdater 
= 

;* +
} 	
public 
void  
StartUpdatingClients (
(( )
)) *
{ 	
_wfpictUpdater 
.  
StartUpdatingClients /
(/ 0
)0 1
;1 2
} 	
public 
void 
StopUpdatingClients '
(' (
)( )
{ 	
_wfpictUpdater   
.   
StopUpdatingClients   .
(  . /
)  / 0
;  0 1
}!! 	
}"" 
}## �,
?E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Hubs\WFPICTUpdater.cs
	namespace

 	
WFP


 
.


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
 
Hubs

 
{ 
public 

class 

{
private 
readonly 
static 
Lazy  $
<$ %

>2 3
	_instance4 =
=> ?
new 
Lazy 
< 

>" #
(# $
( 
) 
=> 
new 

(' (

GlobalHost 
. 
ConnectionManager 0
.0 1

<> ?
	WFPICTHub? H
>H I
(I J
)J K
.K L
ClientsL S
)S T
)T U
;U V
private 
readonly 
object 
_lock  %
=& '
new( +
object, 2
(2 3
)3 4
;4 5
private 
readonly 
TimeSpan !
_updateInterval" 1
=2 3
TimeSpan4 <
.< =
FromSeconds= H
(H I
$numI K
)K L
;L M
private 
Timer 
_timer 
; 
private 
volatile 
bool 
_isUpdating )
;) *
private 

( !
IHubConnectionContext 3
<3 4
dynamic4 ;
>; <
clients= D
)D E
{ 	
Clients 
= 
clients 
; 
} 	
public 
static 

Instance$ ,
{   	
get!! 
{"" 
return## 
	_instance##  
.##  !
Value##! &
;##& '
}$$ 
}%% 	
private'' !
IHubConnectionContext'' %
<''% &
dynamic''& -
>''- .
Clients''/ 6
{(( 	
get)) 
;)) 
set** 
;** 
}++ 	
public-- 
void--  
StartUpdatingClients-- (
(--( )
)--) *
{.. 	
lock// 
(// 
_lock// 
)// 
{00 
_timer11 
=11 
new11 
Timer11 "
(11" #

,110 1
null112 6
,116 7
_updateInterval118 G
,11G H
_updateInterval11I X
)11X Y
;11Y Z
}22 
}33 	
private55 
void55 

(55" #
object55# )
state55* /
)55/ 0
{66 	
lock77 
(77 
_lock77 
)77 
{88 
if99 
(99 
!99 
_isUpdating99  
)99  !
{:: 
_isUpdating;; 
=;;  !
true;;" &
;;;& '
using== 
(== 
var== 
db== !
===" #
new==$ '

(==5 6
)==6 7
)==7 8
{>> 
var?? 
logs??  
=??! "
db??# %
.??% &

SystemLogs??& 0
.??0 1
OrderByDescending??1 B
(??B C
x??C D
=>??E G
x??H I
.??I J
	CreatedAt??J S
)??S T
.@@ 
Take@@ !
(@@! "
$num@@" %
)@@% &
.AA 
ToListAA #
(AA# $
)AA$ %
.BB 
SelectBB #
(BB# $
xBB$ %
=>BB& (
newBB) ,
SystemLogVMBB- 8
(BB8 9
)BB9 :
{CC 
	CreatedAtDD  )
=DD* +
xDD, -
.DD- .
	CreatedAtDD. 7
.DD7 8
ToStringDD8 @
(DD@ A
StringConstantsDDA P
.DDP Q 
DateTimeFormatDashesDDQ e
)DDe f
,DDf g
LogTypeEE  '
=EE( )
SystemEE* 0
.EE0 1
EnumEE1 5
.EE5 6
GetNameEE6 =
(EE= >
typeofEE> D
(EED E
LogTypeEEE L
)EEL M
,EEM N
(EEO P
LogTypeEEP W
)EEW X
xEEX Y
.EEY Z
LogTypeEEZ a
)EEa b
,EEb c
OrderNumberFF  +
=FF, -
xFF. /
.FF/ 0
OrderNumberFF0 ;
,FF; <
MessageGG  '
=GG( )
xGG* +
.GG+ ,
MessageGG, 3
}HH 
)HH 
.II 
ToListII #
(II# $
)II$ %
;II% &
ClientsJJ 
.JJ  
AllJJ  #
.JJ# $
refreshJJ$ +
(JJ+ ,
logsJJ, 0
)JJ0 1
;JJ1 2
}KK 
_isUpdatingLL 
=LL  !
falseLL" '
;LL' (
}MM 
}NN 
}OO 	
publicQQ 
voidQQ 
StopUpdatingClientsQQ '
(QQ' (
)QQ( )
{RR 	
lockSS 
(SS 
_lockSS 
)SS 
{TT 
ifUU 
(UU 
_timerUU 
!=UU 
nullUU "
)UU" #
{VV 
_timerWW 
.WW 
DisposeWW "
(WW" #
)WW# $
;WW$ %
}XX 
}YY 
}ZZ 	
}[[ 
}\\ �
9E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\API\Campaign.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
API 
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
 HoursPercentageDictionaryDynamic		N n
=

 
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
{ 
$num
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
{
$num
,
new
KeyValuePair
<
int
,
int
>
(
$num
,
$num
)
}
,
{ 
$num
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
{ 
$num
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
{ 
$num
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
{ 
$num
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
{ 
$num
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
{ 
$num
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
{ 
$num
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
{ 
$num
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
{ 
$num
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
 HoursPercentageDictionaryDynamic* J
[J K
$numK L
]L M
.M N
KeyN Q
,Q R,
 HoursPercentageDictionaryDynamicS s
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
 HoursPercentageDictionaryDynamic  * J
[  J K
$num  K L
]  L M
.  M N
Key  N Q
,  Q R,
 HoursPercentageDictionaryDynamic  S s
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
 HoursPercentageDictionaryDynamic""* J
[""J K
$num""K L
]""L M
.""M N
Key""N Q
,""Q R,
 HoursPercentageDictionaryDynamic""S s
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
 HoursPercentageDictionaryDynamic$$* J
[$$J K
$num$$K L
]$$L M
.$$M N
Key$$N Q
,$$Q R,
 HoursPercentageDictionaryDynamic$$S s
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
 HoursPercentageDictionaryDynamic&&* J
[&&J K
$num&&K L
]&&L M
.&&M N
Key&&N Q
,&&Q R,
 HoursPercentageDictionaryDynamic&&S s
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
 HoursPercentageDictionaryDynamic((* J
[((J K
$num((K M
]((M N
.((N O
Key((O R
,((R S,
 HoursPercentageDictionaryDynamic((T t
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
 HoursPercentageDictionaryDynamic*** J
[**J K
$num**K M
]**M N
.**N O
Key**O R
,**R S,
 HoursPercentageDictionaryDynamic**T t
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
 HoursPercentageDictionaryDynamic,,* J
[,,J K
$num,,K M
],,M N
.,,N O
Key,,O R
,,,R S,
 HoursPercentageDictionaryDynamic,,T t
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
 HoursPercentageDictionaryDynamic..* J
[..J K
$num..K M
]..M N
...N O
Key..O R
,..R S,
 HoursPercentageDictionaryDynamic..T t
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
 HoursPercentageDictionaryDynamic00* J
[00J K
$num00K M
]00M N
.00N O
Key00O R
,00R S,
 HoursPercentageDictionaryDynamic00T t
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
 HoursPercentageDictionaryDynamic22* J
[22J K
$num22K M
]22M N
.22N O
Key22O R
,22R S,
 HoursPercentageDictionaryDynamic22T t
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
HoursPercentageDictionary66> W
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
{88 
$num88
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
HoursPercentageDictionaryAA! :
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
HoursPercentageDictionaryDD 1
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
{FF 
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
}LL 
returnMM %
HoursPercentageDictionaryMM ,
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
quantityPP( 0
,PP0 1
DateTimePP2 :

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
quantitySS$ ,
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
IoNumberXX 
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
static`` 
Campaign`` 
FromCampaign`` +
(``+ ,
WFP``, /
.``/ 0
ICT``0 3
.``3 4
Data``4 8
.``8 9
Entities``9 A
.``A B
Campaign``B J
campaign``K S
)``S T
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

=cc# $
DateTimecc% -
.cc- .
MinValuecc. 6
;cc6 7
stringdd 
ioNumberdd 
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
{ff 
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

)iiK L
;iiL M
}jj 
varkk 
modelkk 
=kk 
newkk 
Campaignkk $
(kk$ %
)kk% &
{ll 
CampaignNamemm 
=mm 
campaignmm '
.mm' (
Approvedmm( 0
.mm0 1
CampaignNamemm1 =
,mm= >

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
IoNumberpp 
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

==qq* ,
DateTimeqq- 5
.qq5 6
MinValueqq6 >
?qq? @
$strqqA E
:qqF G

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
}ss 
;ss
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
{vv 
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
}|| 
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
LE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignTrackingDetailVm.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Models 
{ 
public 

class $
CampaignTrackingDetailVm )
:* +
CampaignTrackingVm, >
{ 
public 
string 
IoNumber 
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
 
.
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
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
public
DateTime
?
DeploymentDate
{
get
;
set
;
}
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
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
long 
Quantity 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
FirstRangeStart "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 

{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SecondRangeStart #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
SecondRangeEnd !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
ThirdRangeStart "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 

{! "
get# &
;& '
set( +
;+ ,
}- .
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
 
.
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
public
Guid
?

CampaignId
{
get
;
set
;
}
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
 
.
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
public
Guid
?

CampaignId
{
get
;
set
;
}
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
 
.


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
{
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
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
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
{dd 
Idee 
=ee 
Idee 
,ee 
OrderNumberff 
=ff 
OrderNumberff )
,ff) *
}gg 
;gg
foreachhh 
(hh 
varhh 
	segmentVmhh "
inhh# %
Segmentshh& .
)hh. /
{ii 
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
}kk 
returnll 
cll 
;ll 
}mm 	
}nn 
}pp �
CE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CreativeUtility.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Models 
{
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
{ 
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
} 
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
 
.
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
public
string
FromLine
{
get
;
set
;
}
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
} �d
FE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CampaignTrackingVm.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Models 
{ 
public		 

class		 
CampaignTrackingVm		 #
{

 
public 
string 

CampaignId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 

TrackingId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public
string
OrderNumber
{
get
;
set
;
}
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	OrderDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Quantity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
IoNumber 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	StartDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Opened 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Clicked 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Unsub 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Forwards 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
OpenedPercentage &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ClickedPercentage '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
UnsubPercentage %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string !
ClickToOpenPercentage +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public   
string   !
UnsubToOpenPercentage   +
{  , -
get  . 1
;  1 2
set  3 6
;  6 7
}  8 9
public!! 
string!! 
Bounce!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
public"" 
string"" 
Opt"" 
{"" 
get"" 
;""  
set""! $
;""$ %
}""& '
public## 
string## 
Desktop## 
{## 
get##  #
;### $
set##% (
;##( )
}##* +
public$$ 
string$$ 
Mobile$$ 
{$$ 
get$$ "
;$$" #
set$$$ '
;$$' (
}$$) *
public&& 
List&& 
<&& $
CampaignTrackingDetailVm&& ,
>&&, -
PerLink&&. 5
{&&6 7
get&&8 ;
;&&; <
set&&= @
;&&@ A
}&&B C
public(( 
static(( 
CampaignTrackingVm(( ( 
FromCampaignTracking(() =
(((= >
Campaign((> F
campaign((G O
,((O P
CampaignTracking((Q a
campaignTracking((b r
)((r s
{)) 	
var** 
model** 
=** 
new** 
CampaignTrackingVm** .
{++ 

CampaignId,, 
=,, 
campaign,, %
.,,% &
Id,,& (
.,,( )
ToString,,) 1
(,,1 2
),,2 3
,,,3 4

TrackingId-- 
=-- 
campaignTracking-- -
.--- .
Id--. 0
.--0 1
ToString--1 9
(--9 :
)--: ;
,--; <
OrderNumber.. 
=.. 
string.. $
...$ %

(..2 3
campaignTracking..3 C
...C D

)..Q R
?..S T
campaignTracking..U e
...e f
OrderNumber..f q
:..r s
campaignTracking	..t �
.
..� �

..� �
,
..� �
CampaignName// 
=// 
campaign// '
.//' (
Approved//( 0
.//0 1
CampaignName//1 =
,//= >

WhiteLabel00 
=00 
campaign00 %
.00% &
Approved00& .
.00. /

WhiteLabel00/ 9
,009 :
SubjectLine11 
=11 
campaign11 &
.11& '
Approved11' /
.11/ 0
SubjectLine110 ;
,11; <
FromLine22 
=22 
campaign22 #
.22# $
Approved22$ ,
.22, -
FromLine22- 5
,225 6
	OrderDate33 
=33 
campaign33 $
.33$ %
	CreatedAt33% .
.33. /
ToString33/ 7
(337 8
StringConstants338 G
.33G H
DateFormatSlashes33H Y
)33Y Z
,33Z [
Status44 
=44 
(44 
(44 
CampaignStatus44 )
)44) *
campaign44* 2
.442 3
Status443 9
)449 :
.44: ;
ToString44; C
(44C D
)44D E
,44E F
Quantity66 
=66 
campaignTracking66 +
.66+ ,
Quantity66, 4
.664 5
ToString665 =
(66= >
)66> ?
,66? @
IoNumber77 
=77 
campaignTracking77 +
.77+ ,
IoNumber77, 4
,774 5
	StartDate88 
=88 
campaignTracking88 ,
.88, -
	StartDate88- 6
?886 7
.887 8
ToString888 @
(88@ A
StringConstants88A P
.88P Q
DateFormatSlashes88Q b
)88b c
,88c d
Opened99 
=99 
campaignTracking99 )
.99) *
Opened99* 0
==991 3
$num994 5
?996 7
$str998 <
:99= >
campaignTracking99? O
.99O P
Opened99P V
.99V W
ToString99W _
(99_ `
)99` a
,99a b
Clicked:: 
=:: 
campaignTracking:: *
.::* +
Clicked::+ 2
==::3 5
$num::6 7
?::8 9
$str::: >
:::? @
campaignTracking::A Q
.::Q R
Clicked::R Y
.::Y Z
ToString::Z b
(::b c
)::c d
,::d e
Unsub;; 
=;; 
campaignTracking;; (
.;;( )
Unsub;;) .
==;;/ 1
$num;;2 3
?;;4 5
$str;;6 :
:;;; <
campaignTracking;;= M
.;;M N
Unsub;;N S
.;;S T
ToString;;T \
(;;\ ]
);;] ^
,;;^ _
Forwards<< 
=<< 
campaignTracking<< +
.<<+ ,
Forwards<<, 4
==<<5 7
$num<<8 9
?<<: ;
$str<<< @
:<<A B
campaignTracking<<C S
.<<S T
Forwards<<T \
.<<\ ]
ToString<<] e
(<<e f
)<<f g
,<<g h
Mobile== 
=== 
campaignTracking== )
.==) *
Mobile==* 0
.==0 1
ToString==1 9
(==9 :
)==: ;
,==; <
Desktop>> 
=>> 
campaignTracking>> *
.>>* +
Desktop>>+ 2
.>>2 3
ToString>>3 ;
(>>; <
)>>< =
,>>= >
Bounce?? 
=?? 
campaignTracking?? )
.??) *
Bounce??* 0
.??0 1
ToString??1 9
(??9 :
)??: ;
,??; <
Opt@@ 
=@@ 
campaignTracking@@ &
.@@& '
Opt@@' *
.@@* +
ToString@@+ 3
(@@3 4
)@@4 5
,@@5 6
OpenedPercentageAA  
=AA! "
campaignTrackingAA# 3
.AA3 4
OpenedPercentageAA4 D
.AAD E
ToStringAAE M
(AAM N
$strAAN U
)AAU V
,AAV W
ClickedPercentageBB !
=BB" #
campaignTrackingBB$ 4
.BB4 5
ClickedPercentageBB5 F
.BBF G
ToStringBBG O
(BBO P
$strBBP W
)BBW X
,BBX Y
UnsubPercentageCC 
=CC  !
campaignTrackingCC" 2
.CC2 3
UnsubPercentageCC3 B
.CCB C
ToStringCCC K
(CCK L
$strCCL S
)CCS T
,CCT U!
ClickToOpenPercentageDD %
=DD& '
campaignTrackingDD( 8
.DD8 9!
ClickToOpenPercentageDD9 N
.DDN O
ToStringDDO W
(DDW X
$strDDX _
)DD_ `
,DD` a!
UnsubToOpenPercentageEE %
=EE& '
campaignTrackingEE( 8
.EE8 9!
UnsubToOpenPercentageEE9 N
.EEN O
ToStringEEO W
(EEW X
$strEEX _
)EE_ `
,EE` a
PerLinkGG 
=GG 
newGG 
ListGG "
<GG" #$
CampaignTrackingDetailVmGG# ;
>GG; <
(GG< =
)GG= >
}HH 
;HH
varJJ 
proDatasJJ 
=JJ 
campaignJJ #
.JJ# $
ProDatasJJ$ ,
.KK 
WhereKK 
(KK 
xKK 
=>KK 
xKK 
.KK 
OrderNumberKK )
==KK* ,
campaignTrackingKK- =
.KK= >
OrderNumberKK> I
&&KKJ L
xKKM N
.KKN O

==KK] _
campaignTrackingKK` p
.KKp q

)KK~ 
.LL 
OrderByLL 
(LL 
xLL 
=>LL 

.LL+ ,
GetIndexLL, 4
(LL4 5
xLL5 6
.LL6 7
Reportsite_URLLL7 E
)LLE F
)LLF G
;LLG H
foreachNN 
(NN 
varNN 
proDataNN  
inNN! #
proDatasNN$ ,
)NN, -
{OO 
modelPP 
.PP 
PerLinkPP 
.PP 
AddPP !
(PP! "
newPP" %$
CampaignTrackingDetailVmPP& >
{QQ 
IoNumberRR 
=RR 
proDataRR &
.RR& '
IORR' )
,RR) *
OrderNumberSS 
=SS  !
proDataSS" )
.SS) *
Reportsite_URLSS* 8
,SS8 9
LinkTT 
=TT 
proDataTT "
.TT" #
Destination_URLTT# 2
,TT2 3

ClickCountUU 
=UU  
proDataUU! (
.UU( )

ClickCountUU) 3
.UU3 4
ToStringUU4 <
(UU< =
)UU= >
,UU> ?
UniqueCountVV 
=VV  !
proDataVV" )
.VV) *
	UniqueCntVV* 3
.VV3 4
ToStringVV4 <
(VV< =
)VV= >
,VV> ?
MobileCountWW 
=WW  !
proDataWW" )
.WW) *
	MobileCntWW* 3
.WW3 4
ToStringWW4 <
(WW< =
)WW= >
}XX 
)XX 
;XX 
}YY 
return[[ 
model[[ 
;[[ 
}\\ 	
}]] 
}^^ �
EE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\HtmlProcessResult.cs
	namespace 	
WFP
 
.
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
 
.
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
public
double
ctr_percent
{
get
;
set
;
}
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
 
.
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
 
.
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
public
bool
IsDeletable
{
get
;
set
;
}
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
 
.
ICT 
. 
Web 
. 
Models 
{ 
public 

class 

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
public
string
InUsers
{
get
;
set
;
}
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
 
.
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
public
string
advancedStatus
{
get
;
set
;
}
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
} �U
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\OfficeUserVM.cs
	namespace 	
WFP
 
.
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
public

class
ExternalLoginListViewModel
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
$strDD %
)DD% &
]DD& '
publicEE 
stringEE 

WhiteLabelEE  
{EE! "
getEE# &
;EE& '
setEE( +
;EE+ ,
}EE- .
[GG 	
RequiredGG	 
]GG 
[HH 	
DisplayHH	 
(HH 
NameHH 
=HH 
$strHH #
)HH# $
]HH$ %
publicII 
stringII 
UserNameII 
{II  
getII! $
;II$ %
setII& )
;II) *
}II+ ,
[KK 	
RequiredKK	 
]KK 
[LL 	
DisplayLL	 
(LL 
NameLL 
=LL 
$strLL '
)LL' (
]LL( )
publicMM 
boolMM 
IsAdminUserMM 
{MM  !
getMM" %
;MM% &
setMM' *
;MM* +
}MM, -
[OO 	
RequiredOO	 
]OO 
[PP 	
DisplayPP	 
(PP 
NamePP 
=PP 
$strPP %
)PP% &
]PP& '
publicQQ 
boolQQ 
	IsUsesAPIQQ 
{QQ 
getQQ  #
;QQ# $
setQQ% (
;QQ( )
}QQ* +
[SS 	
RequiredSS	 
]SS 
[TT 	
DisplayTT	 
(TT 
NameTT 
=TT 
$strTT 2
)TT2 3
]TT3 4
publicUU 
boolUU 
IsTestsCreativesUU $
{UU% &
getUU' *
;UU* +
setUU, /
;UU/ 0
}UU1 2
[WW 	
RequiredWW	 
]WW 
[XX 	
EmailAddressXX	 
]XX 
[YY 	
DisplayYY	 
(YY 
NameYY 
=YY 
$strYY 
)YY  
]YY  !
publicZZ 
stringZZ 
EmailZZ 
{ZZ 
getZZ !
;ZZ! "
setZZ# &
;ZZ& '
}ZZ( )
[\\ 	
Required\\	 
]\\ 
[]] 	
StringLength]]	 
(]] 
$num]] 
,]] 
ErrorMessage]] '
=]]( )
$str]]* Y
,]]Y Z

=]]i j
$num]]k l
)]]l m
]]]m n
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
$str__ "
)__" #
]__# $
public`` 
string`` 
Password`` 
{``  
get``! $
;``$ %
set``& )
;``) *
}``+ ,
[bb 	
DataTypebb	 
(bb 
DataTypebb 
.bb 
Passwordbb #
)bb# $
]bb$ %
[cc 	
Displaycc	 
(cc 
Namecc 
=cc 
$strcc *
)cc* +
]cc+ ,
[dd 	
Comparedd	 
(dd 
$strdd 
,dd 
ErrorMessagedd )
=dd* +
$strdd, b
)ddb c
]ddc d
publicee 
stringee 
ConfirmPasswordee %
{ee& '
getee( +
;ee+ ,
setee- 0
;ee0 1
}ee2 3
}ff 
publichh 

classhh "
ResetPasswordViewModelhh '
{ii 
[jj 	
Requiredjj	 
]jj 
[kk 	
EmailAddresskk	 
]kk 
[ll 	
Displayll	 
(ll 
Namell 
=ll 
$strll 
)ll  
]ll  !
publicmm 
stringmm 
Emailmm 
{mm 
getmm !
;mm! "
setmm# &
;mm& '
}mm( )
[oo 	
Requiredoo	 
]oo 
[pp 	
StringLengthpp	 
(pp 
$numpp 
,pp 
ErrorMessagepp '
=pp( )
$strpp* Y
,ppY Z

=ppi j
$numppk l
)ppl m
]ppm n
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
$strrr "
)rr" #
]rr# $
publicss 
stringss 
Passwordss 
{ss  
getss! $
;ss$ %
setss& )
;ss) *
}ss+ ,
[uu 	
DataTypeuu	 
(uu 
DataTypeuu 
.uu 
Passworduu #
)uu# $
]uu$ %
[vv 	
Displayvv	 
(vv 
Namevv 
=vv 
$strvv *
)vv* +
]vv+ ,
[ww 	
Compareww	 
(ww 
$strww 
,ww 
ErrorMessageww )
=ww* +
$strww, b
)wwb c
]wwc d
publicxx 
stringxx 
ConfirmPasswordxx %
{xx& '
getxx( +
;xx+ ,
setxx- 0
;xx0 1
}xx2 3
publiczz 
stringzz 
Codezz 
{zz 
getzz  
;zz  !
setzz" %
;zz% &
}zz' (
}{{ 
public}} 

class}} #
ForgotPasswordViewModel}} (
{~~ 
[ 	
Required	 
] 
[
�� 	
EmailAddress
��	 
]
�� 
[
�� 	
Display
��	 
(
�� 
Name
�� 
=
�� 
$str
�� 
)
��  
]
��  !
public
�� 
string
�� 
Email
�� 
{
�� 
get
�� !
;
��! "
set
��# &
;
��& '
}
��( )
}
�� 
}�� �
BE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\CompanyUsersVM.cs
	namespace 	
WFP
 
.
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
public
string
Status
{
get
;
set
;
}
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
 
.
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
 
.
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
public
bool
	TwoFactor
{
get
;
set
;
}
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

>" #

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
 
.
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
public
string
OrderNumber
{
get
;
set
;
}
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
} �
@E:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\UploadFileVM.cs
	namespace 	
WFP
 
.
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
FileName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
FileType 
{  
get! $
;$ %
set& )
;) *
}+ ,
public
string
OrderNumber
{
get
;
set
;
}
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsValid 
( 
string "
filePath# +
)+ ,
{ 	
bool 
isValid 
= 
true 
;  
switch 
( 
FileType 
) 
{ 
case 
$str )
:) *
int 
n 
; 
foreach 
( 
var  
line! %
in& (
File) -
.- .
ReadAllLines. :
(: ;
filePath; C
)C D
)D E
{ 
if 
( 
line  
.  !
Trim! %
(% &
)& '
.' (
Length( .
!=/ 1
$num2 3
&&4 6
!7 8
int8 ;
.; <
TryParse< D
(D E
lineE I
.I J
TrimJ N
(N O
)O P
,P Q
outR U
nV W
)W X
)X Y
{ 
isValid #
=$ %
false& +
;+ ,
break !
;! "
} 
} 
break 
; 
}   
return!! 
isValid!! 
;!! 
}"" 	
}$$ 
}%% �
AE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Models\UserProfileVM.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Models 
{ 
public 

class 

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
public
int
Type
{
get
;
set
;
}
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
	IsUsesApi 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ApiKey 
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
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
CompanyLogo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ReportTemplate $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 


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
[
assembly
:

AssemblyTrademark
(
$str
)
]
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
]"") *��
DE:\NET_PROJECTS\ADSDataDirect\WFP.ICT.Web\Reports\TrackingReports.cs
	namespace 	
WFP
 
.
ICT 
. 
Web 
. 
Reports 
{ 
public 

static 
class 
TrackingReports '
{ 
public 
static 
void 
GenerateTemplate1 ,
(, -
CampaignTrackingVm- ?
model@ E
,E F
stringG M
templateFileN Z
,Z [
string\ b
logoFilePathc o
,o p
stringq w

,
� �
string
� �

outputFile
� �
)
� �
{ 	
File 
. 
Copy 
( 
templateFile "
," #

outputFile$ .
,. /
true0 4
)4 5
;5 6
byte 
[ 
] 
	byteArray 
= 
File #
.# $
ReadAllBytes$ 0
(0 1

outputFile1 ;
); <
;< =
using 
( 
MemoryStream 
stream  &
=' (
new) ,
MemoryStream- 9
(9 :
): ;
); <
{ 
stream 
. 
Write 
( 
	byteArray &
,& '
$num( )
,) *
	byteArray+ 4
.4 5
Length5 ;
); <
;< =
using 
( 
SpreadsheetDocument *
spreadSheet+ 6
=7 8
SpreadsheetDocument9 L
.L M
OpenM Q
(Q R
streamR X
,X Y
trueZ ^
)^ _
)_ `
{ 
IEnumerable   
<    
Sheet    %
>  % &
sheets  ' -
=  . /
spreadSheet  0 ;
.  ; <
WorkbookPart  < H
.  H I
Workbook  I Q
.!! 

<!!& '
Sheets!!' -
>!!- .
(!!. /
)!!/ 0
.!!0 1
Elements!!1 9
<!!9 :
Sheet!!: ?
>!!? @
(!!@ A
)!!A B
."" 
Where"" 
("" 
s""  
=>""! #
s""$ %
.""% &
Name""& *
==""+ -
$str"". >
)""> ?
.## 
ToArray##  
(##  !
)##! "
;##" #
if%% 
(%% 
!%% 
sheets%% 
.%%  
Any%%  #
(%%# $
)%%$ %
)%%% &
{&& 
throw'' 
new'' !
AdsException''" .
(''. /
$str''/ :
)'': ;
;''; <
}(( 
string** 
relationshipId** )
=*** +
sheets**, 2
.**2 3
First**3 8
(**8 9
)**9 :
.**: ;
Id**; =
.**= >
Value**> C
;**C D


=++0 1
(++2 3

)++@ A
spreadSheet++B M
.++M N
WorkbookPart++N Z
.++Z [
GetPartById++[ f
(++f g
relationshipId++g u
)++u v
;++v w
AddImage// 
(// 

,//* +
logoFilePath//, 8
,//8 9
$num//: ;
,//; <
$num//= >
)//> ?
;//? @
AddImage00 
(00 

,00* +
logoFilePath00, 8
,008 9
$num00: <
,00< =
$num00> ?
)00? @
;00@ A
Cell22 
cell22 
=22 
GetCell22  '
(22' (

.225 6
	Worksheet226 ?
,22? @
$str22A D
,22D E
$num22F G
)22G H
;22H I
cell33 
.33 
	CellValue33 "
=33# $
new33% (
	CellValue33) 2
(332 3
model333 8
.338 9
OrderNumber339 D
)33D E
;33E F
cell44 
.44 
DataType44 !
=44" #
new44$ '
	EnumValue44( 1
<441 2

CellValues442 <
>44< =
(44= >

CellValues44> H
.44H I
String44I O
)44O P
;44P Q
cell66 
=66 
GetCell66 "
(66" #

.660 1
	Worksheet661 :
,66: ;
$str66< ?
,66? @
$num66A B
)66B C
;66C D
cell77 
.77 
	CellValue77 "
=77# $
new77% (
	CellValue77) 2
(772 3
model773 8
.778 9
	StartDate779 B
)77B C
;77C D
cell88 
.88 
DataType88 !
=88" #
new88$ '
	EnumValue88( 1
<881 2

CellValues882 <
>88< =
(88= >

CellValues88> H
.88H I
String88I O
)88O P
;88P Q
cell:: 
=:: 
GetCell:: "
(::" #

.::0 1
	Worksheet::1 :
,::: ;
$str::< ?
,::? @
$num::A C
)::C D
;::D E
cell;; 
.;; 
	CellValue;; "
=;;# $
new;;% (
	CellValue;;) 2
(;;2 3
DateTime;;3 ;
.;;; <
Now;;< ?
.;;? @
ToString;;@ H
(;;H I
StringConstants;;I X
.;;X Y
DateFormatSlashes;;Y j
);;j k
);;k l
;;;l m
cell<< 
.<< 
DataType<< !
=<<" #
new<<$ '
	EnumValue<<( 1
<<<1 2

CellValues<<2 <
><<< =
(<<= >

CellValues<<> H
.<<H I
String<<I O
)<<O P
;<<P Q
cell>> 
=>> 
GetCell>> "
(>>" #

.>>0 1
	Worksheet>>1 :
,>>: ;
$str>>< ?
,>>? @
$num>>A B
)>>B C
;>>C D
cell?? 
.?? 
	CellValue?? "
=??# $
new??% (
	CellValue??) 2
(??2 3
model??3 8
.??8 9
CampaignName??9 E
)??E F
;??F G
cell@@ 
.@@ 
DataType@@ !
=@@" #
new@@$ '
	EnumValue@@( 1
<@@1 2

CellValues@@2 <
>@@< =
(@@= >

CellValues@@> H
.@@H I
String@@I O
)@@O P
;@@P Q
cellCC 
=CC 
GetCellCC "
(CC" #

.CC0 1
	WorksheetCC1 :
,CC: ;
$strCC< ?
,CC? @
$numCCA C
)CCC D
;CCD E
cellDD 
.DD 
	CellValueDD "
=DD# $
newDD% (
	CellValueDD) 2
(DD2 3
modelDD3 8
.DD8 9
OpenedPercentageDD9 I
)DDI J
;DDJ K
cellEE 
.EE 
DataTypeEE !
=EE" #
newEE$ '
	EnumValueEE( 1
<EE1 2

CellValuesEE2 <
>EE< =
(EE= >

CellValuesEE> H
.EEH I
StringEEI O
)EEO P
;EEP Q
cellGG 
=GG 
GetCellGG "
(GG" #

.GG0 1
	WorksheetGG1 :
,GG: ;
$strGG< ?
,GG? @
$numGGA C
)GGC D
;GGD E
cellHH 
.HH 
	CellValueHH "
=HH# $
newHH% (
	CellValueHH) 2
(HH2 3
modelHH3 8
.HH8 9
QuantityHH9 A
)HHA B
;HHB C
cellII 
.II 
DataTypeII !
=II" #
newII$ '
	EnumValueII( 1
<II1 2

CellValuesII2 <
>II< =
(II= >

CellValuesII> H
.IIH I
StringIII O
)IIO P
;IIP Q
cellKK 
=KK 
GetCellKK "
(KK" #

.KK0 1
	WorksheetKK1 :
,KK: ;
$strKK< ?
,KK? @
$numKKA C
)KKC D
;KKD E
cellLL 
.LL 
	CellValueLL "
=LL# $
newLL% (
	CellValueLL) 2
(LL2 3
modelLL3 8
.LL8 9
OpenedLL9 ?
)LL? @
;LL@ A
cellMM 
.MM 
DataTypeMM !
=MM" #
newMM$ '
	EnumValueMM( 1
<MM1 2

CellValuesMM2 <
>MM< =
(MM= >

CellValuesMM> H
.MMH I
StringMMI O
)MMO P
;MMP Q
cellPP 
=PP 
GetCellPP "
(PP" #

.PP0 1
	WorksheetPP1 :
,PP: ;
$strPP< ?
,PP? @
$numPPA C
)PPC D
;PPD E
cellQQ 
.QQ 
	CellValueQQ "
=QQ# $
newQQ% (
	CellValueQQ) 2
(QQ2 3
modelQQ3 8
.QQ8 9
OpenedPercentageQQ9 I
)QQI J
;QQJ K
cellRR 
.RR 
DataTypeRR !
=RR" #
newRR$ '
	EnumValueRR( 1
<RR1 2

CellValuesRR2 <
>RR< =
(RR= >

CellValuesRR> H
.RRH I
StringRRI O
)RRO P
;RRP Q
cellTT 
=TT 
GetCellTT "
(TT" #

.TT0 1
	WorksheetTT1 :
,TT: ;
$strTT< ?
,TT? @
$numTTA C
)TTC D
;TTD E
cellUU 
.UU 
	CellValueUU "
=UU# $
newUU% (
	CellValueUU) 2
(UU2 3
modelUU3 8
.UU8 9
OpenedUU9 ?
)UU? @
;UU@ A
cellVV 
.VV 
DataTypeVV !
=VV" #
newVV$ '
	EnumValueVV( 1
<VV1 2

CellValuesVV2 <
>VV< =
(VV= >

CellValuesVV> H
.VVH I
StringVVI O
)VVO P
;VVP Q
cellYY 
=YY 
GetCellYY "
(YY" #

.YY0 1
	WorksheetYY1 :
,YY: ;
$strYY< ?
,YY? @
$numYYA C
)YYC D
;YYD E
cellZZ 
.ZZ 
	CellValueZZ "
=ZZ# $
newZZ% (
	CellValueZZ) 2
(ZZ2 3
modelZZ3 8
.ZZ8 9
ClickedZZ9 @
)ZZ@ A
;ZZA B
cell[[ 
.[[ 
DataType[[ !
=[[" #
new[[$ '
	EnumValue[[( 1
<[[1 2

CellValues[[2 <
>[[< =
([[= >

CellValues[[> H
.[[H I
String[[I O
)[[O P
;[[P Q
cell]] 
=]] 
GetCell]] "
(]]" #

.]]0 1
	Worksheet]]1 :
,]]: ;
$str]]< ?
,]]? @
$num]]A C
)]]C D
;]]D E
cell^^ 
.^^ 
	CellValue^^ "
=^^# $
new^^% (
	CellValue^^) 2
(^^2 3
model^^3 8
.^^8 9
ClickedPercentage^^9 J
)^^J K
;^^K L
cell__ 
.__ 
DataType__ !
=__" #
new__$ '
	EnumValue__( 1
<__1 2

CellValues__2 <
>__< =
(__= >

CellValues__> H
.__H I
String__I O
)__O P
;__P Q
cellaa 
=aa 
GetCellaa "
(aa" #

.aa0 1
	Worksheetaa1 :
,aa: ;
$straa< ?
,aa? @
$numaaA C
)aaC D
;aaD E
cellbb 
.bb 
	CellValuebb "
=bb# $
newbb% (
	CellValuebb) 2
(bb2 3
modelbb3 8
.bb8 9!
ClickToOpenPercentagebb9 N
)bbN O
;bbO P
cellcc 
.cc 
DataTypecc !
=cc" #
newcc$ '
	EnumValuecc( 1
<cc1 2

CellValuescc2 <
>cc< =
(cc= >

CellValuescc> H
.ccH I
StringccI O
)ccO P
;ccP Q
cellff 
=ff 
GetCellff "
(ff" #

.ff0 1
	Worksheetff1 :
,ff: ;
$strff< ?
,ff? @
$numffA C
)ffC D
;ffD E
cellgg 
.gg 
	CellValuegg "
=gg# $
newgg% (
	CellValuegg) 2
(gg2 3
modelgg3 8
.gg8 9
Bouncegg9 ?
)gg? @
;gg@ A
cellhh 
.hh 
DataTypehh !
=hh" #
newhh$ '
	EnumValuehh( 1
<hh1 2

CellValueshh2 <
>hh< =
(hh= >

CellValueshh> H
.hhH I
StringhhI O
)hhO P
;hhP Q
celljj 
=jj 
GetCelljj "
(jj" #

.jj0 1
	Worksheetjj1 :
,jj: ;
$strjj< ?
,jj? @
$numjjA C
)jjC D
;jjD E
cellkk 
.kk 
	CellValuekk "
=kk# $
newkk% (
	CellValuekk) 2
(kk2 3
modelkk3 8
.kk8 9
Optkk9 <
)kk< =
;kk= >
cellll 
.ll 
DataTypell !
=ll" #
newll$ '
	EnumValuell( 1
<ll1 2

CellValuesll2 <
>ll< =
(ll= >

CellValuesll> H
.llH I
StringllI O
)llO P
;llP Q
celloo 
=oo 
GetCelloo "
(oo" #

.oo0 1
	Worksheetoo1 :
,oo: ;
$stroo< ?
,oo? @
$numooA C
)ooC D
;ooD E
cellpp 
.pp 
	CellValuepp "
=pp# $
newpp% (
	CellValuepp) 2
(pp2 3
modelpp3 8
.pp8 9
Desktoppp9 @
)pp@ A
;ppA B
cellqq 
.qq 
DataTypeqq !
=qq" #
newqq$ '
	EnumValueqq( 1
<qq1 2

CellValuesqq2 <
>qq< =
(qq= >

CellValuesqq> H
.qqH I
StringqqI O
)qqO P
;qqP Q
cellss 
=ss 
GetCellss "
(ss" #

.ss0 1
	Worksheetss1 :
,ss: ;
$strss< ?
,ss? @
$numssA C
)ssC D
;ssD E
celltt 
.tt 
	CellValuett "
=tt# $
newtt% (
	CellValuett) 2
(tt2 3
modeltt3 8
.tt8 9
Mobilett9 ?
)tt? @
;tt@ A
celluu 
.uu 
DataTypeuu !
=uu" #
newuu$ '
	EnumValueuu( 1
<uu1 2

CellValuesuu2 <
>uu< =
(uu= >

CellValuesuu> H
.uuH I
StringuuI O
)uuO P
;uuP Q
cellxx 
=xx 
GetCellxx "
(xx" #

.xx0 1
	Worksheetxx1 :
,xx: ;
$strxx< ?
,xx? @
$numxxA C
)xxC D
;xxD E
cellyy 
.yy 
	CellValueyy "
=yy# $
newyy% (
	CellValueyy) 2
(yy2 3
modelyy3 8
.yy8 9
SubjectLineyy9 D
)yyD E
;yyE F
cellzz 
.zz 
DataTypezz !
=zz" #
newzz$ '
	EnumValuezz( 1
<zz1 2

CellValueszz2 <
>zz< =
(zz= >

CellValueszz> H
.zzH I
StringzzI O
)zzO P
;zzP Q
cell|| 
=|| 
GetCell|| "
(||" #

.||0 1
	Worksheet||1 :
,||: ;
$str||< ?
,||? @
$num||A C
)||C D
;||D E
cell}} 
.}} 
	CellValue}} "
=}}# $
new}}% (
	CellValue}}) 2
(}}2 3
model}}3 8
.}}8 9
FromLine}}9 A
)}}A B
;}}B C
cell~~ 
.~~ 
DataType~~ !
=~~" #
new~~$ '
	EnumValue~~( 1
<~~1 2

CellValues~~2 <
>~~< =
(~~= >

CellValues~~> H
.~~H I
String~~I O
)~~O P
;~~P Q
if
�� 
(
�� 
File
�� 
.
�� 
Exists
�� #
(
��# $

��$ 1
)
��1 2
)
��2 3
AddImage
��  
(
��  !

��! .
,
��. /

��0 =
,
��= >
$num
��? A
,
��A B
$num
��C D
)
��D E
;
��E F
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
OrderNumber
��9 D
)
��D E
;
��E F
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
	StartDate
��9 B
)
��B C
;
��C D
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
DateTime
��3 ;
.
��; <
Now
��< ?
.
��? @
ToString
��@ H
(
��H I
StringConstants
��I X
.
��X Y
DateFormatSlashes
��Y j
)
��j k
)
��k l
;
��l m
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
uint
�� 
start
�� 
=
��  
$num
��! #
;
��# $
foreach
�� 
(
�� 
var
��  
vm
��! #
in
��$ &
model
��' ,
.
��, -
PerLink
��- 4
)
��4 5
{
�� "
PopulateRowTemplate1
�� ,
(
��, -

��- :
.
��: ;
	Worksheet
��; D
,
��D E
vm
��F H
,
��H I
start
��J O
)
��O P
;
��P Q
start
�� 
++
�� 
;
��  
}
�� 

�� !
.
��! "
	Worksheet
��" +
.
��+ ,
Save
��, 0
(
��0 1
)
��1 2
;
��2 3
spreadSheet
�� 
.
��  
Close
��  %
(
��% &
)
��& '
;
��' (
}
�� 
File
�� 
.
�� 

�� "
(
��" #

outputFile
��# -
,
��- .
stream
��/ 5
.
��5 6
ToArray
��6 =
(
��= >
)
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
GenerateTemplate2
�� ,
(
��, - 
CampaignTrackingVm
��- ?
model
��@ E
,
��E F
string
��G M
templateFile
��N Z
,
��Z [
string
��\ b
logoFilePath
��c o
,
��o p
string
��q w

,��� �
string��� �

outputFile��� �
)��� �
{
�� 	
File
�� 
.
�� 
Copy
�� 
(
�� 
templateFile
�� "
,
��" #

outputFile
��$ .
,
��. /
true
��0 4
)
��4 5
;
��5 6
byte
�� 
[
�� 
]
�� 
	byteArray
�� 
=
�� 
File
�� #
.
��# $
ReadAllBytes
��$ 0
(
��0 1

outputFile
��1 ;
)
��; <
;
��< =
using
�� 
(
�� 
MemoryStream
�� 
stream
��  &
=
��' (
new
��) ,
MemoryStream
��- 9
(
��9 :
)
��: ;
)
��; <
{
�� 
stream
�� 
.
�� 
Write
�� 
(
�� 
	byteArray
�� &
,
��& '
$num
��( )
,
��) *
	byteArray
��+ 4
.
��4 5
Length
��5 ;
)
��; <
;
��< =
using
�� 
(
�� !
SpreadsheetDocument
�� *
spreadSheet
��+ 6
=
��7 8!
SpreadsheetDocument
��9 L
.
��L M
Open
��M Q
(
��Q R
stream
��R X
,
��X Y
true
��Z ^
)
��^ _
)
��_ `
{
�� 
IEnumerable
�� 
<
��  
Sheet
��  %
>
��% &
sheets
��' -
=
��. /
spreadSheet
��0 ;
.
��; <
WorkbookPart
��< H
.
��H I
Workbook
��I Q
.
�� 

�� &
<
��& '
Sheets
��' -
>
��- .
(
��. /
)
��/ 0
.
��0 1
Elements
��1 9
<
��9 :
Sheet
��: ?
>
��? @
(
��@ A
)
��A B
.
�� 
Where
�� 
(
�� 
s
��  
=>
��! #
s
��$ %
.
��% &
Name
��& *
==
��+ -
$str
��. >
)
��> ?
.
�� 
ToArray
��  
(
��  !
)
��! "
;
��" #
if
�� 
(
�� 
!
�� 
sheets
�� 
.
��  
Any
��  #
(
��# $
)
��$ %
)
��% &
{
�� 
throw
�� 
new
�� !
AdsException
��" .
(
��. /
$str
��/ :
)
��: ;
;
��; <
}
�� 
string
�� 
relationshipId
�� )
=
��* +
sheets
��, 2
.
��2 3
First
��3 8
(
��8 9
)
��9 :
.
��: ;
Id
��; =
.
��= >
Value
��> C
;
��C D

�� !

��" /
=
��0 1
(
��2 3

��3 @
)
��@ A
spreadSheet
��A L
.
��L M
WorkbookPart
��M Y
.
��Y Z
GetPartById
��Z e
(
��e f
relationshipId
��f t
)
��t u
;
��u v
AddImage
�� 
(
�� 

�� *
,
��* +
logoFilePath
��, 8
,
��8 9
$num
��: ;
,
��; <
$num
��= >
)
��> ?
;
��? @
Cell
�� 
cell
�� 
=
�� 
GetCell
��  '
(
��' (

��( 5
.
��5 6
	Worksheet
��6 ?
,
��? @
$str
��A D
,
��D E
$num
��F G
)
��G H
;
��H I
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
	StartDate
��9 B
)
��B C
;
��C D
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A B
)
��B C
;
��C D
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
SubjectLine
��9 D
)
��D E
;
��E F
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
FromLine
��9 A
)
��A B
;
��B C
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9

WhiteLabel
��9 C
)
��C D
;
��D E
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
OrderNumber
��9 D
)
��D E
;
��E F
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
CampaignName
��9 E
)
��E F
;
��F G
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A B
)
��B C
;
��C D
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
Quantity
��9 A
)
��A B
;
��B C
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A B
)
��B C
;
��C D
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
OpenedPercentage
��9 I
)
��I J
;
��J K
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
ClickedPercentage
��9 J
)
��J K
;
��K L
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9#
UnsubToOpenPercentage
��9 N
)
��N O
;
��O P
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
Quantity
��9 A
)
��A B
;
��B C
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
OpenedPercentage
��9 I
)
��I J
;
��J K
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
Opened
��9 ?
)
��? @
;
��@ A
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
ClickedPercentage
��9 J
)
��J K
;
��K L
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
Clicked
��9 @
)
��@ A
;
��A B
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9#
ClickToOpenPercentage
��9 N
)
��N O
;
��O P
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
$str
��3 @
+
��A B
model
��C H
.
��H I
Forwards
��I Q
)
��Q R
;
��R S
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
UnsubPercentage
��9 H
)
��H I
;
��I J
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9
Unsub
��9 >
)
��> ?
;
��? @
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
cell
�� 
=
�� 
GetCell
�� "
(
��" #

��# 0
.
��0 1
	Worksheet
��1 :
,
��: ;
$str
��< ?
,
��? @
$num
��A C
)
��C D
;
��D E
cell
�� 
.
�� 
	CellValue
�� "
=
��# $
new
��% (
	CellValue
��) 2
(
��2 3
model
��3 8
.
��8 9#
UnsubToOpenPercentage
��9 N
)
��N O
;
��O P
cell
�� 
.
�� 
DataType
�� !
=
��" #
new
��$ '
	EnumValue
��( 1
<
��1 2

CellValues
��2 <
>
��< =
(
��= >

CellValues
��> H
.
��H I
String
��I O
)
��O P
;
��P Q
uint
�� 
start
�� 
=
��  
$num
��! #
;
��# $
foreach
�� 
(
�� 
var
��  
vm
��! #
in
��$ &
model
��' ,
.
��, -
PerLink
��- 4
)
��4 5
{
�� "
PopulateRowTemplate2
�� ,
(
��, -

��- :
.
��: ;
	Worksheet
��; D
,
��D E
vm
��F H
,
��H I
start
��J O
)
��O P
;
��P Q
start
�� 
++
�� 
;
��  
}
�� 

�� !
.
��! "
	Worksheet
��" +
.
��+ ,
Save
��, 0
(
��0 1
)
��1 2
;
��2 3
spreadSheet
�� 
.
��  
Close
��  %
(
��% &
)
��& '
;
��' (
}
�� 
File
�� 
.
�� 

�� "
(
��" #

outputFile
��# -
,
��- .
stream
��/ 5
.
��5 6
ToArray
��6 =
(
��= >
)
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� "
PopulateRowTemplate1
�� 0
(
��0 1
	Worksheet
��1 :
	worksheet
��; D
,
��D E&
CampaignTrackingDetailVm
��F ^
row
��_ b
,
��b c
uint
��d h
	rowNumber
��i r
)
��r s
{
�� 	
Cell
�� 
cell
�� 
=
�� 
GetCell
�� 
(
��  
	worksheet
��  )
,
��) *
$str
��+ .
,
��. /
	rowNumber
��0 9
)
��9 :
;
��: ;
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
Link
��/ 3
)
��3 4
;
��4 5
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /

ClickCount
��/ 9
)
��9 :
;
��: ;
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
UniqueCount
��/ :
)
��: ;
;
��; <
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
MobileCount
��/ :
)
��: ;
;
��; <
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
}
�� 	
private
�� 
static
�� 
void
�� "
PopulateRowTemplate2
�� 0
(
��0 1
	Worksheet
��1 :
	worksheet
��; D
,
��D E&
CampaignTrackingDetailVm
��F ^
row
��_ b
,
��b c
uint
��d h
	rowNumber
��i r
)
��r s
{
�� 	
Cell
�� 
cell
�� 
=
�� 
GetCell
�� 
(
��  
	worksheet
��  )
,
��) *
$str
��+ .
,
��. /
	rowNumber
��0 9
)
��9 :
;
��: ;
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /
Link
��/ 3
)
��3 4
;
��4 5
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
cell
�� 
=
�� 
GetCell
�� 
(
�� 
	worksheet
�� $
,
��$ %
$str
��& )
,
��) *
	rowNumber
��+ 4
)
��4 5
;
��5 6
cell
�� 
.
�� 
	CellValue
�� 
=
�� 
new
��  
	CellValue
��! *
(
��* +
row
��+ .
.
��. /

ClickCount
��/ 9
)
��9 :
;
��: ;
cell
�� 
.
�� 
DataType
�� 
=
�� 
new
�� 
	EnumValue
��  )
<
��) *

CellValues
��* 4
>
��4 5
(
��5 6

CellValues
��6 @
.
��@ A
String
��A G
)
��G H
;
��H I
}
�� 	
private
�� 
static
�� 
Cell
�� 
GetCell
�� #
(
��# $
	Worksheet
��$ -
	worksheet
��. 7
,
��7 8
string
��9 ?

columnName
��@ J
,
��J K
uint
��L P
rowIndex
��Q Y
)
��Y Z
{
�� 	
Row
�� 
row
�� 
=
�� 
GetRow
�� 
(
�� 
	worksheet
�� &
,
��& '
rowIndex
��( 0
)
��0 1
;
��1 2
if
�� 
(
�� 
row
�� 
!=
�� 
null
�� 
)
�� 
return
�� 
row
�� 
.
�� 
Elements
�� #
<
��# $
Cell
��$ (
>
��( )
(
��) *
)
��* +
.
��+ ,
FirstOrDefault
��, :
(
��: ;
c
��; <
=>
��= ?
string
��@ F
.
��F G
Compare
��G N
(
��N O
c
��O P
.
��P Q

��Q ^
.
��^ _
Value
��_ d
,
��d e

columnName
��f p
+
��q r
rowIndex
��s {
,
��{ |
true��} �
)��� �
==��� �
$num��� �
)��� �
;��� �
var
�� 
firstRow
�� 
=
�� 
GetRow
�� !
(
��! "
	worksheet
��" +
,
��+ ,
$num
��- /
)
��/ 0
;
��0 1
var
�� 
lastRow
�� 
=
�� 
GetRow
��  
(
��  !
	worksheet
��! *
,
��* +
$num
��, .
)
��. /
;
��/ 0
var
�� 
newRow
�� 
=
�� 
	InsertRow
�� "
(
��" #
rowIndex
��# +
,
��+ ,
	worksheet
��- 6
.
��6 7

��7 D
,
��D E
null
��F J
,
��J K
true
��L P
)
��P Q
;
��Q R
return
�� 
newRow
�� 
.
�� 
Elements
�� "
<
��" #
Cell
��# '
>
��' (
(
��( )
)
��) *
.
��* +
FirstOrDefault
��+ 9
(
��9 :
c
��: ;
=>
��< >
string
��? E
.
��E F
Compare
��F M
(
��M N
c
��N O
.
��O P

��P ]
.
��] ^
Value
��^ c
,
��c d

columnName
��e o
+
��p q
rowIndex
��r z
,
��z {
true��| �
)��� �
==��� �
$num��� �
)��� �
;��� �
}
�� 	
private
�� 
static
�� 
Row
�� 
	CreateRow
�� $
(
��$ %
Row
��% (
firstRow
��) 1
,
��1 2
Row
��3 6
lastRow
��7 >
,
��> ?
uint
��@ D
newRowIndex
��E P
,
��P Q
	SheetData
��R [
	sheetData
��\ e
)
��e f
{
�� 	
var
�� 
newRow
�� 
=
�� 
(
�� 
Row
�� 
)
�� 
firstRow
�� &
.
��& '
	CloneNode
��' 0
(
��0 1
true
��1 5
)
��5 6
;
��6 7
foreach
�� 
(
�� 
Cell
�� 
cell
�� 
in
�� !
newRow
��" (
.
��( )
Elements
��) 1
<
��1 2
Cell
��2 6
>
��6 7
(
��7 8
)
��8 9
)
��9 :
{
�� 
string
�� 

�� $
=
��% &
cell
��' +
.
��+ ,

��, 9
.
��9 :
Value
��: ?
;
��? @
cell
�� 
.
�� 

�� "
=
��# $
new
��% (
StringValue
��) 4
(
��4 5

��5 B
.
��B C
Replace
��C J
(
��J K
firstRow
��K S
.
��S T
RowIndex
��T \
.
��\ ]
Value
��] b
.
��b c
ToString
��c k
(
��k l
)
��l m
,
��m n
newRowIndex
��o z
.
��z {
ToString��{ �
(��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
newRow
�� 
.
�� 
RowIndex
�� 
=
�� 
new
�� !
UInt32Value
��" -
(
��- .
newRowIndex
��. 9
)
��9 :
;
��: ;
	sheetData
�� 
.
�� 
InsertAfter
�� !
(
��! "
newRow
��" (
,
��( )
lastRow
��* 1
)
��1 2
;
��2 3
return
�� 
newRow
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
Row
�� 
GetRow
�� !
(
��! "
	Worksheet
��" +
	worksheet
��, 5
,
��5 6
uint
��7 ;
rowIndex
��< D
)
��D E
{
�� 	
return
�� 
	worksheet
�� 
.
�� 

�� *
<
��* +
	SheetData
��+ 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
Elements
��8 @
<
��@ A
Row
��A D
>
��D E
(
��E F
)
��F G
.
��G H
FirstOrDefault
��H V
(
��V W
r
��W X
=>
��Y [
r
��\ ]
.
��] ^
RowIndex
��^ f
==
��g i
rowIndex
��j r
)
��r s
;
��s t
}
�� 	
public
�� 
static
�� 
Row
�� 
	InsertRow
�� #
(
��# $
uint
��$ (
rowIndex
��) 1
,
��1 2

��3 @

��A N
,
��N O
Row
��P S
	insertRow
��T ]
,
��] ^
bool
��_ c
isNewLastRow
��d p
=
��q r
false
��s x
)
��x y
{
�� 	
	Worksheet
�� 
	worksheet
�� 
=
��  !

��" /
.
��/ 0
	Worksheet
��0 9
;
��9 :
	SheetData
�� 
	sheetData
�� 
=
��  !
	worksheet
��" +
.
��+ ,

��, 9
<
��9 :
	SheetData
��: C
>
��C D
(
��D E
)
��E F
;
��F G
Row
�� 
retRow
�� 
=
�� 
!
�� 
isNewLastRow
�� &
?
��' (
	sheetData
��) 2
.
��2 3
Elements
��3 ;
<
��; <
Row
��< ?
>
��? @
(
��@ A
)
��A B
.
��B C
FirstOrDefault
��C Q
(
��Q R
r
��R S
=>
��T V
r
��W X
.
��X Y
RowIndex
��Y a
==
��b d
rowIndex
��e m
)
��m n
:
��o p
null
��q u
;
��u v
if
�� 
(
�� 
retRow
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� 
	insertRow
�� 
!=
��  
null
��! %
)
��% &
{
�� 
UpdateRowIndexes
�� $
(
��$ %

��% 2
,
��2 3
rowIndex
��4 <
,
��< =
false
��> C
)
��C D
;
��D E(
UpdateMergedCellReferences
�� .
(
��. /

��/ <
,
��< =
rowIndex
��> F
,
��F G
false
��H M
)
��M N
;
��N O'
UpdateHyperlinkReferences
�� -
(
��- .

��. ;
,
��; <
rowIndex
��= E
,
��E F
false
��G L
)
��L M
;
��M N
retRow
�� 
=
�� 
	sheetData
�� &
.
��& '
InsertBefore
��' 3
(
��3 4
	insertRow
��4 =
,
��= >
retRow
��? E
)
��E F
;
��F G
string
�� 
curIndex
�� #
=
��$ %
retRow
��& ,
.
��, -
RowIndex
��- 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
;
��@ A
string
�� 
newIndex
�� #
=
��$ %
rowIndex
��& .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
;
��9 :
foreach
�� 
(
�� 
Cell
�� !
cell
��" &
in
��' )
retRow
��* 0
.
��0 1
Elements
��1 9
<
��9 :
Cell
��: >
>
��> ?
(
��? @
)
��@ A
)
��A B
{
�� 
cell
�� 
.
�� 

�� *
=
��+ ,
new
��- 0
StringValue
��1 <
(
��< =
cell
��= A
.
��A B

��B O
.
��O P
Value
��P U
.
��U V
Replace
��V ]
(
��] ^
curIndex
��^ f
,
��f g
newIndex
��h p
)
��p q
)
��q r
;
��r s
}
�� 
retRow
�� 
.
�� 
RowIndex
�� #
=
��$ %
rowIndex
��& .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
Row
�� 
refRow
�� 
=
�� 
!
�� 
isNewLastRow
�� *
?
��+ ,
	sheetData
��- 6
.
��6 7
Elements
��7 ?
<
��? @
Row
��@ C
>
��C D
(
��D E
)
��E F
.
��F G
FirstOrDefault
��G U
(
��U V
row
��V Y
=>
��Z \
row
��] `
.
��` a
RowIndex
��a i
>
��j k
rowIndex
��l t
)
��t u
:
��v w
null
��x |
;
��| }
retRow
�� 
=
�� 
	insertRow
�� "
??
��# %
new
��& )
Row
��* -
(
��- .
)
��. /
{
��0 1
RowIndex
��2 :
=
��; <
rowIndex
��= E
}
��F G
;
��G H
IEnumerable
�� 
<
�� 
Cell
��  
>
��  !

cellsInRow
��" ,
=
��- .
retRow
��/ 5
.
��5 6
Elements
��6 >
<
��> ?
Cell
��? C
>
��C D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 

cellsInRow
�� 
.
�� 
Any
�� "
(
��" #
)
��# $
)
��$ %
{
�� 
string
�� 
curIndex
�� #
=
��$ %
retRow
��& ,
.
��, -
RowIndex
��- 5
.
��5 6
ToString
��6 >
(
��> ?
)
��? @
;
��@ A
string
�� 
newIndex
�� #
=
��$ %
rowIndex
��& .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
;
��9 :
foreach
�� 
(
�� 
Cell
�� !
cell
��" &
in
��' )

cellsInRow
��* 4
)
��4 5
{
�� 
cell
�� 
.
�� 

�� *
=
��+ ,
new
��- 0
StringValue
��1 <
(
��< =
cell
��= A
.
��A B

��B O
.
��O P
Value
��P U
.
��U V
Replace
��V ]
(
��] ^
curIndex
��^ f
,
��f g
newIndex
��h p
)
��p q
)
��q r
;
��r s
}
�� 
retRow
�� 
.
�� 
RowIndex
�� #
=
��$ %
rowIndex
��& .
;
��. /
}
�� 
	sheetData
�� 
.
�� 
InsertBefore
�� &
(
��& '
retRow
��' -
,
��- .
refRow
��/ 5
)
��5 6
;
��6 7
}
�� 
return
�� 
retRow
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
UpdateRowIndexes
�� ,
(
��, -

��- :

��; H
,
��H I
uint
��J N
rowIndex
��O W
,
��W X
bool
��Y ]
isDeletedRow
��^ j
)
��j k
{
�� 	
IEnumerable
�� 
<
�� 
Row
�� 
>
�� 
rows
�� !
=
��" #

��$ 1
.
��1 2
	Worksheet
��2 ;
.
��; <
Descendants
��< G
<
��G H
Row
��H K
>
��K L
(
��L M
)
��M N
.
��N O
Where
��O T
(
��T U
r
��U V
=>
��W Y
r
��Z [
.
��[ \
RowIndex
��\ d
.
��d e
Value
��e j
>=
��k m
rowIndex
��n v
)
��v w
;
��w x
foreach
�� 
(
�� 
Row
�� 
row
�� 
in
�� 
rows
��  $
)
��$ %
{
�� 
uint
�� 
newIndex
�� 
=
�� 
(
��  !
isDeletedRow
��! -
?
��. /
row
��0 3
.
��3 4
RowIndex
��4 <
-
��= >
$num
��? @
:
��A B
row
��C F
.
��F G
RowIndex
��G O
+
��P Q
$num
��R S
)
��S T
;
��T U
string
�� 
curRowIndex
�� "
=
��# $
row
��% (
.
��( )
RowIndex
��) 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
;
��< =
string
�� 
newRowIndex
�� "
=
��# $
newIndex
��% -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
;
��8 9
foreach
�� 
(
�� 
Cell
�� 
cell
�� "
in
��# %
row
��& )
.
��) *
Elements
��* 2
<
��2 3
Cell
��3 7
>
��7 8
(
��8 9
)
��9 :
)
��: ;
{
�� 
cell
�� 
.
�� 

�� &
=
��' (
new
��) ,
StringValue
��- 8
(
��8 9
cell
��9 =
.
��= >

��> K
.
��K L
Value
��L Q
.
��Q R
Replace
��R Y
(
��Y Z
curRowIndex
��Z e
,
��e f
newRowIndex
��g r
)
��r s
)
��s t
;
��t u
}
�� 
row
�� 
.
�� 
RowIndex
�� 
=
�� 
newIndex
�� '
;
��' (
}
�� 
}
�� 	
private
�� 
static
�� 
void
�� (
UpdateMergedCellReferences
�� 6
(
��6 7

��7 D

��E R
,
��R S
uint
��T X
rowIndex
��Y a
,
��a b
bool
��c g
isDeletedRow
��h t
)
��t u
{
�� 	
if
�� 
(
�� 

�� 
.
�� 
	Worksheet
�� '
.
��' (
Elements
��( 0
<
��0 1

MergeCells
��1 ;
>
��; <
(
��< =
)
��= >
.
��> ?
Count
��? D
(
��D E
)
��E F
>
��G H
$num
��I J
)
��J K
{
�� 

MergeCells
�� 

mergeCells
�� %
=
��& '

��( 5
.
��5 6
	Worksheet
��6 ?
.
��? @
Elements
��@ H
<
��H I

MergeCells
��I S
>
��S T
(
��T U
)
��U V
.
��V W
FirstOrDefault
��W e
(
��e f
)
��f g
;
��g h
if
�� 
(
�� 

mergeCells
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
List
�� 
<
�� 
	MergeCell
�� "
>
��" #
mergeCellsList
��$ 2
=
��3 4

mergeCells
��5 ?
.
��? @
Elements
��@ H
<
��H I
	MergeCell
��I R
>
��R S
(
��S T
)
��T U
.
��U V
Where
��V [
(
��[ \
r
��\ ]
=>
��^ `
r
��a b
.
��b c
	Reference
��c l
.
��l m
HasValue
��m u
)
��u v
.
��U V
Where
��V [
(
��[ \
r
��\ ]
=>
��^ `
GetRowIndex
��a l
(
��l m
r
��m n
.
��n o
	Reference
��o x
.
��x y
Value
��y ~
.
��~ 
Split�� �
(��� �
$char��� �
)��� �
.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
>=��� �
rowIndex��� �
||��� �
GetRowIndex
��a l
(
��l m
r
��m n
.
��n o
	Reference
��o x
.
��x y
Value
��y ~
.
��~ 
Split�� �
(��� �
$char��� �
)��� �
.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
>=��� �
rowIndex��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
isDeletedRow
�� $
)
��$ %
{
�� 
List
�� 
<
�� 
	MergeCell
�� &
>
��& ' 
mergeCellsToDelete
��( :
=
��; <
mergeCellsList
��= K
.
��K L
Where
��L Q
(
��Q R
r
��R S
=>
��T V
GetRowIndex
��W b
(
��b c
r
��c d
.
��d e
	Reference
��e n
.
��n o
Value
��o t
.
��t u
Split
��u z
(
��z {
$char
��{ ~
)
��~ 
.�� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
==��� �
rowIndex��� �
||��� �
GetRowIndex
��W b
(
��b c
r
��c d
.
��d e
	Reference
��e n
.
��n o
Value
��o t
.
��t u
Split
��u z
(
��z {
$char
��{ ~
)
��~ 
.�� �
	ElementAt��� �
(��� �
$num��� �
)��� �
)��� �
==��� �
rowIndex��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
foreach
�� 
(
��  !
	MergeCell
��! *
cellToDelete
��+ 7
in
��8 : 
mergeCellsToDelete
��; M
)
��M N
{
�� 
cellToDelete
�� (
.
��( )
Remove
��) /
(
��/ 0
)
��0 1
;
��1 2
}
�� 
mergeCellsList
�� &
=
��' (

mergeCells
��) 3
.
��3 4
Elements
��4 <
<
��< =
	MergeCell
��= F
>
��F G
(
��G H
)
��H I
.
��I J
Where
��J O
(
��O P
r
��P Q
=>
��R T
r
��U V
.
��V W
	Reference
��W `
.
��` a
HasValue
��a i
)
��i j
.
��I J
Where
��J O
(
��O P
r
��P Q
=>
��R T
GetRowIndex
��U `
(
��` a
r
��a b
.
��b c
	Reference
��c l
.
��l m
Value
��m r
.
��r s
Split
��s x
(
��x y
$char
��y |
)
��| }
.
��} ~
	ElementAt��~ �
(��� �
$num��� �
)��� �
)��� �
>��� �
rowIndex��� �
||��� �
GetRowIndex
��U `
(
��` a
r
��a b
.
��b c
	Reference
��c l
.
��l m
Value
��m r
.
��r s
Split
��s x
(
��x y
$char
��y |
)
��| }
.
��} ~
	ElementAt��~ �
(��� �
$num��� �
)��� �
)��� �
>��� �
rowIndex��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
foreach
�� 
(
�� 
	MergeCell
�� &
	mergeCell
��' 0
in
��1 3
mergeCellsList
��4 B
)
��B C
{
�� 
string
�� 
[
�� 
]
��  

��! .
=
��/ 0
	mergeCell
��1 :
.
��: ;
	Reference
��; D
.
��D E
Value
��E J
.
��J K
Split
��K P
(
��P Q
$char
��Q T
)
��T U
;
��U V
if
�� 
(
�� 
GetRowIndex
�� '
(
��' (

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
�� 
string
�� "

columnName
��# -
=
��. /

��0 =
(
��= >

��> K
.
��K L
	ElementAt
��L U
(
��U V
$num
��V W
)
��W X
)
��X Y
;
��Y Z

�� )
[
��) *
$num
��* +
]
��+ ,
=
��- .
isDeletedRow
��/ ;
?
��< =

columnName
��> H
+
��I J
(
��K L
GetRowIndex
��L W
(
��W X

��X e
.
��e f
	ElementAt
��f o
(
��o p
$num
��p q
)
��q r
)
��r s
-
��t u
$num
��v w
)
��w x
.
��x y
ToString��y �
(��� �
)��� �
:��� �&
IncrementCellReference��� �
(��� �

.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
,��� �%
CellReferencePartEnum��� �
.��� �
Row��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
GetRowIndex
�� '
(
��' (

��( 5
.
��5 6
	ElementAt
��6 ?
(
��? @
$num
��@ A
)
��A B
)
��B C
>=
��D F
rowIndex
��G O
)
��O P
{
�� 
string
�� "

columnName
��# -
=
��. /

��0 =
(
��= >

��> K
.
��K L
	ElementAt
��L U
(
��U V
$num
��V W
)
��W X
)
��X Y
;
��Y Z

�� )
[
��) *
$num
��* +
]
��+ ,
=
��- .
isDeletedRow
��/ ;
?
��< =

columnName
��> H
+
��I J
(
��K L
GetRowIndex
��L W
(
��W X

��X e
.
��e f
	ElementAt
��f o
(
��o p
$num
��p q
)
��q r
)
��r s
-
��t u
$num
��v w
)
��w x
.
��x y
ToString��y �
(��� �
)��� �
:��� �&
IncrementCellReference��� �
(��� �

.��� �
	ElementAt��� �
(��� �
$num��� �
)��� �
,��� �%
CellReferencePartEnum��� �
.��� �
Row��� �
)��� �
;��� �
}
�� 
	mergeCell
�� !
.
��! "
	Reference
��" +
=
��, -
new
��. 1
StringValue
��2 =
(
��= >

��> K
[
��K L
$num
��L M
]
��M N
+
��O P
$str
��Q T
+
��U V

��W d
[
��d e
$num
��e f
]
��f g
)
��g h
;
��h i
}
�� 
}
�� 
}
�� 
}
(