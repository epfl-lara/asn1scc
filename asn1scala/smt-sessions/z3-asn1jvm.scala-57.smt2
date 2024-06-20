; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1102 () Bool)

(assert start!1102)

(declare-fun b!4605 () Bool)

(declare-fun res!5939 () Bool)

(declare-fun e!3016 () Bool)

(assert (=> b!4605 (=> (not res!5939) (not e!3016))))

(declare-datatypes ((array!365 0))(
  ( (array!366 (arr!545 (Array (_ BitVec 32) (_ BitVec 8))) (size!155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!288 0))(
  ( (BitStream!289 (buf!476 array!365) (currentByte!1455 (_ BitVec 32)) (currentBit!1450 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!288)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4605 (= res!5939 (validate_offset_bits!1 ((_ sign_extend 32) (size!155 (buf!476 thiss!1486))) ((_ sign_extend 32) (currentByte!1455 thiss!1486)) ((_ sign_extend 32) (currentBit!1450 thiss!1486)) nBits!460))))

(declare-fun b!4606 () Bool)

(declare-fun e!3018 () Bool)

(declare-fun array_inv!150 (array!365) Bool)

(assert (=> b!4606 (= e!3018 (array_inv!150 (buf!476 thiss!1486)))))

(declare-fun b!4607 () Bool)

(declare-fun e!3020 () Bool)

(assert (=> b!4607 (= e!3020 (not true))))

(declare-datatypes ((Unit!360 0))(
  ( (Unit!361) )
))
(declare-datatypes ((tuple2!574 0))(
  ( (tuple2!575 (_1!303 Unit!360) (_2!303 BitStream!288)) )
))
(declare-fun lt!5555 () tuple2!574)

(declare-datatypes ((List!55 0))(
  ( (Nil!52) (Cons!51 (h!170 Bool) (t!805 List!55)) )
))
(declare-fun lt!5551 () List!55)

(declare-datatypes ((tuple2!576 0))(
  ( (tuple2!577 (_1!304 BitStream!288) (_2!304 BitStream!288)) )
))
(declare-fun lt!5552 () tuple2!576)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!288 BitStream!288 (_ BitVec 64)) List!55)

(assert (=> b!4607 (= lt!5551 (bitStreamReadBitsIntoList!0 (_2!303 lt!5555) (_1!304 lt!5552) nBits!460))))

(declare-datatypes ((tuple2!578 0))(
  ( (tuple2!579 (_1!305 array!365) (_2!305 BitStream!288)) )
))
(declare-fun lt!5554 () tuple2!578)

(declare-fun readBits!0 (BitStream!288 (_ BitVec 64)) tuple2!578)

(assert (=> b!4607 (= lt!5554 (readBits!0 (_1!304 lt!5552) nBits!460))))

(assert (=> b!4607 (validate_offset_bits!1 ((_ sign_extend 32) (size!155 (buf!476 (_2!303 lt!5555)))) ((_ sign_extend 32) (currentByte!1455 thiss!1486)) ((_ sign_extend 32) (currentBit!1450 thiss!1486)) nBits!460)))

(declare-fun lt!5553 () Unit!360)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!288 array!365 (_ BitVec 64)) Unit!360)

(assert (=> b!4607 (= lt!5553 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!476 (_2!303 lt!5555)) nBits!460))))

(declare-fun reader!0 (BitStream!288 BitStream!288) tuple2!576)

(assert (=> b!4607 (= lt!5552 (reader!0 thiss!1486 (_2!303 lt!5555)))))

(declare-fun res!5940 () Bool)

(assert (=> start!1102 (=> (not res!5940) (not e!3016))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!365)

(assert (=> start!1102 (= res!5940 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!155 srcBuffer!6))))))))

(assert (=> start!1102 e!3016))

(assert (=> start!1102 true))

(assert (=> start!1102 (array_inv!150 srcBuffer!6)))

(declare-fun inv!12 (BitStream!288) Bool)

(assert (=> start!1102 (and (inv!12 thiss!1486) e!3018)))

(declare-fun b!4608 () Bool)

(assert (=> b!4608 (= e!3016 e!3020)))

(declare-fun res!5944 () Bool)

(assert (=> b!4608 (=> (not res!5944) (not e!3020))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4608 (= res!5944 (invariant!0 (currentBit!1450 (_2!303 lt!5555)) (currentByte!1455 (_2!303 lt!5555)) (size!155 (buf!476 (_2!303 lt!5555)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!288 array!365 (_ BitVec 64) (_ BitVec 64)) tuple2!574)

(assert (=> b!4608 (= lt!5555 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4609 () Bool)

(declare-fun res!5943 () Bool)

(assert (=> b!4609 (=> (not res!5943) (not e!3020))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4609 (= res!5943 (= (bitIndex!0 (size!155 (buf!476 (_2!303 lt!5555))) (currentByte!1455 (_2!303 lt!5555)) (currentBit!1450 (_2!303 lt!5555))) (bvadd (bitIndex!0 (size!155 (buf!476 thiss!1486)) (currentByte!1455 thiss!1486) (currentBit!1450 thiss!1486)) nBits!460)))))

(declare-fun b!4610 () Bool)

(declare-fun res!5942 () Bool)

(assert (=> b!4610 (=> (not res!5942) (not e!3020))))

(declare-fun isPrefixOf!0 (BitStream!288 BitStream!288) Bool)

(assert (=> b!4610 (= res!5942 (isPrefixOf!0 thiss!1486 (_2!303 lt!5555)))))

(declare-fun b!4611 () Bool)

(declare-fun res!5941 () Bool)

(assert (=> b!4611 (=> (not res!5941) (not e!3020))))

(assert (=> b!4611 (= res!5941 (= (size!155 (buf!476 thiss!1486)) (size!155 (buf!476 (_2!303 lt!5555)))))))

(assert (= (and start!1102 res!5940) b!4605))

(assert (= (and b!4605 res!5939) b!4608))

(assert (= (and b!4608 res!5944) b!4611))

(assert (= (and b!4611 res!5941) b!4609))

(assert (= (and b!4609 res!5943) b!4610))

(assert (= (and b!4610 res!5942) b!4607))

(assert (= start!1102 b!4606))

(declare-fun m!5461 () Bool)

(assert (=> start!1102 m!5461))

(declare-fun m!5463 () Bool)

(assert (=> start!1102 m!5463))

(declare-fun m!5465 () Bool)

(assert (=> b!4610 m!5465))

(declare-fun m!5467 () Bool)

(assert (=> b!4605 m!5467))

(declare-fun m!5469 () Bool)

(assert (=> b!4608 m!5469))

(declare-fun m!5471 () Bool)

(assert (=> b!4608 m!5471))

(declare-fun m!5473 () Bool)

(assert (=> b!4606 m!5473))

(declare-fun m!5475 () Bool)

(assert (=> b!4609 m!5475))

(declare-fun m!5477 () Bool)

(assert (=> b!4609 m!5477))

(declare-fun m!5479 () Bool)

(assert (=> b!4607 m!5479))

(declare-fun m!5481 () Bool)

(assert (=> b!4607 m!5481))

(declare-fun m!5483 () Bool)

(assert (=> b!4607 m!5483))

(declare-fun m!5485 () Bool)

(assert (=> b!4607 m!5485))

(declare-fun m!5487 () Bool)

(assert (=> b!4607 m!5487))

(check-sat (not b!4606) (not b!4608) (not b!4607) (not b!4610) (not start!1102) (not b!4605) (not b!4609))
