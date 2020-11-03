const send_otp_btn = document.querySelector("#send_otp_btn");
const form = document.querySelector("#profile_form");
const otp = document.querySelector("#otp");
const otp_box_wrapper = document.querySelector("#otp_box_wrapper");
const loader = document.querySelector("#loader");
const otp_box = document.querySelector("#otp_box");
const close = document.querySelector("#close");
const greeting_name = document.querySelector("#greeting_name");

if(form.firstName.value!=""){
    greeting_name.innerHTML = form.firstName.value+" "+form.lastName.value;
}


close.onclick = ()=>{
    otp_box_wrapper.style.visibility = 'hidden';
    otp_box.style.display = 'none';
    form.otp.value = "";
}

const sendOTP = async()=>{
    const data = await fetch("sendOTP.do?mobile="+otp.value.trim());
    return data;
}

const updateUI = () => {
	otp_box.style.display = 'block';
	loader.style.display = 'none';
};
const verifyOTP = async()=>{
    const response = await fetch("verifyOTP.do?otp="+form.otp.value.trim());
    const data = await response.json();
    return data;
}
const  OTPflag = async()=>{
    const response = await fetch("mobileOTPFlag.do?mobile="+form.mobile.value);
    const data = await response.json();
    return data;
}

OTPflag().then((data)=>{
    mobileOTP_flag = data.resp;
    if(mobileOTP_flag==="true"){
        send_otp_btn.value="SUBMIT";

    }else{
        
    }
}).catch((error)=>{
    console.log(error);
});

form.mobile.addEventListener("keyup", (e)=>{

    OTPflag().then((data)=>{
        mobileOTP_flag = data.resp;
        if(mobileOTP_flag==="true"){
            send_otp_btn.value="SUBMIT";
    
        }else{
            send_otp_btn.value="SEND OTP";
        }
    }).catch((error)=>{
        console.log(error);
    });
    
    
});



form.addEventListener('submit', (e)=>{
    if(otp.value.trim().length==6){
        e.preventDefault();
        verifyOTP().then((data)=>{
            if(data.resp=="success"){
                form.submit();
            }
            else{
                console.log("otp not matched....");
             
                // wrong otp show error div code
            }
        }).catch((error)=>{
            console.log(error);
        });
    }else{
        e.preventDefault();
        otp.value = "";
        var mobileOTP_flag = false;
        // ---------------------------------------
        OTPflag().then((data)=>{
            mobileOTP_flag = data.resp;
            if(mobileOTP_flag==="true"){
                send_otp_btn.value="SUBMIT";
                form.submit();

            }else{

                if(form.mobile.value.length==10){
                    otp_box_wrapper.style.visibility = "visible";
                    loader.style.display = "block";
                    sendOTP().then((data)=>{
                        updateUI();
                    }).catch((error)=>{
                        console.log(error);
                    });    
                }

            }
        }).catch((error)=>{
            console.log(error);
        });
        
        // ---------------------------------------

        // if(form.mobile.value.trim().length==10){
        //     otp_box_wrapper.style.visibility = "visible";
        //     loader.style.display = "block";
        //     sendOTP().then((data)=>{
        //         console.log("data from url");
        //         updateUI();
        //     }).catch((error)=>{
        //         console.log(error);
        //     });    
        // }
        
    }
});