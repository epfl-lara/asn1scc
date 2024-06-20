; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34464 () Bool)

(assert start!34464)

(declare-fun res!136213 () Bool)

(declare-fun e!112921 () Bool)

(assert (=> start!34464 (=> (not res!136213) (not e!112921))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34464 (= res!136213 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34464 e!112921))

(assert (=> start!34464 true))

(declare-datatypes ((array!8136 0))(
  ( (array!8137 (arr!4564 (Array (_ BitVec 32) (_ BitVec 8))) (size!3643 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6442 0))(
  ( (BitStream!6443 (buf!4095 array!8136) (currentByte!7648 (_ BitVec 32)) (currentBit!7643 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6442)

(declare-fun e!112919 () Bool)

(declare-fun inv!12 (BitStream!6442) Bool)

(assert (=> start!34464 (and (inv!12 thiss!1577) e!112919)))

(declare-fun b!163474 () Bool)

(declare-fun e!112920 () Bool)

(declare-fun e!112917 () Bool)

(assert (=> b!163474 (= e!112920 e!112917)))

(declare-fun res!136217 () Bool)

(assert (=> b!163474 (=> res!136217 e!112917)))

(declare-datatypes ((Unit!11342 0))(
  ( (Unit!11343) )
))
(declare-datatypes ((tuple2!14510 0))(
  ( (tuple2!14511 (_1!7846 Unit!11342) (_2!7846 BitStream!6442)) )
))
(declare-fun lt!256617 () tuple2!14510)

(assert (=> b!163474 (= res!136217 (not (= (size!3643 (buf!4095 thiss!1577)) (size!3643 (buf!4095 (_2!7846 lt!256617))))))))

(declare-fun lt!256618 () array!8136)

(declare-fun moveBitIndex!0 (BitStream!6442 (_ BitVec 64)) tuple2!14510)

(assert (=> b!163474 (= lt!256617 (moveBitIndex!0 (BitStream!6443 lt!256618 (currentByte!7648 thiss!1577) (currentBit!7643 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163475 () Bool)

(declare-fun res!136215 () Bool)

(assert (=> b!163475 (=> res!136215 e!112917)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163475 (= res!136215 (not (= (bitIndex!0 (size!3643 (buf!4095 (_2!7846 lt!256617))) (currentByte!7648 (_2!7846 lt!256617)) (currentBit!7643 (_2!7846 lt!256617))) (bvadd (bitIndex!0 (size!3643 (buf!4095 thiss!1577)) (currentByte!7648 thiss!1577) (currentBit!7643 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163476 () Bool)

(declare-fun array_inv!3384 (array!8136) Bool)

(assert (=> b!163476 (= e!112919 (array_inv!3384 (buf!4095 thiss!1577)))))

(declare-fun b!163477 () Bool)

(declare-fun res!136218 () Bool)

(assert (=> b!163477 (=> (not res!136218) (not e!112921))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163477 (= res!136218 (validate_offset_bits!1 ((_ sign_extend 32) (size!3643 (buf!4095 thiss!1577))) ((_ sign_extend 32) (currentByte!7648 thiss!1577)) ((_ sign_extend 32) (currentBit!7643 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163478 () Bool)

(assert (=> b!163478 (= e!112921 (not e!112920))))

(declare-fun res!136214 () Bool)

(assert (=> b!163478 (=> res!136214 e!112920)))

(declare-fun lt!256620 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163478 (= res!136214 (not (byteRangesEq!0 (select (arr!4564 (buf!4095 thiss!1577)) (currentByte!7648 thiss!1577)) lt!256620 #b00000000000000000000000000000000 (currentBit!7643 thiss!1577))))))

(declare-fun arrayRangesEq!577 (array!8136 array!8136 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163478 (arrayRangesEq!577 (buf!4095 thiss!1577) lt!256618 #b00000000000000000000000000000000 (currentByte!7648 thiss!1577))))

(declare-fun lt!256619 () Unit!11342)

(declare-fun arrayUpdatedAtPrefixLemma!185 (array!8136 (_ BitVec 32) (_ BitVec 8)) Unit!11342)

(assert (=> b!163478 (= lt!256619 (arrayUpdatedAtPrefixLemma!185 (buf!4095 thiss!1577) (currentByte!7648 thiss!1577) lt!256620))))

(assert (=> b!163478 (= lt!256618 (array!8137 (store (arr!4564 (buf!4095 thiss!1577)) (currentByte!7648 thiss!1577) lt!256620) (size!3643 (buf!4095 thiss!1577))))))

(declare-fun lt!256615 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163478 (= lt!256620 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4564 (buf!4095 thiss!1577)) (currentByte!7648 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7643 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256615)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256615))))))

(assert (=> b!163478 (= lt!256615 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7643 thiss!1577) nBits!511)))))

(declare-fun b!163479 () Bool)

(declare-fun res!136216 () Bool)

(assert (=> b!163479 (=> (not res!136216) (not e!112921))))

(assert (=> b!163479 (= res!136216 (bvsle (bvadd (currentBit!7643 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163480 () Bool)

(assert (=> b!163480 (= e!112917 true)))

(declare-fun lt!256616 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6442 BitStream!6442) Bool)

(assert (=> b!163480 (= lt!256616 (isPrefixOf!0 thiss!1577 (_2!7846 lt!256617)))))

(assert (= (and start!34464 res!136213) b!163477))

(assert (= (and b!163477 res!136218) b!163479))

(assert (= (and b!163479 res!136216) b!163478))

(assert (= (and b!163478 (not res!136214)) b!163474))

(assert (= (and b!163474 (not res!136217)) b!163475))

(assert (= (and b!163475 (not res!136215)) b!163480))

(assert (= start!34464 b!163476))

(declare-fun m!259503 () Bool)

(assert (=> start!34464 m!259503))

(declare-fun m!259505 () Bool)

(assert (=> b!163478 m!259505))

(declare-fun m!259507 () Bool)

(assert (=> b!163478 m!259507))

(assert (=> b!163478 m!259507))

(declare-fun m!259509 () Bool)

(assert (=> b!163478 m!259509))

(declare-fun m!259511 () Bool)

(assert (=> b!163478 m!259511))

(declare-fun m!259513 () Bool)

(assert (=> b!163478 m!259513))

(declare-fun m!259515 () Bool)

(assert (=> b!163478 m!259515))

(declare-fun m!259517 () Bool)

(assert (=> b!163478 m!259517))

(declare-fun m!259519 () Bool)

(assert (=> b!163478 m!259519))

(declare-fun m!259521 () Bool)

(assert (=> b!163474 m!259521))

(declare-fun m!259523 () Bool)

(assert (=> b!163476 m!259523))

(declare-fun m!259525 () Bool)

(assert (=> b!163475 m!259525))

(declare-fun m!259527 () Bool)

(assert (=> b!163475 m!259527))

(declare-fun m!259529 () Bool)

(assert (=> b!163480 m!259529))

(declare-fun m!259531 () Bool)

(assert (=> b!163477 m!259531))

(push 1)

(assert (not b!163477))

(assert (not b!163478))

(assert (not b!163474))

(assert (not b!163480))

(assert (not b!163475))

(assert (not b!163476))

(assert (not start!34464))

(check-sat)

