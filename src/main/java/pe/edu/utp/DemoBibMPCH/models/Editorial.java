package pe.edu.utp.BibChiclayo.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "editoriales")
@ToString
@EqualsAndHashCode
public class Editorial {

	@Id
	@Column(name = "id_editorial")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Getter
	@Setter
	private Long id;

	@Column(name = "nombre")
	@Setter
	@Getter
	private String editorial;

	//@OneToMany(mappedBy = "text_resource", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	//private Set<TextResource> textsEdited = new HashSet<>();

	public Editorial() {
	}
}