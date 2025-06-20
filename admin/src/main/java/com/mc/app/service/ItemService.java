package com.mc.app.service;

import com.mc.app.dto.Item;
import com.mc.app.frame.MCService;
import com.mc.app.repository.ItemRepository;
import com.mc.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements MCService<Item, Integer> {

  private final ItemRepository itemRepository;

  @Value("${app.dir.uploadimgdir}")
  private String uploadDir;

  @Override
  public void add(Item item) throws Exception {
    itemRepository.insert(item);
  }

  @Override
  public void mod(Item item) throws Exception {
    itemRepository.update(item);
  }

  @Override
  public void del(Integer itemKey) throws Exception {
    Item item = itemRepository.selectOne(itemKey);

    try {
      FileUploadUtil.deleteFile(item.getItemImg1(), uploadDir);
    } catch (Exception e) {
      System.out.println("이미지1 삭제 실패: " + e.getMessage());
    }

    try {
      FileUploadUtil.deleteFile(item.getItemImg2(), uploadDir);
    } catch (Exception e) {
      System.out.println("이미지2 삭제 실패: " + e.getMessage());
    }

    try {
      FileUploadUtil.deleteFile(item.getItemImg3(), uploadDir);
    } catch (Exception e) {
      System.out.println("이미지3 삭제 실패: " + e.getMessage());
    }

    itemRepository.delete(itemKey);
  }

  @Override
  public Item get(Integer itemKey) throws Exception {
    return itemRepository.selectOne(itemKey);
  }

  @Override
  public List<Item> get() throws Exception {
    return itemRepository.select();
  }

  public int getCount() throws Exception {
    return itemRepository.count();
  }

  public List<Item> getTopSellingItems(int limit) throws Exception {
    return itemRepository.selectTopSellingItems(limit);
  }

  public List<Item> getItemsWithLowStock(int threshold) throws Exception {
    return itemRepository.selectItemsWithLowStock(threshold);
  }

  public void updateStatus(Item item) throws Exception {
    itemRepository.updateStatus(item);
  }
}
