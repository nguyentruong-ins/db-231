import axios from 'axios'
import React, { useEffect, useState } from 'react'

const Home = () => {
  const [customerTotal, setCustomerTotal] = useState(0)
  const [employeeTotal, setemployeeTotal] = useState(0)

  const [top, setTop] = useState(10);

  const now = new Date();
  const currDate = (new Date(now.getTime())).toISOString().slice(0, 10);
  const prevDate = (new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)).toISOString().slice(0, 10);

  const [fromDate, setFromDate] = useState(prevDate);
  const [toDate, setToDate] = useState(currDate);

  const [customers, setCustomers] = useState([])
  useEffect(() => {
    axios.get('/sample_data/top_customers.json')
      .then(result => {
        setCustomers(
          result.data["EXEC GetTopCustomersWithLargestOrders '2023-01-01', '2023-12-31', 10;"]
        );
      })
      .catch(err => console.log(err))
  }, [])

  const [employees, setEmployees] = useState([])
  useEffect(() => {
    axios.get('/sample_data/top_employees.json')
      .then(result => {
        setEmployees(
          result.data["EXEC GetTopSellingEmployees '2023-01-01', '2023-12-31', 10;"]
        );
      })
      .catch(err => console.log(err))
  }, [])

  console.log({
    from_date: fromDate,
    to_date: toDate,
    top: top,
  });

  // useEffect(() => {
  //   customerCount();
  //   employeeCount();
  //   salaryCount();
  //   customerRecords();
  // }, [])

  const customerRecords = () => {
    axios.get('http://localhost:3000/auth/customer_records')
      .then(result => {
        if (result.data.Status) {
          setCustomers(result.data.Result)
        } else {
          alert(result.data.Error)
        }
      })
  }
  const customerCount = () => {
    axios.get('http://localhost:3000/auth/customer_count')
      .then(result => {
        if (result.data.Status) {
          setCustomerTotal(result.data.Result[0].customer)
        }
      })
  }
  const employeeCount = () => {
    axios.get('http://localhost:3000/auth/employee_count')
      .then(result => {
        if (result.data.Status) {
          setemployeeTotal(result.data.Result[0].employee)
        }
      })
  }
  const salaryCount = () => {
    axios.get('http://localhost:3000/auth/salary_count')
      .then(result => {
        if (result.data.Status) {
          setSalaryTotal(result.data.Result[0].salaryOFEmp)
        } else {
          alert(result.data.Error)
        }
      })
  }
  return (
    <div>
      <div className='pt-0 p-5 d-flex justify-content-around m-5 border-bottom'>
        <div className='px-3 pt-2 pb-3 border shadow-sm w-25'>
          <div className='text-center pb-1'>
            <h4>Customers</h4>
          </div>
          <hr />
          <div className='d-flex justify-content-between'>
            <h5>Total:</h5>
            <h5>{customerTotal}</h5>
          </div>
        </div>
        <div className='px-3 pt-2 pb-3 border shadow-sm w-25'>
          <div className='text-center pb-1'>
            <h4>Employees</h4>
          </div>
          <hr />
          <div className='d-flex justify-content-between'>
            <h5>Total:</h5>
            <h5>{employeeTotal}</h5>
          </div>
        </div>
      </div>
      <div className="d-flex align-items-center justify-content-between mx-5 my-2">
        <div className='d-flex gap-3'>
          <h6 className='m-0'>Display Top:</h6>
          <input
            type="number"
            className="form-control rounded-0"
            value={top}
            autoComplete='off'
            onChange={(e) => setTop(e.target.value)}
          />
        </div>
        <div className='d-flex align-items-center gap-2'>
          <label for="fromDate" className="form-label m-0">
            <h6 className='m-0'>From</h6>
          </label>
          <input
            type="date"
            className="form-control rounded-0"
            id="fromDate"
            value={fromDate}
            autoComplete="off"
            onChange={(e) => setFromDate(e.target.value)}
          />

          <label for="toDate" className="form-label m-0">
            <h6 className='m-0'>To</h6>
          </label>
          <input
            type="date"
            className="form-control rounded-0"
            id="toDate"
            value={toDate}
            autoComplete="off"
            onChange={(e) => setToDate(e.target.value)}
          />
        </div>
      </div>
      <div className='my-4 px-5 pt-3'>
        <div className=" mb-3">
          <h3 className='m-0'>Top customers with largest orders</h3>
        </div>
        <table className='table striped-table'>
          <thead>
            <tr>
              <th>Customer Id</th>
              <th>First name</th>
              <th>Last name</th>
              <th>Phone number</th>
              <th>Total amount</th>
            </tr>
          </thead>
          <tbody>
            {!!customers.length &&
              customers.map(a => (
                <tr>
                  <td>{a.customer_id}</td>
                  <td>{a.first_name}</td>
                  <td>{a.last_name}</td>
                  <td>{a.phone_number}</td>
                  <td>{a.total_order_amount}</td>
                </tr>
              ))
            }
            {!customers.length && (
              <tr>
                <td colspan="5" style={{ textAlign: 'center' }}>There are no customer orders in this time</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      <div className='my-4 px-5 pt-3'>
        <h3 className='m-0 mb-3'>Top employees with best selling</h3>
        <table className='table striped-table'>
          <thead>
            <tr>
              <th>Employee Id</th>
              <th>First name</th>
              <th>Last name</th>
              <th>Username</th>
              <th>Total sales</th>
            </tr>
          </thead>
          <tbody>
            {!!employees.length &&
              employees.map(a => (
                <tr>
                  <td>{a.employee_id}</td>
                  <td>{a.first_name}</td>
                  <td>{a.last_name}</td>
                  <td>{a.username}</td>
                  <td>{a.total_sales}</td>
                </tr>
              ))
            }
            {!employees.length && (
              <tr>
                <td colspan="5" style={{ textAlign: 'center' }}>There are no employee sales in this time</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  )
}

export default Home