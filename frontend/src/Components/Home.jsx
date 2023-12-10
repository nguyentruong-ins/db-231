import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { convertDataToInput, convertDataToTime } from '../utils';
import ReactModal from 'react-modal';
ReactModal.setAppElement('#root');

const Home = () => {
  const now = new Date();
  const currDate = (new Date(now.getTime())).toISOString().slice(0, 10);
  const prevDate = (new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)).toISOString().slice(0, 10);

  const [top, setTop] = useState(0);
  const [fromDate, setFromDate] = useState("");
  const [toDate, setToDate] = useState("");
  const payload = {
    from_date: fromDate,
    to_date: toDate,
    top: top,
  }
  const [customers, setCustomers] = useState([]);
  const handleApply = async () => {
    await axios.post('http://localhost:4000/api/admin/top-n-vip-customers', payload)
      .then(result => {
        setCustomers(result.data.message);
      })
      .catch(err => console.log(err))
  }

  const [top2, setTop2] = useState(0);
  const [fromDate2, setFromDate2] = useState("");
  const [toDate2, setToDate2] = useState("");
  const payload2 = {
    from_date: fromDate2,
    to_date: toDate2,
    top: top2,
  }
  const [shifts, setShifts] = useState([]);
  const handleApply2 = async () => {
    await axios.post('http://localhost:4000/api/admin/top-n-selling-shifts', payload2)
      .then(result => {
        setShifts(result.data.message);
      })
      .catch(err => console.log(err))
  }

  useEffect(() => {
    localStorage.setItem("top", 5);
    localStorage.setItem("from", prevDate);
    localStorage.setItem("to", currDate);

    setTop(localStorage.getItem("top"));
    setFromDate(localStorage.getItem("from"));
    setToDate(localStorage.getItem("to"));
    setTop2(localStorage.getItem("top"));
    setFromDate2(localStorage.getItem("from"));
    setToDate2(localStorage.getItem("to"));
    setFromDate3(localStorage.getItem("from"));
    setToDate3(localStorage.getItem("to"));
  }, []);

  const [isOpenModal, setIsOpenModal] = useState(false);
  const [shiftEmployees, setShiftEmployees] = useState([]);

  const closeModal = () => {
    setIsOpenModal(false);
  }

  const openModal = async (shift_id) => {
    setIsOpenModal(true);
    await axios.post('http://localhost:4000/api/admin/employees-in-shift', { shift_id })
      .then(result => {
        const employeesData = result.data.message;
        console.log(employeesData);
        setShiftEmployees(employeesData);
      })
      .catch(err => console.log(err))
  }

  const [bestSellers, setBestSellers] = useState({});
  const [fromDate3, setFromDate3] = useState("");
  const [toDate3, setToDate3] = useState("");
  const payload3 = {
    from_date: fromDate3,
    to_date: toDate3,
  }

  const handleApply3 = async () => {
    await axios.post('http://localhost:4000/api/admin/best-seller', payload3)
      .then(result => {
        const bestSellersData = result.data.message;
        console.log(bestSellersData);
        setBestSellers(bestSellersData[0]);
      })
      .catch(err => console.log(err))
  };

  return (
    <>
      <div className='mt-5'>
        <div className="d-flex align-items-center justify-content-between mx-5 mb-3">
          <div className="btn btn-primary" onClick={handleApply3}>Apply</div>
          <div className="d-flex gap-3">
            <div className='d-flex align-items-center gap-2'>
              <label for="fromDate" className="form-label m-0">
                <h6 className='m-0'>From</h6>
              </label>
              <input
                type="date"
                className="form-control rounded-0"
                id="fromDate"
                value={fromDate3}
                autoComplete="off"
                onChange={(e) => setFromDate3(e.target.value)}
              />

              <label for="toDate" className="form-label m-0">
                <h6 className='m-0'>To</h6>
              </label>
              <input
                type="date"
                className="form-control rounded-0"
                id="toDate"
                value={toDate3}
                autoComplete="off"
                onChange={(e) => setToDate3(e.target.value)}
              />
            </div>
          </div>
        </div>
        <div className='my-4 mx-5 pb-3 border-bottom'>
          <h3 className="m-0">Best seller</h3>
          {bestSellers && (
            <table className='table striped-table w-50'>
              <thead>
                <tr>
                  <th></th>
                  <th>Online</th>
                  <th>At table</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><b>Best item</b></td>
                  <td>{bestSellers.best_seller_online}</td>
                  <td>{bestSellers.best_seller_at_table}</td>
                </tr>
                <tr>
                  <td><b>Order times</b></td>
                  <td>{bestSellers.online_order_time}</td>
                  <td>{bestSellers.at_table_order_time}</td>
                </tr>
              </tbody>
            </table>
          )}
        </div>


        <div className="d-flex align-items-center justify-content-between mx-5 my-2">
          <div className="btn btn-primary" onClick={handleApply}>Apply</div>
          <div className="d-flex gap-3">
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

        <div className="d-flex align-items-center justify-content-between mx-5 my-2 pt-4 border-top">
          <div className="btn btn-primary" onClick={handleApply2}>Apply</div>
          <div className="d-flex gap-3">
            <div className='d-flex gap-3'>
              <h6 className='m-0'>Display Top:</h6>
              <input
                type="number"
                className="form-control rounded-0"
                value={top2}
                autoComplete='off'
                onChange={(e) => setTop2(e.target.value)}
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
                value={fromDate2}
                autoComplete="off"
                onChange={(e) => setFromDate2(e.target.value)}
              />

              <label for="toDate" className="form-label m-0">
                <h6 className='m-0'>To</h6>
              </label>
              <input
                type="date"
                className="form-control rounded-0"
                id="toDate"
                value={toDate2}
                autoComplete="off"
                onChange={(e) => setToDate2(e.target.value)}
              />
            </div>
          </div>
        </div>
        <div className='my-4 px-5 pt-3'>
          <h3 className='m-0 mb-3'>Top selling shifts</h3>
          <table className='table striped-table'>
            <thead>
              <tr>
                <th>Shift id</th>
                <th>Started at</th>
                <th>Ended at</th>
                <th>Day</th>
                <th>Total sales</th>
              </tr>
            </thead>
            <tbody>
              {shifts.map(a => (
                <tr>
                  <td>{a.id}</td>
                  <td>{convertDataToTime(a.started_at)}</td>
                  <td>{convertDataToTime(a.ended_at)}</td>
                  <td>{a.month + "/" + a.day + "/" + a.year}</td>
                  <td>{a.total_sales}</td>
                  <td>
                    <button
                      onClick={() => {
                        openModal(a.id);
                      }}
                      className="btn btn-info btn-sm me-2"
                    >
                      Detail
                    </button>
                  </td>
                </tr>
              ))
              }
              {!shifts.length && (
                <tr>
                  <td colspan="5" style={{ textAlign: 'center' }}>There are no sales in this time</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
      <ReactModal
        isOpen={isOpenModal}
        onRequestClose={closeModal}
        className="modal-content"
      >
        <div className='my-4 px-5 pt-3'>
          <div className=" mb-3">
            <div className="d-flex justify-content-between align-items-center">
              <h3 className='m-0'>Employees in shift</h3>
              <i className='bi-x-circle fs-4' onClick={closeModal}></i>
            </div>
          </div>
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
              </tr>
            </thead>
            <tbody>
              {shiftEmployees.map((e) => {
                return (
                  <tr key={e.id}>
                    <td>{e.username}</td>
                    <td>{e.first_name + " " + e.last_name}</td>
                    <td>{parseInt(e.salary)}</td>
                    <td>{e.account_type}</td>
                    <td>{e.employee_type}</td>
                    <td>{e.store_id}</td>
                    <td>{convertDataToInput(e.started_date)}</td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      </ReactModal>
    </>
  )
}

export default Home;