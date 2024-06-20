; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30082 () Bool)

(assert start!30082)

(declare-fun b!154305 () Bool)

(declare-fun e!103694 () Bool)

(declare-fun e!103691 () Bool)

(assert (=> b!154305 (= e!103694 e!103691)))

(declare-fun res!129163 () Bool)

(assert (=> b!154305 (=> (not res!129163) (not e!103691))))

(declare-fun lt!240690 () (_ BitVec 64))

(declare-datatypes ((array!6977 0))(
  ( (array!6978 (arr!3965 (Array (_ BitVec 32) (_ BitVec 8))) (size!3142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5542 0))(
  ( (BitStream!5543 (buf!3645 array!6977) (currentByte!6667 (_ BitVec 32)) (currentBit!6662 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5542)

(assert (=> b!154305 (= res!129163 (bvsle lt!240690 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3142 (buf!3645 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154305 (= lt!240690 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3142 (buf!3645 bs1!10)) (currentByte!6667 bs1!10) (currentBit!6662 bs1!10))))))

(declare-fun res!129165 () Bool)

(assert (=> start!30082 (=> (not res!129165) (not e!103694))))

(declare-fun bs2!18 () BitStream!5542)

(assert (=> start!30082 (= res!129165 (= (size!3142 (buf!3645 bs1!10)) (size!3142 (buf!3645 bs2!18))))))

(assert (=> start!30082 e!103694))

(declare-fun e!103690 () Bool)

(declare-fun inv!12 (BitStream!5542) Bool)

(assert (=> start!30082 (and (inv!12 bs1!10) e!103690)))

(declare-fun e!103695 () Bool)

(assert (=> start!30082 (and (inv!12 bs2!18) e!103695)))

(declare-fun b!154306 () Bool)

(declare-fun res!129162 () Bool)

(assert (=> b!154306 (=> (not res!129162) (not e!103691))))

(assert (=> b!154306 (= res!129162 (bvsle lt!240690 (bitIndex!0 (size!3142 (buf!3645 bs2!18)) (currentByte!6667 bs2!18) (currentBit!6662 bs2!18))))))

(declare-fun b!154307 () Bool)

(declare-fun array_inv!2931 (array!6977) Bool)

(assert (=> b!154307 (= e!103690 (array_inv!2931 (buf!3645 bs1!10)))))

(declare-fun b!154308 () Bool)

(declare-fun res!129164 () Bool)

(assert (=> b!154308 (=> (not res!129164) (not e!103691))))

(declare-fun arrayBitRangesEq!0 (array!6977 array!6977 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154308 (= res!129164 (arrayBitRangesEq!0 (buf!3645 bs1!10) (buf!3645 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240690))))

(declare-fun b!154309 () Bool)

(assert (=> b!154309 (= e!103691 false)))

(declare-datatypes ((tuple2!13666 0))(
  ( (tuple2!13667 (_1!7232 BitStream!5542) (_2!7232 (_ BitVec 8))) )
))
(declare-fun lt!240689 () tuple2!13666)

(declare-fun readBytePure!0 (BitStream!5542) tuple2!13666)

(assert (=> b!154309 (= lt!240689 (readBytePure!0 (BitStream!5543 (buf!3645 bs2!18) (currentByte!6667 bs1!10) (currentBit!6662 bs1!10))))))

(declare-fun lt!240691 () tuple2!13666)

(assert (=> b!154309 (= lt!240691 (readBytePure!0 bs1!10))))

(declare-fun b!154310 () Bool)

(assert (=> b!154310 (= e!103695 (array_inv!2931 (buf!3645 bs2!18)))))

(assert (= (and start!30082 res!129165) b!154305))

(assert (= (and b!154305 res!129163) b!154306))

(assert (= (and b!154306 res!129162) b!154308))

(assert (= (and b!154308 res!129164) b!154309))

(assert (= start!30082 b!154307))

(assert (= start!30082 b!154310))

(declare-fun m!240271 () Bool)

(assert (=> b!154307 m!240271))

(declare-fun m!240273 () Bool)

(assert (=> b!154306 m!240273))

(declare-fun m!240275 () Bool)

(assert (=> b!154308 m!240275))

(declare-fun m!240277 () Bool)

(assert (=> b!154309 m!240277))

(declare-fun m!240279 () Bool)

(assert (=> b!154309 m!240279))

(declare-fun m!240281 () Bool)

(assert (=> start!30082 m!240281))

(declare-fun m!240283 () Bool)

(assert (=> start!30082 m!240283))

(declare-fun m!240285 () Bool)

(assert (=> b!154310 m!240285))

(declare-fun m!240287 () Bool)

(assert (=> b!154305 m!240287))

(push 1)

(assert (not b!154308))

(assert (not b!154309))

(assert (not b!154307))

(assert (not b!154306))

(assert (not b!154310))

(assert (not b!154305))

(assert (not start!30082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

