; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34230 () Bool)

(assert start!34230)

(declare-fun b!163053 () Bool)

(declare-fun res!135835 () Bool)

(declare-fun e!112571 () Bool)

(assert (=> b!163053 (=> (not res!135835) (not e!112571))))

(declare-datatypes ((array!8101 0))(
  ( (array!8102 (arr!4552 (Array (_ BitVec 32) (_ BitVec 8))) (size!3631 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6418 0))(
  ( (BitStream!6419 (buf!4083 array!8101) (currentByte!7603 (_ BitVec 32)) (currentBit!7598 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6418)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163053 (= res!135835 (bvsle (bvadd (currentBit!7598 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163055 () Bool)

(declare-fun e!112570 () Bool)

(declare-fun array_inv!3372 (array!8101) Bool)

(assert (=> b!163055 (= e!112570 (array_inv!3372 (buf!4083 thiss!1577)))))

(declare-fun res!135834 () Bool)

(assert (=> start!34230 (=> (not res!135834) (not e!112571))))

(assert (=> start!34230 (= res!135834 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34230 e!112571))

(assert (=> start!34230 true))

(declare-fun inv!12 (BitStream!6418) Bool)

(assert (=> start!34230 (and (inv!12 thiss!1577) e!112570)))

(declare-fun b!163054 () Bool)

(assert (=> b!163054 (= e!112571 (not (and (bvsle #b00000000000000000000000000000000 (currentBit!7598 thiss!1577)) (bvsle (currentBit!7598 thiss!1577) #b00000000000000000000000000001000))))))

(declare-fun lt!256180 () (_ BitVec 8))

(declare-fun arrayRangesEq!565 (array!8101 array!8101 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163054 (arrayRangesEq!565 (buf!4083 thiss!1577) (array!8102 (store (arr!4552 (buf!4083 thiss!1577)) (currentByte!7603 thiss!1577) lt!256180) (size!3631 (buf!4083 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7603 thiss!1577))))

(declare-datatypes ((Unit!11294 0))(
  ( (Unit!11295) )
))
(declare-fun lt!256181 () Unit!11294)

(declare-fun arrayUpdatedAtPrefixLemma!173 (array!8101 (_ BitVec 32) (_ BitVec 8)) Unit!11294)

(assert (=> b!163054 (= lt!256181 (arrayUpdatedAtPrefixLemma!173 (buf!4083 thiss!1577) (currentByte!7603 thiss!1577) lt!256180))))

(declare-fun lt!256182 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163054 (= lt!256180 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4552 (buf!4083 thiss!1577)) (currentByte!7603 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7598 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256182)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256182))))))

(assert (=> b!163054 (= lt!256182 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7598 thiss!1577) nBits!511)))))

(declare-fun b!163052 () Bool)

(declare-fun res!135833 () Bool)

(assert (=> b!163052 (=> (not res!135833) (not e!112571))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163052 (= res!135833 (validate_offset_bits!1 ((_ sign_extend 32) (size!3631 (buf!4083 thiss!1577))) ((_ sign_extend 32) (currentByte!7603 thiss!1577)) ((_ sign_extend 32) (currentBit!7598 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34230 res!135834) b!163052))

(assert (= (and b!163052 res!135833) b!163053))

(assert (= (and b!163053 res!135835) b!163054))

(assert (= start!34230 b!163055))

(declare-fun m!258895 () Bool)

(assert (=> b!163055 m!258895))

(declare-fun m!258897 () Bool)

(assert (=> start!34230 m!258897))

(declare-fun m!258899 () Bool)

(assert (=> b!163054 m!258899))

(declare-fun m!258901 () Bool)

(assert (=> b!163054 m!258901))

(declare-fun m!258903 () Bool)

(assert (=> b!163054 m!258903))

(declare-fun m!258905 () Bool)

(assert (=> b!163054 m!258905))

(declare-fun m!258907 () Bool)

(assert (=> b!163054 m!258907))

(declare-fun m!258909 () Bool)

(assert (=> b!163054 m!258909))

(declare-fun m!258911 () Bool)

(assert (=> b!163054 m!258911))

(declare-fun m!258913 () Bool)

(assert (=> b!163052 m!258913))

(push 1)

(assert (not b!163052))

(assert (not b!163055))

(assert (not b!163054))

(assert (not start!34230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56201 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56201 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3631 (buf!4083 thiss!1577))) ((_ sign_extend 32) (currentByte!7603 thiss!1577)) ((_ sign_extend 32) (currentBit!7598 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3631 (buf!4083 thiss!1577))) ((_ sign_extend 32) (currentByte!7603 thiss!1577)) ((_ sign_extend 32) (currentBit!7598 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13929 () Bool)

