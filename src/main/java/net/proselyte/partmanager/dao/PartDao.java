package net.proselyte.partmanager.dao;

import net.proselyte.partmanager.model.Part;

import java.util.List;

public interface PartDao {
    public void addPart(Part part);

    public void updatePart(Part part);

    public void removePart(int id);

    public Part getPartById(int id);

    public List<Part> listBooks();
}
