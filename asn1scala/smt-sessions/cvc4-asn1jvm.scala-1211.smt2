; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34474 () Bool)

(assert start!34474)

(declare-fun b!163588 () Bool)

(declare-fun res!136313 () Bool)

(declare-fun e!112992 () Bool)

(assert (=> b!163588 (=> res!136313 e!112992)))

(declare-datatypes ((array!8146 0))(
  ( (array!8147 (arr!4569 (Array (_ BitVec 32) (_ BitVec 8))) (size!3648 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6452 0))(
  ( (BitStream!6453 (buf!4100 array!8146) (currentByte!7653 (_ BitVec 32)) (currentBit!7648 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6452)

(declare-datatypes ((Unit!11352 0))(
  ( (Unit!11353) )
))
(declare-datatypes ((tuple2!14524 0))(
  ( (tuple2!14525 (_1!7853 Unit!11352) (_2!7853 BitStream!6452)) )
))
(declare-fun lt!256709 () tuple2!14524)

(declare-fun isPrefixOf!0 (BitStream!6452 BitStream!6452) Bool)

(assert (=> b!163588 (= res!136313 (not (isPrefixOf!0 thiss!1577 (_2!7853 lt!256709))))))

(declare-fun b!163589 () Bool)

(declare-fun res!136315 () Bool)

(declare-fun e!112994 () Bool)

(assert (=> b!163589 (=> (not res!136315) (not e!112994))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163589 (= res!136315 (validate_offset_bits!1 ((_ sign_extend 32) (size!3648 (buf!4100 thiss!1577))) ((_ sign_extend 32) (currentByte!7653 thiss!1577)) ((_ sign_extend 32) (currentBit!7648 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163590 () Bool)

(declare-fun e!112996 () Bool)

(assert (=> b!163590 (= e!112994 (not e!112996))))

(declare-fun res!136314 () Bool)

(assert (=> b!163590 (=> res!136314 e!112996)))

(declare-fun lt!256707 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163590 (= res!136314 (not (byteRangesEq!0 (select (arr!4569 (buf!4100 thiss!1577)) (currentByte!7653 thiss!1577)) lt!256707 #b00000000000000000000000000000000 (currentBit!7648 thiss!1577))))))

(declare-fun lt!256706 () array!8146)

(declare-fun arrayRangesEq!582 (array!8146 array!8146 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163590 (arrayRangesEq!582 (buf!4100 thiss!1577) lt!256706 #b00000000000000000000000000000000 (currentByte!7653 thiss!1577))))

(declare-fun lt!256710 () Unit!11352)

(declare-fun arrayUpdatedAtPrefixLemma!190 (array!8146 (_ BitVec 32) (_ BitVec 8)) Unit!11352)

(assert (=> b!163590 (= lt!256710 (arrayUpdatedAtPrefixLemma!190 (buf!4100 thiss!1577) (currentByte!7653 thiss!1577) lt!256707))))

(assert (=> b!163590 (= lt!256706 (array!8147 (store (arr!4569 (buf!4100 thiss!1577)) (currentByte!7653 thiss!1577) lt!256707) (size!3648 (buf!4100 thiss!1577))))))

(declare-fun lt!256708 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163590 (= lt!256707 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4569 (buf!4100 thiss!1577)) (currentByte!7653 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7648 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256708)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256708))))))

(assert (=> b!163590 (= lt!256708 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7648 thiss!1577) nBits!511)))))

(declare-fun b!163591 () Bool)

(assert (=> b!163591 (= e!112996 e!112992)))

(declare-fun res!136312 () Bool)

(assert (=> b!163591 (=> res!136312 e!112992)))

(assert (=> b!163591 (= res!136312 (not (= (size!3648 (buf!4100 thiss!1577)) (size!3648 (buf!4100 (_2!7853 lt!256709))))))))

(declare-fun moveBitIndex!0 (BitStream!6452 (_ BitVec 64)) tuple2!14524)

(assert (=> b!163591 (= lt!256709 (moveBitIndex!0 (BitStream!6453 lt!256706 (currentByte!7653 thiss!1577) (currentBit!7648 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163592 () Bool)

(declare-fun res!136316 () Bool)

(assert (=> b!163592 (=> (not res!136316) (not e!112994))))

(assert (=> b!163592 (= res!136316 (bvsle (bvadd (currentBit!7648 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163593 () Bool)

(declare-fun e!112995 () Bool)

(declare-fun array_inv!3389 (array!8146) Bool)

(assert (=> b!163593 (= e!112995 (array_inv!3389 (buf!4100 thiss!1577)))))

(declare-fun b!163594 () Bool)

(declare-fun res!136311 () Bool)

(assert (=> b!163594 (=> res!136311 e!112992)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163594 (= res!136311 (not (= (bitIndex!0 (size!3648 (buf!4100 (_2!7853 lt!256709))) (currentByte!7653 (_2!7853 lt!256709)) (currentBit!7648 (_2!7853 lt!256709))) (bvadd (bitIndex!0 (size!3648 (buf!4100 thiss!1577)) (currentByte!7653 thiss!1577) (currentBit!7648 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163587 () Bool)

(assert (=> b!163587 (= e!112992 true)))

(declare-datatypes ((tuple2!14526 0))(
  ( (tuple2!14527 (_1!7854 BitStream!6452) (_2!7854 BitStream!6452)) )
))
(declare-fun lt!256705 () tuple2!14526)

(declare-fun reader!0 (BitStream!6452 BitStream!6452) tuple2!14526)

(assert (=> b!163587 (= lt!256705 (reader!0 thiss!1577 (_2!7853 lt!256709)))))

(declare-fun res!136317 () Bool)

(assert (=> start!34474 (=> (not res!136317) (not e!112994))))

(assert (=> start!34474 (= res!136317 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34474 e!112994))

(assert (=> start!34474 true))

(declare-fun inv!12 (BitStream!6452) Bool)

(assert (=> start!34474 (and (inv!12 thiss!1577) e!112995)))

(assert (= (and start!34474 res!136317) b!163589))

(assert (= (and b!163589 res!136315) b!163592))

(assert (= (and b!163592 res!136316) b!163590))

(assert (= (and b!163590 (not res!136314)) b!163591))

(assert (= (and b!163591 (not res!136312)) b!163594))

(assert (= (and b!163594 (not res!136311)) b!163588))

(assert (= (and b!163588 (not res!136313)) b!163587))

(assert (= start!34474 b!163593))

(declare-fun m!259657 () Bool)

(assert (=> b!163594 m!259657))

(declare-fun m!259659 () Bool)

(assert (=> b!163594 m!259659))

(declare-fun m!259661 () Bool)

(assert (=> b!163589 m!259661))

(declare-fun m!259663 () Bool)

(assert (=> b!163588 m!259663))

(declare-fun m!259665 () Bool)

(assert (=> b!163590 m!259665))

(declare-fun m!259667 () Bool)

(assert (=> b!163590 m!259667))

(assert (=> b!163590 m!259667))

(declare-fun m!259669 () Bool)

(assert (=> b!163590 m!259669))

(declare-fun m!259671 () Bool)

(assert (=> b!163590 m!259671))

(declare-fun m!259673 () Bool)

(assert (=> b!163590 m!259673))

(declare-fun m!259675 () Bool)

(assert (=> b!163590 m!259675))

(declare-fun m!259677 () Bool)

(assert (=> b!163590 m!259677))

(declare-fun m!259679 () Bool)

(assert (=> b!163590 m!259679))

(declare-fun m!259681 () Bool)

(assert (=> b!163587 m!259681))

(declare-fun m!259683 () Bool)

(assert (=> b!163591 m!259683))

(declare-fun m!259685 () Bool)

(assert (=> start!34474 m!259685))

(declare-fun m!259687 () Bool)

(assert (=> b!163593 m!259687))

(push 1)

(assert (not b!163587))

(assert (not b!163590))

(assert (not b!163588))

(assert (not b!163591))

(assert (not start!34474))

(assert (not b!163593))

(assert (not b!163594))

(assert (not b!163589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

