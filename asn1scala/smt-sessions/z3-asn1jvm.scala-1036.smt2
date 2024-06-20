; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29772 () Bool)

(assert start!29772)

(declare-fun b!153255 () Bool)

(declare-fun res!128391 () Bool)

(declare-fun e!102688 () Bool)

(assert (=> b!153255 (=> (not res!128391) (not e!102688))))

(declare-datatypes ((array!6883 0))(
  ( (array!6884 (arr!3927 (Array (_ BitVec 32) (_ BitVec 8))) (size!3104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5466 0))(
  ( (BitStream!5467 (buf!3607 array!6883) (currentByte!6599 (_ BitVec 32)) (currentBit!6594 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5466)

(declare-fun lt!239671 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5466)

(declare-fun arrayBitRangesEq!0 (array!6883 array!6883 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153255 (= res!128391 (arrayBitRangesEq!0 (buf!3607 bs1!10) (buf!3607 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239671))))

(declare-fun res!128390 () Bool)

(declare-fun e!102693 () Bool)

(assert (=> start!29772 (=> (not res!128390) (not e!102693))))

(assert (=> start!29772 (= res!128390 (= (size!3104 (buf!3607 bs1!10)) (size!3104 (buf!3607 bs2!18))))))

(assert (=> start!29772 e!102693))

(declare-fun e!102690 () Bool)

(declare-fun inv!12 (BitStream!5466) Bool)

(assert (=> start!29772 (and (inv!12 bs1!10) e!102690)))

(declare-fun e!102689 () Bool)

(assert (=> start!29772 (and (inv!12 bs2!18) e!102689)))

(declare-fun b!153256 () Bool)

(assert (=> b!153256 (= e!102693 e!102688)))

(declare-fun res!128389 () Bool)

(assert (=> b!153256 (=> (not res!128389) (not e!102688))))

(assert (=> b!153256 (= res!128389 (bvsle lt!239671 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3104 (buf!3607 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153256 (= lt!239671 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3104 (buf!3607 bs1!10)) (currentByte!6599 bs1!10) (currentBit!6594 bs1!10))))))

(declare-fun b!153257 () Bool)

(declare-fun res!128388 () Bool)

(assert (=> b!153257 (=> (not res!128388) (not e!102688))))

(assert (=> b!153257 (= res!128388 (bvsle lt!239671 (bitIndex!0 (size!3104 (buf!3607 bs2!18)) (currentByte!6599 bs2!18) (currentBit!6594 bs2!18))))))

(declare-fun b!153258 () Bool)

(assert (=> b!153258 (= e!102688 false)))

(declare-datatypes ((tuple2!13596 0))(
  ( (tuple2!13597 (_1!7188 BitStream!5466) (_2!7188 (_ BitVec 8))) )
))
(declare-fun lt!239670 () tuple2!13596)

(declare-fun readBytePure!0 (BitStream!5466) tuple2!13596)

(assert (=> b!153258 (= lt!239670 (readBytePure!0 (BitStream!5467 (buf!3607 bs2!18) (currentByte!6599 bs1!10) (currentBit!6594 bs1!10))))))

(declare-fun lt!239669 () tuple2!13596)

(assert (=> b!153258 (= lt!239669 (readBytePure!0 bs1!10))))

(declare-fun b!153259 () Bool)

(declare-fun array_inv!2893 (array!6883) Bool)

(assert (=> b!153259 (= e!102690 (array_inv!2893 (buf!3607 bs1!10)))))

(declare-fun b!153260 () Bool)

(assert (=> b!153260 (= e!102689 (array_inv!2893 (buf!3607 bs2!18)))))

(assert (= (and start!29772 res!128390) b!153256))

(assert (= (and b!153256 res!128389) b!153257))

(assert (= (and b!153257 res!128388) b!153255))

(assert (= (and b!153255 res!128391) b!153258))

(assert (= start!29772 b!153259))

(assert (= start!29772 b!153260))

(declare-fun m!239059 () Bool)

(assert (=> b!153257 m!239059))

(declare-fun m!239061 () Bool)

(assert (=> start!29772 m!239061))

(declare-fun m!239063 () Bool)

(assert (=> start!29772 m!239063))

(declare-fun m!239065 () Bool)

(assert (=> b!153260 m!239065))

(declare-fun m!239067 () Bool)

(assert (=> b!153259 m!239067))

(declare-fun m!239069 () Bool)

(assert (=> b!153258 m!239069))

(declare-fun m!239071 () Bool)

(assert (=> b!153258 m!239071))

(declare-fun m!239073 () Bool)

(assert (=> b!153256 m!239073))

(declare-fun m!239075 () Bool)

(assert (=> b!153255 m!239075))

(check-sat (not b!153260) (not b!153257) (not b!153259) (not start!29772) (not b!153256) (not b!153255) (not b!153258))
