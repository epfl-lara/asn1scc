; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34672 () Bool)

(assert start!34672)

(declare-fun res!136823 () Bool)

(declare-fun e!113454 () Bool)

(assert (=> start!34672 (=> (not res!136823) (not e!113454))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34672 (= res!136823 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34672 e!113454))

(assert (=> start!34672 true))

(declare-datatypes ((array!8210 0))(
  ( (array!8211 (arr!4597 (Array (_ BitVec 32) (_ BitVec 8))) (size!3676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6508 0))(
  ( (BitStream!6509 (buf!4128 array!8210) (currentByte!7697 (_ BitVec 32)) (currentBit!7692 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6508)

(declare-fun e!113453 () Bool)

(declare-fun inv!12 (BitStream!6508) Bool)

(assert (=> start!34672 (and (inv!12 thiss!1577) e!113453)))

(declare-fun b!164199 () Bool)

(declare-fun res!136821 () Bool)

(assert (=> b!164199 (=> (not res!136821) (not e!113454))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164199 (= res!136821 (validate_offset_bits!1 ((_ sign_extend 32) (size!3676 (buf!4128 thiss!1577))) ((_ sign_extend 32) (currentByte!7697 thiss!1577)) ((_ sign_extend 32) (currentBit!7692 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164200 () Bool)

(declare-fun e!113455 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164200 (= e!113455 (invariant!0 (currentBit!7692 thiss!1577) (currentByte!7697 thiss!1577) (size!3676 (buf!4128 thiss!1577))))))

(declare-fun b!164201 () Bool)

(declare-fun res!136822 () Bool)

(assert (=> b!164201 (=> (not res!136822) (not e!113454))))

(assert (=> b!164201 (= res!136822 (bvsgt (bvadd (currentBit!7692 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164202 () Bool)

(declare-fun array_inv!3417 (array!8210) Bool)

(assert (=> b!164202 (= e!113453 (array_inv!3417 (buf!4128 thiss!1577)))))

(declare-fun b!164203 () Bool)

(assert (=> b!164203 (= e!113454 (not e!113455))))

(declare-fun res!136824 () Bool)

(assert (=> b!164203 (=> res!136824 e!113455)))

(declare-fun lt!257668 () (_ BitVec 8))

(declare-fun lt!257670 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164203 (= res!136824 (not (byteRangesEq!0 (select (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577)) lt!257668 #b00000000000000000000000000000000 lt!257670)))))

(declare-fun lt!257675 () array!8210)

(declare-fun arrayRangesEq!610 (array!8210 array!8210 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164203 (arrayRangesEq!610 (buf!4128 thiss!1577) lt!257675 #b00000000000000000000000000000000 (currentByte!7697 thiss!1577))))

(declare-fun lt!257667 () array!8210)

(declare-datatypes ((Unit!11429 0))(
  ( (Unit!11430) )
))
(declare-fun lt!257672 () Unit!11429)

(declare-fun arrayRangesEqTransitive!157 (array!8210 array!8210 array!8210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11429)

(assert (=> b!164203 (= lt!257672 (arrayRangesEqTransitive!157 (buf!4128 thiss!1577) lt!257667 lt!257675 #b00000000000000000000000000000000 (currentByte!7697 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7697 thiss!1577))))))

(assert (=> b!164203 (arrayRangesEq!610 lt!257667 lt!257675 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7697 thiss!1577)))))

(declare-fun lt!257671 () (_ BitVec 8))

(declare-fun lt!257666 () Unit!11429)

(declare-fun arrayUpdatedAtPrefixLemma!218 (array!8210 (_ BitVec 32) (_ BitVec 8)) Unit!11429)

(assert (=> b!164203 (= lt!257666 (arrayUpdatedAtPrefixLemma!218 lt!257667 (bvadd #b00000000000000000000000000000001 (currentByte!7697 thiss!1577)) lt!257671))))

(assert (=> b!164203 (arrayRangesEq!610 (buf!4128 thiss!1577) (array!8211 (store (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577) lt!257668) (size!3676 (buf!4128 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7697 thiss!1577))))

(declare-fun lt!257674 () Unit!11429)

(assert (=> b!164203 (= lt!257674 (arrayUpdatedAtPrefixLemma!218 (buf!4128 thiss!1577) (currentByte!7697 thiss!1577) lt!257668))))

(declare-fun lt!257673 () (_ BitVec 32))

(assert (=> b!164203 (= lt!257668 (select (store (store (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7692 thiss!1577)))))))) (bvlshr (bvand lt!257673 #b00000000000000000000000011111111) lt!257670)))) (bvadd #b00000000000000000000000000000001 (currentByte!7697 thiss!1577)) lt!257671) (currentByte!7697 thiss!1577)))))

(assert (=> b!164203 (= lt!257675 (array!8211 (store (store (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7692 thiss!1577)))))))) (bvlshr (bvand lt!257673 #b00000000000000000000000011111111) lt!257670)))) (bvadd #b00000000000000000000000000000001 (currentByte!7697 thiss!1577)) lt!257671) (size!3676 (buf!4128 thiss!1577))))))

(declare-fun lt!257669 () (_ BitVec 32))

(assert (=> b!164203 (= lt!257671 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7692 thiss!1577)))))))) (bvlshr (bvand lt!257673 #b00000000000000000000000011111111) lt!257670)))) (bvadd #b00000000000000000000000000000001 (currentByte!7697 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257669))) (bvshl lt!257673 lt!257669))))))

(assert (=> b!164203 (= lt!257669 (bvsub #b00000000000000000000000000001000 lt!257670))))

(assert (=> b!164203 (= lt!257667 (array!8211 (store (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4597 (buf!4128 thiss!1577)) (currentByte!7697 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7692 thiss!1577)))))))) (bvlshr (bvand lt!257673 #b00000000000000000000000011111111) lt!257670)))) (size!3676 (buf!4128 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164203 (= lt!257673 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164203 (= lt!257670 (bvsub (bvadd (currentBit!7692 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34672 res!136823) b!164199))

(assert (= (and b!164199 res!136821) b!164201))

(assert (= (and b!164201 res!136822) b!164203))

(assert (= (and b!164203 (not res!136824)) b!164200))

(assert (= start!34672 b!164202))

(declare-fun m!260943 () Bool)

(assert (=> b!164199 m!260943))

(declare-fun m!260945 () Bool)

(assert (=> b!164202 m!260945))

(declare-fun m!260947 () Bool)

(assert (=> b!164200 m!260947))

(declare-fun m!260949 () Bool)

(assert (=> b!164203 m!260949))

(declare-fun m!260951 () Bool)

(assert (=> b!164203 m!260951))

(declare-fun m!260953 () Bool)

(assert (=> b!164203 m!260953))

(declare-fun m!260955 () Bool)

(assert (=> b!164203 m!260955))

(declare-fun m!260957 () Bool)

(assert (=> b!164203 m!260957))

(declare-fun m!260959 () Bool)

(assert (=> b!164203 m!260959))

(assert (=> b!164203 m!260953))

(declare-fun m!260961 () Bool)

(assert (=> b!164203 m!260961))

(declare-fun m!260963 () Bool)

(assert (=> b!164203 m!260963))

(declare-fun m!260965 () Bool)

(assert (=> b!164203 m!260965))

(declare-fun m!260967 () Bool)

(assert (=> b!164203 m!260967))

(declare-fun m!260969 () Bool)

(assert (=> b!164203 m!260969))

(declare-fun m!260971 () Bool)

(assert (=> b!164203 m!260971))

(declare-fun m!260973 () Bool)

(assert (=> b!164203 m!260973))

(declare-fun m!260975 () Bool)

(assert (=> b!164203 m!260975))

(declare-fun m!260977 () Bool)

(assert (=> b!164203 m!260977))

(declare-fun m!260979 () Bool)

(assert (=> b!164203 m!260979))

(declare-fun m!260981 () Bool)

(assert (=> start!34672 m!260981))

(push 1)

(assert (not b!164199))

(assert (not b!164202))

(assert (not start!34672))

(assert (not b!164203))

(assert (not b!164200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

