import MyNavbar from "../components/Navbar";

import { Outlet } from "react-router-dom";

function Layout() {
	return (
		<>
			<MyNavbar></MyNavbar>

			<div className="main-container">
				<Outlet></Outlet>
			</div>
		</>
	);
}
export default Layout;
