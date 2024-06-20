; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39164 () Bool)

(assert start!39164)

(declare-fun b!176140 () Bool)

(declare-fun res!145889 () Bool)

(declare-fun e!122801 () Bool)

(assert (=> b!176140 (=> (not res!145889) (not e!122801))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176140 (= res!145889 (not (= i!590 nBits!348)))))

(declare-fun b!176141 () Bool)

(declare-fun e!122802 () Bool)

(declare-fun e!122799 () Bool)

(assert (=> b!176141 (= e!122802 e!122799)))

(declare-fun res!145884 () Bool)

(assert (=> b!176141 (=> (not res!145884) (not e!122799))))

(declare-datatypes ((array!9509 0))(
  ( (array!9510 (arr!5125 (Array (_ BitVec 32) (_ BitVec 8))) (size!4195 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7498 0))(
  ( (BitStream!7499 (buf!4638 array!9509) (currentByte!8782 (_ BitVec 32)) (currentBit!8777 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12704 0))(
  ( (Unit!12705) )
))
(declare-datatypes ((tuple2!15154 0))(
  ( (tuple2!15155 (_1!8222 Unit!12704) (_2!8222 BitStream!7498)) )
))
(declare-fun lt!271431 () tuple2!15154)

(declare-datatypes ((tuple2!15156 0))(
  ( (tuple2!15157 (_1!8223 BitStream!7498) (_2!8223 Bool)) )
))
(declare-fun lt!271432 () tuple2!15156)

(declare-fun lt!271433 () Bool)

(assert (=> b!176141 (= res!145884 (and (= (_2!8223 lt!271432) lt!271433) (= (_1!8223 lt!271432) (_2!8222 lt!271431))))))

(declare-fun thiss!1204 () BitStream!7498)

(declare-fun readBitPure!0 (BitStream!7498) tuple2!15156)

(declare-fun readerFrom!0 (BitStream!7498 (_ BitVec 32) (_ BitVec 32)) BitStream!7498)

(assert (=> b!176141 (= lt!271432 (readBitPure!0 (readerFrom!0 (_2!8222 lt!271431) (currentBit!8777 thiss!1204) (currentByte!8782 thiss!1204))))))

(declare-fun b!176142 () Bool)

(assert (=> b!176142 (= e!122801 (not true))))

(declare-fun e!122800 () Bool)

(assert (=> b!176142 e!122800))

(declare-fun res!145887 () Bool)

(assert (=> b!176142 (=> (not res!145887) (not e!122800))))

(assert (=> b!176142 (= res!145887 (= (size!4195 (buf!4638 thiss!1204)) (size!4195 (buf!4638 (_2!8222 lt!271431)))))))

(declare-fun appendBit!0 (BitStream!7498 Bool) tuple2!15154)

(assert (=> b!176142 (= lt!271431 (appendBit!0 thiss!1204 lt!271433))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176142 (= lt!271433 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176143 () Bool)

(declare-fun res!145890 () Bool)

(assert (=> b!176143 (=> (not res!145890) (not e!122801))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176143 (= res!145890 (invariant!0 (currentBit!8777 thiss!1204) (currentByte!8782 thiss!1204) (size!4195 (buf!4638 thiss!1204))))))

(declare-fun b!176144 () Bool)

(declare-fun res!145888 () Bool)

(assert (=> b!176144 (=> (not res!145888) (not e!122801))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176144 (= res!145888 (validate_offset_bits!1 ((_ sign_extend 32) (size!4195 (buf!4638 thiss!1204))) ((_ sign_extend 32) (currentByte!8782 thiss!1204)) ((_ sign_extend 32) (currentBit!8777 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176145 () Bool)

(assert (=> b!176145 (= e!122800 e!122802)))

(declare-fun res!145886 () Bool)

(assert (=> b!176145 (=> (not res!145886) (not e!122802))))

(declare-fun lt!271430 () (_ BitVec 64))

(declare-fun lt!271429 () (_ BitVec 64))

(assert (=> b!176145 (= res!145886 (= lt!271430 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271429)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176145 (= lt!271430 (bitIndex!0 (size!4195 (buf!4638 (_2!8222 lt!271431))) (currentByte!8782 (_2!8222 lt!271431)) (currentBit!8777 (_2!8222 lt!271431))))))

(assert (=> b!176145 (= lt!271429 (bitIndex!0 (size!4195 (buf!4638 thiss!1204)) (currentByte!8782 thiss!1204) (currentBit!8777 thiss!1204)))))

(declare-fun b!176146 () Bool)

(declare-fun e!122803 () Bool)

(declare-fun array_inv!3936 (array!9509) Bool)

(assert (=> b!176146 (= e!122803 (array_inv!3936 (buf!4638 thiss!1204)))))

(declare-fun res!145883 () Bool)

(assert (=> start!39164 (=> (not res!145883) (not e!122801))))

(assert (=> start!39164 (= res!145883 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39164 e!122801))

(assert (=> start!39164 true))

(declare-fun inv!12 (BitStream!7498) Bool)

(assert (=> start!39164 (and (inv!12 thiss!1204) e!122803)))

(declare-fun b!176147 () Bool)

(declare-fun res!145885 () Bool)

(assert (=> b!176147 (=> (not res!145885) (not e!122802))))

(declare-fun isPrefixOf!0 (BitStream!7498 BitStream!7498) Bool)

(assert (=> b!176147 (= res!145885 (isPrefixOf!0 thiss!1204 (_2!8222 lt!271431)))))

(declare-fun b!176148 () Bool)

(assert (=> b!176148 (= e!122799 (= (bitIndex!0 (size!4195 (buf!4638 (_1!8223 lt!271432))) (currentByte!8782 (_1!8223 lt!271432)) (currentBit!8777 (_1!8223 lt!271432))) lt!271430))))

(assert (= (and start!39164 res!145883) b!176144))

(assert (= (and b!176144 res!145888) b!176143))

(assert (= (and b!176143 res!145890) b!176140))

(assert (= (and b!176140 res!145889) b!176142))

(assert (= (and b!176142 res!145887) b!176145))

(assert (= (and b!176145 res!145886) b!176147))

(assert (= (and b!176147 res!145885) b!176141))

(assert (= (and b!176141 res!145884) b!176148))

(assert (= start!39164 b!176146))

(declare-fun m!276307 () Bool)

(assert (=> b!176141 m!276307))

(assert (=> b!176141 m!276307))

(declare-fun m!276309 () Bool)

(assert (=> b!176141 m!276309))

(declare-fun m!276311 () Bool)

(assert (=> b!176145 m!276311))

(declare-fun m!276313 () Bool)

(assert (=> b!176145 m!276313))

(declare-fun m!276315 () Bool)

(assert (=> b!176147 m!276315))

(declare-fun m!276317 () Bool)

(assert (=> start!39164 m!276317))

(declare-fun m!276319 () Bool)

(assert (=> b!176146 m!276319))

(declare-fun m!276321 () Bool)

(assert (=> b!176148 m!276321))

(declare-fun m!276323 () Bool)

(assert (=> b!176143 m!276323))

(declare-fun m!276325 () Bool)

(assert (=> b!176142 m!276325))

(declare-fun m!276327 () Bool)

(assert (=> b!176144 m!276327))

(push 1)

(assert (not b!176144))

(assert (not start!39164))

(assert (not b!176143))

(assert (not b!176146))

(assert (not b!176147))

(assert (not b!176148))

(assert (not b!176142))

(assert (not b!176141))

(assert (not b!176145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

