package pe.edu.utp.DemoBibMPCH.WebScraperBNP;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class TitleAuthorCode<T, A, C> {
    private T title;
    private A author;
    private C code;

    public TitleAuthorCode(T title, A author, C code) {
        this.author = author;
        this.title = title;
        this.code = code;
    }

}
