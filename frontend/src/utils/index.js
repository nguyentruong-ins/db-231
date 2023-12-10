function convertInputToData(dateInputValue) {
    try {
        const date = new Date(dateInputValue);
        const sqlDateTime = date.toISOString().replace('Z', '');

        return sqlDateTime;
    } catch (error) {
        return null;
    }
}

function convertDataToInput(sqlDateTime) {
    try {
        const date = new Date(sqlDateTime);
        const dateInputValue = date.toISOString().split('T')[0];

        return dateInputValue;
    } catch (error) {
        return null;
    }
}

function convertDataToTime(sqlDateTime) {
    try {
        const date = new Date(sqlDateTime);
        const timeInputValue = date.toISOString().split('T')[1].slice(0, 5);

        return timeInputValue;
    } catch (error) {
        return null;
    }
}

export {
    convertInputToData,
    convertDataToInput,
    convertDataToTime
};
