; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35304 () Bool)

(assert start!35304)

(declare-fun res!137661 () Bool)

(declare-fun e!114388 () Bool)

(assert (=> start!35304 (=> (not res!137661) (not e!114388))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35304 (= res!137661 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35304 e!114388))

(assert (=> start!35304 true))

(declare-datatypes ((array!8408 0))(
  ( (array!8409 (arr!4675 (Array (_ BitVec 32) (_ BitVec 8))) (size!3754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6664 0))(
  ( (BitStream!6665 (buf!4206 array!8408) (currentByte!7881 (_ BitVec 32)) (currentBit!7876 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6664)

(declare-fun e!114389 () Bool)

(declare-fun inv!12 (BitStream!6664) Bool)

(assert (=> start!35304 (and (inv!12 thiss!1577) e!114389)))

(declare-fun b!165294 () Bool)

(declare-fun array_inv!3495 (array!8408) Bool)

(assert (=> b!165294 (= e!114389 (array_inv!3495 (buf!4206 thiss!1577)))))

(declare-fun b!165291 () Bool)

(declare-fun res!137663 () Bool)

(assert (=> b!165291 (=> (not res!137663) (not e!114388))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165291 (= res!137663 (validate_offset_bits!1 ((_ sign_extend 32) (size!3754 (buf!4206 thiss!1577))) ((_ sign_extend 32) (currentByte!7881 thiss!1577)) ((_ sign_extend 32) (currentBit!7876 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165293 () Bool)

(assert (=> b!165293 (= e!114388 (not (and (bvsge (currentByte!7881 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7881 thiss!1577) (size!3754 (buf!4206 thiss!1577))))))))

(declare-fun lt!258573 () (_ BitVec 8))

(declare-fun arrayRangesEq!634 (array!8408 array!8408 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165293 (arrayRangesEq!634 (buf!4206 thiss!1577) (array!8409 (store (arr!4675 (buf!4206 thiss!1577)) (currentByte!7881 thiss!1577) lt!258573) (size!3754 (buf!4206 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7881 thiss!1577))))

(declare-datatypes ((Unit!11480 0))(
  ( (Unit!11481) )
))
(declare-fun lt!258572 () Unit!11480)

(declare-fun arrayUpdatedAtPrefixLemma!242 (array!8408 (_ BitVec 32) (_ BitVec 8)) Unit!11480)

(assert (=> b!165293 (= lt!258572 (arrayUpdatedAtPrefixLemma!242 (buf!4206 thiss!1577) (currentByte!7881 thiss!1577) lt!258573))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun lt!258571 () (_ BitVec 32))

(assert (=> b!165293 (= lt!258573 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4675 (buf!4206 thiss!1577)) (currentByte!7881 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7876 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258571)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258571))))))

(assert (=> b!165293 (= lt!258571 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7876 thiss!1577) nBits!511)))))

(declare-fun b!165292 () Bool)

(declare-fun res!137662 () Bool)

(assert (=> b!165292 (=> (not res!137662) (not e!114388))))

(assert (=> b!165292 (= res!137662 (bvsle (bvadd (currentBit!7876 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!35304 res!137661) b!165291))

(assert (= (and b!165291 res!137663) b!165292))

(assert (= (and b!165292 res!137662) b!165293))

(assert (= start!35304 b!165294))

(declare-fun m!262711 () Bool)

(assert (=> start!35304 m!262711))

(declare-fun m!262713 () Bool)

(assert (=> b!165294 m!262713))

(declare-fun m!262715 () Bool)

(assert (=> b!165291 m!262715))

(declare-fun m!262717 () Bool)

(assert (=> b!165293 m!262717))

(declare-fun m!262719 () Bool)

(assert (=> b!165293 m!262719))

(declare-fun m!262721 () Bool)

(assert (=> b!165293 m!262721))

(declare-fun m!262723 () Bool)

(assert (=> b!165293 m!262723))

(declare-fun m!262725 () Bool)

(assert (=> b!165293 m!262725))

(declare-fun m!262727 () Bool)

(assert (=> b!165293 m!262727))

(declare-fun m!262729 () Bool)

(assert (=> b!165293 m!262729))

(push 1)

(assert (not b!165291))

(assert (not start!35304))

(assert (not b!165293))

(assert (not b!165294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

