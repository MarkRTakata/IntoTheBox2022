<cfsavecontent variable="myDDX"><!--- Create DDX file to use --->
<DDX xmlns="http://ns.adobe.com/DDX/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ns.adobe.com/DDX/1.0/ coldfusion_ddx.xsd">
    <PDF result="ResultFile">
    <PDFGroup>
        <Footer styleReference="FooterStyle" />
        <PDF source="Doc1" />
        <PDF source="Doc2" />
    </PDFGroup>
    </PDF>
    <StyleProfile name="FooterStyle">
    <Footer>
        <Left>
            <StyledText>
                <p font-size="9pt"><i>CFML Reference</i></p>
            </StyledText>
        </Left>
        <Right>
            <StyledText>
                <p font-size="9pt">Page <_PageNumber/> of <_LastPageNumber/></p>
            </StyledText>
        </Right>
    </Footer>
    </StyleProfile>
</DDX>
</cfsavecontent>

<cfscript>
ValidDDX = IsDDX(#myDDX#); // Check that the DDX file is valid
if (ValidDDX){
    inputStruct = StructNew(); // Struct to hold input file values
    inputStruct.Doc1 = "input_1.pdf";
    inputStruct.Doc2 = "input_2.pdf";
    outputStruct = StructNew(); // Struct to hold output file values
    outputStruct.ResultFile = "styleprofile-footer.pdf";
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