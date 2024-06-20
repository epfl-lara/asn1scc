; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34616 () Bool)

(assert start!34616)

(declare-fun b!164132 () Bool)

(declare-fun e!113389 () Bool)

(declare-fun lt!257622 () (_ BitVec 32))

(declare-datatypes ((array!8205 0))(
  ( (array!8206 (arr!4596 (Array (_ BitVec 32) (_ BitVec 8))) (size!3675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6506 0))(
  ( (BitStream!6507 (buf!4127 array!8205) (currentByte!7689 (_ BitVec 32)) (currentBit!7684 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6506)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164132 (= e!113389 (invariant!0 lt!257622 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) (size!3675 (buf!4127 thiss!1577))))))

(declare-fun b!164133 () Bool)

(declare-fun e!113388 () Bool)

(declare-fun array_inv!3416 (array!8205) Bool)

(assert (=> b!164133 (= e!113388 (array_inv!3416 (buf!4127 thiss!1577)))))

(declare-fun b!164134 () Bool)

(declare-fun res!136759 () Bool)

(declare-fun e!113390 () Bool)

(assert (=> b!164134 (=> (not res!136759) (not e!113390))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164134 (= res!136759 (bvsgt (bvadd (currentBit!7684 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164135 () Bool)

(declare-fun res!136758 () Bool)

(assert (=> b!164135 (=> (not res!136758) (not e!113390))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164135 (= res!136758 (validate_offset_bits!1 ((_ sign_extend 32) (size!3675 (buf!4127 thiss!1577))) ((_ sign_extend 32) (currentByte!7689 thiss!1577)) ((_ sign_extend 32) (currentBit!7684 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164136 () Bool)

(assert (=> b!164136 (= e!113390 (not e!113389))))

(declare-fun res!136760 () Bool)

(assert (=> b!164136 (=> res!136760 e!113389)))

(declare-fun lt!257623 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164136 (= res!136760 (not (byteRangesEq!0 (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577)) lt!257623 #b00000000000000000000000000000000 lt!257622)))))

(declare-fun lt!257621 () array!8205)

(declare-fun arrayRangesEq!609 (array!8205 array!8205 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164136 (arrayRangesEq!609 (buf!4127 thiss!1577) lt!257621 #b00000000000000000000000000000000 (currentByte!7689 thiss!1577))))

(declare-fun lt!257619 () array!8205)

(declare-datatypes ((Unit!11427 0))(
  ( (Unit!11428) )
))
(declare-fun lt!257620 () Unit!11427)

(declare-fun arrayRangesEqTransitive!156 (array!8205 array!8205 array!8205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11427)

(assert (=> b!164136 (= lt!257620 (arrayRangesEqTransitive!156 (buf!4127 thiss!1577) lt!257619 lt!257621 #b00000000000000000000000000000000 (currentByte!7689 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))))))

(assert (=> b!164136 (arrayRangesEq!609 lt!257619 lt!257621 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)))))

(declare-fun lt!257624 () Unit!11427)

(declare-fun lt!257616 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!217 (array!8205 (_ BitVec 32) (_ BitVec 8)) Unit!11427)

(assert (=> b!164136 (= lt!257624 (arrayUpdatedAtPrefixLemma!217 lt!257619 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) lt!257616))))

(assert (=> b!164136 (arrayRangesEq!609 (buf!4127 thiss!1577) (array!8206 (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) lt!257623) (size!3675 (buf!4127 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7689 thiss!1577))))

(declare-fun lt!257618 () Unit!11427)

(assert (=> b!164136 (= lt!257618 (arrayUpdatedAtPrefixLemma!217 (buf!4127 thiss!1577) (currentByte!7689 thiss!1577) lt!257623))))

(declare-fun lt!257617 () (_ BitVec 32))

(assert (=> b!164136 (= lt!257623 (select (store (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7684 thiss!1577)))))))) (bvlshr (bvand lt!257617 #b00000000000000000000000011111111) lt!257622)))) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) lt!257616) (currentByte!7689 thiss!1577)))))

(assert (=> b!164136 (= lt!257621 (array!8206 (store (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7684 thiss!1577)))))))) (bvlshr (bvand lt!257617 #b00000000000000000000000011111111) lt!257622)))) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) lt!257616) (size!3675 (buf!4127 thiss!1577))))))

(declare-fun lt!257615 () (_ BitVec 32))

(assert (=> b!164136 (= lt!257616 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7684 thiss!1577)))))))) (bvlshr (bvand lt!257617 #b00000000000000000000000011111111) lt!257622)))) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257615))) (bvshl lt!257617 lt!257615))))))

(assert (=> b!164136 (= lt!257615 (bvsub #b00000000000000000000000000001000 lt!257622))))

(assert (=> b!164136 (= lt!257619 (array!8206 (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7684 thiss!1577)))))))) (bvlshr (bvand lt!257617 #b00000000000000000000000011111111) lt!257622)))) (size!3675 (buf!4127 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164136 (= lt!257617 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164136 (= lt!257622 (bvsub (bvadd (currentBit!7684 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136757 () Bool)

(assert (=> start!34616 (=> (not res!136757) (not e!113390))))

(assert (=> start!34616 (= res!136757 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34616 e!113390))

(assert (=> start!34616 true))

(declare-fun inv!12 (BitStream!6506) Bool)

(assert (=> start!34616 (and (inv!12 thiss!1577) e!113388)))

(assert (= (and start!34616 res!136757) b!164135))

(assert (= (and b!164135 res!136758) b!164134))

(assert (= (and b!164134 res!136759) b!164136))

(assert (= (and b!164136 (not res!136760)) b!164132))

(assert (= start!34616 b!164133))

(declare-fun m!260789 () Bool)

(assert (=> b!164132 m!260789))

(declare-fun m!260791 () Bool)

(assert (=> b!164135 m!260791))

(declare-fun m!260793 () Bool)

(assert (=> b!164133 m!260793))

(declare-fun m!260795 () Bool)

(assert (=> b!164136 m!260795))

(declare-fun m!260797 () Bool)

(assert (=> b!164136 m!260797))

(declare-fun m!260799 () Bool)

(assert (=> b!164136 m!260799))

(declare-fun m!260801 () Bool)

(assert (=> b!164136 m!260801))

(declare-fun m!260803 () Bool)

(assert (=> b!164136 m!260803))

(declare-fun m!260805 () Bool)

(assert (=> b!164136 m!260805))

(declare-fun m!260807 () Bool)

(assert (=> b!164136 m!260807))

(declare-fun m!260809 () Bool)

(assert (=> b!164136 m!260809))

(declare-fun m!260811 () Bool)

(assert (=> b!164136 m!260811))

(declare-fun m!260813 () Bool)

(assert (=> b!164136 m!260813))

(declare-fun m!260815 () Bool)

(assert (=> b!164136 m!260815))

(declare-fun m!260817 () Bool)

(assert (=> b!164136 m!260817))

(assert (=> b!164136 m!260799))

(declare-fun m!260819 () Bool)

(assert (=> b!164136 m!260819))

(declare-fun m!260821 () Bool)

(assert (=> b!164136 m!260821))

(declare-fun m!260823 () Bool)

(assert (=> b!164136 m!260823))

(declare-fun m!260825 () Bool)

(assert (=> b!164136 m!260825))

(declare-fun m!260827 () Bool)

(assert (=> start!34616 m!260827))

(push 1)

(assert (not start!34616))

(assert (not b!164133))

(assert (not b!164135))

(assert (not b!164132))

(assert (not b!164136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56603 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56603 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3675 (buf!4127 thiss!1577))) ((_ sign_extend 32) (currentByte!7689 thiss!1577)) ((_ sign_extend 32) (currentBit!7684 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3675 (buf!4127 thiss!1577))) ((_ sign_extend 32) (currentByte!7689 thiss!1577)) ((_ sign_extend 32) (currentBit!7684 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14026 () Bool)

(assert (= bs!14026 d!56603))

(declare-fun m!260831 () Bool)

(assert (=> bs!14026 m!260831))

(assert (=> b!164135 d!56603))

(declare-fun d!56605 () Bool)

(assert (=> d!56605 (= (array_inv!3416 (buf!4127 thiss!1577)) (bvsge (size!3675 (buf!4127 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164133 d!56605))

(declare-fun d!56607 () Bool)

(assert (=> d!56607 (= (invariant!0 lt!257622 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) (size!3675 (buf!4127 thiss!1577))) (and (bvsge lt!257622 #b00000000000000000000000000000000) (bvslt lt!257622 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) (size!3675 (buf!4127 thiss!1577))) (and (= lt!257622 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) (size!3675 (buf!4127 thiss!1577)))))))))

(assert (=> b!164132 d!56607))

(declare-fun d!56611 () Bool)

(assert (=> d!56611 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7684 thiss!1577) (currentByte!7689 thiss!1577) (size!3675 (buf!4127 thiss!1577))))))

(declare-fun bs!14027 () Bool)

(assert (= bs!14027 d!56611))

(declare-fun m!260839 () Bool)

(assert (=> bs!14027 m!260839))

(assert (=> start!34616 d!56611))

(declare-fun d!56613 () Bool)

(declare-fun e!113400 () Bool)

(assert (=> d!56613 e!113400))

(declare-fun res!136769 () Bool)

(assert (=> d!56613 (=> (not res!136769) (not e!113400))))

(assert (=> d!56613 (= res!136769 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) (size!3675 lt!257619))))))

(declare-fun lt!257627 () Unit!11427)

(declare-fun choose!198 (array!8205 (_ BitVec 32) (_ BitVec 8)) Unit!11427)

(assert (=> d!56613 (= lt!257627 (choose!198 lt!257619 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) lt!257616))))

(assert (=> d!56613 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) (size!3675 lt!257619)))))

(assert (=> d!56613 (= (arrayUpdatedAtPrefixLemma!217 lt!257619 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) lt!257616) lt!257627)))

(declare-fun b!164145 () Bool)

(assert (=> b!164145 (= e!113400 (arrayRangesEq!609 lt!257619 (array!8206 (store (arr!4596 lt!257619) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577)) lt!257616) (size!3675 lt!257619)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))))))

(assert (= (and d!56613 res!136769) b!164145))

(declare-fun m!260849 () Bool)

(assert (=> d!56613 m!260849))

(declare-fun m!260851 () Bool)

(assert (=> b!164145 m!260851))

(declare-fun m!260853 () Bool)

(assert (=> b!164145 m!260853))

(assert (=> b!164136 d!56613))

(declare-fun d!56619 () Bool)

(declare-fun res!136778 () Bool)

(declare-fun e!113409 () Bool)

(assert (=> d!56619 (=> res!136778 e!113409)))

(assert (=> d!56619 (= res!136778 (= #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)))))

(assert (=> d!56619 (= (arrayRangesEq!609 (buf!4127 thiss!1577) (array!8206 (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) lt!257623) (size!3675 (buf!4127 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)) e!113409)))

(declare-fun b!164154 () Bool)

(declare-fun e!113410 () Bool)

(assert (=> b!164154 (= e!113409 e!113410)))

(declare-fun res!136779 () Bool)

(assert (=> b!164154 (=> (not res!136779) (not e!113410))))

(assert (=> b!164154 (= res!136779 (= (select (arr!4596 (buf!4127 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4596 (array!8206 (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) lt!257623) (size!3675 (buf!4127 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164155 () Bool)

(assert (=> b!164155 (= e!113410 (arrayRangesEq!609 (buf!4127 thiss!1577) (array!8206 (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) lt!257623) (size!3675 (buf!4127 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7689 thiss!1577)))))

(assert (= (and d!56619 (not res!136778)) b!164154))

(assert (= (and b!164154 res!136779) b!164155))

(declare-fun m!260863 () Bool)

(assert (=> b!164154 m!260863))

(declare-fun m!260865 () Bool)

(assert (=> b!164154 m!260865))

(declare-fun m!260867 () Bool)

(assert (=> b!164155 m!260867))

(assert (=> b!164136 d!56619))

(declare-fun d!56625 () Bool)

(assert (=> d!56625 (= (byteRangesEq!0 (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577)) lt!257623 #b00000000000000000000000000000000 lt!257622) (or (= #b00000000000000000000000000000000 lt!257622) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257622))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!257623) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257622))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14032 () Bool)

(assert (= bs!14032 d!56625))

(declare-fun m!260903 () Bool)

(assert (=> bs!14032 m!260903))

(declare-fun m!260905 () Bool)

(assert (=> bs!14032 m!260905))

(assert (=> b!164136 d!56625))

(declare-fun d!56647 () Bool)

(declare-fun e!113429 () Bool)

(assert (=> d!56647 e!113429))

(declare-fun res!136798 () Bool)

(assert (=> d!56647 (=> (not res!136798) (not e!113429))))

(assert (=> d!56647 (= res!136798 (and (bvsge (currentByte!7689 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7689 thiss!1577) (size!3675 (buf!4127 thiss!1577)))))))

(declare-fun lt!257642 () Unit!11427)

(assert (=> d!56647 (= lt!257642 (choose!198 (buf!4127 thiss!1577) (currentByte!7689 thiss!1577) lt!257623))))

(assert (=> d!56647 (and (bvsle #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)) (bvslt (currentByte!7689 thiss!1577) (size!3675 (buf!4127 thiss!1577))))))

(assert (=> d!56647 (= (arrayUpdatedAtPrefixLemma!217 (buf!4127 thiss!1577) (currentByte!7689 thiss!1577) lt!257623) lt!257642)))

(declare-fun b!164174 () Bool)

(assert (=> b!164174 (= e!113429 (arrayRangesEq!609 (buf!4127 thiss!1577) (array!8206 (store (arr!4596 (buf!4127 thiss!1577)) (currentByte!7689 thiss!1577) lt!257623) (size!3675 (buf!4127 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)))))

(assert (= (and d!56647 res!136798) b!164174))

(declare-fun m!260907 () Bool)

(assert (=> d!56647 m!260907))

(assert (=> b!164174 m!260809))

(assert (=> b!164174 m!260811))

(assert (=> b!164136 d!56647))

(declare-fun d!56649 () Bool)

(declare-fun res!136799 () Bool)

(declare-fun e!113430 () Bool)

(assert (=> d!56649 (=> res!136799 e!113430)))

(assert (=> d!56649 (= res!136799 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))))))

(assert (=> d!56649 (= (arrayRangesEq!609 lt!257619 lt!257621 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))) e!113430)))

(declare-fun b!164175 () Bool)

(declare-fun e!113431 () Bool)

(assert (=> b!164175 (= e!113430 e!113431)))

(declare-fun res!136800 () Bool)

(assert (=> b!164175 (=> (not res!136800) (not e!113431))))

(assert (=> b!164175 (= res!136800 (= (select (arr!4596 lt!257619) #b00000000000000000000000000000000) (select (arr!4596 lt!257621) #b00000000000000000000000000000000)))))

(declare-fun b!164176 () Bool)

(assert (=> b!164176 (= e!113431 (arrayRangesEq!609 lt!257619 lt!257621 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))))))

(assert (= (and d!56649 (not res!136799)) b!164175))

(assert (= (and b!164175 res!136800) b!164176))

(declare-fun m!260911 () Bool)

(assert (=> b!164175 m!260911))

(declare-fun m!260913 () Bool)

(assert (=> b!164175 m!260913))

(declare-fun m!260915 () Bool)

(assert (=> b!164176 m!260915))

(assert (=> b!164136 d!56649))

(declare-fun d!56653 () Bool)

(declare-fun res!136801 () Bool)

(declare-fun e!113432 () Bool)

(assert (=> d!56653 (=> res!136801 e!113432)))

(assert (=> d!56653 (= res!136801 (= #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)))))

(assert (=> d!56653 (= (arrayRangesEq!609 (buf!4127 thiss!1577) lt!257621 #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)) e!113432)))

(declare-fun b!164177 () Bool)

(declare-fun e!113433 () Bool)

(assert (=> b!164177 (= e!113432 e!113433)))

(declare-fun res!136802 () Bool)

(assert (=> b!164177 (=> (not res!136802) (not e!113433))))

(assert (=> b!164177 (= res!136802 (= (select (arr!4596 (buf!4127 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4596 lt!257621) #b00000000000000000000000000000000)))))

(declare-fun b!164178 () Bool)

(assert (=> b!164178 (= e!113433 (arrayRangesEq!609 (buf!4127 thiss!1577) lt!257621 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7689 thiss!1577)))))

(assert (= (and d!56653 (not res!136801)) b!164177))

(assert (= (and b!164177 res!136802) b!164178))

(assert (=> b!164177 m!260863))

(assert (=> b!164177 m!260913))

(declare-fun m!260917 () Bool)

(assert (=> b!164178 m!260917))

(assert (=> b!164136 d!56653))

(declare-fun d!56655 () Bool)

(assert (=> d!56655 (arrayRangesEq!609 (buf!4127 thiss!1577) lt!257621 #b00000000000000000000000000000000 (currentByte!7689 thiss!1577))))

(declare-fun lt!257645 () Unit!11427)

(declare-fun choose!202 (array!8205 array!8205 array!8205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11427)

(assert (=> d!56655 (= lt!257645 (choose!202 (buf!4127 thiss!1577) lt!257619 lt!257621 #b00000000000000000000000000000000 (currentByte!7689 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))))))

(assert (=> d!56655 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7689 thiss!1577)) (bvsle (currentByte!7689 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))))))

(assert (=> d!56655 (= (arrayRangesEqTransitive!156 (buf!4127 thiss!1577) lt!257619 lt!257621 #b00000000000000000000000000000000 (currentByte!7689 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7689 thiss!1577))) lt!257645)))

(declare-fun bs!14036 () Bool)

(assert (= bs!14036 d!56655))

(assert (=> bs!14036 m!260807))

(declare-fun m!260923 () Bool)

(assert (=> bs!14036 m!260923))

(assert (=> b!164136 d!56655))

(push 1)

(assert (not d!56613))

(assert (not b!164145))

(assert (not b!164176))

(assert (not d!56611))

(assert (not d!56655))

(assert (not b!164178))

(assert (not d!56603))

(assert (not d!56647))

(assert (not b!164155))

(assert (not b!164174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

