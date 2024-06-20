; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36250 () Bool)

(assert start!36250)

(declare-fun res!139130 () Bool)

(declare-fun e!115902 () Bool)

(assert (=> start!36250 (=> (not res!139130) (not e!115902))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36250 (= res!139130 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36250 e!115902))

(assert (=> start!36250 true))

(declare-datatypes ((array!8641 0))(
  ( (array!8642 (arr!4760 (Array (_ BitVec 32) (_ BitVec 8))) (size!3839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6834 0))(
  ( (BitStream!6835 (buf!4291 array!8641) (currentByte!8121 (_ BitVec 32)) (currentBit!8116 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6834)

(declare-fun e!115900 () Bool)

(declare-fun inv!12 (BitStream!6834) Bool)

(assert (=> start!36250 (and (inv!12 thiss!1577) e!115900)))

(declare-fun b!167119 () Bool)

(declare-fun res!139128 () Bool)

(assert (=> b!167119 (=> (not res!139128) (not e!115902))))

(assert (=> b!167119 (= res!139128 (bvsgt (bvadd (currentBit!8116 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167118 () Bool)

(declare-fun res!139129 () Bool)

(assert (=> b!167118 (=> (not res!139129) (not e!115902))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167118 (= res!139129 (validate_offset_bits!1 ((_ sign_extend 32) (size!3839 (buf!4291 thiss!1577))) ((_ sign_extend 32) (currentByte!8121 thiss!1577)) ((_ sign_extend 32) (currentBit!8116 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167121 () Bool)

(declare-fun array_inv!3580 (array!8641) Bool)

(assert (=> b!167121 (= e!115900 (array_inv!3580 (buf!4291 thiss!1577)))))

(declare-fun b!167120 () Bool)

(assert (=> b!167120 (= e!115902 (not true))))

(declare-fun lt!260137 () (_ BitVec 8))

(declare-fun lt!260136 () (_ BitVec 32))

(declare-fun lt!260140 () (_ BitVec 32))

(declare-fun lt!260138 () array!8641)

(declare-fun arrayRangesEq!668 (array!8641 array!8641 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167120 (arrayRangesEq!668 lt!260138 (array!8642 (store (store (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8116 thiss!1577)))))))) (bvlshr (bvand lt!260136 #b00000000000000000000000011111111) lt!260140)))) (bvadd #b00000000000000000000000000000001 (currentByte!8121 thiss!1577)) lt!260137) (size!3839 (buf!4291 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8121 thiss!1577)))))

(declare-datatypes ((Unit!11626 0))(
  ( (Unit!11627) )
))
(declare-fun lt!260135 () Unit!11626)

(declare-fun arrayUpdatedAtPrefixLemma!276 (array!8641 (_ BitVec 32) (_ BitVec 8)) Unit!11626)

(assert (=> b!167120 (= lt!260135 (arrayUpdatedAtPrefixLemma!276 lt!260138 (bvadd #b00000000000000000000000000000001 (currentByte!8121 thiss!1577)) lt!260137))))

(assert (=> b!167120 (arrayRangesEq!668 (buf!4291 thiss!1577) (array!8642 (store (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577) (select (store (store (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8116 thiss!1577)))))))) (bvlshr (bvand lt!260136 #b00000000000000000000000011111111) lt!260140)))) (bvadd #b00000000000000000000000000000001 (currentByte!8121 thiss!1577)) lt!260137) (currentByte!8121 thiss!1577))) (size!3839 (buf!4291 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8121 thiss!1577))))

(declare-fun lt!260139 () Unit!11626)

(assert (=> b!167120 (= lt!260139 (arrayUpdatedAtPrefixLemma!276 (buf!4291 thiss!1577) (currentByte!8121 thiss!1577) (select (store (store (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8116 thiss!1577)))))))) (bvlshr (bvand lt!260136 #b00000000000000000000000011111111) lt!260140)))) (bvadd #b00000000000000000000000000000001 (currentByte!8121 thiss!1577)) lt!260137) (currentByte!8121 thiss!1577))))))

(declare-fun lt!260141 () (_ BitVec 32))

(assert (=> b!167120 (= lt!260137 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8116 thiss!1577)))))))) (bvlshr (bvand lt!260136 #b00000000000000000000000011111111) lt!260140)))) (bvadd #b00000000000000000000000000000001 (currentByte!8121 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260141))) (bvshl lt!260136 lt!260141))))))

(assert (=> b!167120 (= lt!260141 (bvsub #b00000000000000000000000000001000 lt!260140))))

(assert (=> b!167120 (= lt!260138 (array!8642 (store (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4760 (buf!4291 thiss!1577)) (currentByte!8121 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8116 thiss!1577)))))))) (bvlshr (bvand lt!260136 #b00000000000000000000000011111111) lt!260140)))) (size!3839 (buf!4291 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167120 (= lt!260136 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167120 (= lt!260140 (bvsub (bvadd (currentBit!8116 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36250 res!139130) b!167118))

(assert (= (and b!167118 res!139129) b!167119))

(assert (= (and b!167119 res!139128) b!167120))

(assert (= start!36250 b!167121))

(declare-fun m!265693 () Bool)

(assert (=> start!36250 m!265693))

(declare-fun m!265695 () Bool)

(assert (=> b!167118 m!265695))

(declare-fun m!265697 () Bool)

(assert (=> b!167121 m!265697))

(declare-fun m!265699 () Bool)

(assert (=> b!167120 m!265699))

(declare-fun m!265701 () Bool)

(assert (=> b!167120 m!265701))

(declare-fun m!265703 () Bool)

(assert (=> b!167120 m!265703))

(declare-fun m!265705 () Bool)

(assert (=> b!167120 m!265705))

(declare-fun m!265707 () Bool)

(assert (=> b!167120 m!265707))

(declare-fun m!265709 () Bool)

(assert (=> b!167120 m!265709))

(declare-fun m!265711 () Bool)

(assert (=> b!167120 m!265711))

(assert (=> b!167120 m!265701))

(declare-fun m!265713 () Bool)

(assert (=> b!167120 m!265713))

(declare-fun m!265715 () Bool)

(assert (=> b!167120 m!265715))

(declare-fun m!265717 () Bool)

(assert (=> b!167120 m!265717))

(declare-fun m!265719 () Bool)

(assert (=> b!167120 m!265719))

(declare-fun m!265721 () Bool)

(assert (=> b!167120 m!265721))

(declare-fun m!265723 () Bool)

(assert (=> b!167120 m!265723))

(check-sat (not b!167118) (not start!36250) (not b!167120) (not b!167121))
