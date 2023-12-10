import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { convertDataToInput, convertInputToData } from '../utils'

const EditEmployee = () => {
  const { username } = useParams();
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
    status: 0,
    numbers: [],
    password: ""
  });

  const [error, setError] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    axios.post('http://localhost:4000/api/admin/employee', { username })
      .then(result => {
        const employeeData = result.data.message;
        setEmployee({
          ...employeeData,
          started_date: convertDataToInput(employeeData.started_date),
          dob: convertDataToInput(employeeData.dob),
        });
      })
      .catch(err => console.log(err))
  }, [])

  const handleAddPhone = (e) => {
    var newNumbers = [...employee.numbers];
    newNumbers.push("0000000000");
    setEmployee({ ...employee, numbers: newNumbers });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = {
      username: employee.username,
      newPassword: employee.password,
      newSalary: employee.salary,
      newDob: convertInputToData(employee.dob),
      newAccountType: employee.account_type,
      newEmployeeType: employee.employee_type,
      newLastName: employee.last_name,
      newFirstName: employee.first_name,
      newSex: employee.sex,
      newNumbers: employee.numbers.filter(element => element !== ''),
      newAddress: employee.address,
      newStartedDate: convertInputToData(employee.started_date),
      newSsn: employee.ssn,
      newStoreId: employee.store_id,
    }

    console.log(formData);
    await axios.post('http://localhost:4000/api/admin/update-employee', formData)
      .then(result => {
        if (result.data.statusCode === 200) {
          navigate('/dashboard/employee');
        } else {
        }
      })
      .catch((e) => {
        console.log(e);
        setError(e.response.data.message);
      })
  }

  return (
    <div className="d-flex justify-content-center align-items-center mt-3">
      <div className="p-3 rounded w-75 border">
        <h3 className="text-center">Edit Employee</h3>
        <h5 className='ms-2'>Username: {employee.username}</h5>
        <form onSubmit={handleSubmit} className="row g-1">
          {/* <div className="col-12 d-flex justify-content-end px-2">
            <div class="form-check form-switch">
              <label class="form-check-label" for="flexSwitchCheckChecked">Active account</label>
              <input
                className="form-check-input"
                type="checkbox"
                role="switch"
                id="flexSwitchCheckChecked"
                checked={employee.status}
                onChange={(e) => {
                  setEmployee({ ...employee, status: !employee.status })
                }

                }
              />
            </div>
          </div> */}
          <div className="col-6 p-2">
            <label for="inputName" className="form-label">
              <span className="mt-0">Password</span>
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputName"
              value={employee.password}
              onChange={(e) =>
                setEmployee({ ...employee, password: e.target.value })
              }
            />
            <label for="account_type" className="form-label">
              Account type
            </label>
            <select
              name="account_type"
              id="account_type"
              className="form-select"
              value={employee.account_type}
              onChange={(e) => setEmployee({ ...employee, account_type: e.target.value })}
            >
              <option value="">Select ...</option>
              <option value="SHIPPER">SHIPPER</option>
              <option value="MANAGER">MANAGER</option>
              <option value="EMPLOYEE">EMPLOYEE</option>
            </select>
            <label for="e_type" className="form-label">
              Employee type
            </label>
            <select
              name="employee_type"
              id="e_type"
              className="form-select"
              value={employee.employee_type}
              onChange={(e) => setEmployee({ ...employee, employee_type: e.target.value })}
            >
              <option value="">Select ...</option>
              <option value="PARTTIME">PARTTIME</option>
              <option value="FULLTIME">FULLTIME</option>
            </select>
            <label for="startDate" className="form-label">
              Start date
            </label>
            <input
              type="date"
              className="form-control rounded-0"
              id="startDate"
              value={employee.started_date}
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, started_date: e.target.value })
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
            <label for="inputSSN" className="form-label">
              SSN
            </label>
            <input
              type="text"
              className="form-control rounded-0"
              id="inputSSN"
              value={employee.ssn}
              onChange={(e) =>
                setEmployee({ ...employee, ssn: e.target.value })
              }
            />
            <label for="inputFName" className="form-label">
              First Name
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
              Last Name
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
              <option value="OTHER">OTHER</option>
            </select>
            <label for="inputDob" className="form-label">
              Date of birth
            </label>
            <input
              type="date"
              className="form-control rounded-0"
              id="inputDob"
              value={employee.dob}
              autoComplete="off"
              onChange={(e) =>
                setEmployee({ ...employee, dob: e.target.value })
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
          </div>
          <div className="border-top mt-3 px-2 py-3">
            <div className="d-flex justify-content-between align-items-center mb-3">
              <div className="form-label">Phone Numbers</div>
              <div className="btn btn-success" onClick={handleAddPhone}>Add</div>
            </div>
            <div style={{ display: "grid", gridTemplateColumns: "auto auto auto auto auto", gridGap: '.5rem' }}>
              {employee.numbers && employee.numbers.map((phone, index) => (
                <input
                  type="search"
                  className="form-control rounded-0"
                  key={index}
                  value={employee.numbers[index]}
                  autoComplete="off"
                  onChange={(e) => {
                    const newNumbers = [...employee.numbers];
                    newNumbers[index] = e.target.value;
                    setEmployee({ ...employee, numbers: newNumbers })
                  }
                  }
                />
              ))}
            </div>
          </div>

          <div className="col-12 d-flex align-items-center justify-content-center flex-column gap-3">
            <div className='text-danger'>
              {error && error}
            </div>
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