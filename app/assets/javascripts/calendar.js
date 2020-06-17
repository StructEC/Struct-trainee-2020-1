async function eventCalendar() {
    let data = await getFeriadosNacionais();
    console.log(data);
    return $('#event_calendar').fullCalendar({
        events: convertDataToEvents(data)
    });
};

function clearCalendar() {
    $('#event_calendar').fullCalendar('delete'); // In case delete doesn't work.
    $('#event_calendar').html('');
};

function convertDataToEvents(data_json) {
    let events = [];
    for (let i = 0; i < data_json.length; i++) {
        let [dia, mes ,ano] = data_json[i].date.split("/");
        let start = ano + "-" + mes + "-" + dia;
        events.push({
            id: i,
            title: data_json[i].name,
            start: start,
            url: data_json[i].link,
        })
    }
    return events
}

function getFeriadosNacionais() {
    return $.ajax(
        {
            url: "https://api.calendario.com.br/?json=true&ano=2020&ibge=3550308&token=cGVkcm9fYXVndXN0b0BzdHJ1Y3QudW5iLmJyJmhhc2g9MTYxMjkwMjk1",
            success: function (result) {
                console.log("Deu bom")
            },
            error: function (result) {
                console.log("Deu ruim")
            }
        }
    )
}

$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar);