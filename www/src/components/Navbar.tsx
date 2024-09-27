import Button from "react-bootstrap/Button";
import Container from "react-bootstrap/Container";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import Offcanvas from "react-bootstrap/Offcanvas";

export default function MyNavbar() {
	const x = (d: string, l: string) => {
		return {
			display: d,
			link: l,
		};
	};

	const navbarTitle = "Biblioteca Municipal de Chiclayo";

	const navbarLinks = [
		//x("Bib. MPCH", "/"),
		x("Catálogo", "catalogo"),
		x("Ayuda", "ayuda"),
	];

	//console.log(navbarLinks);

	const tsxLinks = navbarLinks.map((link, i) => (
		<Nav.Link key={i} href={link.link}>
			{link.display}
		</Nav.Link>
	));

	// ../assets/Escudo_de_Armas_la_Ciudad_de_Chiclayo.png
	return (
		<>
			<Navbar expand="md" className="bg-body-tertiary mb-3">
				<Container fluid>
					<Navbar.Brand href="/">
						<img
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Escudo_de_Armas_la_Ciudad_de_Chiclayo.png/1200px-Escudo_de_Armas_la_Ciudad_de_Chiclayo.png"
							alt="Logo de la Municipalidad Provincial de Chiclayo"
							width={40}
							height={40}
						/>
						{navbarTitle}
					</Navbar.Brand>
					<Navbar.Toggle aria-controls={`offcanvasNavbar-expand-md`} />
					<Navbar.Offcanvas
						id={`offcanvasNavbar-expand-md`}
						aria-labelledby={`offcanvasNavbarLabel-expand-md`}
						placement="end"
					>
						<Offcanvas.Header closeButton>
							<Offcanvas.Title id={`offcanvasNavbarLabel-expand-md`}>{navbarTitle}</Offcanvas.Title>
						</Offcanvas.Header>
						<Offcanvas.Body>
							<Nav className="justify-content-end flex-grow-1 pe-3">{tsxLinks}</Nav>
							<Form className="d-flex">
								<Form.Control
									type="search"
									placeholder="Búsqueda de textos"
									className="me-2"
									aria-label="Search"
								/>
								<Button variant="outline-success">Buscar</Button>
							</Form>
						</Offcanvas.Body>
					</Navbar.Offcanvas>
				</Container>
			</Navbar>
		</>
	);
}
