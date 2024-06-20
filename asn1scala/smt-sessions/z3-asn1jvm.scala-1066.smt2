; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30588 () Bool)

(assert start!30588)

(declare-fun res!130279 () Bool)

(declare-fun e!105106 () Bool)

(assert (=> start!30588 (=> (not res!130279) (not e!105106))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7112 0))(
  ( (array!7113 (arr!4026 (Array (_ BitVec 32) (_ BitVec 8))) (size!3194 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7112)

(assert (=> start!30588 (= res!130279 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3194 arr!153))))))

(assert (=> start!30588 e!105106))

(assert (=> start!30588 true))

(declare-fun array_inv!2983 (array!7112) Bool)

(assert (=> start!30588 (array_inv!2983 arr!153)))

(declare-datatypes ((BitStream!5646 0))(
  ( (BitStream!5647 (buf!3697 array!7112) (currentByte!6770 (_ BitVec 32)) (currentBit!6765 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5646)

(declare-fun e!105107 () Bool)

(declare-fun inv!12 (BitStream!5646) Bool)

(assert (=> start!30588 (and (inv!12 bs!65) e!105107)))

(declare-fun b!155807 () Bool)

(declare-fun res!130280 () Bool)

(assert (=> b!155807 (=> (not res!130280) (not e!105106))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155807 (= res!130280 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3194 (buf!3697 bs!65))) ((_ sign_extend 32) (currentByte!6770 bs!65)) ((_ sign_extend 32) (currentBit!6765 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155808 () Bool)

(assert (=> b!155808 (= e!105106 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-datatypes ((tuple2!13814 0))(
  ( (tuple2!13815 (_1!7333 BitStream!5646) (_2!7333 (_ BitVec 8))) )
))
(declare-fun lt!242472 () tuple2!13814)

(declare-fun readBytePure!0 (BitStream!5646) tuple2!13814)

(assert (=> b!155808 (= lt!242472 (readBytePure!0 bs!65))))

(declare-fun lt!242473 () BitStream!5646)

(declare-fun withMovedByteIndex!0 (BitStream!5646 (_ BitVec 32)) BitStream!5646)

(assert (=> b!155808 (= lt!242473 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13816 0))(
  ( (tuple2!13817 (_1!7334 BitStream!5646) (_2!7334 array!7112)) )
))
(declare-fun lt!242471 () tuple2!13816)

(declare-fun readByteArrayLoopPure!0 (BitStream!5646 array!7112 (_ BitVec 32) (_ BitVec 32)) tuple2!13816)

(assert (=> b!155808 (= lt!242471 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155809 () Bool)

(assert (=> b!155809 (= e!105107 (array_inv!2983 (buf!3697 bs!65)))))

(assert (= (and start!30588 res!130279) b!155807))

(assert (= (and b!155807 res!130280) b!155808))

(assert (= start!30588 b!155809))

(declare-fun m!242105 () Bool)

(assert (=> start!30588 m!242105))

(declare-fun m!242107 () Bool)

(assert (=> start!30588 m!242107))

(declare-fun m!242109 () Bool)

(assert (=> b!155807 m!242109))

(declare-fun m!242111 () Bool)

(assert (=> b!155808 m!242111))

(declare-fun m!242113 () Bool)

(assert (=> b!155808 m!242113))

(declare-fun m!242115 () Bool)

(assert (=> b!155808 m!242115))

(declare-fun m!242117 () Bool)

(assert (=> b!155809 m!242117))

(check-sat (not start!30588) (not b!155809) (not b!155808) (not b!155807))
