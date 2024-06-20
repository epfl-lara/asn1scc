; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29770 () Bool)

(assert start!29770)

(declare-fun b!153237 () Bool)

(declare-fun e!102671 () Bool)

(declare-datatypes ((array!6881 0))(
  ( (array!6882 (arr!3926 (Array (_ BitVec 32) (_ BitVec 8))) (size!3103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5464 0))(
  ( (BitStream!5465 (buf!3606 array!6881) (currentByte!6598 (_ BitVec 32)) (currentBit!6593 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5464)

(declare-fun array_inv!2892 (array!6881) Bool)

(assert (=> b!153237 (= e!102671 (array_inv!2892 (buf!3606 bs1!10)))))

(declare-fun b!153238 () Bool)

(declare-fun e!102670 () Bool)

(declare-fun e!102673 () Bool)

(assert (=> b!153238 (= e!102670 e!102673)))

(declare-fun res!128378 () Bool)

(assert (=> b!153238 (=> (not res!128378) (not e!102673))))

(declare-fun lt!239661 () (_ BitVec 64))

(assert (=> b!153238 (= res!128378 (bvsle lt!239661 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3103 (buf!3606 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153238 (= lt!239661 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3103 (buf!3606 bs1!10)) (currentByte!6598 bs1!10) (currentBit!6593 bs1!10))))))

(declare-fun b!153239 () Bool)

(declare-fun e!102675 () Bool)

(declare-fun bs2!18 () BitStream!5464)

(assert (=> b!153239 (= e!102675 (array_inv!2892 (buf!3606 bs2!18)))))

(declare-fun b!153241 () Bool)

(assert (=> b!153241 (= e!102673 false)))

(declare-datatypes ((tuple2!13594 0))(
  ( (tuple2!13595 (_1!7187 BitStream!5464) (_2!7187 (_ BitVec 8))) )
))
(declare-fun lt!239662 () tuple2!13594)

(declare-fun readBytePure!0 (BitStream!5464) tuple2!13594)

(assert (=> b!153241 (= lt!239662 (readBytePure!0 (BitStream!5465 (buf!3606 bs2!18) (currentByte!6598 bs1!10) (currentBit!6593 bs1!10))))))

(declare-fun lt!239660 () tuple2!13594)

(assert (=> b!153241 (= lt!239660 (readBytePure!0 bs1!10))))

(declare-fun b!153242 () Bool)

(declare-fun res!128376 () Bool)

(assert (=> b!153242 (=> (not res!128376) (not e!102673))))

(declare-fun arrayBitRangesEq!0 (array!6881 array!6881 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153242 (= res!128376 (arrayBitRangesEq!0 (buf!3606 bs1!10) (buf!3606 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239661))))

(declare-fun res!128377 () Bool)

(assert (=> start!29770 (=> (not res!128377) (not e!102670))))

(assert (=> start!29770 (= res!128377 (= (size!3103 (buf!3606 bs1!10)) (size!3103 (buf!3606 bs2!18))))))

(assert (=> start!29770 e!102670))

(declare-fun inv!12 (BitStream!5464) Bool)

(assert (=> start!29770 (and (inv!12 bs1!10) e!102671)))

(assert (=> start!29770 (and (inv!12 bs2!18) e!102675)))

(declare-fun b!153240 () Bool)

(declare-fun res!128379 () Bool)

(assert (=> b!153240 (=> (not res!128379) (not e!102673))))

(assert (=> b!153240 (= res!128379 (bvsle lt!239661 (bitIndex!0 (size!3103 (buf!3606 bs2!18)) (currentByte!6598 bs2!18) (currentBit!6593 bs2!18))))))

(assert (= (and start!29770 res!128377) b!153238))

(assert (= (and b!153238 res!128378) b!153240))

(assert (= (and b!153240 res!128379) b!153242))

(assert (= (and b!153242 res!128376) b!153241))

(assert (= start!29770 b!153237))

(assert (= start!29770 b!153239))

(declare-fun m!239041 () Bool)

(assert (=> b!153241 m!239041))

(declare-fun m!239043 () Bool)

(assert (=> b!153241 m!239043))

(declare-fun m!239045 () Bool)

(assert (=> b!153237 m!239045))

(declare-fun m!239047 () Bool)

(assert (=> b!153240 m!239047))

(declare-fun m!239049 () Bool)

(assert (=> b!153238 m!239049))

(declare-fun m!239051 () Bool)

(assert (=> b!153239 m!239051))

(declare-fun m!239053 () Bool)

(assert (=> start!29770 m!239053))

(declare-fun m!239055 () Bool)

(assert (=> start!29770 m!239055))

(declare-fun m!239057 () Bool)

(assert (=> b!153242 m!239057))

(push 1)

(assert (not b!153242))

(assert (not b!153239))

(assert (not b!153238))

(assert (not b!153237))

(assert (not b!153240))

(assert (not b!153241))

(assert (not start!29770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

