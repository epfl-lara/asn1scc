; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34556 () Bool)

(assert start!34556)

(declare-fun b!163901 () Bool)

(declare-fun res!136574 () Bool)

(declare-fun e!113206 () Bool)

(assert (=> b!163901 (=> (not res!136574) (not e!113206))))

(declare-datatypes ((array!8171 0))(
  ( (array!8172 (arr!4580 (Array (_ BitVec 32) (_ BitVec 8))) (size!3659 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6474 0))(
  ( (BitStream!6475 (buf!4111 array!8171) (currentByte!7670 (_ BitVec 32)) (currentBit!7665 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6474)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163901 (= res!136574 (bvsgt (bvadd (currentBit!7665 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163902 () Bool)

(assert (=> b!163902 (= e!113206 (not true))))

(declare-fun lt!257220 () array!8171)

(declare-fun lt!257214 () (_ BitVec 32))

(declare-fun lt!257215 () (_ BitVec 32))

(declare-fun lt!257218 () (_ BitVec 8))

(declare-fun arrayRangesEq!593 (array!8171 array!8171 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163902 (arrayRangesEq!593 lt!257220 (array!8172 (store (store (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7665 thiss!1577)))))))) (bvlshr (bvand lt!257215 #b00000000000000000000000011111111) lt!257214)))) (bvadd #b00000000000000000000000000000001 (currentByte!7670 thiss!1577)) lt!257218) (size!3659 (buf!4111 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7670 thiss!1577)))))

(declare-datatypes ((Unit!11395 0))(
  ( (Unit!11396) )
))
(declare-fun lt!257219 () Unit!11395)

(declare-fun arrayUpdatedAtPrefixLemma!201 (array!8171 (_ BitVec 32) (_ BitVec 8)) Unit!11395)

(assert (=> b!163902 (= lt!257219 (arrayUpdatedAtPrefixLemma!201 lt!257220 (bvadd #b00000000000000000000000000000001 (currentByte!7670 thiss!1577)) lt!257218))))

(assert (=> b!163902 (arrayRangesEq!593 (buf!4111 thiss!1577) (array!8172 (store (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577) (select (store (store (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7665 thiss!1577)))))))) (bvlshr (bvand lt!257215 #b00000000000000000000000011111111) lt!257214)))) (bvadd #b00000000000000000000000000000001 (currentByte!7670 thiss!1577)) lt!257218) (currentByte!7670 thiss!1577))) (size!3659 (buf!4111 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7670 thiss!1577))))

(declare-fun lt!257217 () Unit!11395)

(assert (=> b!163902 (= lt!257217 (arrayUpdatedAtPrefixLemma!201 (buf!4111 thiss!1577) (currentByte!7670 thiss!1577) (select (store (store (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7665 thiss!1577)))))))) (bvlshr (bvand lt!257215 #b00000000000000000000000011111111) lt!257214)))) (bvadd #b00000000000000000000000000000001 (currentByte!7670 thiss!1577)) lt!257218) (currentByte!7670 thiss!1577))))))

(declare-fun lt!257216 () (_ BitVec 32))

(assert (=> b!163902 (= lt!257218 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7665 thiss!1577)))))))) (bvlshr (bvand lt!257215 #b00000000000000000000000011111111) lt!257214)))) (bvadd #b00000000000000000000000000000001 (currentByte!7670 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257216))) (bvshl lt!257215 lt!257216))))))

(assert (=> b!163902 (= lt!257216 (bvsub #b00000000000000000000000000001000 lt!257214))))

(assert (=> b!163902 (= lt!257220 (array!8172 (store (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4580 (buf!4111 thiss!1577)) (currentByte!7670 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7665 thiss!1577)))))))) (bvlshr (bvand lt!257215 #b00000000000000000000000011111111) lt!257214)))) (size!3659 (buf!4111 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163902 (= lt!257215 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163902 (= lt!257214 (bvsub (bvadd (currentBit!7665 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163900 () Bool)

(declare-fun res!136575 () Bool)

(assert (=> b!163900 (=> (not res!136575) (not e!113206))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163900 (= res!136575 (validate_offset_bits!1 ((_ sign_extend 32) (size!3659 (buf!4111 thiss!1577))) ((_ sign_extend 32) (currentByte!7670 thiss!1577)) ((_ sign_extend 32) (currentBit!7665 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136573 () Bool)

(assert (=> start!34556 (=> (not res!136573) (not e!113206))))

(assert (=> start!34556 (= res!136573 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34556 e!113206))

(assert (=> start!34556 true))

(declare-fun e!113204 () Bool)

(declare-fun inv!12 (BitStream!6474) Bool)

(assert (=> start!34556 (and (inv!12 thiss!1577) e!113204)))

(declare-fun b!163903 () Bool)

(declare-fun array_inv!3400 (array!8171) Bool)

(assert (=> b!163903 (= e!113204 (array_inv!3400 (buf!4111 thiss!1577)))))

(assert (= (and start!34556 res!136573) b!163900))

(assert (= (and b!163900 res!136575) b!163901))

(assert (= (and b!163901 res!136574) b!163902))

(assert (= start!34556 b!163903))

(declare-fun m!260189 () Bool)

(assert (=> b!163902 m!260189))

(declare-fun m!260191 () Bool)

(assert (=> b!163902 m!260191))

(declare-fun m!260193 () Bool)

(assert (=> b!163902 m!260193))

(assert (=> b!163902 m!260191))

(declare-fun m!260195 () Bool)

(assert (=> b!163902 m!260195))

(declare-fun m!260197 () Bool)

(assert (=> b!163902 m!260197))

(declare-fun m!260199 () Bool)

(assert (=> b!163902 m!260199))

(declare-fun m!260201 () Bool)

(assert (=> b!163902 m!260201))

(declare-fun m!260203 () Bool)

(assert (=> b!163902 m!260203))

(declare-fun m!260205 () Bool)

(assert (=> b!163902 m!260205))

(declare-fun m!260207 () Bool)

(assert (=> b!163902 m!260207))

(declare-fun m!260209 () Bool)

(assert (=> b!163902 m!260209))

(declare-fun m!260211 () Bool)

(assert (=> b!163902 m!260211))

(declare-fun m!260213 () Bool)

(assert (=> b!163902 m!260213))

(declare-fun m!260215 () Bool)

(assert (=> b!163900 m!260215))

(declare-fun m!260217 () Bool)

(assert (=> start!34556 m!260217))

(declare-fun m!260219 () Bool)

(assert (=> b!163903 m!260219))

(check-sat (not b!163903) (not b!163900) (not start!34556) (not b!163902))
