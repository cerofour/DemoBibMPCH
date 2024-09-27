package pe.edu.utp.DemoBibMPCH.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.utp.DemoBibMPCH.models.Author;
import pe.edu.utp.DemoBibMPCH.models.TextResource;

@Repository
public interface AuthorDAO extends JpaRepository<Author, Long> {
}
