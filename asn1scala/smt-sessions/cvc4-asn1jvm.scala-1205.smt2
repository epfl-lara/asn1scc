; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34218 () Bool)

(assert start!34218)

(declare-fun b!163031 () Bool)

(declare-fun res!135816 () Bool)

(declare-fun e!112551 () Bool)

(assert (=> b!163031 (=> (not res!135816) (not e!112551))))

(declare-datatypes ((array!8098 0))(
  ( (array!8099 (arr!4551 (Array (_ BitVec 32) (_ BitVec 8))) (size!3630 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6416 0))(
  ( (BitStream!6417 (buf!4082 array!8098) (currentByte!7601 (_ BitVec 32)) (currentBit!7596 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6416)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163031 (= res!135816 (validate_offset_bits!1 ((_ sign_extend 32) (size!3630 (buf!4082 thiss!1577))) ((_ sign_extend 32) (currentByte!7601 thiss!1577)) ((_ sign_extend 32) (currentBit!7596 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163032 () Bool)

(declare-fun res!135817 () Bool)

(assert (=> b!163032 (=> (not res!135817) (not e!112551))))

(assert (=> b!163032 (= res!135817 (bvsle (bvadd (currentBit!7596 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163033 () Bool)

(assert (=> b!163033 (= e!112551 (not (or (bvsgt #b00000000000000000000000000000000 (currentByte!7601 thiss!1577)) (bvsle (currentByte!7601 thiss!1577) (size!3630 (buf!4082 thiss!1577))))))))

(declare-fun lt!256168 () (_ BitVec 8))

(declare-fun arrayRangesEq!564 (array!8098 array!8098 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163033 (arrayRangesEq!564 (buf!4082 thiss!1577) (array!8099 (store (arr!4551 (buf!4082 thiss!1577)) (currentByte!7601 thiss!1577) lt!256168) (size!3630 (buf!4082 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7601 thiss!1577))))

(declare-datatypes ((Unit!11292 0))(
  ( (Unit!11293) )
))
(declare-fun lt!256169 () Unit!11292)

(declare-fun arrayUpdatedAtPrefixLemma!172 (array!8098 (_ BitVec 32) (_ BitVec 8)) Unit!11292)

(assert (=> b!163033 (= lt!256169 (arrayUpdatedAtPrefixLemma!172 (buf!4082 thiss!1577) (currentByte!7601 thiss!1577) lt!256168))))

(declare-fun lt!256170 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163033 (= lt!256168 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4551 (buf!4082 thiss!1577)) (currentByte!7601 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7596 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256170)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256170))))))

(assert (=> b!163033 (= lt!256170 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7596 thiss!1577) nBits!511)))))

(declare-fun res!135815 () Bool)

(assert (=> start!34218 (=> (not res!135815) (not e!112551))))

(assert (=> start!34218 (= res!135815 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34218 e!112551))

(assert (=> start!34218 true))

(declare-fun e!112552 () Bool)

(declare-fun inv!12 (BitStream!6416) Bool)

(assert (=> start!34218 (and (inv!12 thiss!1577) e!112552)))

(declare-fun b!163034 () Bool)

(declare-fun array_inv!3371 (array!8098) Bool)

(assert (=> b!163034 (= e!112552 (array_inv!3371 (buf!4082 thiss!1577)))))

(assert (= (and start!34218 res!135815) b!163031))

(assert (= (and b!163031 res!135816) b!163032))

(assert (= (and b!163032 res!135817) b!163033))

(assert (= start!34218 b!163034))

(declare-fun m!258863 () Bool)

(assert (=> b!163031 m!258863))

(declare-fun m!258865 () Bool)

(assert (=> b!163033 m!258865))

(declare-fun m!258867 () Bool)

(assert (=> b!163033 m!258867))

(declare-fun m!258869 () Bool)

(assert (=> b!163033 m!258869))

(declare-fun m!258871 () Bool)

(assert (=> b!163033 m!258871))

(declare-fun m!258873 () Bool)

(assert (=> b!163033 m!258873))

(declare-fun m!258875 () Bool)

(assert (=> b!163033 m!258875))

(declare-fun m!258877 () Bool)

(assert (=> b!163033 m!258877))

(declare-fun m!258879 () Bool)

(assert (=> start!34218 m!258879))

(declare-fun m!258881 () Bool)

(assert (=> b!163034 m!258881))

(push 1)

(assert (not b!163034))

(assert (not b!163033))

(assert (not start!34218))

(assert (not b!163031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

