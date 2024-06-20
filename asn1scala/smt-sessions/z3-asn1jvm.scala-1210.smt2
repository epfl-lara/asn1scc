; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34466 () Bool)

(assert start!34466)

(declare-fun b!163495 () Bool)

(declare-fun e!112934 () Bool)

(assert (=> b!163495 (= e!112934 true)))

(declare-fun lt!256638 () Bool)

(declare-datatypes ((array!8138 0))(
  ( (array!8139 (arr!4565 (Array (_ BitVec 32) (_ BitVec 8))) (size!3644 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6444 0))(
  ( (BitStream!6445 (buf!4096 array!8138) (currentByte!7649 (_ BitVec 32)) (currentBit!7644 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6444)

(declare-datatypes ((Unit!11344 0))(
  ( (Unit!11345) )
))
(declare-datatypes ((tuple2!14512 0))(
  ( (tuple2!14513 (_1!7847 Unit!11344) (_2!7847 BitStream!6444)) )
))
(declare-fun lt!256636 () tuple2!14512)

(declare-fun isPrefixOf!0 (BitStream!6444 BitStream!6444) Bool)

(assert (=> b!163495 (= lt!256638 (isPrefixOf!0 thiss!1577 (_2!7847 lt!256636)))))

(declare-fun b!163496 () Bool)

(declare-fun res!136233 () Bool)

(declare-fun e!112932 () Bool)

(assert (=> b!163496 (=> (not res!136233) (not e!112932))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163496 (= res!136233 (validate_offset_bits!1 ((_ sign_extend 32) (size!3644 (buf!4096 thiss!1577))) ((_ sign_extend 32) (currentByte!7649 thiss!1577)) ((_ sign_extend 32) (currentBit!7644 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163497 () Bool)

(declare-fun res!136234 () Bool)

(assert (=> b!163497 (=> (not res!136234) (not e!112932))))

(assert (=> b!163497 (= res!136234 (bvsle (bvadd (currentBit!7644 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163498 () Bool)

(declare-fun e!112936 () Bool)

(declare-fun array_inv!3385 (array!8138) Bool)

(assert (=> b!163498 (= e!112936 (array_inv!3385 (buf!4096 thiss!1577)))))

(declare-fun b!163499 () Bool)

(declare-fun e!112933 () Bool)

(assert (=> b!163499 (= e!112932 (not e!112933))))

(declare-fun res!136231 () Bool)

(assert (=> b!163499 (=> res!136231 e!112933)))

(declare-fun lt!256637 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163499 (= res!136231 (not (byteRangesEq!0 (select (arr!4565 (buf!4096 thiss!1577)) (currentByte!7649 thiss!1577)) lt!256637 #b00000000000000000000000000000000 (currentBit!7644 thiss!1577))))))

(declare-fun lt!256635 () array!8138)

(declare-fun arrayRangesEq!578 (array!8138 array!8138 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163499 (arrayRangesEq!578 (buf!4096 thiss!1577) lt!256635 #b00000000000000000000000000000000 (currentByte!7649 thiss!1577))))

(declare-fun lt!256634 () Unit!11344)

(declare-fun arrayUpdatedAtPrefixLemma!186 (array!8138 (_ BitVec 32) (_ BitVec 8)) Unit!11344)

(assert (=> b!163499 (= lt!256634 (arrayUpdatedAtPrefixLemma!186 (buf!4096 thiss!1577) (currentByte!7649 thiss!1577) lt!256637))))

(assert (=> b!163499 (= lt!256635 (array!8139 (store (arr!4565 (buf!4096 thiss!1577)) (currentByte!7649 thiss!1577) lt!256637) (size!3644 (buf!4096 thiss!1577))))))

(declare-fun lt!256633 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163499 (= lt!256637 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4565 (buf!4096 thiss!1577)) (currentByte!7649 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7644 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256633)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256633))))))

(assert (=> b!163499 (= lt!256633 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7644 thiss!1577) nBits!511)))))

(declare-fun res!136236 () Bool)

(assert (=> start!34466 (=> (not res!136236) (not e!112932))))

(assert (=> start!34466 (= res!136236 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34466 e!112932))

(assert (=> start!34466 true))

(declare-fun inv!12 (BitStream!6444) Bool)

(assert (=> start!34466 (and (inv!12 thiss!1577) e!112936)))

(declare-fun b!163500 () Bool)

(declare-fun res!136235 () Bool)

(assert (=> b!163500 (=> res!136235 e!112934)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163500 (= res!136235 (not (= (bitIndex!0 (size!3644 (buf!4096 (_2!7847 lt!256636))) (currentByte!7649 (_2!7847 lt!256636)) (currentBit!7644 (_2!7847 lt!256636))) (bvadd (bitIndex!0 (size!3644 (buf!4096 thiss!1577)) (currentByte!7649 thiss!1577) (currentBit!7644 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163501 () Bool)

(assert (=> b!163501 (= e!112933 e!112934)))

(declare-fun res!136232 () Bool)

(assert (=> b!163501 (=> res!136232 e!112934)))

(assert (=> b!163501 (= res!136232 (not (= (size!3644 (buf!4096 thiss!1577)) (size!3644 (buf!4096 (_2!7847 lt!256636))))))))

(declare-fun moveBitIndex!0 (BitStream!6444 (_ BitVec 64)) tuple2!14512)

(assert (=> b!163501 (= lt!256636 (moveBitIndex!0 (BitStream!6445 lt!256635 (currentByte!7649 thiss!1577) (currentBit!7644 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34466 res!136236) b!163496))

(assert (= (and b!163496 res!136233) b!163497))

(assert (= (and b!163497 res!136234) b!163499))

(assert (= (and b!163499 (not res!136231)) b!163501))

(assert (= (and b!163501 (not res!136232)) b!163500))

(assert (= (and b!163500 (not res!136235)) b!163495))

(assert (= start!34466 b!163498))

(declare-fun m!259533 () Bool)

(assert (=> start!34466 m!259533))

(declare-fun m!259535 () Bool)

(assert (=> b!163496 m!259535))

(declare-fun m!259537 () Bool)

(assert (=> b!163498 m!259537))

(declare-fun m!259539 () Bool)

(assert (=> b!163495 m!259539))

(declare-fun m!259541 () Bool)

(assert (=> b!163499 m!259541))

(declare-fun m!259543 () Bool)

(assert (=> b!163499 m!259543))

(declare-fun m!259545 () Bool)

(assert (=> b!163499 m!259545))

(assert (=> b!163499 m!259543))

(declare-fun m!259547 () Bool)

(assert (=> b!163499 m!259547))

(declare-fun m!259549 () Bool)

(assert (=> b!163499 m!259549))

(declare-fun m!259551 () Bool)

(assert (=> b!163499 m!259551))

(declare-fun m!259553 () Bool)

(assert (=> b!163499 m!259553))

(declare-fun m!259555 () Bool)

(assert (=> b!163499 m!259555))

(declare-fun m!259557 () Bool)

(assert (=> b!163500 m!259557))

(declare-fun m!259559 () Bool)

(assert (=> b!163500 m!259559))

(declare-fun m!259561 () Bool)

(assert (=> b!163501 m!259561))

(check-sat (not b!163495) (not b!163496) (not b!163498) (not start!34466) (not b!163500) (not b!163499) (not b!163501))
(check-sat)
