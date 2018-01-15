package multi.mypage.message.dao;

import java.util.List;

import main.vo.MessageVO;

public interface MessageDAO {

	public List<MessageVO> find_receiveMessage(String user_id);
	public MessageVO read_receiveMessage(MessageVO mvo);
	public List<MessageVO> find_sendMessage(String user_id);
	public MessageVO read_sendMessage(MessageVO mvo);
	public int send_Message(MessageVO pvo);

}
