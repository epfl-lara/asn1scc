; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29776 () Bool)

(assert start!29776)

(declare-fun res!128415 () Bool)

(declare-fun e!102728 () Bool)

(assert (=> start!29776 (=> (not res!128415) (not e!102728))))

(declare-datatypes ((array!6887 0))(
  ( (array!6888 (arr!3929 (Array (_ BitVec 32) (_ BitVec 8))) (size!3106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5470 0))(
  ( (BitStream!5471 (buf!3609 array!6887) (currentByte!6601 (_ BitVec 32)) (currentBit!6596 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5470)

(declare-fun bs2!18 () BitStream!5470)

(assert (=> start!29776 (= res!128415 (= (size!3106 (buf!3609 bs1!10)) (size!3106 (buf!3609 bs2!18))))))

(assert (=> start!29776 e!102728))

(declare-fun e!102725 () Bool)

(declare-fun inv!12 (BitStream!5470) Bool)

(assert (=> start!29776 (and (inv!12 bs1!10) e!102725)))

(declare-fun e!102726 () Bool)

(assert (=> start!29776 (and (inv!12 bs2!18) e!102726)))

(declare-fun b!153291 () Bool)

(declare-fun array_inv!2895 (array!6887) Bool)

(assert (=> b!153291 (= e!102725 (array_inv!2895 (buf!3609 bs1!10)))))

(declare-fun b!153292 () Bool)

(declare-fun res!128413 () Bool)

(declare-fun e!102727 () Bool)

(assert (=> b!153292 (=> (not res!128413) (not e!102727))))

(declare-fun lt!239688 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153292 (= res!128413 (bvsle lt!239688 (bitIndex!0 (size!3106 (buf!3609 bs2!18)) (currentByte!6601 bs2!18) (currentBit!6596 bs2!18))))))

(declare-fun b!153293 () Bool)

(declare-fun res!128414 () Bool)

(assert (=> b!153293 (=> (not res!128414) (not e!102727))))

(declare-fun arrayBitRangesEq!0 (array!6887 array!6887 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153293 (= res!128414 (arrayBitRangesEq!0 (buf!3609 bs1!10) (buf!3609 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239688))))

(declare-fun b!153294 () Bool)

(assert (=> b!153294 (= e!102727 false)))

(declare-datatypes ((tuple2!13600 0))(
  ( (tuple2!13601 (_1!7190 BitStream!5470) (_2!7190 (_ BitVec 8))) )
))
(declare-fun lt!239689 () tuple2!13600)

(declare-fun readBytePure!0 (BitStream!5470) tuple2!13600)

(assert (=> b!153294 (= lt!239689 (readBytePure!0 (BitStream!5471 (buf!3609 bs2!18) (currentByte!6601 bs1!10) (currentBit!6596 bs1!10))))))

(declare-fun lt!239687 () tuple2!13600)

(assert (=> b!153294 (= lt!239687 (readBytePure!0 bs1!10))))

(declare-fun b!153295 () Bool)

(assert (=> b!153295 (= e!102728 e!102727)))

(declare-fun res!128412 () Bool)

(assert (=> b!153295 (=> (not res!128412) (not e!102727))))

(assert (=> b!153295 (= res!128412 (bvsle lt!239688 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3106 (buf!3609 bs1!10))))))))

(assert (=> b!153295 (= lt!239688 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3106 (buf!3609 bs1!10)) (currentByte!6601 bs1!10) (currentBit!6596 bs1!10))))))

(declare-fun b!153296 () Bool)

(assert (=> b!153296 (= e!102726 (array_inv!2895 (buf!3609 bs2!18)))))

(assert (= (and start!29776 res!128415) b!153295))

(assert (= (and b!153295 res!128412) b!153292))

(assert (= (and b!153292 res!128413) b!153293))

(assert (= (and b!153293 res!128414) b!153294))

(assert (= start!29776 b!153291))

(assert (= start!29776 b!153296))

(declare-fun m!239095 () Bool)

(assert (=> b!153293 m!239095))

(declare-fun m!239097 () Bool)

(assert (=> b!153291 m!239097))

(declare-fun m!239099 () Bool)

(assert (=> b!153295 m!239099))

(declare-fun m!239101 () Bool)

(assert (=> start!29776 m!239101))

(declare-fun m!239103 () Bool)

(assert (=> start!29776 m!239103))

(declare-fun m!239105 () Bool)

(assert (=> b!153292 m!239105))

(declare-fun m!239107 () Bool)

(assert (=> b!153296 m!239107))

(declare-fun m!239109 () Bool)

(assert (=> b!153294 m!239109))

(declare-fun m!239111 () Bool)

(assert (=> b!153294 m!239111))

(push 1)

(assert (not b!153296))

(assert (not b!153291))

(assert (not b!153292))

(assert (not start!29776))

(assert (not b!153294))

(assert (not b!153293))

(assert (not b!153295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

