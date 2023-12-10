import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { convertDataToInput, convertDataToTime } from "../utils";

const Store = () => {
  const [store, setStore] = useState([]);

  useEffect(() => {
    async function fetchStores() {
      await axios
        .get("http://localhost:4000/api/admin/stores")
        .then((result) => {
          if (result.data.statusCode === 200) {
            // console.log(result.data.message);
            setStore(result.data.message);
          } else {
            alert(result.data.message);
          }
        })
        .catch((err) => console.log(err));
    }

    fetchStores();
  }, []);

  return (
    <div className="px-5 mt-3">
      <div className="d-flex justify-content-center">
        <h3>Store List</h3>
      </div>
      <div className="mt-3">
        <table className="table striped-table">
          <thead>
            <tr>
              <th>Id</th>
              <th>Store number</th>
              <th>Store name</th>
              <th>Address</th>
              <th>Opened day</th>
              <th>Opened time</th>
              <th>Closed time</th>
              <th>Manager</th>
              <th>Monthly revenue</th>
              <th>Number of employees</th>
            </tr>
          </thead>
          <tbody>
            {store.map((e) => {
              return (
                <tr key={e.id}>
                  <td>{e.id}</td>
                  <td>{e.store_number}</td>
                  <td>{e.store_name}</td>
                  <td>{e.address}</td>
                  <td>{convertDataToInput(e.opened_date)}</td>
                  <td>{convertDataToTime(e.opened_time)}</td>
                  <td>{convertDataToTime(e.closed_time)}</td>
                  <td>{e.manager_username}</td>
                  <td>{e.month_revenue}</td>
                  <td>{e.no_employees}</td>
                  <td>
                    <Link
                      to={`/dashboard/store_detail/` + e.id}
                      className="btn btn-info btn-sm me-2"
                    >
                      Detail
                    </Link>
                  </td>
                </tr>
              )
            })}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Store;
