; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46692 () Bool)

(assert start!46692)

(declare-fun b!223932 () Bool)

(declare-fun res!187983 () Bool)

(declare-fun e!152472 () Bool)

(assert (=> b!223932 (=> (not res!187983) (not e!152472))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223932 (= res!187983 (bvslt i!761 to!496))))

(declare-fun b!223931 () Bool)

(declare-fun res!187981 () Bool)

(assert (=> b!223931 (=> (not res!187981) (not e!152472))))

(declare-datatypes ((array!11008 0))(
  ( (array!11009 (arr!5775 (Array (_ BitVec 32) (_ BitVec 8))) (size!4827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8756 0))(
  ( (BitStream!8757 (buf!5371 array!11008) (currentByte!10099 (_ BitVec 32)) (currentBit!10094 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8756)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223931 (= res!187981 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4827 (buf!5371 thiss!1870))) ((_ sign_extend 32) (currentByte!10099 thiss!1870)) ((_ sign_extend 32) (currentBit!10094 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223934 () Bool)

(declare-fun e!152474 () Bool)

(declare-fun array_inv!4568 (array!11008) Bool)

(assert (=> b!223934 (= e!152474 (array_inv!4568 (buf!5371 thiss!1870)))))

(declare-fun res!187982 () Bool)

(assert (=> start!46692 (=> (not res!187982) (not e!152472))))

(declare-fun arr!308 () array!11008)

(assert (=> start!46692 (= res!187982 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4827 arr!308))))))

(assert (=> start!46692 e!152472))

(assert (=> start!46692 true))

(assert (=> start!46692 (array_inv!4568 arr!308)))

(declare-fun inv!12 (BitStream!8756) Bool)

(assert (=> start!46692 (and (inv!12 thiss!1870) e!152474)))

(declare-fun b!223933 () Bool)

(assert (=> b!223933 (= e!152472 (not true))))

(declare-fun lt!355059 () array!11008)

(declare-fun arrayRangesEq!723 (array!11008 array!11008 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223933 (arrayRangesEq!723 arr!308 lt!355059 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16323 0))(
  ( (Unit!16324) )
))
(declare-fun lt!355060 () Unit!16323)

(declare-datatypes ((tuple2!19142 0))(
  ( (tuple2!19143 (_1!10303 (_ BitVec 8)) (_2!10303 BitStream!8756)) )
))
(declare-fun lt!355058 () tuple2!19142)

(declare-fun arrayUpdatedAtPrefixLemma!315 (array!11008 (_ BitVec 32) (_ BitVec 8)) Unit!16323)

(assert (=> b!223933 (= lt!355060 (arrayUpdatedAtPrefixLemma!315 arr!308 i!761 (_1!10303 lt!355058)))))

(declare-fun lt!355061 () (_ BitVec 64))

(declare-datatypes ((tuple3!1180 0))(
  ( (tuple3!1181 (_1!10304 Unit!16323) (_2!10304 BitStream!8756) (_3!732 array!11008)) )
))
(declare-fun lt!355054 () tuple3!1180)

(declare-fun lt!355055 () (_ BitVec 64))

(declare-fun lt!355056 () (_ BitVec 64))

(declare-fun lt!355057 () (_ BitVec 32))

(assert (=> b!223933 (and (= (bvadd lt!355061 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355057))) lt!355055) (= (bvadd lt!355056 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355055) (= (buf!5371 thiss!1870) (buf!5371 (_2!10304 lt!355054))) (= (size!4827 arr!308) (size!4827 (_3!732 lt!355054))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223933 (= lt!355055 (bitIndex!0 (size!4827 (buf!5371 (_2!10304 lt!355054))) (currentByte!10099 (_2!10304 lt!355054)) (currentBit!10094 (_2!10304 lt!355054))))))

(assert (=> b!223933 (= lt!355061 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355056))))

(assert (=> b!223933 (= lt!355061 (bitIndex!0 (size!4827 (buf!5371 (_2!10303 lt!355058))) (currentByte!10099 (_2!10303 lt!355058)) (currentBit!10094 (_2!10303 lt!355058))))))

(assert (=> b!223933 (= lt!355056 (bitIndex!0 (size!4827 (buf!5371 thiss!1870)) (currentByte!10099 thiss!1870) (currentBit!10094 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8756 array!11008 (_ BitVec 32) (_ BitVec 32)) tuple3!1180)

(assert (=> b!223933 (= lt!355054 (readByteArrayLoop!0 (_2!10303 lt!355058) lt!355059 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223933 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4827 (buf!5371 (_2!10303 lt!355058)))) ((_ sign_extend 32) (currentByte!10099 (_2!10303 lt!355058))) ((_ sign_extend 32) (currentBit!10094 (_2!10303 lt!355058))) lt!355057)))

(assert (=> b!223933 (= lt!355057 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355062 () Unit!16323)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8756 BitStream!8756 (_ BitVec 64) (_ BitVec 32)) Unit!16323)

(assert (=> b!223933 (= lt!355062 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10303 lt!355058) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!223933 (= lt!355059 (array!11009 (store (arr!5775 arr!308) i!761 (_1!10303 lt!355058)) (size!4827 arr!308)))))

(declare-fun readByte!0 (BitStream!8756) tuple2!19142)

(assert (=> b!223933 (= lt!355058 (readByte!0 thiss!1870))))

(assert (= (and start!46692 res!187982) b!223931))

(assert (= (and b!223931 res!187981) b!223932))

(assert (= (and b!223932 res!187983) b!223933))

(assert (= start!46692 b!223934))

(declare-fun m!343339 () Bool)

(assert (=> b!223931 m!343339))

(declare-fun m!343341 () Bool)

(assert (=> b!223934 m!343341))

(declare-fun m!343343 () Bool)

(assert (=> start!46692 m!343343))

(declare-fun m!343345 () Bool)

(assert (=> start!46692 m!343345))

(declare-fun m!343347 () Bool)

(assert (=> b!223933 m!343347))

(declare-fun m!343349 () Bool)

(assert (=> b!223933 m!343349))

(declare-fun m!343351 () Bool)

(assert (=> b!223933 m!343351))

(declare-fun m!343353 () Bool)

(assert (=> b!223933 m!343353))

(declare-fun m!343355 () Bool)

(assert (=> b!223933 m!343355))

(declare-fun m!343357 () Bool)

(assert (=> b!223933 m!343357))

(declare-fun m!343359 () Bool)

(assert (=> b!223933 m!343359))

(declare-fun m!343361 () Bool)

(assert (=> b!223933 m!343361))

(declare-fun m!343363 () Bool)

(assert (=> b!223933 m!343363))

(declare-fun m!343365 () Bool)

(assert (=> b!223933 m!343365))

(push 1)

(assert (not b!223931))

(assert (not b!223933))

(assert (not start!46692))

(assert (not b!223934))

(check-sat)

(pop 1)

