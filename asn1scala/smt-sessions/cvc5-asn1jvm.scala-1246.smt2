; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35288 () Bool)

(assert start!35288)

(declare-fun b!165246 () Bool)

(declare-fun res!137627 () Bool)

(declare-fun e!114352 () Bool)

(assert (=> b!165246 (=> (not res!137627) (not e!114352))))

(declare-datatypes ((array!8401 0))(
  ( (array!8402 (arr!4672 (Array (_ BitVec 32) (_ BitVec 8))) (size!3751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6658 0))(
  ( (BitStream!6659 (buf!4203 array!8401) (currentByte!7877 (_ BitVec 32)) (currentBit!7872 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6658)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165246 (= res!137627 (validate_offset_bits!1 ((_ sign_extend 32) (size!3751 (buf!4203 thiss!1577))) ((_ sign_extend 32) (currentByte!7877 thiss!1577)) ((_ sign_extend 32) (currentBit!7872 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165247 () Bool)

(declare-fun res!137625 () Bool)

(assert (=> b!165247 (=> (not res!137625) (not e!114352))))

(assert (=> b!165247 (= res!137625 (bvsle (bvadd (currentBit!7872 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165248 () Bool)

(assert (=> b!165248 (= e!114352 (not (and (bvsge (currentByte!7877 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7877 thiss!1577) (size!3751 (buf!4203 thiss!1577))))))))

(declare-fun lt!258542 () (_ BitVec 8))

(declare-fun arrayRangesEq!631 (array!8401 array!8401 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165248 (arrayRangesEq!631 (buf!4203 thiss!1577) (array!8402 (store (arr!4672 (buf!4203 thiss!1577)) (currentByte!7877 thiss!1577) lt!258542) (size!3751 (buf!4203 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7877 thiss!1577))))

(declare-datatypes ((Unit!11474 0))(
  ( (Unit!11475) )
))
(declare-fun lt!258543 () Unit!11474)

(declare-fun arrayUpdatedAtPrefixLemma!239 (array!8401 (_ BitVec 32) (_ BitVec 8)) Unit!11474)

(assert (=> b!165248 (= lt!258543 (arrayUpdatedAtPrefixLemma!239 (buf!4203 thiss!1577) (currentByte!7877 thiss!1577) lt!258542))))

(declare-fun lt!258541 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165248 (= lt!258542 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4672 (buf!4203 thiss!1577)) (currentByte!7877 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7872 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258541)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258541))))))

(assert (=> b!165248 (= lt!258541 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7872 thiss!1577) nBits!511)))))

(declare-fun b!165249 () Bool)

(declare-fun e!114353 () Bool)

(declare-fun array_inv!3492 (array!8401) Bool)

(assert (=> b!165249 (= e!114353 (array_inv!3492 (buf!4203 thiss!1577)))))

(declare-fun res!137626 () Bool)

(assert (=> start!35288 (=> (not res!137626) (not e!114352))))

(assert (=> start!35288 (= res!137626 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35288 e!114352))

(assert (=> start!35288 true))

(declare-fun inv!12 (BitStream!6658) Bool)

(assert (=> start!35288 (and (inv!12 thiss!1577) e!114353)))

(assert (= (and start!35288 res!137626) b!165246))

(assert (= (and b!165246 res!137627) b!165247))

(assert (= (and b!165247 res!137625) b!165248))

(assert (= start!35288 b!165249))

(declare-fun m!262639 () Bool)

(assert (=> b!165246 m!262639))

(declare-fun m!262641 () Bool)

(assert (=> b!165248 m!262641))

(declare-fun m!262643 () Bool)

(assert (=> b!165248 m!262643))

(declare-fun m!262645 () Bool)

(assert (=> b!165248 m!262645))

(declare-fun m!262647 () Bool)

(assert (=> b!165248 m!262647))

(declare-fun m!262649 () Bool)

(assert (=> b!165248 m!262649))

(declare-fun m!262651 () Bool)

(assert (=> b!165248 m!262651))

(declare-fun m!262653 () Bool)

(assert (=> b!165248 m!262653))

(declare-fun m!262655 () Bool)

(assert (=> b!165249 m!262655))

(declare-fun m!262657 () Bool)

(assert (=> start!35288 m!262657))

(push 1)

(assert (not b!165246))

(assert (not start!35288))

(assert (not b!165249))

(assert (not b!165248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

