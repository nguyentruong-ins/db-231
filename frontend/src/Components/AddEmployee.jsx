import axios from "axios";
import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const AddEmployee = () => {
  const [employee, setEmployee] = useState({
    id: 0,
    username: "",
    salary: "0.0",
    address: "",
    dob: "",
    account_type: "",
    last_name: "",
    first_name: "",
    sex: "",
    started_date: "",
    ssn: "",
    employee_type: "",
    store_id: 0,
    status: 0
  });
  const [category, setCategory] = useState([]);
  const navigate = useNavigate();
  // useEffect(() => {
  //   axios
  //     .get("http://localhost:3000/auth/category")
  //     .then((result) => {
  //       if (result.data.Status) {
  //         setCategory(result.data.Result);
  //       } else {
  //         alert(result.data.Error);
  //       }
  //     })
  //     .catch((err) => console.log(err));
  // }, []);

  const handleSubmit = (e) => {
    e.preventDefault()
    const formData = new FormData();

    formData.append('username', employee.username);
    formData.append('salary', employee.salary);
    formData.append('address', employee.address);
    formData.append('dob', employee.dob);
    formData.append('account_type', employee.account_type);
    formData.append('last_name', employee.last_name);
    formData.append('first_name', employee.first_name);
    formData.append('sex', employee.sex);
    formData.append('started_date', employee.started_date);
    formData.append('ssn', employee.ssn);
    formData.append('employee_type', employee.employee_type);
    formData.append('store_id', employee.store_id);

    axios.post('http://localhost:3000/auth/add_employee', formData)
      .then(result => {
        if (result.data.Status) {
          navigate('/dashboard/employee')
        } else {
          alert(result.data.Error)
        }
      })
      .catch(err => console.log(err))
  }

  return (
    <div className="d-flex justify-content-center align-items-center mt-3">
      <div className="p-3 rounded w-75 border">
        <h3 className="text-center">Add Employee</h3>
        <form className="row g-1" onSubmit={handleSubmit}>
          <div className="col-6 p-2">
            <label for="inputName" className="form-label">
              Username
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputName"
              placeholder="Enter Username"
              onChange={(e) =>
                setEmployee({ ...employee, username: e.target.value })
              }
            />
            <label for="inputSalary" className="form-label">
              Salary
            </label>
            <input
              type="number"
              className="form-control rounded-0"
              id="inputSalary"
              placeholder="Enter Salary"
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, salary: e.target.value })
              }
            />
            <label for="inputAddress" className="form-label">
              Address
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputAddress"
              placeholder="1234 Main St"
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, address: e.target.value })
              }
            />
            <label for="inputDob" className="form-label">
              Date of birth
            </label>
            <input
              type="datetime-local"
              className="form-control rounded-0"
              id="inputDob"
              placeholder="Enter Date of birth"
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, dob: e.target.value })
              }
            />
            <label for="account_type" className="form-label">
              Account type
            </label>
            <select name="account_type" id="account_type" className="form-select"
              onChange={(e) => setEmployee({ ...employee, account_type: e.target.value })}
            >
              <option value="">Select ...</option>
              <option value="SHIPPER">SHIPPER</option>
              <option value="MANAGER">MANAGER</option>
              <option value="EMPLOYEE">EMPLOYEE</option>
            </select>
            <label for="inputStore" className="form-label">
              Store Id
            </label>
            <input
              type="number"
              className="form-control rounded-0"
              id="inputStore"
              placeholder="Enter Store Id"
              onChange={(e) =>
                setEmployee({ ...employee, store_id: e.target.value })
              }
            />
          </div>

          <div className="col-6 p-2">
            <label for="inputFName" className="form-label">
              First name
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputFName"
              placeholder="Enter First name"
              onChange={(e) =>
                setEmployee({ ...employee, first_name: e.target.value })
              }
            />
            <label for="inputLName" className="form-label">
              Last name
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputLName"
              placeholder="Enter Last name"
              onChange={(e) =>
                setEmployee({ ...employee, last_name: e.target.value })
              }
            />
            <label for="sex" className="form-label">
              Sex
            </label>
            <select name="account_type" id="sex" className="form-select"
              onChange={(e) => setEmployee({ ...employee, sex: e.target.value })}
            >
              <option value="">Select ...</option>
              <option value="MALE">MALE</option>
              <option value="FEMALE">FEMALE</option>
            </select>
            <label for="startDate" className="form-label">
              Start date
            </label>
            <input
              type="datetime-local"
              className="form-control rounded-0"
              id="startDate"
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, started_date: e.target.value })
              }
            />
            <label for="inputSSN" className="form-label">
              SSN
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputSSN"
              placeholder="Enter SSN"
              onChange={(e) =>
                setEmployee({ ...employee, ssn: e.target.value })
              }
            />
            <label for="e_type" className="form-label">
              Type
            </label>
            <select name="employee_type" id="e_type" className="form-select"
              onChange={(e) => setEmployee({ ...employee, employee_type: e.target.value })}
            >
              <option value="">Select ...</option>
              <option value="PARTTIME">Part time</option>
              <option value="FULLTIME">Full time</option>
            </select>
          </div>

          {/* <div className="col-12 mb-3">
            <label className="form-label" for="inputGroupFile01">
              Select Image
            </label>
            <input
              type="file"
              className="form-control rounded-0"
              id="inputGroupFile01"
              name="image"
              onChange={(e) => setEmployee({ ...employee, image: e.target.files[0] })}
            />
          </div> */}
          <div className="col-12 mt-3 d-flex justify-content-center">
            <button type="submit" className="btn btn-success w-50">
              Add Employee
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default AddEmployee;
