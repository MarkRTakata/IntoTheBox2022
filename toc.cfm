<cfsavecontent variable="myDDX"><!--- Create DDX file to use --->
<DDX xmlns="http://ns.adobe.com/DDX/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ns.adobe.com/DDX/1.0/ coldfusion_ddx.xsd">
    <PDF result="TOCResult">
        <TableOfContents maxBookmarkLevel="infinite" bookmarkTitle="Content of Tables" 
    includeInTOC="false"/> 
        <PDF source="Doc1" />
        <PDF source="Doc2" />
    </PDF>
</DDX>
</cfsavecontent>

<cfscript>
ValidDDX = IsDDX(#myDDX#); // Check that the DDX file is valid
writeDump(ValidDDX);
if (ValidDDX){
    inputStruct = StructNew(); // Struct to hold input file values
    inputStruct.Doc1 = "chapter_1.pdf";
    inputStruct.Doc2 = "chapter_2.pdf";
    outputStruct = StructNew(); // Struct to hold output file values
    outputStruct.TOCResult = "toc.pdf";
    cfpdf(
        action="processddx",
        ddxfile="#myddx#",
        inputfiles="#inputStruct#",
        outputfiles="#outputStruct#",
        name="ddxVar"
    ); // Run CFPDF against the file and return a boolean to test for success
    writeDump(ddxVar);
}
else {
    writeDump("NO, DDX IS NOT OK");
}
</cfscript>