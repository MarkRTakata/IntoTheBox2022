<cfsavecontent variable="myDDX"><!--- Create DDX file to use --->
<DDX xmlns="http://ns.adobe.com/DDX/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ns.adobe.com/DDX/1.0/ coldfusion_ddx.xsd">
    <PDF result="ResultFile">
    <Background alternation="EvenPages" verticalAnchor="Top">
        <StyledText>
            <p font-size="20pt" font-weight="bold" color="gray" font="Arial">DRAFT(EVEN)</p>
        </StyledText>
    </Background>
    <Background alternation="OddPages" verticalAnchor="Top">
        <StyledText>
            <p font-size="20pt" font-weight="bold" color="gray" font="Arial"><i>Beta 1(ODD)</i></p></StyledText>
    </Background>
    <PDFGroup>
        <PDF source="Doc1" />
        <PDF source="Doc2" />
    </PDFGroup>
    </PDF>
    
</DDX>
</cfsavecontent>

<cfscript>
ValidDDX = IsDDX(#myDDX#); // Check that the DDX file is valid
if (ValidDDX){
    inputStruct = StructNew(); // Struct to hold input file values
    inputStruct.Doc1 = "input_1.pdf";
    inputStruct.Doc2 = "input_2.pdf";
    outputStruct = StructNew(); // Struct to hold output file values
    outputStruct.ResultFile = "background.pdf";
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