; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34566 () Bool)

(assert start!34566)

(declare-fun res!136619 () Bool)

(declare-fun e!113249 () Bool)

(assert (=> start!34566 (=> (not res!136619) (not e!113249))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34566 (= res!136619 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34566 e!113249))

(assert (=> start!34566 true))

(declare-datatypes ((array!8181 0))(
  ( (array!8182 (arr!4585 (Array (_ BitVec 32) (_ BitVec 8))) (size!3664 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6484 0))(
  ( (BitStream!6485 (buf!4116 array!8181) (currentByte!7675 (_ BitVec 32)) (currentBit!7670 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6484)

(declare-fun e!113251 () Bool)

(declare-fun inv!12 (BitStream!6484) Bool)

(assert (=> start!34566 (and (inv!12 thiss!1577) e!113251)))

(declare-fun b!163963 () Bool)

(declare-fun array_inv!3405 (array!8181) Bool)

(assert (=> b!163963 (= e!113251 (array_inv!3405 (buf!4116 thiss!1577)))))

(declare-fun b!163960 () Bool)

(declare-fun res!136620 () Bool)

(assert (=> b!163960 (=> (not res!136620) (not e!113249))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163960 (= res!136620 (validate_offset_bits!1 ((_ sign_extend 32) (size!3664 (buf!4116 thiss!1577))) ((_ sign_extend 32) (currentByte!7675 thiss!1577)) ((_ sign_extend 32) (currentBit!7670 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163961 () Bool)

(declare-fun res!136618 () Bool)

(assert (=> b!163961 (=> (not res!136618) (not e!113249))))

(assert (=> b!163961 (= res!136618 (bvsgt (bvadd (currentBit!7670 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163962 () Bool)

(assert (=> b!163962 (= e!113249 (not true))))

(declare-fun lt!257324 () (_ BitVec 32))

(declare-fun lt!257320 () (_ BitVec 8))

(declare-fun lt!257321 () (_ BitVec 32))

(declare-fun lt!257323 () array!8181)

(declare-fun arrayRangesEq!598 (array!8181 array!8181 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163962 (arrayRangesEq!598 lt!257323 (array!8182 (store (store (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7670 thiss!1577)))))))) (bvlshr (bvand lt!257324 #b00000000000000000000000011111111) lt!257321)))) (bvadd #b00000000000000000000000000000001 (currentByte!7675 thiss!1577)) lt!257320) (size!3664 (buf!4116 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7675 thiss!1577)))))

(declare-datatypes ((Unit!11405 0))(
  ( (Unit!11406) )
))
(declare-fun lt!257325 () Unit!11405)

(declare-fun arrayUpdatedAtPrefixLemma!206 (array!8181 (_ BitVec 32) (_ BitVec 8)) Unit!11405)

(assert (=> b!163962 (= lt!257325 (arrayUpdatedAtPrefixLemma!206 lt!257323 (bvadd #b00000000000000000000000000000001 (currentByte!7675 thiss!1577)) lt!257320))))

(assert (=> b!163962 (arrayRangesEq!598 (buf!4116 thiss!1577) (array!8182 (store (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577) (select (store (store (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7670 thiss!1577)))))))) (bvlshr (bvand lt!257324 #b00000000000000000000000011111111) lt!257321)))) (bvadd #b00000000000000000000000000000001 (currentByte!7675 thiss!1577)) lt!257320) (currentByte!7675 thiss!1577))) (size!3664 (buf!4116 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7675 thiss!1577))))

(declare-fun lt!257322 () Unit!11405)

(assert (=> b!163962 (= lt!257322 (arrayUpdatedAtPrefixLemma!206 (buf!4116 thiss!1577) (currentByte!7675 thiss!1577) (select (store (store (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7670 thiss!1577)))))))) (bvlshr (bvand lt!257324 #b00000000000000000000000011111111) lt!257321)))) (bvadd #b00000000000000000000000000000001 (currentByte!7675 thiss!1577)) lt!257320) (currentByte!7675 thiss!1577))))))

(declare-fun lt!257319 () (_ BitVec 32))

(assert (=> b!163962 (= lt!257320 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7670 thiss!1577)))))))) (bvlshr (bvand lt!257324 #b00000000000000000000000011111111) lt!257321)))) (bvadd #b00000000000000000000000000000001 (currentByte!7675 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257319))) (bvshl lt!257324 lt!257319))))))

(assert (=> b!163962 (= lt!257319 (bvsub #b00000000000000000000000000001000 lt!257321))))

(assert (=> b!163962 (= lt!257323 (array!8182 (store (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4585 (buf!4116 thiss!1577)) (currentByte!7675 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7670 thiss!1577)))))))) (bvlshr (bvand lt!257324 #b00000000000000000000000011111111) lt!257321)))) (size!3664 (buf!4116 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163962 (= lt!257324 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163962 (= lt!257321 (bvsub (bvadd (currentBit!7670 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34566 res!136619) b!163960))

(assert (= (and b!163960 res!136620) b!163961))

(assert (= (and b!163961 res!136618) b!163962))

(assert (= start!34566 b!163963))

(declare-fun m!260349 () Bool)

(assert (=> start!34566 m!260349))

(declare-fun m!260351 () Bool)

(assert (=> b!163963 m!260351))

(declare-fun m!260353 () Bool)

(assert (=> b!163960 m!260353))

(declare-fun m!260355 () Bool)

(assert (=> b!163962 m!260355))

(declare-fun m!260357 () Bool)

(assert (=> b!163962 m!260357))

(declare-fun m!260359 () Bool)

(assert (=> b!163962 m!260359))

(declare-fun m!260361 () Bool)

(assert (=> b!163962 m!260361))

(declare-fun m!260363 () Bool)

(assert (=> b!163962 m!260363))

(declare-fun m!260365 () Bool)

(assert (=> b!163962 m!260365))

(declare-fun m!260367 () Bool)

(assert (=> b!163962 m!260367))

(declare-fun m!260369 () Bool)

(assert (=> b!163962 m!260369))

(declare-fun m!260371 () Bool)

(assert (=> b!163962 m!260371))

(assert (=> b!163962 m!260363))

(declare-fun m!260373 () Bool)

(assert (=> b!163962 m!260373))

(declare-fun m!260375 () Bool)

(assert (=> b!163962 m!260375))

(declare-fun m!260377 () Bool)

(assert (=> b!163962 m!260377))

(declare-fun m!260379 () Bool)

(assert (=> b!163962 m!260379))

(push 1)

(assert (not b!163962))

(assert (not b!163960))

(assert (not start!34566))

(assert (not b!163963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

