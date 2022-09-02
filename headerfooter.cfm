<cfsavecontent variable="myDDX"><!--- Create DDX file to use --->
<DDX xmlns="http://ns.adobe.com/DDX/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ns.adobe.com/DDX/1.0/ coldfusion_ddx.xsd">
    <PDF result="ResultFile">
    <PDFGroup>
        <PDF source="Doc1" />
        <PDF source="Doc2" />
    </PDFGroup>
    <Header>
        <Right>
            <StyledText>
                <p>Right-justified header text</p>
            </StyledText>
        </Right>
        <Left>
            <StyledText>
                <p>Left-justified header text</p>
            </StyledText>
        </Left>
    </Header>
    <Footer>
        <Center>
            <StyledText>
                <p>Page <_PageNumber/> of <_LastPageNumber/></p>
            </StyledText>
        </Center>
    </Footer>
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
    outputStruct.ResultFile = "HeaderFooter.pdf";
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