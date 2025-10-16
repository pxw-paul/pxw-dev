Class PXW.DEV.UnitTests.BNF.TestCOS Extends %UnitTest.TestCase
{

Method TestJsonString()
{
    s pmeth="JsonString"
    s obj={"prop":"json string"}
    do $$$AssertEquals(..parseAndFlat("""json string""",pmeth),"String:json string")

    s obj={"prop":"json \"quoted\" string"}
    do $$$AssertEquals(..parseAndFlat("""json \""quoted\"" string""",pmeth),"String:json \""quoted\"" string")

    s obj={"prop":"json \\slash\\ string"}
    do $$$AssertEquals(..parseAndFlat("""json \\slash\\ string""",pmeth),"String:json \\slash\\ string")
}

Method TestGlobalIdentifier()
{
    ; valid names
    s pmeth="GlobalIdentifier"
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    do $$$AssertEquals(..parseAndFlat("ab.cde",pmeth),":ab.cde")
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    do $$$AssertEquals(..parseAndFlat("ab1cde",pmeth),":ab1cde")
    do $$$AssertEquals(..parseAndFlat("%",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%abc",pmeth),":%abc")
    do $$$AssertEquals(..parseAndFlat("%123",pmeth),":%123")

    do $$$AssertEquals(..parseAndFlat("$LOCK",pmeth),":$LOCK")


    ; invalid names these just return the % which is a valid name
    do $$$AssertEquals(..parseAndFlat("%%a",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%%",pmeth),":%")

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
}

Method TestPatternMatch()
{
    s pmeth="PatternMatch"

    ; some test patterns in the code to show they are valid
    ; the code basically accepts anything but we will test with real
    s x="something"
    s match=(x?1N)
    do $$$AssertEquals(..parseAndFlat("?1N",pmeth),":{?,PatternMatch:1N}")

    s match=(x?1A)
    do $$$AssertEquals(..parseAndFlat("?1A",pmeth),":{?,PatternMatch:1A}")

    s match=(x?1P)
    do $$$AssertEquals(..parseAndFlat("?1P",pmeth),":{?,PatternMatch:1P}")

    s match=(x?1.10A)
    do $$$AssertEquals(..parseAndFlat("?1.10A",pmeth),":{?,PatternMatch:1.10A}")

    s match=(x?    1A2N)
    do $$$AssertEquals(..parseAndFlat("?    1A2N",pmeth),":{?,PatternMatch:1A2N}")

    ; strange one but valid!
    s match=(x?
        1A3N)
    do $$$AssertEquals(..parseAndFlat("?"_$c(13)_"    1A3N",pmeth),":{?,PatternMatch:1A3N}")

    s match=(x?1"string")
    do $$$AssertEquals(..parseAndFlat("?1""string""",pmeth),":{?,PatternMatch:1""string""}")

    s match=(x?1(1a,2n))
    do $$$AssertEquals(..parseAndFlat("?1(1a,2n)",pmeth),":{?,PatternMatch:1(1a,2n)}")

    ; pattern match with an OR || right after, we want only the pattern
    s match=(x?1A||x=1) 
    do $$$AssertEquals(..parseAndFlat("?1A||x=1",pmeth),":{?,PatternMatch:1A}")

    ; pattern match with command following
    do $$$AssertEquals(..parseAndFlat("?1A set x=1",pmeth),":{?,PatternMatch:1A}")

    s y="1A"
    s match=(x?@y)
    do $$$AssertEquals(..parseAndFlat("?@y",pmeth),":{?,SimpleIndirection:{@,Variable:y}}")
}

Method TestIncludeIdentifier()
{
    ; valid names
    s pmeth="IncludeIdentifier"
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    do $$$AssertEquals(..parseAndFlat("ab.cde",pmeth),":ab.cde")
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    do $$$AssertEquals(..parseAndFlat("ab1cde",pmeth),":ab1cde")
    do $$$AssertEquals(..parseAndFlat("%",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%abc",pmeth),":%abc")
    do $$$AssertEquals(..parseAndFlat("%123",pmeth),":%123")

    ; invalid names these just return the % which is a valid name
    do $$$AssertEquals(..parseAndFlat("%%a",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%%",pmeth),":%")

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
}

Method TestRoutineIdentifier()
{
    ; valid names
    s pmeth="RoutineIdentifier"
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    do $$$AssertEquals(..parseAndFlat("ab.cde",pmeth),":ab.cde")
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    do $$$AssertEquals(..parseAndFlat("ab1cde",pmeth),":ab1cde")
    do $$$AssertEquals(..parseAndFlat("%",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%abc",pmeth),":%abc")
    do $$$AssertEquals(..parseAndFlat("%123",pmeth),":%123")

    ; invalid names these just return the % which is a valid name
    do $$$AssertEquals(..parseAndFlat("%%a",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%%",pmeth),":%")

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
}

Method TestSuperReadBlockComment()
{
    #dim x as PXW.DEV.BNF.super
    #dim atom as PXW.DEV.Atom

    Set x=##class(PXW.DEV.BNF.super).%New()

    ; not at the comment yet
    Set x.stream=##class(PXW.DEV.InputStream).NewString("before /* in comment */ after")
    set atom=x.readBlockComment("/*","*/")
    do $$$AssertEquals(atom,"")
    do $$$AssertEquals(x.stream.pos,1)
    do $$$AssertEquals(x.stream.line,1)
    do $$$AssertEquals(x.peek(11),"before /* i")

    ; at the comment
    Set x.stream=##class(PXW.DEV.InputStream).NewString("/* in comment */ after")
    set atom=x.readBlockComment("/*","*/")
    do $$$AssertEquals(atom.start,"/*")
    do $$$AssertEquals(atom.value," in comment ")
    do $$$AssertEquals(atom.end,"*/")
    do $$$AssertEquals(x.stream.pos,17)
    do $$$AssertEquals(x.stream.line,1)
    do $$$AssertEquals(x.peek(11)," after")


    ; at a comment that is multi line comment 
    Set x.stream=##class(PXW.DEV.InputStream).NewString("/* in "_$c(13)_" multi "_$c(13)_"line comment */ after")
    set atom=x.readBlockComment("/*","*/")
    do $$$AssertEquals(atom.start,"/*")
    do $$$AssertEquals(atom.value," in "_$c(13)_" multi "_$c(13)_"line comment ")
    do $$$AssertEquals(atom.end,"*/")
    do $$$AssertEquals(x.stream.pos,31)
    do $$$AssertEquals(x.stream.line,3)
    do $$$AssertEquals(x.peek(11)," after")

       ; at an UNENDED comment that is multi line comment 
    Set x.stream=##class(PXW.DEV.InputStream).NewString("/* in "_$c(13)_" multi "_$c(13)_"line comment ")
    set atom=x.readBlockComment("/*","*/")
    do $$$AssertEquals(atom.start,"/*")
    do $$$AssertEquals(atom.value," in "_$c(13)_" multi "_$c(13)_"line comment ")
    do $$$AssertEquals(atom.end,"")
    do $$$AssertEquals(x.stream.pos,31)
    do $$$AssertEquals(x.stream.line,3)
    do $$$AssertEquals(x.peek(11),"")


    ; at a XML comment that is multi line comment 
    Set x.stream=##class(PXW.DEV.InputStream).NewString("<!-- in "_$c(13)_" multi "_$c(13)_"line comment --> after")
    set atom=x.readBlockComment("<!--","-->")
    do $$$AssertEquals(atom.start,"<!--")
    do $$$AssertEquals(atom.value," in "_$c(13)_" multi "_$c(13)_"line comment ")
    do $$$AssertEquals(atom.end,"-->")
    do $$$AssertEquals(x.stream.pos,34)
    do $$$AssertEquals(x.stream.line,3)
    do $$$AssertEquals(x.peek(11)," after")
}

Method TestClassIdentifier()
{
    s pmeth="ClassIdentifier"

    ; valid names
    ;##class(x)
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    ;##class(abcde)
    do $$$AssertEquals(..parseAndFlat("abcde",pmeth),":abcde")
    ;##class(abc.de)
    do $$$AssertEquals(..parseAndFlat("abc.de",pmeth),":abc.de")
    ;##class(ab1)
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    ;ab1.cde
    do $$$AssertEquals(..parseAndFlat("ab1.cde",pmeth),":ab1.cde")
    ;%String
    do $$$AssertEquals(..parseAndFlat("%String",pmeth),":%String")
    ;%String1
    do $$$AssertEquals(..parseAndFlat("%String1",pmeth),":%String1")
    ;%Library.String
    do $$$AssertEquals(..parseAndFlat("%Library.String",pmeth),":%Library.String")

    ; {%%CLASSNAME} special case
    do $$$AssertEquals(..parseAndFlat("{%%CLASSNAME}",pmeth),":{%%CLASSNAME}")

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("%",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("%1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("%%a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("%%",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
}

Method TestAnyTextUpToCloseBracket()
{
    s pmeth="AnyTextUptoCloseBracket"

    ; test text)
    do $$$AssertEquals(..parseAndFlat("test text)",pmeth),"AnyTextUptoCloseBracket:test text")

    ; test (text))
    do $$$AssertEquals(..parseAndFlat("test (text))",pmeth),"AnyTextUptoCloseBracket:test (text)")
}

Method TestObjectMemberIdentifier()
{
    s pmeth="ObjectMemberIdentifier"

    ; valid
    ;s x=obj.name ; only interested in the name part
    ; valid names
    ;s obj.%1=1
    ;s obj.pmeth="VariableIdentifier"
    ;s obj.x=1
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    ;s obj.abcde=1
    do $$$AssertEquals(..parseAndFlat("abcde",pmeth),":abcde")
    ;s obj.ab1=1
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    ;s obj.ab1cde=1
    do $$$AssertEquals(..parseAndFlat("ab1cde",pmeth),":ab1cde")
    ;s obj.%=1
    do $$$AssertEquals(..parseAndFlat("%",pmeth),":%")
    ;s obj.%abc=1
    do $$$AssertEquals(..parseAndFlat("%abc",pmeth),":%abc")
    ;s obj.%123=1
    do $$$AssertEquals(..parseAndFlat("%123",pmeth),":%123")

    ;s obj."funny name"=1
    do $$$AssertEquals(..parseAndFlat("""funny name""",pmeth),":""funny name""")

    ; parameter name
    do $$$AssertEquals(..parseAndFlat("#pname",pmeth),":#pname")
    do $$$AssertEquals(..parseAndFlat("#%pname",pmeth),":#%pname")
    do $$$AssertEquals(..parseAndFlat("#%1",pmeth),":#%1")
    do $$$AssertEquals(..parseAndFlat("#%1a1a",pmeth),":#%1a1a")

    ; invalid names these just return the % which is a valid name
    do $$$AssertEquals(..parseAndFlat("%%a",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%%",pmeth),":%")

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)

    ; invalid paramter
    do $$$AssertEquals(..parseExpectFail("#1",pmeth),0)
}

Method TestString()
{
    s pmeth="String"

    ; ok string
    s x=""
    do $$$AssertEquals(..parseAndFlat("""""",pmeth),"String:")

    s x="hello"
    do $$$AssertEquals(..parseAndFlat("""hello""",pmeth),"String:hello")

    s x="hello ""embedded"" quotes" 
    ; the code works but can't get the test to recognise it working
    ;do $$$AssertEquals(..parseAndFlat("""hello """"embedded"""" quotes""",pmeth),"String:hello ""embedded"" quotes")
    ;do $$$AssertEquals(..parseAndFlat(##Quote("hello ""embedded"" quotes"),pmeth),"String:hello ""embedded"" quotes")
    s quote=""""
    s text=quote_"hello "_quote_quote_"embedded"_quote_quote_" quotes"
    set ParentElement=##class(PXW.DEV.Element).%New()
    Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
    Set parser.stream=##class(PXW.DEV.InputStream).NewString(text)
    ;
    Set embeddedQuotesOk=parser.String(ParentElement)
    do $$$AssertEquals(embeddedQuotesOk,1)
    set embeddedAtom=ParentElement.FirstAtom()
    do $$$AssertEquals(embeddedAtom.value,"hello "_quote_quote_"embedded"_quote_quote_" quotes")
}

Method TestNumber()
{
    s pmeth="Number"
    ; ok numbers
    s x=0
    do $$$AssertEquals(..parseAndFlat("0",pmeth),"Number:0")
    s x=00
    do $$$AssertEquals(..parseAndFlat("00",pmeth),"Number:00")
    s x=00.00
    do $$$AssertEquals(..parseAndFlat("00.00",pmeth),"Number:00.00")
    s x=001
    do $$$AssertEquals(..parseAndFlat("001",pmeth),"Number:001")
    s x=.1
    do $$$AssertEquals(..parseAndFlat(".1",pmeth),"Number:.1")
    s x=0.1
    do $$$AssertEquals(..parseAndFlat("0.1",pmeth),"Number:0.1")
    s x=1
    do $$$AssertEquals(..parseAndFlat("1",pmeth),"Number:1")
    s x=1234567890
    do $$$AssertEquals(..parseAndFlat("1234567890",pmeth),"Number:1234567890")
    s x=1.0123456789
    do $$$AssertEquals(..parseAndFlat("1.0123456789",pmeth),"Number:1.0123456789")
    s x=9e14
    do $$$AssertEquals(..parseAndFlat("9e14",pmeth),"Number:9e14")
    s x=9.2E15
    do $$$AssertEquals(..parseAndFlat("9.2E15",pmeth),"Number:9.2E15")
    s x=9e-14
    do $$$AssertEquals(..parseAndFlat("9e-14",pmeth),"Number:9e-14")
    s x=9.2E-15
    do $$$AssertEquals(..parseAndFlat("9.2E-15",pmeth),"Number:9.2E-15")
    
    ; negative numbers are valid in this method but would probably not occur because expressions would split this into two parts (-) (number)
    s x=-0
    do $$$AssertEquals(..parseAndFlat("-0",pmeth),"Number:-0")
    s x=-00
    do $$$AssertEquals(..parseAndFlat("-00",pmeth),"Number:-00")
    s x=-00.00
    do $$$AssertEquals(..parseAndFlat("-00.00",pmeth),"Number:-00.00")
    s x=-001
    do $$$AssertEquals(..parseAndFlat("-001",pmeth),"Number:-001")
    s x=-.1
    do $$$AssertEquals(..parseAndFlat("-.1",pmeth),"Number:-.1")
    s x=-0.1
    do $$$AssertEquals(..parseAndFlat("-0.1",pmeth),"Number:-0.1")
    s x=-1
    do $$$AssertEquals(..parseAndFlat("-1",pmeth),"Number:-1")
    s x=-1234567890
    do $$$AssertEquals(..parseAndFlat("-1234567890",pmeth),"Number:-1234567890")
    s x=-1.0123456789
    do $$$AssertEquals(..parseAndFlat("-1.0123456789",pmeth),"Number:-1.0123456789")
    s x=-9e14
    do $$$AssertEquals(..parseAndFlat("-9e14",pmeth),"Number:-9e14")
    s x=-9E15
    do $$$AssertEquals(..parseAndFlat("-9E15",pmeth),"Number:-9E15")
    s x=-9e-14
    do $$$AssertEquals(..parseAndFlat("-9e-14",pmeth),"Number:-9e-14")
    s x=-9E-15
    do $$$AssertEquals(..parseAndFlat("-9E-15",pmeth),"Number:-9E-15")

    ; oddities that are valid but probably never used
    s x=---1
    do $$$AssertEquals(..parseAndFlat("---1",pmeth),"Number:---1")
    s x=+++2
    do $$$AssertEquals(..parseAndFlat("+++2",pmeth),"Number:+++2")
    
    ; invalid numbers
    do $$$AssertEquals(..parseExpectFail("e",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("E2",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseAndFlat("1.2.3",pmeth),"Number:1.2") ; returns a valid number but not the last bit
    do $$$AssertEquals(..parseAndFlat("1e2e3",pmeth),"Number:1e2") ; returns a valid number but not the last bit
    do $$$AssertEquals(..parseAndFlat(".23.45",pmeth),"Number:.23") ; returns a valid number but not the last bit
}

Method TestVariableIdendtifier()
{
    n %,%abc,%123
    
    ; valid names
    s %1=1
    s pmeth="VariableIdentifier"
    s x=1
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    s abcde=1
    do $$$AssertEquals(..parseAndFlat("abcde",pmeth),":abcde")
    s ab1=1
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    s ab1cde=1
    do $$$AssertEquals(..parseAndFlat("ab1cde",pmeth),":ab1cde")
    s %=1
    do $$$AssertEquals(..parseAndFlat("%",pmeth),":%")
    s %abc=1
    do $$$AssertEquals(..parseAndFlat("%abc",pmeth),":%abc")
    s %123=1
    do $$$AssertEquals(..parseAndFlat("%123",pmeth),":%123")

    ; invalid names these just return the % which is a valid name
    do $$$AssertEquals(..parseAndFlat("%%a",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%%",pmeth),":%")

    ; _ is not part of the name
    do $$$AssertEquals(..parseAndFlat("var_var2",pmeth),":var")
    ; . is not part of the name
    do $$$AssertEquals(..parseAndFlat("var.var2",pmeth),":var")

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
}

Method TestVariableIdendtifierSQL()
{
    s pmeth="VariableIdentifierSQL"
    
    ; valid names normal variable names
    do $$$AssertEquals(..parseAndFlat("x",pmeth),":x")
    do $$$AssertEquals(..parseAndFlat("abcde",pmeth),":abcde")
    do $$$AssertEquals(..parseAndFlat("ab1",pmeth),":ab1")
    do $$$AssertEquals(..parseAndFlat("ab1cde",pmeth),":ab1cde")
    do $$$AssertEquals(..parseAndFlat("%",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%abc",pmeth),":%abc")
    do $$$AssertEquals(..parseAndFlat("%123",pmeth),":%123")

    ; invalid names these just return the % which is a valid name
    do $$$AssertEquals(..parseAndFlat("%%a",pmeth),":%")
    do $$$AssertEquals(..parseAndFlat("%%",pmeth),":%")
    
    ; is not part of the name
    do $$$AssertEquals(..parseAndFlat("var_var2",pmeth),":var")
    
    ; we need to allow:
    ; s x={*}
    ; s x={field}
    ; s x={field*C} (or *N or *O)
    ; 
    do $$$AssertEquals(..parseAndFlat("{*}",pmeth),"VariableIdentifierSQL:{*}")
    do $$$AssertEquals(..parseAndFlat("{abcde}",pmeth),"VariableIdentifierSQL:{abcde}")
    do $$$AssertEquals(..parseAndFlat("{ab1}",pmeth),"VariableIdentifierSQL:{ab1}")
    do $$$AssertEquals(..parseAndFlat("{ab1cde}",pmeth),"VariableIdentifierSQL:{ab1cde}")
    do $$$AssertEquals(..parseAndFlat("{ab_cde}",pmeth),"VariableIdentifierSQL:{ab_cde}")
    do $$$AssertEquals(..parseAndFlat("{ab.cde}",pmeth),"VariableIdentifierSQL:{ab.cde}")
    do $$$AssertEquals(..parseAndFlat("{ab*c}",pmeth),"VariableIdentifierSQL:{ab*c}")
    do $$$AssertEquals(..parseAndFlat("{ab*n}",pmeth),"VariableIdentifierSQL:{ab*n}")
    do $$$AssertEquals(..parseAndFlat("{ab*o}",pmeth),"VariableIdentifierSQL:{ab*o}")

    ; we need to block
    ; s x={"json":444}
    do $$$AssertEquals(..parseExpectFail("{""json"":444}",pmeth),0)
    

    ; return nothing, no valid name
    do $$$AssertEquals(..parseExpectFail("1",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("+",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("1a",pmeth),0)
    do $$$AssertEquals(..parseExpectFail("-",pmeth),0)
}

Method TestIncrement()
{
    s pmeth="Intrinsicfncall"
    do $$$AssertEquals(..parseAndFlat("$increment(x)",pmeth),"Intrinsicfncall:{$,IncrementFunctionCall:{Keyword:increment,(,VariableSet:x,)}}")
    do $$$AssertEquals(..parseAndFlat("$i(x)",pmeth),"Intrinsicfncall:{$,IncrementFunctionCall:{Keyword:i,(,VariableSet:x,)}}")
}

Method TestClassmethod()
{
    s pmeth="ClassmethodFunctionCall"
    ; NOTE: For these test we are bypassing the intrinic function (to keep result shorter) so  no $ needed
    do $$$AssertEquals(..parseAndFlat("classmethod(classvar,methodvar)",pmeth),"ClassmethodFunctionCall:{Keyword:classmethod,(,Variable:classvar,,,Variable:methodvar,)}")
    do $$$AssertEquals(..parseAndFlat("classmethod(classvar,""MethodName"")",pmeth),"ClassmethodFunctionCall:{Keyword:classmethod,(,Variable:classvar,,,String:MethodName,)}")
    do $$$AssertEquals(..parseAndFlat("classmethod(classvar,""MethodName"",p1)",pmeth),"ClassmethodFunctionCall:{Keyword:classmethod,(,Variable:classvar,,,String:MethodName,,,Variable:p1,)}")    
    do $$$AssertEquals(..parseAndFlat("classmethod(classvar,""MethodName"",p1,p2)",pmeth),"ClassmethodFunctionCall:{Keyword:classmethod,(,Variable:classvar,,,String:MethodName,,,FunctionParameterListItems:{Variable:p1,,,Variable:p2},)}")
    do $$$AssertEquals(..parseAndFlat("classmethod(classvar,""MethodName"",p1,p2,,p4)",pmeth),"ClassmethodFunctionCall:{Keyword:classmethod,(,Variable:classvar,,,String:MethodName,,,FunctionParameterListItems:{Variable:p1,,,Variable:p2,,,,,Variable:p4},)}")
    do $$$AssertEquals(..parseAndFlat("classmethod(classvar,""MethodName"",p1,p2,,p4,p5...)",pmeth),"ClassmethodFunctionCall:{Keyword:classmethod,(,Variable:classvar,,,String:MethodName,,,FunctionParameterListItems:{Variable:p1,,,Variable:p2,,,,,Variable:p4,,,Variable:p5,...},)}")
}

Method TestGlobal()
{
    do $$$AssertEquals(..parseAndFlat(" s x=^aglob(""string key"",1)"),"SetCommand:{Keyword:s,SetItem:{VariableSet:x,=,GlobalRefFull:{^,GlobalName:aglob,SubscriptParameterList:{(,String:string key,,,Number:1,)}}}}")
}

/*
method TestSet()
{
    do $$$AssertEquals(..parseAndFlat(" "))
}
*/
Method TestNaked()
{
    ; normal, end of line directly after naked Do
    ; on the next line there would be . structure (yes still)
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D"_$CHAR(13)),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},Keyword:D}")

    ; normal, end of line not directly after naked Do, there is a bit of extra whitespace
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D "_$CHAR(13)),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},Keyword:D}")

    ; normal, end of line not directly after naked Do, there is a bit of extra whitespace
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D      "_$CHAR(13)),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},Keyword:D}")

    ; normal, Do  Quit combo
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D  Q"),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},CommandListEol:{Keyword:D,Keyword:Q}}")


    ; normal, Do:postconditional  
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D:x=1"),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},DoCommand:{Keyword:D,PostConditional:{:,Expression:{Variable:x,=,Number:1}}}}")

    ; normal, Do:postconditional  Q:postcond 
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D:x=1  Q:x=2"),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},CommandListEol:{DoCommand:{Keyword:D,PostConditional:{:,Expression:{Variable:x,=,Number:1}}},QuitCommand:{Keyword:Q,PostConditional:{:,Expression:{Variable:x,=,Number:2}}}}}")
}

/// s str=##class(PXW.DEV.UnitTests.BNF.TestCOS).parseAndFlat(" S x=1","CosCodeBlock") w str
/// r "enter sql",!,sql s str=##class(PXW.DEV.UnitTests.BNF.TestCOS).parseAndFlat(sql,"CosCodeBlock") w !,str
ClassMethod parseAndFlat(text As %String, method As %String = "CosCodeBlock", class As %String = "PXW.DEV.BNF.Run.COS") As %String
{
    Set a=..parse(text,method,class)
    Set str=..flatten(a)
    Quit str
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestCOS).parse("lab s x=1","CodCodeBlock")
ClassMethod parse(text As %String, method As %String = "CosCodeBlock", class As %String = "PXW.DEV.BNF.Run.COS") As PXW.DEV.Element
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    ;Set x=$SYSTEM.OBJ.New(class)
    Set x=$CLASSMETHOD(class,"%New")
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    ;If 'ok $$$ThrowStatus($$$ERROR(5001,"Method "_method_" returned "_ok))
    Quit element
}

ClassMethod parseExpectFail(text As %String, method As %String = "CosCodeBlock", class As %String = "PXW.DEV.BNF.Run.COS") As %Boolean
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    ;Set x=$SYSTEM.OBJ.New(class)
    Set x=$CLASSMETHOD(class,"%New")
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    ;If 'ok $$$ThrowStatus($$$ERROR(5001,"Method "_method_" returned "_ok))
    Quit ok
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestCOS).parse("lab set var=2","CosCodeBlock")
/// w ##class(PXW.DEV.UnitTests.BNF.TestCOS).flatten(a)
/// Get skip over all the junk levels and just report on atom content and elements that contain more than 1 part.
ClassMethod flatten(Element As PXW.DEV.Element) As %String
{
	#dim a as PXW.DEV.Atom
	#dim e as PXW.DEV.Element
	
	Set str=""
	Set akey=""
	Set sep=""
    If Element.partsCount()=1 {
        Set single=1
    } Else {
        Set single=0
    }
	If 'single {
        Set str=str_Element.type_":{"
    }
	For  {
		Set a=Element.partsGetNext(.akey)
		Quit:akey=""

        If a.%IsA("PXW.DEV.Element") {
            Set str=str_sep_..flatten(a)
        } ElseIf $PIECE(a.type,":",1)="punctuation" {
            Set str=str_sep_a.value
        } Else {
            Set str=str_sep_$PIECE(a.type,":",1)_":"_a.value
        }
		
		Set sep=","
	}
	If 'single {
        Set str=str_"}"
    }
	Quit str
}

}
