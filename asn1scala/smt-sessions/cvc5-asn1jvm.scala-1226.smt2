; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34798 () Bool)

(assert start!34798)

(declare-fun b!164620 () Bool)

(declare-fun res!137178 () Bool)

(declare-fun e!113752 () Bool)

(assert (=> b!164620 (=> (not res!137178) (not e!113752))))

(declare-datatypes ((array!8245 0))(
  ( (array!8246 (arr!4612 (Array (_ BitVec 32) (_ BitVec 8))) (size!3691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6538 0))(
  ( (BitStream!6539 (buf!4143 array!8245) (currentByte!7722 (_ BitVec 32)) (currentBit!7717 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6538)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164620 (= res!137178 (bvsle (bvadd (currentBit!7717 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164619 () Bool)

(declare-fun res!137180 () Bool)

(assert (=> b!164619 (=> (not res!137180) (not e!113752))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164619 (= res!137180 (validate_offset_bits!1 ((_ sign_extend 32) (size!3691 (buf!4143 thiss!1577))) ((_ sign_extend 32) (currentByte!7722 thiss!1577)) ((_ sign_extend 32) (currentBit!7717 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!137179 () Bool)

(assert (=> start!34798 (=> (not res!137179) (not e!113752))))

(assert (=> start!34798 (= res!137179 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34798 e!113752))

(assert (=> start!34798 true))

(declare-fun e!113753 () Bool)

(declare-fun inv!12 (BitStream!6538) Bool)

(assert (=> start!34798 (and (inv!12 thiss!1577) e!113753)))

(declare-fun b!164621 () Bool)

(declare-fun lt!258372 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164621 (= e!113752 (not (byteRangesEq!0 (select (arr!4612 (buf!4143 thiss!1577)) (currentByte!7722 thiss!1577)) lt!258372 #b00000000000000000000000000000000 (currentBit!7717 thiss!1577))))))

(declare-fun arrayRangesEq!625 (array!8245 array!8245 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164621 (arrayRangesEq!625 (buf!4143 thiss!1577) (array!8246 (store (arr!4612 (buf!4143 thiss!1577)) (currentByte!7722 thiss!1577) lt!258372) (size!3691 (buf!4143 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7722 thiss!1577))))

(declare-datatypes ((Unit!11462 0))(
  ( (Unit!11463) )
))
(declare-fun lt!258371 () Unit!11462)

(declare-fun arrayUpdatedAtPrefixLemma!233 (array!8245 (_ BitVec 32) (_ BitVec 8)) Unit!11462)

(assert (=> b!164621 (= lt!258371 (arrayUpdatedAtPrefixLemma!233 (buf!4143 thiss!1577) (currentByte!7722 thiss!1577) lt!258372))))

(declare-fun lt!258370 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164621 (= lt!258372 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4612 (buf!4143 thiss!1577)) (currentByte!7722 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7717 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258370)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258370))))))

(assert (=> b!164621 (= lt!258370 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7717 thiss!1577) nBits!511)))))

(declare-fun b!164622 () Bool)

(declare-fun array_inv!3432 (array!8245) Bool)

(assert (=> b!164622 (= e!113753 (array_inv!3432 (buf!4143 thiss!1577)))))

(assert (= (and start!34798 res!137179) b!164619))

(assert (= (and b!164619 res!137180) b!164620))

(assert (= (and b!164620 res!137178) b!164621))

(assert (= start!34798 b!164622))

(declare-fun m!261797 () Bool)

(assert (=> b!164619 m!261797))

(declare-fun m!261799 () Bool)

(assert (=> start!34798 m!261799))

(declare-fun m!261801 () Bool)

(assert (=> b!164621 m!261801))

(declare-fun m!261803 () Bool)

(assert (=> b!164621 m!261803))

(declare-fun m!261805 () Bool)

(assert (=> b!164621 m!261805))

(declare-fun m!261807 () Bool)

(assert (=> b!164621 m!261807))

(declare-fun m!261809 () Bool)

(assert (=> b!164621 m!261809))

(declare-fun m!261811 () Bool)

(assert (=> b!164621 m!261811))

(assert (=> b!164621 m!261801))

(declare-fun m!261813 () Bool)

(assert (=> b!164621 m!261813))

(declare-fun m!261815 () Bool)

(assert (=> b!164621 m!261815))

(declare-fun m!261817 () Bool)

(assert (=> b!164622 m!261817))

(push 1)

(assert (not b!164619))

(assert (not start!34798))

(assert (not b!164621))

(assert (not b!164622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56837 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

