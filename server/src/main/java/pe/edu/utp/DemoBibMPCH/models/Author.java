package pe.edu.utp.DemoBibMPCH.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "autores")
@ToString
@EqualsAndHashCode
@Getter
@Setter
public class Author {
    @Id
    @Column(name = "id_autor")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nombre")
    private String name;

    @Column(name = "apellido_paterno")
    private String pLastName;

    @Column(name = "apellido_materno")
    private String mLastName;

    @Column(name = "seudonimo")
    private String alias;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "writtenBy")
    @JsonIgnoreProperties("textResources")
    private Set<TextResource> writes = new HashSet<>();

    public Author() {
    }
}
