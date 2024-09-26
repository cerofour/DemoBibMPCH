import { Card, ListGroup, Button } from "react-bootstrap";
import { Link } from "react-router-dom";

type BookCardProps = {
	id: number;
	author: string;
	publicationDate: string;
	title: string;
};

export default function BookCard(props: BookCardProps) {
	return (
		<Card style={{ width: "18rem" }}>
			<Card.Img variant="top" src="https://placehold.co/400" />
			<Card.Body>
				<Card.Title>{props.title}</Card.Title>
			</Card.Body>
			<ListGroup className="list-group-flush">
				<ListGroup.Item>{props.author}</ListGroup.Item>
				<ListGroup.Item>{props.publicationDate}</ListGroup.Item>
			</ListGroup>
			<Card.Body>
				<Link to="/catalogo/1">
					<Button variant="primary">Más información</Button>
				</Link>
			</Card.Body>
		</Card>
	);
}
