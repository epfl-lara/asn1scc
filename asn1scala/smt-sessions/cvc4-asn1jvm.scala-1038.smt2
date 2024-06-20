; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29786 () Bool)

(assert start!29786)

(declare-fun b!153381 () Bool)

(declare-fun e!102814 () Bool)

(declare-datatypes ((array!6897 0))(
  ( (array!6898 (arr!3934 (Array (_ BitVec 32) (_ BitVec 8))) (size!3111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5480 0))(
  ( (BitStream!5481 (buf!3614 array!6897) (currentByte!6606 (_ BitVec 32)) (currentBit!6601 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5480)

(declare-fun array_inv!2900 (array!6897) Bool)

(assert (=> b!153381 (= e!102814 (array_inv!2900 (buf!3614 bs2!18)))))

(declare-fun b!153382 () Bool)

(declare-fun e!102818 () Bool)

(assert (=> b!153382 (= e!102818 false)))

(declare-datatypes ((tuple2!13610 0))(
  ( (tuple2!13611 (_1!7195 BitStream!5480) (_2!7195 (_ BitVec 8))) )
))
(declare-fun lt!239734 () tuple2!13610)

(declare-fun bs1!10 () BitStream!5480)

(declare-fun readBytePure!0 (BitStream!5480) tuple2!13610)

(assert (=> b!153382 (= lt!239734 (readBytePure!0 (BitStream!5481 (buf!3614 bs2!18) (currentByte!6606 bs1!10) (currentBit!6601 bs1!10))))))

(declare-fun lt!239733 () tuple2!13610)

(assert (=> b!153382 (= lt!239733 (readBytePure!0 bs1!10))))

(declare-fun res!128474 () Bool)

(declare-fun e!102819 () Bool)

(assert (=> start!29786 (=> (not res!128474) (not e!102819))))

(assert (=> start!29786 (= res!128474 (= (size!3111 (buf!3614 bs1!10)) (size!3111 (buf!3614 bs2!18))))))

(assert (=> start!29786 e!102819))

(declare-fun e!102816 () Bool)

(declare-fun inv!12 (BitStream!5480) Bool)

(assert (=> start!29786 (and (inv!12 bs1!10) e!102816)))

(assert (=> start!29786 (and (inv!12 bs2!18) e!102814)))

(declare-fun b!153383 () Bool)

(assert (=> b!153383 (= e!102819 e!102818)))

(declare-fun res!128472 () Bool)

(assert (=> b!153383 (=> (not res!128472) (not e!102818))))

(declare-fun lt!239732 () (_ BitVec 64))

(assert (=> b!153383 (= res!128472 (bvsle lt!239732 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3111 (buf!3614 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153383 (= lt!239732 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3111 (buf!3614 bs1!10)) (currentByte!6606 bs1!10) (currentBit!6601 bs1!10))))))

(declare-fun b!153384 () Bool)

(declare-fun res!128475 () Bool)

(assert (=> b!153384 (=> (not res!128475) (not e!102818))))

(assert (=> b!153384 (= res!128475 (bvsle lt!239732 (bitIndex!0 (size!3111 (buf!3614 bs2!18)) (currentByte!6606 bs2!18) (currentBit!6601 bs2!18))))))

(declare-fun b!153385 () Bool)

(declare-fun res!128473 () Bool)

(assert (=> b!153385 (=> (not res!128473) (not e!102818))))

(declare-fun arrayBitRangesEq!0 (array!6897 array!6897 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153385 (= res!128473 (arrayBitRangesEq!0 (buf!3614 bs1!10) (buf!3614 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239732))))

(declare-fun b!153386 () Bool)

(assert (=> b!153386 (= e!102816 (array_inv!2900 (buf!3614 bs1!10)))))

(assert (= (and start!29786 res!128474) b!153383))

(assert (= (and b!153383 res!128472) b!153384))

(assert (= (and b!153384 res!128475) b!153385))

(assert (= (and b!153385 res!128473) b!153382))

(assert (= start!29786 b!153386))

(assert (= start!29786 b!153381))

(declare-fun m!239185 () Bool)

(assert (=> b!153386 m!239185))

(declare-fun m!239187 () Bool)

(assert (=> b!153383 m!239187))

(declare-fun m!239189 () Bool)

(assert (=> b!153385 m!239189))

(declare-fun m!239191 () Bool)

(assert (=> b!153382 m!239191))

(declare-fun m!239193 () Bool)

(assert (=> b!153382 m!239193))

(declare-fun m!239195 () Bool)

(assert (=> start!29786 m!239195))

(declare-fun m!239197 () Bool)

(assert (=> start!29786 m!239197))

(declare-fun m!239199 () Bool)

(assert (=> b!153384 m!239199))

(declare-fun m!239201 () Bool)

(assert (=> b!153381 m!239201))

(push 1)

(assert (not b!153381))

(assert (not b!153382))

(assert (not start!29786))

(assert (not b!153385))

(assert (not b!153383))

(assert (not b!153384))

(assert (not b!153386))

(check-sat)

(pop 1)

