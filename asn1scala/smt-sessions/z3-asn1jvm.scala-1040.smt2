; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29796 () Bool)

(assert start!29796)

(declare-fun res!128533 () Bool)

(declare-fun e!102906 () Bool)

(assert (=> start!29796 (=> (not res!128533) (not e!102906))))

(declare-datatypes ((array!6907 0))(
  ( (array!6908 (arr!3939 (Array (_ BitVec 32) (_ BitVec 8))) (size!3116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5490 0))(
  ( (BitStream!5491 (buf!3619 array!6907) (currentByte!6611 (_ BitVec 32)) (currentBit!6606 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5490)

(declare-fun bs2!18 () BitStream!5490)

(assert (=> start!29796 (= res!128533 (= (size!3116 (buf!3619 bs1!10)) (size!3116 (buf!3619 bs2!18))))))

(assert (=> start!29796 e!102906))

(declare-fun e!102908 () Bool)

(declare-fun inv!12 (BitStream!5490) Bool)

(assert (=> start!29796 (and (inv!12 bs1!10) e!102908)))

(declare-fun e!102909 () Bool)

(assert (=> start!29796 (and (inv!12 bs2!18) e!102909)))

(declare-fun b!153471 () Bool)

(declare-fun res!128535 () Bool)

(declare-fun e!102904 () Bool)

(assert (=> b!153471 (=> (not res!128535) (not e!102904))))

(declare-fun lt!239778 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153471 (= res!128535 (bvsle lt!239778 (bitIndex!0 (size!3116 (buf!3619 bs2!18)) (currentByte!6611 bs2!18) (currentBit!6606 bs2!18))))))

(declare-fun b!153472 () Bool)

(declare-fun array_inv!2905 (array!6907) Bool)

(assert (=> b!153472 (= e!102909 (array_inv!2905 (buf!3619 bs2!18)))))

(declare-fun b!153473 () Bool)

(assert (=> b!153473 (= e!102908 (array_inv!2905 (buf!3619 bs1!10)))))

(declare-fun b!153474 () Bool)

(assert (=> b!153474 (= e!102904 false)))

(declare-datatypes ((tuple2!13620 0))(
  ( (tuple2!13621 (_1!7200 BitStream!5490) (_2!7200 (_ BitVec 8))) )
))
(declare-fun lt!239777 () tuple2!13620)

(declare-fun readBytePure!0 (BitStream!5490) tuple2!13620)

(assert (=> b!153474 (= lt!239777 (readBytePure!0 (BitStream!5491 (buf!3619 bs2!18) (currentByte!6611 bs1!10) (currentBit!6606 bs1!10))))))

(declare-fun lt!239779 () tuple2!13620)

(assert (=> b!153474 (= lt!239779 (readBytePure!0 bs1!10))))

(declare-fun b!153475 () Bool)

(declare-fun res!128532 () Bool)

(assert (=> b!153475 (=> (not res!128532) (not e!102904))))

(declare-fun arrayBitRangesEq!0 (array!6907 array!6907 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153475 (= res!128532 (arrayBitRangesEq!0 (buf!3619 bs1!10) (buf!3619 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239778))))

(declare-fun b!153476 () Bool)

(assert (=> b!153476 (= e!102906 e!102904)))

(declare-fun res!128534 () Bool)

(assert (=> b!153476 (=> (not res!128534) (not e!102904))))

(assert (=> b!153476 (= res!128534 (bvsle lt!239778 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3116 (buf!3619 bs1!10))))))))

(assert (=> b!153476 (= lt!239778 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3116 (buf!3619 bs1!10)) (currentByte!6611 bs1!10) (currentBit!6606 bs1!10))))))

(assert (= (and start!29796 res!128533) b!153476))

(assert (= (and b!153476 res!128534) b!153471))

(assert (= (and b!153471 res!128535) b!153475))

(assert (= (and b!153475 res!128532) b!153474))

(assert (= start!29796 b!153473))

(assert (= start!29796 b!153472))

(declare-fun m!239275 () Bool)

(assert (=> b!153472 m!239275))

(declare-fun m!239277 () Bool)

(assert (=> start!29796 m!239277))

(declare-fun m!239279 () Bool)

(assert (=> start!29796 m!239279))

(declare-fun m!239281 () Bool)

(assert (=> b!153475 m!239281))

(declare-fun m!239283 () Bool)

(assert (=> b!153473 m!239283))

(declare-fun m!239285 () Bool)

(assert (=> b!153471 m!239285))

(declare-fun m!239287 () Bool)

(assert (=> b!153476 m!239287))

(declare-fun m!239289 () Bool)

(assert (=> b!153474 m!239289))

(declare-fun m!239291 () Bool)

(assert (=> b!153474 m!239291))

(check-sat (not b!153474) (not b!153471) (not b!153475) (not b!153476) (not b!153472) (not b!153473) (not start!29796))
