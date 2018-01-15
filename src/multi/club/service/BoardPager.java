package multi.club.service;

public class BoardPager {
	
	//�������� �Խù� ��
	public static final int PAGE_SCALE=10;
	//ȭ��� ������ ��
	public static final int BLOCK_SCALE=10;
	
	private int curPage; // ���� ��������
	private int prevPage; // ���� ������
	private int nextPage; // ���� ������
	private int totPage; // ��ü ������ ����
	private int totBlock; // ��ü ������ ��� ����
	private int curBlock; // ���� ������ ���
	private int prevBlock; // ���� ������ ���
	private int nextBlock; // ���� ������ ���
	// Limit #{start}
	private int pageBegin; // #{start}
	private int blockBegin; // ���� ������ ����� ���� ��ȣ
	private int blockEnd; // ���� ������ ����� �� ��ȣ
	
	//������
	public BoardPager(int count, int curPage) {
		curBlock=1; // ���� ������ ��� ��ȣ
		this.curPage=curPage; // ���� ������ ����
		setTotPage((int)Math.ceil(count/PAGE_SCALE)+1);
		setPageRange();
		setTotBlock(); //��ü ������ ��� ���� ���
		setBlockRange(count); // ������ ����� ����, �� ��ȣ ���
	}

	public void setBlockRange(int count){
		// *���� �������� ���° ������ ��Ͽ� ���ϴ��� ���
        curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
        
        // *���� ������ ����� ����, �� ��ȣ ���
        blockBegin = (curBlock-1)*BLOCK_SCALE+1;
        
        // ������ ����� ����ȣ
        blockEnd = blockBegin+BLOCK_SCALE-1;

        // *������ ����� ������ �ʰ����� �ʵ��� ���
        if(blockEnd > totPage) 
        	blockEnd = totPage;
        // *������ ������ �� �̵��� ������ ��ȣ
        prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
        // *������ ������ �� �̵��� ������ ��ȣ
        nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
        // ������ �������� ������ �ʰ����� �ʵ��� ó��
        if(nextPage >= totPage) nextPage = totPage;
	}
	
	 public void setPageRange(){
    // Limit #{start}, #{end}
        // ���۹�ȣ = (����������-1)*�������� �Խù��� +1
        pageBegin = (curPage-1)*PAGE_SCALE;
    }
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		// ��ü ������ ���� / 10
        // 91 / 10 => 9.1 => 10��
        totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}
}
