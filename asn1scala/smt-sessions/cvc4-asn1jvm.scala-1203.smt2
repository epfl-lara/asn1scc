; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34196 () Bool)

(assert start!34196)

(declare-fun res!135753 () Bool)

(declare-fun e!112488 () Bool)

(assert (=> start!34196 (=> (not res!135753) (not e!112488))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34196 (= res!135753 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34196 e!112488))

(assert (=> start!34196 true))

(declare-datatypes ((array!8085 0))(
  ( (array!8086 (arr!4545 (Array (_ BitVec 32) (_ BitVec 8))) (size!3624 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6404 0))(
  ( (BitStream!6405 (buf!4076 array!8085) (currentByte!7594 (_ BitVec 32)) (currentBit!7589 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6404)

(declare-fun e!112490 () Bool)

(declare-fun inv!12 (BitStream!6404) Bool)

(assert (=> start!34196 (and (inv!12 thiss!1577) e!112490)))

(declare-fun b!162953 () Bool)

(declare-fun array_inv!3365 (array!8085) Bool)

(assert (=> b!162953 (= e!112490 (array_inv!3365 (buf!4076 thiss!1577)))))

(declare-fun b!162952 () Bool)

(assert (=> b!162952 (= e!112488 (not (bvsle #b00000000000000000000000000000000 (currentByte!7594 thiss!1577))))))

(declare-fun lt!256111 () (_ BitVec 8))

(declare-fun arrayRangesEq!558 (array!8085 array!8085 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162952 (arrayRangesEq!558 (buf!4076 thiss!1577) (array!8086 (store (arr!4545 (buf!4076 thiss!1577)) (currentByte!7594 thiss!1577) lt!256111) (size!3624 (buf!4076 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7594 thiss!1577))))

(declare-datatypes ((Unit!11280 0))(
  ( (Unit!11281) )
))
(declare-fun lt!256113 () Unit!11280)

(declare-fun arrayUpdatedAtPrefixLemma!166 (array!8085 (_ BitVec 32) (_ BitVec 8)) Unit!11280)

(assert (=> b!162952 (= lt!256113 (arrayUpdatedAtPrefixLemma!166 (buf!4076 thiss!1577) (currentByte!7594 thiss!1577) lt!256111))))

(declare-fun lt!256112 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!162952 (= lt!256111 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4545 (buf!4076 thiss!1577)) (currentByte!7594 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7589 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256112)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256112))))))

(assert (=> b!162952 (= lt!256112 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7589 thiss!1577) nBits!511)))))

(declare-fun b!162950 () Bool)

(declare-fun res!135752 () Bool)

(assert (=> b!162950 (=> (not res!135752) (not e!112488))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162950 (= res!135752 (validate_offset_bits!1 ((_ sign_extend 32) (size!3624 (buf!4076 thiss!1577))) ((_ sign_extend 32) (currentByte!7594 thiss!1577)) ((_ sign_extend 32) (currentBit!7589 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!162951 () Bool)

(declare-fun res!135754 () Bool)

(assert (=> b!162951 (=> (not res!135754) (not e!112488))))

(assert (=> b!162951 (= res!135754 (bvsle (bvadd (currentBit!7589 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34196 res!135753) b!162950))

(assert (= (and b!162950 res!135752) b!162951))

(assert (= (and b!162951 res!135754) b!162952))

(assert (= start!34196 b!162953))

(declare-fun m!258731 () Bool)

(assert (=> start!34196 m!258731))

(declare-fun m!258733 () Bool)

(assert (=> b!162953 m!258733))

(declare-fun m!258735 () Bool)

(assert (=> b!162952 m!258735))

(declare-fun m!258737 () Bool)

(assert (=> b!162952 m!258737))

(declare-fun m!258739 () Bool)

(assert (=> b!162952 m!258739))

(declare-fun m!258741 () Bool)

(assert (=> b!162952 m!258741))

(declare-fun m!258743 () Bool)

(assert (=> b!162952 m!258743))

(declare-fun m!258745 () Bool)

(assert (=> b!162952 m!258745))

(declare-fun m!258747 () Bool)

(assert (=> b!162952 m!258747))

(declare-fun m!258749 () Bool)

(assert (=> b!162950 m!258749))

(push 1)

(assert (not start!34196))

(assert (not b!162952))

(assert (not b!162953))

(assert (not b!162950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

