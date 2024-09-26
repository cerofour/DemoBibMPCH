package pe.edu.utp.BibChiclayo.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Entity
@Table(name = "recursos_textuales")
@ToString
@EqualsAndHashCode
public class TextResource {

    @Id
    @Column(name = "id_recurso_textual")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private Long id;

    @Column(name = "titulo")
    @Setter
    @Getter
    private String title;

    @Column(name = "fecha_publicacion")
    @Setter
    @Getter
    private Date publication_date;

    @Column(name = "stock")
    @Setter
    @Getter
    private Long stock;

    @Column(name = "numero_paginas")
    @Setter
    @Getter
    private Long pages;

    @Column(name = "edicion")
    @Setter
    @Getter
    private Short edition;

    @Column(name = "volumen")
    @Setter
    @Getter
    private Short volume;

    //@Column(name = "editorial_id")
    //@Setter
    //@Getter
    //private Long editorial_id;

    /*
    @Column(name = "tipo_texto_id")
    @Setter
    @Getter
    private Long type_id;
     */

    @Setter
    @Getter
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "tipo_texto_id")
    @JsonManagedReference
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private TextResourceType type;

    @Setter
    @Getter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "editorial_id")
    @JsonManagedReference
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Editorial editorial;

    public TextResource() {
    }
}