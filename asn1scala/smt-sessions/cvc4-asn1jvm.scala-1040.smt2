; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29798 () Bool)

(assert start!29798)

(declare-fun b!153489 () Bool)

(declare-fun e!102923 () Bool)

(declare-fun e!102926 () Bool)

(assert (=> b!153489 (= e!102923 e!102926)))

(declare-fun res!128545 () Bool)

(assert (=> b!153489 (=> (not res!128545) (not e!102926))))

(declare-fun lt!239787 () (_ BitVec 64))

(declare-datatypes ((array!6909 0))(
  ( (array!6910 (arr!3940 (Array (_ BitVec 32) (_ BitVec 8))) (size!3117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5492 0))(
  ( (BitStream!5493 (buf!3620 array!6909) (currentByte!6612 (_ BitVec 32)) (currentBit!6607 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5492)

(assert (=> b!153489 (= res!128545 (bvsle lt!239787 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3117 (buf!3620 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153489 (= lt!239787 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3117 (buf!3620 bs1!10)) (currentByte!6612 bs1!10) (currentBit!6607 bs1!10))))))

(declare-fun b!153490 () Bool)

(declare-fun res!128544 () Bool)

(assert (=> b!153490 (=> (not res!128544) (not e!102926))))

(declare-fun bs2!18 () BitStream!5492)

(assert (=> b!153490 (= res!128544 (bvsle lt!239787 (bitIndex!0 (size!3117 (buf!3620 bs2!18)) (currentByte!6612 bs2!18) (currentBit!6607 bs2!18))))))

(declare-fun b!153491 () Bool)

(declare-fun e!102925 () Bool)

(declare-fun array_inv!2906 (array!6909) Bool)

(assert (=> b!153491 (= e!102925 (array_inv!2906 (buf!3620 bs2!18)))))

(declare-fun b!153492 () Bool)

(declare-fun e!102927 () Bool)

(assert (=> b!153492 (= e!102927 (array_inv!2906 (buf!3620 bs1!10)))))

(declare-fun res!128546 () Bool)

(assert (=> start!29798 (=> (not res!128546) (not e!102923))))

(assert (=> start!29798 (= res!128546 (= (size!3117 (buf!3620 bs1!10)) (size!3117 (buf!3620 bs2!18))))))

(assert (=> start!29798 e!102923))

(declare-fun inv!12 (BitStream!5492) Bool)

(assert (=> start!29798 (and (inv!12 bs1!10) e!102927)))

(assert (=> start!29798 (and (inv!12 bs2!18) e!102925)))

(declare-fun b!153493 () Bool)

(declare-fun res!128547 () Bool)

(assert (=> b!153493 (=> (not res!128547) (not e!102926))))

(declare-fun arrayBitRangesEq!0 (array!6909 array!6909 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153493 (= res!128547 (arrayBitRangesEq!0 (buf!3620 bs1!10) (buf!3620 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239787))))

(declare-fun b!153494 () Bool)

(assert (=> b!153494 (= e!102926 false)))

(declare-datatypes ((tuple2!13622 0))(
  ( (tuple2!13623 (_1!7201 BitStream!5492) (_2!7201 (_ BitVec 8))) )
))
(declare-fun lt!239788 () tuple2!13622)

(declare-fun readBytePure!0 (BitStream!5492) tuple2!13622)

(assert (=> b!153494 (= lt!239788 (readBytePure!0 (BitStream!5493 (buf!3620 bs2!18) (currentByte!6612 bs1!10) (currentBit!6607 bs1!10))))))

(declare-fun lt!239786 () tuple2!13622)

(assert (=> b!153494 (= lt!239786 (readBytePure!0 bs1!10))))

(assert (= (and start!29798 res!128546) b!153489))

(assert (= (and b!153489 res!128545) b!153490))

(assert (= (and b!153490 res!128544) b!153493))

(assert (= (and b!153493 res!128547) b!153494))

(assert (= start!29798 b!153492))

(assert (= start!29798 b!153491))

(declare-fun m!239293 () Bool)

(assert (=> start!29798 m!239293))

(declare-fun m!239295 () Bool)

(assert (=> start!29798 m!239295))

(declare-fun m!239297 () Bool)

(assert (=> b!153490 m!239297))

(declare-fun m!239299 () Bool)

(assert (=> b!153491 m!239299))

(declare-fun m!239301 () Bool)

(assert (=> b!153489 m!239301))

(declare-fun m!239303 () Bool)

(assert (=> b!153494 m!239303))

(declare-fun m!239305 () Bool)

(assert (=> b!153494 m!239305))

(declare-fun m!239307 () Bool)

(assert (=> b!153492 m!239307))

(declare-fun m!239309 () Bool)

(assert (=> b!153493 m!239309))

(push 1)

