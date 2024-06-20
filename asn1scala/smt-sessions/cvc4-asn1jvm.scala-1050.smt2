; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30092 () Bool)

(assert start!30092)

(declare-fun b!154395 () Bool)

(declare-fun e!103780 () Bool)

(declare-datatypes ((array!6987 0))(
  ( (array!6988 (arr!3970 (Array (_ BitVec 32) (_ BitVec 8))) (size!3147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5552 0))(
  ( (BitStream!5553 (buf!3650 array!6987) (currentByte!6672 (_ BitVec 32)) (currentBit!6667 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5552)

(declare-fun array_inv!2936 (array!6987) Bool)

(assert (=> b!154395 (= e!103780 (array_inv!2936 (buf!3650 bs2!18)))))

(declare-fun b!154396 () Bool)

(declare-fun e!103783 () Bool)

(declare-fun e!103782 () Bool)

(assert (=> b!154396 (= e!103783 e!103782)))

(declare-fun res!129222 () Bool)

(assert (=> b!154396 (=> (not res!129222) (not e!103782))))

(declare-fun lt!240758 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5552)

(assert (=> b!154396 (= res!129222 (bvsle lt!240758 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3147 (buf!3650 bs1!10))))))))

(declare-fun lt!240760 () (_ BitVec 64))

(assert (=> b!154396 (= lt!240758 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240760))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154396 (= lt!240760 (bitIndex!0 (size!3147 (buf!3650 bs1!10)) (currentByte!6672 bs1!10) (currentBit!6667 bs1!10)))))

(declare-fun b!154397 () Bool)

(declare-fun res!129225 () Bool)

(assert (=> b!154397 (=> (not res!129225) (not e!103782))))

(assert (=> b!154397 (= res!129225 (bvsle lt!240758 (bitIndex!0 (size!3147 (buf!3650 bs2!18)) (currentByte!6672 bs2!18) (currentBit!6667 bs2!18))))))

(declare-fun b!154398 () Bool)

(declare-fun res!129223 () Bool)

(assert (=> b!154398 (=> (not res!129223) (not e!103782))))

(declare-fun arrayBitRangesEq!0 (array!6987 array!6987 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154398 (= res!129223 (arrayBitRangesEq!0 (buf!3650 bs1!10) (buf!3650 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240758))))

(declare-fun b!154399 () Bool)

(declare-fun e!103784 () Bool)

(assert (=> b!154399 (= e!103784 (array_inv!2936 (buf!3650 bs1!10)))))

(declare-fun b!154400 () Bool)

(declare-fun lt!240759 () (_ BitVec 64))

(declare-fun lt!240761 () (_ BitVec 64))

(assert (=> b!154400 (= e!103782 (and (= lt!240759 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240759 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!240761) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!154400 (= lt!240759 (bvand lt!240761 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154400 (= lt!240761 (bvsdiv lt!240760 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13676 0))(
  ( (tuple2!13677 (_1!7237 BitStream!5552) (_2!7237 (_ BitVec 8))) )
))
(declare-fun lt!240762 () tuple2!13676)

(declare-fun readBytePure!0 (BitStream!5552) tuple2!13676)

(assert (=> b!154400 (= lt!240762 (readBytePure!0 (BitStream!5553 (buf!3650 bs2!18) (currentByte!6672 bs1!10) (currentBit!6667 bs1!10))))))

(declare-fun lt!240763 () tuple2!13676)

(assert (=> b!154400 (= lt!240763 (readBytePure!0 bs1!10))))

(declare-fun res!129224 () Bool)

(assert (=> start!30092 (=> (not res!129224) (not e!103783))))

(assert (=> start!30092 (= res!129224 (= (size!3147 (buf!3650 bs1!10)) (size!3147 (buf!3650 bs2!18))))))

(assert (=> start!30092 e!103783))

(declare-fun inv!12 (BitStream!5552) Bool)

(assert (=> start!30092 (and (inv!12 bs1!10) e!103784)))

(assert (=> start!30092 (and (inv!12 bs2!18) e!103780)))

(assert (= (and start!30092 res!129224) b!154396))

(assert (= (and b!154396 res!129222) b!154397))

(assert (= (and b!154397 res!129225) b!154398))

(assert (= (and b!154398 res!129223) b!154400))

(assert (= start!30092 b!154399))

(assert (= start!30092 b!154395))

(declare-fun m!240361 () Bool)

(assert (=> b!154395 m!240361))

(declare-fun m!240363 () Bool)

(assert (=> start!30092 m!240363))

(declare-fun m!240365 () Bool)

(assert (=> start!30092 m!240365))

(declare-fun m!240367 () Bool)

(assert (=> b!154400 m!240367))

(declare-fun m!240369 () Bool)

(assert (=> b!154400 m!240369))

(declare-fun m!240371 () Bool)

(assert (=> b!154397 m!240371))

(declare-fun m!240373 () Bool)

(assert (=> b!154399 m!240373))

(declare-fun m!240375 () Bool)

(assert (=> b!154398 m!240375))

(declare-fun m!240377 () Bool)

(assert (=> b!154396 m!240377))

(push 1)

(assert (not start!30092))

(assert (not b!154397))

(assert (not b!154399))

(assert (not b!154398))

(assert (not b!154395))

(assert (not b!154400))

(assert (not b!154396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

