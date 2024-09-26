package pe.edu.utp.DemoBibMPCH.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.utp.DemoBibMPCH.models.TextResource;

@Repository
public interface TextDAO extends JpaRepository<TextResource, Long> {
}
