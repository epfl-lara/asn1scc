; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30080 () Bool)

(assert start!30080)

(declare-fun b!154287 () Bool)

(declare-fun e!103676 () Bool)

(declare-fun e!103672 () Bool)

(assert (=> b!154287 (= e!103676 e!103672)))

(declare-fun res!129150 () Bool)

(assert (=> b!154287 (=> (not res!129150) (not e!103672))))

(declare-fun lt!240680 () (_ BitVec 64))

(declare-datatypes ((array!6975 0))(
  ( (array!6976 (arr!3964 (Array (_ BitVec 32) (_ BitVec 8))) (size!3141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5540 0))(
  ( (BitStream!5541 (buf!3644 array!6975) (currentByte!6666 (_ BitVec 32)) (currentBit!6661 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5540)

(assert (=> b!154287 (= res!129150 (bvsle lt!240680 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3141 (buf!3644 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154287 (= lt!240680 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3141 (buf!3644 bs1!10)) (currentByte!6666 bs1!10) (currentBit!6661 bs1!10))))))

(declare-fun b!154288 () Bool)

(declare-fun res!129153 () Bool)

(assert (=> b!154288 (=> (not res!129153) (not e!103672))))

(declare-fun bs2!18 () BitStream!5540)

(declare-fun arrayBitRangesEq!0 (array!6975 array!6975 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154288 (= res!129153 (arrayBitRangesEq!0 (buf!3644 bs1!10) (buf!3644 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240680))))

(declare-fun b!154289 () Bool)

(declare-fun e!103675 () Bool)

(declare-fun array_inv!2930 (array!6975) Bool)

(assert (=> b!154289 (= e!103675 (array_inv!2930 (buf!3644 bs1!10)))))

(declare-fun res!129152 () Bool)

(assert (=> start!30080 (=> (not res!129152) (not e!103676))))

(assert (=> start!30080 (= res!129152 (= (size!3141 (buf!3644 bs1!10)) (size!3141 (buf!3644 bs2!18))))))

(assert (=> start!30080 e!103676))

(declare-fun inv!12 (BitStream!5540) Bool)

(assert (=> start!30080 (and (inv!12 bs1!10) e!103675)))

(declare-fun e!103673 () Bool)

(assert (=> start!30080 (and (inv!12 bs2!18) e!103673)))

(declare-fun b!154290 () Bool)

(declare-fun res!129151 () Bool)

(assert (=> b!154290 (=> (not res!129151) (not e!103672))))

(assert (=> b!154290 (= res!129151 (bvsle lt!240680 (bitIndex!0 (size!3141 (buf!3644 bs2!18)) (currentByte!6666 bs2!18) (currentBit!6661 bs2!18))))))

(declare-fun b!154291 () Bool)

(assert (=> b!154291 (= e!103673 (array_inv!2930 (buf!3644 bs2!18)))))

(declare-fun b!154292 () Bool)

(assert (=> b!154292 (= e!103672 false)))

(declare-datatypes ((tuple2!13664 0))(
  ( (tuple2!13665 (_1!7231 BitStream!5540) (_2!7231 (_ BitVec 8))) )
))
(declare-fun lt!240681 () tuple2!13664)

(declare-fun readBytePure!0 (BitStream!5540) tuple2!13664)

(assert (=> b!154292 (= lt!240681 (readBytePure!0 (BitStream!5541 (buf!3644 bs2!18) (currentByte!6666 bs1!10) (currentBit!6661 bs1!10))))))

(declare-fun lt!240682 () tuple2!13664)

(assert (=> b!154292 (= lt!240682 (readBytePure!0 bs1!10))))

(assert (= (and start!30080 res!129152) b!154287))

(assert (= (and b!154287 res!129150) b!154290))

(assert (= (and b!154290 res!129151) b!154288))

(assert (= (and b!154288 res!129153) b!154292))

(assert (= start!30080 b!154289))

(assert (= start!30080 b!154291))

(declare-fun m!240253 () Bool)

(assert (=> b!154287 m!240253))

(declare-fun m!240255 () Bool)

(assert (=> b!154291 m!240255))

(declare-fun m!240257 () Bool)

(assert (=> b!154288 m!240257))

(declare-fun m!240259 () Bool)

(assert (=> b!154292 m!240259))

(declare-fun m!240261 () Bool)

(assert (=> b!154292 m!240261))

(declare-fun m!240263 () Bool)

(assert (=> start!30080 m!240263))

(declare-fun m!240265 () Bool)

(assert (=> start!30080 m!240265))

(declare-fun m!240267 () Bool)

(assert (=> b!154289 m!240267))

(declare-fun m!240269 () Bool)

(assert (=> b!154290 m!240269))

(push 1)

(assert (not b!154287))

(assert (not start!30080))

(assert (not b!154289))

(assert (not b!154291))

(assert (not b!154292))

(assert (not b!154290))

(assert (not b!154288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

