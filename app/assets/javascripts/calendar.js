async function eventCalendar() {
    const feriadosNacionais = await getFeriadosNacionais();
    console.log(feriadosNacionais);
    return $('#event_calendar').fullCalendar({

        events: convertJSON(feriadosNacionais)
    });
}

function convertJSON(json_api) {
    let events = [];
    for (let i = 0; i < json_api.length; i++) {
        let [day, month, year] = json_api[i].date.split("/");
        let date = year + "-" + month + "-" + day;
        console.log(date);
        events.push({
            id: i,
            title: json_api[i].name,
            start: date,
            url: json_api[i].link,
        })
    }
    return events
}

function getFeriadosNacionais() {
    let response = $.ajax(
        {
            url: "https://api.calendario.com.br/?json=true&ano=2020&ibge=3550308&token=cGVkcm9fYXVndXN0b0BzdHJ1Y3QudW5iLmJyJmhhc2g9MTYxMjkwMjk1",
            dataType: "json",
            success: function (result) {
                console.log("Deu bom");
            },
            error: function () {
                console.log("Error API FERIADOS")
            }
        }
    );
    return response
}

function clearCalendar() {
    $('#event_calendar').fullCalendar('delete'); // In case delete doesn't work.
    $('#event_calendar').html('');
}

$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar);