; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36242 () Bool)

(assert start!36242)

(declare-fun b!167063 () Bool)

(declare-fun e!115857 () Bool)

(declare-fun e!115858 () Bool)

(assert (=> b!167063 (= e!115857 (not e!115858))))

(declare-fun res!139087 () Bool)

(assert (=> b!167063 (=> res!139087 e!115858)))

(declare-datatypes ((array!8633 0))(
  ( (array!8634 (arr!4756 (Array (_ BitVec 32) (_ BitVec 8))) (size!3835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6826 0))(
  ( (BitStream!6827 (buf!4287 array!8633) (currentByte!8117 (_ BitVec 32)) (currentBit!8112 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6826)

(assert (=> b!167063 (= res!139087 (or (bvsgt #b00000000000000000000000000000000 (currentByte!8117 thiss!1577)) (bvsgt (currentByte!8117 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577))) (bvsgt (currentByte!8117 thiss!1577) (size!3835 (buf!4287 thiss!1577))) (bvsgt (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)) (size!3835 (buf!4287 thiss!1577)))))))

(declare-fun lt!260051 () (_ BitVec 32))

(declare-fun lt!260052 () (_ BitVec 32))

(declare-fun lt!260057 () array!8633)

(declare-fun lt!260055 () (_ BitVec 8))

(declare-fun arrayRangesEq!664 (array!8633 array!8633 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167063 (arrayRangesEq!664 lt!260057 (array!8634 (store (store (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8112 thiss!1577)))))))) (bvlshr (bvand lt!260052 #b00000000000000000000000011111111) lt!260051)))) (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)) lt!260055) (size!3835 (buf!4287 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)))))

(declare-datatypes ((Unit!11618 0))(
  ( (Unit!11619) )
))
(declare-fun lt!260053 () Unit!11618)

(declare-fun arrayUpdatedAtPrefixLemma!272 (array!8633 (_ BitVec 32) (_ BitVec 8)) Unit!11618)

(assert (=> b!167063 (= lt!260053 (arrayUpdatedAtPrefixLemma!272 lt!260057 (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)) lt!260055))))

(assert (=> b!167063 (arrayRangesEq!664 (buf!4287 thiss!1577) (array!8634 (store (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577) (select (store (store (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8112 thiss!1577)))))))) (bvlshr (bvand lt!260052 #b00000000000000000000000011111111) lt!260051)))) (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)) lt!260055) (currentByte!8117 thiss!1577))) (size!3835 (buf!4287 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8117 thiss!1577))))

(declare-fun lt!260056 () Unit!11618)

(assert (=> b!167063 (= lt!260056 (arrayUpdatedAtPrefixLemma!272 (buf!4287 thiss!1577) (currentByte!8117 thiss!1577) (select (store (store (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8112 thiss!1577)))))))) (bvlshr (bvand lt!260052 #b00000000000000000000000011111111) lt!260051)))) (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)) lt!260055) (currentByte!8117 thiss!1577))))))

(declare-fun lt!260054 () (_ BitVec 32))

(assert (=> b!167063 (= lt!260055 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8112 thiss!1577)))))))) (bvlshr (bvand lt!260052 #b00000000000000000000000011111111) lt!260051)))) (bvadd #b00000000000000000000000000000001 (currentByte!8117 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260054))) (bvshl lt!260052 lt!260054))))))

(assert (=> b!167063 (= lt!260054 (bvsub #b00000000000000000000000000001000 lt!260051))))

(assert (=> b!167063 (= lt!260057 (array!8634 (store (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4756 (buf!4287 thiss!1577)) (currentByte!8117 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8112 thiss!1577)))))))) (bvlshr (bvand lt!260052 #b00000000000000000000000011111111) lt!260051)))) (size!3835 (buf!4287 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167063 (= lt!260052 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167063 (= lt!260051 (bvsub (bvadd (currentBit!8112 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167064 () Bool)

(assert (=> b!167064 (= e!115858 (arrayRangesEq!664 (buf!4287 thiss!1577) lt!260057 #b00000000000000000000000000000000 (currentByte!8117 thiss!1577)))))

(declare-fun res!139086 () Bool)

(assert (=> start!36242 (=> (not res!139086) (not e!115857))))

(assert (=> start!36242 (= res!139086 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36242 e!115857))

(assert (=> start!36242 true))

(declare-fun e!115859 () Bool)

(declare-fun inv!12 (BitStream!6826) Bool)

(assert (=> start!36242 (and (inv!12 thiss!1577) e!115859)))

(declare-fun b!167065 () Bool)

(declare-fun res!139088 () Bool)

(assert (=> b!167065 (=> (not res!139088) (not e!115857))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167065 (= res!139088 (validate_offset_bits!1 ((_ sign_extend 32) (size!3835 (buf!4287 thiss!1577))) ((_ sign_extend 32) (currentByte!8117 thiss!1577)) ((_ sign_extend 32) (currentBit!8112 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167066 () Bool)

(declare-fun array_inv!3576 (array!8633) Bool)

(assert (=> b!167066 (= e!115859 (array_inv!3576 (buf!4287 thiss!1577)))))

(declare-fun b!167067 () Bool)

(declare-fun res!139085 () Bool)

(assert (=> b!167067 (=> (not res!139085) (not e!115857))))

(assert (=> b!167067 (= res!139085 (bvsgt (bvadd (currentBit!8112 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36242 res!139086) b!167065))

(assert (= (and b!167065 res!139088) b!167067))

(assert (= (and b!167067 res!139085) b!167063))

(assert (= (and b!167063 (not res!139087)) b!167064))

(assert (= start!36242 b!167066))

(declare-fun m!265559 () Bool)

(assert (=> b!167066 m!265559))

(declare-fun m!265561 () Bool)

(assert (=> b!167065 m!265561))

(declare-fun m!265563 () Bool)

(assert (=> b!167064 m!265563))

(declare-fun m!265565 () Bool)

(assert (=> b!167063 m!265565))

(declare-fun m!265567 () Bool)

(assert (=> b!167063 m!265567))

(declare-fun m!265569 () Bool)

(assert (=> b!167063 m!265569))

(declare-fun m!265571 () Bool)

(assert (=> b!167063 m!265571))

(declare-fun m!265573 () Bool)

(assert (=> b!167063 m!265573))

(declare-fun m!265575 () Bool)

(assert (=> b!167063 m!265575))

(declare-fun m!265577 () Bool)

(assert (=> b!167063 m!265577))

(declare-fun m!265579 () Bool)

(assert (=> b!167063 m!265579))

(declare-fun m!265581 () Bool)

(assert (=> b!167063 m!265581))

(declare-fun m!265583 () Bool)

(assert (=> b!167063 m!265583))

(declare-fun m!265585 () Bool)

(assert (=> b!167063 m!265585))

(declare-fun m!265587 () Bool)

(assert (=> b!167063 m!265587))

(assert (=> b!167063 m!265579))

(declare-fun m!265589 () Bool)

(assert (=> b!167063 m!265589))

(declare-fun m!265591 () Bool)

(assert (=> start!36242 m!265591))

(push 1)

(assert (not start!36242))

(assert (not b!167063))

(assert (not b!167064))

(assert (not b!167066))

(assert (not b!167065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

