// import BookCard from "./BookCard";

import { useQuery } from "@tanstack/react-query";
import BookCard from "./BookCard";

type BookAPIObject = {
	id: number;
	title: string;
	publication_date: string;
	stock: number;
	pages: number;
	edition: number;
	volume: number;
	type: { id: number; text_type: string };
	editorial: { id: number; editorial: string };
};

async function fetchBookData() {
	const request = await fetch("http://localhost:8080/api/texts", {
		method: "GET",
		headers: {
			Accept: "application/json",
			"Content-Type": "application/json",
		},
	});

	if (request.ok === false) throw new Error(`Failed request with \n${request}`);

	return request.json();
}

export default function BookGroup() {
	const { isLoading, isError, data, error } = useQuery({
		queryKey: ["books"],
		queryFn: fetchBookData,
	});

	if (isLoading) return <div>Loading books</div>;

	if (isError) return <div>An unexpected error ocurred: {error.message}</div>;

	const bookCards = data.map((book: BookAPIObject) => (
		<BookCard id={book.id} author="Diego L" publicationDate={book.publication_date} title={book.title}></BookCard>
	));

	return <div className="card-group">{bookCards}</div>;
}
