; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59974 () Bool)

(assert start!59974)

(declare-fun res!227530 () Bool)

(declare-fun e!193245 () Bool)

(assert (=> start!59974 (=> (not res!227530) (not e!193245))))

(declare-datatypes ((array!15322 0))(
  ( (array!15323 (arr!7646 (Array (_ BitVec 32) (_ BitVec 8))) (size!6659 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12132 0))(
  ( (BitStream!12133 (buf!7127 array!15322) (currentByte!13149 (_ BitVec 32)) (currentBit!13144 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12132)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12132 (_ BitVec 64)) Bool)

(assert (=> start!59974 (= res!227530 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59974 e!193245))

(declare-fun e!193244 () Bool)

(declare-fun inv!12 (BitStream!12132) Bool)

(assert (=> start!59974 (and (inv!12 thiss!890) e!193244)))

(assert (=> start!59974 true))

(declare-fun lt!411301 () (_ BitVec 64))

(declare-fun lt!411300 () (_ BitVec 64))

(declare-fun b!273361 () Bool)

(assert (=> b!273361 (= e!193245 (and (= lt!411301 (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!411301 (bvand (bvadd lt!411300 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!273361 (= lt!411301 (bvand lt!411300 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273361 (= lt!411300 (bitIndex!0 (size!6659 (buf!7127 thiss!890)) (currentByte!13149 thiss!890) (currentBit!13144 thiss!890)))))

(declare-datatypes ((Unit!19315 0))(
  ( (Unit!19316) )
))
(declare-datatypes ((tuple2!22420 0))(
  ( (tuple2!22421 (_1!12242 Unit!19315) (_2!12242 BitStream!12132)) )
))
(declare-fun lt!411302 () tuple2!22420)

(declare-fun moveBitIndex!0 (BitStream!12132 (_ BitVec 64)) tuple2!22420)

(assert (=> b!273361 (= lt!411302 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273362 () Bool)

(declare-fun array_inv!6383 (array!15322) Bool)

(assert (=> b!273362 (= e!193244 (array_inv!6383 (buf!7127 thiss!890)))))

(assert (= (and start!59974 res!227530) b!273361))

(assert (= start!59974 b!273362))

(declare-fun m!406229 () Bool)

(assert (=> start!59974 m!406229))

(declare-fun m!406231 () Bool)

(assert (=> start!59974 m!406231))

(declare-fun m!406233 () Bool)

(assert (=> b!273361 m!406233))

(declare-fun m!406235 () Bool)

(assert (=> b!273361 m!406235))

(declare-fun m!406237 () Bool)

(assert (=> b!273362 m!406237))

(check-sat (not b!273362) (not b!273361) (not start!59974))
(check-sat)
(get-model)

(declare-fun d!93546 () Bool)

