; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34212 () Bool)

(assert start!34212)

(declare-fun b!162998 () Bool)

(declare-fun e!112525 () Bool)

(declare-datatypes ((array!8092 0))(
  ( (array!8093 (arr!4548 (Array (_ BitVec 32) (_ BitVec 8))) (size!3627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6410 0))(
  ( (BitStream!6411 (buf!4079 array!8092) (currentByte!7598 (_ BitVec 32)) (currentBit!7593 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6410)

(declare-fun array_inv!3368 (array!8092) Bool)

(assert (=> b!162998 (= e!112525 (array_inv!3368 (buf!4079 thiss!1577)))))

(declare-fun b!162996 () Bool)

(declare-fun res!135789 () Bool)

(declare-fun e!112524 () Bool)

(assert (=> b!162996 (=> (not res!135789) (not e!112524))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!162996 (= res!135789 (bvsle (bvadd (currentBit!7593 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!162997 () Bool)

(assert (=> b!162997 (= e!112524 (not true))))

(declare-fun lt!256142 () (_ BitVec 8))

(declare-fun arrayRangesEq!561 (array!8092 array!8092 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162997 (arrayRangesEq!561 (buf!4079 thiss!1577) (array!8093 (store (arr!4548 (buf!4079 thiss!1577)) (currentByte!7598 thiss!1577) lt!256142) (size!3627 (buf!4079 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7598 thiss!1577))))

(declare-datatypes ((Unit!11286 0))(
  ( (Unit!11287) )
))
(declare-fun lt!256143 () Unit!11286)

(declare-fun arrayUpdatedAtPrefixLemma!169 (array!8092 (_ BitVec 32) (_ BitVec 8)) Unit!11286)

(assert (=> b!162997 (= lt!256143 (arrayUpdatedAtPrefixLemma!169 (buf!4079 thiss!1577) (currentByte!7598 thiss!1577) lt!256142))))

(declare-fun lt!256141 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!162997 (= lt!256142 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4548 (buf!4079 thiss!1577)) (currentByte!7598 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7593 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256141)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256141))))))

(assert (=> b!162997 (= lt!256141 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7593 thiss!1577) nBits!511)))))

(declare-fun res!135788 () Bool)

(assert (=> start!34212 (=> (not res!135788) (not e!112524))))

(assert (=> start!34212 (= res!135788 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34212 e!112524))

(assert (=> start!34212 true))

(declare-fun inv!12 (BitStream!6410) Bool)

(assert (=> start!34212 (and (inv!12 thiss!1577) e!112525)))

(declare-fun b!162995 () Bool)

(declare-fun res!135790 () Bool)

(assert (=> b!162995 (=> (not res!135790) (not e!112524))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162995 (= res!135790 (validate_offset_bits!1 ((_ sign_extend 32) (size!3627 (buf!4079 thiss!1577))) ((_ sign_extend 32) (currentByte!7598 thiss!1577)) ((_ sign_extend 32) (currentBit!7593 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34212 res!135788) b!162995))

(assert (= (and b!162995 res!135790) b!162996))

(assert (= (and b!162996 res!135789) b!162997))

(assert (= start!34212 b!162998))

(declare-fun m!258803 () Bool)

(assert (=> b!162998 m!258803))

(declare-fun m!258805 () Bool)

(assert (=> b!162997 m!258805))

(declare-fun m!258807 () Bool)

(assert (=> b!162997 m!258807))

(declare-fun m!258809 () Bool)

(assert (=> b!162997 m!258809))

(declare-fun m!258811 () Bool)

(assert (=> b!162997 m!258811))

(declare-fun m!258813 () Bool)

(assert (=> b!162997 m!258813))

(declare-fun m!258815 () Bool)

(assert (=> b!162997 m!258815))

(declare-fun m!258817 () Bool)

(assert (=> b!162997 m!258817))

(declare-fun m!258819 () Bool)

(assert (=> start!34212 m!258819))

(declare-fun m!258821 () Bool)

(assert (=> b!162995 m!258821))

(push 1)

(assert (not b!162998))

(assert (not b!162995))

(assert (not start!34212))

(assert (not b!162997))

(check-sat)

(pop 1)

(push 1)

