; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29792 () Bool)

(assert start!29792)

(declare-fun b!153435 () Bool)

(declare-fun e!102870 () Bool)

(assert (=> b!153435 (= e!102870 false)))

(declare-datatypes ((array!6903 0))(
  ( (array!6904 (arr!3937 (Array (_ BitVec 32) (_ BitVec 8))) (size!3114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5486 0))(
  ( (BitStream!5487 (buf!3617 array!6903) (currentByte!6609 (_ BitVec 32)) (currentBit!6604 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13616 0))(
  ( (tuple2!13617 (_1!7198 BitStream!5486) (_2!7198 (_ BitVec 8))) )
))
(declare-fun lt!239761 () tuple2!13616)

(declare-fun bs2!18 () BitStream!5486)

(declare-fun bs1!10 () BitStream!5486)

(declare-fun readBytePure!0 (BitStream!5486) tuple2!13616)

(assert (=> b!153435 (= lt!239761 (readBytePure!0 (BitStream!5487 (buf!3617 bs2!18) (currentByte!6609 bs1!10) (currentBit!6604 bs1!10))))))

(declare-fun lt!239759 () tuple2!13616)

(assert (=> b!153435 (= lt!239759 (readBytePure!0 bs1!10))))

(declare-fun b!153436 () Bool)

(declare-fun e!102868 () Bool)

(declare-fun array_inv!2903 (array!6903) Bool)

(assert (=> b!153436 (= e!102868 (array_inv!2903 (buf!3617 bs1!10)))))

(declare-fun b!153437 () Bool)

(declare-fun res!128509 () Bool)

(assert (=> b!153437 (=> (not res!128509) (not e!102870))))

(declare-fun lt!239760 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153437 (= res!128509 (bvsle lt!239760 (bitIndex!0 (size!3114 (buf!3617 bs2!18)) (currentByte!6609 bs2!18) (currentBit!6604 bs2!18))))))

(declare-fun b!153438 () Bool)

(declare-fun res!128508 () Bool)

(assert (=> b!153438 (=> (not res!128508) (not e!102870))))

(declare-fun arrayBitRangesEq!0 (array!6903 array!6903 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153438 (= res!128508 (arrayBitRangesEq!0 (buf!3617 bs1!10) (buf!3617 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239760))))

(declare-fun b!153439 () Bool)

(declare-fun e!102871 () Bool)

(assert (=> b!153439 (= e!102871 e!102870)))

(declare-fun res!128511 () Bool)

(assert (=> b!153439 (=> (not res!128511) (not e!102870))))

(assert (=> b!153439 (= res!128511 (bvsle lt!239760 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3114 (buf!3617 bs1!10))))))))

(assert (=> b!153439 (= lt!239760 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3114 (buf!3617 bs1!10)) (currentByte!6609 bs1!10) (currentBit!6604 bs1!10))))))

(declare-fun res!128510 () Bool)

(assert (=> start!29792 (=> (not res!128510) (not e!102871))))

(assert (=> start!29792 (= res!128510 (= (size!3114 (buf!3617 bs1!10)) (size!3114 (buf!3617 bs2!18))))))

(assert (=> start!29792 e!102871))

(declare-fun inv!12 (BitStream!5486) Bool)

(assert (=> start!29792 (and (inv!12 bs1!10) e!102868)))

(declare-fun e!102872 () Bool)

(assert (=> start!29792 (and (inv!12 bs2!18) e!102872)))

(declare-fun b!153440 () Bool)

(assert (=> b!153440 (= e!102872 (array_inv!2903 (buf!3617 bs2!18)))))

(assert (= (and start!29792 res!128510) b!153439))

(assert (= (and b!153439 res!128511) b!153437))

(assert (= (and b!153437 res!128509) b!153438))

(assert (= (and b!153438 res!128508) b!153435))

(assert (= start!29792 b!153436))

(assert (= start!29792 b!153440))

(declare-fun m!239239 () Bool)

(assert (=> start!29792 m!239239))

(declare-fun m!239241 () Bool)

(assert (=> start!29792 m!239241))

(declare-fun m!239243 () Bool)

(assert (=> b!153440 m!239243))

(declare-fun m!239245 () Bool)

(assert (=> b!153436 m!239245))

(declare-fun m!239247 () Bool)

(assert (=> b!153435 m!239247))

(declare-fun m!239249 () Bool)

(assert (=> b!153435 m!239249))

(declare-fun m!239251 () Bool)

(assert (=> b!153439 m!239251))

(declare-fun m!239253 () Bool)

(assert (=> b!153438 m!239253))

(declare-fun m!239255 () Bool)

(assert (=> b!153437 m!239255))

(push 1)

