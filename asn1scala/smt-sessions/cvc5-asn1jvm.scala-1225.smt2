; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34792 () Bool)

(assert start!34792)

(declare-fun res!137151 () Bool)

(declare-fun e!113727 () Bool)

(assert (=> start!34792 (=> (not res!137151) (not e!113727))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34792 (= res!137151 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34792 e!113727))

(assert (=> start!34792 true))

(declare-datatypes ((array!8239 0))(
  ( (array!8240 (arr!4609 (Array (_ BitVec 32) (_ BitVec 8))) (size!3688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6532 0))(
  ( (BitStream!6533 (buf!4140 array!8239) (currentByte!7719 (_ BitVec 32)) (currentBit!7714 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6532)

(declare-fun e!113726 () Bool)

(declare-fun inv!12 (BitStream!6532) Bool)

(assert (=> start!34792 (and (inv!12 thiss!1577) e!113726)))

(declare-fun b!164584 () Bool)

(declare-fun res!137153 () Bool)

(assert (=> b!164584 (=> (not res!137153) (not e!113727))))

(assert (=> b!164584 (= res!137153 (bvsle (bvadd (currentBit!7714 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164585 () Bool)

(assert (=> b!164585 (= e!113727 (not true))))

(declare-fun lt!258343 () (_ BitVec 8))

(declare-fun arrayRangesEq!622 (array!8239 array!8239 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164585 (arrayRangesEq!622 (buf!4140 thiss!1577) (array!8240 (store (arr!4609 (buf!4140 thiss!1577)) (currentByte!7719 thiss!1577) lt!258343) (size!3688 (buf!4140 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7719 thiss!1577))))

(declare-datatypes ((Unit!11456 0))(
  ( (Unit!11457) )
))
(declare-fun lt!258345 () Unit!11456)

(declare-fun arrayUpdatedAtPrefixLemma!230 (array!8239 (_ BitVec 32) (_ BitVec 8)) Unit!11456)

(assert (=> b!164585 (= lt!258345 (arrayUpdatedAtPrefixLemma!230 (buf!4140 thiss!1577) (currentByte!7719 thiss!1577) lt!258343))))

(declare-fun lt!258344 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164585 (= lt!258343 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4609 (buf!4140 thiss!1577)) (currentByte!7719 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7714 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258344)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258344))))))

(assert (=> b!164585 (= lt!258344 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7714 thiss!1577) nBits!511)))))

(declare-fun b!164586 () Bool)

(declare-fun array_inv!3429 (array!8239) Bool)

(assert (=> b!164586 (= e!113726 (array_inv!3429 (buf!4140 thiss!1577)))))

(declare-fun b!164583 () Bool)

(declare-fun res!137152 () Bool)

(assert (=> b!164583 (=> (not res!137152) (not e!113727))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164583 (= res!137152 (validate_offset_bits!1 ((_ sign_extend 32) (size!3688 (buf!4140 thiss!1577))) ((_ sign_extend 32) (currentByte!7719 thiss!1577)) ((_ sign_extend 32) (currentBit!7714 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34792 res!137151) b!164583))

(assert (= (and b!164583 res!137152) b!164584))

(assert (= (and b!164584 res!137153) b!164585))

(assert (= start!34792 b!164586))

(declare-fun m!261737 () Bool)

(assert (=> start!34792 m!261737))

(declare-fun m!261739 () Bool)

(assert (=> b!164585 m!261739))

(declare-fun m!261741 () Bool)

(assert (=> b!164585 m!261741))

(declare-fun m!261743 () Bool)

(assert (=> b!164585 m!261743))

(declare-fun m!261745 () Bool)

(assert (=> b!164585 m!261745))

(declare-fun m!261747 () Bool)

(assert (=> b!164585 m!261747))

(declare-fun m!261749 () Bool)

(assert (=> b!164585 m!261749))

(declare-fun m!261751 () Bool)

(assert (=> b!164585 m!261751))

(declare-fun m!261753 () Bool)

(assert (=> b!164586 m!261753))

(declare-fun m!261755 () Bool)

(assert (=> b!164583 m!261755))

(push 1)

(assert (not b!164586))

(assert (not b!164583))

(assert (not start!34792))

(assert (not b!164585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

