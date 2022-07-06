//global const which points to which section to load


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



function section(){
    var pageSlect = document.getElementById("building_type").value;

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



//residential section and math
function residentialSec() {
   // const res =  document.querySelectorAll(".res");

   const res =  document.querySelectorAll(".res");


   if (res[0].style.display == "none"){
        reset();
        for (var i = 0 ; i < res.length ; i++){
            res[i].style.display = "block"
           }
   } else{
    for (var i = 0 ; i < res.length ; i++){
            res[i].style.display = "none"
            }
   }

  }

function residentialMath(){


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
if (document.getElementById("building_type").value == "residential") {

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

    if (document.getElementById("building_type").value == "commercial"){

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

    if (document.getElementById("building_type").value == "hybrid" || document.getElementById("building_type").value == "corporate"){

        

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











