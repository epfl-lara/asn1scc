; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29782 () Bool)

(assert start!29782)

(declare-fun b!153345 () Bool)

(declare-fun res!128448 () Bool)

(declare-fun e!102782 () Bool)

(assert (=> b!153345 (=> (not res!128448) (not e!102782))))

(declare-fun lt!239715 () (_ BitVec 64))

(declare-datatypes ((array!6893 0))(
  ( (array!6894 (arr!3932 (Array (_ BitVec 32) (_ BitVec 8))) (size!3109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5476 0))(
  ( (BitStream!5477 (buf!3612 array!6893) (currentByte!6604 (_ BitVec 32)) (currentBit!6599 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5476)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153345 (= res!128448 (bvsle lt!239715 (bitIndex!0 (size!3109 (buf!3612 bs2!18)) (currentByte!6604 bs2!18) (currentBit!6599 bs2!18))))))

(declare-fun b!153346 () Bool)

(declare-fun e!102783 () Bool)

(assert (=> b!153346 (= e!102783 e!102782)))

(declare-fun res!128450 () Bool)

(assert (=> b!153346 (=> (not res!128450) (not e!102782))))

(declare-fun bs1!10 () BitStream!5476)

(assert (=> b!153346 (= res!128450 (bvsle lt!239715 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3109 (buf!3612 bs1!10))))))))

(assert (=> b!153346 (= lt!239715 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3109 (buf!3612 bs1!10)) (currentByte!6604 bs1!10) (currentBit!6599 bs1!10))))))

(declare-fun b!153347 () Bool)

(assert (=> b!153347 (= e!102782 false)))

(declare-datatypes ((tuple2!13606 0))(
  ( (tuple2!13607 (_1!7193 BitStream!5476) (_2!7193 (_ BitVec 8))) )
))
(declare-fun lt!239716 () tuple2!13606)

(declare-fun readBytePure!0 (BitStream!5476) tuple2!13606)

(assert (=> b!153347 (= lt!239716 (readBytePure!0 (BitStream!5477 (buf!3612 bs2!18) (currentByte!6604 bs1!10) (currentBit!6599 bs1!10))))))

(declare-fun lt!239714 () tuple2!13606)

(assert (=> b!153347 (= lt!239714 (readBytePure!0 bs1!10))))

(declare-fun b!153348 () Bool)

(declare-fun e!102780 () Bool)

(declare-fun array_inv!2898 (array!6893) Bool)

(assert (=> b!153348 (= e!102780 (array_inv!2898 (buf!3612 bs1!10)))))

(declare-fun b!153349 () Bool)

(declare-fun e!102779 () Bool)

(assert (=> b!153349 (= e!102779 (array_inv!2898 (buf!3612 bs2!18)))))

(declare-fun res!128451 () Bool)

(assert (=> start!29782 (=> (not res!128451) (not e!102783))))

(assert (=> start!29782 (= res!128451 (= (size!3109 (buf!3612 bs1!10)) (size!3109 (buf!3612 bs2!18))))))

(assert (=> start!29782 e!102783))

(declare-fun inv!12 (BitStream!5476) Bool)

(assert (=> start!29782 (and (inv!12 bs1!10) e!102780)))

(assert (=> start!29782 (and (inv!12 bs2!18) e!102779)))

(declare-fun b!153350 () Bool)

(declare-fun res!128449 () Bool)

(assert (=> b!153350 (=> (not res!128449) (not e!102782))))

(declare-fun arrayBitRangesEq!0 (array!6893 array!6893 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153350 (= res!128449 (arrayBitRangesEq!0 (buf!3612 bs1!10) (buf!3612 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239715))))

(assert (= (and start!29782 res!128451) b!153346))

(assert (= (and b!153346 res!128450) b!153345))

(assert (= (and b!153345 res!128448) b!153350))

(assert (= (and b!153350 res!128449) b!153347))

(assert (= start!29782 b!153348))

(assert (= start!29782 b!153349))

(declare-fun m!239149 () Bool)

(assert (=> start!29782 m!239149))

(declare-fun m!239151 () Bool)

(assert (=> start!29782 m!239151))

(declare-fun m!239153 () Bool)

(assert (=> b!153350 m!239153))

(declare-fun m!239155 () Bool)

(assert (=> b!153349 m!239155))

(declare-fun m!239157 () Bool)

(assert (=> b!153346 m!239157))

(declare-fun m!239159 () Bool)

(assert (=> b!153348 m!239159))

(declare-fun m!239161 () Bool)

(assert (=> b!153347 m!239161))

(declare-fun m!239163 () Bool)

(assert (=> b!153347 m!239163))

(declare-fun m!239165 () Bool)

(assert (=> b!153345 m!239165))

(push 1)

(assert (not start!29782))

(assert (not b!153347))

(assert (not b!153345))

(assert (not b!153348))

(assert (not b!153349))

(assert (not b!153350))

(assert (not b!153346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

