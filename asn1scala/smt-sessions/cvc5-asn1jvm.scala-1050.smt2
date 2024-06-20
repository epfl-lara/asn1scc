; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30088 () Bool)

(assert start!30088)

(declare-fun b!154359 () Bool)

(declare-fun e!103748 () Bool)

(declare-datatypes ((array!6983 0))(
  ( (array!6984 (arr!3968 (Array (_ BitVec 32) (_ BitVec 8))) (size!3145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5548 0))(
  ( (BitStream!5549 (buf!3648 array!6983) (currentByte!6670 (_ BitVec 32)) (currentBit!6665 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5548)

(declare-fun array_inv!2934 (array!6983) Bool)

(assert (=> b!154359 (= e!103748 (array_inv!2934 (buf!3648 bs2!18)))))

(declare-fun b!154360 () Bool)

(declare-fun res!129199 () Bool)

(declare-fun e!103747 () Bool)

(assert (=> b!154360 (=> (not res!129199) (not e!103747))))

(declare-fun lt!240726 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154360 (= res!129199 (bvsle lt!240726 (bitIndex!0 (size!3145 (buf!3648 bs2!18)) (currentByte!6670 bs2!18) (currentBit!6665 bs2!18))))))

(declare-fun b!154361 () Bool)

(declare-fun res!129200 () Bool)

(assert (=> b!154361 (=> (not res!129200) (not e!103747))))

(declare-fun bs1!10 () BitStream!5548)

(declare-fun arrayBitRangesEq!0 (array!6983 array!6983 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154361 (= res!129200 (arrayBitRangesEq!0 (buf!3648 bs1!10) (buf!3648 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240726))))

(declare-fun b!154362 () Bool)

(declare-fun lt!240724 () (_ BitVec 64))

(declare-fun lt!240723 () (_ BitVec 64))

(assert (=> b!154362 (= e!103747 (and (= lt!240724 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240724 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!240723) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!154362 (= lt!240724 (bvand lt!240723 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240727 () (_ BitVec 64))

(assert (=> b!154362 (= lt!240723 (bvsdiv lt!240727 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13672 0))(
  ( (tuple2!13673 (_1!7235 BitStream!5548) (_2!7235 (_ BitVec 8))) )
))
(declare-fun lt!240722 () tuple2!13672)

(declare-fun readBytePure!0 (BitStream!5548) tuple2!13672)

(assert (=> b!154362 (= lt!240722 (readBytePure!0 (BitStream!5549 (buf!3648 bs2!18) (currentByte!6670 bs1!10) (currentBit!6665 bs1!10))))))

(declare-fun lt!240725 () tuple2!13672)

(assert (=> b!154362 (= lt!240725 (readBytePure!0 bs1!10))))

(declare-fun b!154363 () Bool)

(declare-fun e!103745 () Bool)

(assert (=> b!154363 (= e!103745 (array_inv!2934 (buf!3648 bs1!10)))))

(declare-fun b!154364 () Bool)

(declare-fun e!103744 () Bool)

(assert (=> b!154364 (= e!103744 e!103747)))

(declare-fun res!129201 () Bool)

(assert (=> b!154364 (=> (not res!129201) (not e!103747))))

(assert (=> b!154364 (= res!129201 (bvsle lt!240726 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3145 (buf!3648 bs1!10))))))))

(assert (=> b!154364 (= lt!240726 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240727))))

(assert (=> b!154364 (= lt!240727 (bitIndex!0 (size!3145 (buf!3648 bs1!10)) (currentByte!6670 bs1!10) (currentBit!6665 bs1!10)))))

(declare-fun res!129198 () Bool)

(assert (=> start!30088 (=> (not res!129198) (not e!103744))))

(assert (=> start!30088 (= res!129198 (= (size!3145 (buf!3648 bs1!10)) (size!3145 (buf!3648 bs2!18))))))

(assert (=> start!30088 e!103744))

(declare-fun inv!12 (BitStream!5548) Bool)

(assert (=> start!30088 (and (inv!12 bs1!10) e!103745)))

(assert (=> start!30088 (and (inv!12 bs2!18) e!103748)))

(assert (= (and start!30088 res!129198) b!154364))

(assert (= (and b!154364 res!129201) b!154360))

(assert (= (and b!154360 res!129199) b!154361))

(assert (= (and b!154361 res!129200) b!154362))

(assert (= start!30088 b!154363))

(assert (= start!30088 b!154359))

(declare-fun m!240325 () Bool)

(assert (=> b!154363 m!240325))

(declare-fun m!240327 () Bool)

(assert (=> b!154362 m!240327))

(declare-fun m!240329 () Bool)

(assert (=> b!154362 m!240329))

(declare-fun m!240331 () Bool)

(assert (=> b!154359 m!240331))

(declare-fun m!240333 () Bool)

(assert (=> start!30088 m!240333))

(declare-fun m!240335 () Bool)

(assert (=> start!30088 m!240335))

(declare-fun m!240337 () Bool)

(assert (=> b!154361 m!240337))

(declare-fun m!240339 () Bool)

(assert (=> b!154364 m!240339))

(declare-fun m!240341 () Bool)

(assert (=> b!154360 m!240341))

(push 1)

(assert (not b!154359))

(assert (not start!30088))

(assert (not b!154360))

(assert (not b!154361))

(assert (not b!154362))

(assert (not b!154364))

(assert (not b!154363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

