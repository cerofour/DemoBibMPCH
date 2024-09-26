package pe.edu.utp.BibChiclayo.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.utp.BibChiclayo.models.TextResource;

@Repository
public interface TextDAO extends JpaRepository<TextResource, Long> {
}
