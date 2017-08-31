¸
=E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\OrderVia.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
OrderVia 
{ 
Email 
, 
Api 
} 
} Ý
CE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\ReportTemplate.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
ReportTemplate 
{ 
	Template1 
, 
	Template2 
, 
} 
} Í
>E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\LogStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
	LogStatus 
{ 
Success 
, 
Error 
, 
} 
} ù
JE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\ProDataResponseStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum !
ProDataResponseStatus %
{ 
NotFound 
, 
Found 
, 
Error 
} 
}		 ã
<E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\LogType.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
LogType 
{ 
ProData 
, 
	MailChimp 
, 
FileProcessing 
, 
DataProcessing 
, 
RulesProcessing		 
,		 
Orders

 
} 
} ë
@E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\ChannelType.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
ChannelType 
{ 
Retargeting 
, 
Display 
, 
Social 
} 
}		 „
GE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\NotificationStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
NotificationStatus "
{ 
Found 
, 
Resolved 
, 
Expired 
, 
} 
}		 ‚
;E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\QcRule.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
QcRule 
{ #
NotStartedInFirst4Hours 
,  $
NotHitOpenRate5In24Hours  
,  !%
NotHitOpenRate10In72Hours !
,! "'
NotHitClickRate750In24Hours #
,# $(
NotHitClickRate1500In72Hours		 $
}

 
} —
BE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\SegmentStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
SegmentStatus 
{ 
	Generated 
, 
Approved 
, 

Monitoring 
, 
Complete 
}		 
}

 Ö
CE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\CampaignStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
CampaignStatus 
{ 
OrderRecevied 
= 
$num 
, 
Rebroadcasted 
= 
$num 
, 
Testing 
= 
$num 
, 
Approved 
= 
$num 
, 

Monitoring		 
=		 
$num		 
,		 
	Completed 
= 
$num 
, 
	Cancelled 
= 
$num 
, 
NotRebroadcasted 
= 
$num 
, 
} 
} Á.
?E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\EnumHelper.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

static 
class 

