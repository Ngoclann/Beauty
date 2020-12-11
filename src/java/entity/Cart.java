/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;

/**
 *
 * @author Ngọc Lan
 */
public class Cart {
    private User user;
    private List<Item> items;

    
    public Cart() {
    }


    public Cart(User user, List<Item> items) {
        this.user = user;
        this.items = items;
    }


    public void setUser(User user) {
        this.user = user;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }


    public User getUser() {
        return user;
    }

    public List<Item> getItems() {
//        ProductDAO pdb = new ProductDAO();
//        Product p = pdb.getProductbyID("alb001");
//        items.add(new Item(p, 1, p.getPrice()));
        return items;
    }
    
    
    public Item getItembyId(String id){
        for(Item i : items){
            if(i.getProduct().getPid()==id){
                return i;
            }
        }
        return null;
    }
    public void removeItem(Item i){
        if(getItembyId(i.getProduct().getPid())!=null){
            items.remove(getItembyId(i.getProduct().getPid()));
        }
    }
    
    
    
    
    
}
