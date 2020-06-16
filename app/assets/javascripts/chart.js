$(document).on('turbolinks:load', async function () {
    let ctx = document.getElementById('myChart').getContext('2d');
    let covid_data = await getCovidData();
    console.log(covid_data);
    let myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: getStateNames(covid_data.data),
            datasets: [{
                label: 'Número de casos de covid',
                data: getStateCases(covid_data.data),
                backgroundColor: CanvasGradient
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
});

function getCovidData() {
    return $.ajax(
        {
            url: "https://covid19-brazil-api.now.sh/api/report/v1",
            dataType: "json",
        }
    )
}

function getStateCases(data_json) {
    let data = [];
    for (let i=0; i < data_json.length; i++) {
        data.push(data_json[i].cases)
    }
    console.log(data)
    return data
}
function getStateNames(data_json) {
    let data = [];
    for (let i=0; i < data_json.length; i++) {
        data.push(data_json[i].state)
    }
    console.log(data)
    return data
}