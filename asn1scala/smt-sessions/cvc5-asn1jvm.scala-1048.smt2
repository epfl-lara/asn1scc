; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30076 () Bool)

(assert start!30076)

(declare-fun b!154251 () Bool)

(declare-fun e!103639 () Bool)

(declare-datatypes ((array!6971 0))(
  ( (array!6972 (arr!3962 (Array (_ BitVec 32) (_ BitVec 8))) (size!3139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5536 0))(
  ( (BitStream!5537 (buf!3642 array!6971) (currentByte!6664 (_ BitVec 32)) (currentBit!6659 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5536)

(declare-fun array_inv!2928 (array!6971) Bool)

(assert (=> b!154251 (= e!103639 (array_inv!2928 (buf!3642 bs2!18)))))

(declare-fun b!154252 () Bool)

(declare-fun e!103640 () Bool)

(declare-fun e!103638 () Bool)

(assert (=> b!154252 (= e!103640 e!103638)))

(declare-fun res!129128 () Bool)

(assert (=> b!154252 (=> (not res!129128) (not e!103638))))

(declare-fun lt!240663 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5536)

(assert (=> b!154252 (= res!129128 (bvsle lt!240663 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3139 (buf!3642 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154252 (= lt!240663 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3139 (buf!3642 bs1!10)) (currentByte!6664 bs1!10) (currentBit!6659 bs1!10))))))

(declare-fun b!154253 () Bool)

(assert (=> b!154253 (= e!103638 false)))

(declare-datatypes ((tuple2!13660 0))(
  ( (tuple2!13661 (_1!7229 BitStream!5536) (_2!7229 (_ BitVec 8))) )
))
(declare-fun lt!240664 () tuple2!13660)

(declare-fun readBytePure!0 (BitStream!5536) tuple2!13660)

(assert (=> b!154253 (= lt!240664 (readBytePure!0 (BitStream!5537 (buf!3642 bs2!18) (currentByte!6664 bs1!10) (currentBit!6659 bs1!10))))))

(declare-fun lt!240662 () tuple2!13660)

(assert (=> b!154253 (= lt!240662 (readBytePure!0 bs1!10))))

(declare-fun b!154254 () Bool)

(declare-fun e!103641 () Bool)

(assert (=> b!154254 (= e!103641 (array_inv!2928 (buf!3642 bs1!10)))))

(declare-fun b!154255 () Bool)

(declare-fun res!129126 () Bool)

(assert (=> b!154255 (=> (not res!129126) (not e!103638))))

(declare-fun arrayBitRangesEq!0 (array!6971 array!6971 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154255 (= res!129126 (arrayBitRangesEq!0 (buf!3642 bs1!10) (buf!3642 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240663))))

(declare-fun b!154256 () Bool)

(declare-fun res!129129 () Bool)

(assert (=> b!154256 (=> (not res!129129) (not e!103638))))

(assert (=> b!154256 (= res!129129 (bvsle lt!240663 (bitIndex!0 (size!3139 (buf!3642 bs2!18)) (currentByte!6664 bs2!18) (currentBit!6659 bs2!18))))))

(declare-fun res!129127 () Bool)

(assert (=> start!30076 (=> (not res!129127) (not e!103640))))

(assert (=> start!30076 (= res!129127 (= (size!3139 (buf!3642 bs1!10)) (size!3139 (buf!3642 bs2!18))))))

(assert (=> start!30076 e!103640))

(declare-fun inv!12 (BitStream!5536) Bool)

(assert (=> start!30076 (and (inv!12 bs1!10) e!103641)))

(assert (=> start!30076 (and (inv!12 bs2!18) e!103639)))

(assert (= (and start!30076 res!129127) b!154252))

(assert (= (and b!154252 res!129128) b!154256))

(assert (= (and b!154256 res!129129) b!154255))

(assert (= (and b!154255 res!129126) b!154253))

(assert (= start!30076 b!154254))

(assert (= start!30076 b!154251))

(declare-fun m!240217 () Bool)

(assert (=> b!154255 m!240217))

(declare-fun m!240219 () Bool)

(assert (=> b!154253 m!240219))

(declare-fun m!240221 () Bool)

(assert (=> b!154253 m!240221))

(declare-fun m!240223 () Bool)

(assert (=> b!154252 m!240223))

(declare-fun m!240225 () Bool)

(assert (=> b!154254 m!240225))

(declare-fun m!240227 () Bool)

(assert (=> b!154256 m!240227))

(declare-fun m!240229 () Bool)

(assert (=> b!154251 m!240229))

(declare-fun m!240231 () Bool)

(assert (=> start!30076 m!240231))

(declare-fun m!240233 () Bool)

(assert (=> start!30076 m!240233))

(push 1)

(assert (not b!154253))

(assert (not b!154252))

(assert (not b!154255))

(assert (not b!154254))

(assert (not b!154251))

(assert (not b!154256))

(assert (not start!30076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

