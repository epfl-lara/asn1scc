; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29794 () Bool)

(assert start!29794)

(declare-fun b!153453 () Bool)

(declare-fun e!102888 () Bool)

(assert (=> b!153453 (= e!102888 false)))

(declare-datatypes ((array!6905 0))(
  ( (array!6906 (arr!3938 (Array (_ BitVec 32) (_ BitVec 8))) (size!3115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5488 0))(
  ( (BitStream!5489 (buf!3618 array!6905) (currentByte!6610 (_ BitVec 32)) (currentBit!6605 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13618 0))(
  ( (tuple2!13619 (_1!7199 BitStream!5488) (_2!7199 (_ BitVec 8))) )
))
(declare-fun lt!239770 () tuple2!13618)

(declare-fun bs2!18 () BitStream!5488)

(declare-fun bs1!10 () BitStream!5488)

(declare-fun readBytePure!0 (BitStream!5488) tuple2!13618)

(assert (=> b!153453 (= lt!239770 (readBytePure!0 (BitStream!5489 (buf!3618 bs2!18) (currentByte!6610 bs1!10) (currentBit!6605 bs1!10))))))

(declare-fun lt!239769 () tuple2!13618)

(assert (=> b!153453 (= lt!239769 (readBytePure!0 bs1!10))))

(declare-fun b!153454 () Bool)

(declare-fun e!102889 () Bool)

(declare-fun array_inv!2904 (array!6905) Bool)

(assert (=> b!153454 (= e!102889 (array_inv!2904 (buf!3618 bs2!18)))))

(declare-fun b!153455 () Bool)

(declare-fun res!128522 () Bool)

(assert (=> b!153455 (=> (not res!128522) (not e!102888))))

(declare-fun lt!239768 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6905 array!6905 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153455 (= res!128522 (arrayBitRangesEq!0 (buf!3618 bs1!10) (buf!3618 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239768))))

(declare-fun b!153456 () Bool)

(declare-fun res!128523 () Bool)

(assert (=> b!153456 (=> (not res!128523) (not e!102888))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153456 (= res!128523 (bvsle lt!239768 (bitIndex!0 (size!3115 (buf!3618 bs2!18)) (currentByte!6610 bs2!18) (currentBit!6605 bs2!18))))))

(declare-fun res!128520 () Bool)

(declare-fun e!102887 () Bool)

(assert (=> start!29794 (=> (not res!128520) (not e!102887))))

(assert (=> start!29794 (= res!128520 (= (size!3115 (buf!3618 bs1!10)) (size!3115 (buf!3618 bs2!18))))))

(assert (=> start!29794 e!102887))

(declare-fun e!102886 () Bool)

(declare-fun inv!12 (BitStream!5488) Bool)

(assert (=> start!29794 (and (inv!12 bs1!10) e!102886)))

(assert (=> start!29794 (and (inv!12 bs2!18) e!102889)))

(declare-fun b!153457 () Bool)

(assert (=> b!153457 (= e!102886 (array_inv!2904 (buf!3618 bs1!10)))))

(declare-fun b!153458 () Bool)

(assert (=> b!153458 (= e!102887 e!102888)))

(declare-fun res!128521 () Bool)

(assert (=> b!153458 (=> (not res!128521) (not e!102888))))

(assert (=> b!153458 (= res!128521 (bvsle lt!239768 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3115 (buf!3618 bs1!10))))))))

(assert (=> b!153458 (= lt!239768 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3115 (buf!3618 bs1!10)) (currentByte!6610 bs1!10) (currentBit!6605 bs1!10))))))

(assert (= (and start!29794 res!128520) b!153458))

(assert (= (and b!153458 res!128521) b!153456))

(assert (= (and b!153456 res!128523) b!153455))

(assert (= (and b!153455 res!128522) b!153453))

(assert (= start!29794 b!153457))

(assert (= start!29794 b!153454))

(declare-fun m!239257 () Bool)

(assert (=> b!153457 m!239257))

(declare-fun m!239259 () Bool)

(assert (=> b!153454 m!239259))

(declare-fun m!239261 () Bool)

(assert (=> b!153453 m!239261))

(declare-fun m!239263 () Bool)

(assert (=> b!153453 m!239263))

(declare-fun m!239265 () Bool)

(assert (=> b!153458 m!239265))

(declare-fun m!239267 () Bool)

(assert (=> b!153455 m!239267))

(declare-fun m!239269 () Bool)

(assert (=> b!153456 m!239269))

(declare-fun m!239271 () Bool)

(assert (=> start!29794 m!239271))

(declare-fun m!239273 () Bool)

(assert (=> start!29794 m!239273))

(push 1)

(assert (not b!153453))

(assert (not b!153457))

(assert (not b!153455))

(assert (not start!29794))

(assert (not b!153458))

(assert (not b!153454))

(assert (not b!153456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

