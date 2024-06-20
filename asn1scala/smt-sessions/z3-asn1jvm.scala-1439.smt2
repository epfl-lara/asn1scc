; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39586 () Bool)

(assert start!39586)

(declare-fun b!178188 () Bool)

(declare-fun e!124105 () Bool)

(declare-fun e!124102 () Bool)

(assert (=> b!178188 (= e!124105 (not e!124102))))

(declare-fun res!147750 () Bool)

(assert (=> b!178188 (=> res!147750 e!124102)))

(declare-datatypes ((array!9601 0))(
  ( (array!9602 (arr!5162 (Array (_ BitVec 32) (_ BitVec 8))) (size!4232 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7572 0))(
  ( (BitStream!7573 (buf!4675 array!9601) (currentByte!8873 (_ BitVec 32)) (currentBit!8868 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12844 0))(
  ( (Unit!12845) )
))
(declare-datatypes ((tuple2!15360 0))(
  ( (tuple2!15361 (_1!8325 Unit!12844) (_2!8325 BitStream!7572)) )
))
(declare-fun lt!273945 () tuple2!15360)

(declare-fun thiss!1204 () BitStream!7572)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178188 (= res!147750 (not (= (bitIndex!0 (size!4232 (buf!4675 (_2!8325 lt!273945))) (currentByte!8873 (_2!8325 lt!273945)) (currentBit!8868 (_2!8325 lt!273945))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4232 (buf!4675 thiss!1204)) (currentByte!8873 thiss!1204) (currentBit!8868 thiss!1204))))))))

(declare-fun e!124106 () Bool)

(assert (=> b!178188 e!124106))

(declare-fun res!147754 () Bool)

(assert (=> b!178188 (=> (not res!147754) (not e!124106))))

(assert (=> b!178188 (= res!147754 (= (size!4232 (buf!4675 thiss!1204)) (size!4232 (buf!4675 (_2!8325 lt!273945)))))))

(declare-fun lt!273944 () Bool)

(declare-fun appendBit!0 (BitStream!7572 Bool) tuple2!15360)

