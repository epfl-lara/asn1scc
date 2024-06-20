; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35308 () Bool)

(assert start!35308)

(declare-fun b!165318 () Bool)

(declare-fun e!114408 () Bool)

(declare-datatypes ((array!8412 0))(
  ( (array!8413 (arr!4677 (Array (_ BitVec 32) (_ BitVec 8))) (size!3756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6668 0))(
  ( (BitStream!6669 (buf!4208 array!8412) (currentByte!7883 (_ BitVec 32)) (currentBit!7878 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6668)

(declare-fun array_inv!3497 (array!8412) Bool)

(assert (=> b!165318 (= e!114408 (array_inv!3497 (buf!4208 thiss!1577)))))

(declare-fun b!165315 () Bool)

(declare-fun res!137679 () Bool)

(declare-fun e!114407 () Bool)

(assert (=> b!165315 (=> (not res!137679) (not e!114407))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165315 (= res!137679 (validate_offset_bits!1 ((_ sign_extend 32) (size!3756 (buf!4208 thiss!1577))) ((_ sign_extend 32) (currentByte!7883 thiss!1577)) ((_ sign_extend 32) (currentBit!7878 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165316 () Bool)

(declare-fun res!137681 () Bool)

(assert (=> b!165316 (=> (not res!137681) (not e!114407))))

(assert (=> b!165316 (= res!137681 (bvsle (bvadd (currentBit!7878 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165317 () Bool)

(assert (=> b!165317 (= e!114407 (not (and (bvsge (currentByte!7883 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7883 thiss!1577) (size!3756 (buf!4208 thiss!1577))))))))

(declare-fun lt!258591 () (_ BitVec 8))

(declare-fun arrayRangesEq!636 (array!8412 array!8412 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165317 (arrayRangesEq!636 (buf!4208 thiss!1577) (array!8413 (store (arr!4677 (buf!4208 thiss!1577)) (currentByte!7883 thiss!1577) lt!258591) (size!3756 (buf!4208 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7883 thiss!1577))))

(declare-datatypes ((Unit!11484 0))(
  ( (Unit!11485) )
))
(declare-fun lt!258589 () Unit!11484)

(declare-fun arrayUpdatedAtPrefixLemma!244 (array!8412 (_ BitVec 32) (_ BitVec 8)) Unit!11484)

(assert (=> b!165317 (= lt!258589 (arrayUpdatedAtPrefixLemma!244 (buf!4208 thiss!1577) (currentByte!7883 thiss!1577) lt!258591))))

(declare-fun lt!258590 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165317 (= lt!258591 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4677 (buf!4208 thiss!1577)) (currentByte!7883 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7878 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258590)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258590))))))

(assert (=> b!165317 (= lt!258590 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7878 thiss!1577) nBits!511)))))

(declare-fun res!137680 () Bool)

(assert (=> start!35308 (=> (not res!137680) (not e!114407))))

(assert (=> start!35308 (= res!137680 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35308 e!114407))

(assert (=> start!35308 true))

(declare-fun inv!12 (BitStream!6668) Bool)

(assert (=> start!35308 (and (inv!12 thiss!1577) e!114408)))

(assert (= (and start!35308 res!137680) b!165315))

(assert (= (and b!165315 res!137679) b!165316))

(assert (= (and b!165316 res!137681) b!165317))

(assert (= start!35308 b!165318))

(declare-fun m!262751 () Bool)

(assert (=> b!165318 m!262751))

(declare-fun m!262753 () Bool)

(assert (=> b!165315 m!262753))

(declare-fun m!262755 () Bool)

(assert (=> b!165317 m!262755))

(declare-fun m!262757 () Bool)

(assert (=> b!165317 m!262757))

(declare-fun m!262759 () Bool)

(assert (=> b!165317 m!262759))

(declare-fun m!262761 () Bool)

(assert (=> b!165317 m!262761))

(declare-fun m!262763 () Bool)

(assert (=> b!165317 m!262763))

(declare-fun m!262765 () Bool)

(assert (=> b!165317 m!262765))

(declare-fun m!262767 () Bool)

(assert (=> b!165317 m!262767))

(declare-fun m!262769 () Bool)

(assert (=> start!35308 m!262769))

(push 1)

(assert (not b!165315))

(assert (not start!35308))

(assert (not b!165317))

(assert (not b!165318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

