; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34208 () Bool)

(assert start!34208)

(declare-fun b!162974 () Bool)

(declare-fun e!112508 () Bool)

(declare-datatypes ((array!8088 0))(
  ( (array!8089 (arr!4546 (Array (_ BitVec 32) (_ BitVec 8))) (size!3625 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6406 0))(
  ( (BitStream!6407 (buf!4077 array!8088) (currentByte!7596 (_ BitVec 32)) (currentBit!7591 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6406)

(declare-fun array_inv!3366 (array!8088) Bool)

(assert (=> b!162974 (= e!112508 (array_inv!3366 (buf!4077 thiss!1577)))))

(declare-fun b!162971 () Bool)

(declare-fun res!135771 () Bool)

(declare-fun e!112506 () Bool)

(assert (=> b!162971 (=> (not res!135771) (not e!112506))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162971 (= res!135771 (validate_offset_bits!1 ((_ sign_extend 32) (size!3625 (buf!4077 thiss!1577))) ((_ sign_extend 32) (currentByte!7596 thiss!1577)) ((_ sign_extend 32) (currentBit!7591 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!162973 () Bool)

(assert (=> b!162973 (= e!112506 (not true))))

(declare-fun lt!256125 () (_ BitVec 8))

(declare-fun arrayRangesEq!559 (array!8088 array!8088 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162973 (arrayRangesEq!559 (buf!4077 thiss!1577) (array!8089 (store (arr!4546 (buf!4077 thiss!1577)) (currentByte!7596 thiss!1577) lt!256125) (size!3625 (buf!4077 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7596 thiss!1577))))

(declare-datatypes ((Unit!11282 0))(
  ( (Unit!11283) )
))
(declare-fun lt!256124 () Unit!11282)

(declare-fun arrayUpdatedAtPrefixLemma!167 (array!8088 (_ BitVec 32) (_ BitVec 8)) Unit!11282)

(assert (=> b!162973 (= lt!256124 (arrayUpdatedAtPrefixLemma!167 (buf!4077 thiss!1577) (currentByte!7596 thiss!1577) lt!256125))))

(declare-fun lt!256123 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!162973 (= lt!256125 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4546 (buf!4077 thiss!1577)) (currentByte!7596 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7591 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256123)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256123))))))

(assert (=> b!162973 (= lt!256123 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7591 thiss!1577) nBits!511)))))

(declare-fun res!135770 () Bool)

(assert (=> start!34208 (=> (not res!135770) (not e!112506))))

(assert (=> start!34208 (= res!135770 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34208 e!112506))

(assert (=> start!34208 true))

(declare-fun inv!12 (BitStream!6406) Bool)

(assert (=> start!34208 (and (inv!12 thiss!1577) e!112508)))

(declare-fun b!162972 () Bool)

(declare-fun res!135772 () Bool)

(assert (=> b!162972 (=> (not res!135772) (not e!112506))))

(assert (=> b!162972 (= res!135772 (bvsle (bvadd (currentBit!7591 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34208 res!135770) b!162971))

(assert (= (and b!162971 res!135771) b!162972))

(assert (= (and b!162972 res!135772) b!162973))

(assert (= start!34208 b!162974))

(declare-fun m!258763 () Bool)

(assert (=> b!162974 m!258763))

(declare-fun m!258765 () Bool)

(assert (=> b!162971 m!258765))

(declare-fun m!258767 () Bool)

(assert (=> b!162973 m!258767))

(declare-fun m!258769 () Bool)

(assert (=> b!162973 m!258769))

(declare-fun m!258771 () Bool)

(assert (=> b!162973 m!258771))

(declare-fun m!258773 () Bool)

(assert (=> b!162973 m!258773))

(declare-fun m!258775 () Bool)

(assert (=> b!162973 m!258775))

(declare-fun m!258777 () Bool)

(assert (=> b!162973 m!258777))

(declare-fun m!258779 () Bool)

(assert (=> b!162973 m!258779))

(declare-fun m!258781 () Bool)

(assert (=> start!34208 m!258781))

(push 1)

(assert (not b!162974))

(assert (not b!162971))

(assert (not start!34208))

(assert (not b!162973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

