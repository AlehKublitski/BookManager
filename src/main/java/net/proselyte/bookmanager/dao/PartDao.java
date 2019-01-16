package net.proselyte.bookmanager.dao;

import net.proselyte.bookmanager.model.Part;

import java.util.List;

public interface PartDao {
    public void addBook(Part part);

    public void updateBook(Part part);

    public void removeBook(int id);

    public Part getBookById(int id);

    public List<Part> listBooks();
}
