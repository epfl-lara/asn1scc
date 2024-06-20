; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39166 () Bool)

(assert start!39166)

(declare-fun b!176167 () Bool)

(declare-fun e!122817 () Bool)

(assert (=> b!176167 (= e!122817 (not true))))

(declare-fun e!122821 () Bool)

(assert (=> b!176167 e!122821))

(declare-fun res!145907 () Bool)

(assert (=> b!176167 (=> (not res!145907) (not e!122821))))

(declare-datatypes ((array!9511 0))(
  ( (array!9512 (arr!5126 (Array (_ BitVec 32) (_ BitVec 8))) (size!4196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7500 0))(
  ( (BitStream!7501 (buf!4639 array!9511) (currentByte!8783 (_ BitVec 32)) (currentBit!8778 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7500)

(declare-datatypes ((Unit!12706 0))(
  ( (Unit!12707) )
))
(declare-datatypes ((tuple2!15158 0))(
  ( (tuple2!15159 (_1!8224 Unit!12706) (_2!8224 BitStream!7500)) )
))
(declare-fun lt!271445 () tuple2!15158)

(assert (=> b!176167 (= res!145907 (= (size!4196 (buf!4639 thiss!1204)) (size!4196 (buf!4639 (_2!8224 lt!271445)))))))

(declare-fun lt!271446 () Bool)

(declare-fun appendBit!0 (BitStream!7500 Bool) tuple2!15158)

(assert (=> b!176167 (= lt!271445 (appendBit!0 thiss!1204 lt!271446))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!176167 (= lt!271446 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176168 () Bool)

(declare-fun res!145911 () Bool)

(assert (=> b!176168 (=> (not res!145911) (not e!122817))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176168 (= res!145911 (not (= i!590 nBits!348)))))

(declare-fun res!145914 () Bool)

(assert (=> start!39166 (=> (not res!145914) (not e!122817))))

(assert (=> start!39166 (= res!145914 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39166 e!122817))

(assert (=> start!39166 true))

(declare-fun e!122816 () Bool)

(declare-fun inv!12 (BitStream!7500) Bool)

(assert (=> start!39166 (and (inv!12 thiss!1204) e!122816)))

(declare-fun b!176169 () Bool)

(declare-fun res!145910 () Bool)

(declare-fun e!122820 () Bool)

(assert (=> b!176169 (=> (not res!145910) (not e!122820))))

(declare-fun isPrefixOf!0 (BitStream!7500 BitStream!7500) Bool)

(assert (=> b!176169 (= res!145910 (isPrefixOf!0 thiss!1204 (_2!8224 lt!271445)))))

(declare-fun b!176170 () Bool)

(declare-fun res!145909 () Bool)

(assert (=> b!176170 (=> (not res!145909) (not e!122817))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176170 (= res!145909 (invariant!0 (currentBit!8778 thiss!1204) (currentByte!8783 thiss!1204) (size!4196 (buf!4639 thiss!1204))))))

(declare-fun b!176171 () Bool)

(declare-fun array_inv!3937 (array!9511) Bool)

(assert (=> b!176171 (= e!122816 (array_inv!3937 (buf!4639 thiss!1204)))))

(declare-fun b!176172 () Bool)

(declare-fun e!122819 () Bool)

(assert (=> b!176172 (= e!122820 e!122819)))

(declare-fun res!145908 () Bool)

(assert (=> b!176172 (=> (not res!145908) (not e!122819))))

(declare-datatypes ((tuple2!15160 0))(
  ( (tuple2!15161 (_1!8225 BitStream!7500) (_2!8225 Bool)) )
))
(declare-fun lt!271447 () tuple2!15160)

(assert (=> b!176172 (= res!145908 (and (= (_2!8225 lt!271447) lt!271446) (= (_1!8225 lt!271447) (_2!8224 lt!271445))))))

(declare-fun readBitPure!0 (BitStream!7500) tuple2!15160)

(declare-fun readerFrom!0 (BitStream!7500 (_ BitVec 32) (_ BitVec 32)) BitStream!7500)

(assert (=> b!176172 (= lt!271447 (readBitPure!0 (readerFrom!0 (_2!8224 lt!271445) (currentBit!8778 thiss!1204) (currentByte!8783 thiss!1204))))))

(declare-fun b!176173 () Bool)

(declare-fun lt!271444 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176173 (= e!122819 (= (bitIndex!0 (size!4196 (buf!4639 (_1!8225 lt!271447))) (currentByte!8783 (_1!8225 lt!271447)) (currentBit!8778 (_1!8225 lt!271447))) lt!271444))))

(declare-fun b!176174 () Bool)

(declare-fun res!145912 () Bool)

(assert (=> b!176174 (=> (not res!145912) (not e!122817))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176174 (= res!145912 (validate_offset_bits!1 ((_ sign_extend 32) (size!4196 (buf!4639 thiss!1204))) ((_ sign_extend 32) (currentByte!8783 thiss!1204)) ((_ sign_extend 32) (currentBit!8778 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176175 () Bool)

(assert (=> b!176175 (= e!122821 e!122820)))

(declare-fun res!145913 () Bool)

(assert (=> b!176175 (=> (not res!145913) (not e!122820))))

(declare-fun lt!271448 () (_ BitVec 64))

(assert (=> b!176175 (= res!145913 (= lt!271444 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271448)))))

(assert (=> b!176175 (= lt!271444 (bitIndex!0 (size!4196 (buf!4639 (_2!8224 lt!271445))) (currentByte!8783 (_2!8224 lt!271445)) (currentBit!8778 (_2!8224 lt!271445))))))

(assert (=> b!176175 (= lt!271448 (bitIndex!0 (size!4196 (buf!4639 thiss!1204)) (currentByte!8783 thiss!1204) (currentBit!8778 thiss!1204)))))

(assert (= (and start!39166 res!145914) b!176174))

(assert (= (and b!176174 res!145912) b!176170))

(assert (= (and b!176170 res!145909) b!176168))

(assert (= (and b!176168 res!145911) b!176167))

(assert (= (and b!176167 res!145907) b!176175))

(assert (= (and b!176175 res!145913) b!176169))

(assert (= (and b!176169 res!145910) b!176172))

(assert (= (and b!176172 res!145908) b!176173))

(assert (= start!39166 b!176171))

(declare-fun m!276329 () Bool)

(assert (=> b!176172 m!276329))

(assert (=> b!176172 m!276329))

(declare-fun m!276331 () Bool)

(assert (=> b!176172 m!276331))

(declare-fun m!276333 () Bool)

(assert (=> b!176174 m!276333))

(declare-fun m!276335 () Bool)

(assert (=> b!176167 m!276335))

(declare-fun m!276337 () Bool)

(assert (=> start!39166 m!276337))

(declare-fun m!276339 () Bool)

(assert (=> b!176173 m!276339))

(declare-fun m!276341 () Bool)

(assert (=> b!176169 m!276341))

(declare-fun m!276343 () Bool)

(assert (=> b!176175 m!276343))

(declare-fun m!276345 () Bool)

(assert (=> b!176175 m!276345))

(declare-fun m!276347 () Bool)

(assert (=> b!176170 m!276347))

(declare-fun m!276349 () Bool)

(assert (=> b!176171 m!276349))

(check-sat (not b!176169) (not start!39166) (not b!176171) (not b!176175) (not b!176174) (not b!176172) (not b!176170) (not b!176173) (not b!176167))
