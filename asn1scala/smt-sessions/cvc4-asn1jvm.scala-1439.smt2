; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39588 () Bool)

(assert start!39588)

(declare-fun res!147776 () Bool)

(declare-fun e!124128 () Bool)

(assert (=> start!39588 (=> (not res!147776) (not e!124128))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39588 (= res!147776 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39588 e!124128))

(assert (=> start!39588 true))

(declare-datatypes ((array!9603 0))(
  ( (array!9604 (arr!5163 (Array (_ BitVec 32) (_ BitVec 8))) (size!4233 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7574 0))(
  ( (BitStream!7575 (buf!4676 array!9603) (currentByte!8874 (_ BitVec 32)) (currentBit!8869 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7574)

(declare-fun e!124123 () Bool)

(declare-fun inv!12 (BitStream!7574) Bool)

(assert (=> start!39588 (and (inv!12 thiss!1204) e!124123)))

(declare-fun b!178218 () Bool)

(declare-fun res!147778 () Bool)

(declare-fun e!124124 () Bool)

(assert (=> b!178218 (=> (not res!147778) (not e!124124))))

(declare-datatypes ((Unit!12846 0))(
  ( (Unit!12847) )
))
(declare-datatypes ((tuple2!15364 0))(
  ( (tuple2!15365 (_1!8327 Unit!12846) (_2!8327 BitStream!7574)) )
))
(declare-fun lt!273973 () tuple2!15364)

(declare-fun isPrefixOf!0 (BitStream!7574 BitStream!7574) Bool)

(assert (=> b!178218 (= res!147778 (isPrefixOf!0 thiss!1204 (_2!8327 lt!273973)))))

(declare-fun b!178219 () Bool)

(declare-fun array_inv!3974 (array!9603) Bool)

(assert (=> b!178219 (= e!124123 (array_inv!3974 (buf!4676 thiss!1204)))))

(declare-fun b!178220 () Bool)

(declare-fun e!124129 () Bool)

(assert (=> b!178220 (= e!124128 (not e!124129))))

(declare-fun res!147779 () Bool)

(assert (=> b!178220 (=> res!147779 e!124129)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178220 (= res!147779 (not (= (bitIndex!0 (size!4233 (buf!4676 (_2!8327 lt!273973))) (currentByte!8874 (_2!8327 lt!273973)) (currentBit!8869 (_2!8327 lt!273973))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4233 (buf!4676 thiss!1204)) (currentByte!8874 thiss!1204) (currentBit!8869 thiss!1204))))))))

(declare-fun e!124127 () Bool)

(assert (=> b!178220 e!124127))

(declare-fun res!147783 () Bool)

(assert (=> b!178220 (=> (not res!147783) (not e!124127))))

(assert (=> b!178220 (= res!147783 (= (size!4233 (buf!4676 thiss!1204)) (size!4233 (buf!4676 (_2!8327 lt!273973)))))))

(declare-fun lt!273969 () Bool)

(declare-fun appendBit!0 (BitStream!7574 Bool) tuple2!15364)

(assert (=> b!178220 (= lt!273973 (appendBit!0 thiss!1204 lt!273969))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178220 (= lt!273969 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178221 () Bool)

(assert (=> b!178221 (= e!124129 true)))

(declare-fun lt!273974 () (_ BitVec 64))

(declare-fun lt!273971 () tuple2!15364)

(assert (=> b!178221 (= lt!273974 (bitIndex!0 (size!4233 (buf!4676 (_2!8327 lt!273971))) (currentByte!8874 (_2!8327 lt!273971)) (currentBit!8869 (_2!8327 lt!273971))))))

(assert (=> b!178221 (isPrefixOf!0 thiss!1204 (_2!8327 lt!273971))))

(declare-fun lt!273972 () Unit!12846)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7574 BitStream!7574 BitStream!7574) Unit!12846)

(assert (=> b!178221 (= lt!273972 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8327 lt!273973) (_2!8327 lt!273971)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15364)

(assert (=> b!178221 (= lt!273971 (appendBitsLSBFirstLoopTR!0 (_2!8327 lt!273973) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178222 () Bool)

(declare-fun res!147780 () Bool)

(assert (=> b!178222 (=> (not res!147780) (not e!124128))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178222 (= res!147780 (invariant!0 (currentBit!8869 thiss!1204) (currentByte!8874 thiss!1204) (size!4233 (buf!4676 thiss!1204))))))

(declare-fun b!178223 () Bool)

(declare-fun e!124125 () Bool)

(assert (=> b!178223 (= e!124124 e!124125)))

(declare-fun res!147781 () Bool)

(assert (=> b!178223 (=> (not res!147781) (not e!124125))))

(declare-datatypes ((tuple2!15366 0))(
  ( (tuple2!15367 (_1!8328 BitStream!7574) (_2!8328 Bool)) )
))
(declare-fun lt!273970 () tuple2!15366)

(assert (=> b!178223 (= res!147781 (and (= (_2!8328 lt!273970) lt!273969) (= (_1!8328 lt!273970) (_2!8327 lt!273973))))))

(declare-fun readBitPure!0 (BitStream!7574) tuple2!15366)

(declare-fun readerFrom!0 (BitStream!7574 (_ BitVec 32) (_ BitVec 32)) BitStream!7574)

(assert (=> b!178223 (= lt!273970 (readBitPure!0 (readerFrom!0 (_2!8327 lt!273973) (currentBit!8869 thiss!1204) (currentByte!8874 thiss!1204))))))

(declare-fun b!178224 () Bool)

(declare-fun res!147782 () Bool)

(assert (=> b!178224 (=> (not res!147782) (not e!124128))))

(assert (=> b!178224 (= res!147782 (not (= i!590 nBits!348)))))

(declare-fun b!178225 () Bool)

(assert (=> b!178225 (= e!124127 e!124124)))

(declare-fun res!147775 () Bool)

(assert (=> b!178225 (=> (not res!147775) (not e!124124))))

(declare-fun lt!273968 () (_ BitVec 64))

(declare-fun lt!273967 () (_ BitVec 64))

(assert (=> b!178225 (= res!147775 (= lt!273968 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273967)))))

(assert (=> b!178225 (= lt!273968 (bitIndex!0 (size!4233 (buf!4676 (_2!8327 lt!273973))) (currentByte!8874 (_2!8327 lt!273973)) (currentBit!8869 (_2!8327 lt!273973))))))

(assert (=> b!178225 (= lt!273967 (bitIndex!0 (size!4233 (buf!4676 thiss!1204)) (currentByte!8874 thiss!1204) (currentBit!8869 thiss!1204)))))

(declare-fun b!178226 () Bool)

(assert (=> b!178226 (= e!124125 (= (bitIndex!0 (size!4233 (buf!4676 (_1!8328 lt!273970))) (currentByte!8874 (_1!8328 lt!273970)) (currentBit!8869 (_1!8328 lt!273970))) lt!273968))))

(declare-fun b!178227 () Bool)

(declare-fun res!147777 () Bool)

(assert (=> b!178227 (=> (not res!147777) (not e!124128))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178227 (= res!147777 (validate_offset_bits!1 ((_ sign_extend 32) (size!4233 (buf!4676 thiss!1204))) ((_ sign_extend 32) (currentByte!8874 thiss!1204)) ((_ sign_extend 32) (currentBit!8869 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!39588 res!147776) b!178227))

(assert (= (and b!178227 res!147777) b!178222))

(assert (= (and b!178222 res!147780) b!178224))

(assert (= (and b!178224 res!147782) b!178220))

(assert (= (and b!178220 res!147783) b!178225))

(assert (= (and b!178225 res!147775) b!178218))

(assert (= (and b!178218 res!147778) b!178223))

(assert (= (and b!178223 res!147781) b!178226))

(assert (= (and b!178220 (not res!147779)) b!178221))

(assert (= start!39588 b!178219))

(declare-fun m!278371 () Bool)

(assert (=> b!178226 m!278371))

(declare-fun m!278373 () Bool)

(assert (=> b!178218 m!278373))

(declare-fun m!278375 () Bool)

(assert (=> start!39588 m!278375))

(declare-fun m!278377 () Bool)

(assert (=> b!178220 m!278377))

(declare-fun m!278379 () Bool)

(assert (=> b!178220 m!278379))

(declare-fun m!278381 () Bool)

(assert (=> b!178220 m!278381))

(assert (=> b!178225 m!278377))

(assert (=> b!178225 m!278379))

(declare-fun m!278383 () Bool)

(assert (=> b!178227 m!278383))

(declare-fun m!278385 () Bool)

(assert (=> b!178222 m!278385))

(declare-fun m!278387 () Bool)

(assert (=> b!178223 m!278387))

(assert (=> b!178223 m!278387))

(declare-fun m!278389 () Bool)

(assert (=> b!178223 m!278389))

(declare-fun m!278391 () Bool)

(assert (=> b!178221 m!278391))

(declare-fun m!278393 () Bool)

(assert (=> b!178221 m!278393))

(declare-fun m!278395 () Bool)

(assert (=> b!178221 m!278395))

(declare-fun m!278397 () Bool)

(assert (=> b!178221 m!278397))

(declare-fun m!278399 () Bool)

(assert (=> b!178219 m!278399))

(push 1)

(assert (not b!178222))

(assert (not b!178226))

(assert (not start!39588))

(assert (not b!178227))

(assert (not b!178225))

(assert (not b!178221))

(assert (not b!178219))

(assert (not b!178223))

(assert (not b!178220))

(assert (not b!178218))

(check-sat)

(pop 1)

