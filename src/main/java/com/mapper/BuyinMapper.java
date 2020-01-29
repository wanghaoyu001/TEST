package com.mapper;

import java.util.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.pojo.*;

@Service("BuyinMapper")
public interface BuyinMapper {
	//�ɹ�������¼����
	public int save(@Param("buyin") BuyIn buyin, @Param("productInfo") ProductInfo productInfo);
	//�ɹ�������¼����
	public int update(@Param("buyin") BuyIn buyin, @Param("productInfo") ProductInfo productInfo, @Param("BuyinProductId") String BuyinProductId);
	//���ݲ�ƷIDɾ��
	public int delById(@Param("ProductId") String ProductId);

	//�����ۺ�
	public List<BuyInSearch> find(Map<String, Object> param);

	// ��ȡ�ɹ�������Ϣ������
	public int getTotalCount();
	
	 //���ģ����ѯ��������
	public List<BuyInSearch> findByproductName(String productName);
}
