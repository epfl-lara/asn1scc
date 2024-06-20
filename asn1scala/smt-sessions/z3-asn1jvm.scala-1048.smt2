; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30078 () Bool)

(assert start!30078)

(declare-fun b!154269 () Bool)

(declare-fun e!103654 () Bool)

(assert (=> b!154269 (= e!103654 false)))

(declare-datatypes ((array!6973 0))(
  ( (array!6974 (arr!3963 (Array (_ BitVec 32) (_ BitVec 8))) (size!3140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5538 0))(
  ( (BitStream!5539 (buf!3643 array!6973) (currentByte!6665 (_ BitVec 32)) (currentBit!6660 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13662 0))(
  ( (tuple2!13663 (_1!7230 BitStream!5538) (_2!7230 (_ BitVec 8))) )
))
(declare-fun lt!240671 () tuple2!13662)

(declare-fun bs2!18 () BitStream!5538)

(declare-fun bs1!10 () BitStream!5538)

(declare-fun readBytePure!0 (BitStream!5538) tuple2!13662)

(assert (=> b!154269 (= lt!240671 (readBytePure!0 (BitStream!5539 (buf!3643 bs2!18) (currentByte!6665 bs1!10) (currentBit!6660 bs1!10))))))

(declare-fun lt!240673 () tuple2!13662)

(assert (=> b!154269 (= lt!240673 (readBytePure!0 bs1!10))))

(declare-fun b!154270 () Bool)

(declare-fun res!129140 () Bool)

(assert (=> b!154270 (=> (not res!129140) (not e!103654))))

(declare-fun lt!240672 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6973 array!6973 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154270 (= res!129140 (arrayBitRangesEq!0 (buf!3643 bs1!10) (buf!3643 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240672))))

(declare-fun b!154271 () Bool)

(declare-fun e!103659 () Bool)

(declare-fun array_inv!2929 (array!6973) Bool)

(assert (=> b!154271 (= e!103659 (array_inv!2929 (buf!3643 bs1!10)))))

(declare-fun b!154272 () Bool)

(declare-fun res!129138 () Bool)

(assert (=> b!154272 (=> (not res!129138) (not e!103654))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154272 (= res!129138 (bvsle lt!240672 (bitIndex!0 (size!3140 (buf!3643 bs2!18)) (currentByte!6665 bs2!18) (currentBit!6660 bs2!18))))))

(declare-fun b!154273 () Bool)

(declare-fun e!103658 () Bool)

(assert (=> b!154273 (= e!103658 e!103654)))

(declare-fun res!129139 () Bool)

(assert (=> b!154273 (=> (not res!129139) (not e!103654))))

(assert (=> b!154273 (= res!129139 (bvsle lt!240672 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3140 (buf!3643 bs1!10))))))))

(assert (=> b!154273 (= lt!240672 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3140 (buf!3643 bs1!10)) (currentByte!6665 bs1!10) (currentBit!6660 bs1!10))))))

(declare-fun res!129141 () Bool)

(assert (=> start!30078 (=> (not res!129141) (not e!103658))))

(assert (=> start!30078 (= res!129141 (= (size!3140 (buf!3643 bs1!10)) (size!3140 (buf!3643 bs2!18))))))

(assert (=> start!30078 e!103658))

(declare-fun inv!12 (BitStream!5538) Bool)

(assert (=> start!30078 (and (inv!12 bs1!10) e!103659)))

(declare-fun e!103655 () Bool)

(assert (=> start!30078 (and (inv!12 bs2!18) e!103655)))

(declare-fun b!154274 () Bool)

(assert (=> b!154274 (= e!103655 (array_inv!2929 (buf!3643 bs2!18)))))

(assert (= (and start!30078 res!129141) b!154273))

(assert (= (and b!154273 res!129139) b!154272))

(assert (= (and b!154272 res!129138) b!154270))

(assert (= (and b!154270 res!129140) b!154269))

(assert (= start!30078 b!154271))

(assert (= start!30078 b!154274))

(declare-fun m!240235 () Bool)

(assert (=> b!154270 m!240235))

(declare-fun m!240237 () Bool)

(assert (=> b!154274 m!240237))

(declare-fun m!240239 () Bool)

(assert (=> b!154272 m!240239))

(declare-fun m!240241 () Bool)

(assert (=> b!154273 m!240241))

(declare-fun m!240243 () Bool)

(assert (=> start!30078 m!240243))

(declare-fun m!240245 () Bool)

(assert (=> start!30078 m!240245))

(declare-fun m!240247 () Bool)

(assert (=> b!154271 m!240247))

(declare-fun m!240249 () Bool)

(assert (=> b!154269 m!240249))

(declare-fun m!240251 () Bool)

(assert (=> b!154269 m!240251))

(check-sat (not b!154273) (not b!154272) (not b!154271) (not b!154270) (not start!30078) (not b!154269) (not b!154274))
