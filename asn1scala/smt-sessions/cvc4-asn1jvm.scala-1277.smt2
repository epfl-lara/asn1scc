; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36284 () Bool)

(assert start!36284)

(declare-fun b!167218 () Bool)

(declare-fun e!115977 () Bool)

(declare-datatypes ((array!8657 0))(
  ( (array!8658 (arr!4767 (Array (_ BitVec 32) (_ BitVec 8))) (size!3846 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6848 0))(
  ( (BitStream!6849 (buf!4298 array!8657) (currentByte!8131 (_ BitVec 32)) (currentBit!8126 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6848)

(assert (=> b!167218 (= e!115977 (not (and (bvsge (currentByte!8131 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8131 thiss!1577) (size!3846 (buf!4298 thiss!1577))))))))

(declare-fun lt!260345 () array!8657)

(declare-fun arrayRangesEq!675 (array!8657 array!8657 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167218 (arrayRangesEq!675 (buf!4298 thiss!1577) lt!260345 #b00000000000000000000000000000000 (currentByte!8131 thiss!1577))))

(declare-fun lt!260340 () array!8657)

(declare-datatypes ((Unit!11640 0))(
  ( (Unit!11641) )
))
(declare-fun lt!260341 () Unit!11640)

(declare-fun arrayRangesEqTransitive!177 (array!8657 array!8657 array!8657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11640)

(assert (=> b!167218 (= lt!260341 (arrayRangesEqTransitive!177 (buf!4298 thiss!1577) lt!260340 lt!260345 #b00000000000000000000000000000000 (currentByte!8131 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8131 thiss!1577))))))

(assert (=> b!167218 (arrayRangesEq!675 lt!260340 lt!260345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8131 thiss!1577)))))

(declare-fun lt!260344 () Unit!11640)

(declare-fun lt!260348 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!283 (array!8657 (_ BitVec 32) (_ BitVec 8)) Unit!11640)

(assert (=> b!167218 (= lt!260344 (arrayUpdatedAtPrefixLemma!283 lt!260340 (bvadd #b00000000000000000000000000000001 (currentByte!8131 thiss!1577)) lt!260348))))

(declare-fun lt!260342 () (_ BitVec 8))

(assert (=> b!167218 (arrayRangesEq!675 (buf!4298 thiss!1577) (array!8658 (store (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577) lt!260342) (size!3846 (buf!4298 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8131 thiss!1577))))

(declare-fun lt!260349 () Unit!11640)

(assert (=> b!167218 (= lt!260349 (arrayUpdatedAtPrefixLemma!283 (buf!4298 thiss!1577) (currentByte!8131 thiss!1577) lt!260342))))

(declare-fun lt!260343 () (_ BitVec 32))

(declare-fun lt!260346 () (_ BitVec 32))

(assert (=> b!167218 (= lt!260342 (select (store (store (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8126 thiss!1577)))))))) (bvlshr (bvand lt!260343 #b00000000000000000000000011111111) lt!260346)))) (bvadd #b00000000000000000000000000000001 (currentByte!8131 thiss!1577)) lt!260348) (currentByte!8131 thiss!1577)))))

(assert (=> b!167218 (= lt!260345 (array!8658 (store (store (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8126 thiss!1577)))))))) (bvlshr (bvand lt!260343 #b00000000000000000000000011111111) lt!260346)))) (bvadd #b00000000000000000000000000000001 (currentByte!8131 thiss!1577)) lt!260348) (size!3846 (buf!4298 thiss!1577))))))

(declare-fun lt!260347 () (_ BitVec 32))

(assert (=> b!167218 (= lt!260348 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8126 thiss!1577)))))))) (bvlshr (bvand lt!260343 #b00000000000000000000000011111111) lt!260346)))) (bvadd #b00000000000000000000000000000001 (currentByte!8131 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260347))) (bvshl lt!260343 lt!260347))))))

(assert (=> b!167218 (= lt!260347 (bvsub #b00000000000000000000000000001000 lt!260346))))

(assert (=> b!167218 (= lt!260340 (array!8658 (store (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4767 (buf!4298 thiss!1577)) (currentByte!8131 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8126 thiss!1577)))))))) (bvlshr (bvand lt!260343 #b00000000000000000000000011111111) lt!260346)))) (size!3846 (buf!4298 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167218 (= lt!260343 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167218 (= lt!260346 (bvsub (bvadd (currentBit!8126 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139205 () Bool)

(assert (=> start!36284 (=> (not res!139205) (not e!115977))))

(assert (=> start!36284 (= res!139205 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36284 e!115977))

(assert (=> start!36284 true))

(declare-fun e!115979 () Bool)

(declare-fun inv!12 (BitStream!6848) Bool)

(assert (=> start!36284 (and (inv!12 thiss!1577) e!115979)))

(declare-fun b!167219 () Bool)

(declare-fun array_inv!3587 (array!8657) Bool)

(assert (=> b!167219 (= e!115979 (array_inv!3587 (buf!4298 thiss!1577)))))

(declare-fun b!167216 () Bool)

(declare-fun res!139207 () Bool)

(assert (=> b!167216 (=> (not res!139207) (not e!115977))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167216 (= res!139207 (validate_offset_bits!1 ((_ sign_extend 32) (size!3846 (buf!4298 thiss!1577))) ((_ sign_extend 32) (currentByte!8131 thiss!1577)) ((_ sign_extend 32) (currentBit!8126 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167217 () Bool)

(declare-fun res!139206 () Bool)

(assert (=> b!167217 (=> (not res!139206) (not e!115977))))

(assert (=> b!167217 (= res!139206 (bvsgt (bvadd (currentBit!8126 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36284 res!139205) b!167216))

(assert (= (and b!167216 res!139207) b!167217))

(assert (= (and b!167217 res!139206) b!167218))

(assert (= start!36284 b!167219))

(declare-fun m!265967 () Bool)

(assert (=> b!167218 m!265967))

(declare-fun m!265969 () Bool)

(assert (=> b!167218 m!265969))

(declare-fun m!265971 () Bool)

(assert (=> b!167218 m!265971))

(declare-fun m!265973 () Bool)

(assert (=> b!167218 m!265973))

(declare-fun m!265975 () Bool)

(assert (=> b!167218 m!265975))

(declare-fun m!265977 () Bool)

(assert (=> b!167218 m!265977))

(declare-fun m!265979 () Bool)

(assert (=> b!167218 m!265979))

(declare-fun m!265981 () Bool)

(assert (=> b!167218 m!265981))

(declare-fun m!265983 () Bool)

(assert (=> b!167218 m!265983))

(declare-fun m!265985 () Bool)

(assert (=> b!167218 m!265985))

(declare-fun m!265987 () Bool)

(assert (=> b!167218 m!265987))

(declare-fun m!265989 () Bool)

(assert (=> b!167218 m!265989))

(declare-fun m!265991 () Bool)

(assert (=> b!167218 m!265991))

(declare-fun m!265993 () Bool)

(assert (=> b!167218 m!265993))

(declare-fun m!265995 () Bool)

(assert (=> b!167218 m!265995))

(declare-fun m!265997 () Bool)

(assert (=> start!36284 m!265997))

(declare-fun m!265999 () Bool)

(assert (=> b!167219 m!265999))

(declare-fun m!266001 () Bool)

(assert (=> b!167216 m!266001))

(push 1)

(assert (not b!167219))

(assert (not b!167218))

(assert (not start!36284))

(assert (not b!167216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

