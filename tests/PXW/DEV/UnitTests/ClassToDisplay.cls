Class PXW.DEV.UnitTests.ClassToDisplay Extends %RegisteredObject
{

Property Prop1 As %String;

Property Prop2 As %Integer [ SqlComputeCode = { s {*}={Prop_1} } ];

ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1))
{
    
    s string="a string"
    set string=string_" and more"
    set string=string_" and some expression "_(xxx+1)_"."
    set another="prefixed "_string
    q another
}

/*
ClassMethod IfDone()
{
    #define record(%name) s t=$zh-zh,t(t)=%name w !,%name,?10,t
    s max=100000000
    s done=1
    s zh=$zh 
    f i=1:1:max {
        i ''done {
            ;
        }
    }
    $$$record("''done")

    s zh=$zh 
    f i=1:1:max {
        i done {
            ;
        }
    }
    $$$record("done")


    s zh=$zh 
    f i=1:1:max {
        i done=1 {
            ;
        }
    }
    $$$record("done=1")

    s zh=$zh 
    f i=1:1:max {
        i +done {
            ;
        }
    }
    $$$record("+done")


    s zh=$zh 
    f i=1:1:max {
        i done>0 {
            ;
        }
    }
    $$$record("done>0")

    s zh=$zh 
    f i=1:1:max {
        i 'done {
            ;
        } else {
            ;
        }
    }
    $$$record("'done else")
    zw t
}

ClassMethod IfDoneFlag()
{
    #define record(%name) s t=$zh-zh,t(t)=%name w !,%name,?10,t
    s max=10000000
    s done=1
    s zh=$zh 
    f i=1:1:max {
        s ok=0
        i done {
            s ok=1
        }
    }
    $$$record("set 0 if done(1) set 1")

    s zh=$zh 
    s done=1
    f i=1:1:max {
        i done {
            s ok=1
        } else {
            s ok=0
        }
    }
    $$$record("if done(1) set 1 else set 0")

    s zh=$zh 
    s done=1
    f i=1:1:max {
        i 'done {
            s ok=0
        } else {
            s ok=1
        }
    }
    $$$record("if 'done(1) set 0 else set 1")

    s zh=$zh 
    s done=0
    f i=1:1:max {
        i done {
            s ok=1
        } else {
            s ok=0
        }
    }
    $$$record("if done(0) set 1 else set 0")

    s zh=$zh 
    s done=0
    f i=1:1:max {
        i 'done {
            s ok=0
        } else {
            s ok=1
        }
    }
    $$$record("if 'done(0) set 0 else set 1")

    zw t
}

ClassMethod go()
{
    s string="+++"
    s pos=1
    s locate=$locate(string,"(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)",pos,end,val)
    zw string,locate,pos,end,val
    w $e(string,pos,end)_".",!

    #define record(%name) s t=$zh-zh,t(t)=%name w %name,?15,t,!
    s max=100000000

    s ok=0
    s zh=$zh 
    f i=1:1:max {
        s ok=1
    }
    $$$record("s ok=1")

    s ok=0
    s zh=$zh 
    f i=1:1:max {
        s:'ok ok=1
    }
    $$$record("s:'ok ok=1")

    s ok=0
    s zh=$zh 
    f i=1:1:max {
        i 'ok { s ok=1 }
    }
    $$$record("i 'ok { s ok=1 }")
    zw t
}
*/
}
