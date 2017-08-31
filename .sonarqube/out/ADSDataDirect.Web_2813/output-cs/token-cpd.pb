�
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Hangfire\HangfireBootstrapper .cs
	namespace 	

 
. 
Web 
. 
Hangfire $
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
NE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Hangfire\ApplicationPreload.cs
	namespace 	

 
. 
Web 
. 
Hangfire $
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
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\BundleConfig.cs
	namespace 	

 
. 
Web 
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
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\FilterConfig.cs
	namespace 	

 
. 
Web 
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
KE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\IdentityConfig.cs
	namespace 	

 
. 
Web 
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
claimIdaaD K
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
claimIdgg !
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
}�� �
HE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\RouteConfig.cs
	namespace 	

 
. 
Web 
{ 
public 

class 
RouteConfig 
{ 
public 
static 
void 
RegisterRoutes )
() *
RouteCollection* 9
routes: @
)@ A
{		 	
routes

 
.

 
IgnoreRoute

 
(

 
$str

 ;
)

; <
;

< =
routes 
. 
MapRoute 
( 
name
:
$str
,
url 
: 
$str 1
,1 2
defaults 
: 
new 
{ 

controller  *
=+ ,
$str- 8
,8 9
action: @
=A B
$strC J
,J K
idL N
=O P
UrlParameterQ ]
.] ^
Optional^ f
}g h
) 
;
} 	
} 
} �
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\Startup.Auth.cs
	namespace		 	

 
.		 
Web		 
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
HE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\UnityConfig.cs
	namespace 	

 
. 
Web 
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

_container
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
return 

_container 
. 
Value #
;# $
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
NE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\UnityMvcActivator.cs
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
	namespace		 	

 
.		 
Web		 
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
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\App_Start\WebApiConfig.cs
	namespace 	

 
. 
Web 
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
} �X
PE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\CompanyController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
{
public 

class 
CompanyController "
:# $
BaseController% 3
{ 
private "
ApplicationUserManager &
_userManager' 3
;3 4
private "
ApplicationUserManager &
UserManager' 2
{ 	
get 
{ 
return 
_userManager #
??$ &
HttpContext' 2
.2 3
GetOwinContext3 A
(A B
)B C
.C D
GetUserManagerD R
<R S"
ApplicationUserManagerS i
>i j
(j k
)k l
;l m
} 
} 	
public 
ActionResult 
Users !
(! "
CampaignSearchVm" 2
sc3 5
)5 6
{ 	
var 
model 
= 
UserManager #
.# $
Users$ )
.) *
Select* 0
(0 1
x1 2
=>3 5
new 

( 
) 
{ 
Id   
=   
x   
.   
Id   
,   
UserName!! 
=!! 
x!! 
.!! 
UserName!! %
,!!% &
Email"" 
="" 
x"" 
."" 
Email"" 
,""  
DateCreated## 
=## 
x## 
.##  
	CreatedAt##  )
.##) *
ToString##* 2
(##2 3
)##3 4
,##4 5
Status$$ 
=$$ 
x$$ 
.$$ 
Status$$ !
,$$! "
Type%% 
=%% 
x%% 
.%% 
UserType%% !
,%%! "
	FirstName&& 
=&& 
x&& 
.&& 
	FirstName&& '
,&&' (
LastName'' 
='' 
x'' 
.'' 
LastName'' %
,''% &
CompanyName(( 
=(( 
x(( 
.((  
CompanyName((  +
,((+ ,
CompanyLogo)) 
=)) 
x)) 
.))  
CompanyLogo))  +
,))+ ,

WhiteLabel** 
=** 
x** 
.** 

WhiteLabel** )
,**) *
ReportTemplate++ 
=++  
x++! "
.++" #
ReportTemplate++# 1
,++1 2
IsTestsCreatives,,  
=,,! "
x,,# $
.,,$ %
IsTestsCreatives,,% 5
,,,5 6
	IsUsesApi-- 
=-- 
x-- 
.-- 
	IsUsesApi-- '
}.. 
)..
... 
ToList.. 
(.. 
).. 
;.. 
ViewBag00 
.00 

WhiteLabel00 
=00  

;00. /
int11 

