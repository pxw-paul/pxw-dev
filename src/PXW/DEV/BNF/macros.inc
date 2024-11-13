ROUTINE PXW.DEV.BNF.macros [Type=INC]

/// start a parser section "transaction"
#define BNFSTART(%sub) set %sub=..newElement(##Expression(""""_%methodname_"""")) d ..getBookmark(.##SAFEExpression("%sub"_"BM")) /* $$$DEBUG("BNFSTART:"_%subElement)*/

/// commit the transaction to the parent
#define BNFCOMMIT(%sub,%parent) do:%sub.partsCount()>0 %parent.AddPart(%sub) 

/// commit the transaction to the parent, by copying the data rather than creating a new node
#define BNFCOMMITCOPY(%sub,%parent) do %parent.partsCopy(%sub) 
 
/// rollback the transaction 
///#define BNFROLLBACK $$$DEBUG("BNFROLLBACK:"_%path)  d:%subElement.parts.Count()>0 ..gotoBookmark(.%bookmark) kill %subElement  
///#define BNFROLLBACK(%sub) $$$DEBUG("BNFROLLBACK:"_$g(%path))  d:%sub.parts.Count()>0 ..gotoBookmark(.bookmark) kill %sub
#define BNFROLLBACK(%sub) $$$DEBUG("BNFROLLBACK:"_$p($g(%path),"/",*)) s:%sub.partsCount() rbcount=$i(%RBCOUNT(##Expression(""""_%methodname_""""))) d:%sub.partsCount() ..gotoBookmark(.##SAFEExpression("%sub"_"BM")) kill %sub

/// keep track of the path
#define BNFPATH i $d(%path) set currentpath=%path new %path set %path=currentpath_$c(47)_##expression(""""_%methodname_"""") $$$DEBUG("%path="_%path) $$$DEBUG("%path at "_$zconvert(..peek(20),"O","JSON"))


/// MEMO storage is used as a cache a method's result, used for recursive
/// See if there is an item in the cache at the given position
#DEFINE BNFMEMOExists(%pos) $d(..memo(##safeexpression(""""_%classname_":"_%methodname_""""),%pos))

/// Set a memo is the storage
#DEFINE BNFMEMOSET(%pos,%obj) d ..getBookmark(.bma) s ..memo(##safeexpression(""""_%classname_":"_%methodname_""""),%pos)=%obj m ..memo(##safeexpression(""""_%classname_":"_%methodname_""""),%pos,"bm")=bma

/// Get a memo from storage
#DEFINE BNFMEMOGET(%pos,%obj) s %obj=..memo(##safeexpression(""""_%classname_":"_%methodname_""""),%pos) m bma=..memo(##safeexpression(""""_%classname_":"_%methodname_""""),%pos,"bm") d ..gotoBookmark(.bma)

/// Kill a memo from storage
#DEFINE BNFMEMOKILL(%pos,%obj) k ..memo(##safeexpression(""""_%classname_":"_%methodname_""""),%pos)


#define peek(%stream,%number) $e(%stream.input,%stream.pos,%stream.pos+%number-1)