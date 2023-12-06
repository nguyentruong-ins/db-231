import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { convertDatetimeData2Input, convertDatetimeInput2Data } from '../utils'

const EditEmployee = () => {
  const { id } = useParams()
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
  const navigate = useNavigate();

  useEffect(() => {
    axios.get('/sample_data/employee_accounts.json')
      .then(result => {
        setEmployee(
          result.data["SELECT * FROM employee_accounts;\n"][id]
        );
      })
      .catch(err => console.log(err))
  }, [])

  const handleSubmit = (e) => {
    e.preventDefault()
    axios.put('http://localhost:3000/auth/edit_employee/' + id, employee)
      .then(result => {
        if (result.data.Status) {
          navigate('/dashboard/employee')
        } else {
          alert(result.data.Error)
        }
      }).catch(err => console.log(err))
  }

  return (
    <div className="d-flex justify-content-center align-items-center mt-3">
      <div className="p-3 rounded w-75 border">
        <h3 className="text-center">Edit Employee</h3>
        <form onSubmit={handleSubmit} className="row g-1">
          <div className="col-6 p-2">
            <label for="inputName" className="form-label">
              Username
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputName"
              value={employee.username}
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
              value={employee.salary}
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
              value={employee.address}
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
              value={convertDatetimeData2Input(employee.dob)}
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, dob: convertDatetimeInput2Data(e.target.value) })
              }
            />
            <label for="account_type" className="form-label">
              Account type
            </label>
            <select
              name="account_type"
              id="account_type"
              value={employee.account_type}
              className="form-select"
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
              value={employee.store_id}
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
              value={employee.first_name}
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
              value={employee.last_name}
              onChange={(e) =>
                setEmployee({ ...employee, last_name: e.target.value })
              }
            />
            <label for="sex" className="form-label">
              Sex
            </label>
            <select
              name="account_type"
              id="sex"
              className="form-select"
              value={employee.sex}
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
              value={convertDatetimeData2Input(employee.started_date)}
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, started_date: convertDatetimeInput2Data(e.target.value) })
              }
            />
            <label for="inputSSN" className="form-label">
              SSN
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputSSN"
              value={employee.ssn}
              placeholder="Enter SSN"
              onChange={(e) =>
                setEmployee({ ...employee, ssn: e.target.value })
              }
            />
            <label for="e_type" className="form-label">
              Type
            </label>
            <select
              name="employee_type"
              id="e_type"
              className="form-select"
              value={employee.employee_type}
              onChange={(e) => setEmployee({ ...employee, employee_type: e.target.value })}
            >
              <option value="">Select ...</option>
              <option value="PARTTIME">Part time</option>
              <option value="FULLTIME">Full time</option>
            </select>
          </div>

          <div className="col-12 mt-3 d-flex justify-content-center">
            <button type="submit" className="btn btn-primary w-50">
              Edit Employee
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}

export default EditEmployee