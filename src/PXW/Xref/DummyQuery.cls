Class PXW.DEV.UnitTests.DummyQuery [ ClassType = view, ViewQuery = {

    SELECT DISTINCT A.ItemKey1 as Name
            ,a.ItemKey2 as SubName
            ,a.CalledByKey1
    FROM (SELECT b.ItemKey1
                 ,b.ItemKey2
                 ,b.CalledByKey1
                 ,b.CalledByKey2 
                 ,LENGTH(b.calledByKey1) as ll
                 ,1 as numbe
                 ,2*2 as four
                FROM (SELECT * 
                        ,'hello' as ExtraColumn
                        FROM 
                        (SELECT * FROM PXW_XREF.data)
                      ) b) AS a

} ]
{

}
