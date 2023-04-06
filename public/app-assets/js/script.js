
function currentDates(){
    
    let date = new Date()
    let dates = [date]
    for (let i = 1; i < 31; i++) {
        const newDate = new Date(date.getFullYear(), date.getMonth(), date.getDate()+i)
        
        dates.push(newDate)
    }
    
    return dates
}

function minTwoDigits(n) {
  return (n < 10 ? '0' : '') + n;
}

let weekdays = new Array(7);
weekdays[0] = "Sunday";
weekdays[1] = "Monday";
weekdays[2] = "Tuesday";
weekdays[3] = "Wednesday";
weekdays[4] = "Thursday";
weekdays[5] = "Friday";
weekdays[6] = "Saturday";
let deliveryDate = document.getElementById("delivery-date")
const dates = currentDates()
let deliverydate = ""
let deliverytime = ""
if(deliveryDate){
    $.ajax({
        url: "https://livsham.softwarebyte.co/api/admin/deliverytime",
        type: "GET",
        success: function(response){
            let disabled = response.filter(item => (item.status == 0 && item.start_time == "00:00:00"))
            let disableddates = disabled.map(data => data.date)
            // console.log(disableddates[0])
            
            
            for (let i = 0; i < dates.length; i++) {
                let dateformat = `${dates[i].getFullYear()}-${minTwoDigits(dates[i].getMonth()+1)}-${minTwoDigits(dates[i].getDate())}`
                let deliverydatadisabled = disableddates.includes(dateformat) ? 'Enable': "Disable"
                // console.log(dateformat)
                // console.log(deliverydatadisabled)
                deliverydate += 
                `
                
                <tr >
                    <td>${i+1}</td>
                    <td><a href="https://livsham.softwarebyte.co/admin/deliverytime/${dates[i].getFullYear()}-${dates[i].getMonth()+1}-${dates[i].getDate()}"> ${dates[i].getDate()} ${dates[i].toLocaleString('en-us', { month: 'long' })} ${dates[i].getFullYear()}</a></td>
                    <td>
                        <a  id="${dates[i].getFullYear()}-${dates[i].getMonth()+1}-${dates[i].getDate()}" class="cursor-pointer toggle-date" >${deliverydatadisabled}</a>
                    </td>
                </tr>
                `
                
            }
            
            deliveryDate.innerHTML = deliverydate
            
            
            
            let toggleDates = document.getElementsByClassName('toggle-date')
            toggleDates = [...toggleDates]
            // console.log(toggleDates)
            // console.log(toggleDates.length)
            
            for (let i = 0; i < toggleDates.length; i++) {
                const toggleDate = toggleDates[i];
                // console.log(toggleDate)
                toggleDate.addEventListener('click', function(){
                    const res = ToggleDate(toggleDate.id)
                    // console.log(res.status)
                    // console.log(toggleDate.innerHTML == "Disable")
                        if((toggleDate.innerHTML == "Disable")){
                            toggleDate.innerHTML = "Enable"
                        }else{
                            toggleDate.innerHTML = "Disable"
                        }
                        
                    
                    
                })
                
            }
          
        }
    })
       
    
    
}


function checkDate(firstdate, seconddate){
    firstdate = new Date(firstdate)
    seconddate = new Date(seconddate)
    
}




function ToggleDate(date, start_time="00:00:00", end_time="24:00:00"){
    let temp = null
    $.ajax({
        url: "https://livsham.softwarebyte.co/admin/deliverytime/store",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
        type: "POST",
        data: {
          "date":date,
          "start_time":start_time,
          "end_time":end_time
        },
        
        success: function(response){
            // console.log(response)
            temp = response
        }
    })
    return temp
}

function DeliveryDate(){
    let temp = []
    $.ajax({
        url: "https://livsham.softwarebyte.co/api/admin/deliverytime",
        type: "GET",
        success: function(response){
            temp = response
        }
    })
    return temp
}
// console.log(DeliveryDate())
function DeliveryTime(date){
    $.ajax({
        url: "https://livsham.softwarebyte.co/api/admin/deliverytime/"+date,
        type: "GET",
        success: function(response){
            // console.log(response)
            for (let i = 0; i < response.length; i++) {
                const element = response[i]
                if(!(element.start_time == "00:00:00")){
                    const timeRange = element.start_time + "-"+ element.end_time
                    const timeRangeDiv = document.getElementById(timeRange)
                    if(timeRangeDiv){
                        timeRangeDiv.innerHTML = "Enable"
                    }
                }
            }
            
        }
    })
}


let deliveryTime = document.getElementById("delivery-time")

if(deliveryTime){
    
    const urlpath = window.location.pathname
    const date = urlpath.substr(urlpath.search(/\d+-\d+-\d/))
    DeliveryTime(date)
    
    let timeRanges = document.getElementsByClassName('time-range')

    for (let i = 0; i < timeRanges.length; i++) {
        const timeRange = timeRanges[i]
        timeRange.addEventListener('click', function(){
            timeRangeArray = timeRange.id.split('-')
            const start_time = timeRangeArray[0]
            const end_time = timeRangeArray[1]
            ToggleDate(date, start_time, end_time)
            // console.log(timeRange)
            timeRange.innerHTML = (timeRange.innerHTML == "Disable") ? "Enable" : "Disable"
        })
    }

}
    
    
    
    
    