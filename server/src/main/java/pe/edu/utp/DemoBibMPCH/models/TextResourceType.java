package pe.edu.utp.DemoBibMPCH.models;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "tipos_textos")
@ToString
@EqualsAndHashCode
public class TextResourceType {

	@Id
	@Column(name = "id_tipo_texto")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Getter
	@Setter
	private Long id;

	@Column(name = "tipo_texto")
	@Setter
	@Getter
	private String text_type;

	public TextResourceType() {
	}
}