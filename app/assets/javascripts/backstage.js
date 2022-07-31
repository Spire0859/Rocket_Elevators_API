function reset(){

    const reset =  document.querySelectorAll(".reset");
    const resetv =  document.querySelectorAll(".resetv");

    for (var y = 0; y < resetv.length; y++){
        resetv[y].value = "0";
    }

    for (var i = 0 ; i < reset.length ; i++){
            reset[i].style.display = "none"
            }

}
original = document.getElementById("meow").children[1].innerHTML;

function customer(){
    // resets the fields

    // sort the customer and building
    customerFieldID = document.getElementById("customerField").children[1].value;
    customerFieldName = document.getElementById("customerField").children[1].children[customerFieldID].innerHTML;
    let query = "optgroup[label='" +  customerFieldName + "']"

    let dummy = "<option value='6969'>Please Select</option>"
   
    buildingField = document.getElementById("buildingField").children[1].innerHTML;
    options = $(buildingField).filter(query).html();

    let end = dummy + options;
    
    document.getElementById("buildingField").children[1].innerHTML = end;

   
    document.getElementById("buildingField").style.display = "block"
    // sort the building and battery
 
}

function battery(){
    // resets the fields

    // sort the customer and building
    buildingFieldID = document.getElementById("buildingField").children[1].value;
    buildingFiel= document.getElementById("buildingField").children[1].innerHTML;

    let buildingFieldSelected;
    if (buildingFieldID % 2 == 0){
        buildingFieldSelected = 2; 
    }else{
        buildingFieldSelected = 1;
    }

    buildingFielddName = document.getElementById("buildingField").children[1].children[buildingFieldSelected].innerHTML;
    let query1 = "optgroup[label='" +  buildingFielddName + "']"


    batteryField = document.getElementById("batteryField").children[1].innerHTML;
    let dummy = "<option value='6969'>Please Select</option>"

    options1 = $(batteryField).filter(query1).html();
    let end = dummy + options1;

    document.getElementById("batteryField").children[1].innerHTML = end;

    document.getElementById("batteryField").style.display = "block"


    
  

}

function column(){
    // resets the fields

    // sort the customer and building
   batteryFieldID = document.getElementById("batteryField").children[1].value;
   batteryFieldFiel= document.getElementById("batteryField").children[1].innerHTML;

    let batteryFieldSelected;
    if (batteryFieldID % 2 == 0){
        batteryFieldSelected = 2; 
    }else{
        batteryFieldSelected = 1;
    }

    batteryFieldName = document.getElementById("batteryField").children[1].children[batteryFieldSelected].innerHTML;
    let query1 = "optgroup[label='" +  batteryFieldName + "']"


   columnField = document.getElementById("columnField").children[1].innerHTML;
    let dummy = "<option value='6969'>Please Select</option>"

    options1 = $(columnField).filter(query1).html();
    let end = dummy + options1;

    document.getElementById("columnField").children[1].innerHTML = end;

    document.getElementById("columnField").style.display = "block"

}

function elevator(){
    // resets the fields

    // sort the customer and building
   columnFieldID = document.getElementById("columnField").children[1].value;

    let  columnFieldSelected;
    if ( columnFieldID % 2 == 0){
        columnFieldSelected = 2; 
    }else{
        columnFieldSelected = 1;
    }

    columnFieldName = document.getElementById("columnField").children[1].children[columnFieldSelected].innerHTML;
    let query1 = "optgroup[label='" +   columnFieldName + "']"


   elevatorField = document.getElementById("elevatorField").children[1].innerHTML;
    let dummy = "<option value='6969'>Please Select</option>"

    options1 = $(elevatorField).filter(query1).html();
    let end = dummy + options1;

    document.getElementById("elevatorField").children[1].innerHTML = end;

    document.getElementById("elevatorField").style.display = "block"

}

function section(){
    var pageSlect = document.getElementById("building-type").value;

    if (pageSlect == "residential") {
        reset();
        const res =  document.querySelectorAll(".res");
        for (var i = 0 ; i < res.length ; i++){
            res[i].style.display = "block"
        }
    }

    if(pageSlect == "commercial"){
        reset();
        const com =  document.querySelectorAll(".com");

       for (var i = 0 ; i < com.length ; i++){
           com[i].style.display = "block"
        }
    }

    if (pageSlect == "corporate"){
        reset();
        const cor =  document.querySelectorAll(".cor");

        for (var i = 0 ; i < cor.length ; i++){
            cor[i].style.display = "block"
        }
    }

    if (pageSlect == "hybrid"){
        reset();
        const hyb =  document.querySelectorAll(".hyb");

        for (var i = 0 ; i < hyb.length ; i++){
            hyb[i].style.display = "block"
            }
        }


}

function btype(){

    document.getElementById("secret").value = document.getElementById("building-type").value;
}


