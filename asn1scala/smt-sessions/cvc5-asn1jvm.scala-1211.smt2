; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34470 () Bool)

(assert start!34470)

(declare-fun b!163539 () Bool)

(declare-fun e!112963 () Bool)

(declare-fun e!112966 () Bool)

(assert (=> b!163539 (= e!112963 (not e!112966))))

(declare-fun res!136271 () Bool)

(assert (=> b!163539 (=> res!136271 e!112966)))

(declare-datatypes ((array!8142 0))(
  ( (array!8143 (arr!4567 (Array (_ BitVec 32) (_ BitVec 8))) (size!3646 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6448 0))(
  ( (BitStream!6449 (buf!4098 array!8142) (currentByte!7651 (_ BitVec 32)) (currentBit!7646 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6448)

(declare-fun lt!256669 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163539 (= res!136271 (not (byteRangesEq!0 (select (arr!4567 (buf!4098 thiss!1577)) (currentByte!7651 thiss!1577)) lt!256669 #b00000000000000000000000000000000 (currentBit!7646 thiss!1577))))))

(declare-fun lt!256673 () array!8142)

(declare-fun arrayRangesEq!580 (array!8142 array!8142 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163539 (arrayRangesEq!580 (buf!4098 thiss!1577) lt!256673 #b00000000000000000000000000000000 (currentByte!7651 thiss!1577))))

(declare-datatypes ((Unit!11348 0))(
  ( (Unit!11349) )
))
(declare-fun lt!256674 () Unit!11348)

(declare-fun arrayUpdatedAtPrefixLemma!188 (array!8142 (_ BitVec 32) (_ BitVec 8)) Unit!11348)

(assert (=> b!163539 (= lt!256674 (arrayUpdatedAtPrefixLemma!188 (buf!4098 thiss!1577) (currentByte!7651 thiss!1577) lt!256669))))

(assert (=> b!163539 (= lt!256673 (array!8143 (store (arr!4567 (buf!4098 thiss!1577)) (currentByte!7651 thiss!1577) lt!256669) (size!3646 (buf!4098 thiss!1577))))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun lt!256671 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163539 (= lt!256669 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4567 (buf!4098 thiss!1577)) (currentByte!7651 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7646 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256671)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256671))))))

(assert (=> b!163539 (= lt!256671 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7646 thiss!1577) nBits!511)))))

(declare-fun b!163540 () Bool)

(declare-fun res!136275 () Bool)

(assert (=> b!163540 (=> (not res!136275) (not e!112963))))

(assert (=> b!163540 (= res!136275 (bvsle (bvadd (currentBit!7646 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163541 () Bool)

(declare-fun e!112962 () Bool)

(assert (=> b!163541 (= e!112966 e!112962)))

(declare-fun res!136270 () Bool)

(assert (=> b!163541 (=> res!136270 e!112962)))

(declare-datatypes ((tuple2!14516 0))(
  ( (tuple2!14517 (_1!7849 Unit!11348) (_2!7849 BitStream!6448)) )
))
(declare-fun lt!256670 () tuple2!14516)

(assert (=> b!163541 (= res!136270 (not (= (size!3646 (buf!4098 thiss!1577)) (size!3646 (buf!4098 (_2!7849 lt!256670))))))))

(declare-fun moveBitIndex!0 (BitStream!6448 (_ BitVec 64)) tuple2!14516)

(assert (=> b!163541 (= lt!256670 (moveBitIndex!0 (BitStream!6449 lt!256673 (currentByte!7651 thiss!1577) (currentBit!7646 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136274 () Bool)

(assert (=> start!34470 (=> (not res!136274) (not e!112963))))

(assert (=> start!34470 (= res!136274 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34470 e!112963))

(assert (=> start!34470 true))

(declare-fun e!112965 () Bool)

(declare-fun inv!12 (BitStream!6448) Bool)

(assert (=> start!34470 (and (inv!12 thiss!1577) e!112965)))

(declare-fun b!163542 () Bool)

(declare-fun res!136273 () Bool)

(assert (=> b!163542 (=> res!136273 e!112962)))

(declare-fun isPrefixOf!0 (BitStream!6448 BitStream!6448) Bool)

(assert (=> b!163542 (= res!136273 (not (isPrefixOf!0 thiss!1577 (_2!7849 lt!256670))))))

(declare-fun b!163543 () Bool)

(assert (=> b!163543 (= e!112962 true)))

(declare-datatypes ((tuple2!14518 0))(
  ( (tuple2!14519 (_1!7850 BitStream!6448) (_2!7850 BitStream!6448)) )
))
(declare-fun lt!256672 () tuple2!14518)

(declare-fun reader!0 (BitStream!6448 BitStream!6448) tuple2!14518)

(assert (=> b!163543 (= lt!256672 (reader!0 thiss!1577 (_2!7849 lt!256670)))))

(declare-fun b!163544 () Bool)

(declare-fun array_inv!3387 (array!8142) Bool)

(assert (=> b!163544 (= e!112965 (array_inv!3387 (buf!4098 thiss!1577)))))

(declare-fun b!163545 () Bool)

(declare-fun res!136272 () Bool)

(assert (=> b!163545 (=> res!136272 e!112962)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163545 (= res!136272 (not (= (bitIndex!0 (size!3646 (buf!4098 (_2!7849 lt!256670))) (currentByte!7651 (_2!7849 lt!256670)) (currentBit!7646 (_2!7849 lt!256670))) (bvadd (bitIndex!0 (size!3646 (buf!4098 thiss!1577)) (currentByte!7651 thiss!1577) (currentBit!7646 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163546 () Bool)

(declare-fun res!136269 () Bool)

(assert (=> b!163546 (=> (not res!136269) (not e!112963))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163546 (= res!136269 (validate_offset_bits!1 ((_ sign_extend 32) (size!3646 (buf!4098 thiss!1577))) ((_ sign_extend 32) (currentByte!7651 thiss!1577)) ((_ sign_extend 32) (currentBit!7646 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34470 res!136274) b!163546))

(assert (= (and b!163546 res!136269) b!163540))

(assert (= (and b!163540 res!136275) b!163539))

(assert (= (and b!163539 (not res!136271)) b!163541))

(assert (= (and b!163541 (not res!136270)) b!163545))

(assert (= (and b!163545 (not res!136272)) b!163542))

(assert (= (and b!163542 (not res!136273)) b!163543))

(assert (= start!34470 b!163544))

(declare-fun m!259593 () Bool)

(assert (=> b!163543 m!259593))

(declare-fun m!259595 () Bool)

(assert (=> b!163541 m!259595))

(declare-fun m!259597 () Bool)

(assert (=> b!163539 m!259597))

(declare-fun m!259599 () Bool)

(assert (=> b!163539 m!259599))

(declare-fun m!259601 () Bool)

(assert (=> b!163539 m!259601))

(declare-fun m!259603 () Bool)

(assert (=> b!163539 m!259603))

(declare-fun m!259605 () Bool)

(assert (=> b!163539 m!259605))

(declare-fun m!259607 () Bool)

(assert (=> b!163539 m!259607))

(declare-fun m!259609 () Bool)

(assert (=> b!163539 m!259609))

(assert (=> b!163539 m!259609))

(declare-fun m!259611 () Bool)

(assert (=> b!163539 m!259611))

(declare-fun m!259613 () Bool)

(assert (=> b!163546 m!259613))

(declare-fun m!259615 () Bool)

(assert (=> b!163545 m!259615))

(declare-fun m!259617 () Bool)

(assert (=> b!163545 m!259617))

(declare-fun m!259619 () Bool)

(assert (=> b!163542 m!259619))

(declare-fun m!259621 () Bool)

(assert (=> b!163544 m!259621))

(declare-fun m!259623 () Bool)

(assert (=> start!34470 m!259623))

(push 1)

(assert (not b!163544))

(assert (not b!163545))

(assert (not b!163541))

(assert (not start!34470))

(assert (not b!163543))

(assert (not b!163546))

(assert (not b!163542))

(assert (not b!163539))

(check-sat)

