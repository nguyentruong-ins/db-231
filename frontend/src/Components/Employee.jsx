import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { convertDataToInput } from "../utils";

const Employee = () => {
  const [employee, setEmployee] = useState([]);
  // useEffect(() => {
  //   axios.get('/sample_data/employee_accounts.json')
  //     .then(result => {
  //       setEmployee(result.data["SELECT * FROM employee_accounts;\n"]);
  //     })
  //     .catch(err => console.log(err))
  // }, [])


  useEffect(() => {
    async function fetchEmployees() {
      await axios
        .get("http://localhost:4000/api/admin/employees")
        .then((result) => {
          if (result.data.statusCode === 200) {
            console.log(result.data.message);
            setEmployee(result.data.message);
            // sessionStorage.setItem("employees", JSON.parse(result.data.message));
          } else {
            alert(result.data.message);
          }
        })
        .catch((err) => console.log(err));
    }

    fetchEmployees();
  }, []);

  const handleDelete = async (username) => {
    const shouldDelete = window.confirm('Are you sure to change status of this employee?');
    await axios
      .post('http://localhost:4000/api/admin/delete-employee', { username })
      .then(result => {
        if (result.data.statusCode === 200) {
          window.location.reload();
        } else {
          alert(result.data.message);
        }
      })
      .catch((err) => console.log(err));
  }
  return (
    <div className="px-5 mt-3">
      <div className="d-flex justify-content-center">
        <h3>Employee List</h3>
      </div>
      <Link to="/dashboard/add_employee" className="btn btn-success">
        Add Employee
      </Link>
      <div className="mt-3">
        <table className="table striped-table">
          <thead>
            <tr>
              <th>Username</th>
              <th>Full name</th>
              <th>Salary</th>
              <th>Account type</th>
              <th>Employee Type</th>
              <th>Store id</th>
              <th>Start date</th>
              <th>Account status</th>
            </tr>
          </thead>
          <tbody>
            {employee.map((e) => {
              return (
                <tr key={e.id}>
                  <td>{e.username}</td>
                  <td>{e.first_name + " " + e.last_name}</td>
                  <td>{parseInt(e.salary)}</td>
                  <td>{e.account_type}</td>
                  <td>{e.employee_type}</td>
                  <td>{e.store_id}</td>
                  <td>{convertDataToInput(e.started_date)}</td>
                  <td>{e.status ? "ACTIVE" : "INACTIVE"}</td>
                  <td>
                    <Link
                      to={`/dashboard/edit_employee/` + e.username}
                      className="btn btn-primary btn-sm me-2"
                    >
                      Edit
                    </Link>
                    {e.status && (
                      <button
                        className={`btn ${!e.status ? 'btn-success' : 'btn-danger'} btn-sm`}
                        // style={{ width: '80px' }}
                        onClick={() => handleDelete(e.username)}
                      >
                        {e.status ? "Inactive" : "Active"}
                      </button>
                    )}
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

export default Employee;