function residentialMath(){

    document.getElementById("secret").value = document.getElementById("building-type").value;
   var RnAppar = document.getElementById("number-of-apartments").children[1].valueAsNumber ;
   var RnFloors = document.getElementById("number-of-floors").children[1].valueAsNumber ;
   var EleDeploy = document.getElementById("number-of-elevators").children[1].valueAsNumber;
   var OccPerFloor = document.getElementById("maximum-occupancy").children[1].valueAsNumber;
   var Basements = document.getElementById("number-of-basements").children[1].valueAsNumber;
   var NumOfOccu = 0;
   var EleUnitPrice = 7565;
   var tierPercentage = 10;
   var FinalP = 0;
   var EleCost = 0;
   var ExtraShaft = 1;
   var instalationFee = 0;

                    // math for res section
if (document.getElementById("building-type").value == "residential") {

    if( document.getElementById("Rstandard").checked == true ) {
        tierPercentage = 10;
        EleUnitPrice = 7565;
    }

        else if( document.getElementById("Rpremium").checked == true ) {
            tierPercentage = 13;
            EleUnitPrice = 12345;
        }
            else if( document.getElementById("Rexcelium").checked == true ) {
                tierPercentage = 16;
                EleUnitPrice = 15400;
        
            }

            var numOfEve = Math.ceil(( RnAppar / RnFloors ) / 6);

            if (RnFloors > 20){
                ExtraShaft = (numOfEve * 2 ) ;
            }else {
                ExtraShaft = 0;
            }
            
            numOfEve += ExtraShaft;

            EleCost = numOfEve * EleUnitPrice ;
            instalationFee = EleCost / 100 * tierPercentage ;
            FinalP = EleCost + instalationFee ;
    
        
        document.getElementById("elevator-amount").children[1].value = numOfEve;
        document.getElementById("elevator-unit-price").children[1].value = EleUnitPrice.toLocaleString("en-US", {style:"currency", currency:"USD"});
        document.getElementById("elevator-total-price").children[1].value = EleCost.toLocaleString("en-US", {style:"currency", currency:"USD"});
        document.getElementById("installation-fees").children[1].value = instalationFee.toLocaleString("en-US", {style:"currency", currency:"USD"});
        document.getElementById("final-price").children[1].value = FinalP.toLocaleString("en-US", {style:"currency", currency:"USD"});
   }



                    //math for commercial sections

    if (document.getElementById("building-type").value == "commercial"){

        if( document.getElementById("Rstandard").checked == true ) {
            tierPercentage = 10;
            EleUnitPrice = 7565;
        }
        
            else if( document.getElementById("Rpremium").checked == true ) {
                tierPercentage = 13;
                EleUnitPrice = 12345;
            }
                else if( document.getElementById("Rexcelium").checked == true ) {
                    tierPercentage = 16;
                    EleUnitPrice = 15400;
            
                }

                
                
                EleCost = EleDeploy * EleUnitPrice ;
                instalationFee = EleCost / 100 * tierPercentage;
                FinalP = EleCost + instalationFee;


            document.getElementById("elevator-amount").children[1].value = EleDeploy;
            document.getElementById("elevator-unit-price").children[1].value = EleUnitPrice.toLocaleString("en-US", {style:"currency", currency:"USD"});
            document.getElementById("elevator-total-price").children[1].value = EleCost.toLocaleString("en-US", {style:"currency", currency:"USD"});
            document.getElementById("installation-fees").children[1].value = instalationFee.toLocaleString("en-US", {style:"currency", currency:"USD"});
            document.getElementById("final-price").children[1].value = FinalP.toLocaleString("en-US", {style:"currency", currency:"USD"});
    }

    if (document.getElementById("building-type").value == "hybrid" || document.getElementById("building-type").value == "corporate"){

        

            if( document.getElementById("Rstandard").checked == true ) {
                tierPercentage = 10;
                EleUnitPrice = 7565;
            }
            
                else if( document.getElementById("Rpremium").checked == true ) {
                    tierPercentage = 13;
                    EleUnitPrice = 12345;
                }
                    else if( document.getElementById("Rexcelium").checked == true ) {
                        tierPercentage = 16;
                        EleUnitPrice = 15400;
                
                    }
                    
                    console.log(RnFloors);

                   NumOfOccu = (RnFloors + Basements) * OccPerFloor;
                   numOfEve = NumOfOccu / 1000;
                   
                   if ((RnFloors + Basements) > 20){
                        ExtraShaft = Math.ceil((RnFloors + Basements)/ 20) ;
                    }else {
                        ExtraShaft = 1;
                    }
                    console.log(ExtraShaft);
                    var temp;

                    temp = Math.ceil(numOfEve / ExtraShaft);
                    console.log(temp);
                    numOfEve = Math.ceil(temp * ExtraShaft);
                    EleCost = numOfEve * EleUnitPrice;
                    instalationFee = EleCost / 100 * tierPercentage;
                    FinalP = instalationFee + EleCost;


                document.getElementById("elevator-amount").children[1].value = numOfEve;
                document.getElementById("elevator-unit-price").children[1].value = EleUnitPrice.toLocaleString("en-US", {style:"currency", currency:"USD"});
                document.getElementById("elevator-total-price").children[1].value = EleCost.toLocaleString("en-US", {style:"currency", currency:"USD"});
                document.getElementById("installation-fees").children[1].value = instalationFee.toLocaleString("en-US", {style:"currency", currency:"USD"});
                document.getElementById("final-price").children[1].value = FinalP.toLocaleString("en-US", {style:"currency", currency:"USD"});




        

    }

}