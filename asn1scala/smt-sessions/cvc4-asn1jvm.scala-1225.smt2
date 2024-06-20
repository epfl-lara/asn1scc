; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34796 () Bool)

(assert start!34796)

(declare-fun b!164607 () Bool)

(declare-fun res!137169 () Bool)

(declare-fun e!113745 () Bool)

(assert (=> b!164607 (=> (not res!137169) (not e!113745))))

(declare-datatypes ((array!8243 0))(
  ( (array!8244 (arr!4611 (Array (_ BitVec 32) (_ BitVec 8))) (size!3690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6536 0))(
  ( (BitStream!6537 (buf!4142 array!8243) (currentByte!7721 (_ BitVec 32)) (currentBit!7716 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6536)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164607 (= res!137169 (validate_offset_bits!1 ((_ sign_extend 32) (size!3690 (buf!4142 thiss!1577))) ((_ sign_extend 32) (currentByte!7721 thiss!1577)) ((_ sign_extend 32) (currentBit!7716 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164610 () Bool)

(declare-fun e!113744 () Bool)

(declare-fun array_inv!3431 (array!8243) Bool)

(assert (=> b!164610 (= e!113744 (array_inv!3431 (buf!4142 thiss!1577)))))

(declare-fun res!137171 () Bool)

(assert (=> start!34796 (=> (not res!137171) (not e!113745))))

(assert (=> start!34796 (= res!137171 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34796 e!113745))

(assert (=> start!34796 true))

(declare-fun inv!12 (BitStream!6536) Bool)

(assert (=> start!34796 (and (inv!12 thiss!1577) e!113744)))

(declare-fun b!164608 () Bool)

(declare-fun res!137170 () Bool)

(assert (=> b!164608 (=> (not res!137170) (not e!113745))))

(assert (=> b!164608 (= res!137170 (bvsle (bvadd (currentBit!7716 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164609 () Bool)

(assert (=> b!164609 (= e!113745 (not true))))

(declare-fun lt!258363 () (_ BitVec 8))

(declare-fun arrayRangesEq!624 (array!8243 array!8243 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164609 (arrayRangesEq!624 (buf!4142 thiss!1577) (array!8244 (store (arr!4611 (buf!4142 thiss!1577)) (currentByte!7721 thiss!1577) lt!258363) (size!3690 (buf!4142 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7721 thiss!1577))))

(declare-datatypes ((Unit!11460 0))(
  ( (Unit!11461) )
))
(declare-fun lt!258361 () Unit!11460)

(declare-fun arrayUpdatedAtPrefixLemma!232 (array!8243 (_ BitVec 32) (_ BitVec 8)) Unit!11460)

(assert (=> b!164609 (= lt!258361 (arrayUpdatedAtPrefixLemma!232 (buf!4142 thiss!1577) (currentByte!7721 thiss!1577) lt!258363))))

(declare-fun lt!258362 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164609 (= lt!258363 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4611 (buf!4142 thiss!1577)) (currentByte!7721 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7716 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258362)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258362))))))

(assert (=> b!164609 (= lt!258362 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7716 thiss!1577) nBits!511)))))

(assert (= (and start!34796 res!137171) b!164607))

(assert (= (and b!164607 res!137169) b!164608))

(assert (= (and b!164608 res!137170) b!164609))

(assert (= start!34796 b!164610))

(declare-fun m!261777 () Bool)

(assert (=> b!164607 m!261777))

(declare-fun m!261779 () Bool)

(assert (=> b!164610 m!261779))

(declare-fun m!261781 () Bool)

(assert (=> start!34796 m!261781))

(declare-fun m!261783 () Bool)

(assert (=> b!164609 m!261783))

(declare-fun m!261785 () Bool)

(assert (=> b!164609 m!261785))

(declare-fun m!261787 () Bool)

(assert (=> b!164609 m!261787))

(declare-fun m!261789 () Bool)

(assert (=> b!164609 m!261789))

(declare-fun m!261791 () Bool)

(assert (=> b!164609 m!261791))

(declare-fun m!261793 () Bool)

(assert (=> b!164609 m!261793))

(declare-fun m!261795 () Bool)

(assert (=> b!164609 m!261795))

(push 1)

(assert (not b!164609))

