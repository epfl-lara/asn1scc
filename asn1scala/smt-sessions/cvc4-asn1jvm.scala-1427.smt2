; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39168 () Bool)

(assert start!39168)

(declare-fun b!176194 () Bool)

(declare-fun res!145932 () Bool)

(declare-fun e!122839 () Bool)

(assert (=> b!176194 (=> (not res!145932) (not e!122839))))

(declare-datatypes ((array!9513 0))(
  ( (array!9514 (arr!5127 (Array (_ BitVec 32) (_ BitVec 8))) (size!4197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7502 0))(
  ( (BitStream!7503 (buf!4640 array!9513) (currentByte!8784 (_ BitVec 32)) (currentBit!8779 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7502)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176194 (= res!145932 (invariant!0 (currentBit!8779 thiss!1204) (currentByte!8784 thiss!1204) (size!4197 (buf!4640 thiss!1204))))))

(declare-fun b!176195 () Bool)

(declare-fun e!122834 () Bool)

(declare-datatypes ((tuple2!15162 0))(
  ( (tuple2!15163 (_1!8226 BitStream!7502) (_2!8226 Bool)) )
))
(declare-fun lt!271461 () tuple2!15162)

(declare-fun lt!271460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176195 (= e!122834 (= (bitIndex!0 (size!4197 (buf!4640 (_1!8226 lt!271461))) (currentByte!8784 (_1!8226 lt!271461)) (currentBit!8779 (_1!8226 lt!271461))) lt!271460))))

(declare-fun b!176196 () Bool)

(declare-fun e!122836 () Bool)

(declare-fun e!122838 () Bool)

(assert (=> b!176196 (= e!122836 e!122838)))

(declare-fun res!145938 () Bool)

(assert (=> b!176196 (=> (not res!145938) (not e!122838))))

(declare-fun lt!271459 () (_ BitVec 64))

(assert (=> b!176196 (= res!145938 (= lt!271460 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271459)))))

(declare-datatypes ((Unit!12708 0))(
  ( (Unit!12709) )
))
(declare-datatypes ((tuple2!15164 0))(
  ( (tuple2!15165 (_1!8227 Unit!12708) (_2!8227 BitStream!7502)) )
))
(declare-fun lt!271462 () tuple2!15164)

(assert (=> b!176196 (= lt!271460 (bitIndex!0 (size!4197 (buf!4640 (_2!8227 lt!271462))) (currentByte!8784 (_2!8227 lt!271462)) (currentBit!8779 (_2!8227 lt!271462))))))

(assert (=> b!176196 (= lt!271459 (bitIndex!0 (size!4197 (buf!4640 thiss!1204)) (currentByte!8784 thiss!1204) (currentBit!8779 thiss!1204)))))

(declare-fun b!176197 () Bool)

(declare-fun res!145935 () Bool)

(assert (=> b!176197 (=> (not res!145935) (not e!122838))))

(declare-fun isPrefixOf!0 (BitStream!7502 BitStream!7502) Bool)

(assert (=> b!176197 (= res!145935 (isPrefixOf!0 thiss!1204 (_2!8227 lt!271462)))))

(declare-fun b!176198 () Bool)

(declare-fun res!145936 () Bool)

(assert (=> b!176198 (=> (not res!145936) (not e!122839))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176198 (= res!145936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4197 (buf!4640 thiss!1204))) ((_ sign_extend 32) (currentByte!8784 thiss!1204)) ((_ sign_extend 32) (currentBit!8779 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176199 () Bool)

(declare-fun e!122837 () Bool)

(declare-fun array_inv!3938 (array!9513) Bool)

(assert (=> b!176199 (= e!122837 (array_inv!3938 (buf!4640 thiss!1204)))))

(declare-fun res!145934 () Bool)

(assert (=> start!39168 (=> (not res!145934) (not e!122839))))

(assert (=> start!39168 (= res!145934 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39168 e!122839))

(assert (=> start!39168 true))

(declare-fun inv!12 (BitStream!7502) Bool)

(assert (=> start!39168 (and (inv!12 thiss!1204) e!122837)))

(declare-fun b!176200 () Bool)

(declare-fun res!145931 () Bool)

(assert (=> b!176200 (=> (not res!145931) (not e!122839))))

(assert (=> b!176200 (= res!145931 (not (= i!590 nBits!348)))))

(declare-fun b!176201 () Bool)

(assert (=> b!176201 (= e!122839 (not true))))

(assert (=> b!176201 e!122836))

(declare-fun res!145933 () Bool)

(assert (=> b!176201 (=> (not res!145933) (not e!122836))))

(assert (=> b!176201 (= res!145933 (= (size!4197 (buf!4640 thiss!1204)) (size!4197 (buf!4640 (_2!8227 lt!271462)))))))

(declare-fun lt!271463 () Bool)

(declare-fun appendBit!0 (BitStream!7502 Bool) tuple2!15164)

(assert (=> b!176201 (= lt!271462 (appendBit!0 thiss!1204 lt!271463))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176201 (= lt!271463 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176202 () Bool)

(assert (=> b!176202 (= e!122838 e!122834)))

(declare-fun res!145937 () Bool)

(assert (=> b!176202 (=> (not res!145937) (not e!122834))))

(assert (=> b!176202 (= res!145937 (and (= (_2!8226 lt!271461) lt!271463) (= (_1!8226 lt!271461) (_2!8227 lt!271462))))))

(declare-fun readBitPure!0 (BitStream!7502) tuple2!15162)

(declare-fun readerFrom!0 (BitStream!7502 (_ BitVec 32) (_ BitVec 32)) BitStream!7502)

(assert (=> b!176202 (= lt!271461 (readBitPure!0 (readerFrom!0 (_2!8227 lt!271462) (currentBit!8779 thiss!1204) (currentByte!8784 thiss!1204))))))

(assert (= (and start!39168 res!145934) b!176198))

(assert (= (and b!176198 res!145936) b!176194))

(assert (= (and b!176194 res!145932) b!176200))

(assert (= (and b!176200 res!145931) b!176201))

(assert (= (and b!176201 res!145933) b!176196))

(assert (= (and b!176196 res!145938) b!176197))

(assert (= (and b!176197 res!145935) b!176202))

(assert (= (and b!176202 res!145937) b!176195))

(assert (= start!39168 b!176199))

(declare-fun m!276351 () Bool)

(assert (=> b!176197 m!276351))

(declare-fun m!276353 () Bool)

(assert (=> b!176199 m!276353))

(declare-fun m!276355 () Bool)

(assert (=> start!39168 m!276355))

(declare-fun m!276357 () Bool)

(assert (=> b!176198 m!276357))

(declare-fun m!276359 () Bool)

(assert (=> b!176194 m!276359))

(declare-fun m!276361 () Bool)

(assert (=> b!176195 m!276361))

(declare-fun m!276363 () Bool)

(assert (=> b!176196 m!276363))

(declare-fun m!276365 () Bool)

(assert (=> b!176196 m!276365))

(declare-fun m!276367 () Bool)

(assert (=> b!176202 m!276367))

(assert (=> b!176202 m!276367))

(declare-fun m!276369 () Bool)

(assert (=> b!176202 m!276369))

(declare-fun m!276371 () Bool)

(assert (=> b!176201 m!276371))

(push 1)

(assert (not b!176197))

(assert (not b!176196))

(assert (not b!176194))

(assert (not b!176195))

(assert (not b!176198))

(assert (not b!176201))

(assert (not b!176199))

(assert (not b!176202))

(assert (not start!39168))

(check-sat)

(pop 1)

