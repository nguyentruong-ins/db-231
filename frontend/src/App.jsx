import 'bootstrap/dist/css/bootstrap.min.css'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import './App.css'
import AddEmployee from './Components/AddEmployee'
import Dashboard from './Components/Dashboard'
import EditEmployee from './Components/EditEmployee'
import Employee from './Components/Employee'
import EmployeeDetail from './Components/EmployeeDetail'
import EmployeeLogin from './Components/EmployeeLogin'
import Home from './Components/Home'
import Login from './Components/Login'
import Start from './Components/Start'
import PrivateRoute from './Components/PrivateRoute'
import Store from './Components/Store'
import StoreDetail from './Components/StoreDetail'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Start />}></Route>
        <Route path='/admin_login' element={<Login />}></Route>
        <Route path='/employee_login' element={<EmployeeLogin />}></Route>
        <Route path='/employee_detail/:username' element={<EmployeeDetail />}></Route>
        <Route path='/dashboard' element={
          <PrivateRoute>
            <Dashboard />
          </PrivateRoute>
        }>
          <Route path='' element={<Home />}></Route>
          <Route path='/dashboard/employee' element={<Employee />}></Route>
          <Route path='/dashboard/add_employee' element={<AddEmployee />}></Route>
          <Route path='/dashboard/edit_employee/:username' element={<EditEmployee />}></Route>
          <Route path='/dashboard/store' element={<Store />}></Route>
          <Route path='/dashboard/store_detail/:id' element={<StoreDetail />}></Route>
        </Route>
      </Routes>
    </BrowserRouter>
  )
}

export default App
