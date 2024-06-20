; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49000 () Bool)

(assert start!49000)

(declare-fun res!194583 () Bool)

(declare-fun e!160040 () Bool)

(assert (=> start!49000 (=> (not res!194583) (not e!160040))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11969 0))(
  ( (array!11970 (arr!6237 (Array (_ BitVec 32) (_ BitVec 8))) (size!5250 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9596 0))(
  ( (BitStream!9597 (buf!5791 array!11969) (currentByte!10798 (_ BitVec 32)) (currentBit!10793 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9596)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9596)

(assert (=> start!49000 (= res!194583 (and (= (size!5250 (buf!5791 b1!101)) (size!5250 (buf!5791 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49000 e!160040))

(declare-fun e!160042 () Bool)

(declare-fun inv!12 (BitStream!9596) Bool)

(assert (=> start!49000 (and (inv!12 b1!101) e!160042)))

(declare-fun e!160041 () Bool)

(assert (=> start!49000 (and (inv!12 b2!99) e!160041)))

(assert (=> start!49000 true))

(declare-fun b!232472 () Bool)

(declare-fun array_inv!4991 (array!11969) Bool)

(assert (=> b!232472 (= e!160042 (array_inv!4991 (buf!5791 b1!101)))))

(declare-fun lt!368949 () (_ BitVec 64))

(declare-fun lt!368948 () (_ BitVec 64))

(declare-fun b!232473 () Bool)

(declare-fun e!160039 () Bool)

(assert (=> b!232473 (= e!160039 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5250 (buf!5791 b1!101)))) lt!368948) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14365 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10798 b2!99))))) (let ((bdg!14366 (bvadd bdg!14365 ((_ sign_extend 32) (currentBit!10793 b2!99))))) (and (= lt!368949 bdg!14366) (= (bvsub lt!368949 bits!86) lt!368948) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5250 (buf!5791 b2!99)))) (bvsub bdg!14366 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14367 (bvand bdg!14365 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14367 (bvand ((_ sign_extend 32) (currentBit!10793 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14367 (bvand bdg!14366 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!232473 (= lt!368948 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10798 b1!101))) ((_ sign_extend 32) (currentBit!10793 b1!101))))))

(declare-fun b!232474 () Bool)

(declare-fun res!194585 () Bool)

(assert (=> b!232474 (=> (not res!194585) (not e!160039))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232474 (= res!194585 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5250 (buf!5791 b1!101))) ((_ sign_extend 32) (currentByte!10798 b1!101)) ((_ sign_extend 32) (currentBit!10793 b1!101)) bytes!19))))

(declare-fun b!232475 () Bool)

(assert (=> b!232475 (= e!160041 (array_inv!4991 (buf!5791 b2!99)))))

(declare-fun b!232476 () Bool)

(assert (=> b!232476 (= e!160040 e!160039)))

(declare-fun res!194584 () Bool)

(assert (=> b!232476 (=> (not res!194584) (not e!160039))))

(assert (=> b!232476 (= res!194584 (and (bvsle bits!86 lt!368949) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232476 (= lt!368949 (bitIndex!0 (size!5250 (buf!5791 b2!99)) (currentByte!10798 b2!99) (currentBit!10793 b2!99)))))

(declare-fun b!232477 () Bool)

(declare-fun res!194582 () Bool)

(assert (=> b!232477 (=> (not res!194582) (not e!160039))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232477 (= res!194582 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5250 (buf!5791 b1!101))) ((_ sign_extend 32) (currentByte!10798 b1!101)) ((_ sign_extend 32) (currentBit!10793 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232478 () Bool)

(declare-fun res!194586 () Bool)

(assert (=> b!232478 (=> (not res!194586) (not e!160039))))

(assert (=> b!232478 (= res!194586 (= lt!368949 (bvadd (bitIndex!0 (size!5250 (buf!5791 b1!101)) (currentByte!10798 b1!101) (currentBit!10793 b1!101)) bits!86)))))

(assert (= (and start!49000 res!194583) b!232476))

(assert (= (and b!232476 res!194584) b!232474))

(assert (= (and b!232474 res!194585) b!232478))

(assert (= (and b!232478 res!194586) b!232477))

(assert (= (and b!232477 res!194582) b!232473))

(assert (= start!49000 b!232472))

(assert (= start!49000 b!232475))

(declare-fun m!355351 () Bool)

(assert (=> b!232476 m!355351))

(declare-fun m!355353 () Bool)

(assert (=> start!49000 m!355353))

(declare-fun m!355355 () Bool)

(assert (=> start!49000 m!355355))

(declare-fun m!355357 () Bool)

(assert (=> b!232475 m!355357))

(declare-fun m!355359 () Bool)

(assert (=> b!232474 m!355359))

(declare-fun m!355361 () Bool)

(assert (=> b!232477 m!355361))

(declare-fun m!355363 () Bool)

(assert (=> b!232472 m!355363))

(declare-fun m!355365 () Bool)

(assert (=> b!232478 m!355365))

(push 1)

(assert (not b!232474))

(assert (not b!232475))

(assert (not b!232476))

(assert (not b!232478))

(assert (not b!232472))

(assert (not start!49000))

(assert (not b!232477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

