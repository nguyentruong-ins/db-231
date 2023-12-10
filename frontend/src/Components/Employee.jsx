import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const Employee = () => {
  const [employee, setEmployee] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    axios.get('/sample_data/employee_accounts.json')
      .then(result => {
        setEmployee(result.data["SELECT * FROM employee_accounts;\n"]);
      })
      .catch(err => console.log(err))
  }, [])

  // useEffect(() => {
  //   axios
  //     .get("http://localhost:3000/auth/employee")
  //     .then((result) => {
  //       if (result.data.Status) {
  //         setEmployee(result.data.Result);
  //       } else {
  //         alert(result.data.Error);
  //       }
  //     })
  //     .catch((err) => console.log(err));
  // }, []);

  const handleDelete = (id) => {
    const shouldDelete = window.confirm('Are you sure you want to delete this component permanently?');
    if (!shouldDelete) return;
    axios.delete('http://localhost:3000/auth/delete_employee/' + id)
      .then(result => {
        if (result.data.Status) {
          window.location.reload()
        } else {
          alert(result.data.Error)
        }
      })
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
              <th>Start date</th>
              <th>Salary</th>
              <th>Type</th>
              <th>Store</th>
              <th>Account type</th>
              <th>Account status</th>
            </tr>
          </thead>
          <tbody>
            {employee.map((e) => (
              <tr>
                <td>{e.username}</td>
                <td>{e.started_date}</td>
                <td>{e.salary}</td>
                <td>{e.employee_type}</td>
                <td>{e.store_id}</td>
                <td>{e.account_type}</td>
                <td>{e.status ? "Active" : "Inactive"}</td>
                <td>
                  <Link
                    to={`/dashboard/edit_employee/` + e.id}
                    className="btn btn-info btn-sm me-2"
                  >
                    Edit
                  </Link>
                  <button
                    className="btn btn-warning btn-sm"
                    onClick={() => handleDelete(e.id)}
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Employee;
