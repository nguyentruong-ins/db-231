function convertInputToData(dateInputValue) {
    const date = new Date(dateInputValue);
    const sqlDateTime = date.toISOString().replace('Z', '');

    return sqlDateTime;
}

function convertDataToInput(sqlDateTime) {
    const date = new Date(sqlDateTime);
    const dateInputValue = date.toISOString().split('T')[0];

    return dateInputValue;
}

function convertDataToTime(sqlDateTime) {
    const date = new Date(sqlDateTime);
    const timeInputValue = date.toISOString().split('T')[1].slice(0, 5);

    return timeInputValue;
}

export {
    convertInputToData,
    convertDataToInput,
    convertDataToTime
};
