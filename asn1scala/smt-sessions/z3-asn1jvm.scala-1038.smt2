; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29784 () Bool)

(assert start!29784)

(declare-fun res!128460 () Bool)

(declare-fun e!102797 () Bool)

(assert (=> start!29784 (=> (not res!128460) (not e!102797))))

(declare-datatypes ((array!6895 0))(
  ( (array!6896 (arr!3933 (Array (_ BitVec 32) (_ BitVec 8))) (size!3110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5478 0))(
  ( (BitStream!5479 (buf!3613 array!6895) (currentByte!6605 (_ BitVec 32)) (currentBit!6600 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5478)

(declare-fun bs2!18 () BitStream!5478)

(assert (=> start!29784 (= res!128460 (= (size!3110 (buf!3613 bs1!10)) (size!3110 (buf!3613 bs2!18))))))

(assert (=> start!29784 e!102797))

(declare-fun e!102798 () Bool)

(declare-fun inv!12 (BitStream!5478) Bool)

(assert (=> start!29784 (and (inv!12 bs1!10) e!102798)))

(declare-fun e!102796 () Bool)

(assert (=> start!29784 (and (inv!12 bs2!18) e!102796)))

(declare-fun b!153363 () Bool)

(declare-fun array_inv!2899 (array!6895) Bool)

(assert (=> b!153363 (= e!102798 (array_inv!2899 (buf!3613 bs1!10)))))

(declare-fun b!153364 () Bool)

(declare-fun e!102801 () Bool)

(assert (=> b!153364 (= e!102797 e!102801)))

(declare-fun res!128461 () Bool)

(assert (=> b!153364 (=> (not res!128461) (not e!102801))))

(declare-fun lt!239724 () (_ BitVec 64))

(assert (=> b!153364 (= res!128461 (bvsle lt!239724 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3110 (buf!3613 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153364 (= lt!239724 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3110 (buf!3613 bs1!10)) (currentByte!6605 bs1!10) (currentBit!6600 bs1!10))))))

(declare-fun b!153365 () Bool)

(assert (=> b!153365 (= e!102801 false)))

(declare-datatypes ((tuple2!13608 0))(
  ( (tuple2!13609 (_1!7194 BitStream!5478) (_2!7194 (_ BitVec 8))) )
))
(declare-fun lt!239725 () tuple2!13608)

(declare-fun readBytePure!0 (BitStream!5478) tuple2!13608)

(assert (=> b!153365 (= lt!239725 (readBytePure!0 (BitStream!5479 (buf!3613 bs2!18) (currentByte!6605 bs1!10) (currentBit!6600 bs1!10))))))

(declare-fun lt!239723 () tuple2!13608)

(assert (=> b!153365 (= lt!239723 (readBytePure!0 bs1!10))))

(declare-fun b!153366 () Bool)

(declare-fun res!128462 () Bool)

(assert (=> b!153366 (=> (not res!128462) (not e!102801))))

(declare-fun arrayBitRangesEq!0 (array!6895 array!6895 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153366 (= res!128462 (arrayBitRangesEq!0 (buf!3613 bs1!10) (buf!3613 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239724))))

(declare-fun b!153367 () Bool)

(assert (=> b!153367 (= e!102796 (array_inv!2899 (buf!3613 bs2!18)))))

(declare-fun b!153368 () Bool)

(declare-fun res!128463 () Bool)

(assert (=> b!153368 (=> (not res!128463) (not e!102801))))

(assert (=> b!153368 (= res!128463 (bvsle lt!239724 (bitIndex!0 (size!3110 (buf!3613 bs2!18)) (currentByte!6605 bs2!18) (currentBit!6600 bs2!18))))))

(assert (= (and start!29784 res!128460) b!153364))

(assert (= (and b!153364 res!128461) b!153368))

(assert (= (and b!153368 res!128463) b!153366))

(assert (= (and b!153366 res!128462) b!153365))

(assert (= start!29784 b!153363))

(assert (= start!29784 b!153367))

(declare-fun m!239167 () Bool)

(assert (=> start!29784 m!239167))

(declare-fun m!239169 () Bool)

(assert (=> start!29784 m!239169))

(declare-fun m!239171 () Bool)

(assert (=> b!153367 m!239171))

(declare-fun m!239173 () Bool)

(assert (=> b!153366 m!239173))

(declare-fun m!239175 () Bool)

(assert (=> b!153363 m!239175))

(declare-fun m!239177 () Bool)

(assert (=> b!153368 m!239177))

(declare-fun m!239179 () Bool)

(assert (=> b!153364 m!239179))

(declare-fun m!239181 () Bool)

(assert (=> b!153365 m!239181))

(declare-fun m!239183 () Bool)

(assert (=> b!153365 m!239183))

(check-sat (not b!153364) (not b!153363) (not b!153368) (not b!153365) (not start!29784) (not b!153367) (not b!153366))
