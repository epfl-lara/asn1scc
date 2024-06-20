; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34802 () Bool)

(assert start!34802)

(declare-fun b!164643 () Bool)

(declare-fun res!137196 () Bool)

(declare-fun e!113770 () Bool)

(assert (=> b!164643 (=> (not res!137196) (not e!113770))))

(declare-datatypes ((array!8249 0))(
  ( (array!8250 (arr!4614 (Array (_ BitVec 32) (_ BitVec 8))) (size!3693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6542 0))(
  ( (BitStream!6543 (buf!4145 array!8249) (currentByte!7724 (_ BitVec 32)) (currentBit!7719 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6542)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164643 (= res!137196 (validate_offset_bits!1 ((_ sign_extend 32) (size!3693 (buf!4145 thiss!1577))) ((_ sign_extend 32) (currentByte!7724 thiss!1577)) ((_ sign_extend 32) (currentBit!7719 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164645 () Bool)

(declare-fun lt!258388 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164645 (= e!113770 (not (byteRangesEq!0 (select (arr!4614 (buf!4145 thiss!1577)) (currentByte!7724 thiss!1577)) lt!258388 #b00000000000000000000000000000000 (currentBit!7719 thiss!1577))))))

(declare-fun arrayRangesEq!627 (array!8249 array!8249 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164645 (arrayRangesEq!627 (buf!4145 thiss!1577) (array!8250 (store (arr!4614 (buf!4145 thiss!1577)) (currentByte!7724 thiss!1577) lt!258388) (size!3693 (buf!4145 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7724 thiss!1577))))

(declare-datatypes ((Unit!11466 0))(
  ( (Unit!11467) )
))
(declare-fun lt!258390 () Unit!11466)

(declare-fun arrayUpdatedAtPrefixLemma!235 (array!8249 (_ BitVec 32) (_ BitVec 8)) Unit!11466)

(assert (=> b!164645 (= lt!258390 (arrayUpdatedAtPrefixLemma!235 (buf!4145 thiss!1577) (currentByte!7724 thiss!1577) lt!258388))))

(declare-fun lt!258389 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164645 (= lt!258388 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4614 (buf!4145 thiss!1577)) (currentByte!7724 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7719 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258389)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258389))))))

(assert (=> b!164645 (= lt!258389 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7719 thiss!1577) nBits!511)))))

(declare-fun b!164644 () Bool)

(declare-fun res!137197 () Bool)

(assert (=> b!164644 (=> (not res!137197) (not e!113770))))

(assert (=> b!164644 (= res!137197 (bvsle (bvadd (currentBit!7719 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137198 () Bool)

(assert (=> start!34802 (=> (not res!137198) (not e!113770))))

(assert (=> start!34802 (= res!137198 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34802 e!113770))

(assert (=> start!34802 true))

(declare-fun e!113772 () Bool)

(declare-fun inv!12 (BitStream!6542) Bool)

(assert (=> start!34802 (and (inv!12 thiss!1577) e!113772)))

(declare-fun b!164646 () Bool)

(declare-fun array_inv!3434 (array!8249) Bool)

(assert (=> b!164646 (= e!113772 (array_inv!3434 (buf!4145 thiss!1577)))))

(assert (= (and start!34802 res!137198) b!164643))

(assert (= (and b!164643 res!137196) b!164644))

(assert (= (and b!164644 res!137197) b!164645))

(assert (= start!34802 b!164646))

(declare-fun m!261841 () Bool)

(assert (=> b!164643 m!261841))

(declare-fun m!261843 () Bool)

(assert (=> b!164645 m!261843))

(declare-fun m!261845 () Bool)

(assert (=> b!164645 m!261845))

(declare-fun m!261847 () Bool)

(assert (=> b!164645 m!261847))

(assert (=> b!164645 m!261843))

(declare-fun m!261849 () Bool)

(assert (=> b!164645 m!261849))

(declare-fun m!261851 () Bool)

(assert (=> b!164645 m!261851))

(declare-fun m!261853 () Bool)

(assert (=> b!164645 m!261853))

(declare-fun m!261855 () Bool)

(assert (=> b!164645 m!261855))

(declare-fun m!261857 () Bool)

(assert (=> b!164645 m!261857))

(declare-fun m!261859 () Bool)

(assert (=> start!34802 m!261859))

(declare-fun m!261861 () Bool)

(assert (=> b!164646 m!261861))

(push 1)

(assert (not b!164643))

(assert (not start!34802))

(assert (not b!164645))

(assert (not b!164646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