EnumHelper "
{		 
public

 
static

 
IEnumerable

 !
<

! "
TextValuePair

" /
>

/ 0$
GetEnumDescriptionValues

1 I
(

I J
Type

J N
enumType

O W
)

W X
{ 	
var 
enums 
= 
new 
List  
<  !
TextValuePair! .
>. /
(/ 0
)0 1
;1 2
foreach 
( 
System 
. 
Enum  
item! %
in& (
System) /
./ 0
Enum0 4
.4 5
	GetValues5 >
(> ?
enumType? G
)G H
)H I
{ 
var 
e 
= 
new 
TextValuePair )
() *
)* +
{ 
Text 
= 
GetDescriptions *
(* +
item+ /
)/ 0
.0 1
FirstOrDefault1 ?
(? @
)@ A
,A B
Value 
= 
Convert #
.# $
ToInt32$ +
(+ ,
item, 0
)0 1
.1 2
ToString2 :
(: ;
); <
} 
; 
enums 
. 
Add 
( 
e 
) 
; 
} 
return 
enums 
; 
} 	
public 
static 
IEnumerable !
<! "
TextValuePair" /
>/ 0
GetEnumTextValues1 B
(B C
TypeC G
enumTypeH P
)P Q
{ 	
var 
enums 
= 
new 
List  
<  !
TextValuePair! .
>. /
(/ 0
)0 1
;1 2
foreach 
( 
System 
. 
Enum  
item! %
in& (
System) /
./ 0
Enum0 4
.4 5
	GetValues5 >
(> ?
enumType? G
)G H
)H I
{ 
var 
e 
= 
new 
TextValuePair )
() *
)* +
{ 
Text   
=   
System   !
.  ! "
Enum  " &
.  & '
GetName  ' .
(  . /
enumType  / 7
,  7 8
item  9 =
)  = >
,  > ?
Value!! 
=!! 
Convert!! 
.!!  
ToInt32!!  '
(!!' (
item!!( ,
)!!, -
.!!- .
ToString!!. 6
(!!6 7
)!!7 8
}"" 
;"" 
enums## 
.## 
Add## 
(## 
e## 
)## 
;## 
}$$ 
return%% 
enums%% 
;%% 
}&& 	
public(( 
static(( 
IEnumerable(( !
<((! "
string((" (
>((( )
GetDescriptions((* 9
(((9 :
Type((: >
enumType((? G
)((G H
{)) 	
var** 
descs** 
=** 
new** 
List**  
<**  !
string**! '
>**' (
(**( )
)**) *
;*** +
foreach++ 
(++ 
var++ 
item++ 
in++  
System++! '
.++' (
Enum++( ,
.++, -
	GetValues++- 6
(++6 7
enumType++7 ?
)++? @
)++@ A
{,, 
descs-- 
.-- 
AddRange-- 
(-- 
GetDescriptions-- .
(--. /
item--/ 3
as--4 6
System--7 =
.--= >
Enum--> B
)--B C
)--C D
;--D E
}.. 
return// 
descs// 
;// 
}00 	
private22 
static22 
IEnumerable22 "
<22" #
string22# )
>22) *
GetDescriptions22+ :
(22: ;
System22; A
.22A B
Enum22B F
value22G L
)22L M
{33 	
var44 
descs44 
=44 
new44 
List44  
<44  !
string44! '
>44' (
(44( )
)44) *
;44* +
var55 
type55 
=55 
value55 
.55 
GetType55 $
(55$ %
)55% &
;55& '
var66 
name66 
=66 
System66 
.66 
Enum66 "
.66" #
GetName66# *
(66* +
type66+ /
,66/ 0
value661 6
)666 7
;667 8
var77 
field77 
=77 
type77 
.77 
GetField77 %
(77% &
name77& *
)77* +
;77+ ,
var88 
fds88 
=88 
field88 
.88 
GetCustomAttributes88 /
(88/ 0
typeof880 6
(886 7 
DescriptionAttribute887 K
)88K L
,88L M
true88N R
)88R S
;88S T
foreach99 
(99  
DescriptionAttribute99 )
fd99* ,
in99- /
fds990 3
)993 4
{:: 
descs;; 
.;; 
Add;; 
(;; 
fd;; 
.;; 
Description;; (
);;( )
;;;) *
}<< 
return== 
descs== 
;== 
}>> 	
}?? 
}@@ ÷
LE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str .
). /
]/ 0
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
$str 0
)0 1
]1 2
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
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *Ö
CE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\SelectItemPair.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

class 
SelectItemPair 
:  !
TextValuePair" /
{ 
public 
bool 
Selected 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ø
DE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\StringConstants.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

static 
class 
StringConstants '
{ 
public 
const 
string 
TimeStampFormat +
=, -
$str. =
;= >
public 
const 
string 
DateFormatRegistry .
=/ 0
$str1 ?
;? @
public 
const 
string 
DateFormatSlashes -
=. /
$str0 <
;< =
public 
const 
string  
DateTimeFormatDashes 0
=1 2
$str3 H
;H I
public		 
const		 
string		 '
DateTimeDisplayFormatReview		 7
=		8 9
$str		: =
;		= >
public

 
const

 
string

 

TimeFormat

 &
=

' (
$str

) 2
;

2 3
public 
static 
readonly 
string %
KeyOrderCcEmails& 6
=7 8
$str9 H
;H I
public 
static 
readonly 
string %"
KeyAutoProcessTracking& <
== >
$str? T
;T U
public 
static 
readonly 
string %%
KeySendNotificationEmails& ?
=@ A
$strB Z
;Z [
} 
} ¦
CE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\TestingUrgency.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
TestingUrgency 
{ 
One_Hour 
, 
One_Three_Hour 
, 
End_of_Business 
, 
Custom_Date 
}		 
}

 Á
BE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\TextValuePair.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

class 
TextValuePair 
{ 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Value 
{ 
get !
;! "
set# &
;& '
}( )
} 
} î
CE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\UploadFileType.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
UploadFileType 
{ 
HtmlImagesFile 
, 
ZipFile 
, 
TestSeedFile 
, 
LiveSeedFile 
, 
SuppressionFile		 
,		 
DataFile

 
,

 
BannersFile 
, 
BannersLinksFile 
, 
MiscFile 
} 
} ù
EE:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\UploadFileStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
UploadFileStatus  
{ 
NotUploaded 
= 
$num 
, 
	Completed 
= 
$num 
, 
HostedWithImages 
= 
$num 
, 
HostedWithOutImages 
= 
$num 
,  
Failed		 
=		 
$num		 
}

 
} ô
=E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\UserType.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 
UserType 
{ 
[ 	
Description	 
( 
$str 
) 
] 
Admin 
= 
$num 
, 
[		 	
Description			 
(		 
$str		 
)		 
]		 
User

 
=

 
$num

 
,

 
[ 	
Description	 
( 
$str 
) 
] 
Vendor 
= 
$num 
} 
} ü
?E:\NET_PROJECTS\ADSDataDirect\ADSDataDirect.Enums\UserStatus.cs
	namespace 	
ADSDataDirect
 
. 
Enums 
{ 
public 

enum 

UserStatus 
{ 
[ 	
Description	 
( 
$str 
) 
] 
Active 
= 
$num 
, 
[		 	
Description			 
(		 
$str		 
)		 
]		 
Locked

 
=

 
$num

 
,

 
[ 	
Description	 
( 
$str 
) 
]  
Expired 
= 
$num 
} 
} 