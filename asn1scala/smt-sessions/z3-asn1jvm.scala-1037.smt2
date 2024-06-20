; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29778 () Bool)

(assert start!29778)

(declare-fun b!153309 () Bool)

(declare-fun e!102744 () Bool)

(declare-datatypes ((array!6889 0))(
  ( (array!6890 (arr!3930 (Array (_ BitVec 32) (_ BitVec 8))) (size!3107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5472 0))(
  ( (BitStream!5473 (buf!3610 array!6889) (currentByte!6602 (_ BitVec 32)) (currentBit!6597 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5472)

(declare-fun array_inv!2896 (array!6889) Bool)

(assert (=> b!153309 (= e!102744 (array_inv!2896 (buf!3610 bs1!10)))))

(declare-fun b!153311 () Bool)

(declare-fun res!128427 () Bool)

(declare-fun e!102746 () Bool)

(assert (=> b!153311 (=> (not res!128427) (not e!102746))))

(declare-fun lt!239698 () (_ BitVec 64))

(declare-fun bs2!18 () BitStream!5472)

(declare-fun arrayBitRangesEq!0 (array!6889 array!6889 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153311 (= res!128427 (arrayBitRangesEq!0 (buf!3610 bs1!10) (buf!3610 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239698))))

(declare-fun b!153312 () Bool)

(declare-fun res!128424 () Bool)

(assert (=> b!153312 (=> (not res!128424) (not e!102746))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153312 (= res!128424 (bvsle lt!239698 (bitIndex!0 (size!3107 (buf!3610 bs2!18)) (currentByte!6602 bs2!18) (currentBit!6597 bs2!18))))))

(declare-fun b!153313 () Bool)

(declare-fun e!102745 () Bool)

(assert (=> b!153313 (= e!102745 e!102746)))

(declare-fun res!128426 () Bool)

(assert (=> b!153313 (=> (not res!128426) (not e!102746))))

(assert (=> b!153313 (= res!128426 (bvsle lt!239698 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3107 (buf!3610 bs1!10))))))))

(assert (=> b!153313 (= lt!239698 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3107 (buf!3610 bs1!10)) (currentByte!6602 bs1!10) (currentBit!6597 bs1!10))))))

(declare-fun b!153314 () Bool)

(assert (=> b!153314 (= e!102746 false)))

(declare-datatypes ((tuple2!13602 0))(
  ( (tuple2!13603 (_1!7191 BitStream!5472) (_2!7191 (_ BitVec 8))) )
))
(declare-fun lt!239697 () tuple2!13602)

(declare-fun readBytePure!0 (BitStream!5472) tuple2!13602)

(assert (=> b!153314 (= lt!239697 (readBytePure!0 (BitStream!5473 (buf!3610 bs2!18) (currentByte!6602 bs1!10) (currentBit!6597 bs1!10))))))

(declare-fun lt!239696 () tuple2!13602)

(assert (=> b!153314 (= lt!239696 (readBytePure!0 bs1!10))))

(declare-fun res!128425 () Bool)

(assert (=> start!29778 (=> (not res!128425) (not e!102745))))

(assert (=> start!29778 (= res!128425 (= (size!3107 (buf!3610 bs1!10)) (size!3107 (buf!3610 bs2!18))))))

(assert (=> start!29778 e!102745))

(declare-fun inv!12 (BitStream!5472) Bool)

(assert (=> start!29778 (and (inv!12 bs1!10) e!102744)))

(declare-fun e!102747 () Bool)

(assert (=> start!29778 (and (inv!12 bs2!18) e!102747)))

(declare-fun b!153310 () Bool)

(assert (=> b!153310 (= e!102747 (array_inv!2896 (buf!3610 bs2!18)))))

(assert (= (and start!29778 res!128425) b!153313))

(assert (= (and b!153313 res!128426) b!153312))

(assert (= (and b!153312 res!128424) b!153311))

(assert (= (and b!153311 res!128427) b!153314))

(assert (= start!29778 b!153309))

(assert (= start!29778 b!153310))

(declare-fun m!239113 () Bool)

(assert (=> b!153312 m!239113))

(declare-fun m!239115 () Bool)

(assert (=> b!153309 m!239115))

(declare-fun m!239117 () Bool)

(assert (=> start!29778 m!239117))

(declare-fun m!239119 () Bool)

(assert (=> start!29778 m!239119))

(declare-fun m!239121 () Bool)

(assert (=> b!153311 m!239121))

(declare-fun m!239123 () Bool)

(assert (=> b!153314 m!239123))

(declare-fun m!239125 () Bool)

(assert (=> b!153314 m!239125))

(declare-fun m!239127 () Bool)

(assert (=> b!153310 m!239127))

(declare-fun m!239129 () Bool)

(assert (=> b!153313 m!239129))

(check-sat (not b!153313) (not b!153314) (not b!153312) (not b!153309) (not b!153311) (not start!29778) (not b!153310))
