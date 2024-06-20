; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29790 () Bool)

(assert start!29790)

(declare-fun b!153417 () Bool)

(declare-fun e!102854 () Bool)

(declare-fun e!102852 () Bool)

(assert (=> b!153417 (= e!102854 e!102852)))

(declare-fun res!128496 () Bool)

(assert (=> b!153417 (=> (not res!128496) (not e!102852))))

(declare-fun lt!239751 () (_ BitVec 64))

(declare-datatypes ((array!6901 0))(
  ( (array!6902 (arr!3936 (Array (_ BitVec 32) (_ BitVec 8))) (size!3113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5484 0))(
  ( (BitStream!5485 (buf!3616 array!6901) (currentByte!6608 (_ BitVec 32)) (currentBit!6603 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5484)

(assert (=> b!153417 (= res!128496 (bvsle lt!239751 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3113 (buf!3616 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153417 (= lt!239751 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3113 (buf!3616 bs1!10)) (currentByte!6608 bs1!10) (currentBit!6603 bs1!10))))))

(declare-fun b!153418 () Bool)

(declare-fun res!128497 () Bool)

(assert (=> b!153418 (=> (not res!128497) (not e!102852))))

(declare-fun bs2!18 () BitStream!5484)

(declare-fun arrayBitRangesEq!0 (array!6901 array!6901 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153418 (= res!128497 (arrayBitRangesEq!0 (buf!3616 bs1!10) (buf!3616 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239751))))

(declare-fun res!128498 () Bool)

(assert (=> start!29790 (=> (not res!128498) (not e!102854))))

(assert (=> start!29790 (= res!128498 (= (size!3113 (buf!3616 bs1!10)) (size!3113 (buf!3616 bs2!18))))))

(assert (=> start!29790 e!102854))

(declare-fun e!102853 () Bool)

(declare-fun inv!12 (BitStream!5484) Bool)

(assert (=> start!29790 (and (inv!12 bs1!10) e!102853)))

(declare-fun e!102850 () Bool)

(assert (=> start!29790 (and (inv!12 bs2!18) e!102850)))

(declare-fun b!153419 () Bool)

(declare-fun array_inv!2902 (array!6901) Bool)

(assert (=> b!153419 (= e!102850 (array_inv!2902 (buf!3616 bs2!18)))))

(declare-fun b!153420 () Bool)

(assert (=> b!153420 (= e!102852 false)))

(declare-datatypes ((tuple2!13614 0))(
  ( (tuple2!13615 (_1!7197 BitStream!5484) (_2!7197 (_ BitVec 8))) )
))
(declare-fun lt!239752 () tuple2!13614)

(declare-fun readBytePure!0 (BitStream!5484) tuple2!13614)

(assert (=> b!153420 (= lt!239752 (readBytePure!0 (BitStream!5485 (buf!3616 bs2!18) (currentByte!6608 bs1!10) (currentBit!6603 bs1!10))))))

(declare-fun lt!239750 () tuple2!13614)

(assert (=> b!153420 (= lt!239750 (readBytePure!0 bs1!10))))

(declare-fun b!153421 () Bool)

(assert (=> b!153421 (= e!102853 (array_inv!2902 (buf!3616 bs1!10)))))

(declare-fun b!153422 () Bool)

(declare-fun res!128499 () Bool)

(assert (=> b!153422 (=> (not res!128499) (not e!102852))))

(assert (=> b!153422 (= res!128499 (bvsle lt!239751 (bitIndex!0 (size!3113 (buf!3616 bs2!18)) (currentByte!6608 bs2!18) (currentBit!6603 bs2!18))))))

(assert (= (and start!29790 res!128498) b!153417))

(assert (= (and b!153417 res!128496) b!153422))

(assert (= (and b!153422 res!128499) b!153418))

(assert (= (and b!153418 res!128497) b!153420))

(assert (= start!29790 b!153421))

(assert (= start!29790 b!153419))

(declare-fun m!239221 () Bool)

(assert (=> b!153417 m!239221))

(declare-fun m!239223 () Bool)

(assert (=> b!153419 m!239223))

(declare-fun m!239225 () Bool)

(assert (=> b!153422 m!239225))

(declare-fun m!239227 () Bool)

(assert (=> b!153421 m!239227))

(declare-fun m!239229 () Bool)

(assert (=> b!153420 m!239229))

(declare-fun m!239231 () Bool)

(assert (=> b!153420 m!239231))

(declare-fun m!239233 () Bool)

(assert (=> b!153418 m!239233))

(declare-fun m!239235 () Bool)

(assert (=> start!29790 m!239235))

(declare-fun m!239237 () Bool)

(assert (=> start!29790 m!239237))

(check-sat (not b!153422) (not b!153418) (not b!153420) (not start!29790) (not b!153419) (not b!153417) (not b!153421))
