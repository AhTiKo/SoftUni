CREATE TRIGGER date_status
AFTER DELETE 
ON `messages`
FOR EACH ROW
BEGIN
	INSERT INTO `messages_log` VALUES (OLD.id, OLD.content, OLD.sent_on, OLD.chat_id, OLD.user_id);
END