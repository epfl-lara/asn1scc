; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29780 () Bool)

(assert start!29780)

(declare-fun b!153327 () Bool)

(declare-fun e!102760 () Bool)

(declare-datatypes ((array!6891 0))(
  ( (array!6892 (arr!3931 (Array (_ BitVec 32) (_ BitVec 8))) (size!3108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5474 0))(
  ( (BitStream!5475 (buf!3611 array!6891) (currentByte!6603 (_ BitVec 32)) (currentBit!6598 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5474)

(declare-fun array_inv!2897 (array!6891) Bool)

(assert (=> b!153327 (= e!102760 (array_inv!2897 (buf!3611 bs2!18)))))

(declare-fun b!153328 () Bool)

(declare-fun e!102765 () Bool)

(declare-fun e!102763 () Bool)

(assert (=> b!153328 (= e!102765 e!102763)))

(declare-fun res!128436 () Bool)

(assert (=> b!153328 (=> (not res!128436) (not e!102763))))

(declare-fun lt!239707 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5474)

(assert (=> b!153328 (= res!128436 (bvsle lt!239707 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3108 (buf!3611 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153328 (= lt!239707 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3108 (buf!3611 bs1!10)) (currentByte!6603 bs1!10) (currentBit!6598 bs1!10))))))

(declare-fun b!153329 () Bool)

(declare-fun res!128438 () Bool)

(assert (=> b!153329 (=> (not res!128438) (not e!102763))))

(declare-fun arrayBitRangesEq!0 (array!6891 array!6891 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153329 (= res!128438 (arrayBitRangesEq!0 (buf!3611 bs1!10) (buf!3611 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239707))))

(declare-fun b!153330 () Bool)

(declare-fun res!128437 () Bool)

(assert (=> b!153330 (=> (not res!128437) (not e!102763))))

(assert (=> b!153330 (= res!128437 (bvsle lt!239707 (bitIndex!0 (size!3108 (buf!3611 bs2!18)) (currentByte!6603 bs2!18) (currentBit!6598 bs2!18))))))

(declare-fun b!153331 () Bool)

(declare-fun e!102761 () Bool)

(assert (=> b!153331 (= e!102761 (array_inv!2897 (buf!3611 bs1!10)))))

(declare-fun res!128439 () Bool)

(assert (=> start!29780 (=> (not res!128439) (not e!102765))))

(assert (=> start!29780 (= res!128439 (= (size!3108 (buf!3611 bs1!10)) (size!3108 (buf!3611 bs2!18))))))

(assert (=> start!29780 e!102765))

(declare-fun inv!12 (BitStream!5474) Bool)

(assert (=> start!29780 (and (inv!12 bs1!10) e!102761)))

(assert (=> start!29780 (and (inv!12 bs2!18) e!102760)))

(declare-fun b!153332 () Bool)

(assert (=> b!153332 (= e!102763 false)))

(declare-datatypes ((tuple2!13604 0))(
  ( (tuple2!13605 (_1!7192 BitStream!5474) (_2!7192 (_ BitVec 8))) )
))
(declare-fun lt!239706 () tuple2!13604)

(declare-fun readBytePure!0 (BitStream!5474) tuple2!13604)

(assert (=> b!153332 (= lt!239706 (readBytePure!0 (BitStream!5475 (buf!3611 bs2!18) (currentByte!6603 bs1!10) (currentBit!6598 bs1!10))))))

(declare-fun lt!239705 () tuple2!13604)

(assert (=> b!153332 (= lt!239705 (readBytePure!0 bs1!10))))

(assert (= (and start!29780 res!128439) b!153328))

(assert (= (and b!153328 res!128436) b!153330))

(assert (= (and b!153330 res!128437) b!153329))

(assert (= (and b!153329 res!128438) b!153332))

(assert (= start!29780 b!153331))

(assert (= start!29780 b!153327))

(declare-fun m!239131 () Bool)

(assert (=> b!153330 m!239131))

(declare-fun m!239133 () Bool)

(assert (=> b!153327 m!239133))

(declare-fun m!239135 () Bool)

(assert (=> b!153332 m!239135))

(declare-fun m!239137 () Bool)

(assert (=> b!153332 m!239137))

(declare-fun m!239139 () Bool)

(assert (=> b!153328 m!239139))

(declare-fun m!239141 () Bool)

(assert (=> b!153331 m!239141))

(declare-fun m!239143 () Bool)

(assert (=> b!153329 m!239143))

(declare-fun m!239145 () Bool)

(assert (=> start!29780 m!239145))

(declare-fun m!239147 () Bool)

(assert (=> start!29780 m!239147))

(push 1)

(assert (not b!153331))

(assert (not b!153330))

(assert (not start!29780))

(assert (not b!153328))

(assert (not b!153332))

(assert (not b!153327))

(assert (not b!153329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

