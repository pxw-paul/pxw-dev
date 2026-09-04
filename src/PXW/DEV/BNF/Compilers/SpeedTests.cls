include PXW.Debuggers.Macros

/// This class is used for various experiments to find which ways of coding things
/// are the fastest.
/// 
/// Most changes are absolutely minute, saving 1/1000s over 1,000,000 iterations.
/// 
/// But over the whole thing running millions of times when parsing every little helps.
/// Also its finding some interesting things, and it fun to keep finding new things.
///
/// Keeping these all in the project to show why some of the code is like it is.
/// 
/// Some of these test do show some inconsistencies when run many times.
Class PXW.DEV.BNF.Compilers.SpeedTests Extends %RegisteredObject
{
    
parameter TestString="This is a test string";

classmethod All() {
    d ..UnusedReturns()
    d ..ObjectCheckPos()
    d ..ObjectCheckNeg()
    d ..ParameterPassingNumber()
    d ..ParameterPassingString()
    d ..ParameterPassingObject()
    d ..IncrementArray()
    d ..IncrementVsString()
    d ..ConCatString()
    d ..ConCatStringNull()
    d ..ConCatNullNull()
    d ..ConCatFromArray()
    d ..NestFunctions()
    d ..DataTestPos()
    d ..DataTestNeg()
    d ..IfTest()
    d ..IfTestNull()
    d ..ReuseVar()
    d ..TestKeyword()
}

classmethod TestKeyword() {

    d ..showHead("TestKeyword")
    s m=1000000
    s line="Keyword parameter"

    d ..startTimer(.res,"s i=2 While $e(line,i)?1AN { s i=i+1 }")
    f j=1:1:m {
        s i=2 
        While $e(line,i)?1AN { s i=i+1 }
        s x=$e(line,1,i-1)
    }
    d ..stopTimer(.res)

   d ..startTimer(.res,"s i=1 While $e(line,$i(i))?1AN { }")
    f j=1:1:m {
        s i=1
        While $e(line,$i(i))?1AN { }
        s x=$e(line,1,i-1)
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s i=2 While $e(line,i,i)?1AN { s i=i+1 }")
    f j=1:1:m {
        s i=2 
        While $e(line,i,i)?1AN { s i=i+1 }
        s x=$e(line,1,i-1)
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s i=1 While $e(line,$i(i),i)?1AN { }")
    f j=1:1:m {
        s i=1 
        While $e(line,$i(i),i)?1AN { }
        s x=$e(line,1,i-1)
    }
    d ..stopTimer(.res)


    d ..showRes(.res,m)

}

classmethod ReuseVar() {
    d ..showHead("ReuseVar")
    s m=10000
    s var=""

    d ..startTimer(.res,"Reuse same 10 times")
    f i=1:1:m {
        s var=##class(PXW.DEV.Element).%New() ; 1
        s var=##class(PXW.DEV.Element).%New() ; 2
        s var=##class(PXW.DEV.Element).%New() ; 3
        s var=##class(PXW.DEV.Element).%New() ; 4
        s var=##class(PXW.DEV.Element).%New() ; 5
        s var=##class(PXW.DEV.Element).%New() ; 6
        s var=##class(PXW.DEV.Element).%New() ; 7
        s var=##class(PXW.DEV.Element).%New() ; 8
        s var=##class(PXW.DEV.Element).%New() ; 9
        s var=##class(PXW.DEV.Element).%New() ; 10
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"Use 10 diferent")
    f i=1:1:m {
        s var1=##class(PXW.DEV.Element).%New() ; 1
        s var2=##class(PXW.DEV.Element).%New() ; 2
        s var3=##class(PXW.DEV.Element).%New() ; 3
        s var4=##class(PXW.DEV.Element).%New() ; 4
        s var5=##class(PXW.DEV.Element).%New() ; 5
        s var6=##class(PXW.DEV.Element).%New() ; 6
        s var7=##class(PXW.DEV.Element).%New() ; 7
        s var8=##class(PXW.DEV.Element).%New() ; 8
        s var9=##class(PXW.DEV.Element).%New() ; 9
        s var0=##class(PXW.DEV.Element).%New() ; 10
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"Reuse same 10 times in method call")
    f i=1:1:m {
        d ..newElement(.var) ; 1
        d ..newElement(.var) ; 2
        d ..newElement(.var) ; 3
        d ..newElement(.var) ; 4
        d ..newElement(.var) ; 5
        d ..newElement(.var) ; 6
        d ..newElement(.var) ; 7
        d ..newElement(.var) ; 8
        d ..newElement(.var) ; 9
        d ..newElement(.var) ; 10
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"Use 10 different in method call")
    f i=1:1:m {
        d ..newElement(.var1) ; 1
        d ..newElement(.var2) ; 2
        d ..newElement(.var3) ; 3
        d ..newElement(.var4) ; 4
        d ..newElement(.var5) ; 5
        d ..newElement(.var6) ; 6
        d ..newElement(.var7) ; 7
        d ..newElement(.var8) ; 8
        d ..newElement(.var9) ; 9
        d ..newElement(.var0) ; 10
    }
    d ..stopTimer(.res)



    d ..showRes(.res,m)

}

classmethod newElement(byref ele) {
    s ele=##class(PXW.DEV.Element).%New()
    q
}

classmethod IfTestNull() {
    d ..showHead("IfTestNull")
    s m=10000000
    s var=""
    
    s x=""
    d ..startTimer(.res,"i x="""" { s y=1 } else { s z=1 } ; true x is null")
    f i=1:1:m {
        i x="""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)

    s x=""
    d ..startTimer(.res,"i x'="""" { s y=1 } else { s z=1 } ; false x is null")
    f i=1:1:m {
        i x'="""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)

    s x=""
    d ..startTimer(.res,"i x]"""" { s y=1 } else { s z=1 } ; false x is null")
    f i=1:1:m {
        i x]"""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)

    s x=""
    d ..startTimer(.res,"i x']"""" { s y=1 } else { s z=1 } ; true x is null")
    f i=1:1:m {
        i x']"""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)


    s x="set"
    d ..startTimer(.res,"i x="""" { s y=1 } else { s z=1 } ; false x is not null")
    f i=1:1:m {
        i x="""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)

    s x="set"
    d ..startTimer(.res,"i x'="""" { s y=1 } else { s z=1 } ; true x is not null")
    f i=1:1:m {
        i x'="""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)

    s x="set"
    d ..startTimer(.res,"i x]"""" { s y=1 } else { s z=1 } ; true x is not null")
    f i=1:1:m {
        i x]"""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)

    s x="set"
    d ..startTimer(.res,"i x']"""" { s y=1 } else { s z=1 } ; false x is not null")
    f i=1:1:m {
        i x']"""" { s y=1 } else { s z=1 }
    }
    d ..stopTimer(.res)


    d ..showRes(.res,m)

}

classmethod IfTest() {
    d ..showHead("IfTest")
    s m=10000000
    s var=""
    
    s x=99
    d ..startTimer(.res,"i x=99 ; true")
    f i=1:1:m {
        i x=99 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i +x=+99 ; true")
    f i=1:1:m {
        i +x=+99 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i +x=99 ; true")
    f i=1:1:m {
        i +x=99 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i +x=""99"" ; true")
    f i=1:1:m {
        i +x="99" 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i x=""99"" ; true")
    f i=1:1:m {
        i x="99" 
    }
    d ..stopTimer(.res)

    s x=99,y=99
    d ..startTimer(.res,"i +x=+y ; true")
    f i=1:1:m {
        i +x=+y 
    }
    d ..stopTimer(.res)

    s x=99,y=99
    d ..startTimer(.res,"i +x=+y { } ; true")
    f i=1:1:m {
        i +x=+y 
    }
    d ..stopTimer(.res)


    s x=99
    d ..startTimer(.res,"i x=100 ; false")
    f i=1:1:m {
        i x=100 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i +x=+100 ; false")
    f i=1:1:m {
        i +x=+100 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i +x=100 ; false")
    f i=1:1:m {
        i +x=100 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i +x=""100"" ; false")
    f i=1:1:m {
        i +x="100" 
    }
    d ..stopTimer(.res)

    s x=99
    d ..startTimer(.res,"i x=""100"" ; false")
    f i=1:1:m {
        i x="99" 
    }
    d ..stopTimer(.res)

    s x="ninetynine"
    d ..startTimer(.res,"i x=""ninetynine"" ; true")
    f i=1:1:m {
        i x="ninetynine" 
    }
    d ..stopTimer(.res)

    s x="ninetynine"
    d ..startTimer(.res,"i x=""onehundred"" ; false")
    f i=1:1:m {
        i x="onehundred" 
    }
    d ..stopTimer(.res)

    s x=99,y=100
    d ..startTimer(.res,"i +x=+y ; false")
    f i=1:1:m {
        i +x=+y 
    }
    d ..stopTimer(.res)

    s x=99,y=100
    d ..startTimer(.res,"i +x=+y {  } ; false")
    f i=1:1:m {
        i +x=+y { } 
    }
    d ..stopTimer(.res)


    d ..showRes(.res,m)


}
classmethod DataTestPos() {
    d ..showHead("DataTestPos")
    s m=10000000
    s var=""

    d ..startTimer(.res,"s x=0 i $D(var) s current=var,x=1")
    f i=1:1:m {
        s x=0
        i $D(var) s current=var,x=1
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=0 i $D(var) { s  current=var,x=1 } ")
    f i=1:1:m { s x=0 i $D(var) { s current=var,x=1 } }
    d ..stopTimer(.res)


    d ..startTimer(.res,"i $D(var) s current=var,x=1 else s x=0")
    f i=1:1:m {
        i $D(var) {
            s current=var,x=1
        } else {
            s x=0
        }
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"i $D(var,current) s x=1")
    f i=1:1:m {
        s x=0
        i $D(var,current) s x=1
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s:$D(var,current) x=1")
    f i=1:1:m {
        s x=0
        s:$D(var,current) x=1
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=$s($D(var,current):1,1:0)")
    f i=1:1:m {
        s x=$s($D(var,current):1,1:0)
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)


}

classmethod DataTestNeg() {
    d ..showHead("DataTestNeg")
    s m=10000000

    d ..startTimer(.res,"i $D(var) s current=var,x=1")
    f i=1:1:m {
        s x=0
        i $D(var) s current=var,x=1
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=0 i $D(var) { s  current=var,x=1 } ")
    f i=1:1:m { s x=0 i $D(var) { s current=var,x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"i $D(var) s current=var,x=1 else s x=0")
    f i=1:1:m {
        i $D(var) {
            s current=var,x=1
        } else {
            s x=0
        }
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"i $D(var,current) s x=1")
    f i=1:1:m {
        s x=0
        i $D(var,current) s x=1
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s:$D(var,current) x=1")
    f i=1:1:m {
        s x=0
        s:$D(var,current) x=1
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=$s($D(var,current):1,1:0)")
    f i=1:1:m {
        s x=$s($D(var,current):1,1:0)
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)


}

classmethod NestFunctions() {
    d ..showHead("NestFunctions")
    s m=10000000
    s line="abcdefghijklmnopqrstuvwxyz"
    s char="x"

    d ..startTimer(.res,"s len=$l(char),read=$e(line,1,len),upper=$$$UPPER(read)")
    f i=1:1:m {
        s len=$l(char),read=$e(line,1,len),upper=$$$UPPER(read)
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s read=$e(line,1,$l(char)),upper=$$$UPPER(read)")
    f i=1:1:m {
        s read=$e(line,1,$l(char)),upper=$$$UPPER(read)
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s upper=$$$UPPER($e(line,1,$l(char)))")
    f i=1:1:m {
        s upper=$$$UPPER($e(line,1,$l(char)))
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s upper=$zconvert($e(line,1,$l(char)),""U"")")
    f i=1:1:m {
        s upper=$zconvert($e(line,1,$l(char)),"U")
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

   
}
classmethod ConCatFromArray() {
    d ..showHead("ConcatFromArray")
    s m=1000000
    s times=1000

    s p=##class(PXW.Tools.DEV.HTML.bnf).%New()
    f i=1:2:times {
        s p.pre(i)="abcdefghijklmnopqrstuvwxyz"
    }

    d ..startTimer(.res,"s x=x_$g(p.pre(i))")
    f j=1:1:m {
        s x=""
        f i=i:1:times {
            s x=x_$g(p.pre(i))
        }
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s:$data(p.pre(i),v) x=x_v")
    f j=1:1:m {
        s x=""
        f i=i:1:times {
            s:$data(p.pre(i),v) x=x_v
        }
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)


}


classmethod ConCatString() {
    d ..showHead("ConCatString")
    s m=10000000
    s str="abcdefghijklmnopqrstuvwxyz"
    s str2="abcdefghijklmnopqrstuvwxyz"
 
    d ..startTimer(.res,"s x=x_str")
    f i=1:1:m {
        s x=""
        s x=x_str
        s x=x_str2
    }
    d ..stopTimer(.res)

   d ..startTimer(.res,"s x=x_str_str2")
    f i=1:1:m {
        s x=""
        s x=x_str_str2
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s:str'="" x=x_str")
    f i=1:1:m {
        s x=""
        s:str'="" x=x_str
        s:str2'="" x=x_str2
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}

classmethod ConCatStringNull() {
    d ..showHead("ConCatStringNull")
    s m=10000000
    s str="abcdefghijklmnopqrstuvwxyz"
    s str2=""
 
    d ..startTimer(.res,"s x=x_str")
    f i=1:1:m {
        s x=""
        s x=x_str
        s x=x_str2
    }
    d ..stopTimer(.res)
    
    d ..startTimer(.res,"s x=x_str_str2")
    f i=1:1:m {
        s x=""
        s x=x_str_str2
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s:str'="" x=x_str")
    f i=1:1:m {
        s x=""
        s:str'="" x=x_str
        s:str2'="" x=x_str2
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}

classmethod ConCatNullNull() {
    d ..showHead("ConCatNullNull")
    s m=10000000
    s str=""
    s str2=""
 
    d ..startTimer(.res,"s x=x_str")
    f i=1:1:m {
        s x=""
        s x=x_str
        s x=x_str2
    }
    d ..stopTimer(.res)

   d ..startTimer(.res,"s x=x_str_str2")
    f i=1:1:m {
        s x=""
        s x=x_str_str2
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s:str'="" x=x_str")
    f i=1:1:m {
        s x=""
        s:str'="" x=x_str
        s:str2'="" x=x_str2
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}

classmethod IncrementArray() {
    d ..showHead("IncrementArray")
    s m=100000,times=10

    d ..startTimer(.res,"s x=p.pre(1),x=x+1,p.pre(1,x)="""",p.pre(1)=x")
    f j=1:1:times {
        s p=##class(PXW.Tools.DEV.HTML.bnf).%New()
        f i=1:1:m { s x=$g(p.pre(1)),x=x+1,p.pre(1,x)="",p.pre(1)=x }
    }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=$i(p.pre(1)),p.pre(1,x)=""""")
    f j=1:1:times {
        s p=##class(PXW.Tools.DEV.HTML.bnf).%New()
        f i=1:1:m { s x=$i(p.pre(1)),p.pre(1,x)="" } 
    }
    d ..stopTimer(.res)

   d ..startTimer(.res,"s pre(1,$i(p.pre(1)))=""""")
    f j=1:1:times {
        s p=##class(PXW.Tools.DEV.HTML.bnf).%New()
        f i=1:1:m { s p.pre(1,$i(p.pre(1)))="" } 
    }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}


classmethod IncrementVsString() {
    d ..showHead("IncrementVsString")
    s c=3,m=10001,times=10

   d ..startTimer(.res,"s p.pre(m,$i(p.pre(m)))=""abcdefghijklmnopqrstuvwxyz""")
    f j=1:1:times {
        s p=##class(PXW.Tools.DEV.HTML.bnf).%New()
        ; populate half so the fetch takes into account missing entries
        f i=1:2:m {
            f k=1:1:c { 
                s p.pre(i,$i(p.pre(i)))="abcdefghijklmnopqrstuvwxyz" 
            } 
        }
        ; fetch
        f i=1:1:m {
            s x=""
            i $d(p.pre(i),n) f k=1:1:n s x=x_p.pre(i,n) 
        }
    }
    d ..stopTimer(.res)
    
    d ..startTimer(.res,"s p.pre(m)=$G(p.pre(m))_""abcdefghijklmnopqrstuvwxyz""")
    f j=1:1:times {
        s p=##class(PXW.Tools.DEV.HTML.bnf).%New()
        f i=1:2:m {
            f k=1:1:c { 
                s p.pre(i)=$G(p.pre(i))_"abcdefghijklmnopqrstuvwxyz" 
            } 
        }
        ; fetch
        f i=1:1:m {
            s x=$g(p.pre(i))
        }
    }
    d ..stopTimer(.res)


    d ..showRes(.res,m)

}


classmethod UnusedReturns() {

    d ..showHead("UnusedReturns")
    s m=10000000

    d ..startTimer(.res,"s x=..basicQuit()")
    f i=1:1:m { s x=..basicQuit() }
    d ..stopTimer(.res)

    d ..startTimer(.res,"d..basicQuit()")
    f i=1:1:m { d ..basicQuit() } 
    d ..stopTimer(.res)

    d ..startTimer(.res,"i ..basicQuit()")
    f i=1:1:m { i ..basicQuit() } 
    d ..stopTimer(.res)

    d ..startTimer(.res,"i ..basicQuit() {}")
    f i=1:1:m { i ..basicQuit() {} } 
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}

classmethod ObjectCheckPos() {
    d ..showHead("ObjectCheckPos")
    s o=##class(PXW.DEV.Atom).%New()
    s m=10000000

    d ..startTimer(.res,"+o")
    f i=1:1:m { i +o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"o")
    f i=1:1:m { i o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$isobject(o)")
    f i=1:1:m { i $isobject(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"+$g(o)")
    f i=1:1:m { i +$g(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$g(o)")
    f i=1:1:m { i $g(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o),o ; if it exists it MAY be an object")
    f i=1:1:m { i $d(o),o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o) ; if it exists it WILL be an object")
    f i=1:1:m { i $d(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o),$isobject(o) ; if it exists it MAY be an object")
    f i=1:1:m { i $d(o) { s x=1 } }
    d ..stopTimer(.res)


    d ..startTimer(.res,"$isobject($g(o))")
    f i=1:1:m { i $isobject($g(o)) { s x=1 } }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}

classmethod ObjectCheckNeg() {
    d ..showHead("ObjectCheckNeg")
    s o=""
    s m=10000000

    d ..startTimer(.res,"+o")
    f i=1:1:m { i +o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"o")
    f i=1:1:m { i o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$isobject(o)")
    f i=1:1:m { i $isobject(o) { s x=1 } }
    d ..stopTimer(.res)

   d ..startTimer(.res,"+$g(o)")
    f i=1:1:m { i +$g(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$g(o)")
    f i=1:1:m { i $g(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o),o ; if it exists it MAY be an object")
    f i=1:1:m { i $d(o),o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o) ; if it exists it WILL be an object")
    f i=1:1:m { i $d(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o),$isobject(o) ; if it exists it MAY be an object")
    f i=1:1:m { i $d(o) { s x=1 } }
    d ..stopTimer(.res)



    d ..startTimer(.res,"$isobject($g(o))")
    f i=1:1:m { i $isobject($g(o)) { s x=1 } }
    d ..stopTimer(.res)

    ; the tests below all use $g and are testing for object UNDEF
    k o

    d ..startTimer(.res,"+$g(o) UNDEF")
    f i=1:1:m { i +$g(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$g(o) UNDEF")
    f i=1:1:m { i $g(o) { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$d(o),o UNDEF")
    f i=1:1:m { i $d(o),o { s x=1 } }
    d ..stopTimer(.res)

    d ..startTimer(.res,"$isobject($g(o)) UNDEF")
    f i=1:1:m { i $isobject($g(o)) { s x=1 } }
    d ..stopTimer(.res)


    d ..showRes(.res,m)

}
classmethod ParameterPassingNumber() {
    d ..showHead("ParameterPassingNumber")
    s p=1
    s m=10000000

    d ..startTimer(.res,"s x=..singleParameter(1)")
    f i=1:1:m { s x=..singleParameter(1) }
    d ..stopTimer(.res)


    d ..startTimer(.res,"s x=..singleParameter(p)")
    f i=1:1:m { s x=..singleParameter(p) }
    d ..stopTimer(.res)

   d ..startTimer(.res,"s p=1,x=..singleParameter(p)")
    f i=1:1:m { s p=1,x=..singleParameter(p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=..singleParameter(.p)")
    f i=1:1:m { s x=..singleParameter(.p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s p=1,x=..singleParameter(.p)")
    f i=1:1:m { s p=1,x=..singleParameter(.p) }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}

classmethod ParameterPassingString() {
    d ..showHead("ParameterPassingString")
    s p="this is a string"
    s m=10000000

    d ..startTimer(.res,"s x=..singleParameter(""a string"")")
    f i=1:1:m { s x=..singleParameter("this is a string") }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=..singleParameter(p)")
    f i=1:1:m { s x=..singleParameter(p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s p=""this is a string"",x=..singleParameter(p)")
    f i=1:1:m { s p="this is a string",x=..singleParameter(p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=..singleParameter(.p)")
    f i=1:1:m { s x=..singleParameter(.p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s p=""this a string"",x=..singleParameter(.p)")
    f i=1:1:m { s p="this is a string",x=..singleParameter(.p) }
    d ..stopTimer(.res)

   d ..startTimer(.res,"s p=..#TestString,x=..singleParameter(.p)")
    f i=1:1:m { s p=..#TestString,x=..singleParameter(.p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"s x=..singleParameter(..#TestString)")
    f i=1:1:m { s x=..singleParameter(..#TestString) }
    d ..stopTimer(.res)


    d ..showRes(.res,m)

}

classmethod ParameterPassingObject() {
    d ..showHead("ParameterPassingObject")
    s p=##class(PXW.DEV.Element).%New()
    s m=10000000

    d ..startTimer(.res,"..singleParameter(p)")
    f i=1:1:m { s x=..singleParameter(p) }
    d ..stopTimer(.res)

    d ..startTimer(.res,"..singleParameter(.p)")
    f i=1:1:m { s x=..singleParameter(.p) }
    d ..stopTimer(.res)

    d ..showRes(.res,m)

}


classmethod startTimer(byref results ,Name as %String) {
    s zh=$zh
    s results("current")=Name
    s results("zh")=zh
    s results("run order",$i(results("run order")))=Name
}
classmethod stopTimer(byref results) {
    s time=$zh-results("zh")
    s name=results("current")
    s results("name",name)=time
}

classmethod showHead(Title as %String)
{
    w !,Title
}

classmethod showRes(byref results as %String,Iterations as %Integer) {
    /*s t=""
    s min=1E14,mintest=""
    f  s t=$o(results("name",t)) q:t=""  s:results("name",t)<min min=results("name",t),mintest=t

    s t=""
    f  s t=$o(results("name",t)) q:t=""  w !,$s(t=mintest:"* ",1:"  ")_t,?30,results("name",t)
    */
    w !,"Iterations="_$fn(Iterations,",")
    k ranked
    s t=""
    f  s t=$o(results("run order",t),1,name) q:t=""  s time=results("name",name),ranked(time,t)=name

    s time="",t=""
    f  {
        s time=$o(ranked(time)) 
        q:time=""  
        f  {
            s t=$o(ranked(time,t),1,name) 
            q:t=""  
            w !,time,?10,name
        }
    }
    w !
}

classmethod basicQuit() as %Boolean {
    q 1
}

classmethod singleParameter(parameter as %String) as %Boolean {
    q 1
}
}
