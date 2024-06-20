; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34578 () Bool)

(assert start!34578)

(declare-fun b!164035 () Bool)

(declare-fun e!113304 () Bool)

(declare-datatypes ((array!8193 0))(
  ( (array!8194 (arr!4591 (Array (_ BitVec 32) (_ BitVec 8))) (size!3670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6496 0))(
  ( (BitStream!6497 (buf!4122 array!8193) (currentByte!7681 (_ BitVec 32)) (currentBit!7676 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6496)

(declare-fun array_inv!3411 (array!8193) Bool)

(assert (=> b!164035 (= e!113304 (array_inv!3411 (buf!4122 thiss!1577)))))

(declare-fun b!164032 () Bool)

(declare-fun res!136673 () Bool)

(declare-fun e!113303 () Bool)

(assert (=> b!164032 (=> (not res!136673) (not e!113303))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164032 (= res!136673 (validate_offset_bits!1 ((_ sign_extend 32) (size!3670 (buf!4122 thiss!1577))) ((_ sign_extend 32) (currentByte!7681 thiss!1577)) ((_ sign_extend 32) (currentBit!7676 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164033 () Bool)

(declare-fun res!136674 () Bool)

(assert (=> b!164033 (=> (not res!136674) (not e!113303))))

(assert (=> b!164033 (= res!136674 (bvsgt (bvadd (currentBit!7676 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164034 () Bool)

(declare-fun lt!257459 () (_ BitVec 32))

(assert (=> b!164034 (= e!113303 (not (and (bvsle #b00000000000000000000000000000000 lt!257459) (bvsle lt!257459 #b00000000000000000000000000001000))))))

(declare-fun lt!257453 () array!8193)

(declare-fun arrayRangesEq!604 (array!8193 array!8193 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164034 (arrayRangesEq!604 (buf!4122 thiss!1577) lt!257453 #b00000000000000000000000000000000 (currentByte!7681 thiss!1577))))

(declare-datatypes ((Unit!11417 0))(
  ( (Unit!11418) )
))
(declare-fun lt!257458 () Unit!11417)

(declare-fun lt!257451 () array!8193)

(declare-fun arrayRangesEqTransitive!151 (array!8193 array!8193 array!8193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11417)

(assert (=> b!164034 (= lt!257458 (arrayRangesEqTransitive!151 (buf!4122 thiss!1577) lt!257451 lt!257453 #b00000000000000000000000000000000 (currentByte!7681 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7681 thiss!1577))))))

(assert (=> b!164034 (arrayRangesEq!604 lt!257451 lt!257453 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7681 thiss!1577)))))

(declare-fun lt!257455 () Unit!11417)

(declare-fun lt!257460 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!212 (array!8193 (_ BitVec 32) (_ BitVec 8)) Unit!11417)

(assert (=> b!164034 (= lt!257455 (arrayUpdatedAtPrefixLemma!212 lt!257451 (bvadd #b00000000000000000000000000000001 (currentByte!7681 thiss!1577)) lt!257460))))

(declare-fun lt!257456 () (_ BitVec 8))

(assert (=> b!164034 (arrayRangesEq!604 (buf!4122 thiss!1577) (array!8194 (store (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577) lt!257456) (size!3670 (buf!4122 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7681 thiss!1577))))

(declare-fun lt!257457 () Unit!11417)

(assert (=> b!164034 (= lt!257457 (arrayUpdatedAtPrefixLemma!212 (buf!4122 thiss!1577) (currentByte!7681 thiss!1577) lt!257456))))

(declare-fun lt!257454 () (_ BitVec 32))

(assert (=> b!164034 (= lt!257456 (select (store (store (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7676 thiss!1577)))))))) (bvlshr (bvand lt!257454 #b00000000000000000000000011111111) lt!257459)))) (bvadd #b00000000000000000000000000000001 (currentByte!7681 thiss!1577)) lt!257460) (currentByte!7681 thiss!1577)))))

(assert (=> b!164034 (= lt!257453 (array!8194 (store (store (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7676 thiss!1577)))))))) (bvlshr (bvand lt!257454 #b00000000000000000000000011111111) lt!257459)))) (bvadd #b00000000000000000000000000000001 (currentByte!7681 thiss!1577)) lt!257460) (size!3670 (buf!4122 thiss!1577))))))

(declare-fun lt!257452 () (_ BitVec 32))

(assert (=> b!164034 (= lt!257460 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7676 thiss!1577)))))))) (bvlshr (bvand lt!257454 #b00000000000000000000000011111111) lt!257459)))) (bvadd #b00000000000000000000000000000001 (currentByte!7681 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257452))) (bvshl lt!257454 lt!257452))))))

(assert (=> b!164034 (= lt!257452 (bvsub #b00000000000000000000000000001000 lt!257459))))

(assert (=> b!164034 (= lt!257451 (array!8194 (store (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4591 (buf!4122 thiss!1577)) (currentByte!7681 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7676 thiss!1577)))))))) (bvlshr (bvand lt!257454 #b00000000000000000000000011111111) lt!257459)))) (size!3670 (buf!4122 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164034 (= lt!257454 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164034 (= lt!257459 (bvsub (bvadd (currentBit!7676 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136672 () Bool)

(assert (=> start!34578 (=> (not res!136672) (not e!113303))))

(assert (=> start!34578 (= res!136672 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34578 e!113303))

(assert (=> start!34578 true))

(declare-fun inv!12 (BitStream!6496) Bool)

(assert (=> start!34578 (and (inv!12 thiss!1577) e!113304)))

(assert (= (and start!34578 res!136672) b!164032))

(assert (= (and b!164032 res!136673) b!164033))

(assert (= (and b!164033 res!136674) b!164034))

(assert (= start!34578 b!164035))

(declare-fun m!260541 () Bool)

(assert (=> b!164035 m!260541))

(declare-fun m!260543 () Bool)

(assert (=> b!164032 m!260543))

(declare-fun m!260545 () Bool)

(assert (=> b!164034 m!260545))

(declare-fun m!260547 () Bool)

(assert (=> b!164034 m!260547))

(declare-fun m!260549 () Bool)

(assert (=> b!164034 m!260549))

(declare-fun m!260551 () Bool)

(assert (=> b!164034 m!260551))

(declare-fun m!260553 () Bool)

(assert (=> b!164034 m!260553))

(declare-fun m!260555 () Bool)

(assert (=> b!164034 m!260555))

(declare-fun m!260557 () Bool)

(assert (=> b!164034 m!260557))

(declare-fun m!260559 () Bool)

(assert (=> b!164034 m!260559))

(declare-fun m!260561 () Bool)

(assert (=> b!164034 m!260561))

(declare-fun m!260563 () Bool)

(assert (=> b!164034 m!260563))

(declare-fun m!260565 () Bool)

(assert (=> b!164034 m!260565))

(declare-fun m!260567 () Bool)

(assert (=> b!164034 m!260567))

(declare-fun m!260569 () Bool)

(assert (=> b!164034 m!260569))

(declare-fun m!260571 () Bool)

(assert (=> b!164034 m!260571))

(declare-fun m!260573 () Bool)

(assert (=> b!164034 m!260573))

(declare-fun m!260575 () Bool)

(assert (=> start!34578 m!260575))

(push 1)

(assert (not b!164035))

(assert (not b!164034))

(assert (not start!34578))

(assert (not b!164032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56583 () Bool)

