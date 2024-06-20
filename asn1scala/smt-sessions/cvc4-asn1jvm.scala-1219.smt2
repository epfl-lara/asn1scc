; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34582 () Bool)

(assert start!34582)

(declare-fun res!136692 () Bool)

(declare-fun e!113321 () Bool)

(assert (=> start!34582 (=> (not res!136692) (not e!113321))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34582 (= res!136692 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34582 e!113321))

(assert (=> start!34582 true))

(declare-datatypes ((array!8197 0))(
  ( (array!8198 (arr!4593 (Array (_ BitVec 32) (_ BitVec 8))) (size!3672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6500 0))(
  ( (BitStream!6501 (buf!4124 array!8197) (currentByte!7683 (_ BitVec 32)) (currentBit!7678 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6500)

(declare-fun e!113322 () Bool)

(declare-fun inv!12 (BitStream!6500) Bool)

(assert (=> start!34582 (and (inv!12 thiss!1577) e!113322)))

(declare-fun b!164056 () Bool)

(declare-fun res!136690 () Bool)

(assert (=> b!164056 (=> (not res!136690) (not e!113321))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164056 (= res!136690 (validate_offset_bits!1 ((_ sign_extend 32) (size!3672 (buf!4124 thiss!1577))) ((_ sign_extend 32) (currentByte!7683 thiss!1577)) ((_ sign_extend 32) (currentBit!7678 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164057 () Bool)

(declare-fun res!136691 () Bool)

(assert (=> b!164057 (=> (not res!136691) (not e!113321))))

(assert (=> b!164057 (= res!136691 (bvsgt (bvadd (currentBit!7678 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164058 () Bool)

(declare-fun lt!257520 () (_ BitVec 32))

(assert (=> b!164058 (= e!113321 (not (and (bvsle #b00000000000000000000000000000000 lt!257520) (bvsle lt!257520 #b00000000000000000000000000001000))))))

(declare-fun lt!257513 () array!8197)

(declare-fun arrayRangesEq!606 (array!8197 array!8197 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164058 (arrayRangesEq!606 (buf!4124 thiss!1577) lt!257513 #b00000000000000000000000000000000 (currentByte!7683 thiss!1577))))

(declare-fun lt!257512 () array!8197)

(declare-datatypes ((Unit!11421 0))(
  ( (Unit!11422) )
))
(declare-fun lt!257511 () Unit!11421)

(declare-fun arrayRangesEqTransitive!153 (array!8197 array!8197 array!8197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11421)

(assert (=> b!164058 (= lt!257511 (arrayRangesEqTransitive!153 (buf!4124 thiss!1577) lt!257512 lt!257513 #b00000000000000000000000000000000 (currentByte!7683 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7683 thiss!1577))))))

(assert (=> b!164058 (arrayRangesEq!606 lt!257512 lt!257513 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7683 thiss!1577)))))

(declare-fun lt!257516 () Unit!11421)

(declare-fun lt!257514 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!214 (array!8197 (_ BitVec 32) (_ BitVec 8)) Unit!11421)

(assert (=> b!164058 (= lt!257516 (arrayUpdatedAtPrefixLemma!214 lt!257512 (bvadd #b00000000000000000000000000000001 (currentByte!7683 thiss!1577)) lt!257514))))

(declare-fun lt!257519 () (_ BitVec 8))

(assert (=> b!164058 (arrayRangesEq!606 (buf!4124 thiss!1577) (array!8198 (store (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577) lt!257519) (size!3672 (buf!4124 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7683 thiss!1577))))

(declare-fun lt!257517 () Unit!11421)

(assert (=> b!164058 (= lt!257517 (arrayUpdatedAtPrefixLemma!214 (buf!4124 thiss!1577) (currentByte!7683 thiss!1577) lt!257519))))

(declare-fun lt!257515 () (_ BitVec 32))

(assert (=> b!164058 (= lt!257519 (select (store (store (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7678 thiss!1577)))))))) (bvlshr (bvand lt!257515 #b00000000000000000000000011111111) lt!257520)))) (bvadd #b00000000000000000000000000000001 (currentByte!7683 thiss!1577)) lt!257514) (currentByte!7683 thiss!1577)))))

(assert (=> b!164058 (= lt!257513 (array!8198 (store (store (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7678 thiss!1577)))))))) (bvlshr (bvand lt!257515 #b00000000000000000000000011111111) lt!257520)))) (bvadd #b00000000000000000000000000000001 (currentByte!7683 thiss!1577)) lt!257514) (size!3672 (buf!4124 thiss!1577))))))

(declare-fun lt!257518 () (_ BitVec 32))

(assert (=> b!164058 (= lt!257514 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7678 thiss!1577)))))))) (bvlshr (bvand lt!257515 #b00000000000000000000000011111111) lt!257520)))) (bvadd #b00000000000000000000000000000001 (currentByte!7683 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257518))) (bvshl lt!257515 lt!257518))))))

(assert (=> b!164058 (= lt!257518 (bvsub #b00000000000000000000000000001000 lt!257520))))

(assert (=> b!164058 (= lt!257512 (array!8198 (store (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4593 (buf!4124 thiss!1577)) (currentByte!7683 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7678 thiss!1577)))))))) (bvlshr (bvand lt!257515 #b00000000000000000000000011111111) lt!257520)))) (size!3672 (buf!4124 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164058 (= lt!257515 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164058 (= lt!257520 (bvsub (bvadd (currentBit!7678 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164059 () Bool)

(declare-fun array_inv!3413 (array!8197) Bool)

(assert (=> b!164059 (= e!113322 (array_inv!3413 (buf!4124 thiss!1577)))))

(assert (= (and start!34582 res!136692) b!164056))

(assert (= (and b!164056 res!136690) b!164057))

(assert (= (and b!164057 res!136691) b!164058))

(assert (= start!34582 b!164059))

(declare-fun m!260613 () Bool)

(assert (=> start!34582 m!260613))

(declare-fun m!260615 () Bool)

(assert (=> b!164056 m!260615))

(declare-fun m!260617 () Bool)

(assert (=> b!164058 m!260617))

(declare-fun m!260619 () Bool)

(assert (=> b!164058 m!260619))

(declare-fun m!260621 () Bool)

(assert (=> b!164058 m!260621))

(declare-fun m!260623 () Bool)

(assert (=> b!164058 m!260623))

(declare-fun m!260625 () Bool)

(assert (=> b!164058 m!260625))

(declare-fun m!260627 () Bool)

(assert (=> b!164058 m!260627))

(declare-fun m!260629 () Bool)

(assert (=> b!164058 m!260629))

(declare-fun m!260631 () Bool)

(assert (=> b!164058 m!260631))

(declare-fun m!260633 () Bool)

(assert (=> b!164058 m!260633))

(declare-fun m!260635 () Bool)

(assert (=> b!164058 m!260635))

(declare-fun m!260637 () Bool)

(assert (=> b!164058 m!260637))

(declare-fun m!260639 () Bool)

(assert (=> b!164058 m!260639))

(declare-fun m!260641 () Bool)

(assert (=> b!164058 m!260641))

(declare-fun m!260643 () Bool)

(assert (=> b!164058 m!260643))

(declare-fun m!260645 () Bool)

(assert (=> b!164058 m!260645))

(declare-fun m!260647 () Bool)

(assert (=> b!164059 m!260647))

(push 1)

(assert (not b!164059))

(assert (not b!164058))

(assert (not start!34582))

(assert (not b!164056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

