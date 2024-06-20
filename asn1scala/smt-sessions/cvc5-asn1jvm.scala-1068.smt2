; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30664 () Bool)

(assert start!30664)

(declare-fun res!130375 () Bool)

(declare-fun e!105228 () Bool)

(assert (=> start!30664 (=> (not res!130375) (not e!105228))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7125 0))(
  ( (array!7126 (arr!4037 (Array (_ BitVec 32) (_ BitVec 8))) (size!3199 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7125)

(assert (=> start!30664 (= res!130375 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3199 arr!153))))))

(assert (=> start!30664 e!105228))

(assert (=> start!30664 true))

(declare-fun array_inv!2988 (array!7125) Bool)

(assert (=> start!30664 (array_inv!2988 arr!153)))

(declare-datatypes ((BitStream!5656 0))(
  ( (BitStream!5657 (buf!3702 array!7125) (currentByte!6784 (_ BitVec 32)) (currentBit!6779 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5656)

(declare-fun e!105227 () Bool)

(declare-fun inv!12 (BitStream!5656) Bool)

(assert (=> start!30664 (and (inv!12 bs!65) e!105227)))

(declare-fun b!155933 () Bool)

(declare-fun res!130376 () Bool)

(assert (=> b!155933 (=> (not res!130376) (not e!105228))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155933 (= res!130376 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3199 (buf!3702 bs!65))) ((_ sign_extend 32) (currentByte!6784 bs!65)) ((_ sign_extend 32) (currentBit!6779 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155934 () Bool)

(assert (=> b!155934 (= e!105228 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsgt #b00000000000000000000000000000000 to!236)))))

(declare-datatypes ((tuple2!13852 0))(
  ( (tuple2!13853 (_1!7355 BitStream!5656) (_2!7355 array!7125)) )
))
(declare-fun lt!242919 () tuple2!13852)

(declare-fun readByteArrayLoopPure!0 (BitStream!5656 array!7125 (_ BitVec 32) (_ BitVec 32)) tuple2!13852)

(declare-fun withMovedByteIndex!0 (BitStream!5656 (_ BitVec 32)) BitStream!5656)

(declare-datatypes ((tuple2!13854 0))(
  ( (tuple2!13855 (_1!7356 BitStream!5656) (_2!7356 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5656) tuple2!13854)

(assert (=> b!155934 (= lt!242919 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7126 (store (arr!4037 arr!153) from!240 (_2!7356 (readBytePure!0 bs!65))) (size!3199 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!242920 () tuple2!13852)

(assert (=> b!155934 (= lt!242920 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155935 () Bool)

(assert (=> b!155935 (= e!105227 (array_inv!2988 (buf!3702 bs!65)))))

(assert (= (and start!30664 res!130375) b!155933))

(assert (= (and b!155933 res!130376) b!155934))

(assert (= start!30664 b!155935))

(declare-fun m!242367 () Bool)

(assert (=> start!30664 m!242367))

(declare-fun m!242369 () Bool)

(assert (=> start!30664 m!242369))

(declare-fun m!242371 () Bool)

(assert (=> b!155933 m!242371))

(declare-fun m!242373 () Bool)

(assert (=> b!155934 m!242373))

(declare-fun m!242375 () Bool)

(assert (=> b!155934 m!242375))

(assert (=> b!155934 m!242375))

(declare-fun m!242377 () Bool)

(assert (=> b!155934 m!242377))

(declare-fun m!242379 () Bool)

(assert (=> b!155934 m!242379))

(declare-fun m!242381 () Bool)

(assert (=> b!155934 m!242381))

(declare-fun m!242383 () Bool)

(assert (=> b!155935 m!242383))

(push 1)

(assert (not b!155935))

(assert (not b!155934))

(assert (not start!30664))

(assert (not b!155933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