(assert (=> b!178188 (= lt!273945 (appendBit!0 thiss!1204 lt!273944))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!178188 (= lt!273944 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178189 () Bool)

(declare-fun e!124108 () Bool)

(declare-fun array_inv!3973 (array!9601) Bool)

(assert (=> b!178189 (= e!124108 (array_inv!3973 (buf!4675 thiss!1204)))))

(declare-fun b!178191 () Bool)

(declare-fun res!147753 () Bool)

(declare-fun e!124104 () Bool)

(assert (=> b!178191 (=> (not res!147753) (not e!124104))))

(declare-fun isPrefixOf!0 (BitStream!7572 BitStream!7572) Bool)

(assert (=> b!178191 (= res!147753 (isPrefixOf!0 thiss!1204 (_2!8325 lt!273945)))))

(declare-fun b!178192 () Bool)

(declare-fun res!147752 () Bool)

(assert (=> b!178192 (=> (not res!147752) (not e!124105))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178192 (= res!147752 (validate_offset_bits!1 ((_ sign_extend 32) (size!4232 (buf!4675 thiss!1204))) ((_ sign_extend 32) (currentByte!8873 thiss!1204)) ((_ sign_extend 32) (currentBit!8868 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178193 () Bool)

(declare-fun res!147749 () Bool)

(assert (=> b!178193 (=> (not res!147749) (not e!124105))))

(assert (=> b!178193 (= res!147749 (not (= i!590 nBits!348)))))

(declare-fun b!178194 () Bool)

(declare-fun e!124107 () Bool)

(declare-datatypes ((tuple2!15362 0))(
  ( (tuple2!15363 (_1!8326 BitStream!7572) (_2!8326 Bool)) )
))
(declare-fun lt!273946 () tuple2!15362)

(declare-fun lt!273949 () (_ BitVec 64))

(assert (=> b!178194 (= e!124107 (= (bitIndex!0 (size!4232 (buf!4675 (_1!8326 lt!273946))) (currentByte!8873 (_1!8326 lt!273946)) (currentBit!8868 (_1!8326 lt!273946))) lt!273949))))

(declare-fun b!178190 () Bool)

(assert (=> b!178190 (= e!124106 e!124104)))

(declare-fun res!147748 () Bool)

(assert (=> b!178190 (=> (not res!147748) (not e!124104))))

(declare-fun lt!273943 () (_ BitVec 64))

(assert (=> b!178190 (= res!147748 (= lt!273949 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273943)))))

(assert (=> b!178190 (= lt!273949 (bitIndex!0 (size!4232 (buf!4675 (_2!8325 lt!273945))) (currentByte!8873 (_2!8325 lt!273945)) (currentBit!8868 (_2!8325 lt!273945))))))

(assert (=> b!178190 (= lt!273943 (bitIndex!0 (size!4232 (buf!4675 thiss!1204)) (currentByte!8873 thiss!1204) (currentBit!8868 thiss!1204)))))

(declare-fun res!147756 () Bool)

(assert (=> start!39586 (=> (not res!147756) (not e!124105))))

(assert (=> start!39586 (= res!147756 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39586 e!124105))

(assert (=> start!39586 true))

(declare-fun inv!12 (BitStream!7572) Bool)

(assert (=> start!39586 (and (inv!12 thiss!1204) e!124108)))

(declare-fun b!178195 () Bool)

(assert (=> b!178195 (= e!124102 true)))

(declare-fun lt!273950 () (_ BitVec 64))

(declare-fun lt!273948 () tuple2!15360)

(assert (=> b!178195 (= lt!273950 (bitIndex!0 (size!4232 (buf!4675 (_2!8325 lt!273948))) (currentByte!8873 (_2!8325 lt!273948)) (currentBit!8868 (_2!8325 lt!273948))))))

(assert (=> b!178195 (isPrefixOf!0 thiss!1204 (_2!8325 lt!273948))))

(declare-fun lt!273947 () Unit!12844)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7572 BitStream!7572 BitStream!7572) Unit!12844)

(assert (=> b!178195 (= lt!273947 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8325 lt!273945) (_2!8325 lt!273948)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7572 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15360)

(assert (=> b!178195 (= lt!273948 (appendBitsLSBFirstLoopTR!0 (_2!8325 lt!273945) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178196 () Bool)

(declare-fun res!147751 () Bool)

(assert (=> b!178196 (=> (not res!147751) (not e!124105))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178196 (= res!147751 (invariant!0 (currentBit!8868 thiss!1204) (currentByte!8873 thiss!1204) (size!4232 (buf!4675 thiss!1204))))))

(declare-fun b!178197 () Bool)

(assert (=> b!178197 (= e!124104 e!124107)))

(declare-fun res!147755 () Bool)

(assert (=> b!178197 (=> (not res!147755) (not e!124107))))

(assert (=> b!178197 (= res!147755 (and (= (_2!8326 lt!273946) lt!273944) (= (_1!8326 lt!273946) (_2!8325 lt!273945))))))

(declare-fun readBitPure!0 (BitStream!7572) tuple2!15362)

(declare-fun readerFrom!0 (BitStream!7572 (_ BitVec 32) (_ BitVec 32)) BitStream!7572)

(assert (=> b!178197 (= lt!273946 (readBitPure!0 (readerFrom!0 (_2!8325 lt!273945) (currentBit!8868 thiss!1204) (currentByte!8873 thiss!1204))))))

(assert (= (and start!39586 res!147756) b!178192))

(assert (= (and b!178192 res!147752) b!178196))

(assert (= (and b!178196 res!147751) b!178193))

(assert (= (and b!178193 res!147749) b!178188))

(assert (= (and b!178188 res!147754) b!178190))

(assert (= (and b!178190 res!147748) b!178191))

(assert (= (and b!178191 res!147753) b!178197))

(assert (= (and b!178197 res!147755) b!178194))

(assert (= (and b!178188 (not res!147750)) b!178195))

(assert (= start!39586 b!178189))

(declare-fun m!278341 () Bool)

(assert (=> b!178197 m!278341))

(assert (=> b!178197 m!278341))

(declare-fun m!278343 () Bool)

(assert (=> b!178197 m!278343))

(declare-fun m!278345 () Bool)

(assert (=> b!178188 m!278345))

(declare-fun m!278347 () Bool)

(assert (=> b!178188 m!278347))

(declare-fun m!278349 () Bool)

(assert (=> b!178188 m!278349))

(declare-fun m!278351 () Bool)

(assert (=> start!39586 m!278351))

(declare-fun m!278353 () Bool)

(assert (=> b!178195 m!278353))

(declare-fun m!278355 () Bool)

(assert (=> b!178195 m!278355))

(declare-fun m!278357 () Bool)

(assert (=> b!178195 m!278357))

(declare-fun m!278359 () Bool)

(assert (=> b!178195 m!278359))

(declare-fun m!278361 () Bool)

(assert (=> b!178192 m!278361))

(declare-fun m!278363 () Bool)

(assert (=> b!178189 m!278363))

(declare-fun m!278365 () Bool)

(assert (=> b!178194 m!278365))

(declare-fun m!278367 () Bool)

(assert (=> b!178191 m!278367))

(assert (=> b!178190 m!278345))

(assert (=> b!178190 m!278347))

(declare-fun m!278369 () Bool)

(assert (=> b!178196 m!278369))

(check-sat (not b!178190) (not b!178189) (not b!178196) (not b!178194) (not b!178192) (not start!39586) (not b!178188) (not b!178191) (not b!178195) (not b!178197))
