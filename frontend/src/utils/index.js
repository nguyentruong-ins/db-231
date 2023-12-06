function convertDatetimeData2Input(datetime) {
    const dbDate = new Date(datetime);
    const year = dbDate.getFullYear();
    const month = String(dbDate.getMonth() + 1).padStart(2, '0');
    const day = String(dbDate.getDate()).padStart(2, '0');
    const hours = String(dbDate.getHours()).padStart(2, '0');
    const minutes = String(dbDate.getMinutes()).padStart(2, '0');

    return `${year}-${month}-${day}T${hours}:${minutes}`;
}

function convertDatetimeInput2Data(localDatetime) {
    const parts = localDatetime.split('T');
    const datePart = parts[0];
    const timePart = parts[1];

    const [year, month, day] = datePart.split('-');
    const [hours, minutes] = timePart.split(':');

    const dbDatetime = new Date(
        Number(year),
        Number(month) - 1,
        Number(day),
        Number(hours),
        Number(minutes)
    ).toISOString();

    return dbDatetime;
}

export {
    convertDatetimeData2Input,
    convertDatetimeInput2Data
};