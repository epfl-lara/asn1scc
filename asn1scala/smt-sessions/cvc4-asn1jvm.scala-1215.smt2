; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34558 () Bool)

(assert start!34558)

(declare-fun b!163915 () Bool)

(declare-fun e!113213 () Bool)

(declare-datatypes ((array!8173 0))(
  ( (array!8174 (arr!4581 (Array (_ BitVec 32) (_ BitVec 8))) (size!3660 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6476 0))(
  ( (BitStream!6477 (buf!4112 array!8173) (currentByte!7671 (_ BitVec 32)) (currentBit!7666 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6476)

(declare-fun array_inv!3401 (array!8173) Bool)

(assert (=> b!163915 (= e!113213 (array_inv!3401 (buf!4112 thiss!1577)))))

(declare-fun res!136582 () Bool)

(declare-fun e!113214 () Bool)

(assert (=> start!34558 (=> (not res!136582) (not e!113214))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34558 (= res!136582 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34558 e!113214))

(assert (=> start!34558 true))

(declare-fun inv!12 (BitStream!6476) Bool)

(assert (=> start!34558 (and (inv!12 thiss!1577) e!113213)))

(declare-fun b!163914 () Bool)

(assert (=> b!163914 (= e!113214 (not true))))

(declare-fun lt!257235 () (_ BitVec 32))

(declare-fun lt!257238 () (_ BitVec 8))

(declare-fun lt!257240 () (_ BitVec 32))

(declare-fun lt!257239 () array!8173)

(declare-fun arrayRangesEq!594 (array!8173 array!8173 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163914 (arrayRangesEq!594 lt!257239 (array!8174 (store (store (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7666 thiss!1577)))))))) (bvlshr (bvand lt!257235 #b00000000000000000000000011111111) lt!257240)))) (bvadd #b00000000000000000000000000000001 (currentByte!7671 thiss!1577)) lt!257238) (size!3660 (buf!4112 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7671 thiss!1577)))))

(declare-datatypes ((Unit!11397 0))(
  ( (Unit!11398) )
))
(declare-fun lt!257237 () Unit!11397)

(declare-fun arrayUpdatedAtPrefixLemma!202 (array!8173 (_ BitVec 32) (_ BitVec 8)) Unit!11397)

(assert (=> b!163914 (= lt!257237 (arrayUpdatedAtPrefixLemma!202 lt!257239 (bvadd #b00000000000000000000000000000001 (currentByte!7671 thiss!1577)) lt!257238))))

(assert (=> b!163914 (arrayRangesEq!594 (buf!4112 thiss!1577) (array!8174 (store (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577) (select (store (store (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7666 thiss!1577)))))))) (bvlshr (bvand lt!257235 #b00000000000000000000000011111111) lt!257240)))) (bvadd #b00000000000000000000000000000001 (currentByte!7671 thiss!1577)) lt!257238) (currentByte!7671 thiss!1577))) (size!3660 (buf!4112 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7671 thiss!1577))))

(declare-fun lt!257241 () Unit!11397)

(assert (=> b!163914 (= lt!257241 (arrayUpdatedAtPrefixLemma!202 (buf!4112 thiss!1577) (currentByte!7671 thiss!1577) (select (store (store (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7666 thiss!1577)))))))) (bvlshr (bvand lt!257235 #b00000000000000000000000011111111) lt!257240)))) (bvadd #b00000000000000000000000000000001 (currentByte!7671 thiss!1577)) lt!257238) (currentByte!7671 thiss!1577))))))

(declare-fun lt!257236 () (_ BitVec 32))

(assert (=> b!163914 (= lt!257238 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7666 thiss!1577)))))))) (bvlshr (bvand lt!257235 #b00000000000000000000000011111111) lt!257240)))) (bvadd #b00000000000000000000000000000001 (currentByte!7671 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257236))) (bvshl lt!257235 lt!257236))))))

(assert (=> b!163914 (= lt!257236 (bvsub #b00000000000000000000000000001000 lt!257240))))

(assert (=> b!163914 (= lt!257239 (array!8174 (store (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4581 (buf!4112 thiss!1577)) (currentByte!7671 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7666 thiss!1577)))))))) (bvlshr (bvand lt!257235 #b00000000000000000000000011111111) lt!257240)))) (size!3660 (buf!4112 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163914 (= lt!257235 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163914 (= lt!257240 (bvsub (bvadd (currentBit!7666 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163912 () Bool)

(declare-fun res!136584 () Bool)

(assert (=> b!163912 (=> (not res!136584) (not e!113214))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163912 (= res!136584 (validate_offset_bits!1 ((_ sign_extend 32) (size!3660 (buf!4112 thiss!1577))) ((_ sign_extend 32) (currentByte!7671 thiss!1577)) ((_ sign_extend 32) (currentBit!7666 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163913 () Bool)

(declare-fun res!136583 () Bool)

(assert (=> b!163913 (=> (not res!136583) (not e!113214))))

(assert (=> b!163913 (= res!136583 (bvsgt (bvadd (currentBit!7666 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34558 res!136582) b!163912))

(assert (= (and b!163912 res!136584) b!163913))

(assert (= (and b!163913 res!136583) b!163914))

(assert (= start!34558 b!163915))

(declare-fun m!260221 () Bool)

(assert (=> b!163915 m!260221))

(declare-fun m!260223 () Bool)

(assert (=> start!34558 m!260223))

(declare-fun m!260225 () Bool)

(assert (=> b!163914 m!260225))

(declare-fun m!260227 () Bool)

(assert (=> b!163914 m!260227))

(declare-fun m!260229 () Bool)

(assert (=> b!163914 m!260229))

(declare-fun m!260231 () Bool)

(assert (=> b!163914 m!260231))

(declare-fun m!260233 () Bool)

(assert (=> b!163914 m!260233))

(declare-fun m!260235 () Bool)

(assert (=> b!163914 m!260235))

(declare-fun m!260237 () Bool)

(assert (=> b!163914 m!260237))

(assert (=> b!163914 m!260225))

(declare-fun m!260239 () Bool)

(assert (=> b!163914 m!260239))

(declare-fun m!260241 () Bool)

(assert (=> b!163914 m!260241))

(declare-fun m!260243 () Bool)

(assert (=> b!163914 m!260243))

(declare-fun m!260245 () Bool)

(assert (=> b!163914 m!260245))

(declare-fun m!260247 () Bool)

(assert (=> b!163914 m!260247))

(declare-fun m!260249 () Bool)

(assert (=> b!163914 m!260249))

(declare-fun m!260251 () Bool)

(assert (=> b!163912 m!260251))

(push 1)

(assert (not start!34558))

(assert (not b!163912))

(assert (not b!163914))

(assert (not b!163915))

(check-sat)

(pop 1)

