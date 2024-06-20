; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29788 () Bool)

(assert start!29788)

(declare-fun res!128485 () Bool)

(declare-fun e!102833 () Bool)

(assert (=> start!29788 (=> (not res!128485) (not e!102833))))

(declare-datatypes ((array!6899 0))(
  ( (array!6900 (arr!3935 (Array (_ BitVec 32) (_ BitVec 8))) (size!3112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5482 0))(
  ( (BitStream!5483 (buf!3615 array!6899) (currentByte!6607 (_ BitVec 32)) (currentBit!6602 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5482)

(declare-fun bs2!18 () BitStream!5482)

(assert (=> start!29788 (= res!128485 (= (size!3112 (buf!3615 bs1!10)) (size!3112 (buf!3615 bs2!18))))))

(assert (=> start!29788 e!102833))

(declare-fun e!102832 () Bool)

(declare-fun inv!12 (BitStream!5482) Bool)

(assert (=> start!29788 (and (inv!12 bs1!10) e!102832)))

(declare-fun e!102834 () Bool)

(assert (=> start!29788 (and (inv!12 bs2!18) e!102834)))

(declare-fun b!153399 () Bool)

(declare-fun res!128486 () Bool)

(declare-fun e!102835 () Bool)

(assert (=> b!153399 (=> (not res!128486) (not e!102835))))

(declare-fun lt!239741 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153399 (= res!128486 (bvsle lt!239741 (bitIndex!0 (size!3112 (buf!3615 bs2!18)) (currentByte!6607 bs2!18) (currentBit!6602 bs2!18))))))

(declare-fun b!153400 () Bool)

(declare-fun array_inv!2901 (array!6899) Bool)

(assert (=> b!153400 (= e!102834 (array_inv!2901 (buf!3615 bs2!18)))))

(declare-fun b!153401 () Bool)

(declare-fun res!128487 () Bool)

(assert (=> b!153401 (=> (not res!128487) (not e!102835))))

(declare-fun arrayBitRangesEq!0 (array!6899 array!6899 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153401 (= res!128487 (arrayBitRangesEq!0 (buf!3615 bs1!10) (buf!3615 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239741))))

(declare-fun b!153402 () Bool)

(assert (=> b!153402 (= e!102835 false)))

(declare-datatypes ((tuple2!13612 0))(
  ( (tuple2!13613 (_1!7196 BitStream!5482) (_2!7196 (_ BitVec 8))) )
))
(declare-fun lt!239742 () tuple2!13612)

(declare-fun readBytePure!0 (BitStream!5482) tuple2!13612)

(assert (=> b!153402 (= lt!239742 (readBytePure!0 (BitStream!5483 (buf!3615 bs2!18) (currentByte!6607 bs1!10) (currentBit!6602 bs1!10))))))

(declare-fun lt!239743 () tuple2!13612)

(assert (=> b!153402 (= lt!239743 (readBytePure!0 bs1!10))))

(declare-fun b!153403 () Bool)

(assert (=> b!153403 (= e!102833 e!102835)))

(declare-fun res!128484 () Bool)

(assert (=> b!153403 (=> (not res!128484) (not e!102835))))

(assert (=> b!153403 (= res!128484 (bvsle lt!239741 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3112 (buf!3615 bs1!10))))))))

(assert (=> b!153403 (= lt!239741 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3112 (buf!3615 bs1!10)) (currentByte!6607 bs1!10) (currentBit!6602 bs1!10))))))

(declare-fun b!153404 () Bool)

(assert (=> b!153404 (= e!102832 (array_inv!2901 (buf!3615 bs1!10)))))

(assert (= (and start!29788 res!128485) b!153403))

(assert (= (and b!153403 res!128484) b!153399))

(assert (= (and b!153399 res!128486) b!153401))

(assert (= (and b!153401 res!128487) b!153402))

(assert (= start!29788 b!153404))

(assert (= start!29788 b!153400))

(declare-fun m!239203 () Bool)

(assert (=> b!153399 m!239203))

(declare-fun m!239205 () Bool)

(assert (=> b!153402 m!239205))

(declare-fun m!239207 () Bool)

(assert (=> b!153402 m!239207))

(declare-fun m!239209 () Bool)

(assert (=> b!153404 m!239209))

(declare-fun m!239211 () Bool)

(assert (=> b!153400 m!239211))

(declare-fun m!239213 () Bool)

(assert (=> b!153403 m!239213))

(declare-fun m!239215 () Bool)

(assert (=> b!153401 m!239215))

(declare-fun m!239217 () Bool)

(assert (=> start!29788 m!239217))

(declare-fun m!239219 () Bool)

(assert (=> start!29788 m!239219))

(push 1)

(assert (not b!153402))

(assert (not b!153401))

(assert (not b!153400))

(assert (not start!29788))

(assert (not b!153399))

(assert (not b!153404))

(assert (not b!153403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

