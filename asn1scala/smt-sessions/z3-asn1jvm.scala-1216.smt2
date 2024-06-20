; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34562 () Bool)

(assert start!34562)

(declare-fun b!163936 () Bool)

(declare-fun res!136601 () Bool)

(declare-fun e!113232 () Bool)

(assert (=> b!163936 (=> (not res!136601) (not e!113232))))

(declare-datatypes ((array!8177 0))(
  ( (array!8178 (arr!4583 (Array (_ BitVec 32) (_ BitVec 8))) (size!3662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6480 0))(
  ( (BitStream!6481 (buf!4114 array!8177) (currentByte!7673 (_ BitVec 32)) (currentBit!7668 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6480)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163936 (= res!136601 (validate_offset_bits!1 ((_ sign_extend 32) (size!3662 (buf!4114 thiss!1577))) ((_ sign_extend 32) (currentByte!7673 thiss!1577)) ((_ sign_extend 32) (currentBit!7668 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163939 () Bool)

(declare-fun e!113233 () Bool)

(declare-fun array_inv!3403 (array!8177) Bool)

(assert (=> b!163939 (= e!113233 (array_inv!3403 (buf!4114 thiss!1577)))))

(declare-fun b!163938 () Bool)

(assert (=> b!163938 (= e!113232 (not true))))

(declare-fun lt!257280 () array!8177)

(declare-fun lt!257282 () (_ BitVec 8))

(declare-fun lt!257278 () (_ BitVec 32))

(declare-fun lt!257279 () (_ BitVec 32))

(declare-fun arrayRangesEq!596 (array!8177 array!8177 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163938 (arrayRangesEq!596 lt!257280 (array!8178 (store (store (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7668 thiss!1577)))))))) (bvlshr (bvand lt!257278 #b00000000000000000000000011111111) lt!257279)))) (bvadd #b00000000000000000000000000000001 (currentByte!7673 thiss!1577)) lt!257282) (size!3662 (buf!4114 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7673 thiss!1577)))))

(declare-datatypes ((Unit!11401 0))(
  ( (Unit!11402) )
))
(declare-fun lt!257281 () Unit!11401)

(declare-fun arrayUpdatedAtPrefixLemma!204 (array!8177 (_ BitVec 32) (_ BitVec 8)) Unit!11401)

(assert (=> b!163938 (= lt!257281 (arrayUpdatedAtPrefixLemma!204 lt!257280 (bvadd #b00000000000000000000000000000001 (currentByte!7673 thiss!1577)) lt!257282))))

(assert (=> b!163938 (arrayRangesEq!596 (buf!4114 thiss!1577) (array!8178 (store (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577) (select (store (store (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7668 thiss!1577)))))))) (bvlshr (bvand lt!257278 #b00000000000000000000000011111111) lt!257279)))) (bvadd #b00000000000000000000000000000001 (currentByte!7673 thiss!1577)) lt!257282) (currentByte!7673 thiss!1577))) (size!3662 (buf!4114 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7673 thiss!1577))))

(declare-fun lt!257283 () Unit!11401)

(assert (=> b!163938 (= lt!257283 (arrayUpdatedAtPrefixLemma!204 (buf!4114 thiss!1577) (currentByte!7673 thiss!1577) (select (store (store (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7668 thiss!1577)))))))) (bvlshr (bvand lt!257278 #b00000000000000000000000011111111) lt!257279)))) (bvadd #b00000000000000000000000000000001 (currentByte!7673 thiss!1577)) lt!257282) (currentByte!7673 thiss!1577))))))

(declare-fun lt!257277 () (_ BitVec 32))

(assert (=> b!163938 (= lt!257282 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7668 thiss!1577)))))))) (bvlshr (bvand lt!257278 #b00000000000000000000000011111111) lt!257279)))) (bvadd #b00000000000000000000000000000001 (currentByte!7673 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257277))) (bvshl lt!257278 lt!257277))))))

(assert (=> b!163938 (= lt!257277 (bvsub #b00000000000000000000000000001000 lt!257279))))

(assert (=> b!163938 (= lt!257280 (array!8178 (store (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4583 (buf!4114 thiss!1577)) (currentByte!7673 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7668 thiss!1577)))))))) (bvlshr (bvand lt!257278 #b00000000000000000000000011111111) lt!257279)))) (size!3662 (buf!4114 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163938 (= lt!257278 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163938 (= lt!257279 (bvsub (bvadd (currentBit!7668 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136602 () Bool)

(assert (=> start!34562 (=> (not res!136602) (not e!113232))))

(assert (=> start!34562 (= res!136602 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34562 e!113232))

(assert (=> start!34562 true))

(declare-fun inv!12 (BitStream!6480) Bool)

(assert (=> start!34562 (and (inv!12 thiss!1577) e!113233)))

(declare-fun b!163937 () Bool)

(declare-fun res!136600 () Bool)

(assert (=> b!163937 (=> (not res!136600) (not e!113232))))

(assert (=> b!163937 (= res!136600 (bvsgt (bvadd (currentBit!7668 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34562 res!136602) b!163936))

(assert (= (and b!163936 res!136601) b!163937))

(assert (= (and b!163937 res!136600) b!163938))

(assert (= start!34562 b!163939))

(declare-fun m!260285 () Bool)

(assert (=> b!163936 m!260285))

(declare-fun m!260287 () Bool)

(assert (=> b!163939 m!260287))

(declare-fun m!260289 () Bool)

(assert (=> b!163938 m!260289))

(declare-fun m!260291 () Bool)

(assert (=> b!163938 m!260291))

(declare-fun m!260293 () Bool)

(assert (=> b!163938 m!260293))

(declare-fun m!260295 () Bool)

(assert (=> b!163938 m!260295))

(declare-fun m!260297 () Bool)

(assert (=> b!163938 m!260297))

(declare-fun m!260299 () Bool)

(assert (=> b!163938 m!260299))

(declare-fun m!260301 () Bool)

(assert (=> b!163938 m!260301))

(declare-fun m!260303 () Bool)

(assert (=> b!163938 m!260303))

(declare-fun m!260305 () Bool)

(assert (=> b!163938 m!260305))

(declare-fun m!260307 () Bool)

(assert (=> b!163938 m!260307))

(declare-fun m!260309 () Bool)

(assert (=> b!163938 m!260309))

(declare-fun m!260311 () Bool)

(assert (=> b!163938 m!260311))

(assert (=> b!163938 m!260307))

(declare-fun m!260313 () Bool)

(assert (=> b!163938 m!260313))

(declare-fun m!260315 () Bool)

(assert (=> start!34562 m!260315))

(check-sat (not b!163936) (not start!34562) (not b!163939) (not b!163938))
