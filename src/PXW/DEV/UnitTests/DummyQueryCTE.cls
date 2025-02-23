Class PXW.DEV.UnitTests.DummyQueryCTE [ ClassType = view, ViewQuery = {

with main as ( 
        SELECT *
                ,'hello' as ExtraColumn   
                FROM (SELECT * FROM PXW_XREF.data) 
)       
    SELECT DISTINCT A.ItemKey1 as Name   
            ,a.ItemKey2 as SubName    
            ,a.CalledByKey1 f    
    FROM (SELECT b.ItemKey1 
                 ,b.ItemKey2      
                 ,b.CalledByKey1 
                 ,b.CalledByKey2 cbk2  
                 ,LENGTH(b.calledByKey1) as ll
                 ,1 as numbe  
                 ,2*2 as four
                 ,ExtraColumn as hi
                FROM main as b ) AS a
} ]
{

}
