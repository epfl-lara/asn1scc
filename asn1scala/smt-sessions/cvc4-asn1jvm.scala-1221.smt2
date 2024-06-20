; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34676 () Bool)

(assert start!34676)

(declare-fun b!164229 () Bool)

(declare-fun e!113476 () Bool)

(declare-fun e!113477 () Bool)

(assert (=> b!164229 (= e!113476 (not e!113477))))

(declare-fun res!136845 () Bool)

(assert (=> b!164229 (=> res!136845 e!113477)))

(declare-fun lt!257732 () (_ BitVec 8))

(declare-fun lt!257729 () (_ BitVec 32))

(declare-datatypes ((array!8214 0))(
  ( (array!8215 (arr!4599 (Array (_ BitVec 32) (_ BitVec 8))) (size!3678 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6512 0))(
  ( (BitStream!6513 (buf!4130 array!8214) (currentByte!7699 (_ BitVec 32)) (currentBit!7694 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6512)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164229 (= res!136845 (not (byteRangesEq!0 (select (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577)) lt!257732 #b00000000000000000000000000000000 lt!257729)))))

(declare-fun lt!257727 () array!8214)

(declare-fun arrayRangesEq!612 (array!8214 array!8214 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164229 (arrayRangesEq!612 (buf!4130 thiss!1577) lt!257727 #b00000000000000000000000000000000 (currentByte!7699 thiss!1577))))

(declare-datatypes ((Unit!11433 0))(
  ( (Unit!11434) )
))
(declare-fun lt!257733 () Unit!11433)

(declare-fun lt!257730 () array!8214)

(declare-fun arrayRangesEqTransitive!159 (array!8214 array!8214 array!8214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11433)

(assert (=> b!164229 (= lt!257733 (arrayRangesEqTransitive!159 (buf!4130 thiss!1577) lt!257730 lt!257727 #b00000000000000000000000000000000 (currentByte!7699 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7699 thiss!1577))))))

(assert (=> b!164229 (arrayRangesEq!612 lt!257730 lt!257727 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7699 thiss!1577)))))

(declare-fun lt!257726 () Unit!11433)

(declare-fun lt!257735 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!220 (array!8214 (_ BitVec 32) (_ BitVec 8)) Unit!11433)

(assert (=> b!164229 (= lt!257726 (arrayUpdatedAtPrefixLemma!220 lt!257730 (bvadd #b00000000000000000000000000000001 (currentByte!7699 thiss!1577)) lt!257735))))

(assert (=> b!164229 (arrayRangesEq!612 (buf!4130 thiss!1577) (array!8215 (store (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577) lt!257732) (size!3678 (buf!4130 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7699 thiss!1577))))

(declare-fun lt!257731 () Unit!11433)

(assert (=> b!164229 (= lt!257731 (arrayUpdatedAtPrefixLemma!220 (buf!4130 thiss!1577) (currentByte!7699 thiss!1577) lt!257732))))

(declare-fun lt!257728 () (_ BitVec 32))

(assert (=> b!164229 (= lt!257732 (select (store (store (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7694 thiss!1577)))))))) (bvlshr (bvand lt!257728 #b00000000000000000000000011111111) lt!257729)))) (bvadd #b00000000000000000000000000000001 (currentByte!7699 thiss!1577)) lt!257735) (currentByte!7699 thiss!1577)))))

(assert (=> b!164229 (= lt!257727 (array!8215 (store (store (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7694 thiss!1577)))))))) (bvlshr (bvand lt!257728 #b00000000000000000000000011111111) lt!257729)))) (bvadd #b00000000000000000000000000000001 (currentByte!7699 thiss!1577)) lt!257735) (size!3678 (buf!4130 thiss!1577))))))

(declare-fun lt!257734 () (_ BitVec 32))

(assert (=> b!164229 (= lt!257735 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7694 thiss!1577)))))))) (bvlshr (bvand lt!257728 #b00000000000000000000000011111111) lt!257729)))) (bvadd #b00000000000000000000000000000001 (currentByte!7699 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257734))) (bvshl lt!257728 lt!257734))))))

(assert (=> b!164229 (= lt!257734 (bvsub #b00000000000000000000000000001000 lt!257729))))

(assert (=> b!164229 (= lt!257730 (array!8215 (store (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4599 (buf!4130 thiss!1577)) (currentByte!7699 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7694 thiss!1577)))))))) (bvlshr (bvand lt!257728 #b00000000000000000000000011111111) lt!257729)))) (size!3678 (buf!4130 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164229 (= lt!257728 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164229 (= lt!257729 (bvsub (bvadd (currentBit!7694 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164230 () Bool)

(declare-fun e!113479 () Bool)

(declare-fun array_inv!3419 (array!8214) Bool)

(assert (=> b!164230 (= e!113479 (array_inv!3419 (buf!4130 thiss!1577)))))

(declare-fun b!164231 () Bool)

(declare-fun res!136846 () Bool)

(assert (=> b!164231 (=> (not res!136846) (not e!113476))))

(assert (=> b!164231 (= res!136846 (bvsgt (bvadd (currentBit!7694 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136847 () Bool)

(assert (=> start!34676 (=> (not res!136847) (not e!113476))))

(assert (=> start!34676 (= res!136847 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34676 e!113476))

(assert (=> start!34676 true))

(declare-fun inv!12 (BitStream!6512) Bool)

(assert (=> start!34676 (and (inv!12 thiss!1577) e!113479)))

(declare-fun b!164232 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164232 (= e!113477 (invariant!0 (currentBit!7694 thiss!1577) (currentByte!7699 thiss!1577) (size!3678 (buf!4130 thiss!1577))))))

(declare-fun b!164233 () Bool)

(declare-fun res!136848 () Bool)

(assert (=> b!164233 (=> (not res!136848) (not e!113476))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164233 (= res!136848 (validate_offset_bits!1 ((_ sign_extend 32) (size!3678 (buf!4130 thiss!1577))) ((_ sign_extend 32) (currentByte!7699 thiss!1577)) ((_ sign_extend 32) (currentBit!7694 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34676 res!136847) b!164233))

(assert (= (and b!164233 res!136848) b!164231))

(assert (= (and b!164231 res!136846) b!164229))

(assert (= (and b!164229 (not res!136845)) b!164232))

(assert (= start!34676 b!164230))

(declare-fun m!261023 () Bool)

(assert (=> start!34676 m!261023))

(declare-fun m!261025 () Bool)

(assert (=> b!164232 m!261025))

(declare-fun m!261027 () Bool)

(assert (=> b!164229 m!261027))

(declare-fun m!261029 () Bool)

(assert (=> b!164229 m!261029))

(declare-fun m!261031 () Bool)

(assert (=> b!164229 m!261031))

(declare-fun m!261033 () Bool)

(assert (=> b!164229 m!261033))

(declare-fun m!261035 () Bool)

(assert (=> b!164229 m!261035))

(declare-fun m!261037 () Bool)

(assert (=> b!164229 m!261037))

(declare-fun m!261039 () Bool)

(assert (=> b!164229 m!261039))

(declare-fun m!261041 () Bool)

(assert (=> b!164229 m!261041))

(declare-fun m!261043 () Bool)

(assert (=> b!164229 m!261043))

(declare-fun m!261045 () Bool)

(assert (=> b!164229 m!261045))

(declare-fun m!261047 () Bool)

(assert (=> b!164229 m!261047))

(assert (=> b!164229 m!261031))

(declare-fun m!261049 () Bool)

(assert (=> b!164229 m!261049))

(declare-fun m!261051 () Bool)

(assert (=> b!164229 m!261051))

(declare-fun m!261053 () Bool)

(assert (=> b!164229 m!261053))

(declare-fun m!261055 () Bool)

(assert (=> b!164229 m!261055))

(declare-fun m!261057 () Bool)

(assert (=> b!164229 m!261057))

(declare-fun m!261059 () Bool)

(assert (=> b!164233 m!261059))

(declare-fun m!261061 () Bool)

(assert (=> b!164230 m!261061))

(push 1)

(assert (not b!164229))

(assert (not b!164233))

(assert (not start!34676))

(assert (not b!164230))

(assert (not b!164232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

