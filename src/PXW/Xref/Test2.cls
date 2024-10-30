Class PXW.Xref.Test2 Extends (%Persistent, %Populate)
{

Property Name As %Name(COLLATION = "EXACT");

Property Sex As %String(VALUELIST = ",M,F");

Index iName On (Name, Sex) [ IdKey, PrimaryKey, Unique ];

ClassMethod Setup()
{
    Do ..Populate(10000)
    Do $SYSTEM.SQL.TuneTable("PXW_Xref.Test2")
}

ClassMethod Delete(name As %String, sex As %String) As %Status
{
    Set sc=$$$OK
    &SQL(DELETE PXW_Xref.Test2 WHERE Sex=:sex AND Name %STARTSWITH :name)
    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Quit sc
}

/*
IRISAPP>w $zv
IRIS for UNIX (Ubuntu Server LTS for x86-64 Containers) 2024.3.0L (Build 152U) Tue Aug 6 2024 22:06:24 EDT

IRISAPP>d ##class(PXW.Xref.Test2).Setup()

IRISAPP>d ##class(PXW.Xref.Test2).Delete("B","M")

ERROR #5001: Process 754 failed to compile Cached Query Class %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i with the following errors:  System:Instance: 45191e41963b:IRIS, Namespace: IRISAPP, $Job: 754, $zu(56,2): $Id: //iris/latest/kernel/common/src/acmd.c#44 $ 4564 0
ERROR #5475: Error compiling routine: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.  Errors:  ERROR: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.int(15) #1020: Expected period : '$g(name)swEnd=$e($g(name),1,*-1)_$e($zlc($zla($e($g(name),*)_$c(0,0,0))+1),1)' : Offset:12 [%Construct+3^%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1]
  > ERROR #5030: An error occurred while compiling class '%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i'
ERROR #5475: Error compiling routine: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.  Errors:  ERROR: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.int(21) #1019: Expected colon : '$S($g(name)swEnd]]"Zweifelhofer,Robert O.":17,1:$S($g(name)swEnd]]"Miller,Quentin F.":$S($g(name)swEnd]]"Tesla,Bart B.":$S($g(name)swEnd]]"Williams,Emily P.":$S($g(name)swEnd]]"Yezek,Michael C.":16,1:15),1:$S($g(name)swEnd]]"Vanzetti,Belinda Z.":14,1:13)),1:$S($g(name)swEnd]]"Peters,Phil H.":$S($g(name)swEnd]]"Ravazzolo,Pat X.":12,1:11),1:$S($g(name)swEnd]]"O'Brien,Alfred E.":10,1:9))),1:$S($g(name)swEnd]]"Evans,Laura O.":$S($g(name)swEnd]]"Ipsen,Liza G.":$S($g(name)swEnd]]"LaRocca,William J.":8,1:7),1:$S($g(name)swEnd]]"Geoffrion,William L.":6,1:5)),1:$S($g(name)swEnd]]"Black,Keith C.":$S($g(name)swEnd]]"DeSantis,Will L.":4,1:3),1:$S($g(name)swEnd]]"Adam,Alvin C.":2,1:1)))))' : Offset:39 [%Construct+9^%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1]
  > ERROR #5030: An error occurred while compiling class '%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i'
ERROR #5475: Error compiling routine: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.  Errors:  ERROR: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.int(28) #1009: Expected comma : '$extract($g(name)swEnd,$LI($lb(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),SQLrtpclowerBucket-1)+1,*)' : Offset:43 [%Construct+16^%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1]
  > ERROR #5030: An error occurred while compiling class '%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i'
ERROR #5475: Error compiling routine: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.  Errors:  ERROR: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.int(38) #1019: Expected colon : '$S(SQLrtpcupperBucket=17:1,SQLrtpcupperBucket=1:0,$g(name)swEnd=$LI($lb("Adam,Alvin C.","Black,Keith C.","DeSantis,Will L.","Evans,Laura O.","Geoffrion,William L.","Ipsen,Liza G.","LaRocca,William J.","Miller,Quentin F.","O'Brien,Alfred E.","Peters,Phil H.","Ravazzolo,Pat X.","Tesla,Bart B.","Vanzetti,Belinda Z.","Williams,Emily P.","Yezek,Michael C.","Zweifelhofer,Robert O."),SQLrtpcupperBucket):(SQLrtpcupperBucket-1)*.06666666666666666667,1:(SQLrtpcupperBucket-1.5)*.06666666666666666667)' : Offset:85 [%Construct+26^%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1]
  > ERROR #5030: An error occurred while compiling class '%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i'
ERROR #5475: Error compiling routine: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.  Errors:  ERROR: %sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1.int(15) #1020: Expected period : '$g(name)swEnd=$e($g(name),1,*-1)_$e($zlc($zla($e($g(name),*)_$c(0,0,0))+1),1)' : Offset:12 [%Construct+3^%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i.1]
  > ERROR #5030: An error occurred while compiling class '%sqlcq.IRISAPP.uEf6fYjhklVigm1VK3jB7A7qfe8i' compiling embedded cached query from PXW.Xref.Test2.CLS
*/
Storage Default
{
<Data name="Test2DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^PXW.Xref.Test2D</DataLocation>
<DefaultData>Test2DefaultData</DefaultData>
<IdLocation>^PXW.Xref.Test2D</IdLocation>
<IndexLocation>^PXW.Xref.Test2I</IndexLocation>
<StreamLocation>^PXW.Xref.Test2S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
