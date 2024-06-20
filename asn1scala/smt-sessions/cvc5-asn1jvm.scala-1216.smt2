; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34560 () Bool)

(assert start!34560)

(declare-fun b!163924 () Bool)

(declare-fun res!136592 () Bool)

(declare-fun e!113224 () Bool)

(assert (=> b!163924 (=> (not res!136592) (not e!113224))))

(declare-datatypes ((array!8175 0))(
  ( (array!8176 (arr!4582 (Array (_ BitVec 32) (_ BitVec 8))) (size!3661 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6478 0))(
  ( (BitStream!6479 (buf!4113 array!8175) (currentByte!7672 (_ BitVec 32)) (currentBit!7667 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6478)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163924 (= res!136592 (validate_offset_bits!1 ((_ sign_extend 32) (size!3661 (buf!4113 thiss!1577))) ((_ sign_extend 32) (currentByte!7672 thiss!1577)) ((_ sign_extend 32) (currentBit!7667 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136591 () Bool)

(assert (=> start!34560 (=> (not res!136591) (not e!113224))))

(assert (=> start!34560 (= res!136591 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34560 e!113224))

(assert (=> start!34560 true))

(declare-fun e!113222 () Bool)

(declare-fun inv!12 (BitStream!6478) Bool)

(assert (=> start!34560 (and (inv!12 thiss!1577) e!113222)))

(declare-fun b!163925 () Bool)

(declare-fun res!136593 () Bool)

(assert (=> b!163925 (=> (not res!136593) (not e!113224))))

(assert (=> b!163925 (= res!136593 (bvsgt (bvadd (currentBit!7667 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163927 () Bool)

(declare-fun array_inv!3402 (array!8175) Bool)

(assert (=> b!163927 (= e!113222 (array_inv!3402 (buf!4113 thiss!1577)))))

(declare-fun b!163926 () Bool)

(assert (=> b!163926 (= e!113224 (not true))))

(declare-fun lt!257256 () (_ BitVec 32))

(declare-fun lt!257260 () (_ BitVec 32))

(declare-fun lt!257261 () array!8175)

(declare-fun lt!257259 () (_ BitVec 8))

(declare-fun arrayRangesEq!595 (array!8175 array!8175 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163926 (arrayRangesEq!595 lt!257261 (array!8176 (store (store (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7667 thiss!1577)))))))) (bvlshr (bvand lt!257256 #b00000000000000000000000011111111) lt!257260)))) (bvadd #b00000000000000000000000000000001 (currentByte!7672 thiss!1577)) lt!257259) (size!3661 (buf!4113 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7672 thiss!1577)))))

(declare-datatypes ((Unit!11399 0))(
  ( (Unit!11400) )
))
(declare-fun lt!257257 () Unit!11399)

(declare-fun arrayUpdatedAtPrefixLemma!203 (array!8175 (_ BitVec 32) (_ BitVec 8)) Unit!11399)

(assert (=> b!163926 (= lt!257257 (arrayUpdatedAtPrefixLemma!203 lt!257261 (bvadd #b00000000000000000000000000000001 (currentByte!7672 thiss!1577)) lt!257259))))

(assert (=> b!163926 (arrayRangesEq!595 (buf!4113 thiss!1577) (array!8176 (store (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577) (select (store (store (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7667 thiss!1577)))))))) (bvlshr (bvand lt!257256 #b00000000000000000000000011111111) lt!257260)))) (bvadd #b00000000000000000000000000000001 (currentByte!7672 thiss!1577)) lt!257259) (currentByte!7672 thiss!1577))) (size!3661 (buf!4113 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7672 thiss!1577))))

(declare-fun lt!257258 () Unit!11399)

(assert (=> b!163926 (= lt!257258 (arrayUpdatedAtPrefixLemma!203 (buf!4113 thiss!1577) (currentByte!7672 thiss!1577) (select (store (store (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7667 thiss!1577)))))))) (bvlshr (bvand lt!257256 #b00000000000000000000000011111111) lt!257260)))) (bvadd #b00000000000000000000000000000001 (currentByte!7672 thiss!1577)) lt!257259) (currentByte!7672 thiss!1577))))))

(declare-fun lt!257262 () (_ BitVec 32))

(assert (=> b!163926 (= lt!257259 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7667 thiss!1577)))))))) (bvlshr (bvand lt!257256 #b00000000000000000000000011111111) lt!257260)))) (bvadd #b00000000000000000000000000000001 (currentByte!7672 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257262))) (bvshl lt!257256 lt!257262))))))

(assert (=> b!163926 (= lt!257262 (bvsub #b00000000000000000000000000001000 lt!257260))))

(assert (=> b!163926 (= lt!257261 (array!8176 (store (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4582 (buf!4113 thiss!1577)) (currentByte!7672 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7667 thiss!1577)))))))) (bvlshr (bvand lt!257256 #b00000000000000000000000011111111) lt!257260)))) (size!3661 (buf!4113 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163926 (= lt!257256 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163926 (= lt!257260 (bvsub (bvadd (currentBit!7667 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34560 res!136591) b!163924))

(assert (= (and b!163924 res!136592) b!163925))

(assert (= (and b!163925 res!136593) b!163926))

(assert (= start!34560 b!163927))

(declare-fun m!260253 () Bool)

(assert (=> b!163924 m!260253))

(declare-fun m!260255 () Bool)

(assert (=> start!34560 m!260255))

(declare-fun m!260257 () Bool)

(assert (=> b!163927 m!260257))

(declare-fun m!260259 () Bool)

(assert (=> b!163926 m!260259))

(declare-fun m!260261 () Bool)

(assert (=> b!163926 m!260261))

(declare-fun m!260263 () Bool)

(assert (=> b!163926 m!260263))

(declare-fun m!260265 () Bool)

(assert (=> b!163926 m!260265))

(declare-fun m!260267 () Bool)

(assert (=> b!163926 m!260267))

(declare-fun m!260269 () Bool)

(assert (=> b!163926 m!260269))

(assert (=> b!163926 m!260265))

(declare-fun m!260271 () Bool)

(assert (=> b!163926 m!260271))

(declare-fun m!260273 () Bool)

(assert (=> b!163926 m!260273))

(declare-fun m!260275 () Bool)

(assert (=> b!163926 m!260275))

(declare-fun m!260277 () Bool)

(assert (=> b!163926 m!260277))

(declare-fun m!260279 () Bool)

(assert (=> b!163926 m!260279))

(declare-fun m!260281 () Bool)

(assert (=> b!163926 m!260281))

(declare-fun m!260283 () Bool)

(assert (=> b!163926 m!260283))

(push 1)

(assert (not b!163927))

(assert (not b!163926))

(assert (not start!34560))

(assert (not b!163924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

