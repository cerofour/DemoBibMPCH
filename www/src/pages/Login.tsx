export default function Login() {
	return (
		<>
			<div className="login-form-container">
				<h1>Biblioteca Municipal de Chiclayo</h1>
				<div className="d-flex justify-content-center align-items-start">
					<LoginForm></LoginForm>
					<img
						src="https://semanarioexpresion.com/Presentacion/img/noticias/cl_columnistas//BIBLIOTECA1108.jpg"
						alt=""
					></img>
				</div>
			</div>
		</>
	);
}

function LoginForm() {
	return (
		<form className="login-form">
			<FormInput
				title="Documento de Identidad"
				type="text"
				id="inputEmail"
				placeholder="DNI o CE"
				helpText="Tus datos personales no se compartirán con nadie"
			></FormInput>

			<FormInput
				title="Contraseña"
				id="inputPassword"
				type="password"
				placeholder="Contraseña"
				helpText="Elige una contraseña segura"
			></FormInput>

			<div className="form-check">
				<input type="checkbox" className="form-check-input" id="exampleCheck1"></input>
				<label className="form-check-label" html-for="exampleCheck1">
					Recuérdame
				</label>
			</div>
			<a href="catalogo">
				<button type="submit" className="btn btn-primary">
					Ingresar
				</button>
			</a>
		</form>
	);
}

type FormInputProps = {
	title: string;
	id: string;
	type: string;
	placeholder: string;
	helpText: string | null;
};

function FormInput(props: FormInputProps) {
	const helpTagId = props.id + "help";

	return (
		<div className="form-group">
			<label html-for={props.id}>{props.title}</label>
			<input
				type={props.type}
				className="form-control"
				id={props.id}
				aria-describedby={helpTagId}
				placeholder={props.placeholder}
			></input>
			<small id={helpTagId} className="form-text text-muted">
				{props.helpText}
			</small>
		</div>
	);
}
