; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34542 () Bool)

(assert start!34542)

(declare-fun b!163818 () Bool)

(declare-fun e!113141 () Bool)

(assert (=> b!163818 (= e!113141 (not true))))

(declare-fun lt!257089 () (_ BitVec 32))

(declare-datatypes ((array!8157 0))(
  ( (array!8158 (arr!4573 (Array (_ BitVec 32) (_ BitVec 8))) (size!3652 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6460 0))(
  ( (BitStream!6461 (buf!4104 array!8157) (currentByte!7663 (_ BitVec 32)) (currentBit!7658 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6460)

(declare-fun lt!257088 () (_ BitVec 32))

(declare-fun lt!257090 () (_ BitVec 32))

(declare-fun arrayRangesEq!586 (array!8157 array!8157 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163818 (arrayRangesEq!586 (buf!4104 thiss!1577) (array!8158 (store (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577) (select (store (store (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7658 thiss!1577)))))))) (bvlshr (bvand lt!257090 #b00000000000000000000000011111111) lt!257088)))) (bvadd #b00000000000000000000000000000001 (currentByte!7663 thiss!1577)) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7658 thiss!1577)))))))) (bvlshr (bvand lt!257090 #b00000000000000000000000011111111) lt!257088)))) (bvadd #b00000000000000000000000000000001 (currentByte!7663 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257089))) (bvshl lt!257090 lt!257089)))) (currentByte!7663 thiss!1577))) (size!3652 (buf!4104 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7663 thiss!1577))))

(declare-datatypes ((Unit!11381 0))(
  ( (Unit!11382) )
))
(declare-fun lt!257091 () Unit!11381)

(declare-fun arrayUpdatedAtPrefixLemma!194 (array!8157 (_ BitVec 32) (_ BitVec 8)) Unit!11381)

(assert (=> b!163818 (= lt!257091 (arrayUpdatedAtPrefixLemma!194 (buf!4104 thiss!1577) (currentByte!7663 thiss!1577) (select (store (store (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7658 thiss!1577)))))))) (bvlshr (bvand lt!257090 #b00000000000000000000000011111111) lt!257088)))) (bvadd #b00000000000000000000000000000001 (currentByte!7663 thiss!1577)) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4573 (buf!4104 thiss!1577)) (currentByte!7663 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7658 thiss!1577)))))))) (bvlshr (bvand lt!257090 #b00000000000000000000000011111111) lt!257088)))) (bvadd #b00000000000000000000000000000001 (currentByte!7663 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257089))) (bvshl lt!257090 lt!257089)))) (currentByte!7663 thiss!1577))))))

(assert (=> b!163818 (= lt!257089 (bvsub #b00000000000000000000000000001000 lt!257088))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163818 (= lt!257090 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163818 (= lt!257088 (bvsub (bvadd (currentBit!7658 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136512 () Bool)

(assert (=> start!34542 (=> (not res!136512) (not e!113141))))

(assert (=> start!34542 (= res!136512 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34542 e!113141))

(assert (=> start!34542 true))

(declare-fun e!113143 () Bool)

(declare-fun inv!12 (BitStream!6460) Bool)

(assert (=> start!34542 (and (inv!12 thiss!1577) e!113143)))

(declare-fun b!163817 () Bool)

(declare-fun res!136511 () Bool)

(assert (=> b!163817 (=> (not res!136511) (not e!113141))))

(assert (=> b!163817 (= res!136511 (bvsgt (bvadd (currentBit!7658 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163816 () Bool)

(declare-fun res!136510 () Bool)

(assert (=> b!163816 (=> (not res!136510) (not e!113141))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163816 (= res!136510 (validate_offset_bits!1 ((_ sign_extend 32) (size!3652 (buf!4104 thiss!1577))) ((_ sign_extend 32) (currentByte!7663 thiss!1577)) ((_ sign_extend 32) (currentBit!7658 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163819 () Bool)

(declare-fun array_inv!3393 (array!8157) Bool)

(assert (=> b!163819 (= e!113143 (array_inv!3393 (buf!4104 thiss!1577)))))

(assert (= (and start!34542 res!136512) b!163816))

(assert (= (and b!163816 res!136510) b!163817))

(assert (= (and b!163817 res!136511) b!163818))

(assert (= start!34542 b!163819))

(declare-fun m!259977 () Bool)

(assert (=> b!163818 m!259977))

(declare-fun m!259979 () Bool)

(assert (=> b!163818 m!259979))

(declare-fun m!259981 () Bool)

(assert (=> b!163818 m!259981))

(declare-fun m!259983 () Bool)

(assert (=> b!163818 m!259983))

(declare-fun m!259985 () Bool)

(assert (=> b!163818 m!259985))

(declare-fun m!259987 () Bool)

(assert (=> b!163818 m!259987))

(declare-fun m!259989 () Bool)

(assert (=> b!163818 m!259989))

(declare-fun m!259991 () Bool)

(assert (=> b!163818 m!259991))

(assert (=> b!163818 m!259983))

(declare-fun m!259993 () Bool)

(assert (=> b!163818 m!259993))

(declare-fun m!259995 () Bool)

(assert (=> b!163818 m!259995))

(declare-fun m!259997 () Bool)

(assert (=> b!163818 m!259997))

(declare-fun m!259999 () Bool)

(assert (=> start!34542 m!259999))

(declare-fun m!260001 () Bool)

(assert (=> b!163816 m!260001))

(declare-fun m!260003 () Bool)

(assert (=> b!163819 m!260003))

(push 1)

(assert (not b!163816))

(assert (not b!163818))

(assert (not b!163819))

(assert (not start!34542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

