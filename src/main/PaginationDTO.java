package main;

import java.util.List;

import main.vo.SpaceVO;
import multi.space.vo.Space_searchVO;

public class PaginationDTO {
	public static int pageSize = 10; // �� �������� ���� �Խñ� ����
	public static int paginationSize = 10;  // 10��¥�� ���� ����ִ� ����Ʈ�� ����� �����ٰ��ΰ�.
	
	public PaginationDTO init(String pg, int countAll ) {
		curPagination = ((pg==null || pg.equals(""))? 1 : Integer.parseInt(pg));
		// ���� �������� ���޵Ǵ� ���� ���ų�, ������ ���� ���� �������� ������ �ȵ� ���̱� ������ �⺻�� 1 ����. ���޵Ǵ� ���� ���� ��� ���� ���ڰ� ���� ������.
		
		numPages = ((countAll -1 ) /pageSize ) +1; 
		//�������� ��ü ������ ��ü �� ���� -1 �Ѱ� ���ٰ� 1�� ���ؾ���.
		// ��ü �� ���� -1�� ������ 9���� 10������ ��. 10���� ������ ��� 1~10�������� 1�� �������� ������. 
		/* 9�� �Խñ��� ��� -1�� ���� �ʾƵ� 9�� 10���� ������ �� 0 ������ 9�̱� ������ 1�� �������� ��.
		 * ������ 10���� ��� -1�� ���� ������ 10/10 ���� 1 �������� 0�̱� ������ 2�������� ��. ���� -1�� ���ִ� �̴ϴ�.
		 *  �������� +1�� ���ִ� ������ ������ �� �� ó�� ���� 0�� ������ ������ ���� 1�� ����� �ֱ� ���� +1 ���ִ� ��!
		 */
		
		paginationStart = ((curPagination-1)/paginationSize)*pageSize + 1;
		paginationEnd = paginationStart + paginationSize -1;
		if(numPages<paginationEnd){
			paginationEnd = numPages;
		} 
		// ��ü ������ �������� ���������̼� ������ ���� ũ�� �Խñ��� ���� ���������̼��� ����.
		// ���� ��ü ������ �������� ���� �ֵ��� ���ֱ� ���� ���������̼� ���� ���� ��ü ������ ������ ����.
		return this;
	}
	
	private int curPagination = 1;//���� ������
	private int numPages = 1;//��ü ������ ����
	
	private int paginationStart = 0;  // �ʱ�ȭ
	private int paginationEnd = 0; // �ʱ�ȭ
	
	private boolean hasPrevPagination;
	private boolean hasNextPagination;
	private boolean hasPrevPage;
	private boolean hasNextPage;
	
	public int getCurPagination(){return curPagination;} // ���� ������ ��ȯ���ִ� �޼ҵ�
	public int getPaginationStart(){return paginationStart;} // ���������̼� ��ŸƮ �� ��ȯ
	public int getPaginationEnd(){return paginationEnd;} // ���������̼� ���� �� ��ȯ
	
	public boolean getHasPrevPagination(){return paginationStart != 1;} 
	public boolean getHasNextPagination(){return paginationEnd != numPages;} 
	public boolean getHasPrevPage(){return curPagination != 1;}
	public boolean getHasNextPage(){return curPagination != numPages;}
	
	public int getSkip(){
		return ( curPagination == 1 ) ? 0 : (curPagination -1 ) * paginationSize;
	}
	
}

/*
 * 
 * //���� ùȭ�� ����������
	@RequestMapping("/space_home_iframe.do")
	public ModelAndView space_home_iframe(@ModelAttribute Space_searchVO search,@RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("space_home_iframe");
		List<SpaceVO> list = spaceDAO.find_space_all();
		
		PaginationDTO pz = new PaginationDTO().init(pg, list.size()) ;  // pg���� �ް�, ��ü �� ������ �̾ƿͼ� ���������̼� ����!
		search.setStart_no(pz.getSkip());
		List<SpaceVO> list2 = spaceDAO.search_space(search);
		mnv.addObject("list2", list2);
		mnv.addObject("pz", pz); // ���������̼��� �ɾ��ݴϴ�!
		return mnv;
	}
 */
