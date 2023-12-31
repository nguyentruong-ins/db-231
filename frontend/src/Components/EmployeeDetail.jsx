import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { convertDataToInput } from '../utils';


const EmployeeDetail = () => {
    const [employee, setEmployee] = useState({});
    const { username } = useParams()
    const navigate = useNavigate()
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

    const handleLogout = () => {
        axios.get('http://localhost:3000/auth/logout')
            .then(result => {
                if (result.data.Status) {
                    localStorage.removeItem("valid")
                    navigate('/')
                }
            }).catch(err => console.log(err))
    }
    return (
        <div>
            <div className="p-3 d-flex justify-content-center shadow">
                <h4 className='m-0'>Employee Details</h4>
            </div>
            <div className='d-flex justify-content-center flex-column align-items-center mt-3'>
                {!employee.status && (
                    <h3 className='m-5'>Sorry, your account is inactive</h3>
                )}
                {!!employee.status && (
                    <>
                        <div className='d-flex justify-content-evenly w-100 gap-4 m-5'>
                            <div>
                                <div className='d-flex'>
                                    <h3>First Name: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.first_name}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Last Name: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.last_name}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>SSN: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.ssn}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Address: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.address}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Date of Birth: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.dob}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Gender: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.sex}</h3>
                                </div>
                            </div>

                            <div>
                                <div className='d-flex'>
                                    <h3>Username: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.username}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Start Date: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.started_date}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Salary: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.salary}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Type: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.employee_type}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Account type: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.account_type}</h3>
                                </div>
                                <div className='d-flex'>
                                    <h3>Store: {' '}</h3>
                                    <h3 className='employeeInfo'>{employee.store_id}</h3>
                                </div>
                            </div>
                        </div>
                    </>
                )}
                <div>
                    {/* <button className='btn btn-primary me-2'>Edit</button> */}
                    <button className='btn btn-danger' onClick={handleLogout}>Logout</button>
                </div>
            </div>
        </div>
    )
}

export default EmployeeDetail