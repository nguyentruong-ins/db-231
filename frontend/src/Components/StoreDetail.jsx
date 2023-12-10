import axios from "axios";
import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { convertDataToInput, convertDataToTime } from "../utils";

const StoreDetail = () => {
  const [store, setStore] = useState({});
  const { id } = useParams();

  useEffect(() => {
    async function fetchStores() {
      await axios
        .get("http://localhost:4000/api/admin/stores")
        .then((result) => {
          if (result.data.statusCode === 200) {
            const stores = result.data.message;
            const storeData = stores.filter(store => store.id == id)[0];
            setStore({
              ...storeData,
              opened_date: convertDataToInput(storeData.opened_date),
              opened_time: convertDataToTime(storeData.opened_time),
              closed_time: convertDataToTime(storeData.closed_time),
            });
          }
        })
        .catch((err) => console.log(err));
    }

    fetchStores();
  }, []);

  return (
    <div className="px-5 mt-3">
      <div className="p-3 rounded w-75 border mx-auto">
        <h3 className="text-center">Store Detail</h3>
        <div className="row">
          <div className="col-6 p-2">
            <label for="inputId" className="form-label">
              Id
            </label>
            <input
              type="number"
              className="form-control rounded-0"
              id="inputId"
              value={store.id}
              disabled
            />
            <label for="storeNumber" className="form-label">
              Store number
            </label>
            <input
              type="number"
              className="form-control rounded-0"
              id="storeNumber"
              value={store.store_number}
              disabled
            />
            <label for="storeName" className="form-label">
              Store name
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="storeName"
              value={store.store_name}
              disabled
            />
            <label for="address" className="form-label">
              Address
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="address"
              value={store.address}
              disabled
            />
            <label for="manager" className="form-label">
              Manager username
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="manager"
              value={store.manager_username}
              disabled
            />
          </div>

          <div className="col-6 p-2">
            <label for="openedDate" className="form-label">
              Opened day
            </label>
            <input
              type="date"
              className="form-control rounded-0"
              id="openedDate"
              value={store.opened_date}
              disabled
            />
            <label for="openedtime" className="form-label">
              Opened time
            </label>
            <input
              type="time"
              className="form-control rounded-0"
              id="openedtime"
              value={store.opened_time}
              disabled
            />
            <label for="closedTime" className="form-label">
              Closed time
            </label>
            <input
              type="time"
              className="form-control rounded-0"
              id="closedTime"
              value={store.closed_time}
              disabled
            />
            <label for="revenue" className="form-label">
              Monthly revenue
            </label>
            <input
              type="number"
              className="form-control rounded-0"
              id="revenue"
              value={store.month_revenue}
              autoComplete="off"
              disabled
            />
            <label for="revenue" className="form-label">
              Number of employees
            </label>
            <input
              type="number"
              className="form-control rounded-0"
              id="revenue"
              value={store.no_employees}
              autoComplete="off"
              disabled
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default StoreDetail;