pageNumber11 
=11 
(11 
sc11  
.11  !
Page11! %
??11& (
$num11) *
)11* +
;11+ ,
return22 
View22 
(22 
$str22 
,22  
model22! &
.22& '
ToPagedList22' 2
(222 3

pageNumber223 =
,22= >
PageSize22? G
)22G H
)22H I
;22I J
}33 	
public55 
ActionResult55 
ChangeWhiteLabel55 ,
(55, -
Guid55- 1
?551 2
userId553 9
,559 :
string55; A

whiteLabel55B L
)55L M
{66 	
try77 
{88 
var99 
user99 
=99 
UserManager99 &
.99& '
FindById99' /
(99/ 0
userId990 6
.996 7
ToString997 ?
(99? @
)99@ A
)99A B
;99B C
user:: 
.:: 

WhiteLabel:: 
=::  !

whiteLabel::" ,
;::, -
Db;; 
.;; 
SaveChanges;; 
(;; 
);;  
;;;  !
return<< 
Json<< 
(<< 
new<< 
JsonResponse<<  ,
(<<, -
)<<- .
{<</ 0
IsSucess<<1 9
=<<: ;
true<<< @
}<<A B
,<<B C
JsonRequestBehavior<<D W
.<<W X
AllowGet<<X `
)<<` a
;<<a b
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
return@@ 
Json@@ 
(@@ 
new@@ 
JsonResponse@@  ,
(@@, -
)@@- .
{@@/ 0
IsSucess@@1 9
=@@: ;
false@@< A
,@@A B
ErrorMessage@@C O
=@@P Q
ex@@R T
.@@T U
Message@@U \
}@@] ^
,@@^ _
JsonRequestBehavior@@` s
.@@s t
AllowGet@@t |
)@@| }
;@@} ~
}AA 
}BB 	
publicCC 
ActionResultCC 
SaveUserCC $
(CC$ %
CompanyUsersVmCC% 3
modelCC4 9
)CC9 :
{DD 	
tryEE 
{FF 
varGG 
userGG 
=GG 
UserManagerGG &
.GG& '
FindByIdGG' /
(GG/ 0
modelGG0 5
.GG5 6
IdGG6 8
.GG8 9
ToStringGG9 A
(GGA B
)GGB C
)GGC D
;GGD E
switchHH 
(HH 
modelHH 
.HH 
ActionHH $
)HH$ %
{II 
caseJJ 
$strJJ 
:JJ  
ifKK 
(KK 
userKK  
.KK  !
StatusKK! '
==KK( *
(KK+ ,
intKK, /
)KK/ 0

UserStatusKK0 :
.KK: ;
ActiveKK; A
)KKA B
{LL 
userMM  
.MM  !
StatusMM! '
=MM( )
(MM* +
intMM+ .
)MM. /

UserStatusMM/ 9
.MM9 :
LockedMM: @
;MM@ A
userNN  
.NN  !
LockoutEndDateUtcNN! 2
=NN3 4
newNN5 8
DateTimeNN9 A
(NNA B
$numNNB F
,NNF G
$numNNH J
,NNJ K
$numNNL N
)NNN O
;NNO P
boolOO  
aOO! "
=OO# $
UserManagerOO% 0
.OO0 1
IsLockedOutOO1 <
(OO< =
userOO= A
.OOA B
IdOOB D
)OOD E
;OOE F
}PP 
elseQQ 
ifQQ 
(QQ  !
userQQ! %
.QQ% &
StatusQQ& ,
==QQ- /
(QQ0 1
intQQ1 4
)QQ4 5

UserStatusQQ5 ?
.QQ? @
LockedQQ@ F
)QQF G
{RR 
userSS  
.SS  !
StatusSS! '
=SS( )
(SS* +
intSS+ .
)SS. /

UserStatusSS/ 9
.SS9 :
ActiveSS: @
;SS@ A
userTT  
.TT  !
LockoutEndDateUtcTT! 2
=TT3 4
nullTT5 9
;TT9 :
boolUU  
aUU! "
=UU# $
UserManagerUU% 0
.UU0 1
IsLockedOutUU1 <
(UU< =
userUU= A
.UUA B
IdUUB D
)UUD E
;UUE F
}VV 
breakWW 
;WW 
caseXX 
$strXX 
:XX  
switchYY 
(YY  
userYY  $
.YY$ %
UserTypeYY% -
)YY- .
{ZZ 
case[[  
([[! "
int[[" %
)[[% &
UserType[[& .
.[[. /
Admin[[/ 4
:[[4 5
user\\  $
.\\$ %
UserType\\% -
=\\. /
(\\0 1
int\\1 4
)\\4 5
UserType\\5 =
.\\= >
User\\> B
;\\B C
break]]  %
;]]% &
case^^  
(^^! "
int^^" %
)^^% &
UserType^^& .
.^^. /
User^^/ 3
:^^3 4
user__  $
.__$ %
UserType__% -
=__. /
(__0 1
int__1 4
)__4 5
UserType__5 =
.__= >
Admin__> C
;__C D
break``  %
;``% &
}aa 
breakbb 
;bb 
casecc 
$strcc  
:cc  !
userdd 
.dd 
IsTestsCreativesdd -
=dd. /
!dd0 1
userdd1 5
.dd5 6
IsTestsCreativesdd6 F
;ddF G
breakee 
;ee 
caseff 
$strff #
:ff# $
ifgg 
(gg 
!gg 
stringgg #
.gg# $

(gg1 2
modelgg2 7
.gg7 8
Passwordgg8 @
)gg@ A
)ggA B
{hh 
stringii "

resetTokenii# -
=ii. /
UserManagerii0 ;
.ii; <&
GeneratePasswordResetTokenii< V
(iiV W
useriiW [
.ii[ \
Idii\ ^
)ii^ _
;ii_ `
IdentityResultjj * 
passwordChangeResultjj+ ?
=jj@ A
UserManagerjjB M
.jjM N

(jj[ \
userjj\ `
.jj` a
Idjja c
,jjc d

resetTokenjje o
,jjo p
modeljjq v
.jjv w
Passwordjjw 
)	jj �
;
jj� �
ifkk 
(kk   
passwordChangeResultkk  4
!=kk5 7
IdentityResultkk8 F
.kkF G
SuccesskkG N
)kkN O
{ll 
throwmm  %
newmm& )
AdsExceptionmm* 6
(mm6 7 
passwordChangeResultmm7 K
.mmK L
ErrorsmmL R
.mmR S
FirstOrDefaultmmS a
(mma b
)mmb c
)mmc d
;mmd e
}nn 
}oo 
breakpp 
;pp 
caseqq 
$strqq !
:qq! "
UserManagerrr #
.rr# $
Deleterr$ *
(rr* +
userrr+ /
)rr/ 0
;rr0 1
breakss 
;ss 
}tt 
Dbuu 
.uu 
SaveChangesuu 
(uu 
)uu  
;uu  !
returnvv 
Jsonvv 
(vv 
newvv 
JsonResponsevv  ,
(vv, -
)vv- .
{vv/ 0
IsSucessvv1 9
=vv: ;
truevv< @
}vvA B
,vvB C
JsonRequestBehaviorvvD W
.vvW X
AllowGetvvX `
)vv` a
;vva b
}ww 
catchxx 
(xx 
	Exceptionxx 
exxx 
)xx  
{yy 
returnzz 
Jsonzz 
(zz 
newzz 
JsonResponsezz  ,
(zz, -
)zz- .
{zz/ 0
IsSucesszz1 9
=zz: ;
falsezz< A
,zzA B
ErrorMessagezzC O
=zzP Q
exzzR T
.zzT U
MessagezzU \
}zz] ^
,zz^ _
JsonRequestBehavior{{ '
.{{' (
AllowGet{{( 0
){{0 1
;{{1 2
}|| 
}}} 	
}
�� 
}�� �
ME:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\TestController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
{ 
public 

class 
TestController 
:  !
BaseController" 0
{		 
public

 
ActionResult

 
AddCustomers

 (
(

( )
)

) *
{ 	

Dictionary 
< 
string 
, 
string %
>% & 
whiteLabelDictionary' ;
=< =
new> A

DictionaryB L
<L M
stringM S
,S T
stringU [
>[ \
(\ ]
)] ^
{
{ 
$str 
, 
$str 2
}2 3
,3 4
{ 
$str 
, 
$str .
}. /
,/ 0
{ 
$str 
, 
$str 1
}1 2
,2 3
{ 
$str 
, 
$str =
}= >
,> ?
{ 
$str 
, 
$str :
}: ;
,; <
{ 
$str 
, 
$str =
}= >
,> ?
{ 
$str !
,! "
$str# B
}B C
,C D
{ 
$str 
, 
$str >
}> ?
,? @
{ 
$str 
, 
$str <
}< =
,= >
{ 
$str 
, 
$str :
}: ;
,; <
{ 
$str 
, 
$str ;
}; <
,< =
{ 
$str 
, 
$str 3
}3 4
,4 5
{ 
$str 
, 
$str 2
}2 3
} 
;
foreach 
( 
var 
dic 
in  
whiteLabelDictionary  4
)4 5
{ 
Db 
. 
	Customers 
. 
Add  
(  !
new! $
Customer% -
{   
Id!! 
=!! 
Guid!! 
.!! 
NewGuid!! %
(!!% &
)!!& '
,!!' (
	CreatedAt"" 
="" 
DateTime""  (
.""( )
Now"") ,
,"", -
Code## 
=## 
dic## 
.## 
Key## "
.##" #
Trim### '
(##' (
)##( )
,##) *
Name$$ 
=$$ 
dic$$ 
.$$ 
Key$$ "
.$$" #
Trim$$# '
($$' (
)$$( )
,$$) *
	WebDomain%% 
=%% 
dic%%  #
.%%# $
Value%%$ )
.%%) *
Trim%%* .
(%%. /
)%%/ 0
}&& 
)&& 
;&& 
}'' 
Db(( 
.(( 
SaveChanges(( 
((( 
)(( 
;(( 
return)) 
View)) 
()) 
$str)) !
)))! "
;))" #
}** 	
}++ 
},, �S
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\CustomerController.cs
	namespace		 	

 
.		 
Web		 
.		 
Controllers		 '
{

 
[ 
	Authorize 
] 
public 

class 
CustomerController #
:$ %
BaseController& 4
{
private 
const 
int 
PageSize "
=# $
$num% '
;' (
public 
ActionResult 
Index !
(! "
CampaignSearchVm" 2
sc3 5
)5 6
{ 	
var 
customer 
= 
Db 
. 
	Customers '
.' (
Select( .
(. /
x/ 0
=>1 3
new 

CustomerVm 
{ 
Id 
= 
x 
. 
Id 
. 
ToString "
(" #
)# $
,$ %
Code 
= 
x 
. 
Code 
, 
Name 
= 
x 
. 
Name 
, 
	WebDomain 
= 
x 
. 
	WebDomain '
,' (
Phone 
= 
x 
. 
Phone 
,  
Email 
= 
x 
. 
Email 
,  
DateCreated 
= 
x 
.  
	CreatedAt  )
.) *
ToString* 2
(2 3
)3 4
} 
)
. 
ToList 
( 
) 
; 
int 

pageNumber 
= 
( 
sc  
.  !
Page! %
??& (
$num) *
)* +
;+ ,
var 
model 
= 
customer  
.  !
ToPagedList! ,
(, -

pageNumber- 7
,7 8
PageSize9 A
)A B
;B C
return 
View 
( 
model 
) 
; 
}   	
public"" 
ActionResult"" 
New"" 
(""  
)""  !
{## 	
return$$ 
View$$ 
($$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
ActionResult(( 
New(( 
(((  

CustomerVm((  *

customerVm((+ 5
)((5 6
{)) 	
try** 
{++ 
var,, 
customer,, 
=,, 
new,, "
Customer,,# +
{-- 
Id.. 
=.. 
Guid.. 
... 
NewGuid.. %
(..% &
)..& '
,..' (
	CreatedAt// 
=// 
DateTime//  (
.//( )
Now//) ,
,//, -
	CreatedBy00 
=00 
LoggedInUser00  ,
.00, -
Id00- /
,00/ 0
Code11 
=11 

customerVm11 %
.11% &
Code11& *
,11* +
Name22 
=22 

customerVm22 %
.22% &
Name22& *
,22* +
Email33 
=33 

customerVm33 &
.33& '
Email33' ,
,33, -
Phone44 
=44 

customerVm44 &
.44& '
Phone44' ,
,44, -
	WebDomain55 
=55 

customerVm55  *
.55* +
	WebDomain55+ 4
,554 5
}66 
;66 
Db77 
.77 
	Customers77 
.77 
Add77  
(77  !
customer77! )
)77) *
;77* +
Db88 
.88 
SaveChanges88 
(88 
)88  
;88  !
ForceCustomers:: 
=::  
true::! %
;::% &
TempData<< 
[<< 
$str<< "
]<<" #
=<<$ %
$str<<& T
;<<T U
return== 
RedirectToAction== '
(==' (
$str==( /
)==/ 0
;==0 1
}>> 
catch?? 
(?? 
	Exception?? 
ex?? 
)??  
{@@ 
}BB 
returnCC 
ViewCC 
(CC 
$strCC 
)CC  
;CC  !
}DD 	
publicFF 
ActionResultFF 
EditFF  
(FF  !
GuidFF! %
?FF% &
idFF' )
)FF) *
{GG 	
ifHH 
(HH 
idHH 
==HH 
nullHH 
)HH 
{II 
throwJJ 
newJJ 

(JJ' (
$numJJ( +
,JJ+ ,
$strJJ- :
)JJ: ;
;JJ; <
}KK 
varLL 
xLL 
=LL 
DbLL 
.LL 
	CustomersLL  
.LL  !
FindLL! %
(LL% &
idLL& (
)LL( )
;LL) *
ifMM 
(MM 
xMM 
==MM 
nullMM 
)MM 
{NN 
throwOO 
newOO 

(OO' (
$numOO( +
,OO+ ,
$strOO- 8
)OO8 9
;OO9 :
}PP 
varQQ 
vendorQQ 
=QQ 
newQQ 

CustomerVmQQ '
{RR 
IdSS 
=SS 
xSS 
.SS 
IdSS 
.SS 
ToStringSS "
(SS" #
)SS# $
,SS$ %
CodeTT 
=TT 
xTT 
.TT 
CodeTT 
,TT 
NameUU 
=UU 
xUU 
.UU 
NameUU 
,UU 
EmailVV 
=VV 
xVV 
.VV 
EmailVV 
,VV  
PhoneWW 
=WW 
xWW 
.WW 
PhoneWW 
,WW  
	WebDomainXX 
=XX 
xXX 
.XX 
	WebDomainXX '
,XX' (
DateCreatedYY 
=YY 
xYY 
.YY  
	CreatedAtYY  )
.YY) *
ToStringYY* 2
(YY2 3
)YY3 4
}ZZ 
;ZZ
return\\ 
View\\ 
(\\ 
$str\\ 
,\\ 
vendor\\ %
)\\% &
;\\& '
}]] 	
[__ 	
HttpPost__	 
]__ 
public`` 
ActionResult`` 
Edit``  
(``  !

CustomerVm``! +

customerVm``, 6
)``6 7
{aa 	
trybb 
{cc 
vardd 
customerdd 
=dd 
Dbdd !
.dd! "
	Customersdd" +
.dd+ ,
Finddd, 0
(dd0 1
Guiddd1 5
.dd5 6
Parsedd6 ;
(dd; <

customerVmdd< F
.ddF G
IdddG I
)ddI J
)ddJ K
;ddK L
ifee 
(ee 
customeree 
!=ee 
nullee  $
)ee$ %
{ff 
customergg 
.gg 
Codegg !
=gg" #

customerVmgg$ .
.gg. /
Codegg/ 3
;gg3 4
customerhh 
.hh 
Namehh !
=hh" #

customerVmhh$ .
.hh. /
Namehh/ 3
;hh3 4
customerii 
.ii 
	WebDomainii &
=ii' (

customerVmii) 3
.ii3 4
	WebDomainii4 =
;ii= >
customerjj 
.jj 
Emailjj "
=jj# $

customerVmjj% /
.jj/ 0
Emailjj0 5
;jj5 6
customerkk 
.kk 
Phonekk "
=kk# $

customerVmkk% /
.kk/ 0
Phonekk0 5
;kk5 6
}ll 
Dbmm 
.mm 
SaveChangesmm 
(mm 
)mm  
;mm  !
TempDatann 
[nn 
$strnn "
]nn" #
=nn$ %
$strnn& [
;nn[ \
ForceCustomerspp 
=pp  
truepp! %
;pp% &
returnqq 
RedirectToActionqq '
(qq' (
$strqq( /
)qq/ 0
;qq0 1
}rr 
catchss 
(ss 
	Exceptionss 
exss 
)ss  
{tt 
}vv 
returnww 
Viewww 
(ww 
$strww 
)ww  
;ww  !
}xx 	
publiczz 
ActionResultzz 
Deletezz "
(zz" #
Guidzz# '
?zz' (
idzz) +
)zz+ ,
{{{ 	
try|| 
{}} 
var~~ 
customer~~ 
=~~ 
Db~~ !
.~~! "
	Customers~~" +
.~~+ ,
Find~~, 0
(~~0 1
id~~1 3
)~~3 4
;~~4 5
if 
( 
customer 
!= 
null  $
)$ %
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
OE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\VendorController.cs
	namespace		 	

 
.		 
Web		 
.		 
Controllers		 '
{

 
[ 
	Authorize 
] 
public 

class 
VendorController !
:" #
BaseController$ 2
{
private 
const 
int 
PageSize "
=# $
$num% '
;' (
public 
ActionResult 
Index !
(! "
CampaignSearchVm" 2
sc3 5
)5 6
{ 	
var 
vendors 
= 
Db 
. 
Vendors $
.$ %
Select% +
(+ ,
x, -
=>. 0
new 
VendorVm 
{ 
Id 
= 
x 
. 
Id 
. 
ToString "
(" #
)# $
,$ %
Name 
= 
x 
. 
Name 
, 
CompanyName 
= 
x 
.  
CompanyName  +
,+ ,
Phone 
= 
x 
. 
Phone 
,  
Email 
= 
x 
. 
Email 
,  
CcEmails 
= 
x 
. 
CcEmails %
,% &
DateCreated 
= 
x 
.  
	CreatedAt  )
.) *
ToString* 2
(2 3
)3 4
} 
)
. 
ToList 
( 
) 
; 
int 

pageNumber 
= 
( 
sc  
.  !
Page! %
??& (
$num) *
)* +
;+ ,
var 
model 
= 
vendors 
.  
ToPagedList  +
(+ ,

pageNumber, 6
,6 7
PageSize8 @
)@ A
;A B
return 
View 
( 
model 
) 
; 
}   	
public"" 
ActionResult"" 
New"" 
(""  
)""  !
{## 	
return$$ 
View$$ 
($$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
ActionResult(( 
New(( 
(((  
VendorVm((  (
vendorVm(() 1
)((1 2
{)) 	
try** 
{++ 
var,, 
vendor,, 
=,, 
new,,  
Vendor,,! '
(,,' (
),,( )
{-- 
Id.. 
=.. 
Guid.. 
... 
NewGuid.. %
(..% &
)..& '
,..' (
	CreatedAt// 
=// 
DateTime//  (
.//( )
Now//) ,
,//, -
	CreatedBy00 
=00 
LoggedInUser00  ,
.00, -
Id00- /
,00/ 0
Name11 
=11 
vendorVm11 #
.11# $
Name11$ (
,11( )
CompanyName22 
=22  !
vendorVm22" *
.22* +
CompanyName22+ 6
,226 7
Email33 
=33 
vendorVm33 $
.33$ %
Email33% *
,33* +
CcEmails44 
=44 
vendorVm44 '
.44' (
CcEmails44( 0
,440 1
Phone55 
=55 
vendorVm55 $
.55$ %
Phone55% *
,55* +
}66 
;66 
Db77 
.77 
Vendors77 
.77 
Add77 
(77 
vendor77 %
)77% &
;77& '
Db88 
.88 
SaveChanges88 
(88 
)88  
;88  !
ForceVendors:: 
=:: 
true:: #
;::# $
TempData<< 
[<< 
$str<< "
]<<" #
=<<$ %
$str<<& T
;<<T U
return== 
RedirectToAction== '
(==' (
$str==( /
)==/ 0
;==0 1
}>> 
catch?? 
(?? 
	Exception?? 
ex?? 
)??  
{@@ 
}BB 
returnCC 
ViewCC 
(CC 
$strCC 
)CC  
;CC  !
}DD 	
publicFF 
ActionResultFF 
EditFF  
(FF  !
GuidFF! %
?FF% &
idFF' )
)FF) *
{GG 	
ifHH 
(HH 
idHH 
==HH 
nullHH 
)HH 
{II 
throwJJ 
newJJ 

(JJ' (
$numJJ( +
,JJ+ ,
$strJJ- :
)JJ: ;
;JJ; <
}KK 
varLL 
xLL 
=LL 
DbLL 
.LL 
VendorsLL 
.LL 
FindLL #
(LL# $
idLL$ &
)LL& '
;LL' (
ifMM 
(MM 
xMM 
==MM 
nullMM 
)MM 
{NN 
throwOO 
newOO 

(OO' (
$numOO( +
,OO+ ,
$strOO- 8
)OO8 9
;OO9 :
}PP 
varQQ 
vendorQQ 
=QQ 
newQQ 
VendorVmQQ %
{RR 
IdSS 
=SS 
xSS 
.SS 
IdSS 
.SS 
ToStringSS "
(SS" #
)SS# $
,SS$ %
NameTT 
=TT 
xTT 
.TT 
NameTT 
,TT 
CompanyNameUU 
=UU 
xUU 
.UU  
CompanyNameUU  +
,UU+ ,
EmailVV 
=VV 
xVV 
.VV 
EmailVV 
,VV  
CcEmailsWW 
=WW 
xWW 
.WW 
CcEmailsWW %
,WW% &
PhoneXX 
=XX 
xXX 
.XX 
PhoneXX 
,XX  
DateCreatedYY 
=YY 
xYY 
.YY  
	CreatedAtYY  )
.YY) *
ToStringYY* 2
(YY2 3
)YY3 4
}ZZ 
;ZZ
return\\ 
View\\ 
(\\ 
$str\\ 
,\\ 
vendor\\ %
)\\% &
;\\& '
}]] 	
[__ 	
HttpPost__	 
]__ 
public`` 
ActionResult`` 
Edit``  
(``  !
VendorVm``! )
vendorVm``* 2
)``2 3
{aa 	
trybb 
{cc 
vardd 
vendordd 
=dd 
Dbdd 
.dd  
Vendorsdd  '
.dd' (
Finddd( ,
(dd, -
Guiddd- 1
.dd1 2
Parsedd2 7
(dd7 8
vendorVmdd8 @
.dd@ A
IdddA C
)ddC D
)ddD E
;ddE F
ifee 
(ee 
vendoree 
!=ee 
nullee "
)ee" #
{ff 
vendorgg 
.gg 
Namegg 
=gg  !
vendorVmgg" *
.gg* +
Namegg+ /
;gg/ 0
vendorhh 
.hh 
CompanyNamehh &
=hh' (
vendorVmhh) 1
.hh1 2
CompanyNamehh2 =
;hh= >
vendorii 
.ii 
Emailii  
=ii! "
vendorVmii# +
.ii+ ,
Emailii, 1
;ii1 2
vendorjj 
.jj 
Phonejj  
=jj! "
vendorVmjj# +
.jj+ ,
Phonejj, 1
;jj1 2
vendorkk 
.kk 
CcEmailskk #
=kk$ %
vendorVmkk& .
.kk. /
CcEmailskk/ 7
;kk7 8
}ll 
Dbmm 
.mm 
SaveChangesmm 
(mm 
)mm  
;mm  !
TempDatann 
[nn 
$strnn "
]nn" #
=nn$ %
$strnn& V
;nnV W
ForceVendorspp 
=pp 
truepp #
;pp# $
returnqq 
RedirectToActionqq '
(qq' (
$strqq( /
)qq/ 0
;qq0 1
}rr 
catchss 
(ss 
	Exceptionss 
exss 
)ss  
{tt 
}vv 
returnww 
Viewww 
(ww 
$strww 
)ww  
;ww  !
}xx 	
publiczz 
ActionResultzz 
Deletezz "
(zz" #
Guidzz# '
?zz' (
idzz) +
)zz+ ,
{{{ 	
try|| 
{}} 
var~~ 
vendor~~ 
=~~ 
Db~~ 
.~~  
Vendors~~  '
.~~' (
Find~~( ,
(~~, -
id~~- /
)~~/ 0
;~~0 1
if 
( 
vendor 
!= 
null "
)" #
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
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\AdsException.cs
	namespace 	

 
. 
Web 
. 
Helpers #
{ 
[ 
Serializable 
] 
public 

class 
AdsException 
: 
	Exception  )
{ 
public		 
AdsException		 
(		 
)		 
:

 	
base


 
(

 
)

 
{

 
}

 
public 
AdsException 
( 
string "
message# *
)* +
:
base
 
(
message
)
{
}
public 
AdsException 
( 
string "
format# )
,) *
params+ 1
object2 8
[8 9
]9 :
args; ?
)? @
: 	
base
 
( 
string 
. 
Format 
( 
format #
,# $
args% )
)) *
)* +
{, -
}. /
public 
AdsException 
( 
string "
message# *
,* +
	Exception, 5
innerException6 D
)D E
: 	
base
 
( 
message 
, 
innerException &
)& '
{( )
}* +
public 
AdsException 
( 
string "
format# )
,) *
	Exception+ 4
innerException5 C
,C D
paramsE K
objectL R
[R S
]S T
argsU Y
)Y Z
: 	
base
 
( 
string 
. 
Format 
( 
format #
,# $
args% )
)) *
,* +
innerException, :
): ;
{< =
}> ?
	protected 
AdsException 
( 
SerializationInfo 0
info1 5
,5 6
StreamingContext7 G
contextH O
)O P
: 	
base
 
( 
info 
, 
context 
) 
{ 
}  !
} 
} �
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\SettingsVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 

SettingsVm 
{ 
public 
bool !
IsAutoProcessTracking )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool $
IsSendNotificationEmails ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} �

DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CustomerVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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

BE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\VendorVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\ProData\NotificationsProcessor.cs
	namespace

 	



 
.

 
Web

 
.

 
ProData

 #
{ 
public 

static 
class "
NotificationsProcessor .
{
public 
static 
void #
FetchAndCheckForQcRules 2
(2 3
)3 4
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
bool !
isAutoProcessTracking *
=+ ,
false- 2
;2 3
var 
settingAuto 
=  !
db" $
.$ %
Settings% -
.- .
FirstOrDefault. <
(< =
x= >
=>? A
xB C
.C D
KeyD G
==H J
StringConstantsK Z
.Z ["
KeyAutoProcessTracking[ q
)q r
;r s
if 
( 
settingAuto 
!=  "
null# '
)' (!
isAutoProcessTracking) >
=? @
intA D
.D E
ParseE J
(J K
settingAutoK V
.V W
ValueW \
)\ ]
==^ `
$numa b
;b c
if 
( 
! !
isAutoProcessTracking )
)) *
return+ 1
;1 2
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
RulesProcessing- <
,< =
$str> @
,@ A
$"B D/
#FetchAndCheckForQCRules started at D g
{g h
DateTimeh p
.p q
Nowq t
}t u
"u v
)v w
;w x
List 
< 
Campaign 
> 
	campaigns (
=) *
db+ -
.- .
	Campaigns. 7
. 
Include 
( 
x 
=> !
x" #
.# $
Approved$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
Segments$ ,
), -
. 
Include 
( 
x 
=> !
x" #
.# $
	Trackings$ -
)- .
. 
Where 
( 
x 
=> 
x  !
.! "
Status" (
==) +
(, -
int- 0
)0 1
CampaignStatus1 ?
.? @

Monitoring@ J
||K M
xN O
.O P
SegmentsP X
.X Y
AnyY \
(\ ]
s] ^
=>_ a
sb c
.c d

==r t
(u v
intv y
)y z

.
� �

Monitoring
� �
)
� �
)
� �
. 
Where 
( 
x 
=> 
x  !
.! "
Approved" *
!=+ -
null. 2
)2 3
.   
ToList   
(   
)   
;   
	LogHelper"" 
."" 
AddLog""  
(""  !
db""! #
,""# $
LogType""% ,
."", -
RulesProcessing""- <
,""< =
$str""> @
,""@ A
$"""B D/
#FetchAndCheckForQCRules processing ""D g
{""g h
	campaigns""h q
.""q r
Count""r w
}""w x
 campaigns.	""x �
"
""� �
)
""� �
;
""� �
int%% 
index%% 
=%% 
$num%% 
;%% 
foreach&& 
(&& 
var&& 
campaign&& %
in&&& (
	campaigns&&) 2
)&&2 3
{'' 
ProDataApiManager(( %
.((% &#
FetchAndUpdateTrackings((& =
(((= >
db((> @
,((@ A
campaign((B J
)((J K
;((K L
	LogHelper)) 
.)) 
AddLog)) $
())$ %
db))% '
,))' (
LogType))) 0
.))0 1
RulesProcessing))1 @
,))@ A
$str))B D
,))D E
$"))F H.
"FetchAndCheckForQCRules completed ))H j
{))j k
index))k p
}))p q
 out of ))q y
{))y z
	campaigns	))z �
.
))� �
Count
))� �
}
))� �
 campaigns.
))� �
"
))� �
)
))� �
;
))� �
index** 
++** 
;** 
}++ 
var// 
toBeExpired// 
=//  !
db//" $
.//$ %

.//2 3
ToList//3 9
(//9 :
)//: ;
.00 
Where00 
(00 
x00  
=>00! #
(00$ %
DateTime00% -
.00- .
Now00. 1
.001 2
	TimeOfDay002 ;
.00; <
Hours00< A
-00B C
x00D E
.00E F
FoundAt00F M
?00M N
.00N O
	TimeOfDay00O X
.00X Y
Hours00Y ^
)00^ _
>=00` b
$num00c f
)00f g
.11 
ToList11 
(11  
)11  !
;11! "
if22 
(22 
toBeExpired22 
.22  
Count22  %
>22& '
$num22( )
)22) *
{33 
	LogHelper44 
.44 
AddLog44 $
(44$ %
db44% '
,44' (
LogType44) 0
.440 1
RulesProcessing441 @
,44@ A
$str44B D
,44D E
$str44F i
)44i j
;44j k
foreach55 
(55 
var55  
notification55! -
in55. 0
toBeExpired551 <
)55< =
{66 
notification77 $
.77$ %
Status77% +
=77, -
(77. /
int77/ 2
)772 3
NotificationStatus773 E
.77E F
Expired77F M
;77M N
}88 
db99 
.99 
SaveChanges99 "
(99" #
)99# $
;99$ %
}:: 
var== 
logs== 
=== 
db== 
.== 

SystemLogs== (
.==( )
ToList==) /
(==/ 0
)==0 1
.>> 
Where>> 
(>> 
x>> 
=>>> 
(>>  !
x>>! "
.>>" #
LogType>># *
==>>+ -
(>>. /
int>>/ 2
)>>2 3
LogType>>3 :
.>>: ;
RulesProcessing>>; J
||>>K M
x>>N O
.>>O P
LogType>>P W
==>>X Z
(>>[ \
int>>\ _
)>>_ `
LogType>>` g
.>>g h
ProData>>h o
)>>o p
&&>>q s
(??  !
DateTime??! )
.??) *
Now??* -
.??- .
	TimeOfDay??. 7
.??7 8
Hours??8 =
-??> ?
x??@ A
.??A B
	CreatedAt??B K
.??K L
	TimeOfDay??L U
.??U V
Hours??V [
)??[ \
>=??] _
$num??` b
)??b c
.??c d
ToList??d j
(??j k
)??k l
;??l m
ifAA 
(AA 
logsAA 
.AA 
CountAA 
>AA  
$numAA! "
)AA" #
{BB 
foreachCC 
(CC 
varCC  
logCC! $
inCC% '
logsCC( ,
)CC, -
{DD 
dbEE 
.EE 

SystemLogsEE %
.EE% &
RemoveEE& ,
(EE, -
logEE- 0
)EE0 1
;EE1 2
}FF 
dbGG 
.GG 
SaveChangesGG "
(GG" #
)GG# $
;GG$ %
}HH 
	LogHelperJJ 
.JJ 
AddLogJJ  
(JJ  !
dbJJ! #
,JJ# $
LogTypeJJ% ,
.JJ, -
RulesProcessingJJ- <
,JJ< =
$strJJ> @
,JJ@ A
$"JJB D0
$FetchAndCheckForQCRules finished at JJD h
{JJh i
DateTimeJJi q
.JJq r
NowJJr u
}JJu v
, JJv x
{JJx y
	campaigns	JJy �
.
JJ� �
Count
JJ� �
}
JJ� �#
 campaigns refreshed.
JJ� �
"
JJ� �
)
JJ� �
;
JJ� �
}LL 
}MM 	
publicOO 
staticOO 
voidOO "
SendNotificationEmailsOO 1
(OO1 2
)OO2 3
{PP 	
usingQQ 
(QQ 
varQQ 
dbQQ 
=QQ 
newQQ 

(QQ- .
)QQ. /
)QQ/ 0
{RR 
boolSS $
isSendNotificationEmailsSS -
=SS. /
falseSS0 5
;SS5 6
varTT $
settingSendNotificationsTT ,
=TT- .
dbTT/ 1
.TT1 2
SettingsTT2 :
.TT: ;
FirstOrDefaultTT; I
(TTI J
xTTJ K
=>TTL N
xTTO P
.TTP Q
KeyTTQ T
==TTU W
StringConstantsTTX g
.TTg h&
KeySendNotificationEmails	TTh �
)
TT� �
;
TT� �
ifUU 
(UU $
settingSendNotificationsUU ,
!=UU- /
nullUU0 4
)UU4 5$
isSendNotificationEmailsUU6 N
=UUO P
intUUQ T
.UUT U
ParseUUU Z
(UUZ [$
settingSendNotificationsUU[ s
.UUs t
ValueUUt y
)UUy z
==UU{ }
$numUU~ 
;	UU �
ifVV 
(VV 
!VV $
isSendNotificationEmailsVV ,
)VV, -
returnVV. 4
;VV4 5
varZZ 
	campaignsZZ 
=ZZ 
(ZZ  !
fromZZ! %
cZZ& '
inZZ( *
dbZZ+ -
.ZZ- .
	CampaignsZZ. 7
join[[  $
n[[% &
in[[' )
db[[* ,
.[[, -

on[[; =
c[[> ?
.[[? @
Id[[@ B
equals[[C I
n[[J K
.[[K L

CampaignId[[L V
where\\  %
n\\& '
.\\' (
Status\\( .
==\\/ 1
(\\2 3
int\\3 6
)\\6 7
NotificationStatus\\7 I
.\\I J
Found\\J O
select]]  &
c]]' (
)]]( )
.]]) *
Distinct]]* 2
(]]2 3
)]]3 4
.]]4 5
Include]]5 <
(]]< =
x]]= >
=>]]? A
x]]B C
.]]C D

)]]Q R
.]]R S
ToList]]S Y
(]]Y Z
)]]Z [
;]][ \
var__ 
vendor__ 
=__ 
db__ 
.__  
Vendors__  '
.__' (
FirstOrDefault__( 6
(__6 7
x__7 8
=>__9 ;
x__< =
.__= >
Name__> B
.__B C
Contains__C K
(__K L
$str__L Q
)__Q R
||__S U
x__V W
.__W X
Name__X \
.__\ ]
Contains__] e
(__e f
$str__f l
)__l m
)__m n
;__n o
ifaa 
(aa 
	campaignsaa 
.aa 
Countaa #
>aa$ %
$numaa& '
)aa' (
{bb 
	LogHelpercc 
.cc 
AddLogcc $
(cc$ %
dbcc% '
,cc' (
LogTypecc) 0
.cc0 1
RulesProcessingcc1 @
,cc@ A
$strccB D
,ccD E
$strccF c
)ccc d
;ccd e
EmailHelperdd 
.dd  %
SendNotificationsToVendordd  9
(dd9 :
vendordd: @
,dd@ A
	campaignsddB K
)ddK L
;ddL M
}ee 
}ff 
}gg 	
}ii 
}jj ��
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\CampaignProcessor.cs
	namespace

 	



 
.

 
Web

 
.

 
Async

 !
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
ProcessNewOrder *
(* +
string+ 1
orderNumber2 =
,= >
string? E
userNameF N
)N O
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
var 
campaign 
= 
db !
.! "
	Campaigns" +
.+ ,
Include, 3
(3 4
x4 5
=>6 8
x9 :
.: ;
Assets; A
)A B
.B C
IncludeC J
(J K
xK L
=>M O
xP Q
.Q R
SegmentsR Z
)Z [
.! "
FirstOrDefault" 0
(0 1
x1 2
=>3 5
x6 7
.7 8
OrderNumber8 C
==D F
orderNumberG R
)R S
;S T
var 
user 
= 
db 
. 
Users #
.# $
FirstOrDefault$ 2
(2 3
x3 4
=>5 7
x8 9
.9 :
UserName: B
==C E
userNameF N
)N O
;O P

.  
ProcessNewOrderFiles 2
(2 3
db3 5
,5 6
campaign7 ?
)? @
;@ A
EmailHelper 
. "
SendOrderEmailToClient 2
(2 3
campaign3 ;
,; <
user= A
)A B
;B C
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
if 
( 
ads 
!= 
null 
)  
{ 
EmailHelper 
.  
SendOrderEmailToAds  3
(3 4
campaign4 <
,< =
user> B
,B C
adsD G
.G H
EmailH M
,M N
adsO R
.R S
CcEmailsS [
)[ \
;\ ]
} 
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
Orders- 3
,3 4
campaign5 =
.= >
OrderNumber> I
,I J
$strK W
+X Y
campaignZ b
.b c
CampaignNamec o
+p q
$str	r �
+
� �
campaign
� �
.
� � 
RepresentativeName
� �
)
� �
;
� �
} 
}   	
public"" 
static"" 
void"" 
SendToVendor"" '
(""' (
OrderVia""( 0
orderVia""1 9
,""9 :
Guid""; ?
?""? @
vendorId""A I
,""I J
string""K Q
orderNumber""R ]
,""] ^
string""_ e
[""e f
]""f g
segmentsSelected""h x
,""x y
string	""z �
whiteLabelDomain
""� �
)
""� �
{## 	
using$$ 
($$ 
var$$ 
db$$ 
=$$ 
new$$ 

($$- .
)$$. /
)$$/ 0
{%% 
Campaign&& 
campaign&& !
=&&" #
db&&$ &
.&&& '
	Campaigns&&' 0
.'' 
Include'' 
('' 
x'' 
=>'' !
x''" #
.''# $
Assets''$ *
)''* +
.(( 
Include(( 
((( 
x(( 
=>(( !
x((" #
.((# $
Segments(($ ,
)((, -
.)) 
Include)) 
()) 
x)) 
=>)) !
x))" #
.))# $
Approved))$ ,
))), -
.** 
Include** 
(** 
x** 
=>** !
x**" #
.**# $
	Trackings**$ -
)**- .
.++ 
FirstOrDefault++ #
(++# $
x++$ %
=>++& (
x++) *
.++* +
OrderNumber+++ 6
==++7 9
orderNumber++: E
)++E F
;++F G
var-- 
vendor-- 
=-- 
db-- 
.--  
Vendors--  '
.--' (
FirstOrDefault--( 6
(--6 7
x--7 8
=>--9 ;
x--< =
.--= >
Id--> @
==--A C
vendorId--D L
)--L M
;--M N
if// 
(// 
segmentsSelected// $
==//% '
null//( ,
)//, -
{00 
SendToVendorSingle11 &
(11& '
orderVia11' /
,11/ 0
db111 3
,113 4
campaign115 =
,11= >
vendor11? E
,11E F
whiteLabelDomain11G W
)11W X
;11X Y
}22 
else33 
{44 
SendToVendorMulti55 %
(55% &
orderVia55& .
,55. /
db550 2
,552 3
campaign554 <
,55< =
vendor55> D
,55D E
segmentsSelected55F V
,55V W
whiteLabelDomain55X h
)55h i
;55i j
}66 
var99 #
ifSomeSegmentsRemaining99 +
=99, -
db99. 0
.990 1
CampaignSegments991 A
.:: 
Where:: $
(::$ %
c::% &
=>::' )
c::* +
.::+ ,

CampaignId::, 6
==::7 9
campaign::: B
.::B C
Id::C E
)::E F
.;; 
Any;; "
(;;" #
x;;# $
=>;;% '
x;;( )
.;;) *

==;;8 :
(;;; <
int;;< ?
);;? @

.;;M N
	Generated;;N W
||;;X Z
x;;[ \
.;;\ ]

==;;k m
(;;n o
int;;o r
);;r s

.
;;� �
Approved
;;� �
)
;;� �
;
;;� �
if<< 
(<< 
!<< #
ifSomeSegmentsRemaining<< ,
)<<, -
{== 
campaign>> 
.>> 
Status>> #
=>>$ %
(>>& '
int>>' *
)>>* +
CampaignStatus>>+ 9
.>>9 :

Monitoring>>: D
;>>D E
db?? 
.?? 
SaveChanges?? "
(??" #
)??# $
;??$ %
}@@ 
}BB 
}CC 	
privateEE 
staticEE 
voidEE 
SendToVendorMultiEE -
(EE- .
OrderViaEE. 6
orderViaEE7 ?
,EE? @

dbEEO Q
,EEQ R
CampaignEES [
campaignEE\ d
,EEd e
VendorEEf l
vendorEEm s
,EEs t
stringEEu {
[EE{ |
]EE| }
segmentsSelected	EE~ �
,
EE� �
string
EE� �
whiteLabelDomain
EE� �
)
EE� �
{FF 	
varGG 
segmentsGG 
=GG 
dbGG 
.GG 
CampaignSegmentsGG .
.HH# $
WhereHH$ )
(HH) *
cHH* +
=>HH, .
cHH/ 0
.HH0 1

CampaignIdHH1 ;
==HH< >
campaignHH? G
.HHG H
IdHHH J
&&HHK M
segmentsSelectedHHN ^
.HH^ _
ContainsHH_ g
(HHg h
cHHh i
.HHi j

)HHw x
)HHx y
.II# $
ToListII$ *
(II* +
)II+ ,
;II, -
foreachKK 
(KK 
varKK 
segmentKK  
inKK! #
segmentsKK$ ,
)KK, -
{LL 
switchMM 
(MM 
orderViaMM  
)MM  !
{NN 
caseOO 
OrderViaOO !
.OO! "
EmailOO" '
:OO' (
EmailHelperPP #
.PP# $ 
SendApprovedToVendorPP$ 8
(PP8 9
vendorPP9 ?
,PP? @
campaignPPA I
,PPI J
segmentPPK R
)PPR S
;PPS T
breakQQ 
;QQ 
caseRR 
OrderViaRR !
.RR! "
ApiRR" %
:RR% &
varSS 
responseSS $
=SS% &
ProDataApiManagerSS' 8
.SS8 9
CreateSS9 ?
(SS? @
campaignSS@ H
,SSH I
segmentSSJ Q
,SSQ R
whiteLabelDomainSSS c
)SSc d
;SSd e
ifTT 
(TT 
responseTT $
.TT$ %
StatusTT% +
!=TT, .
ProDataApiManagerTT/ @
.TT@ A
SuccessTTA H
)TTH I
{UU 
throwVV !
newVV" %
AdsExceptionVV& 2
(VV2 3
responseVV3 ;
.VV; <
ErrorMessageVV< H
)VVH I
;VVI J
}WW 
breakXX 
;XX 
defaultYY 
:YY 
throwZZ 
newZZ !'
ArgumentOutOfRangeExceptionZZ" =
(ZZ= >
nameofZZ> D
(ZZD E
orderViaZZE M
)ZZM N
,ZZN O
orderViaZZP X
,ZZX Y
nullZZZ ^
)ZZ^ _
;ZZ_ `
}[[ 
segment]] 
.]] 

=]]& '
(]]( )
int]]) ,
)]], -

.]]: ;

Monitoring]]; E
;]]E F
var__ 
campaignTracking__ $
=__% &
db`` 
.`` 
CampaignTrackings`` (
.``( )
FirstOrDefault``) 7
(``7 8
x``8 9
=>``: <
x``= >
.``> ?

CampaignId``? I
==``J L
campaign``M U
.``U V
Id``V X
&&``Y [
x``\ ]
.``] ^

==``l n
segment``o v
.``v w

)
``� �
;
``� �
ifbb 
(bb 
campaignTrackingbb $
==bb% '
nullbb( ,
)bb, -
{cc 
vardd 

trackingIddd "
=dd# $
Guiddd% )
.dd) *
NewGuiddd* 1
(dd1 2
)dd2 3
;dd3 4
varee 
trackingee  
=ee! "
newee# &
CampaignTrackingee' 7
(ee7 8
)ee8 9
{ff 
Idgg 
=gg 

trackingIdgg '
,gg' (
	CreatedAthh !
=hh" #
DateTimehh$ ,
.hh, -
Nowhh- 0
,hh0 1

CampaignIdii "
=ii# $
campaignii% -
.ii- .
Idii. 0
,ii0 1
OrderNumberjj #
=jj$ %
campaignjj& .
.jj. /
OrderNumberjj/ :
,jj: ;

=kk& '
segmentkk( /
.kk/ 0

,kk= >
Quantityll  
=ll! "
segmentll# *
.ll* +
Quantityll+ 3
,ll3 4
DateSentmm  
=mm! "
DateTimemm# +
.mm+ ,
Nowmm, /
,mm/ 0
IsCreatedThroughApinn +
=nn, -
falsenn. 3
}oo 
;oo 
dbpp 
.pp 
CampaignTrackingspp (
.pp( )
Addpp) ,
(pp, -
trackingpp- 5
)pp5 6
;pp6 7
}qq 
	LogHelperrr 
.rr 
AddLogrr  
(rr  !
dbrr! #
,rr# $
LogTyperr% ,
.rr, -
ProDatarr- 4
,rr4 5
campaignrr6 >
.rr> ?
OrderNumberrr? J
,rrJ K
$"rrL N
Segment rrN V
{rrV W
segmentrrW ^
.rr^ _

}rrl m3
& has been sent to vendor successfully.	rrm �
"
rr� �
)
rr� �
;
rr� �
}ss 
}tt 	
privatevv 
staticvv 
voidvv 
SendToVendorSinglevv .
(vv. /
OrderViavv/ 7
orderViavv8 @
,vv@ A

dbvvP R
,vvR S
CampaignvvT \
campaignvv] e
,vve f
Vendorvvg m
vendorvvn t
,vvt u
stringvvv |
whiteLabelDomain	vv} �
)
vv� �
{ww 	
switchxx 
(xx 
orderViaxx 
)xx 
{yy 
casezz 
OrderViazz 
.zz 
Emailzz #
:zz# $
EmailHelper{{ 
.{{   
SendApprovedToVendor{{  4
({{4 5
vendor{{5 ;
,{{; <
campaign{{= E
,{{E F
null{{G K
){{K L
;{{L M
break|| 
;|| 
case}} 
OrderVia}} 
.}} 
Api}} !
:}}! "
var~~ 
response~~  
=~~! "
ProDataApiManager~~# 4
.~~4 5
Create~~5 ;
(~~; <
campaign~~< D
,~~D E
null~~F J
,~~J K
whiteLabelDomain~~L \
)~~\ ]
;~~] ^
if 
( 
response  
.  !
Status! '
!=( *
ProDataApiManager+ <
.< =
Success= D
)D E
{
�� 
throw
�� 
new
�� !
AdsException
��" .
(
��. /
response
��/ 7
.
��7 8
ErrorMessage
��8 D
)
��D E
;
��E F
}
�� 
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� )
ArgumentOutOfRangeException
�� 9
(
��9 :
nameof
��: @
(
��@ A
orderVia
��A I
)
��I J
,
��J K
orderVia
��L T
,
��T U
null
��V Z
)
��Z [
;
��[ \
}
�� 
string
�� 
orderNumberRdp
�� !
=
��" #
campaign
��$ ,
.
��, -
OrderNumber
��- 8
;
��8 9
long
�� 
quantity
�� 
;
�� 
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
orderNumberRdp
�� 
=
��  
campaign
��! )
.
��) *&
ReBroadcastedOrderNumber
��* B
;
��B C
quantity
�� 
=
�� 
campaign
�� #
.
��# $#
ReBroadcastedQuantity
��$ 9
;
��9 :
}
�� 
else
�� 
{
�� 
orderNumberRdp
�� 
=
��  
campaign
��! )
.
��) *
OrderNumber
��* 5
;
��5 6
quantity
�� 
=
�� 
campaign
�� #
.
��# $
Approved
��$ ,
.
��, -
Quantity
��- 5
;
��5 6
}
�� 
var
�� 
campaignTracking
��  
=
��! "
db
�� 
.
�� 
CampaignTrackings
�� '
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
��= >

CampaignId
��> H
==
��I K
campaign
��L T
.
��T U
Id
��U W
&&
��X Z
x
��[ \
.
��\ ]
OrderNumber
��] h
==
��i k
orderNumberRdp
��l z
&&
��{ }
string��~ �
.��� �

(��� �
x��� �
.��� �

)��� �
)��� �
;��� �
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
var
�� 

trackingId
�� 
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
;
��/ 0
var
�� 
tracking
�� 
=
�� 
new
�� "
CampaignTracking
��# 3
(
��3 4
)
��4 5
{
�� 
Id
�� 
=
�� 

trackingId
�� #
,
��# $
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

CampaignId
�� 
=
��  
campaign
��! )
.
��) *
Id
��* ,
,
��, -
OrderNumber
�� 
=
��  !
orderNumberRdp
��" 0
,
��0 1

�� !
=
��" #
string
��$ *
.
��* +
Empty
��+ 0
,
��0 1
Quantity
�� 
=
�� 
quantity
�� '
,
��' (
DateSent
�� 
=
�� 
DateTime
�� '
.
��' (
Now
��( +
,
��+ ,!
IsCreatedThroughApi
�� '
=
��( )
false
��* /
}
�� 
;
�� 
db
�� 
.
�� 
CampaignTrackings
�� $
.
��$ %
Add
��% (
(
��( )
tracking
��) 1
)
��1 2
;
��2 3
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
��F G
!
��H I
campaign
��I Q
.
��Q R

��R _
?
�� 
$str
�� C
:
�� 
$str
�� J
)
��J K
;
��K L
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
�� 
}
�� 	
}
�� 
}�� �n
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\DataFileProcessor.cs
	namespace

 
.
Web
.
Async
{ 
public 

class 
DataFileProcessor "
{ 
public 
DataFileProcessor  
(  !
)! "
{ 	
} 	
public 
static 
async 
Task  
FetchSqlDataFile! 1
(1 2
string2 8

uploadPath9 C
,C D
stringE K
orderNumberL W
,W X
stringY _
zipCodeFile` k
,k l
long 
dataQuantity 
) 
{ 	
using 
( 
var 
db 
= 
new 

(- .
). /
)/ 0
{ 
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
DataProcessing- ;
,; <
orderNumber= H
,H I
$strJ l
)l m
;m n
try 
{ 
string 
zipFilePath &
=' (
Path) -
.- .
Combine. 5
(5 6

uploadPath6 @
,@ A
zipCodeFileB M
)M N
;N O

.  ! "
Download  " *
(  * +
zipCodeFile  + 6
,  6 7
zipFilePath  8 C
)  C D
;  D E
var!! 
list!! 
=!! 
new!! "
List!!# '
<!!' (
string!!( .
>!!. /
(!!/ 0
)!!0 1
;!!1 2
foreach"" 
("" 
var""  
line""! %
in""& (
File"") -
.""- .
ReadAllLines"". :
("": ;
zipFilePath""; F
)""F G
)""G H
{## 
var$$ 
trimmed$$ #
=$$$ %
StringHelper$$& 2
.$$2 3
Trim$$3 7
($$7 8
line$$8 <
)$$< =
;$$= >
if%% 
(%% 
string%% "
.%%" #

(%%0 1
trimmed%%1 8
)%%8 9
)%%9 :
continue%%; C
;%%C D
list&& 
.&& 
Add&&  
(&&  !
trimmed&&! (
)&&( )
;&&) *
}'' 
	LogHelper(( 
.(( 
AddLog(( $
((($ %
db((% '
,((' (
LogType(() 0
.((0 1
DataProcessing((1 ?
,((? @
orderNumber((A L
,((L M
zipCodeFile)) #
+))$ %
$str))& ?
)))? @
;))@ A
try,, 
{-- 
var.. 
data..  
=..! "
SegmentDataManager..# 5
...5 6
FetchSegmentsData..6 G
(..G H
new..H K
SegmentParameters..L ]
(..] ^
)..^ _
{// 
DataQuantity00 (
=00) *
dataQuantity00+ 7
,007 8
CustomerCode11 (
=11) *
SegmentDataManager11+ =
.11= >
CustomerCode11> J
,11J K
ZipCodes22 $
=22% &
list22' +
}33 
)33 
;33 
string44 
fileName44 '
=44( )
string44* 0
.440 1
Format441 7
(447 8
$str448 J
,44J K
orderNumber44L W
)44W X
;44X Y
var55 
filePath55 $
=55% &
$"55' )
{55) *

uploadPath55* 4
}554 5
\\555 7
{557 8
fileName558 @
}55@ A
"55A B
;55B C
data66 
.66 
ToCsv66 "
(66" #
filePath66# +
,66+ ,
new66- 0

(66> ?
)66? @
{77 
	EndOfLine88 %
=88& '
$str88( .
,88. /
FieldSeparator99 *
=99+ ,
$char99- 0
,990 1

=::* +
$char::, /
,::/ 0
Columns;; #
=;;$ %
new<<  #
List<<$ (
<<<( )
string<<) /
><</ 0
{==  !
$str>> +
,>>+ ,
$str?? '
,??' (
$str@@ &
,@@& '
$strAA %
,AA% &
$strBB "
,BB" #
$strCC #
,CC# $
$strDD !
,DD! "
$strEE "
,EE" #
$strFF !
,FF! "
$strGG +
,GG+ ,
$strHH #
}II  !
}JJ 
)JJ 
;JJ 
stringKK 

=KK- .
stringKK/ 5
.KK5 6
FormatKK6 <
(KK< =
$strKK= N
,KKN O
orderNumberKKP [
)KK[ \
;KK\ ]

.LL% &
UploadLL& ,
(LL, -

,LL: ;
filePathLL< D
,LLD E
trueLLF J
)LLJ K
;LLK L
	LogHelperMM !
.MM! "
AddLogMM" (
(MM( )
dbMM) +
,MM+ ,
LogTypeMM- 4
.MM4 5
DataProcessingMM5 C
,MMC D
orderNumberMME P
,MMP Q

+NN% &
$strNN' a
)NNa b
;NNb c
CampaignQQ  
campaignQQ! )
=QQ* +
dbRR 
.RR 
	CampaignsRR (
.RR( )
IncludeRR) 0
(RR0 1
xRR1 2
=>RR3 5
xRR6 7
.RR7 8
SegmentsRR8 @
)RR@ A
.RRA B
FirstOrDefaultRRB P
(RRP Q
xRRQ R
=>RRS U
xRRV W
.RRW X
OrderNumberRRX c
==RRd f
orderNumberRRg r
)RRr s
;RRs t
varTT 
campaignTestingTT +
=TT, -
dbTT. 0
.TT0 1
CampaignsTestingTT1 A
.TTA B
FirstOrDefaultTTB P
(TTP Q
xTTQ R
=>TTS U
xTTV W
.TTW X

CampaignIdTTX b
==TTc e
campaignTTf n
.TTn o
IdTTo q
)TTq r
;TTr s
campaignTestingUU '
.UU' (
DataFileUrlUU( 3
=UU4 5

;UUC D
campaignTestingVV '
.VV' (
DateFetchedVV( 3
=VV4 5
DateTimeVV6 >
.VV> ?
NowVV? B
;VVB C
dbWW 
.WW 
SaveChangesWW &
(WW& '
)WW' (
;WW( )
foreachYY 
(YY  !
varYY! $
segmentYY% ,
inYY- /
campaignYY0 8
.YY8 9
SegmentsYY9 A
.YYA B
OrderByYYB I
(YYI J
xYYJ K
=>YYL N
xYYO P
.YYP Q

)YY^ _
)YY_ `
{ZZ 
string[[ "
	fileName1[[# ,
=[[- .
$"[[/ 1
{[[1 2
campaign[[2 :
.[[: ;
OrderNumber[[; F
}[[F G
\\[[G I
{[[I J
segment[[J Q
.[[Q R

}[[_ `
data.csv[[` h
"[[h i
;[[i j
var\\ 
	filePath1\\  )
=\\* +
$"\\, .
{\\. /

uploadPath\\/ 9
}\\9 :
\\\\: <
{\\< =
	fileName1\\= F
}\\F G
"\\G H
;\\H I
var]] 
data1]]  %
=]]& '
data^^  $
.^^$ %
Where^^% *
(^^* +
x^^+ ,
=>^^- /
x^^0 1
.^^1 2
Index^^2 7
>=^^8 :
segment^^; B
.^^B C
FirstRangeStart^^C R
&&^^S U
x^^V W
.^^W X
Index^^X ]
<=^^^ `
segment^^a h
.^^h i

)^^v w
.^^w x
ToList^^x ~
(^^~ 
)	^^ �
;
^^� �
var__ 
data2__  %
=__& '
data``  $
.``$ %
Where``% *
(``* +
x``+ ,
=>``- /
x``0 1
.``1 2
Index``2 7
>=``8 :
segment``; B
.``B C
SecondRangeStart``C S
&&``T V
x``W X
.``X Y
Index``Y ^
<=``_ a
segment``b i
.``i j
SecondRangeEnd``j x
)``x y
.aa$ %
ToListaa% +
(aa+ ,
)aa, -
;aa- .
varbb 
data3bb  %
=bb& '
datacc  $
.cc$ %
Wherecc% *
(cc* +
xcc+ ,
=>cc- /
xcc0 1
.cc1 2
Indexcc2 7
>=cc8 :
segmentcc; B
.ccB C
ThirdRangeStartccC R
&&ccS U
xccV W
.ccW X
IndexccX ]
<=cc^ `
segmentcca h
.cch i

)ccv w
.ccw x
ToListccx ~
(cc~ 
)	cc �
;
cc� �
data2dd !
.dd! "
AddRangedd" *
(dd* +
data3dd+ 0
)dd0 1
;dd1 2
data1ee !
.ee! "
AddRangeee" *
(ee* +
data2ee+ 0
)ee0 1
;ee1 2
data1ff !
.ff! "
ToCsvff" '
(ff' (
	filePath1ff( 1
,ff1 2
newff3 6

(ffD E
)ffE F
{gg 
	EndOfLinehh  )
=hh* +
$strhh, 2
,hh2 3
FieldSeparatorii  .
=ii/ 0
$charii1 4
,ii4 5

=jj. /
$charjj0 3
,jj3 4
Columnskk  '
=kk( )
newll$ '
Listll( ,
<ll, -
stringll- 3
>ll3 4
{mm$ %
$strnn  /
,nn/ 0
$stroo  +
,oo+ ,
$strpp  *
,pp* +
$strqq  )
,qq) *
$strrr  &
,rr& '
$strss  '
,ss' (
$strtt  %
,tt% &
$struu  &
,uu& '
$strvv  %
,vv% &
$strww  /
,ww/ 0
$strxx  '
}yy$ %
}zz 
)zz 
;zz 
string{{ "
amazonFileKey1{{# 1
={{2 3
$"{{4 6
{{{6 7
campaign{{7 ?
.{{? @
OrderNumber{{@ K
}{{K L
/{{L M
{{{M N
segment{{N U
.{{U V

}{{c d
data.csv{{d l
"{{l m
;{{m n

.||) *
Upload||* 0
(||0 1
amazonFileKey1||1 ?
,||? @
filePath||A I
,||I J
true||K O
)||O P
;||P Q
segment~~ #
.~~# $
SegmentDataFileUrl~~$ 6
=~~7 8
FileManager~~9 D
.~~D E
GetFilePathLive~~E T
(~~T U
UploadFileType~~U c
.~~c d
DataFile~~d l
,~~l m
campaign  (
.( )
OrderNumber) 4
,4 5
string6 <
.< =
Empty= B
,B C
segmentD K
.K L

)Y Z
;Z [
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
orderNumber
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
orderNumber
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
orderNumber
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
orderNumber
��C N
,
��N O
$str
��P c
+
��d e
zipCodeFile
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
}�� Ⱦ
KE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\MailChimpProcessor.cs
	namespace 	

 
. 
Web 
. 
Async !
{
public 

class 
MailChimpProcessor #
{ 
public 
MailChimpProcessor !
(! "
)" #
{ 	
} 	
public 
static 
void 

(( )

CreativeVm) 3
model4 9
)9 :
{ 	
string 

campaignId !
=" #$
CreateCampignWithContent$ <
(< =
model= B
)B C
;C D!
QuickTestSendCampaign %
(% &
model& +
,+ ,

campaignId- 7
,7 8
model9 >
.> ?
QuickTestEmails? N
.N O
SplitO T
(T U
$strU X
.X Y
ToCharArrayY d
(d e
)e f
)f g
)g h
;h i
} 	
private 
static 
void !
QuickTestSendCampaign 1
(1 2

CreativeVm2 <
model= B
,B C
stringD J

campaignIdK U
,U V
stringW ]
[] ^
]^ _

testEmails` j
)j k
{ 	
IMailChimpManager 
manager %
=& '
new( +
MailChimpManager, <
(< =
)= >
;> ?
var 
testSend 
= 
manager "
." #
	Campaigns# ,
., -
	TestAsync- 6
(6 7

campaignId7 A
,A B
newC F
CampaignTestRequestG Z
{ 
Emails!! 
=!! 

testEmails!! #
,!!# $
	EmailType"" 
="" 
$str"" "
}## 
)##
.## 
ConfigureAwait## 
(## 
false## #
)### $
;##$ %
}%% 	
public'' 
static'' 
void'' 
TestSend'' #
(''# $

CreativeVm''$ .
model''/ 4
)''4 5
{(( 	
using)) 
()) 
var)) 
db)) 
=)) 
new)) 

())- .
))). /
)))/ 0
{** 
var++ 
logs++ 
=++ 
db++ 
.++ 

SystemLogs++ (
.++( )
Where++) .
(++. /
x++/ 0
=>++1 3
x++4 5
.++5 6
OrderNumber++6 A
==++B D
model++E J
.++J K
OrderNumber++K V
&&++W Y
x++Z [
.++[ \
LogType++\ c
==++d f
(++g h
int++h k
)++k l
LogType++l s
.++s t
	MailChimp++t }
)++} ~
;++~ 
foreach,, 
(,, 
var,, 
log,,  
in,,! #
logs,,$ (
),,( )
{-- 
db.. 
... 

SystemLogs.. !
...! "
Remove.." (
(..( )
log..) ,
).., -
;..- .
}// 
db00 
.00 
SaveChanges00 
(00 
)00  
;00  !
	LogHelper22 
.22 
AddLog22  
(22  !
db22! #
,22# $
LogType22% ,
.22, -
	MailChimp22- 6
,226 7
model228 =
.22= >
OrderNumber22> I
,22I J
$str22K p
+22q r
model22s x
.22x y
OrderNumber	22y �
)
22� �
;
22� �
string33 
listId33 
=33 

CreateList33  *
(33* +
db33+ -
,33- .
model33/ 4
)334 5
;335 6

(44 
db44  
,44  !
listId44" (
,44( )
model44* /
)44/ 0
;440 1
Thread77 
.77 
Sleep77 
(77 
$num77 !
*77" #
$num77$ &
*77' (
$num77) *
)77* +
;77+ ,
int:: 

templateId:: 
=::  
CreateTemplate::! /
(::/ 0
db::0 2
,::2 3
model::4 9
)::9 :
;::: ;
string<< 

campaignId<< !
=<<" #%
CreateCampignWithTemplate<<$ =
(<<= >
db<<> @
,<<@ A
model<<B G
,<<G H
listId<<I O
,<<O P

templateId<<Q [
)<<[ \
;<<\ ]
SendCampaign>> 
(>> 
db>> 
,>>  
model>>! &
,>>& '

campaignId>>( 2
)>>2 3
;>>3 4
	LogHelper@@ 
.@@ 
AddLog@@  
(@@  !
db@@! #
,@@# $
LogType@@% ,
.@@, -
	MailChimp@@- 6
,@@6 7
model@@8 =
.@@= >
OrderNumber@@> I
,@@I J
$str@@K n
)@@n o
;@@o p
}AA 
}BB 	
privateDD 
staticDD 
voidDD 
SendCampaignDD (
(DD( )

dbDD7 9
,DD9 :

CreativeVmDD; E
modelDDF K
,DDK L
stringDDM S

campaignIdDDT ^
)DD^ _
{EE 	
IMailChimpManagerFF 
managerFF %
=FF& '
newFF( +
MailChimpManagerFF, <
(FF< =
)FF= >
;FF> ?
	LogHelperGG 
.GG 
AddLogGG 
(GG 
dbGG 
,GG  
LogTypeGG! (
.GG( )
	MailChimpGG) 2
,GG2 3
modelGG4 9
.GG9 :
OrderNumberGG: E
,GGE F
$strGGG ]
)GG] ^
;GG^ _
varHH 
sentHH 
=HH 
managerHH 
.HH 
	CampaignsHH (
.HH( )
	SendAsyncHH) 2
(HH2 3

campaignIdHH3 =
)HH= >
.HH> ?
ConfigureAwaitHH? M
(HHM N
falseHHN S
)HHS T
;HHT U
}JJ 	
privateLL 
staticLL 
stringLL $
CreateCampignWithContentLL 6
(LL6 7

CreativeVmLL7 A
modelLLB G
)LLG H
{MM 	
IMailChimpManagerNN 
managerNN %
=NN& '
newNN( +
MailChimpManagerNN, <
(NN< =
)NN= >
;NN> ?
varPP 
campaignPP 
=PP 
managerPP "
.PP" #
	CampaignsPP# ,
.PP, -
AddAsyncPP- 5
(PP5 6
newPP6 9
	MailChimpPP: C
.PPC D
NetPPD G
.PPG H
ModelsPPH N
.PPN O
CampaignPPO W
{QQ 
SettingsRR 
=RR 
newRR 
SettingRR &
{SS 
ReplyToTT 
=TT 
$strTT <
,TT< =
TitleUU 
=UU 
modelUU !
.UU! "
SubjectLineUU" -
,UU- .
FromNameVV 
=VV 
$strVV ,
,VV, -
SubjectLineWW 
=WW  !
modelWW" '
.WW' (
SubjectLineWW( 3
,WW3 4
}XX 
,XX 
TypeYY 
=YY 
CampaignTypeYY #
.YY# $
RegularYY$ +
,YY+ ,
}ZZ 
)ZZ
.ZZ 
ConfigureAwaitZZ 
(ZZ 
falseZZ #
)ZZ# $
;ZZ$ %
var\\ 

campaignId\\ 
=\\ 
campaign\\ %
.\\% &

GetAwaiter\\& 0
(\\0 1
)\\1 2
.\\2 3
	GetResult\\3 <
(\\< =
)\\= >
.\\> ?
Id\\? A
;\\A B
var^^ 
content^^ 
=^^ 
new^^ 
ContentRequest^^ ,
{__ 
Htmlaa 
=aa 
modelaa 
.aa 
	Creativesaa &
,aa& '
}bb 
;bb
managercc 
.cc 
Contentcc 
.cc 
AddOrUpdateAsynccc ,
(cc, -

campaignIdcc- 7
,cc7 8
contentcc9 @
)cc@ A
;ccA B
returndd 

campaignIddd 
;dd 
}ee 	
privategg 
staticgg 
stringgg %
CreateCampignWithTemplategg 7
(gg7 8

dbggF H
,ggH I

CreativeVmggJ T
modelggU Z
,ggZ [
stringgg\ b
listIdggc i
,ggi j
intggk n

templateIdggo y
)ggy z
{hh 	
IMailChimpManagerii 
managerii %
=ii& '
newii( +
MailChimpManagerii, <
(ii< =
)ii= >
;ii> ?
	LogHelperjj 
.jj 
AddLogjj 
(jj 
dbjj 
,jj  
LogTypejj! (
.jj( )
	MailChimpjj) 2
,jj2 3
modeljj4 9
.jj9 :
OrderNumberjj: E
,jjE F
$strjjG h
)jjh i
;jji j
varkk 
campaignkk 
=kk 
managerkk "
.kk" #
	Campaignskk# ,
.kk, -
AddAsynckk- 5
(kk5 6
newkk6 9
	MailChimpkk: C
.kkC D
NetkkD G
.kkG H
ModelskkH N
.kkN O
CampaignkkO W
{ll 

Recipientsmm 
=mm 
newmm  
	Recipientmm! *
{nn 
ListIdoo 
=oo 
listIdoo #
}pp 
,pp 
Settingsqq 
=qq 
newqq 
Settingqq &
{rr 
ReplyToss 
=ss 
$strss <
,ss< =
Titlett 
=tt 
modeltt !
.tt! "
SubjectLinett" -
,tt- .
FromNameuu 
=uu 
$struu ,
,uu, -
SubjectLinevv 
=vv  !
modelvv" '
.vv' (
SubjectLinevv( 3
,vv3 4

TemplateIdww 
=ww  

templateIdww! +
,ww+ ,
}xx 
,xx 
Typeyy 
=yy 
CampaignTypeyy #
.yy# $
Regularyy$ +
,yy+ ,
}zz 
)zz
.zz 
ConfigureAwaitzz 
(zz 
falsezz #
)zz# $
;zz$ %
var|| 

campaignId|| 
=|| 
campaign|| %
.||% &

GetAwaiter||& 0
(||0 1
)||1 2
.||2 3
	GetResult||3 <
(||< =
)||= >
.||> ?
Id||? A
;||A B
return}} 

campaignId}} 
;}} 
}~~ 	
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

CreativeVm
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

CreativeVm
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

CreativeVm
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

CreativeVm
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
HE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\ProData\ProDataHelper.cs
	namespace 	

 
. 
Web 
. 
ProData #
{ 
public 

static 
class 

{ 
public 
static 
int 
GetIndex "
(" #
string# )

)7 8
{ 	
var 
parts 
= 

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
} ��
PE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\AccountController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
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
	IsUsesApi
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
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\API\AdsController.cs
	namespace 	

 
. 
Web 
. 
API 
{ 
public

class

:

{ 
private 
readonly 
string (
_authenticationParameterName  <
== >
$str? K
;K L
private 
readonly 
int 
_apiMaxDailyLimit .
=/ 0
$num1 3
;3 4
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
(- .(
_authenticationParameterName. J
)J K
)K L
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
(8 9(
_authenticationParameterName9 U
)U V
.V W
FirstW \
(\ ]
)] ^
;^ _
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
_apiMaxDailyLimit))% 6
)))6 7
{** 
throw++ 
new++ 
AdsException++ *
(++* +
$str+++ A
+++B C
_apiMaxDailyLimit++D U
+++V W
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
(LL- .(
_authenticationParameterNameLL. J
)LLJ K
)LLK L
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
(YY8 9(
_authenticationParameterNameYY9 U
)YYU V
.YYV W
FirstYYW \
(YY\ ]
)YY] ^
;YY^ _
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
}�� ��
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\ApprovedController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
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
.  
Testing  '
)' (
. 
Include 
( 
c 
=> 
c 
.  
Approved  (
)( )
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
;0 1
Session 
[ 
$str 
] 
= 
id 
; 
Session 
[ 
$str !
]! "
=# $
campaign% -
.- .
OrderNumber. 9
;9 :
if 
( 
campaign 
. 
Testing  
==! #
null$ (
)( )
{ 
TempData   
[   
$str    
]    !
=  " #
$str  $ H
;  H I
return!! 
RedirectToAction!! '
(!!' (
$str!!( /
,!!/ 0
$str!!1 <
)!!< =
;!!= >
}"" 
if$$ 
($$ 
campaign$$ 
.$$ 
Approved$$ !
==$$" $
null$$% )
)$$) *
{%% 
var&& 
testing&& 
=&& 
campaign&& &
.&&& '
Testing&&' .
;&&. /
var'' 

approvedId'' 
=''  
Guid''! %
.''% &
NewGuid''& -
(''- .
)''. /
;''/ 0
var(( 
approved(( 
=(( 
new(( "
CampaignApproved((# 3
(((3 4
)((4 5
{)) 
Id** 
=** 

approvedId** #
,**# $

CampaignId++ 
=++  
campaign++! )
.++) *
Id++* ,
,++, -
	CreatedAt,, 
=,, 
DateTime,,  (
.,,( )
Now,,) ,
,,,, -
	CreatedBy-- 
=-- 
campaign--  (
.--( )
	CreatedBy--) 2
,--2 3
CampaignName..  
=..! "
testing..# *
...* +
CampaignName..+ 7
,..7 8

WhiteLabel// 
=//  
testing//! (
.//( )

WhiteLabel//) 3
,//3 4
ReBroadCast00 
=00  !
testing00" )
.00) *
ReBroadCast00* 5
,005 6
ReBroadcastDate11 #
=11$ %
testing11& -
.11- .
ReBroadcastDate11. =
,11= >
FromLine22 
=22 
testing22 &
.22& '
FromLine22' /
,22/ 0
SubjectLine33 
=33  !
testing33" )
.33) *
SubjectLine33* 5
,335 6

DeployDate44 
=44  
testing44! (
.44( )

DeployDate44) 3
,443 4

GeoDetails66 
=66  
testing66! (
.66( )

GeoDetails66) 3
,663 4
Demographics77  
=77! "
testing77# *
.77* +
Demographics77+ 7
,777 8
Quantity88 
=88 
testing88 &
.88& '
Quantity88' /
,88/ 0
SpecialInstructions99 '
=99( )
testing99* 1
.991 2
SpecialInstructions992 E
,99E F
ReportSiteLink:: "
=::# $
$"::% '(
http://report-site.com/c/ADS::' C
{::C D
campaign::D L
.::L M
OrderNumber::M X
}::X Y
"::Y Z
,::Z [
LinkBreakout;;  
=;;! "
$";;# %/
#http://www.digitaldynamixs.net/ep2/;;% H
{;;H I
campaign;;I Q
.;;Q R
OrderNumber;;R ]
};;] ^
/;;^ _
{;;_ `
campaign;;` h
.;;h i
OrderNumber;;i t
};;t u
	linkr.csv;;u ~
";;~ 
,	;; �
IsOpenPixel<< 
=<<  !
testing<<" )
.<<) *
IsOpenPixel<<* 5
,<<5 6
OpenPixelUrl==  
===! "
testing==# *
.==* +
OpenPixelUrl==+ 7
,==7 8
	OpenGoals>> 
=>> 
testing>>  '
.>>' (
	OpenGoals>>( 1
,>>1 2

ClickGoals?? 
=??  
testing??! (
.??( )

ClickGoals??) 3
,??3 4
DataFileQuantity@@ $
=@@% &
testing@@' .
.@@. /
DataFileQuantity@@/ ?
,@@? @
DataFileUrlAA 
=AA  !
testingAA" )
.AA) *
DataFileUrlAA* 5
,AA5 6
IsOmniOrderCC 
=CC  !
testingCC" )
.CC) *
IsOmniOrderCC* 5
,CC5 6
OmniDeployDateDD "
=DD# $
testingDD% ,
.DD, -
OmniDeployDateDD- ;
,DD; <
ImpressionsEE 
=EE  !
testingEE" )
.EE) *
ImpressionsEE* 5
,EE5 6
ChannelTypesFF  
=FF! "
testingFF# *
.FF* +
ChannelTypesFF+ 7
,FF7 8
}GG 
;GG 
DbHH 
.HH 
CampaignsApprovedHH $
.HH$ %
AddHH% (
(HH( )
approvedHH) 1
)HH1 2
;HH2 3
DbII 
.II 
SaveChangesII 
(II 
)II  
;II  !
campaignJJ 
.JJ 

ApprovedIdJJ #
=JJ$ %

approvedIdJJ& 0
;JJ0 1
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
.MM1 2
ApprovedMM2 :
;MM: ;
DbNN 
.NN 
SaveChangesNN 
(NN 
)NN 
;NN 
returnOO 
RedirectToActionOO #
(OO# $
$strOO$ 2
,OO2 3
$strOO4 >
,OO> ?
newOO@ C
{OOD E
idOOF H
=OOI J
campaignOOK S
.OOS T

ApprovedIdOOT ^
}OO_ `
)OO` a
;OOa b
}QQ 	
publicTT 
ActionResultTT 
EditApprovedTT (
(TT( )
GuidTT) -
?TT- .
idTT/ 1
)TT1 2
{UU 	
CampaignApprovedVV 
campaignApprovedVV -
=VV. /
DbVV0 2
.VV2 3
CampaignsApprovedVV3 D
.VVD E
FirstOrDefaultVVE S
(VVS T
cVVT U
=>VVV X
cVVY Z
.VVZ [
IdVV[ ]
==VV^ `
idVVa c
)VVc d
;VVd e
ifWW 
(WW 
campaignApprovedWW  
==WW! #
nullWW$ (
)WW( )
{XX 
throwYY 
newYY 

(YY' (
$numYY( +
,YY+ ,
$strYY- 8
)YY8 9
;YY9 :
}ZZ 

TinyMapper\\ 
.\\ 
Bind\\ 
<\\ 
CampaignApproved\\ ,
,\\, -
CampaignApprovedVm\\. @
>\\@ A
(\\A B
config\\B H
=>\\I K
{]] 
config^^ 
.^^ 
Ignore^^ 
(^^ 
x^^ 
=>^^  "
x^^# $
.^^$ %
ChannelTypes^^% 1
)^^1 2
;^^2 3
}__ 
)__
;__ 
varaa 
campaignApprovedVmaa "
=aa# $

TinyMapperaa% /
.aa/ 0
Mapaa0 3
<aa3 4
CampaignApprovedVmaa4 F
>aaF G
(aaG H
campaignApprovedaaH X
)aaX Y
;aaY Z
Campaignbb 
campaignbb 
=bb 
Dbbb  "
.bb" #
	Campaignsbb# ,
.cc 
Includecc 
(cc 
xcc 
=>cc  
xcc! "
.cc" #
Assetscc# )
)cc) *
.dd 
Includedd 
(dd 
xdd 
=>dd  
xdd! "
.dd" #
Segmentsdd# +
)dd+ ,
.ee 
FirstOrDefaultee "
(ee" #
xee# $
=>ee% '
xee( )
.ee) *
Idee* ,
==ee- /
campaignApprovedVmee0 B
.eeB C

CampaignIdeeC M
)eeM N
;eeN O
campaignApprovedVmff 
.ff 
OrderNumberff *
=ff+ ,
campaignff- 5
.ff5 6
OrderNumberff6 A
;ffA B
campaignApprovedVmgg 
.gg 
Assetsgg %
=gg& '
campaigngg( 0
.gg0 1
Assetsgg1 7
;gg7 8
foreachhh 
(hh 
varhh 
segmenthh  
inhh! #
campaignhh$ ,
.hh, -
Segmentshh- 5
)hh5 6
{ii 
varjj 
	segmentVmjj 
=jj 

TinyMapperjj  *
.jj* +
Mapjj+ .
<jj. /
CampaignSegmentVmjj/ @
>jj@ A
(jjA B
segmentjjB I
)jjI J
;jjJ K
campaignApprovedVmkk "
.kk" #
Segmentskk# +
.kk+ ,
Addkk, /
(kk/ 0
	segmentVmkk0 9
)kk9 :
;kk: ;
}ll 
campaignApprovedVmnn 
.nn 
ChannelTypesnn +
=nn, -
stringnn. 4
.nn4 5

(nnB C
campaignApprovednnC S
.nnS T
ChannelTypesnnT `
)nn` a
?nnb c
newnnd g
Listnnh l
<nnl m
ChannelTypennm x
>nnx y
{nnz {
}nn| }
:nn~ 
campaignApprovedoo  
.oo  !
ChannelTypesoo! -
.pp 
Splitpp 
(pp 
$strpp 
.pp 
ToCharArraypp *
(pp* +
)pp+ ,
)pp, -
.qq 
Selectqq 
(qq 
xqq 
=>qq  
(qq! "
ChannelTypeqq" -
)qq- .
Systemqq. 4
.qq4 5
Enumqq5 9
.qq9 :
Parseqq: ?
(qq? @
typeofqq@ F
(qqF G
ChannelTypeqqG R
)qqR S
,qqS T
xqqU V
)qqV W
)qqW X
.qqX Y
ToListqqY _
(qq_ `
)qq` a
;qqa b
varss 
proDatass 
=ss 
VendorsListss %
.ss% &
FirstOrDefaultss& 4
(ss4 5
xss5 6
=>ss7 9
xss: ;
.ss; <
Textss< @
.ss@ A
ToLowerInvariantssA Q
(ssQ R
)ssR S
.ssS T
ContainsssT \
(ss\ ]
$strss] b
)ssb c
)ssc d
;ssd e
ViewBagtt 
.tt 
Vendortt 
=tt 
newtt  

SelectListtt! +
(tt+ ,
VendorsListtt, 7
,tt7 8
$strtt9 @
,tt@ A
$strttB H
,ttH I
proDatattJ Q
)ttQ R
;ttR S
ViewBaguu 
.uu 

WhiteLabeluu 
=uu  
newuu! $

SelectListuu% /
(uu/ 0

,uu= >
$struu? F
,uuF G
$struuH N
,uuN O
campaignApprovedVmuuP b
.uub c

WhiteLabeluuc m
)uum n
;uun o
returnvv 
Viewvv 
(vv 
campaignApprovedVmvv *
)vv* +
;vv+ ,
}ww 	
[yy 	
HttpPostyy	 
]yy 
[zz 	$
ValidateAntiForgeryTokenzz	 !
]zz! "
public{{ 
ActionResult{{ 
EditApproved{{ (
({{( )
[{{) *
Bind{{* .
({{. /
Include{{/ 6
={{7 8
$str	{{9 �
)
{{� �
]
{{� � 
CampaignApprovedVm
{{� � 
campaignApprovedVm
{{� �
)
{{� �
{|| 	
if}} 
(}} 

ModelState}} 
.}} 
IsValid}} "
)}}" #
{~~ 

TinyMapper
�� 
.
�� 
Bind
�� 
<
��   
CampaignApprovedVm
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
��( )
OrderVia
��) 1
via
��2 5
,
��5 6
Guid
��7 ;
?
��; <
vendorId
��= E
,
��E F
Guid
��G K
?
��K L
id
��M O
,
��O P
string
��Q W
[
��W X
]
��X Y
segmentsSelected
��Z j
)
��j k
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
�� 
switch
�� 
(
�� 
via
�� 
)
�� 
{
�� 
case
�� 
OrderVia
�� %
.
��% &
Email
��& +
:
��+ ,

�� )
.
��) *
Enqueue
��* 1
(
��1 2
(
��2 3
)
��3 4
=>
��5 7
CampaignProcessor
��8 I
.
��I J
SendToVendor
��J V
(
��V W
via
��W Z
,
��Z [
vendorId
��\ d
,
��d e
campaign
��f n
.
��n o
OrderNumber
��o z
,
��z {
segmentsSelected��| �
,��� �
string��� �
.��� �
Empty��� �
)��� �
)��� �
;��� �
break
�� 
;
�� 
case
�� 
OrderVia
�� %
.
��% &
Api
��& )
:
��) *
string
�� "

whiteLabel
��# -
=
��. /
string
��0 6
.
��6 7

��7 D
(
��D E
LoggedInUser
��E Q
?
��Q R
.
��R S

WhiteLabel
��S ]
)
��] ^
?
��_ `
$str
��a f
:
��g h
LoggedInUser
��i u
?
��u v
.
��v w

WhiteLabel��w �
;��� �
string
�� "
whiteLabelDomain
��# 3
=
��4 5

��6 C
.
��C D
FirstOrDefault
��D R
(
��R S
x
��S T
=>
��U W
x
��X Y
.
��Y Z
Value
��Z _
==
��` b

whiteLabel
��c m
)
��m n
?
��n o
.
��o p
Text
��p t
.
��t u
Split
��u z
(
��z {
$str
��{ ~
.
��~ 
ToCharArray�� �
(��� �
)��� �
)��� �
.��� �

(��� �
)��� �
?��� �
.��� �
Trim��� �
(��� �
$str��� �
.��� �
ToCharArray��� �
(��� �
)��� �
)��� �
;��� �
CampaignProcessor
�� -
.
��- .
SendToVendor
��. :
(
��: ;
via
��; >
,
��> ?
vendorId
��@ H
,
��H I
campaign
��J R
.
��R S
OrderNumber
��S ^
,
��^ _
segmentsSelected
��` p
,
��p q
whiteLabelDomain��r �
)��� �
;��� �
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
}�� ��
ME:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\BaseController.cs
	namespace

 
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
��1 5
+
��6 7
x
��8 9
.
��9 :
	WebDomain
��: C
+
��D E
$str
��F I
,
��I J
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
}�� �6
UE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\NotificationController.cs
	namespace		 	

 
.		 
Web		 
.		 
Controllers		 '
{

 
[ 
	Authorize 
] 
public 

class "
NotificationController '
:( )
BaseController* 8
{
public 
ActionResult 
Index !
(! "
CampaignSearchVm" 2
sc3 5
)5 6
{ 	
var 

= 
Db  "
." #

.0 1
Where1 6
(6 7
x7 8
=>9 ;
x< =
.= >
Status> D
==E G
(H I
intI L
)L M
NotificationStatusM _
._ `
Found` e
)e f
.f g
ToListg m
(m n
)n o
;o p
int 

pageNumber 
= 
( 
sc  
.  !
Page! %
??& (
$num) *
)* +
;+ ,
return 
View 
( 

.% &
ToPagedList& 1
(1 2

pageNumber2 <
,< =
PageSize> F
)F G
)G H
;H I
} 	
public 
ActionResult 
Settings $
($ %
)% &
{ 	

SettingsVm 
sc 
= 
new 

SettingsVm  *
(* +
)+ ,
;, -
var 
settingAuto 
= 
Db  
.  !
Settings! )
.) *
FirstOrDefault* 8
(8 9
x9 :
=>; =
x> ?
.? @
Key@ C
==D F
StringConstantsG V
.V W"
KeyAutoProcessTrackingW m
)m n
;n o
if 
( 
settingAuto 
!= 
null #
)# $
sc% '
.' (!
IsAutoProcessTracking( =
=> ?
int@ C
.C D
ParseD I
(I J
settingAutoJ U
.U V
ValueV [
)[ \
==] _
$num` a
;a b
var $
settingSendNotifications (
=) *
Db+ -
.- .
Settings. 6
.6 7
FirstOrDefault7 E
(E F
xF G
=>H J
xK L
.L M
KeyM P
==Q S
StringConstantsT c
.c d%
KeySendNotificationEmailsd }
)} ~
;~ 
if 
( $
settingSendNotifications (
!=) +
null, 0
)0 1
sc2 4
.4 5$
IsSendNotificationEmails5 M
=N O
intP S
.S T
ParseT Y
(Y Z$
settingSendNotificationsZ r
.r s
Values x
)x y
==z |
$num} ~
;~ 
return 
View 
( 
sc 
) 
; 
}   	
["" 	
HttpPost""	 
]"" 
public## 
ActionResult## 
Settings## $
(##$ %

SettingsVm##% /
sc##0 2
)##2 3
{$$ 	
var%% 
settingAuto%% 
=%% 
Db%%  
.%%  !
Settings%%! )
.%%) *
FirstOrDefault%%* 8
(%%8 9
x%%9 :
=>%%; =
x%%> ?
.%%? @
Key%%@ C
==%%D F
StringConstants%%G V
.%%V W"
KeyAutoProcessTracking%%W m
)%%m n
;%%n o
if&& 
(&& 
settingAuto&& 
==&& 
null&& #
)&&# $
{'' 
Db(( 
.(( 
Settings(( 
.(( 
Add(( 
(((  
new((  #
Settings(($ ,
{)) 
Id** 
=** 
Guid** 
.** 
NewGuid** %
(**% &
)**& '
,**' (
	CreatedAt++ 
=++ 
DateTime++  (
.++( )
Now++) ,
,++, -
Key,, 
=,, 
StringConstants,, )
.,,) *"
KeyAutoProcessTracking,,* @
,,,@ A
Value-- 
=-- 
sc-- 
.-- !
IsAutoProcessTracking-- 4
?--5 6
$str--7 :
:--; <
$str--= @
}.. 
).. 
;.. 
}// 
else00 
{11 
settingAuto22 
.22 
Value22 !
=22" #
sc22$ &
.22& '!
IsAutoProcessTracking22' <
?22= >
$str22? B
:22C D
$str22E H
;22H I
}33 
var44 $
settingSendNotifications44 (
=44) *
Db44+ -
.44- .
Settings44. 6
.446 7
FirstOrDefault447 E
(44E F
x44F G
=>44H J
x44K L
.44L M
Key44M P
==44Q S
StringConstants44T c
.44c d%
KeySendNotificationEmails44d }
)44} ~
;44~ 
if55 
(55 $
settingSendNotifications55 (
==55) +
null55, 0
)550 1
{66 
Db77 
.77 
Settings77 
.77 
Add77 
(77  
new77  #
Settings77$ ,
{88 
Id99 
=99 
Guid99 
.99 
NewGuid99 %
(99% &
)99& '
,99' (
	CreatedAt:: 
=:: 
DateTime::  (
.::( )
Now::) ,
,::, -
Key;; 
=;; 
StringConstants;; )
.;;) *%
KeySendNotificationEmails;;* C
,;;C D
Value<< 
=<< 
sc<< 
.<< $
IsSendNotificationEmails<< 7
?<<8 9
$str<<: =
:<<> ?
$str<<@ C
}== 
)== 
;== 
}>> 
else?? 
{@@ 
settingSendNotificationsAA (
.AA( )
ValueAA) .
=AA/ 0
scAA1 3
.AA3 4$
IsSendNotificationEmailsAA4 L
?AAM N
$strAAO R
:AAS T
$strAAU X
;AAX Y
}BB 
DbCC 
.CC 
SaveChangesCC 
(CC 
)CC 
;CC 
TempDataDD 
[DD 
$strDD 
]DD 
=DD  !
$strDD" U
;DDU V
returnEE 
RedirectToActionEE #
(EE# $
$strEE$ .
)EE. /
;EE/ 0
}FF 	
}
�� 
}�� ��
OE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\StatusController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
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
CampaignSearchVm" 2
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
ClearSessionId) 7
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
BasicString 
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
	SortOrder% .
;. /
ViewBag 
.  
CampaignNameSortParm (
=) *
sc+ -
.- .
	SortOrder. 7
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
	SortOrder/ 8
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
	SortOrder+ 4
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
	SortOrder( 1
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
	SortOrder- 6
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
	SortOrder''  
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

SearchTypeLL$ .
;LL. /
ifMM 
(MM 
scMM 
.MM 

SearchTypeMM 
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
BasicStringOO- 8
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
BasicStringRR, 7
)RR7 8
||RR9 ;
sSS 
.SS $
ReBroadcastedOrderNumberSS .
==SS/ 1
scSS2 4
.SS4 5
BasicStringSS5 @
||SSA C
sTT 
.TT 
CampaignNameTT "
.TT" #
IndexOfTT# *
(TT* +
scTT+ -
.TT- .
BasicStringTT. 9
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
BasicStringUU5 @
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
BasicStatusWW2 =
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
BasicStatusYY. 9
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
BasicStatus``5 @
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
BasicOrderNumberbb2 B
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
BasicOrderNumberddO _
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

SearchTypegg "
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
AdvancedStatusii- ;
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
AdvancedStatuskk. <
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
AdvancedStatuspp8 F
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
AdvancedUserrr- 9
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
AdvancedUserttG S
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
AdvancedUseruu6 B
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
CampaignNamexx- 9
)xx9 :
)xx: ;
{yy 
sczz 
.zz 
CampaignNamezz #
=zz$ %
sczz& (
.zz( )
CampaignNamezz) 5
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
CampaignName{{O [
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
CampaignName||. :
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
IsTested- 5
)5 6
)6 7
{
�� 
bool
�� 
isTested
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
IsTested
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
isTested
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
IsTested
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
OrderedFrom
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
OrderedFrom
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
OrderedFrom
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
	OrderedTo
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
	OrderedTo
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
	OrderedTo
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
BroadcastTo
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
BroadcastTo
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
BroadcastTo
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
Page
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
id
��1 3
,
��3 4
string
��5 ;
userId
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
campaign
�� 
.
��  
AssignedToCustomer
�� +
=
��, -
userId
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
}�� ҝ
RE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\CampaignsController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
{ 
[ 
	Authorize 
] 
public 

class 
CampaignsController $
:% &
BaseController' 5
{ 
private 
static 
char 
_c1 
;  
public 
ActionResult 
Index !
(! "
CampaignSearchVm" 2
sc3 5
)5 6
{ 	
CampaignProcessor 
. 
ProcessNewOrder -
(- .
$str. 4
,4 5
LoggedInUser6 B
.B C
UserNameC K
)K L
;L M
if 
( 
LoggedInUser 
== 
null  $
)$ %
return& ,
RedirectToAction- =
(= >
$str> F
,F G
$strH Q
)Q R
;R S
ViewBag   
.   
CurrentSort   
=    !
sc  " $
.  $ %
	SortOrder  % .
;  . /
ViewBag!! 
.!! 
OrderNumberSortParm!! '
=!!( )
sc!!* ,
.!!, -
	SortOrder!!- 6
==!!7 9
$str!!: G
?!!H I
$str!!J \
:!!] ^
$str!!_ l
;!!l m
ViewBag"" 
.""  
CampaignNameSortParm"" (
="") *
sc""+ -
.""- .
	SortOrder"". 7
==""8 :
$str""; I
?""J K
$str""L _
:""` a
$str""b p
;""p q
ViewBag## 
.## 
CreatedBySortParm## %
=##& '
sc##( *
.##* +
	SortOrder##+ 4
==##5 7
$str##8 C
?##D E
$str##F V
:##W X
$str##Y d
;##d e
ViewBag$$ 
.$$ 
CreatedAtSortParm$$ %
=$$& '
sc$$( *
.$$* +
	SortOrder$$+ 4
==$$5 7
$str$$8 C
?$$D E
$str$$F V
:$$W X
$str$$Y d
;$$d e
ViewBag%% 
.%% 
DeployDateSortParm%% &
=%%' (
sc%%) +
.%%+ ,
	SortOrder%%, 5
==%%6 8
$str%%9 E
?%%F G
$str%%H Y
:%%Z [
$str%%\ h
;%%h i
ViewBag&& 
.&& 
QuantitySortParm&& $
=&&% &
sc&&' )
.&&) *
	SortOrder&&* 3
==&&4 6
$str&&7 A
?&&B C
$str&&D S
:&&T U
$str&&V `
;&&` a
ViewBag'' 
.'' 
StatusSortParm'' "
=''# $
sc''% '
.''' (
	SortOrder''( 1
==''2 4
$str''5 =
?''> ?
$str''@ M
:''N O
$str''P X
;''X Y
var)) 
	campagins)) 
=)) 
Db** 
.** 
	Campaigns** 
.++ 
Include++ 
(++ 
x++ 
=>++ 
x++ 
.++  
Testing++  '
)++' (
.,, 
Include,, 
(,, 
x,, 
=>,, 
x,, 
.,,  
Approved,,  (
),,( )
.-- 
Include-- 
(-- 
x-- 
=>-- 
x-- 
.--  
Segments--  (
)--( )
... 
ToList.. 
(.. 
).. 
;.. 
switch00 
(00 
sc00 
.00 
	SortOrder00  
)00  !
{11 
case22 
$str22 "
:22" #
	campagins33 
=33 
	campagins33  )
.33) *
OrderBy33* 1
(331 2
s332 3
=>334 6
s337 8
.338 9
OrderNumber339 D
)33D E
.33E F
ToList33F L
(33L M
)33M N
;33N O
break44 
;44 
case55 
$str55 '
:55' (
	campagins66 
=66 
	campagins66  )
.66) *
OrderByDescending66* ;
(66; <
s66< =
=>66> @
s66A B
.66B C
OrderNumber66C N
)66N O
.66O P
ToList66P V
(66V W
)66W X
;66X Y
break77 
;77 
case88 
$str88 #
:88# $
	campagins99 
=99 
	campagins99  )
.99) *
OrderBy99* 1
(991 2
s992 3
=>994 6
s997 8
.998 9
CampaignName999 E
)99E F
.99F G
ToList99G M
(99M N
)99N O
;99O P
break:: 
;:: 
case;; 
$str;; (
:;;( )
	campagins<< 
=<< 
	campagins<<  )
.<<) *
OrderByDescending<<* ;
(<<; <
s<<< =
=><<> @
s<<A B
.<<B C
CampaignName<<C O
)<<O P
.<<P Q
ToList<<Q W
(<<W X
)<<X Y
;<<Y Z
break== 
;== 
case>> 
$str>>  
:>>  !
	campagins?? 
=?? 
	campagins??  )
.??) *
OrderBy??* 1
(??1 2
s??2 3
=>??4 6
s??7 8
.??8 9
	CreatedBy??9 B
)??B C
.??C D
ToList??D J
(??J K
)??K L
;??L M
break@@ 
;@@ 
caseAA 
$strAA %
:AA% &
	campaginsBB 
=BB 
	campaginsBB  )
.BB) *
OrderByDescendingBB* ;
(BB; <
sBB< =
=>BB> @
sBBA B
.BBB C
	CreatedByBBC L
)BBL M
.BBM N
ToListBBN T
(BBT U
)BBU V
;BBV W
breakCC 
;CC 
caseDD 
$strDD  
:DD  !
	campaginsEE 
=EE 
	campaginsEE  )
.EE) *
OrderByEE* 1
(EE1 2
sEE2 3
=>EE4 6
sEE7 8
.EE8 9
	CreatedAtEE9 B
)EEB C
.EEC D
ToListEED J
(EEJ K
)EEK L
;EEL M
breakFF 
;FF 
caseGG 
$strGG %
:GG% &
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
;II 
caseJJ 
$strJJ $
:JJ$ %
	campaginsKK 
=KK 
	campaginsKK  )
.KK) *
OrderByKK* 1
(KK1 2
sKK2 3
=>KK4 6
sKK7 8
.KK8 9

)KKF G
.KKG H
ToListKKH N
(KKN O
)KKO P
;KKP Q
breakLL 
;LL 
caseMM 
$strMM )
:MM) *
	campaginsNN 
=NN 
	campaginsNN  )
.NN) *
OrderByDescendingNN* ;
(NN; <
sNN< =
=>NN> @
sNNA B
.NNB C

)NNP Q
.NNQ R
ToListNNR X
(NNX Y
)NNY Z
;NNZ [
breakOO 
;OO 
casePP 
$strPP 
:PP  
	campaginsQQ 
=QQ 
	campaginsQQ  )
.QQ) *
OrderByQQ* 1
(QQ1 2
sQQ2 3
=>QQ4 6
sQQ7 8
.QQ8 9
QuantityQQ9 A
)QQA B
.QQB C
ToListQQC I
(QQI J
)QQJ K
;QQK L
breakRR 
;RR 
caseSS 
$strSS $
:SS$ %
	campaginsTT 
=TT 
	campaginsTT  )
.TT) *
OrderByDescendingTT* ;
(TT; <
sTT< =
=>TT> @
sTTA B
.TTB C
QuantityTTC K
)TTK L
.TTL M
ToListTTM S
(TTS T
)TTT U
;TTU V
breakUU 
;UU 
caseVV 
$strVV 
:VV 
	campaginsWW 
=WW 
	campaginsWW  )
.WW) *
OrderByWW* 1
(WW1 2
sWW2 3
=>WW4 6
sWW7 8
.WW8 9
StatusWW9 ?
)WW? @
.WW@ A
ToListWWA G
(WWG H
)WWH I
;WWI J
breakXX 
;XX 
caseYY 
$strYY "
:YY" #
	campaginsZZ 
=ZZ 
	campaginsZZ  )
.ZZ) *
OrderByDescendingZZ* ;
(ZZ; <
sZZ< =
=>ZZ> @
sZZA B
.ZZB C
StatusZZC I
)ZZI J
.ZZJ K
ToListZZK Q
(ZZQ R
)ZZR S
;ZZS T
break[[ 
;[[ 
default\\ 
:\\ 
	campagins]] 
=]] 
	campagins]]  )
.]]) *
OrderByDescending]]* ;
(]]; <
s]]< =
=>]]> @
s]]A B
.]]B C
	CreatedAt]]C L
)]]L M
.]]M N
ToList]]N T
(]]T U
)]]U V
;]]V W
break^^ 
;^^ 
}__ 
ViewBagaa 
.aa 

SearchTypeaa 
=aa  
scaa! #
.aa# $

SearchTypeaa$ .
;aa. /
ifbb 
(bb 
scbb 
.bb 

SearchTypebb 
==bb  
$strbb! (
)bb( )
{cc 
ifdd 
(dd 
!dd 
stringdd 
.dd 

(dd) *
scdd* ,
.dd, -
BasicStringdd- 8
)dd8 9
)dd9 :
{ee 
	campaginsff 
=ff 
	campaginsff  )
.ff) *
Whereff* /
(ff/ 0
sff0 1
=>ff2 4
sgg 
.gg 
OrderNumbergg !
.gg! "
Equalsgg" (
(gg( )
scgg) +
.gg+ ,
BasicStringgg, 7
)gg7 8
||gg9 ;
shh 
.hh $
ReBroadcastedOrderNumberhh .
==hh/ 1
schh2 4
.hh4 5
BasicStringhh5 @
||hhA C
sii 
.ii 
CampaignNameii "
.ii" #
IndexOfii# *
(ii* +
scii+ -
.ii- .
BasicStringii. 9
,ii9 :
StringComparisonii; K
.iiK L&
InvariantCultureIgnoreCaseiiL f
)iif g
>=iih j
$numiik l
)iil m
.iim n
ToListiin t
(iit u
)iiu v
;iiv w
ViewBagjj 
.jj 
BasicStringSearchedjj /
=jj0 1
scjj2 4
.jj4 5
BasicStringjj5 @
;jj@ A
}kk 
elsekk 
ifkk 
(kk 
!kk 
stringkk "
.kk" #

(kk0 1
sckk1 3
.kk3 4
BasicStatuskk4 ?
)kk? @
)kk@ A
{ll 
intmm 
statusmm 
=mm  
intmm! $
.mm$ %
Parsemm% *
(mm* +
scmm+ -
.mm- .
BasicStatusmm. 9
)mm9 :
;mm: ;
ifnn 
(nn 
statusnn 
==nn !
(nn" #
intnn# &
)nn& '
CampaignStatusnn' 5
.nn5 6

)nnC D
	campaginsoo !
=oo" #
	campaginsoo$ -
.oo- .
Whereoo. 3
(oo3 4
soo4 5
=>oo6 8
soo9 :
.oo: ;

)ooH I
.ooI J
ToListooJ P
(ooP Q
)ooQ R
;ooR S
elsepp 
ifpp 
(pp 
statuspp #
==pp$ &
(pp' (
intpp( +
)pp+ ,
CampaignStatuspp, :
.pp: ;
NotRebroadcastedpp; K
)ppK L
	campaginsqq !
=qq" #
	campaginsqq$ -
.qq- .
Whereqq. 3
(qq3 4
sqq4 5
=>qq6 8
sqq9 :
.qq: ;
ReBroadCastqq; F
&&qqG I
!qqJ K
sqqK L
.qqL M

)qqZ [
.qq[ \
ToListqq\ b
(qqb c
)qqc d
;qqd e
elserr 
	campaginsss !
=ss" #
	campaginsss$ -
.ss- .
Wheress. 3
(ss3 4
sss4 5
=>ss6 8
sss9 :
.ss: ;
Statusss; A
==ssB D
statusssE K
)ssK L
.ssL M
ToListssM S
(ssS T
)ssT U
;ssU V
ViewBagtt 
.tt 
BasicStatusSearchedtt /
=tt0 1
sctt2 4
.tt4 5
BasicStatustt5 @
;tt@ A
}uu 
elseuu 
ifuu 
(uu 
!uu 
stringuu "
.uu" #

(uu0 1
scuu1 3
.uu3 4
BasicOrderNumberuu4 D
)uuD E
)uuE F
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
.ww6 7
Idww7 9
.ww9 :
ToStringww: B
(wwB C
)wwC D
.wwD E
EqualswwE K
(wwK L
scwwL N
.wwN O
BasicOrderNumberwwO _
)ww_ `
)ww` a
.wwa b
ToListwwb h
(wwh i
)wwi j
;wwj k
}xx 
}zz 
else{{ 
if{{ 
({{ 
sc{{ 
.{{ 

SearchType{{ "
=={{# %
$str{{& 0
){{0 1
{|| 
if}} 
(}} 
!}} 
string}} 
.}} 

(}}) *
sc}}* ,
.}}, -
AdvancedStatus}}- ;
)}}; <
)}}< =
{~~ 
int 
status 
=  
int! $
.$ %
Parse% *
(* +
sc+ -
.- .
AdvancedStatus. <
)< =
;= >
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
AdvancedStatus
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
AdvancedUser
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
AdvancedUser
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
AdvancedUser
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
CampaignName
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
CampaignName
�� #
=
��$ %
sc
��& (
.
��( )
CampaignName
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
CampaignName
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
CampaignName
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
IsTested
��- 5
)
��5 6
)
��6 7
{
�� 
bool
�� 
isTested
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
IsTested
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
isTested
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
IsTested
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
OrderedFrom
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
OrderedFrom
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
OrderedFrom
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
	OrderedTo
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
	OrderedTo
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
	OrderedTo
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
BroadcastTo
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
BroadcastTo
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
BroadcastTo
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
Page
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

CampaignVm
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
��9 :

DeployDate
�� &
=
��' (
x
��) *
.
��* +
Approved
��+ 3
?
��3 4
.
��4 5

DeployDate
��5 ?
??
��@ B
(
��C D
x
��D E
.
��E F
Testing
��F M
?
��M N
.
��N O

DeployDate
��O Y
??
��Z \
x
��] ^
.
��^ _

��_ l
)
��l m
,
��m n
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
��V b
,
��b c
$str
��d n
,
��n o
$str
��p x
}
��y z
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
��# $
_c1
��% (
++
��( *
,
��* +

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
�� 	
_c1
�� 
=
�� 
$char
�� 
;
�� 

CampaignVm
�� 
model
�� 
=
�� 
new
�� "

CampaignVm
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

CampaignVm��� �

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

CampaignVm
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
��- /
CampaignProcessor
��0 A
.
��A B
ProcessNewOrder
��B Q
(
��Q R
campaign
��R Z
.
��Z [
OrderNumber
��[ f
,
��f g
userName
��h p
)
��p q
)
��q r
;
��r s
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
�� 	
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
id
��2 4
,
��4 5
DateTime
��6 >
?
��> ?
reBroadcastedDate
��@ Q
,
��Q R
long
��S W#
reBroadcastedQuantity
��X m
,
��m n
Guid
��o s
?
��s t
vendor
��u {
,
��{ |
string��} �
[��� �
]��� � 
segmentsSelected��� �
)��� �
{
�� 	
if
�� 
(
�� 
reBroadcastedDate
�� !
==
��" $
null
��% )
||
��* ,
vendor
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
id
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
id
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
id
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
reBroadcastedDate
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
reBroadcastedQuantity
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
��9 :
SendToVendor
��: F
(
��F G
OrderVia
��G O
.
��O P
Email
��P U
,
��U V
vendor
��W ]
,
��] ^
campaign
��_ g
.
��g h
OrderNumber
��h s
,
��s t
segmentsSelected��u �
,��� �
String��� �
.��� �
Empty��� �
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
NE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\ErrorController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
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
}&& �g
ME:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\FileController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
{		 
public

 

sealed

 
class

 
FileController

 &
:

' (
BaseController

) 7
{ 
[ 	
HttpPost	 
] 
public

JsonResult

UploadFile
(
UploadFileVm
fileVm
)
{ 	
string 

=! "
$str# %
,% &
filePath' /
=0 1
$str2 4
;4 5
try 
{ 
if 
( 
Request 
. 
Files !
.! "
Count" '
==( *
$num+ ,
), -
throw. 3
new4 7
AdsException8 D
(D E
$strE \
)\ ]
;] ^
var 
fileContent 
=  !
Request" )
.) *
Files* /
[/ 0
$num0 1
]1 2
;2 3
if 
( 
fileContent 
!=  "
null# '
&&( *
fileContent+ 6
.6 7

>E F
$numG H
)H I
{ 
var 
stream 
=  
fileContent! ,
., -
InputStream- 8
;8 9
filePath 
= 
Path #
.# $
Combine$ +
(+ ,

UploadPath, 6
,6 7
fileContent8 C
.C D
FileNameD L
)L M
;M N
using 
( 
var 

fileStream )
=* +
System, 2
.2 3
IO3 5
.5 6
File6 :
.: ;
Create; A
(A B
filePathB J
)J K
)K L
{ 
stream 
. 
CopyTo %
(% &

fileStream& 0
)0 1
;1 2
} 
if 
( 
! 
fileVm 
.  
IsValid  '
(' (
filePath( 0
)0 1
)1 2
{   
throw!! 
new!! !
AdsException!!" .
(!!. /
fileVm!!/ 5
.!!5 6
FileType!!6 >
+!!? @
$str!!A k
)!!k l
;!!l m
}"" 
if$$ 
($$ 
fileVm$$ 
.$$ 
FileType$$ '
==$$( *
$str$$+ 8
)$$8 9
{%% 
string&& 
logoFileName&& +
=&&, -

FileHelper'' &
.''& '
GetValidFileName''' 7
(''7 8
LoggedInUser''8 D
?''D E
.''E F
Id''F H
+''I J
Path''K O
.''O P
GetExtension''P \
(''\ ]
fileContent''] h
.''h i
FileName''i q
)''q r
)''r s
;''s t
string(( 
logoFilePath(( +
=((, -
Path((. 2
.((2 3
Combine((3 :
(((: ;

ImagesPath((; E
,((E F
logoFileName((G S
)((S T
;((T U
System)) 
.)) 
IO)) !
.))! "
File))" &
.))& '
Copy))' +
())+ ,
filePath)), 4
,))4 5
logoFilePath))6 B
,))B C
true))D H
)))H I
;))I J

=**& '
logoFileName**( 4
;**4 5
}++ 
else,, 
if,, 
(,, 
string,, #
.,,# $

(,,1 2
fileVm,,2 8
.,,8 9
OrderNumber,,9 D
),,D E
),,E F
{-- 

=..& '
$"..( *
{..* +
DateTime..+ 3
...3 4
Now..4 7
:..7 8
yyyyMMddHHmmss..8 F
}..F G
_..G H
{..H I
fileContent..I T
...T U
FileName..U ]
}..] ^
"..^ _
;.._ `

.//% &
Upload//& ,
(//, -

,//: ;
filePath//< D
)//D E
;//E F
}00 
else11 
if11 
(11 
!11 
string11 $
.11$ %

(112 3
fileVm113 9
.119 :

)11G H
)11H I
{33 

=44& '
$"44( *
{44* +
fileVm44+ 1
.441 2
OrderNumber442 =
}44= >
/44> ?
{44? @
fileVm44@ F
.44F G

}44T U
	_html.zip44U ^
"44^ _
;44_ `

.55% &
Upload55& ,
(55, -

,55: ;
filePath55< D
,55D E
true55F J
,55J K
true55L P
)55P Q
;55Q R
}66 
else77 
{88 
switch99 
(99  
fileVm99  &
.99& '
FileType99' /
)99/ 0
{:: 
case;;  
$str;;! 7
:;;7 8

=<<. /
string<<0 6
.<<6 7
Format<<7 =
(<<= >
$str<<> P
,<<P Q
fileVm<<R X
.<<X Y
OrderNumber<<Y d
)<<d e
;<<e f
break==  %
;==% &
case>>  
$str>>! 5
:>>5 6

=??. /
string??0 6
.??6 7
Format??7 =
(??= >
$str??> N
,??N O
fileVm??P V
.??V W
OrderNumber??W b
)??b c
;??c d
break@@  %
;@@% &
caseAA  
$strAA! 6
:AA6 7

=BB. /
stringBB0 6
.BB6 7
FormatBB7 =
(BB= >
$strBB> O
,BBO P
fileVmBBQ W
.BBW X
OrderNumberBBX c
)BBc d
;BBd e
breakCC  %
;CC% &
caseDD  
$strDD! 6
:DD6 7

=EE. /
stringEE0 6
.EE6 7
FormatEE7 =
(EE= >
$strEE> O
,EEO P
fileVmEEQ W
.EEW X
OrderNumberEEX c
)EEc d
;EEd e
breakFF  %
;FF% &
caseGG  
$strGG! 5
:GG5 6

=HH. /
stringHH0 6
.HH6 7
FormatHH7 =
(HH= >
$strHH> Q
,HHQ R
fileVmHHS Y
.HHY Z
OrderNumberHHZ e
,HHe f
PathII$ (
.II( )
GetExtensionII) 5
(II5 6
filePathII6 >
)II> ?
)II? @
;II@ A
breakJJ  %
;JJ% &
caseKK  
$strKK! 9
:KK9 :

=LL. /
stringLL0 6
.LL6 7
FormatLL7 =
(LL= >
$strLL> V
,LLV W
fileVmLLX ^
.LL^ _
OrderNumberLL_ j
,LLj k
PathMM$ (
.MM( )
GetExtensionMM) 5
(MM5 6
filePathMM6 >
)MM> ?
)MM? @
;MM@ A
breakNN  %
;NN% &
caseOO  
$strOO! 2
:OO2 3

=PP. /
stringPP0 6
.PP6 7
FormatPP7 =
(PP= >
$strPP> O
,PPO P
fileVmPPQ W
.PPW X
OrderNumberPPX c
,PPc d
PathQQ$ (
.QQ( )
GetExtensionQQ) 5
(QQ5 6
filePathQQ6 >
)QQ> ?
)QQ? @
;QQ@ A
breakRR  %
;RR% &
}SS 

.TT% &
UploadTT& ,
(TT, -

,TT: ;
filePathTT< D
,TTD E
trueTTF J
,TTJ K
trueTTL P
)TTP Q
;TTQ R
}UU 
}VV 
returnXX 
JsonXX 
(XX 
newXX 
JsonResponseXX  ,
(XX, -
)XX- .
{XX/ 0
IsSucessXX0 8
=XX9 :
trueXX; ?
,XX? @
ResultXXA G
=XXH I

}XXW X
)XXX Y
;XXY Z
}YY 
catchZZ 
(ZZ 
	ExceptionZZ 
exZZ 
)ZZ  
{[[ 
return\\ 
Json\\ 
(\\ 
new\\ 
JsonResponse\\  ,
(\\, -
)\\- .
{\\/ 0
IsSucess\\0 8
=\\9 :
false\\; @
,\\@ A
ErrorMessage\\B N
=\\O P
$str\\Q a
+\\b c
ex\\d f
.\\f g
Message\\g n
}\\n o
)\\o p
;\\p q
}]] 
finally^^ 
{__ 
ifaa 
(aa 
Systemaa 
.aa 
IOaa 
.aa 
Fileaa "
.aa" #
Existsaa# )
(aa) *
filePathaa* 2
)aa2 3
)aa3 4
Systembb 
.bb 
IObb 
.bb 
Filebb "
.bb" #
Deletebb# )
(bb) *
filePathbb* 2
)bb2 3
;bb3 4
}cc 
}dd 	
[ff 	
HttpGetff	 
]ff 
publicgg 
ActionResultgg 
DownloadFilegg (
(gg( )
UploadFileVmgg) 5
fileVmgg6 <
)gg< =
{hh 	
stringii 
filePathii 
=ii 
Pathii "
.ii" #
Combineii# *
(ii* +

UploadPathii+ 5
,ii5 6
fileVmii7 =
.ii= >
FileNameii> F
)iiF G
;iiG H
ifjj 
(jj 
fileVmjj 
.jj 
FileTypejj 
==jj  "
$strjj# 0
)jj0 1
{kk 
filePathll 
=ll 
Pathll 
.ll  
Combinell  '
(ll' (

ImagesPathll( 2
,ll2 3
fileVmll4 :
.ll: ;
FileNamell; C
)llC D
;llD E
}mm 
elsenn 
{oo 

.pp 
Downloadpp &
(pp& '
fileVmpp' -
.pp- .
FileNamepp. 6
,pp6 7
filePathpp8 @
)pp@ A
;ppA B
}qq 
returnrr 
Filerr 
(rr 
filePathrr  
,rr  !
$strrr" ,
,rr, -
fileVmrr. 4
.rr4 5
FileNamerr5 =
)rr= >
;rr> ?
}ss 	
[uu 	
HttpPostuu	 
]uu 
publicvv 

JsonResultvv 

DeleteFilevv $
(vv$ %
UploadFileVmvv% 1
fileVmvv2 8
)vv8 9
{ww 	
tryxx 
{yy 
ifzz 
(zz 
fileVmzz 
.zz 
FileTypezz #
==zz$ &
$strzz' 4
)zz4 5
{{{ 
string|| 
filePath|| #
=||$ %
Path||& *
.||* +
Combine||+ 2
(||2 3

ImagesPath||3 =
,||= >
fileVm||? E
.||E F
FileName||F N
)||N O
;||O P
if}} 
(}} 
System}} 
.}} 
IO}} !
.}}! "
File}}" &
.}}& '
Exists}}' -
(}}- .
filePath}}. 6
)}}6 7
)}}7 8
System~~ 
.~~ 
IO~~ !
.~~! "
File~~" &
.~~& '
Delete~~' -
(~~- .
filePath~~. 6
)~~6 7
;~~7 8
} 
else
�� 
{
�� 

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
ME:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\HomeController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
{ 
[ 
	Authorize 
] 
public		 

class		 
HomeController		 
:		  !
BaseController		" 0
{

 
public 
ActionResult 
Index !
(! "
)" #
{ 	
return
RedirectToAction
(
$str
,
$str
)
;
} 	
public 
ActionResult 
Settings $
($ %
)% &
{ 	

profile !
=" #
null$ (
;( )
if 
( 
LoggedInUser 
== 
null  $
)$ %
return& ,
View- 1
(1 2
$str2 <
,< =
(> ?

)L M
nullN R
)R S
;S T
if 
( 
string 
. 

($ %
LoggedInUser% 1
?1 2
.2 3
ApiKey3 9
)9 :
): ;
{ 
var 
user 
= 
Db 
. 
Users #
.# $
FirstOrDefault$ 2
(2 3
x3 4
=>5 7
x8 9
.9 :
Id: <
=== ?
LoggedInUser@ L
.L M
IdM O
)O P
;P Q
if 
( 
user 
!= 
null  
)  !
user" &
.& '
ApiKey' -
=. /
KeyGenerator0 <
.< =
GetUniqueKey= I
(I J
$numJ L
)L M
;M N
Db 
. 
SaveChanges 
( 
)  
;  !
SetupLoggedInUser !
(! "
LoggedInUser" .
.. /
UserName/ 7
)7 8
;8 9
} 
profile 
= 
new 

(' (
)( )
{   
UserName!! 
=!! 
LoggedInUser!! '
.!!' (
UserName!!( 0
,!!0 1
	FirstName"" 
="" 
LoggedInUser"" (
.""( )
	FirstName"") 2
,""2 3
LastName## 
=## 
LoggedInUser## '
.##' (
LastName##( 0
,##0 1
Email$$ 
=$$ 
LoggedInUser$$ $
.$$$ %
Email$$% *
,$$* +
CompanyName%% 
=%% 
LoggedInUser%% *
.%%* +
CompanyName%%+ 6
,%%6 7

WhiteLabel&& 
=&& 
LoggedInUser&& )
.&&) *

WhiteLabel&&* 4
,&&4 5
CompanyLogo'' 
='' 
LoggedInUser'' *
.''* +
CompanyLogo''+ 6
,''6 7
ReportTemplate(( 
=((  
LoggedInUser((! -
.((- .
ReportTemplate((. <
,((< =
	IsUsesApi)) 
=)) 
LoggedInUser)) (
.))( )
	IsUsesApi))) 2
,))2 3
ApiKey** 
=** 
LoggedInUser** %
.**% &
ApiKey**& ,
,**, -
}++ 
;++
ViewBag-- 
.-- 
ReportTemplate-- "
=--# $
new--% (

SelectList--) 3
(--3 4
ReportTemplates--4 C
,--C D
$str--E L
,--L M
$str--N T
,--T U
profile--V ]
.--] ^
ReportTemplate--^ l
)--l m
;--m n
return// 
View// 
(// 
$str// "
,//" #
profile//$ +
)//+ ,
;//, -
}00 	
[22 	
HttpPost22	 
]22 
public33 
ActionResult33 
Settings33 $
(33$ %

profile333 :
)33: ;
{44 	
var55 
user55 
=55 
Db55 
.55 
Users55 
.55  
FirstOrDefault55  .
(55. /
x55/ 0
=>551 3
x554 5
.555 6
Id556 8
==559 ;
LoggedInUser55< H
.55H I
Id55I K
)55K L
;55L M
if66 
(66 
user66 
==66 
null66 
)66 
return66 $
View66% )
(66) *
$str66* 1
)661 2
;662 3
user88 
.88 
	FirstName88 
=88 
profile88 $
.88$ %
	FirstName88% .
;88. /
user99 
.99 
LastName99 
=99 
profile99 #
.99# $
LastName99$ ,
;99, -
user:: 
.:: 
Email:: 
=:: 
profile::  
.::  !
Email::! &
;::& '
user;; 
.;; 
CompanyName;; 
=;; 
profile;; &
.;;& '
CompanyName;;' 2
;;;2 3
user<< 
.<< 

WhiteLabel<< 
=<< 
profile<< %
.<<% &

WhiteLabel<<& 0
;<<0 1
user== 
.== 
CompanyLogo== 
=== 
profile== &
.==& '
CompanyLogo==' 2
;==2 3
user>> 
.>> 
ReportTemplate>> 
=>>  !
profile>>" )
.>>) *
ReportTemplate>>* 8
;>>8 9
Db?? 
.?? 
SaveChanges?? 
(?? 
)?? 
;?? 
SetupLoggedInUserAA 
(AA 
LoggedInUserAA *
.AA* +
UserNameAA+ 3
)AA3 4
;AA4 5
ViewBagCC 
.CC 
ReportTemplateCC "
=CC# $
newCC% (

SelectListCC) 3
(CC3 4
ReportTemplatesCC4 C
,CCC D
$strCCE L
,CCL M
$strCCM S
,CCS T
profileCCU \
.CC\ ]
ReportTemplateCC] k
)CCk l
;CCl m
TempDataDD 
[DD 
$strDD 
]DD 
=DD  !
$strDD" I
;DDI J
returnEE 
RedirectToActionEE #
(EE# $
$strEE$ .
)EE. /
;EE/ 0
}FF 	
}JJ 
}KK ��
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\CreativeController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
{ 
[ 
	Authorize 
] 
public 

class 
CreativeController #
:$ %
BaseController& 4
{ 
public 
ActionResult 
Index !
(! "
Guid" &
id' )
)) *
{ 	
var 
campaign 
= 
Db 
. 
	Campaigns '
. 
Include 
( 
c 
=> 
c 
.  
Assets  &
)& '
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
. 
Include 
( 
c 
=> 
c 
.  
Creative  (
)( )
. 
FirstOrDefault 
(  
c  !
=>" $
c% &
.& '
Id' )
==* ,
id- /
)/ 0
;0 1
Session 
[ 
$str 
] 
= 
id 
; 
Session 
[ 
$str !
]! "
=# $
campaign% -
.- .
OrderNumber. 9
;9 :
var!! 
creative!! 
=!! 
new!! 

CreativeVm!! )
(!!) *
)!!* +
{"" 

CampaignId## 
=## 
campaign## %
.##% &
Id##& (
.##( )
ToString##) 1
(##1 2
)##2 3
,##3 4
OrderNumber$$ 
=$$ 
campaign$$ &
.$$& '
OrderNumber$$' 2
,$$2 3
CampaignName%% 
=%% 
campaign%% '
.%%' (
Testing%%( /
.%%/ 0
CampaignName%%0 <
,%%< =
FromLine&& 
=&& 
campaign&& #
.&&# $
Testing&&$ +
.&&+ ,
FromLine&&, 4
,&&4 5
SubjectLine'' 
='' 
campaign'' &
.''& '
Testing''' .
.''. /
SubjectLine''/ :
,'': ;
TestSeedFile(( 
=(( 
campaign(( '
.((' (
Assets((( .
.((. /
TestSeedFile((/ ;
,((; <
LiveSeedFile)) 
=)) 
campaign)) '
.))' (
Assets))( .
.)). /
LiveSeedFile))/ ;
,)); <
	Creatives** 
=** 
campaign** $
.**$ %
Creative**% -
?**- .
.**. /
CreativeHtml**/ ;
,**; <

TestEmails++ 
=++ 
new++  
List++! %
<++% &
SelectItemPair++& 4
>++4 5
(++5 6
)++6 7
,++7 8

LiveEmails,, 
=,, 
new,,  
List,,! %
<,,% &
SelectItemPair,,& 4
>,,4 5
(,,5 6
),,6 7
}-- 
;--
if// 
(// 
!// 
string// 
.// 

(//% &
campaign//& .
.//. /
Assets/// 5
.//5 6
TestSeedFile//6 B
)//B C
)//C D
{00 
string11 
filePath11 
=11  !
Path11" &
.11& '
Combine11' .
(11. /

UploadPath11/ 9
,119 :
campaign11; C
.11C D
Assets11D J
.11J K
TestSeedFile11K W
)11W X
;11X Y
if22 
(22 
!22 
System22 
.22 
IO22 
.22 
File22 "
.22" #
Exists22# )
(22) *
filePath22* 2
)222 3
&&224 6
!227 8
string228 >
.22> ?

(22L M
campaign22M U
.22U V
Assets22V \
.22\ ]
TestSeedFile22] i
)22i j
)22j k

.33! "
Download33" *
(33* +
campaign33+ 3
.333 4
Assets334 :
.33: ;
TestSeedFile33; G
,33G H
filePath33I Q
)33Q R
;33R S
creative44 
.44 

TestEmails44 #
=44$ %
CreativeHelper44& 4
.444 5

ReadEmails445 ?
(44? @
filePath44@ H
)44H I
;44I J
}55 
if77 
(77 
!77 
string77 
.77 

(77% &
campaign77& .
.77. /
Assets77/ 5
.775 6
LiveSeedFile776 B
)77B C
)77C D
{88 
string99 
filePathLive99 #
=99$ %
Path99& *
.99* +
Combine99+ 2
(992 3

UploadPath993 =
,99= >
campaign99? G
.99G H
Assets99H N
.99N O
LiveSeedFile99O [
)99[ \
;99\ ]
if:: 
(:: 
!:: 
System:: 
.:: 
IO:: 
.:: 
File:: #
.::# $
Exists::$ *
(::* +
filePathLive::+ 7
)::7 8
&&::9 ;
!::< =
string::= C
.::C D

(::Q R
campaign::R Z
.::Z [
Assets::[ a
.::a b
LiveSeedFile::b n
)::n o
)::o p

.;;! "
Download;;" *
(;;* +
campaign;;+ 3
.;;3 4
Assets;;4 :
.;;: ;
LiveSeedFile;;; G
,;;G H
filePathLive;;I U
);;U V
;;;V W
creative<< 
.<< 

LiveEmails<< #
=<<$ %
CreativeHelper<<& 4
.<<4 5

ReadEmails<<5 ?
(<<? @
filePathLive<<@ L
)<<L M
;<<M N
}== 
Session?? 
[?? 
$str?? "
]??" #
=??$ %
campaign??& .
.??. /
Assets??/ 5
.??5 6
TestSeedFile??6 B
;??B C
Session@@ 
[@@ 
$str@@ !
]@@! "
=@@# $
campaign@@% -
.@@- .
Assets@@. 4
.@@4 5
TestSeedUrl@@5 @
;@@@ A
SessionAA 
[AA 
$strAA "
]AA" #
=AA$ %
campaignAA& .
.AA. /
AssetsAA/ 5
.AA5 6
LiveSeedFileAA6 B
;AAB C
SessionBB 
[BB 
$strBB !
]BB! "
=BB# $
campaignBB% -
.BB- .
AssetsBB. 4
.BB4 5
LiveSeedUrlBB5 @
;BB@ A
returnCC 
ViewCC 
(CC 
creativeCC  
)CC  !
;CC! "
}DD 	
[FF 	
HttpPostFF	 
]FF 
[GG 	

(GG 
falseGG 
)GG 
]GG 
[HH 	
MultipleButtonHH	 
(HH 
NameHH 
=HH 
$strHH '
,HH' (
ArgumentHH) 1
=HH2 3
$strHH4 :
)HH: ;
]HH; <
publicII 
ActionResultII 
SaveII  
(II  !

CreativeVmII! +
modelII, 1
)II1 2
{JJ 	
tryKK 
{LL 
varMM 
alreayMM 
=MM 
DbMM 
.MM  
CampaignCreativesMM  1
.MM1 2
FirstOrDefaultMM2 @
(MM@ A
xMMA B
=>MMC E
xMMF G
.MMG H

CampaignIdMMH R
.MMR S
ToStringMMS [
(MM[ \
)MM\ ]
==MM^ `
modelMMa f
.MMf g

CampaignIdMMg q
)MMq r
;MMr s
ifNN 
(NN 
alreayNN 
==NN 
nullNN "
)NN" #
{OO 
varPP 

creativeIdPP "
=PP# $
GuidPP% )
.PP) *
NewGuidPP* 1
(PP1 2
)PP2 3
;PP3 4
alreayQQ 
=QQ 
newQQ  
CampaignCreativeQQ! 1
(QQ1 2
)QQ2 3
{RR 
IdSS 
=SS 

creativeIdSS '
,SS' (
	CreatedAtTT !
=TT" #
DateTimeTT$ ,
.TT, -
NowTT- 0
,TT0 1

CampaignIdUU "
=UU# $
GuidUU% )
.UU) *
ParseUU* /
(UU/ 0
modelUU0 5
.UU5 6

CampaignIdUU6 @
)UU@ A
,UUA B
CreativeHtmlVV $
=VV% &
modelVV' ,
.VV, -
	CreativesVV- 6
}WW 
;WW 
DbXX 
.XX 
CampaignCreativesXX (
.XX( )
AddXX) ,
(XX, -
alreayXX- 3
)XX3 4
;XX4 5
varYY 
campaignYY  
=YY! "
DbYY# %
.YY% &
	CampaignsYY& /
.YY/ 0
FirstOrDefaultYY0 >
(YY> ?
cYY? @
=>YYA C
cYYD E
.YYE F
IdYYF H
.YYH I
ToStringYYI Q
(YYQ R
)YYR S
==YYT V
modelYYW \
.YY\ ]

CampaignIdYY] g
)YYg h
;YYh i
campaignZZ 
.ZZ 

CreativeIdZZ '
=ZZ( )

creativeIdZZ* 4
;ZZ4 5
}[[ 
else\\ 
{]] 
alreay^^ 
.^^ 
CreativeHtml^^ '
=^^( )
model^^* /
.^^/ 0
	Creatives^^0 9
;^^9 :
}__ 
Db`` 
.`` 
SaveChanges`` 
(`` 
)``  
;``  !
TempDataaa 
[aa 
$straa "
]aa" #
=aa$ %
$straa& N
;aaN O
}bb 
catchcc 
(cc 
	Exceptioncc 
excc 
)cc  
{dd 
TempDataee 
[ee 
$stree  
]ee  !
=ee" #
$stree$ D
+eeE F
stringeeG M
.eeM N
JoineeN R
(eeR S
$streeS Z
,eeZ [
exee\ ^
.ee^ _
Messageee_ f
)eef g
;eeg h
}ff 
returngg 
RedirectToActiongg #
(gg# $
$strgg$ +
,gg+ ,
newgg- 0
{gg1 2
idgg3 5
=gg6 7
modelgg8 =
.gg= >

CampaignIdgg> H
}ggI J
)ggJ K
;ggK L
}hh 	
publicjj 
ActionResultjj 
	AddToListjj %
(jj% &
stringjj& ,
listjj- 1
,jj1 2
stringjj3 9
emailjj: ?
)jj? @
{kk 	
tryll 
{mm 
switchnn 
(nn 
listnn 
)nn 
{oo 
casepp 
$strpp 
:pp  
stringqq 
filePathqq '
=qq( )
Pathqq* .
.qq. /
Combineqq/ 6
(qq6 7

UploadPathqq7 A
,qqA B
(qqC D
stringqqD J
)qqJ K
SessionqqK R
[qqR S
$strqqS a
]qqa b
)qqb c
;qqc d
newrr 
CreativeHelperrr *
(rr* +
)rr+ ,
.rr, -
Addrr- 0
(rr0 1
filePathrr1 9
,rr9 :
emailrr; @
)rr@ A
;rrA B

.ss% &
Uploadss& ,
(ss, -
(ss- .
stringss. 4
)ss4 5
Sessionss5 <
[ss< =
$strss= J
]ssJ K
,ssK L
filePathssM U
,ssU V
truessW [
)ss[ \
;ss\ ]
breaktt 
;tt 
caseuu 
$struu 
:uu  
stringvv 
filePathLivevv +
=vv, -
Pathvv. 2
.vv2 3
Combinevv3 :
(vv: ;

UploadPathvv; E
,vvE F
(vvG H
stringvvH N
)vvN O
SessionvvO V
[vvV W
$strvvW f
]vvf g
)vvg h
;vvh i
newww 
CreativeHelperww *
(ww* +
)ww+ ,
.ww, -
Addww- 0
(ww0 1
filePathLiveww1 =
,ww= >
emailww? D
)wwD E
;wwE F

.xx% &
Uploadxx& ,
(xx, -
(xx- .
stringxx. 4
)xx4 5
Sessionxx5 <
[xx< =
$strxx= J
]xxJ K
,xxK L
filePathLivexxM Y
,xxY Z
truexx[ _
)xx_ `
;xx` a
breakyy 
;yy 
}zz 
return{{ 
Json{{ 
({{ 
new{{ 
JsonResponse{{  ,
({{, -
){{- .
{{{/ 0
IsSucess{{0 8
={{9 :
true{{; ?
}{{? @
){{@ A
;{{A B
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
return 
Json 
( 
new 
JsonResponse  ,
(, -
)- .
{/ 0
IsSucess0 8
=9 :
false; @
,@ A
ErrorMessageB N
=O P
exQ S
.S T
MessageT [
}[ \
)\ ]
;] ^
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
CreativeHelper
�� *
(
��* +
)
��+ ,
.
��, -
Remove
��- 3
(
��3 4
filePath
��4 <
,
��< =
email
��> C
)
��C D
;
��D E

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
CreativeHelper
�� *
(
��* +
)
��+ ,
.
��, -
Remove
��- 3
(
��3 4
filePathLive
��4 @
,
��@ A
email
��B G
)
��G H
;
��H I

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

CreativeVm
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
CreativeHelper
��# 1
.
��1 2

ReadEmails
��2 <
(
��< =
filePath
��= E
)
��E F
;
��F G
model
�� 
.
�� 

LiveEmails
��  
=
��! "
CreativeHelper
��# 1
.
��1 2

ReadEmails
��2 <
(
��< =
filePathLive
��= I
)
��I J
;
��J K

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

CreativeVm
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
orderNumber
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
orderNumber
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
orderNumber
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
}�� Վ
OE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\ManageController.cs
	namespace

 	



 
.

 
Web

 
.

 
Controllers

 '
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
}�� ��
PE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\TestingController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
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
charSS 
_c1SS 
;SS 
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
CampaignTestingVm]]- >
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
CampaignTestingVmbb3 D
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
;xx6 7
_c1yy 
=yy 
$charyy 
;yy 
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
CampaignSegmentVm||/ @
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
;}}9 :
_c1~~ 
=~~ 
segment~~ 
.~~ 

.~~+ ,
Replace~~, 3
(~~3 4
campaignTestingVm~~4 E
.~~E F
OrderNumber~~F Q
,~~Q R
string~~S Y
.~~Y Z
Empty~~Z _
)~~_ `
.~~` a
ToCharArray~~a l
(~~l m
)~~m n
.~~n o
Select~~o u
(~~u v
x~~v w
=>~~x z
++~~{ }
x~~} ~
)~~~ 
.	~~ �
FirstOrDefault
~~� �
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
��, -
_c1
��. 1
++
��1 3
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
CampaignTestingVm
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
CampaignTestingVm
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
id
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
CampaignTestingVm��� �!
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
CampaignTestingVm
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
CampaignTestingVm��� �!
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
FetchSqlDataFile
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
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Controllers\TrackingController.cs
	namespace 	

 
. 
Web 
. 
Controllers '
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
CampaignSearchVm" 2
sc3 5
)5 6
{ 	
ViewBag 
. 
CurrentSort 
=  !
sc" $
.$ %
	SortOrder% .
;. /
ViewBag 
.  
CampaignNameSortParm (
=) *
sc+ -
.- .
	SortOrder. 7
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
	SortOrder/ 8
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
	SortOrder+ 4
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
	SortOrder( 1
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
	SortOrder- 6
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

Monitoring$$< F
&&$$G I
x$$J K
.$$K L
Approved$$L T
!=$$U W
null$$X \
)$$\ ]
.%% 
ToList%% 
(%% 
)%% 
;%% 
switch'' 
('' 
sc'' 
.'' 
	SortOrder''  
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

SearchTypeLL$ .
;LL. /
switchMM 
(MM 
scMM 
.MM 

SearchTypeMM !
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
BasicStringPP1 <
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
BasicStringSS0 ;
)SS; <
||SS= ?
sTT 
.TT $
ReBroadcastedOrderNumberTT 2
==TT3 5
scTT6 8
.TT8 9
BasicStringTT9 D
||TTE G
sUU 
.UU 
CampaignNameUU &
.UU& '
IndexOfUU' .
(UU. /
scUU/ 1
.UU1 2
BasicStringUU2 =
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
BasicStringVV9 D
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
BasicStatusXX6 A
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
BasicStatusZZ2 =
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
BasicStatusaa9 D
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
BasicOrderNumbercc6 F
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
BasicOrderNumbereeS c
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
AdvancedStatusii1 ?
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
AdvancedStatuskk2 @
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
AdvancedStatuspp< J
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
AdvancedUserrr1 =
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
AdvancedUserttK W
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
AdvancedUseruu: F
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
CampaignNamexx1 =
)xx= >
)xx> ?
{yy 
sczz 
.zz 
CampaignNamezz '
=zz( )
sczz* ,
.zz, -
CampaignNamezz- 9
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
CampaignName{{S _
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
CampaignName||2 >
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
IsTested1 9
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
IsTested
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
IsTested
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
OrderedFrom
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
OrderedFrom
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
OrderedFrom
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
	OrderedTo
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
	OrderedTo
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
	OrderedTo
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
BroadcastTo
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
BroadcastTo
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
BroadcastTo
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
Page
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
}�� �?
>E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Global.asax.cs
	namespace 	

 
. 
Web 
{
public 

class 
MvcApplication 
:  !
HttpApplication" 1
{ 
	protected 
void 
Application_Start (
(( )
)) *
{ 	
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
GlobalConfiguration 
.  
	Configure  )
() *
WebApiConfig* 6
.6 7
Register7 ?
)? @
;@ A
FilterConfig 
. !
RegisterGlobalFilters .
(. /

.< =
Filters= D
)D E
;E F
RouteConfig 
. 
RegisterRoutes &
(& '

RouteTable' 1
.1 2
Routes2 8
)8 9
;9 :
BundleConfig 
. 
RegisterBundles (
(( )
BundleTable) 4
.4 5
Bundles5 <
)< =
;= > 
HangfireBootstrapper  
.  !
Instance! )
.) *
Start* /
(/ 0
)0 1
;1 2
} 	
	protected 
void 
Application_End &
(& '
object' -
sender. 4
,4 5
	EventArgs6 ?
e@ A
)A B
{   	 
HangfireBootstrapper!!  
.!!  !
Instance!!! )
.!!) *
Stop!!* .
(!!. /
)!!/ 0
;!!0 1
}"" 	
	protected$$ 
void$$ 
Application_Error$$ (
($$( )
object$$) /
sender$$0 6
,$$6 7
	EventArgs$$8 A
e$$B C
)$$C D
{%% 	
var&& 
httpContext&& 
=&& 
(&& 
(&&  
MvcApplication&&  .
)&&. /
sender&&/ 5
)&&5 6
.&&6 7
Context&&7 >
;&&> ?
var'' 
currentController'' !
=''" #
$str''$ '
;''' (
var(( 

=(( 
$str((  #
;((# $
var)) 
currentRouteData))  
=))! "

RouteTable))# -
.))- .
Routes)). 4
.))4 5
GetRouteData))5 A
())A B
new))B E
HttpContextWrapper))F X
())X Y
httpContext))Y d
)))d e
)))e f
;))f g
if++ 
(++ 
currentRouteData++  
!=++! #
null++$ (
)++( )
{,, 
if-- 
(-- 
currentRouteData-- $
.--$ %
Values--% +
[--+ ,
$str--, 8
]--8 9
!=--: <
null--= A
&&--B D
!--E F
string--F L
.--L M

(--Z [
currentRouteData--[ k
.--k l
Values--l r
[--r s
$str--s 
]	-- �
.
--� �
ToString
--� �
(
--� �
)
--� �
)
--� �
)
--� �
{.. 
currentController// %
=//& '
currentRouteData//( 8
.//8 9
Values//9 ?
[//? @
$str//@ L
]//L M
.//M N
ToString//N V
(//V W
)//W X
;//X Y
}00 
if22 
(22 
currentRouteData22 $
.22$ %
Values22% +
[22+ ,
$str22, 4
]224 5
!=226 8
null229 =
&&22> @
!22A B
string22B H
.22H I

(22V W
currentRouteData22W g
.22g h
Values22h n
[22n o
$str22o w
]22w x
.22x y
ToString	22y �
(
22� �
)
22� �
)
22� �
)
22� �
{33 

=44" #
currentRouteData44$ 4
.444 5
Values445 ;
[44; <
$str44< D
]44D E
.44E F
ToString44F N
(44N O
)44O P
;44P Q
}55 
}66 
var77 
ex77 
=77 
Server77 
.77 
GetLastError77 (
(77( )
)77) *
;77* +
try99 
{:: 
EmailHelper;; 
.;; 
SendErrorEmail;; *
(;;* + 
ConfigurationManager;;+ ?
.;;? @
AppSettings;;@ K
[;;K L
$str;;L _
];;_ `
,;;` a
ex;;b d
,;;d e
currentController;;f w
,;;w x

)<<! "
;<<" #
}== 
catch>> 
(>> 
	Exception>> 
exx>>  
)>>  !
{?? 
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
QE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\AjaxAuthorizeAttribute.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
HE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\AuthorizeRole.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
	ifAllowed 
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
	ifAllowed"" !
=""" #
true""$ (
;""( )
break## 
;## 
}$$ 
}%% 
if'' 
('' 
	ifAllowed'' 
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
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\AuthorizeClaim.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
	ifAllowed 
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
	ifAllowed## !
=##" #
true##$ (
;##( )
break$$ 
;$$ 
}%% 
}&& 
if(( 
((( 
	ifAllowed(( 
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
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\CsvHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
charNN 
_fieldSeparatorNN -
;NN- .
privateOO 
readonlyOO 
stringOO #
_fieldSeparatorAsStringOO  7
;OO7 8
privatePP 
readonlyPP 
charPP 
[PP 
]PP !
_invalidCharsInFieldsPP  5
;PP5 6
privateQQ 
readonlyQQ 
StreamWriterQQ %

;QQ3 4
privateRR 
readonlyRR 
charRR 
_textQualifierRR ,
;RR, -
privateSS 
readonlySS 
StringSS 
[SS  
]SS  !
_columnsSS" *
;SS* +
privateTT 
FuncTT 
<TT 
TTT 
,TT 
objectTT 
>TT 
[TT  
]TT  !
_gettersTT" *
;TT* +
readonlyUU 
boolUU 
[UU 
]UU "
_isInvalidCharInFieldsUU .
;UU. /
privateWW 
intWW 

;WW! "
privateXX 
readonlyXX 
BlockingCollectionXX +
<XX+ ,
stringXX, 2
>XX2 3
_csvLinesToWriteXX4 D
=XXE F
newXXG J
BlockingCollectionXXK ]
<XX] ^
stringXX^ d
>XXd e
(XXe f
$numXXf j
)XXj k
;XXk l
privateYY 
readonlyYY 
ThreadYY 
_writeCsvLinesTaskYY  2
;YY2 3
privateZZ 
TaskZZ 

;ZZ" #
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
.jj 
_columnsjj 
=jj 
(jj 

.jj* +
Columnsjj+ 2
??jj3 5
InferColumnsjj6 B
(jjB C
typeofjjC I
(jjI J
TjjJ K
)jjK L
)jjL M
)jjM N
.jjN O
ToArrayjjO V
(jjV W
)jjW X
;jjX Y
thiskk 
.kk 
_fieldSeparatorkk  
=kk! "

.kk0 1
FieldSeparatorkk1 ?
;kk? @
thisll 
.ll #
_fieldSeparatorAsStringll (
=ll) *
thisll+ /
.ll/ 0
_fieldSeparatorll0 ?
.ll? @
ToStringll@ H
(llH I
CultureInfollI T
.llT U
InvariantCulturellU e
)lle f
;llf g
thismm 
.mm 
_textQualifiermm 
=mm  !

.mm/ 0

;mm= >
thisnn 
.nn 

=nn  
csvDestinationnn! /
.nn/ 0
StreamWriternn0 <
;nn< =
thispp 
.pp !
_invalidCharsInFieldspp &
=pp' (
newpp) ,
[pp, -
]pp- .
{pp/ 0
$charpp1 5
,pp5 6
$charpp7 ;
,pp; <
thispp= A
.ppA B
_textQualifierppB P
,ppP Q
thisppR V
.ppV W
_fieldSeparatorppW f
}ppg h
;pph i
thisqq 
.qq "
_isInvalidCharInFieldsqq '
=qq( )
newqq* -
boolqq. 2
[qq2 3
$numqq3 6
]qq6 7
;qq7 8
foreachss 
(ss 
varss 
css 
inss 
thisss "
.ss" #!
_invalidCharsInFieldsss# 8
)ss8 9
{tt 
thisuu 
.uu "
_isInvalidCharInFieldsuu +
[uu+ ,
cuu, -
]uu- .
=uu/ 0
trueuu1 5
;uu5 6
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
_writeCsvLinesTask}} "
=}}# $
new}}% (
Thread}}) /
(}}/ 0
(}}0 1
o}}1 2
)}}2 3
=>}}4 6
this}}7 ;
.}}; <

(}}I J
)}}J K
)}}K L
;}}L M
_writeCsvLinesTask~~ "
.~~" #
Start~~# (
(~~( )
)~~) *
;~~* +
} 
this
�� 
.
�� 

�� 
=
��  
Task
��! %
.
��% &
Factory
��& -
.
��- .
StartNew
��. 6
(
��6 7
(
��7 8
)
��8 9
=>
��: <
{
��= >
}
��? @
)
��@ A
;
��A B
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

�� 
.
�� 
Wait
�� "
(
��" #
)
��# $
;
��$ %
if
�� 
(
�� 
_csvLinesToWrite
�� $
!=
��% '
null
��( ,
)
��, -
{
�� 
_csvLinesToWrite
�� $
.
��$ %
CompleteAdding
��% 3
(
��3 4
)
��4 5
;
��5 6
}
�� 
if
�� 
(
��  
_writeCsvLinesTask
�� &
!=
��' )
null
��* .
)
��. / 
_writeCsvLinesTask
�� &
.
��& '
Join
��' +
(
��+ ,
)
��, -
;
��- .
this
�� 
.
�� 

�� "
.
��" #
Close
��# (
(
��( )
)
��) *
;
��* +
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
_csvLinesToWrite
��$ 4
.
��4 5$
GetConsumingEnumerable
��5 K
(
��K L
)
��L M
)
��M N
{
�� 
this
�� 
.
�� 

�� "
.
��" #
	WriteLine
��# ,
(
��, -
csvLine
��- 4
)
��4 5
;
��5 6
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
��$ %

��% 2
,
��2 3
-
��4 5
written
��5 <
)
��< =
;
��= >
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
��A B

��B O
)
��O P
;
��P Q
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
_csvLinesToWrite
�� )
.
��) *
Add
��* -
(
��- .
csvLine
��. 5
)
��5 6
;
��6 7
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
�� 

�� &
=
��' (
this
��) -
.
��- .

��. ;
.
��; <
ContinueWith
��< H
(
��H I
	addRecord
��I R
)
��R S
;
��S T
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
�� 

�� "
.
��" #
	WriteLine
��# ,
(
��, -
csvLine
��- 4
)
��4 5
;
��5 6
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
��$ &
_columns
��' /
)
��/ 0
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
�� 
_getters
�� 
=
�� 
list
��  
.
��  !
ToArray
��! (
(
��( )
)
��) *
;
��* +
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
��, -
_getters
��- 5
.
��5 6
Length
��6 <
]
��< =
;
��= >
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
�� 
_getters
��  (
.
��( )
Length
��) /
;
��/ 0
i
��1 2
++
��2 4
)
��4 5
{
�� 
var
�� 
getter
�� 
=
�� 
_getters
�� %
[
��% &
i
��& '
]
��' (
;
��( )
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
��# $%
_fieldSeparatorAsString
��$ ;
,
��; <

csvStrings
��= G
)
��G H
;
��H I
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
��' (
_textQualifier
��( 6
)
��6 7
;
��7 8
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
��% &
_textQualifier
��& 4
)
��4 5
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
��' (
_textQualifier
��( 6
)
��6 7
;
��7 8
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
��( )$
_isInvalidCharInFields
��) ?
[
��? @
c
��@ A
]
��A B
)
��B C
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
��2 3#
_invalidCharsInFields
��3 H
)
��H I
>=
��J L
$num
��M N
;
��N O
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
��$ %
_columns
��% -
.
��- .
Length
��. 4
;
��4 5
i
��6 7
++
��7 9
)
��9 :
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
_fieldSeparator
��( 7
)
��7 8
;
��8 9
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
��4 5
_columns
��5 =
[
��= >
i
��> ?
]
��? @
)
��@ A
)
��A B
;
��B C
}
�� 
this
�� 
.
�� 

�� 
.
�� 
	WriteLine
�� (
(
��( )
csvLine
��) 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
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
��A B
_allSetters
��C N
=
��O P
new
��Q T

Dictionary
��U _
<
��_ `
Type
��` d
,
��d e
List
��f j
<
��j k
Action
��k q
<
��q r
T
��r s
,
��s t
String
��u {
>
��{ |
>
��| }
>
��} ~
(
��~ 
)�� �
;��� �
private
�� 
string
�� 
[
�� 
]
�� 
_columns
�� !
;
��! "
private
�� 
char
�� 
_curChar
�� 
;
�� 
private
�� 
int
�� 
_len
�� 
;
�� 
private
�� 
string
�� 
_line
�� 
;
�� 
private
�� 
int
�� 
_pos
�� 
;
�� 
private
�� 
T
�� 
_record
�� 
;
�� 
private
�� 
readonly
�� 
char
�� 
_fieldSeparator
�� -
;
��- .
private
�� 
readonly
�� 

TextReader
�� #
_textReader
��$ /
;
��/ 0
private
�� 
readonly
�� 
char
�� 
_textQualifier
�� ,
;
��, -
private
�� 
readonly
�� 

�� &
_parseFieldResult
��' 8
=
��9 :
new
��; >

��? L
(
��L M
)
��M N
;
��N O
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
_fieldSeparator
��  
=
��! "

��# 0
.
��0 1
FieldSeparator
��1 ?
;
��? @
this
�� 
.
�� 
_textQualifier
�� 
=
��  !

��" /
.
��/ 0

��0 =
;
��= >
this
�� 
.
�� 
_textReader
�� 
=
�� 
	csvSource
�� (
.
��( )

TextReader
��) 3
;
��3 4
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
�� 
_record
�� %
;
��% &
}
��' (
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
�� 
_line
�� #
==
��$ &
null
��' +
;
��+ ,
}
��- .
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
�� 
_textReader
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
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
�� 
_line
�� 
==
�� 
null
�� "
&&
��# %
(
��& '
this
��' +
.
��+ ,
_line
��, 1
=
��2 3
this
��4 8
.
��8 9
_textReader
��9 D
.
��D E
ReadLine
��E M
(
��M N
)
��N O
)
��O P
==
��Q S
null
��T X
)
��X Y
{
�� 
this
�� 
.
�� 
_record
�� 
=
�� 
default
�� &
(
��& '
T
��' (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
_record
�� 
=
�� 
new
�� "
T
��# $
(
��$ %
)
��% &
;
��& '
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
�� 
_allSetters
�� %
.
��% &
TryGetValue
��& 1
(
��1 2

recordType
��2 <
,
��< =
out
��> A
setters
��B I
)
��I J
)
��J K
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
�� 
_allSetters
�� $
[
��$ %

recordType
��% /
]
��/ 0
=
��1 2
setters
��3 :
;
��: ;
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
�� 
_curChar
�� %
==
��& (
this
��) -
.
��- .
_fieldSeparator
��. =
)
��= >
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
��# $
_record
��$ +
,
��+ ,
fieldValues
��- 8
[
��8 9
i
��9 :
]
��: ;
)
��; <
;
��< =
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
�� 
_record
��  
!=
��! #
null
��$ (
)
��( )
;
��) *
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
��$ %
_columns
��% -
.
��- .
Length
��. 4
;
��4 5
i
��6 7
++
��7 9
)
��9 :
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
��( )
_columns
��) 1
[
��1 2
i
��2 3
]
��3 4
;
��4 5
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
�� 
_pos
�� 
<
�� 
this
��  
.
��  !
_len
��! %
)
��% &
{
�� 
this
�� 
.
�� 
_pos
�� 
++
�� 
;
�� 
this
�� 
.
�� 
_curChar
�� 
=
�� 
this
��  $
.
��$ %
_pos
��% )
<
��* +
this
��, 0
.
��0 1
_len
��1 5
?
��6 7
this
��8 <
.
��< =
_line
��= B
[
��B C
this
��C G
.
��G H
_pos
��H L
]
��L M
:
��N O
$char
��P T
;
��T U
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
_parseFieldResult
�� 
.
�� 
Length
�� $
=
��% &
$num
��' (
;
��( )
if
�� 
(
�� 
this
�� 
.
�� 
_line
�� 
==
�� 
null
�� "
||
��# %
this
��& *
.
��* +
_pos
��+ /
>=
��0 2
this
��3 7
.
��7 8
_len
��8 <
)
��< =
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
�� 
_curChar
��  
==
��! #
$char
��$ '
||
��( *
this
��+ /
.
��/ 0
_curChar
��0 8
==
��9 ;
$char
��< @
)
��@ A
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
�� 
_curChar
�� 
==
��  
this
��! %
.
��% &
_textQualifier
��& 4
)
��4 5
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
�� 
_curChar
�� $
!=
��% '
$num
��( )
)
��) *
{
�� 
if
�� 
(
�� 
this
�� 
.
�� 
_curChar
�� %
==
��& (
this
��) -
.
��- .
_textQualifier
��. <
)
��< =
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
��  !
_curChar
��! )
==
��* ,
this
��- 1
.
��1 2
_textQualifier
��2 @
)
��@ A
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
_parseFieldResult
�� -
.
��- .
Append
��. 4
(
��4 5
this
��5 9
.
��9 :
_textQualifier
��: H
)
��H I
;
��I J
}
�� 
else
�� 
return
�� "
_parseFieldResult
��# 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
;
��? @
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
��! "
_curChar
��" *
==
��+ -
$char
��. 2
)
��2 3
{
�� 
if
�� 
(
�� 
this
��  
.
��  !
_line
��! &
==
��' )
null
��* .
)
��. /
return
�� "
_parseFieldResult
��# 4
.
��4 5
ToString
��5 =
(
��= >
)
��> ?
;
��? @
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
_parseFieldResult
�� )
.
��) *
Append
��* 0
(
��0 1
this
��1 5
.
��5 6
_curChar
��6 >
)
��> ?
;
��? @
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
�� 
_curChar
�� $
!=
��% '
$num
��( )
&&
��* ,
this
��- 1
.
��1 2
_curChar
��2 :
!=
��; =
this
��> B
.
��B C
_fieldSeparator
��C R
&&
��S U
this
��V Z
.
��Z [
_curChar
��[ c
!=
��d f
$char
��g k
&&
��l n
this
��o s
.
��s t
_curChar
��t |
!=
��} 
$char��� �
)��� �
{
�� 
_parseFieldResult
�� %
.
��% &
Append
��& ,
(
��, -
this
��- 1
.
��1 2
_curChar
��2 :
)
��: ;
;
��; <
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
_parseFieldResult
�� $
.
��$ %
ToString
��% -
(
��- .
)
��. /
;
��/ 0
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
�� 
_line
�� 
=
�� 
header
�� #
;
��# $
this
�� 
.
�� 
_pos
�� 
=
�� 
-
�� 
$num
�� 
;
�� 
this
�� 
.
�� 
_len
�� 
=
�� 
this
��  
.
��  !
_line
��! &
.
��& '
Length
��' -
;
��- .
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
�� 
_curChar
�� !
==
��" $
this
��% )
.
��) *
_fieldSeparator
��* 9
)
��9 :
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
�� 
_columns
�� 
=
�� 
readColumns
�� '
.
��' (
ToArray
��( /
(
��/ 0
)
��0 1
;
��1 2
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
�� 
_line
�� 
=
�� 
this
�� 
.
�� 
_textReader
�� )
.
��) *
ReadLine
��* 2
(
��2 3
)
��3 4
;
��4 5
this
�� 
.
�� 
_pos
�� 
=
�� 
-
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
this
�� 
.
�� 
_line
�� 
==
�� 
null
�� "
)
��" #
{
�� 
this
�� 
.
�� 
_len
�� 
=
�� 
$num
�� 
;
�� 
this
�� 
.
�� 
_curChar
�� 
=
�� 
$char
��  $
;
��$ %
}
�� 
else
�� 
{
�� 
this
�� 
.
�� 
_len
�� 
=
�� 
this
��  
.
��  !
_line
��! &
.
��& '
Length
��' -
;
��- .
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
�� 

�� *
;
��* +
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
�� 

�� &
;
��& '
}
��( )
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
�� 

�� 
=
��  
streamWriter
��! -
;
��- .
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
�� 

�� 
=
��  
new
��! $
StreamWriter
��% 1
(
��1 2
stream
��2 8
)
��8 9
;
��9 :
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
�� 

�� 
=
��  
new
��! $
StreamWriter
��% 1
(
��1 2
fullName
��2 :
)
��: ;
;
��; <
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
}�� �
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\EmailChecker.cs
	namespace 	

 
. 
Web 
. 
Helpers #
{ 
public 

class 
EmailChecker 
{ 
private		 
static		 
bool		 
_invalid		 $
=		% &
false		' ,
;		, -
public 
static 
bool 
IsValidEmail '
(' (
string( .
strIn/ 4
)4 5
{ 	
_invalid
=
false
;
if 
( 
string 
. 

($ %
strIn% *
)* +
)+ ,
return 
false 
; 
try 
{ 
strIn 
= 
Regex 
. 
Replace %
(% &
strIn& +
,+ ,
$str- 8
,8 9
DomainMapper: F
,F G
RegexOptions& 2
.2 3
None3 7
,7 8
TimeSpan9 A
.A B
FromMillisecondsB R
(R S
$numS V
)V W
)W X
;X Y
} 
catch 
( &
RegexMatchTimeoutException -
)- .
{ 
return 
false 
; 
} 
try 
{ 
return 
Regex 
. 
IsMatch $
($ %
strIn% *
,* +
$str   y
+  z {
$str!! {
,!!{ |
RegexOptions"" "
.""" #

IgnoreCase""# -
,""- .
TimeSpan""/ 7
.""7 8
FromMilliseconds""8 H
(""H I
$num""I L
)""L M
)""M N
;""N O
}## 
catch$$ 
($$ &
RegexMatchTimeoutException$$ -
)$$- .
{%% 
return&& 
false&& 
;&& 
}'' 
}(( 	
private** 
static** 
string** 
DomainMapper** *
(*** +
Match**+ 0
match**1 6
)**6 7
{++ 	

IdnMapping-- 
idn-- 
=-- 
new--  

IdnMapping--! +
(--+ ,
)--, -
;--- .
string// 

domainName// 
=// 
match//  %
.//% &
Groups//& ,
[//, -
$num//- .
]//. /
./// 0
Value//0 5
;//5 6
try00 
{11 

domainName22 
=22 
idn22  
.22  !
GetAscii22! )
(22) *

domainName22* 4
)224 5
;225 6
}33 
catch44 
(44 
ArgumentException44 $
)44$ %
{55 
_invalid66 
=66 
true66 
;66  
}77 
return88 
match88 
.88 
Groups88 
[88  
$num88  !
]88! "
.88" #
Value88# (
+88) *

domainName88+ 5
;885 6
}99 	
}:: 
};; �
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\ExcelUtility.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
}** �t
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\Helpers\FileManager.cs
	namespace		 	

 
.		 
Web		 
.		 
Async		 !
.		! "
Helpers		" )
{

 
public 

class 
FileManager 
{ 
static
string
_optOut
=
$str	
;

static 
string 
_viewInBrowser $
=% &
$str	' �
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
string 

=$ %
$"& (
https://( 0
{0 1

.> ?
Bucket? E
}E F
.s3.amazonaws.com/F X
"X Y
;Y Z
public 
static 
HtmlProcessResult '
ProcessHtmlZip( 6
(6 7
string7 =

uploadPath> H
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
= 
$" 
{ 

uploadPath )
}) *
\\* ,
{, -
orderNumber- 8
}8 9
"9 :
;: ;
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
{ 
	Directory 
. 
CreateDirectory )
() *
	directory* 3
)3 4
;4 5
} 
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
=$$  !
$"$$" $
{$$$ %
orderNumber$$% 0
}$$0 1
.htm$$1 5
"$$5 6
;$$6 7
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
=&&  !
$"&&" $
{&&$ %
	directory&&% .
}&&. /
\\&&/ 1
{&&1 2
htmlFileName&&2 >
}&&> ?
"&&? @
;&&@ A
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

())# $
htmlFile))$ ,
))), -
)))- .
throw** 
new** 
AdsException** &
(**& '
$str**' 7
)**7 8
;**8 9
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

.// 
CreateDirectory// )
(//) *
orderNumber//* 5
)//5 6
;//6 7

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
=33  !
$"33" $
{33$ %

}332 3
{333 4
htmlFileKey334 ?
}33? @
"33@ A
;33A B

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
{<< 
var== 
	imageLive== 
=== 
$"==  "
{==" #

imagesLive==# -
}==- .
/==. /
{==/ 0
new==0 3
FileInfo==4 <
(==< =
imgFile=== D
)==D E
.==E F
Name==F J
}==J K
"==K L
;==L M

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
}?? 
newBB 

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
FilePathLiveDD= I
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
,II> ?

,IIM N
_orderNumberIIO [
)II[ \
;II\ ]
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
{PP 
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
=^^ 
$"^^ 
{^^ 

imagesPath^^ '
}^^' (
{^^( )
imgFileName^^) 4
}^^4 5
"^^5 6
;^^6 7
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
}aa 
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
{ee 
HtmlNodeff 
newNodeff  
=ff! "
HtmlNodeff# +
.ff+ ,

CreateNodeff, 6
(ff6 7
_viewInBrowserff7 E
)ffE F
;ffF G
bodygg 
.gg 
PrependChildgg !
(gg! "
newNodegg" )
)gg) *
;gg* +
}hh 
ifii 
(ii 
_isAddOptoutii 
)ii 
{jj 
HtmlNodekk 
newNodekk  
=kk! "
HtmlNodekk# +
.kk+ ,

CreateNodekk, 6
(kk6 7
_optOutkk7 >
)kk> ?
;kk? @
bodyll 
.ll 
AppendChildll  
(ll  !
newNodell! (
)ll( )
;ll) *
}mm 
docoo 
.oo 
Saveoo 
(oo 
outputFilePathoo #
)oo# $
;oo$ %
returnqq 

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
{xx 
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
,zzD E

,zzS T
orderNumberzzU `
)zz` a
;zza b
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
,}}E F

,}}T U
orderNumber}}V a
)}}a b
;}}b c
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
��E F

��G T
,
��T U
orderNumber
��V a
)
��a b
;
��b c
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
��E F

��G T
,
��T U
orderNumber
��V a
)
��a b
;
��b c
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
��% &
$"
��' )
{
��) *

��* 7
}
��7 8
{
��8 9
orderNumber
��9 D
}
��D E
/_banner
��E M
{
��M N
	extension
��N W
}
��W X
"
��X Y
;
��Y Z
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
��% &
$"
��' )
{
��) *

��* 7
}
��7 8
{
��8 9
orderNumber
��9 D
}
��D E

��E R
{
��R S
	extension
��S \
}
��\ ]
"
��] ^
;
��^ _
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
��! "
$"
��# %
{
��% &

��& 3
}
��3 4
{
��4 5
orderNumber
��5 @
}
��@ A
/_misc
��A G
{
��G H
	extension
��H Q
}
��Q R
"
��R S
;
��S T
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
��! "
$"
��# %
{
��% &

��& 3
}
��3 4
{
��4 5
orderNumber
��5 @
}
��@ A
/
��A B
{
��B C

��C P
}
��P Q
data.csv
��Q Y
"
��Y Z
;
��Z [
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
}�� �d
OE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\Helpers\FileManagerFTP.cs
	namespace		 	

 
.		 
Web		 
.		 
Async		 !
.		! "
Helpers		" )
{

 
public 

class 
FileManagerFtp 
{ 
static
string
_optOut
=
$str	
;

static 
string 
_viewInBrowser $
=% &
$str	' �
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

uploadPath> H
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
= 
$" 
{ 

uploadPath )
}) *
\\* ,
{, -
orderNumber- 8
}8 9
temp9 =
"= >
;> ?
if 
( 
	Directory 
. 
Exists  
(  !
	directory! *
)* +
)+ ,
{ 
new 

(! "
	directory" +
)+ ,
., -
Delete- 3
(3 4
true4 8
)8 9
;9 :
} 
else   
{!! 
	Directory"" 
."" 
CreateDirectory"" )
("") *
	directory""* 3
)""3 4
;""4 5
}## 
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
=''  !
$"''" $
{''$ %
orderNumber''% 0
}''0 1
.htm''1 5
"''5 6
;''6 7
string(( 
htmlFilePath(( 
=((  !
$"((" $
{(($ %
	directory((% .
}((. /
\\((/ 1
{((1 2
htmlFileName((2 >
}((> ?
"((? @
;((@ A
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

(++# $
htmlFile++$ ,
)++, -
)++- .
throw,, 
new,, 
AdsException,, &
(,,& '
$str,,' 7
),,7 8
;,,8 9
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
=77 
$"77 
{77  
orderNumber77  +
}77+ ,
/77, -
{77- .
orderNumber77. 9
}779 :
img77: =
"77= >
;77> ?
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
;;;S T
if<< 
(<< 
images<< 
!=<< 
null<< 
)<< 
foreach== 
(== 
var== 
imgFile== $
in==% '
	Directory==( 1
.==1 2
EnumerateFiles==2 @
(==@ A
images==A G
)==G H
)==H I
{>> 
var?? 
file?? 
=?? 
new?? "
FileInfo??# +
(??+ ,
imgFile??, 3
)??3 4
;??4 5
uploader@@ 
.@@ 
Upload@@ #
(@@# $

imagesLive@@$ .
,@@. /
file@@0 4
.@@4 5
Name@@5 9
,@@9 :
imgFile@@; B
)@@B C
;@@C D
}AA 
newDD 

(DD 
	directoryDD '
)DD' (
.DD( )
DeleteDD) /
(DD/ 0
trueDD0 4
)DD4 5
;DD5 6
returnFF 
newFF 
HtmlProcessResultFF (
(FF( )
)FF) *
{FF+ ,
StatusFF, 2
=FF3 4
statusFF5 ;
,FF; <
FilePathLiveFF= I
=FFJ K
filePathLiveFFL X
}FFX Y
;FFY Z
}GG 	
publicII 
staticII 
UploadFileStatusII &
ProcessHtmlII' 2
(II2 3
stringII3 9
htmlFileII: B
,IIB C
stringIID J
outputFilePathIIK Y
)IIY Z
{JJ 	
stringKK 

imagesPathKK 
=KK 
stringKK  &
.KK& '
FormatKK' -
(KK- .
$strKK. ^
,KK^ _
_orderNumberKK` l
)KKl m
;KKm n
HtmlDocumentMM 
docMM 
=MM 
newMM "
HtmlDocumentMM# /
(MM/ 0
)MM0 1
;MM1 2
docNN 
.NN 
LoadNN 
(NN 
htmlFileNN 
)NN 
;NN 
varOO 
allSrcsOO 
=OO 
docOO 
.OO 
DocumentNodeOO *
.OO* +
SelectNodesOO+ 6
(OO6 7
$strOO7 D
)OOD E
;OOE F
boolPP 

=PP  
falsePP! &
;PP& '
foreachQQ 
(QQ 
HtmlNodeQQ 
nodeQQ "
inQQ# %
allSrcsQQ& -
)QQ- .
{RR 
varSS 
srcSS 
=SS 
nodeSS 
.SS 

AttributesSS )
[SS) *
$strSS* /
]SS/ 0
.SS0 1
ValueSS1 6
;SS6 7
ifUU 
(UU 
srcUU 
.UU 
ContainsUU  
(UU  !
$strUU! *
)UU* +
)UU+ ,
{VV 

=WW" #
trueWW$ (
;WW( )
breakXX 
;XX 
;XX 
}YY 
elseZZ 
{[[ 
var^^ 
srcs^^ 
=^^ 
src^^ "
.^^" #
Split^^# (
(^^( )
$str^^) ,
.^^, -
ToCharArray^^- 8
(^^8 9
)^^9 :
)^^: ;
;^^; <
string__ 
imgFileName__ &
=__' (
srcs__) -
.__- .
Length__. 4
>__5 6
$num__7 8
?__9 :
srcs__; ?
[__? @
$num__@ A
]__A B
:__C D
string__E K
.__K L
Empty__L Q
;__Q R
src`` 
=`` 
$"`` 
{`` 

imagesPath`` '
}``' (
{``( )
imgFileName``) 4
}``4 5
"``5 6
;``6 7
}aa 
nodebb 
.bb 
SetAttributeValuebb &
(bb& '
$strbb' ,
,bb, -
srcbb. 1
)bb1 2
;bb2 3
}cc 
HtmlNodeee 
bodyee 
=ee 
docee 
.ee  
DocumentNodeee  ,
.ee, -
SelectSingleNodeee- =
(ee= >
$stree> F
)eeF G
;eeG H
ifff 
(ff 
_isAddViewinBrowserff #
)ff# $
{gg 
HtmlNodehh 
newNodehh  
=hh! "
HtmlNodehh# +
.hh+ ,

CreateNodehh, 6
(hh6 7
_viewInBrowserhh7 E
)hhE F
;hhF G
bodyii 
.ii 
PrependChildii !
(ii! "
newNodeii" )
)ii) *
;ii* +
}jj 
ifkk 
(kk 
_isAddOptoutkk 
)kk 
{ll 
HtmlNodemm 
newNodemm  
=mm! "
HtmlNodemm# +
.mm+ ,

CreateNodemm, 6
(mm6 7
_optOutmm7 >
)mm> ?
;mm? @
bodynn 
.nn 
AppendChildnn  
(nn  !
newNodenn! (
)nn( )
;nn) *
}oo 
docqq 
.qq 
Saveqq 
(qq 
outputFilePathqq #
)qq# $
;qq$ %
returnss 

?ss! "
UploadFileStatusss# 3
.ss3 4
HostedWithOutImagesss4 G
:ssH I
UploadFileStatusssK [
.ss[ \
HostedWithImagesss\ l
;ssl m
}tt 	
publicvv 
staticvv 
stringvv 

UploadFilevv '
(vv' (
UploadFileTypevv( 6
uploadFileTypevv7 E
,vvE F
stringvvG M
filePathvvN V
,vvV W
stringvvX ^
orderNumbervv_ j
)vvj k
{ww 	
FileUploaderxx 
uploaderxx !
=xx" #
newxx$ '
FileUploaderxx( 4
(xx4 5
)xx5 6
;xx6 7
uploader{{ 
.{{ 
CreateDirectory{{ $
({{$ %
orderNumber{{% 0
){{0 1
;{{1 2
string}} 
fileName}} 
=}} 
$str}}  
;}}  !
switch~~ 
(~~ 
uploadFileType~~ "
)~~" #
{ 
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
��! "
$"
��# %
{
��% &
orderNumber
��& 1
}
��1 2
zip.csv
��2 9
"
��9 :
;
��: ;
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
��! "
$"
��# %
{
��% &
orderNumber
��& 1
}
��1 2
test.csv
��2 :
"
��: ;
;
��; <
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
��! "
$"
��# %
{
��% &
orderNumber
��& 1
}
��1 2
live.csv
��2 :
"
��: ;
;
��; <
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
��! "
$"
��# %
{
��% &
orderNumber
��& 1
}
��1 2
supp.csv
��2 :
"
��: ;
;
��; <
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
FE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\FileProcessor.cs
	namespace

 	



 
.

 
Web

 
.

 
Async

 !
{ 
public 

static 
class 

{
public 
static 
void  
ProcessNewOrderFiles /
(/ 0

db> @
,@ A
CampaignB J
campaignK S
)S T
{ 	
if 
( 
! 
string 
. 

(% &
campaign& .
.. /
Assets/ 5
.5 6

)C D
)D E
{ 
string 

=% &
string' -
.- .
Format. 4
(4 5
$str5 G
,G H
campaignI Q
.Q R
OrderNumberR ]
)] ^
;^ _

. 
Move "
(" #
campaign# +
.+ ,
Assets, 2
.2 3

,@ A

,O P
campaignQ Y
.Y Z
OrderNumberZ e
,e f
trueg k
)k l
;l m
campaign 
. 
Assets 
.  

=. /

;= >
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
FileProcessing- ;
,; <
campaign= E
.E F
OrderNumberF Q
,Q R
$str -
+. /

)= >
;> ?
} 
if 
( 
! 
string 
. 

(% &
campaign& .
.. /
Assets/ 5
.5 6
ZipCodeFile6 A
)A B
)B C
{ 
string 

=% &
string' -
.- .
Format. 4
(4 5
$str5 E
,E F
campaignG O
.O P
OrderNumberP [
)[ \
;\ ]

. 
Move "
(" #
campaign# +
.+ ,
Assets, 2
.2 3
ZipCodeFile3 >
,> ?

,M N
campaignO W
.W X
OrderNumberX c
,c d
truee i
)i j
;j k
campaign 
. 
Assets 
.  
ZipCodeFile  +
=, -

;; <
	LogHelper 
. 
AddLog  
(  !
db! #
,# $
LogType% ,
., -
FileProcessing- ;
,; <
campaign= E
.E F
OrderNumberF Q
,Q R
$str +
+, -

); <
;< =
} 
if   
(   
!   
string   
.   

(  % &
campaign  & .
.  . /
Assets  / 5
.  5 6
TestSeedFile  6 B
)  B C
)  C D
{!! 
string"" 

=""% &
string""' -
.""- .
Format"". 4
(""4 5
$str""5 F
,""F G
campaign""H P
.""P Q
OrderNumber""Q \
)""\ ]
;""] ^

.## 
Move## "
(##" #
campaign### +
.##+ ,
Assets##, 2
.##2 3
TestSeedFile##3 ?
,##? @

,##N O
campaign##P X
.##X Y
OrderNumber##Y d
,##d e
true##f j
)##j k
;##k l
campaign$$ 
.$$ 
Assets$$ 
.$$  
TestSeedFile$$  ,
=$$- .

;$$< =
	LogHelper%% 
.%% 
AddLog%%  
(%%  !
db%%! #
,%%# $
LogType%%% ,
.%%, -
FileProcessing%%- ;
,%%; <
campaign%%= E
.%%E F
OrderNumber%%F Q
,%%Q R
$str&& ,
+&&- .

)&&< =
;&&= >
}'' 
if(( 
((( 
!(( 
string(( 
.(( 

(((% &
campaign((& .
.((. /
Assets((/ 5
.((5 6
LiveSeedFile((6 B
)((B C
)((C D
{)) 
string** 

=**% &
string**' -
.**- .
Format**. 4
(**4 5
$str**5 F
,**F G
campaign**H P
.**P Q
OrderNumber**Q \
)**\ ]
;**] ^

.++ 
Move++ "
(++" #
campaign++# +
.+++ ,
Assets++, 2
.++2 3
LiveSeedFile++3 ?
,++? @

,++N O
campaign++P X
.++X Y
OrderNumber++Y d
,++d e
true++f j
)++j k
;++k l
campaign,, 
.,, 
Assets,, 
.,,  
LiveSeedFile,,  ,
=,,- .

;,,< =
	LogHelper-- 
.-- 
AddLog--  
(--  !
db--! #
,--# $
LogType--% ,
.--, -
FileProcessing--- ;
,--; <
campaign--= E
.--E F
OrderNumber--F Q
,--Q R
$str.. ,
+..- .

)..< =
;..= >
}// 
if00 
(00 
!00 
string00 
.00 

(00% &
campaign00& .
.00. /
Assets00/ 5
.005 6
SuppressionFile006 E
)00E F
)00F G
{11 
string22 

=22% &
string22' -
.22- .
Format22. 4
(224 5
$str225 F
,22F G
campaign22H P
.22P Q
OrderNumber22Q \
)22\ ]
;22] ^

.33 
Move33 "
(33" #
campaign33# +
.33+ ,
Assets33, 2
.332 3
SuppressionFile333 B
,33B C

,33Q R
campaign33S [
.33[ \
OrderNumber33\ g
,33g h
true33i m
)33m n
;33n o
campaign44 
.44 
Assets44 
.44  
SuppressionFile44  /
=440 1

;44? @
	LogHelper55 
.55 
AddLog55  
(55  !
db55! #
,55# $
LogType55% ,
.55, -
FileProcessing55- ;
,55; <
campaign55= E
.55E F
OrderNumber55F Q
,55Q R
$str66 /
+660 1

)66? @
;66@ A
}77 
if88 
(88 
!88 
string88 
.88 

(88% &
campaign88& .
.88. /
Assets88/ 5
.885 6
BannersFile886 A
)88A B
)88B C
{99 
string:: 

=::% &
string::' -
.::- .
Format::. 4
(::4 5
$str::5 H
,::H I
campaign::J R
.::R S
OrderNumber::S ^
,::^ _
Path;; 
.;; 
GetExtension;; %
(;;% &
campaign;;& .
.;;. /
Assets;;/ 5
.;;5 6
BannersFile;;6 A
);;A B
);;B C
;;;C D

.<< 
Move<< "
(<<" #
campaign<<# +
.<<+ ,
Assets<<, 2
.<<2 3
BannersFile<<3 >
,<<> ?

,<<M N
campaign<<O W
.<<W X
OrderNumber<<X c
,<<c d
true<<e i
)<<i j
;<<j k
campaign== 
.== 
Assets== 
.==  
BannersFile==  +
===, -

;==; <
	LogHelper>> 
.>> 
AddLog>>  
(>>  !
db>>! #
,>># $
LogType>>% ,
.>>, -
FileProcessing>>- ;
,>>; <
campaign>>= E
.>>E F
OrderNumber>>F Q
,>>Q R
$str?? +
+??, -

)??; <
;??< =
}@@ 
ifAA 
(AA 
!AA 
stringAA 
.AA 

(AA% &
campaignAA& .
.AA. /
AssetsAA/ 5
.AA5 6
BannerLinksFileAA6 E
)AAE F
)AAF G
{BB 
stringCC 

=CC% &
stringCC' -
.CC- .
FormatCC. 4
(CC4 5
$strCC5 M
,CCM N
campaignCCO W
.CCW X
OrderNumberCCX c
,CCc d
PathDD 
.DD 
GetExtensionDD %
(DD% &
campaignDD& .
.DD. /
AssetsDD/ 5
.DD5 6
BannerLinksFileDD6 E
)DDE F
)DDF G
;DDG H

.EE 
MoveEE "
(EE" #
campaignEE# +
.EE+ ,
AssetsEE, 2
.EE2 3
BannerLinksFileEE3 B
,EEB C

,EEQ R
campaignEES [
.EE[ \
OrderNumberEE\ g
,EEg h
trueEEi m
)EEm n
;EEn o
campaignFF 
.FF 
AssetsFF 
.FF  
BannerLinksFileFF  /
=FF0 1

;FF? @
	LogHelperGG 
.GG 
AddLogGG  
(GG  !
dbGG! #
,GG# $
LogTypeGG% ,
.GG, -
FileProcessingGG- ;
,GG; <
campaignGG= E
.GGE F
OrderNumberGGF Q
,GGQ R
$strHH /
+HH0 1

)HH? @
;HH@ A
}II 
ifJJ 
(JJ 
!JJ 
stringJJ 
.JJ 

(JJ% &
campaignJJ& .
.JJ. /
AssetsJJ/ 5
.JJ5 6
MiscFileJJ6 >
)JJ> ?
)JJ? @
{KK 
stringLL 

=LL% &
stringLL' -
.LL- .
FormatLL. 4
(LL4 5
$strLL5 F
,LLF G
campaignLLH P
.LLP Q
OrderNumberLLQ \
,LL\ ]
PathMM 
.MM 
GetExtensionMM %
(MM% &
campaignMM& .
.MM. /
AssetsMM/ 5
.MM5 6
MiscFileMM6 >
)MM> ?
)MM? @
;MM@ A

.NN 
MoveNN "
(NN" #
campaignNN# +
.NN+ ,
AssetsNN, 2
.NN2 3
MiscFileNN3 ;
,NN; <

,NNJ K
campaignNNL T
.NNT U
OrderNumberNNU `
,NN` a
trueNNb f
)NNf g
;NNg h
campaignOO 
.OO 
AssetsOO 
.OO  
MiscFileOO  (
=OO) *

;OO8 9
	LogHelperPP 
.PP 
AddLogPP  
(PP  !
dbPP! #
,PP# $
LogTypePP% ,
.PP, -
FileProcessingPP- ;
,PP; <
campaignPP= E
.PPE F
OrderNumberPPF Q
,PPQ R
$strPPS g
+PPh i

)PPw x
;PPx y
}QQ 
foreachSS 
(SS 
varSS 
segmentSS  
inSS! #
campaignSS$ ,
.SS, -
SegmentsSS- 5
)SS5 6
{TT 
ifUU 
(UU 
stringUU 
.UU 

(UU' (
segmentUU( /
.UU/ 0

)UU= >
)UU> ?
continueUU@ H
;UUH I
stringVV 

=VV% &
$"VV' )
{VV) *
campaignVV* 2
.VV2 3
OrderNumberVV3 >
}VV> ?
/VV? @
{VV@ A
segmentVVA H
.VVH I

}VVV W
	_html.zipVVW `
"VV` a
;VVa b

.WW 
MoveWW "
(WW" #
segmentWW# *
.WW* +

,WW8 9

,WWG H
campaignWWI Q
.WWQ R
OrderNumberWWR ]
,WW] ^
trueWW_ c
)WWc d
;WWd e
segmentXX 
.XX 

=XX& '

;XX5 6
	LogHelperYY 
.YY 
AddLogYY  
(YY  !
dbYY! #
,YY# $
LogTypeYY% ,
.YY, -
FileProcessingYY- ;
,YY; <
campaignYY= E
.YYE F
OrderNumberYYF Q
,YYQ R
$strZZ 
+ZZ  !
segmentZZ" )
.ZZ) *

+ZZ8 9
$strZZ: T
+ZZU V

)ZZd e
;ZZe f
}[[ 
}\\ 	
public^^ 
static^^ 
void^^ "
ProcessAssetUpdateUrls^^ 1
(^^1 2
string^^2 8

uploadPath^^9 C
,^^C D
string^^E K
orderNumber^^L W
)^^W X
{__ 	
using`` 
(`` 
var`` 
db`` 
=`` 
new`` 

(``- .
)``. /
)``/ 0
{aa 
varbb 
campaignbb 
=bb 
dbbb !
.bb! "
	Campaignsbb" +
.bb+ ,
Includebb, 3
(bb3 4
xbb4 5
=>bb6 8
xbb9 :
.bb: ;
Assetsbb; A
)bbA B
.bbB C
FirstOrDefaultbbC Q
(bbQ R
xbbR S
=>bbT V
xbbW X
.bbX Y
OrderNumberbbY d
==bbe g
orderNumberbbh s
)bbs t
;bbt u
vardd 
	directorydd 
=dd 
$"dd  "
{dd" #

uploadPathdd# -
}dd- .
\\dd. 0
{dd0 1
campaigndd1 9
.dd9 :
OrderNumberdd: E
}ddE F
"ddF G
;ddG H
ifee 
(ee 
!ee 
	Directoryee 
.ee 
Existsee %
(ee% &
	directoryee& /
)ee/ 0
)ee0 1
	Directoryee2 ;
.ee; <
CreateDirectoryee< K
(eeK L
	directoryeeL U
)eeU V
;eeV W
tryhh 
{ii 
ifjj 
(jj 
!jj 
stringjj 
.jj  

(jj- .
campaignjj. 6
.jj6 7
Assetsjj7 =
.jj= >

)jjK L
)jjL M
{kk 
stringll 
filePathll '
=ll( )
Pathll* .
.ll. /
Combinell/ 6
(ll6 7

uploadPathll7 A
,llA B
campaignllC K
.llK L
AssetsllL R
.llR S

)ll` a
;lla b

.mm% &
Downloadmm& .
(mm. /
campaignmm/ 7
.mm7 8
Assetsmm8 >
.mm> ?

,mmL M
filePathmmN V
)mmV W
;mmW X
varnn 
resultnn "
=nn# $
FileManagernn% 0
.nn0 1
ProcessHtmlZipnn1 ?
(nn? @

uploadPathnn@ J
,nnJ K
filePathnnL T
,nnT U
campaignnnV ^
.nn^ _
OrderNumbernn_ j
,nnj k
campaignnnl t
.nnt u
IsAddOptOut	nnu �
,
nn� �
campaign
nn� �
.
nn� � 
IsAddViewInBrowser
nn� �
)
nn� �
;
nn� �
campaignoo  
.oo  !
Assetsoo! '
.oo' (
CreativeUrloo( 3
=oo4 5
resultoo6 <
.oo< =
FilePathLiveoo= I
;ooI J
campaignpp  
.pp  !
Assetspp! '
.pp' (
CreativeStatuspp( 6
=pp7 8
(pp9 :
intpp: =
)pp= >
resultpp> D
.ppD E
StatusppE K
;ppK L
	LogHelperqq !
.qq! "
AddLogqq" (
(qq( )
dbqq) +
,qq+ ,
LogTypeqq- 4
.qq4 5
FileProcessingqq5 C
,qqC D
orderNumberqqE P
,qqP Q
$strqqR m
+qqn o
campaignqqp x
.qqx y
Assetsqqy 
.	qq �
CreativeUrl
qq� �
+
qq� �
$str
qq� �
+
qq� �
System
qq� �
.
qq� �
Enum
qq� �
.
qq� �
GetName
qq� �
(
qq� �
typeof
qq� �
(
qq� �
UploadFileStatus
qq� �
)
qq� �
,
qq� �
campaign
qq� �
.
qq� �
Assets
qq� �
.
qq� �
CreativeStatus
qq� �
)
qq� �
)
qq� �
;
qq� �
}rr 
}ss 
catchtt 
(tt 
	Exceptiontt  
extt! #
)tt# $
{uu 
campaignvv 
.vv 
Assetsvv #
.vv# $
CreativeStatusvv$ 2
=vv3 4
(vv5 6
intvv6 9
)vv9 :
UploadFileStatusvv: J
.vvJ K
FailedvvK Q
;vvQ R
	LogHelperww 
.ww 
AddErrorww &
(ww& '
dbww' )
,ww) *
LogTypeww+ 2
.ww2 3
FileProcessingww3 A
,wwA B
orderNumberwwC N
,wwN O
$strwwP s
+wwt u
exwwv x
.wwx y
Message	wwy �
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
}xx 
dbyy 
.yy 
SaveChangesyy 
(yy 
)yy  
;yy  !
if{{ 
({{ 
!{{ 
string{{ 
.{{ 

({{) *
campaign{{* 2
.{{2 3
Assets{{3 9
.{{9 :
ZipCodeFile{{: E
){{E F
){{F G
{|| 
campaign~~ 
.~~ 
Assets~~ #
.~~# $

ZipCodeUrl~~$ .
=~~/ 0
FileManager~~1 <
.~~< =
GetFilePathLive~~= L
(~~L M
UploadFileType~~M [
.~~[ \
ZipFile~~\ c
,~~c d
campaign  
.  !
OrderNumber! ,
), -
;- .
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
ME:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\Helpers\FileUploader.cs
	namespace 	

 
. 
Web 
. 
Async !
.! "
Helpers" )
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
_baseUrl 
;  
private
string

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
_baseUrl 
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
_baseUrl44# +
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
_baseUrlJJ( 0
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
{MM( )

}MM6 7
{MM7 8

}MME F
/MMF G
{MMG H
fileNameMMH P
}MMP Q
"MMQ R
;MMR S
returnNN 
filePathLiveNN #
;NN# $
}OO 
}PP 	
}QQ 
}RR �N
FE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\ImageHelper.cs
	namespace		 	

 
.		 
Web		 
.		 
Helpers		 #
{

 
public 

class 
ImageHelper 
{ 
private
string
_url
;
private 
string 
	_filePath  
;  !
public 
ImageHelper 
( 
string !
url" %
,% &
string' -
filePath. 6
)6 7
{ 	
_url 
= 
url 
; 
	_filePath 
= 
filePath  
;  !
} 	
public 
void 
Capture 
( 
) 
{ 	
Thread 
thread 
= 
new 
Thread  &
(& '
delegate' /
(0 1
)1 2
{ 
using 
( 

WebBrowser !
browser" )
=* +
new, /

WebBrowser0 :
(: ;
); <
)< =
{ 
browser 
. 
ScrollBarsEnabled -
=. /
false0 5
;5 6
browser 
. 
AllowNavigation +
=, -
true. 2
;2 3
browser 
. "
ScriptErrorsSuppressed 2
=3 4
true5 9
;9 :
browser 
. 
Navigate $
($ %
_url% )
)) *
;* +
browser!! 
.!! 
DocumentCompleted!! -
+=!!. 0
new!!1 43
'WebBrowserDocumentCompletedEventHandler!!5 \
(!!\ ]
DocumentCompleted!!] n
)!!n o
;!!o p
while"" 
("" 
browser"" "
.""" #

ReadyState""# -
!="". 0 
WebBrowserReadyState""1 E
.""E F
Complete""F N
)""N O
{## 
System$$ 
.$$ 
Windows$$ &
.$$& '
Forms$$' ,
.$$, -
Application$$- 8
.$$8 9
DoEvents$$9 A
($$A B
)$$B C
;$$C D
}%% 
}&& 
}'' 
)''
;'' 
thread(( 
.(( 
SetApartmentState(( $
((($ %
ApartmentState((% 3
.((3 4
STA((4 7
)((7 8
;((8 9
thread)) 
.)) 
Start)) 
()) 
))) 
;)) 
thread** 
.** 
Join** 
(** 
)** 
;** 
}++ 	
private-- 
void-- 
DocumentCompleted-- &
(--& '
object--' -
sender--. 4
,--4 50
$WebBrowserDocumentCompletedEventArgs--6 Z
e--[ \
)--\ ]
{.. 	

WebBrowser// 
wb// 
=// 
sender// "
as//# %

WebBrowser//& 0
;//0 1
if00 
(00 
!00 
wb00 
.00 
Document00 
.00 
Title00 "
.00" #
Equals00# )
(00) *
$str00* >
)00> ?
)00? @
{11 
int22 
scrollWidth22 
=22  !
$num22" #
;22# $
int33 
scrollHeight33  
=33! "
$num33# $
;33$ %
scrollHeight55 
=55 
wb55 !
.55! "
Document55" *
.55* +
Body55+ /
.55/ 0
ScrollRectangle550 ?
.55? @
Height55@ F
;55F G
scrollWidth66 
=66 
wb66  
.66  !
Document66! )
.66) *
Body66* .
.66. /
ScrollRectangle66/ >
.66> ?
Width66? D
;66D E
wb77 
.77 
Size77 
=77 
new77 
Size77 "
(77" #
scrollWidth77# .
,77. /
scrollHeight770 <
)77< =
;77= >
Bitmap:: 
bitmap:: 
=:: 
new::  #
Bitmap::$ *
(::* +
wb::+ -
.::- .
Width::. 3
,::3 4
wb::5 7
.::7 8
Height::8 >
)::> ?
;::? @
for;; 
(;; 
int;; 
xcount;; 
=;;  !
$num;;" #
;;;# $
xcount;;% +
<;;, -
bitmap;;. 4
.;;4 5
Width;;5 :
;;;: ;
xcount;;< B
++;;B D
);;D E
for<< 
(<< 
int<< 
ycount<< #
=<<$ %
$num<<& '
;<<' (
ycount<<) /
<<<0 1
bitmap<<2 8
.<<8 9
Height<<9 ?
;<<? @
ycount<<A G
++<<G I
)<<I J
bitmap== 
.== 
SetPixel== '
(==' (
xcount==( .
,==. /
ycount==0 6
,==6 7
Color==8 =
.=== >
Black==> C
)==C D
;==D E
wb>> 
.>> 
DrawToBitmap>> 
(>>  
bitmap>>  &
,>>& '
new>>( +
	Rectangle>>, 5
(>>5 6
$num>>6 7
,>>7 8
$num>>9 :
,>>: ;
wb>>< >
.>>> ?
Width>>? D
,>>D E
wb>>F H
.>>H I
Height>>I O
)>>O P
)>>P Q
;>>Q R
bitmap?? 
.?? 
Save?? 
(?? 
	_filePath?? %
,??% &
ImageFormat??' 2
.??2 3
Png??3 6
)??6 7
;??7 8
}@@ 
}AA 	
publicBB 
staticBB 
stringBB 
GetCapturedImageBB -
(BB- .
stringBB. 4
urlBB5 8
,BB8 9
stringBB: @
filePathBBA I
)BBI J
{CC 	
tryDD 
{EE 
HttpWebRequestFF 
requestFF &
=FF' (
HttpWebRequestFF) 7
.FF7 8
CreateFF8 >
(FF> ?
urlFF? B
)FFB C
asFFD F
HttpWebRequestFFG U
;FFU V
BitmapGG 
bitmapGG 
;GG 
usingHH 
(HH 
StreamHH 
streamHH $
=HH% &
requestHH' .
.HH. /
GetResponseHH/ :
(HH: ;
)HH; <
.HH< =
GetResponseStreamHH= N
(HHN O
)HHO P
)HHP Q
{II 
bitmapJJ 
=JJ 
newJJ  
BitmapJJ! '
(JJ' (
streamJJ( .
)JJ. /
;JJ/ 0
bitmapKK 
.KK 
SaveKK 
(KK  
filePathKK  (
)KK( )
;KK) *
}LL 
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
}QQ 
returnRR 
filePathRR 
;RR 
}SS 	
publicUU 
voidUU 
ResizeImageUU 
(UU  
stringUU  &
originalFileUU' 3
,UU3 4
stringUU5 ;
newFileUU< C
,UUC D
intUUE H
newWidthUUI Q
,UUQ R
intUUS V
	maxHeightUUW `
,UU` a
boolUUb f
onlyResizeIfWiderUUg x
)UUx y
{VV 	
SystemWW 
.WW 
DrawingWW 
.WW 
ImageWW  

=WW/ 0
SystemWW1 7
.WW7 8
DrawingWW8 ?
.WW? @
ImageWW@ E
.WWE F
FromFileWWF N
(WWN O
originalFileWWO [
)WW[ \
;WW\ ]

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
onlyResizeIfWider]] !
&&]]" $

.]]2 3
Width]]3 8
<=]]9 ;
newWidth]]< D
)]]D E
newWidth^^ 
=^^ 

.^^( )
Width^^) .
;^^. /
int`` 
	newHeight`` 
=`` 

.``) *
Height``* 0
*``1 2
newWidth``3 ;
/``< =

.``K L
Width``L Q
;``Q R
ifaa 
(aa 
	newHeightaa 
>aa 
	maxHeightaa %
)aa% &
{bb 
newWidthdd 
=dd 

.dd( )
Widthdd) .
*dd/ 0
	maxHeightdd1 :
/dd; <

.ddJ K
HeightddK Q
;ddQ R
	newHeightee 
=ee 
	maxHeightee %
;ee% &
}ff 
Systemhh 
.hh 
Drawinghh 
.hh 
Imagehh  
newImagehh! )
=hh* +

.hh9 :
GetThumbnailImagehh: K
(hhK L
newWidthhhL T
,hhT U
	newHeighthhV _
,hh_ `
nullhha e
,hhe f
IntPtrhhg m
.hhm n
Zerohhn r
)hhr s
;hhs t

.kk 
Disposekk !
(kk! "
)kk" #
;kk# $
newImagenn 
.nn 
Savenn 
(nn 
newFilenn !
)nn! "
;nn" #
}oo 	
}pp 
}qq �
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\KeyGenerator.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\ListExtensions.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
colType 
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
colType- 4
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
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\LogHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
{ 
public 

class 
	LogHelper 
{ 
public		 
static		 
void		 
AddLog		 !
(		! "

db		0 2
,		2 3
LogType		4 ;
logType		< C
,		C D
string		E K
orderNumber		L W
,		W X
string		Y _
message		` g
)		g h
{

 	
Add 
( 
db 
, 
logType 
, 
	LogStatus &
.& '
Success' .
,. /
orderNumber0 ;
,; <
message= D
)D E
;E F
} 	
public 
static 
void 
AddError #
(# $

db2 4
,4 5
LogType6 =
logType> E
,E F
stringG M
orderNumberN Y
,Y Z
string[ a
messageb i
)i j
{ 	
Add 
( 
db 
, 
logType 
, 
	LogStatus &
.& '
Error' ,
,, -
orderNumber. 9
,9 :
message; B
)B C
;C D
} 	
private 
static 
void 
Add 
(  

db. 0
,0 1
LogType2 9
logType: A
,A B
	LogStatusC L
	logStatusM V
,V W
stringX ^
orderNumber_ j
,j k
stringl r
messages z
)z {
{ 	
db 
. 

SystemLogs 
. 
Add 
( 
new !
	SystemLog" +
(+ ,
), -
{ 
Id 
= 
Guid 
. 
NewGuid !
(! "
)" #
,# $
	CreatedAt 
= 
DateTime $
.$ %
Now% (
,( )
LogType 
= 
( 
int 
) 
logType &
,& '
	LogStatus 
= 
( 
int  
)  !
	logStatus! *
,* +
OrderNumber 
= 
orderNumber )
,) *
Message 
= 
message !
} 
)
; 
db 
. 
SaveChanges 
( 
) 
; 
} 	
}   
}!! �
RE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\MultipleButtonAttribute.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
= 
$" 
{ 
Name "
}" #
:# $
{$ %
Argument% -
}- .
". /
;/ 0
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
WE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Hangfire\HangfireAuthorizationFilter.cs
	namespace 	

 
. 
Web 
. 
Hangfire $
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
return 
owinContext 
. 
Authentication -
.- .
User. 2
.2 3
Identity3 ;
.; <
Name< @
==A C
$strD Q
;Q R
} 	
} 
} τ
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\ProData\ProDataApiManager.cs
	namespace 	

 
. 
Web 
. 
ProData #
{
public 

static 
class 
ProDataApiManager )
{ 
private 
static 
string 
_urlTracking *
=+ ,
$str- t
;t u
private 
static 
string 
_urlCreateOrder -
=. /
$str0 x
;x y
private 
static 
string 
_prodataAuth *
=+ ,
$str- O
;O P
public 
static 
readonly 
string %
Success& -
=. /
$str0 9
;9 :
public 
static 
readonly 
string %
Error& +
=, -
$str. 5
;5 6
static 
readonly 
Random 
Random %
=& '
new( +
Random, 2
(2 3
)3 4
;4 5
public 
static 
void 
Load 
(  
)  !
{ 	
string 
json 
= 
File 
. 
ReadAllText *
(* +
$"+ -
C:\\resp.txt- 9
"9 :
): ;
;; <
ProDataResponse 
m 
= 
JsonConvert  +
.+ ,
DeserializeObject, =
<= >
ProDataResponse> M
>M N
(N O
jsonO S
)S T
;T U
} 	
public 
static 
ProDataResponse %
Create& ,
(, -
Campaign- 5
campaign6 >
,> ?
CampaignSegment@ O
segmentP W
,W X
stringY _
whiteLabelDomain` p
)p q
{   	
ProDataRequest!! 
request!! "
=!!# $
new!!% (
ProDataRequest!!) 7
(!!7 8
)!!8 9
{"" 
Io## 
=## 
campaign## 
.## 
OrderNumber## )
,##) *
CampaignName$$ 
=$$ 
campaign$$ '
.$$' (
Approved$$( 0
.$$0 1
CampaignName$$1 =
,$$= >

=%% 
campaign%%  (
.%%( )
Approved%%) 1
.%%1 2
ReBroadCast%%2 =
?%%> ?
$str%%@ C
:%%D E
$str%%F I
,%%I J

WhiteLabel&& 
=&& 
whiteLabelDomain&& -
,&&- .
CreativeUrl'' 
='' 
campaign'' &
.''& '
Assets''' -
.''- .
CreativeUrl''. 9
,''9 :
Quantity(( 
=(( 
campaign(( #
.((# $
Approved(($ ,
.((, -
Quantity((- 5
,((5 6
GeoType)) 
=)) 
$str)) &
,))& '
GeoUrl** 
=** 
campaign** !
.**! "
Assets**" (
.**( )

ZipCodeUrl**) 3
,**3 4

CtrPercent++ 
=++ 
$num++ "
,++" #
Subject,, 
=,, 
campaign,, "
.,," #
Approved,,# +
.,,+ ,
SubjectLine,,, 7
,,,7 8
FromName-- 
=-- 
campaign-- #
.--# $
Approved--$ ,
.--, -
FromLine--- 5
,--5 6
	FromEmail.. 
=.. 
campaign.. $
...$ %
RepresentativeEmail..% 8
,..8 9

DeployDate// 
=// 
campaign// %
.//% &
Approved//& .
.//. /

DeployDate/// 9
?//9 :
.//: ;
ToString//; C
(//C D
StringConstants//D S
.//S T 
DateTimeFormatDashes//T h
)//h i
,//i j
}00 
;00
if22 
(22 
campaign22 
.22 
Approved22 !
.22! "
IsOpenPixel22" -
)22- .
{33 
request44 
.44 
IsOpenPixel44 #
=44$ %
$str44& )
;44) *
request55 
.55 
OpenPercent55 #
=55$ %
(55& '
double55' -
)55- .
campaign55. 6
.556 7
Approved557 ?
.55? @
	OpenGoals55@ I
/55J K
campaign55L T
.55T U
Approved55U ]
.55] ^
Quantity55^ f
;55f g
request66 
.66 
	OpenPixel66 !
=66" #
campaign66$ ,
.66, -
Approved66- 5
.665 6
OpenPixelUrl666 B
;66B C
}77 
else88 
request99 
.99 
IsOpenPixel99 #
=99$ %
$str99& )
;99) *
if;; 
(;; 
!;; 
string;; 
.;; 

(;;% &
segment;;& -
?;;- .
.;;. /
SegmentDataFileUrl;;/ A
);;A B
);;B C
{<< 
request== 
.== 

IsDataFile== "
===# $
$str==% (
;==( )
request>> 
.>> 
DataFileUrl>> #
=>>$ %
segment>>& -
.>>- .
SegmentDataFileUrl>>. @
;>>@ A
request?? 
.?? $
DataFileReplacementParam?? 0
=??1 2
segment??3 :
.??: ;

;??H I
request@@ 
.@@ %
DataFileReplacementColumn@@ 1
=@@2 3
$str@@4 7
;@@7 8
requestAA 
.AA 
DataFileUniqueIpAA (
=AA) *
$strAA+ .
;AA. /
}BB 
elseCC 
requestDD 
.DD 

IsDataFileDD "
=DD# $
$strDD% (
;DD( )
returnFF 
CreateFF 
(FF 
requestFF !
)FF! "
;FF" #
}GG 	
privateII 
staticII 
ProDataResponseII &
CreateII' -
(II- .
ProDataRequestII. <
requestII= D
)IID E
{JJ 	
usingKK 
(KK 

HttpClientKK 
clientKK $
=KK% &
newKK' *

HttpClientKK+ 5
(KK5 6
)KK6 7
)KK7 8
{LL 
clientMM 
.MM 
TimeoutMM 
=MM  
TimeSpanMM! )
.MM) *
FromMinutesMM* 5
(MM5 6
$numMM6 7
)MM7 8
;MM8 9
clientNN 
.NN !
DefaultRequestHeadersNN ,
.NN, -
AddNN- 0
(NN0 1
$strNN1 E
,NNE F
_prodataAuthNNG S
)NNS T
;NNT U
varOO 
httpContentOO 
=OO  !
newOO" %

(OO3 4
requestOO4 ;
.OO; <
ToJsonOO< B
(OOB C
)OOC D
,OOD E
EncodingOOF N
.OON O
UTF8OOO S
,OOS T
$strOOU g
)OOg h
;OOh i
usingPP 
(PP 
HttpResponseMessagePP *
responsePP+ 3
=PP4 5
clientPP6 <
.PP< =
	PostAsyncPP= F
(PPF G
_urlCreateOrderPPG V
,PPV W
httpContentPPX c
)PPc d
.PPd e
ResultPPe k
)PPk l
usingQQ 
(QQ 
HttpContentQQ "
contentQQ# *
=QQ+ ,
responseQQ- 5
.QQ5 6
ContentQQ6 =
)QQ= >
{RR 
stringSS 
responseContentSS *
=SS+ ,
contentSS- 4
.SS4 5
ReadAsStringAsyncSS5 F
(SSF G
)SSG H
.SSH I
ResultSSI O
;SSO P
ProDataResponseTT #
proDataResponseTT$ 3
;TT3 4
tryUU 
{VV 
proDataResponseWW '
=WW( )
JsonConvertWW* 5
.WW5 6
DeserializeObjectWW6 G
<WWG H
ProDataResponseWWH W
>WWW X
(WWX Y
responseContentWWY h
)WWh i
;WWi j
}XX 
catchYY 
(YY 
	ExceptionYY $
exYY% '
)YY' (
{ZZ 
throw[[ 
new[[ !
AdsException[[" .
([[. /
$str[[/ u
)[[u v
;[[v w
}\\ 
return^^ 
proDataResponse^^ *
;^^* +
}__ 
}`` 
}aa 	
privateee 
staticee 
ProDataResponseee &
Fetchee' ,
(ee, -
stringee- 3
orderNumberee4 ?
)ee? @
{ff 	
ifgg 
(gg  
ConfigurationManagergg $
.gg$ %
AppSettingsgg% 0
[gg0 1
$strgg1 9
]gg9 :
==gg; =
$strgg> E
)ggE F
{hh 
orderNumberii 
=ii 
$strii $
;ii$ %
}jj 
ProDataResponsell 
proDataResponsell +
=ll, -
nullll. 2
;ll2 3
stringmm 
urlmm 
=mm 
stringmm 
.mm  
Formatmm  &
(mm& '
_urlTrackingmm' 3
,mm3 4
orderNumbermm5 @
)mm@ A
;mmA B
usingnn 
(nn 

HttpClientnn 
clientnn $
=nn% &
newnn' *

HttpClientnn+ 5
(nn5 6
)nn6 7
)nn7 8
{oo 
clientpp 
.pp 
Timeoutpp 
=pp  
TimeSpanpp! )
.pp) *
FromMinutespp* 5
(pp5 6
$numpp6 7
)pp7 8
;pp8 9
clientqq 
.qq !
DefaultRequestHeadersqq ,
.qq, -
Addqq- 0
(qq0 1
$strqq1 E
,qqE F
_prodataAuthqqG S
)qqS T
;qqT U
usingrr 
(rr 
HttpResponseMessagerr *
responserr+ 3
=rr4 5
clientrr6 <
.rr< =
GetAsyncrr= E
(rrE F
urlrrF I
)rrI J
.rrJ K
ResultrrK Q
)rrQ R
usingss 
(ss 
HttpContentss "
contentss# *
=ss+ ,
responsess- 5
.ss5 6
Contentss6 =
)ss= >
{tt 
stringuu 
responseContentuu *
=uu+ ,
contentuu- 4
.uu4 5
ReadAsStringAsyncuu5 F
(uuF G
)uuG H
.uuH I
ResultuuI O
;uuO P
tryvv 
{ww 
proDataResponsexx '
=xx( )
JsonConvertxx* 5
.xx5 6
DeserializeObjectxx6 G
<xxG H
ProDataResponsexxH W
>xxW X
(xxX Y
responseContentxxY h
)xxh i
;xxi j
proDataResponseyy '
.yy' (
ResponseStatusyy( 6
=yy7 8!
ProDataResponseStatusyy9 N
.yyN O
FoundyyO T
.yyT U
ToStringyyU ]
(yy] ^
)yy^ _
;yy_ `
}zz 
catch{{ 
({{ 
	Exception{{ $
ex{{% '
){{' (
{|| 
if}} 
(}} 
ex}} 
.}} 
Message}} &
.}}& '
ToLowerInvariant}}' 7
(}}7 8
)}}8 9
.}}9 :
Contains}}: B
(}}B C
$str}}C P
)}}P Q
)}}Q R
{~~ 
proDataResponse +
=, -
new. 1
ProDataResponse2 A
(A B
)B C
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
Reports
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
Reports
��- 4
.
��4 5
Report
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
Reports
��# *
.
��* +
Report
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
Core
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
��/ 0

��0 =
,
��= >
Destination_URL
�� '
=
��( )
report
��* 0
.
��0 1
DestinationUrl
��1 ?
,
��? @
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
Io
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
Reports
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
Reports
��- 4
.
��4 5
Report
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
Reports
��# *
.
��* +
Report
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
Core
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
��/ 0

��0 =
,
��= >
Destination_URL
�� '
=
��( )
report
��* 0
.
��0 1
DestinationUrl
��1 ?
,
��? @
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
Io
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
Reports
��; B
?
��B C
.
��C D
Report
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
Reports
��[ b
.
��b c
Report
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
Reports
�� &
.
��& '
Report
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
Io
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
��& '

CampaignId
��' 1
==
��2 4

campaignId
��5 ?
&&
��@ B
x
��C D
.
��D E
OrderNumber
��E P
==
��Q S
orderNumber
��T _
&&
��` b
x
��c d
.
��d e

��e r
==
��s u

&&
�� 
x
��  !
.
��! "
QcRule
��" (
==
��) +
(
��, -
int
��- 0
)
��0 1
qcRule
��1 7
&&
��8 :
x
��; <
.
��< =
Status
��= C
==
��D F
(
��G H
int
��H K
)
��K L 
NotificationStatus
��L ^
.
��^ _
Found
��_ d
)
��d e
;
��e f
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
QcRule
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
}�� �A
NE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\Helpers\S3FileManager.cs
	namespace 	

 
. 
Web 
. 
Async !
.! "
Helpers" )
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
Bucket
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
Bucket% +
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
Bucket""% +
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
Bucket..% +
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
Bucket88J P
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
BucketEEB H
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
BucketFFJ P
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
BucketHH> D
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
BucketRR% +
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
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\NumberHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
{ 
public 

class 
NumberHelper 
{ 
private 
static 
int 
GetTotalFromRange ,
(, -
int- 0
firstNumber1 <
,< =
int> A
secondNumberB N
)N O
{ 	
if 
( 
firstNumber 
== 
$num  
||! #
secondNumber$ 0
==1 3
$num4 5
)5 6
return 
$num 
; 
return

 
secondNumber

 
-

  !
firstNumber

" -
+

. /
$num

0 1
;

1 2
} 	
public
static
int
GetTotal
(
int

firstStart
,
int
firstEnd
,
int
secondStart
,
int
	secondEnd
,
int

thirdStart
,
int
thirdEnd
)
{ 	
return 
GetTotalFromRange $
($ %

firstStart% /
,/ 0
firstEnd1 9
)9 :
+; <
GetTotalFromRange= N
(N O
secondStartO Z
,Z [
	secondEnd\ e
)e f
+g h
GetTotalFromRange $
($ %

thirdStart% /
,/ 0
thirdEnd1 9
)9 :
;: ;
} 	
} 
} �
HE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\QCRuleUtility.cs
	namespace 	

 
. 
Web 
. 
Helpers #
{ 
public 

static 
class 

{ 
public 
static 
string 
	GetString &
(& '
int' *
qcRule+ 1
)1 2
{ 	
switch		 
(		 
qcRule		 
)		 
{

 
case 
( 
int 
) 
QcRule  
.  !#
NotStartedInFirst4Hours! 8
:8 9
return 
$str T
;T U
case
(
int
)
QcRule
.
NotHitOpenRate5In24Hours
:
return 
$str V
;V W
case 
( 
int 
) 
QcRule  
.  !%
NotHitOpenRate10In72Hours! :
:: ;
return 
$str W
;W X
case 
( 
int 
) 
QcRule  
.  !'
NotHitClickRate750In24Hours! <
:< =
return 
$str Y
;Y Z
case 
( 
int 
) 
QcRule  
.  !(
NotHitClickRate1500In72Hours! =
:= >
return 
$str Y
;Y Z
} 
return 
$str 
; 
} 	
} 
} �#
NE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\SortSearchExtension.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\StringHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
source		+ 1
,		1 2
string		3 9
toCheck		: A
)		A B
{

 	
if 
( 
string 
. 

($ %
source% +
)+ ,
), -
return. 4
false5 :
;: ;
return 
source 
. 
ToLowerInvariant *
(* +
)+ ,
., -
Contains- 5
(5 6
toCheck6 =
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
UrlSubstring )
() *
string* 0
source1 7
)7 8
{ 	
var 
parts 
= 
source 
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
EE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\Extensions.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
Regex 
_r 
= 
new 
Regex #
(# $
$str$ ,
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
return!! 
_r!! 
.!! 
Replace!! 
(!! 
s!! 
,!!  
$str!!! $
)!!$ %
;!!% &
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
}.. ��
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Async\Helpers\EmailHelper.cs
	namespace 	

 
. 
Web 
. 
Async !
.! "
Helpers" )
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
static 
void "
SendOrderEmailToClient 1
(1 2
Campaign2 :
campaign; C
,C D
WfpUserE L
loggedInUserM Y
)Y Z
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
;//o p
	SendEmail11 
(11 
loggedInUser11 "
.11" #
Email11# (
,11( )
subject11* 1
,111 2
body113 7
)117 8
;118 9
}22 	
public44 
static44 
void44 
SendOrderEmailToAds44 .
(44. /
Campaign44/ 7
campaign448 @
,44@ A
WfpUser44B I
loggedInUser44J V
,44V W
string44X ^
to44_ a
,44a b
string44c i
ccEmails44j r
)44r s
{55 	
string66 
subject66 
=66 
$"66 (
New Order Received, Order # 66 ;
{66; <
campaign66< D
.66D E
OrderNumber66E P
}66P Q
, Campaign Date 66Q a
{66a b
campaign66b j
.66j k

?66x y
.66y z
ToString	66z �
(
66� �
$str
66� �
)
66� �
}
66� �
, QTY 
66� �
{
66� �
campaign
66� �
.
66� �
Quantity
66� �
}
66� � 
 , Date Submitted 
66� �
{
66� �
campaign
66� �
.
66� �
	CreatedAt
66� �
:
66� �
d
66� �
}
66� �
"
66� �
;
66� �
string88 
body88 
=88 
$@"88 �
�<br/><p>Dear ADS team, <br/><br/> New Order has been entered into system. Order details is as below;</p>
                        <table border=""2"">
                        <tr><th align=""left"">Order #:</th><td>8: @
{::@ A
campaign::A I
.::I J
OrderNumber::J U
}::U VW
K</td></tr>
                        <tr><th align=""left"">Status:</th><td>:;V ?
{;;? @
(;;@ A
CampaignStatus;;A O
);;O P
campaign;;P X
.;;X Y
Status;;Y _
};;_ `Y
M</td></tr>
                        <tr><th align=""left"">Username:</th><td>;<` A
{<<A B
loggedInUser<<B N
.<<N O
UserName<<O W
.<<W X!
ToCapitalLetterString<<X m
(<<m n
)<<n o
.<<o p

(<<} ~
)<<~ 
}	<< �\
O</td></tr>
                        <tr><th align=""left"">User Email:</th><td>	<=� C
{==C D
loggedInUser==D P
.==P Q
Email==Q V
}==V W^
R</td></tr>
                        <tr><th align=""left"">Campaign Name:</th><td>=>W F
{>>F G
campaign>>G O
.>>O P
CampaignName>>P \
}>>\ ]_
S</td></tr>
                        <tr><th align=""left"">Broadcast Date:</th><td>>?] G
{??G H
campaign??H P
.??P Q

.??^ _
Value??_ d
.??d e
ToString??e m
(??m n
$str??n q
)??q r
}??r s\
P</td></tr>
                        <tr><th align=""left"">Rebroadcast:</th><td>?@s D
{@@D E
(@@E F
campaign@@F N
.@@N O
ReBroadCast@@O Z
?@@[ \
$str@@] b
:@@c d
$str@@e i
)@@i j
}@@j ka
U</td></tr>
                        <tr><th align=""left"">Rebroadcast Date:</th><td>@Ak I
{AAI J
(AAJ K
campaignAAK S
.AAS T
ReBroadcastDateAAT c
.AAc d
HasValueAAd l
?AAm n
campaignAAo w
.AAw x
ReBroadcastDate	AAx �
.
AA� �
ToString
AA� �
(
AA� �
)
AA� �
:
AA� �
$str
AA� �
)
AA� �
}
AA� �[
N</td></tr>
                        <tr><th align=""left"">From Line:</th><td>	AB� B
{BBB C
campaignBBC K
.BBK L
FromLineBBL T
}BBT U]
Q</td></tr>
                        <tr><th align=""left"">Subject Line:</th><td>BCU E
{CCE F
campaignCCF N
.CCN O
SubjectLineCCO Z
}CCZ [`
T</td></tr>
                        <tr><th align=""left"">Personalization:</th><td>CD[ H
{DDH I
(DDI J
campaignDDJ R
.DDR S
IsPersonalizationDDS d
?DDe f
$strDDg l
:DDm n
$strDDo s
)DDs t
}DDt uZ
N</td></tr>
                        <tr><th align=""left"">Matchback:</th><td>DEu B
{EEB C
(EEC D
campaignEED L
.EEL M
IsMatchbackEEM X
?EEY Z
$strEE[ `
:EEa b
$strEEc g
)EEg h
}EEh i\
P</td></tr>
                        <tr><th align=""left"">Suppression:</th><td>EFi D
{FFD E
(FFE F
campaignFFF N
.FFN O

?FF] ^
$strFF_ d
:FFe f
$strFFg k
)FFk l
}FFl m\
P</td></tr>
                        <tr><th align=""left"">White Label:</th><td>FGm D
{GGD E
campaignGGE M
.GGM N

WhiteLabelGGN X
}GGX YZ
N</td></tr>
                        <tr><th align=""left"">HTML File:</th><td>GHY B
{HHB C
campaignHHC K
.HHK L
AssetsHHL R
.HHR S
CreativeUrlHHS ^
}HH^ _Z
N</td></tr>
                        <tr><th align=""left"">Test Seed:</th><td>HI_ B
{IIB C
campaignIIC K
.IIK L
AssetsIIL R
.IIR S
TestSeedUrlIIS ^
}II^ _\
P</td></tr>  
                        <tr><th align=""left"">Live Seed:</th><td>IJ_ B
{JJB C
campaignJJC K
.JJK L
AssetsJJL R
.JJR S
LiveSeedUrlJJS ^
}JJ^ _h
\</td></tr>   
                        <tr><th align=""left"">Special Instructions:</th><td>JK_ M
{KKM N
campaignKKN V
.KKV W
SpecialInstructionsKKW j
}KKj k�
t</td></tr>                                     
                        <tr><th align=""left"">Start Time:</th><td>KLk C
{LLC D
campaignLLD L
.LLL M
	CreatedAtLLM V
.LLV W

AddMinutesLLW a
(LLa b
$numLLb c
)LLc d
.LLd e

AddSecondsLLe o
(LLo p
$numLLp r
)LLr s
}LLs tS
G</td></tr>
                        <tr><th align=""left"">IP:</th><td>LMt ;
{MM; <
campaignMM< D
.MMD E
IPMME G
}MMG HX
L</td></tr>
                        <tr><th align=""left"">Browser:</th><td>MNH @
{NN@ A
campaignNNA I
.NNI J
BrowserNNJ Q
}NNQ RS
G</td></tr>
                        <tr><th align=""left"">OS:</th><td>NOR ;
{OO; <
campaignOO< D
.OOD E
OSOOE G
}OOG HY
M</td></tr>
                        <tr><th align=""left"">Referrer:</th><td>OPH A
{PPA B
campaignPPB J
.PPJ K
ReferrerPPK S
}PPS T=
1</td></tr>
                        </table></p> PQT %
{QQ% &
FooterQQ& ,
}QQ, -
"QQ- .
;QQ. /
	SendEmailSS 
(SS 
toSS 
,SS 
subjectSS !
,SS! "
bodySS# '
,SS' (
ccEmailsSS) 1
)SS1 2
;SS2 3
}TT 	
publicVV 
staticVV 
voidVV  
SendApprovedToVendorVV /
(VV/ 0
VendorVV0 6
vendorVV7 =
,VV= >
CampaignVV? G
campaignVVH P
,VVP Q
CampaignSegmentVVR a
segmentVVb i
)VVi j
{WW 	
stringXX 
newOldXX 
=XX 
!XX 
campaignXX %
.XX% &

?XX4 5
$strXX6 ;
:XX< =
$strXX> C
;XXC D
stringYY 
orderNumberYY 
=YY  
campaignYY! )
.YY) *
OrderNumberYY* 5
;YY5 6
stringZZ 

deployDateZZ 
=ZZ 
campaignZZ  (
.ZZ( )
ApprovedZZ) 1
.ZZ1 2

DeployDateZZ2 <
?ZZ< =
.ZZ= >
ToStringZZ> F
(ZZF G
$strZZG J
)ZZJ K
;ZZK L
string[[ 

deployTime[[ 
=[[ 
campaign[[  (
.[[( )
Approved[[) 1
.[[1 2

DeployDate[[2 <
?[[< =
.[[= >
ToString[[> F
([[F G
$str[[G N
)[[N O
;[[O P
string\\ 
quantity\\ 
=\\ 
campaign\\ &
.\\& '
Approved\\' /
.\\/ 0
Quantity\\0 8
.\\8 9
ToString\\9 A
(\\A B
)\\B C
;\\C D
string^^ 
subject^^ 
;^^ 
string__ 
segmentsHtml__ 
=__  !
string__" (
.__( )
Empty__) .
;__. /
if`` 
(`` 
segment`` 
==`` 
null`` 
)``  
{aa 
subjectbb 
=bb 
$"bb 
{bb 
newOldbb #
}bb# $
 Order bb$ +
{bb+ ,
campaignbb, 4
.bb4 5
Approvedbb5 =
.bb= >
CampaignNamebb> J
}bbJ K

, Order # bbK U
{bbU V
campaignbbV ^
.bb^ _
OrderNumberbb_ j
}bbj k
"bbk l
;bbl m
}cc 
elsecc 
{dd 
subjectee 
=ee 
$"ee 
{ee 
newOldee #
}ee# $
 Order ee$ +
{ee+ ,
campaignee, 4
.ee4 5
Approvedee5 =
.ee= >
CampaignNameee> J
}eeJ K

, Order # eeK U
{eeU V
segmenteeV ]
.ee] ^

}eek l
"eel m
;eem n
segmentsHtmlff 
+=ff 
$@"ff  #i
]<table border=""1"">
                                <tr><th align=""left"">Segment</th><td>fg# G
{ggG H
segmentggH O
.ggO P

}gg] ^d
X</td></tr>
                                <tr><th align=""left"">Subject Line</th><td>gh^ L
{hhL M
segmenthhM T
.hhT U
SubjectLinehhU `
}hh` aa
U</td></tr>
                                <tr><th align=""left"">From Line</th><td>hia I
{iiI J
segmentiiJ Q
.iiQ R
FromLineiiR Z
}iiZ [c
W</td></tr>
                                <tr><th align=""left"">White Label</th><td>ij[ K
{jjK L
segmentjjL S
.jjS T

WhiteLabeljjT ^
}jj^ _g
[</td></tr>
                                <tr><th align=""left"">Deployment Date</th><td>jk_ O
{kkO P
segmentkkP W
.kkW X
DeploymentDatekkX f
}kkf ga
U</td></tr>
                                <tr><th align=""left"">Data File</th><td>klg I
{llI J
segmentllJ Q
.llQ R
SegmentDataFileUrlllR d
}lld ee
Y</td></tr>
                                <tr><th align=""left"">Total Records</th><td>lme M
{mmM N
NumberHelpermmN Z
.mmZ [
GetTotalmm[ c
(mmc d
segmentnn 
.nn 
FirstRangeStartnn +
,nn+ ,
segmentnn- 4
.nn4 5

,nnB C
segmentnnD K
.nnK L
SecondRangeStartnnL \
,nn\ ]
segmentnn^ e
.nne f
SecondRangeEndnnf t
,nnt u
segmentoo 
.oo 
ThirdRangeStartoo +
,oo+ ,
segmentoo- 4
.oo4 5

)ooB C
}ooC D
</td></tr></table>ooD V
"ooV W
;ooW X
}pp 
stringrr 
bodyrr 
=rr 
$@"rr 

{rr* +
vendorrr+ 1
.rr1 2
Namerr2 6
}rr6 7�
�</p><br/>
                    Please find below Order details<br/><br/>
                    <table border=""2"">
                    <tr><th align=""left""> Reference #:</th><td>ru7 A
{uuA B
campaignuuB J
.uuJ K
ApproveduuK S
.uuS T
ReferenceNumberuuT c
}uuc dT
H</td></tr>
                    <tr><th align=""left"">Order #:</th><td>uvd <
{vv< =
orderNumbervv= H
}vvH IZ
N</td></tr>
                    <tr><th align=""left"">Campaign Name:</th><td>vwI B
{wwB C
campaignwwC K
.wwK L
ApprovedwwL T
.wwT U
CampaignNamewwU a
}wwa bX
L</td></tr>
                    <tr><th align=""left"">Rebroadcast:</th><td>wxb @
{xx@ A
(xxA B
campaignxxB J
.xxJ K
ApprovedxxK S
.xxS T
ReBroadCastxxT _
?xx_ `
$strxxa f
:xxf g
$strxxh l
)xxl m
}xxm n�
w</td></tr>                                        
                    <tr><th align=""left"">Broadcast Date:</th><td>xyn C
{yyC D
campaignyyD L
.yyL M
ApprovedyyM U
.yyU V

DeployDateyyV `
.yy` a
Valueyya f
:yyf g
dyyg h
}yyh iV
J</td></tr>
                    <tr><th align=""left"">From Line:</th><td>yzi >
{zz> ?
campaignzz? G
.zzG H
ApprovedzzH P
.zzP Q
FromLinezzQ Y
}zzY ZY
M</td></tr>
                    <tr><th align=""left"">Subject Line:</th><td>z{Z A
{{{A B
campaign{{B J
.{{J K
Approved{{K S
.{{S T
SubjectLine{{T _
}{{_ `T
H</td></tr>
                    <tr><th align=""left"">Opt Out:</th><td>{|` <
{||< =
campaign||= E
.||E F
OptOut||F L
}||L MX
L</td></tr>
                    <tr><th align=""left"">White Label:</th><td>|}M @
{}}@ A
campaign}}A I
.}}I J
Approved}}J R
.}}R S

WhiteLabel}}S ]
}}}] ^�
x</td></tr>                                        
                    <tr><th align=""left"">Personalization:</th><td>}~^ D
{~~D E
(~~E F
campaign~~F N
.~~N O
IsPersonalization~~O `
?~~` a
$str~~b g
:~~g h
$str~~i m
)~~m n
}~~n oY
M</td></tr>
                    <tr><th align=""left"">Creative URL:</th><td>~o A
{A B
campaignB J
.J K
AssetsK Q
.Q R
CreativeUrlR ]
}] ^V
I</td></tr>
                    <tr><th align=""left"">Quantity:</th><td>	�^ =
{
��= >
quantity
��> F
}
��F GV
H</td></tr>
                    <tr><th align=""left"">Geo (s):</th><td>
��G <
{
��< =
campaign
��= E
.
��E F
Approved
��F N
.
��N O

GeoDetails
��O Y
}
��Y Z[
M</td></tr>
                    <tr><th align=""left"">Demographics:</th><td>
��Z A
{
��A B
campaign
��B J
.
��J K
Approved
��K S
.
��S T
Demographics
��T `
}
��` aZ
L</td></tr>
                    <tr><tr><th align=""left"">Zip URL:</th><td>
��a @
{
��@ A
campaign
��A I
.
��I J
Assets
��J P
.
��P Q

ZipCodeUrl
��Q [
}
��[ \c
U</td></tr>
                    <tr><th align=""left"">Special Instructions:</th><td>
��\ I
{
��I J
campaign
��J R
.
��R S
Approved
��S [
.
��[ \!
SpecialInstructions
��\ o
}
��o pZ
L</td></tr>
                    <tr><th align=""left"">Deploy Date:</th><td>
��p @
{
��@ A

deployDate
��A K
}
��K LZ
L</td></tr>
                    <tr><th align=""left"">Deploy Time:</th><td>
��L @
{
��@ A

deployTime
��A K
}
��K L^
P</td></tr>
                    <tr><th align=""left"">ReportSite Link:</th><td>
��L D
{
��D E
campaign
��E M
.
��M N
Approved
��N V
.
��V W
ReportSiteLink
��W e
}
��e f\
N</td></tr>
                    <tr><th align=""left"">Link Breakout:</th><td>
��f B
{
��B C
campaign
��C K
.
��K L
Approved
��L T
.
��T U
LinkBreakout
��U a
}
��a b]
O</td></tr>
                    <tr><th align=""left"">Has Open Pixel:</th><td>
��b C
{
��C D
(
��D E
campaign
��E M
.
��M N
Approved
��N V
.
��V W
IsOpenPixel
��W b
?
��b c
$str
��d i
:
��i j
$str
��k o
)
��o p
}
��p q]
O</td></tr>
                    <tr><th align=""left"">Open Pixel URL:</th><td>
��q C
{
��C D
campaign
��D L
.
��L M
Approved
��M U
.
��U V
OpenPixelUrl
��V b
}
��b cY
K</td></tr>
                    <tr><th align=""left"">Open Goals:</th><td>
��c ?
{
��? @
campaign
��@ H
.
��H I
Approved
��I Q
.
��Q R
	OpenGoals
��R [
}
��[ \Z
L</td></tr>
                    <tr><th align=""left"">Click Goals:</th><td>
��\ @
{
��@ A
campaign
��A I
.
��I J
Approved
��J R
.
��R S

ClickGoals
��S ]
}
��] ^[
M</td></tr>
                    <tr><th align=""left"">Segment Data:</th><td>
��^ A
{
��A B
segmentsHtml
��B N
}
��N OC
5</td></tr>
                    </table></p> <p></p> 
��O )
{
��) *
Footer
��* 0
}
��0 1
"
��1 2
;
��2 3
	SendEmail
�� 
(
�� 
vendor
�� 
.
�� 
Email
�� "
,
��" #
subject
��$ +
,
��+ ,
body
��- 1
,
��1 2
vendor
��3 9
.
��9 :
CcEmails
��: B
)
��B C
;
��C D
}
�� 	
public
�� 
static
�� 
void
�� '
SendNotificationsToVendor
�� 4
(
��4 5
Vendor
��5 ;
vendor
��< B
,
��B C
List
��D H
<
��H I
Campaign
��I Q
>
��Q R
	campaigns
��S \
)
��\ ]
{
�� 	
string
�� 
subject
�� 
=
�� 
$str
�� <
;
��< =

�� 
problems
�� "
=
��# $
new
��% (

��) 6
(
��6 7
$str��7 �
)��� �
;��� �
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
�� 
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

��6 C
)
��C D
{
�� 
problems
�� 
.
�� 
Append
�� #
(
��# $
$"
��$ &
<tr><td>
��& .
{
��. /
campaign
��/ 7
.
��7 8
OrderNumber
��8 C
}
��C D
	</td><td>
��D M
{
��M N
campaign
��N V
.
��V W
CampaignName
��W c
}
��c d
	</td><td>
��d m
{
��m n
notification
��n z
.
��z {
	CheckTime��{ �
}��� �
	</td><td>��� �
{��� �
(��� �
QcRule��� �
)��� �
notification��� �
.��� �
QcRule��� �
}��� �
	</td><td>��� �
{��� �

.��� �
	GetString��� �
(��� �
notification��� �
.��� �
QcRule��� �
)��� �
}��� �

</td></tr>��� �
"��� �
)��� �
;��� �
}
�� 
}
�� 
problems
�� 
.
�� 
Append
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
string
�� 
body
�� 
=
�� 
$@"
�� 

�� *
{
��* +
vendor
��+ 1
.
��1 2
Name
��2 6
}
��6 7K
=</p><br/>There is problem with these orders<br/><br/></p> <p>
��7 t
{
��t u
problems
��u }
}
��} ~
</p> ��~ �
{��� �
Footer��� �
}��� �
"��� �
;��� �
	SendEmail
�� 
(
�� 
vendor
�� 
.
�� 
Email
�� "
,
��" #
subject
��$ +
,
��+ ,
body
��- 1
,
��1 2
vendor
��3 9
.
��9 :
CcEmails
��: B
)
��B C
;
��C D
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
}�� �C
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\ExceptionHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
EE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\FileHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\GatePassGenerator.cs
	namespace 	

 
. 
Web 
. 
Helpers #
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

formNumber 
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

formNumber 
. 
ToString &
(& '
$str' *
)* +
;+ ,
}
static 
Random 
_random 
= 
new  #
Random$ *
(* +
)+ ,
;, -
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
;0 1
_random 
. 
	NextBytes 
( 
buffer $
)$ %
;% &
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
+ 
_random #
.# $
Next$ (
(( )
$num) +
)+ ,
., -
ToString- 5
(5 6
$str6 9
)9 :
;: ;
} 	
} 
} �
AE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Hubs\WFPICTHub.cs
	namespace 	

 
. 
Web 
. 
Hubs  
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
	WfpictHub 
: 
Hub  
{ 
private		 
readonly		 

_wfpictUpdater		' 5
;		5 6
public 
	WfpictHub 
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
	WfpictHub 
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
EE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Hubs\WFPICTUpdater.cs
	namespace

 	



 
.

 
Web

 
.

 
Hubs

  
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
	WfpictHub? H
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
SystemLogVmBB- 8
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
}\\ ��
?E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\API\Campaign.cs
	namespace 	

 
. 
Web 
. 
API 
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
(``+ ,
Core``, 0
.``0 1
Entities``1 9
.``9 :
Campaign``: B
campaign``C K
)``K L
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
RE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignTrackingDetailVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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
KE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignSegmentVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
CampaignSegmentVm "
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 

CampaignId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
OrderNumber		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
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
public
string
SubjectLine
{
get
;
set
;
}
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
long 
Quantity 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 

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

{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
SegmentDataFileUrl (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DateTime 
? 
DateFetched $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
UploadStatus 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 

{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DateTime 
? 
DateApproved %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
? 
DateComplete %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
}!! 
}"" �.
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignApprovedVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public		 

class		 
CampaignApprovedVm		 #
{

 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
? 

CampaignId 
{  !
get" %
;% &
set' *
;* +
}, -
public
string
OrderNumber
{
get
;
set
;
}
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
long 
ReferenceNumber #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ReBroadCast 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
ReBroadcastDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

DeployDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 

GeoDetails  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Demographics "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Range	 
( 
$num 
, 
int 
. 
MaxValue 
, 
ErrorMessage  ,
=- .
$str/ T
)T U
]U V
public 
long 
Quantity 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
SpecialInstructions )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
ReportSiteLink $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public   
string   
LinkBreakout   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
public## 
long## 
	OpenGoals## 
{## 
get##  #
;### $
set##% (
;##( )
}##* +
public$$ 
long$$ 

ClickGoals$$ 
{$$  
get$$! $
;$$$ %
set$$& )
;$$) *
}$$+ ,
public%% 
long%% 
DataFileQuantity%% $
{%%% &
get%%' *
;%%* +
set%%, /
;%%/ 0
}%%1 2
public&& 
string&& 
DataFileUrl&& !
{&&" #
get&&$ '
;&&' (
set&&) ,
;&&, -
}&&. /
public)) 
bool)) 
IsOpenPixel)) 
{))  !
get))" %
;))% &
set))' *
;))* +
})), -
public** 
string** 
OpenPixelUrl** "
{**# $
get**% (
;**( )
set*** -
;**- .
}**/ 0
public++ 
bool++ 
IsOmniOrder++ 
{++  !
get++" %
;++% &
set++' *
;++* +
}++, -
public,, 
DateTime,, 
?,, 
OmniDeployDate,, '
{,,( )
get,,* -
;,,- .
set,,/ 2
;,,2 3
},,4 5
public-- 
long-- 
Impressions-- 
{--  !
get--" %
;--% &
set--' *
;--* +
}--, -
public// 
bool// 
IsUseApiDataForOpen// '
{//( )
get//* -
;//- .
set/// 2
;//2 3
}//4 5
public11 
List11 
<11 
ChannelType11 
>11  
ChannelTypes11! -
{11. /
get110 3
;113 4
set115 8
;118 9
}11: ;
public33 

Assets33 #
{33$ %
get33& )
;33) *
set33+ .
;33. /
}330 1
public55 
ICollection55 
<55 
CampaignSegmentVm55 ,
>55, -
Segments55. 6
{557 8
get559 <
;55< =
set55> A
;55A B
}55C D
public77 
CampaignApprovedVm77 !
(77! "
)77" #
{88 	
Segments99 
=99 
new99 
HashSet99 "
<99" #
CampaignSegmentVm99# 4
>994 5
(995 6
)996 7
;997 8
}:: 	
};; 
}<< �.
KE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignTestingVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public		 

class		 
CampaignTestingVm		 "
{

 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
? 

CampaignId 
{  !
get" %
;% &
set' *
;* +
}, -
public
string
OrderNumber
{
get
;
set
;
}
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ReBroadCast 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
ReBroadcastDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
FromLine 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
SubjectLine !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsTested 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
? 
TestingTime $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
TestingUrgency !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 

DeployDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 

GeoDetails  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Demographics "
{# $
get% (
;( )
set* -
;- .
}/ 0
[   	
Range  	 
(   
$num   
,   
int   
.   
MaxValue   
,   
ErrorMessage    ,
=  - .
$str  / T
)  T U
]  U V
public!! 
long!! 
Quantity!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
public"" 
string"" 
SpecialInstructions"" )
{""* +
get"", /
;""/ 0
set""1 4
;""4 5
}""6 7
public%% 
long%% 
	OpenGoals%% 
{%% 
get%%  #
;%%# $
set%%% (
;%%( )
}%%* +
public&& 
long&& 

ClickGoals&& 
{&&  
get&&! $
;&&$ %
set&&& )
;&&) *
}&&+ ,
public'' 
long'' 
DataFileQuantity'' $
{''% &
get''' *
;''* +
set'', /
;''/ 0
}''1 2
public(( 
string(( 
DataFileUrl(( !
{((" #
get(($ '
;((' (
set(() ,
;((, -
}((. /
public)) 
DateTime)) 
?)) 
DateFetched)) $
{))% &
get))' *
;))* +
set)), /
;))/ 0
}))1 2
public,, 
bool,, 
IsOpenPixel,, 
{,,  !
get,," %
;,,% &
set,,' *
;,,* +
},,, -
public-- 
string-- 
OpenPixelUrl-- "
{--# $
get--% (
;--( )
set--* -
;--- .
}--/ 0
public.. 
bool.. 
IsOmniOrder.. 
{..  !
get.." %
;..% &
set..' *
;..* +
}.., -
public// 
DateTime// 
?// 
OmniDeployDate// '
{//( )
get//* -
;//- .
set/// 2
;//2 3
}//4 5
public00 
long00 
Impressions00 
{00  !
get00" %
;00% &
set00' *
;00* +
}00, -
public11 
List11 
<11 
ChannelType11 
>11  
ChannelTypes11! -
{11. /
get110 3
;113 4
set115 8
;118 9
}11: ;
public33 

Assets33 #
{33$ %
get33& )
;33) *
set33+ .
;33. /
}330 1
public55 
ICollection55 
<55 
CampaignSegmentVm55 ,
>55, -
Segments55. 6
{557 8
get559 <
;55< =
set55> A
;55A B
}55C D
public77 
CampaignTestingVm77  
(77  !
)77! "
{88 	
Segments99 
=99 
new99 
HashSet99 "
<99" #
CampaignSegmentVm99# 4
>994 5
(995 6
)996 7
;997 8
}:: 	
};; 
}<< �N
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{		 
public

 

sealed

 
class

 

CampaignVm

 "
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
string
OrderNumber
{
get
;
set
;
}
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
public 
DateTime 
? 

{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 

DeployDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
RepresentativeName (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
RepresentativeEmail )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
ReBroadCast 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
ReBroadcastDate (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
long 
Price 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
TestingUrgency !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 

GeoDetails  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Demographics "
{# $
get% (
;( )
set* -
;- .
}/ 0
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
public%% 
string%% 
FromLine%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
public&& 
string&& 
SubjectLine&& !
{&&" #
get&&$ '
;&&' (
set&&) ,
;&&, -
}&&. /
public(( 
bool(( 
IsPersonalization(( %
{((& '
get((( +
;((+ ,
set((- 0
;((0 1
}((2 3
public)) 
bool)) 
IsMatchback)) 
{))  !
get))" %
;))% &
set))' *
;))* +
})), -
public** 
bool** 

{**" #
get**$ '
;**' (
set**) ,
;**, -
}**. /
public++ 
string++ 

WhiteLabel++  
{++! "
get++# &
;++& '
set++( +
;+++ ,
}++- .
public,, 
string,, 
OptOut,, 
{,, 
get,, "
;,," #
set,,$ '
;,,' (
},,) *
public-- 
bool-- 
IsAddViewInBrowser-- &
{--' (
get--) ,
;--, -
set--. 1
;--1 2
}--3 4
public.. 
bool.. 
IsAddOptOut.. 
{..  !
get.." %
;..% &
set..' *
;..* +
}.., -
public// 
string// 
SpecialInstructions// )
{//* +
get//, /
;/// 0
set//1 4
;//4 5
}//6 7
public00 
string00 
Ip00 
{00 
get00 
;00 
set00  #
;00# $
}00% &
public11 
string11 
Browser11 
{11 
get11  #
;11# $
set11% (
;11( )
}11* +
public22 
string22 
Os22 
{22 
get22 
;22 
set22  #
;22# $
}22% &
public33 
string33 
Referrer33 
{33  
get33! $
;33$ %
set33& )
;33) *
}33+ ,
public55 
string55 
AssignedToCustomer55 (
{55) *
get55+ .
;55. /
set550 3
;553 4
}555 6
public88 
long88 
DataFileQuantity88 $
{88% &
get88' *
;88* +
set88, /
;88/ 0
}881 2
public;; 
bool;; 
IsOpenPixel;; 
{;;  !
get;;" %
;;;% &
set;;' *
;;;* +
};;, -
public<< 
string<< 
OpenPixelUrl<< "
{<<# $
get<<% (
;<<( )
set<<* -
;<<- .
}<</ 0
public== 
bool== 
IsOmniOrder== 
{==  !
get==" %
;==% &
set==' *
;==* +
}==, -
public>> 
DateTime>> 
?>> 
OmniDeployDate>> '
{>>( )
get>>* -
;>>- .
set>>/ 2
;>>2 3
}>>4 5
public?? 
long?? 
Impressions?? 
{??  !
get??" %
;??% &
set??' *
;??* +
}??, -
public@@ 
List@@ 
<@@ 
ChannelType@@ 
>@@  
ChannelTypes@@! -
{@@. /
get@@0 3
;@@3 4
set@@5 8
;@@8 9
}@@: ;
publicBB 
boolBB 

{BB" #
getBB$ '
;BB' (
setBB) ,
;BB, -
}BB. /
publicCC 
DateTimeCC 
?CC 
ReBroadcastedDateCC *
{CC+ ,
getCC- 0
;CC0 1
setCC2 5
;CC5 6
}CC7 8
publicDD 
longDD !
ReBroadcastedQuantityDD )
{DD* +
getDD, /
;DD/ 0
setDD1 4
;DD4 5
}DD6 7
publicEE 
stringEE $
ReBroadcastedOrderNumberEE .
{EE/ 0
getEE1 4
;EE4 5
setEE6 9
;EE9 :
}EE; <
publicGG 
GuidGG 
?GG 
AssetsIdGG 
{GG 
getGG  #
;GG# $
setGG% (
;GG( )
}GG* +
publicHH 

AssetsHH #
{HH$ %
getHH& )
;HH) *
setHH+ .
;HH. /
}HH0 1
publicJJ 
GuidJJ 
?JJ 
	TestingIdJJ 
{JJ  
getJJ! $
;JJ$ %
setJJ& )
;JJ) *
}JJ+ ,
publicKK 
CampaignTestingKK 
TestingKK &
{KK' (
getKK) ,
;KK, -
setKK. 1
;KK1 2
}KK3 4
publicMM 
GuidMM 
?MM 

CreativeIdMM 
{MM  !
getMM" %
;MM% &
setMM' *
;MM* +
}MM, -
publicNN 
CampaignCreativeNN 
CreativeNN  (
{NN) *
getNN+ .
;NN. /
setNN0 3
;NN3 4
}NN5 6
publicPP 
GuidPP 
?PP 

ApprovedIdPP 
{PP  !
getPP" %
;PP% &
setPP' *
;PP* +
}PP, -
publicQQ 
CampaignApprovedQQ 
ApprovedQQ  (
{QQ) *
getQQ+ .
;QQ. /
setQQ0 3
;QQ3 4
}QQ5 6
publicSS 
ICollectionSS 
<SS 
CampaignSegmentVmSS ,
>SS, -
SegmentsSS. 6
{SS7 8
getSS9 <
;SS< =
setSS> A
;SSA B
}SSC D
publicXX 

CampaignVmXX 
(XX 
)XX 
{YY 	
SegmentsZZ 
=ZZ 
newZZ 
HashSetZZ "
<ZZ" #
CampaignSegmentVmZZ# 4
>ZZ4 5
(ZZ5 6
)ZZ6 7
;ZZ7 8
}^^ 	
public`` 
Campaign`` 

ToCampaign`` "
(``" #
)``# $
{aa 	
varbb 
cbb 
=bb 
newbb 
Campaignbb  
(bb  !
)bb! "
{cc 
Iddd 
=dd 
Iddd 
,dd 
OrderNumberee 
=ee 
OrderNumberee )
,ee) *
}ff 
;ff
foreachgg 
(gg 
vargg 
	segmentVmgg "
ingg# %
Segmentsgg& .
)gg. /
{hh 
cii 
.ii 
Segmentsii 
.ii 
Addii 
(ii 

TinyMapperii )
.ii) *
Mapii* -
<ii- .
CampaignSegmentii. =
>ii= >
(ii> ?
	segmentVmii? H
)iiH I
)iiI J
;iiJ K
}jj 
returnkk 
ckk 
;kk 
}ll 	
}mm 
}oo �
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Helpers\CreativeHelper.cs
	namespace 	

 
. 
Web 
. 
Helpers #
{ 
public 

class 
CreativeHelper 
{		 
public

 
static

 
List

 
<

 
SelectItemPair

 )
>

) *

ReadEmails

+ 5
(

5 6
string

6 <
filePath

= E
)

E F
{ 	
List 
< 
SelectItemPair 
>  
emails! '
=( )
new* -
List. 2
<2 3
SelectItemPair3 A
>A B
(B C
)C D
;D E
foreach
(
var
line
in
File
.
ReadAllLines
(
filePath
)
)
{ 
var 
trimmed 
= 
StringHelper *
.* +
Trim+ /
(/ 0
line0 4
)4 5
;5 6
if 
( 
string 
. 

(( )
trimmed) 0
)0 1
)1 2
continue3 ;
;; <
if 
( 
! 
EmailChecker  
.  !
IsValidEmail! -
(- .
trimmed. 5
)5 6
)6 7
continue8 @
;@ A
emails 
. 
Add 
( 
new 
SelectItemPair -
(- .
). /
{0 1
Selected2 :
=; <
true= A
,A B
TextC G
=H I
trimmedJ Q
,Q R
ValueS X
=Y Z
trimmed[ b
}c d
)d e
;e f
} 
return 
emails 
; 
} 	
public 
void 
Add 
( 
string 
filePath '
,' (
string) /
email0 5
)5 6
{ 	
File 
. 
AppendAllLines 
(  
filePath  (
,( )
new* -
string. 4
[4 5
]5 6
{7 8
email8 =
}= >
)> ?
;? @
} 	
public 
void 
Remove 
( 
string !
filePath" *
,* +
string, 2
email3 8
)8 9
{ 	
File 
. 

( 
filePath '
,' (
File) -
.- .
ReadAllLines. :
(: ;
filePath; C
)C D
.D E
WhereE J
(J K
xK L
=>M O
StringHelperP \
.\ ]
Trim] a
(a b
xb c
)c d
!=e g
emailh m
)m n
)n o
;o p
}   	
}!! 
}"" �
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CreativeVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 

CreativeVm 
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
} �c
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignTrackingVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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
KE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\HtmlProcessResult.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
HtmlProcessResult "
{ 
public 
string 
FilePathLive "
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
IE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\ProData\ProDataRequest.cs
	namespace 	

 
. 
Web 
. 
ProData #
{ 
public 

class 
ProDataRequest 
{ 
public 
string 
Io 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 

WhiteLabel  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
CreativeUrl		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
long

 
Quantity
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
string 
GeoType 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
GeoUrl 
{ 
get "
;" #
set$ '
;' (
}) *
public
double

CtrPercent
{
get
;
set
;
}
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
FromName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	FromEmail 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

DeployDate  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
IsOpenPixel !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
double 
OpenPercent !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	OpenPixel 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

IsDataFile  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
DataFileUrl !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string $
DataFileReplacementParam .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string %
DataFileReplacementColumn /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string 
DataFileUniqueIp &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} �!
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\ProData\ProDataResponse.cs
	namespace 	

 
. 
Web 
. 
ProData #
{ 
public 

class 
ProDataResponse  
{ 
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
Reports		 
Reports		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
	Timestamp
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
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
string 
> 
ErrorFields '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public
long
QueuedPendingCampaignId
{
get
;
set
;
}
public 
string 
ResponseStatus $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
ResponseMessage %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ErrorMessage "
{ 	
get 
{ 

errorMessage *
=+ ,
new- 0

(> ?
Message? F
)F G
;G H
foreach 
( 
var 
field "
in# %
ErrorFields& 1
)1 2
{ 
errorMessage  
.  !
Append! '
(' (
$"( *
<br/>* /
{/ 0
field0 5
}5 6
"6 7
)7 8
;8 9
} 
return 
errorMessage #
.# $
ToString$ ,
(, -
)- .
;. /
} 
} 	
} 
public 

class 
Reports 
{   
public!! 
Report!! 
[!! 
]!! 
Report!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
}"" 
public$$ 

class$$ 
Report$$ 
{%% 
public&& 
string&& 
Io&& 
{&& 
get&& 
;&& 
set&&  #
;&&# $
}&&% &
public'' 
string'' 

{''$ %
get''& )
;'') *
set''+ .
;''. /
}''0 1
public(( 
string(( 
DestinationUrl(( $
{((% &
get((' *
;((* +
set((, /
;((/ 0
}((1 2
public)) 
string)) 
CampaignStartDate)) '
{))( )
get))* -
;))- .
set))/ 2
;))2 3
}))4 5
public** 
string** 

ClickCount**  
{**! "
get**# &
;**& '
set**( +
;**+ ,
}**- .
public++ 
string++ 
CampaignName++ "
{++# $
get++% (
;++( )
set++* -
;++- .
}++/ 0
public,, 
long,, 
	UniqueCnt,, 
{,, 
get,,  #
;,,# $
set,,% (
;,,( )
},,* +
public-- 
long-- 
	MobileCnt-- 
{-- 
get--  #
;--# $
set--% (
;--( )
}--* +
public.. 
long.. 

{.." #
get..$ '
;..' (
set..) ,
;.., -
}... /
}// 
}11 �
ME:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CompanyPermissionVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
CompanyPermissionVm $
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
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CompanyRoleVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CampaignSearchVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
CampaignSearchVm !
{ 
public 
string 
	SortOrder 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
Page 
{ 
get 
; 
set  #
;# $
}% &
public 
string 

SearchType  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
BasicString		 !
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
BasicOrderNumber
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
BasicStatus !
{" #
get$ '
;' (
set) ,
;, -
}. /
public
string
AdvancedStatus
{
get
;
set
;
}
public 
string 
AdvancedUser "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
CampaignName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
IsTested 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
OrderedFrom !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	OrderedTo 
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
BroadcastTo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ClearSessionId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �U
FE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\OfficeUserVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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
	IsUsesApiQQ 
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
HE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\CompanyUsersVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
CompanyUsersVm 
{ 
public		 
Guid		 
Id		 
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
OfficeId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UnitId 
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
FE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\JsonResponse.cs
	namespace 	

 
. 
Web 
. 
Models "
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
CE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\ManageVms.cs
	namespace 	

 
. 
Web 
. 
Models "
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
EE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\SystemLogVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
SystemLogVm 
{ 
public 
string 
	CreatedAt 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LogType 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
OrderNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public

 
SystemLogVm

 
(

 
)

 
{ 	
} 	
}
} �
FE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\UploadFileVm.cs
	namespace 	

 
. 
Web 
. 
Models "
{ 
public 

class 
UploadFileVm 
{ 
public 
string 
FileName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
FileType 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
OrderNumber		 !
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
 


 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
bool 
IsValid 
( 
string "
filePath# +
)+ ,
{
bool 
isValid 
= 
true 
;  
switch 
( 
FileType 
) 
{ 
case 
$str )
:) *
int 
n 
; 
foreach 
( 
var  
line! %
in& (
File) -
.- .
ReadAllLines. :
(: ;
filePath; C
)C D
)D E
{ 
if 
( 
line  
.  !
Trim! %
(% &
)& '
.' (
Length( .
!=/ 1
$num2 3
||4 6
!7 8
int8 ;
.; <
TryParse< D
(D E
lineE I
.I J
TrimJ N
(N O
)O P
,P Q
outR U
nV W
)W X
)X Y
{ 
isValid #
=$ %
false& +
;+ ,
break !
;! "
} 
} 
break 
; 
} 
return 
isValid 
; 
} 	
}   
}!! �
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Models\UserProfileVm.cs
	namespace 	

 
. 
Web 
. 
Models "
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
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 


( 
$str ,
), -
]- .
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
$str .
). /
]/ 0
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
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Web\Reports\TrackingReports.cs
	namespace 	

 
. 
Web 
. 
Reports #
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
ClickToOpenPercentage
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
�� 
(
�� 
retRow
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
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
;

