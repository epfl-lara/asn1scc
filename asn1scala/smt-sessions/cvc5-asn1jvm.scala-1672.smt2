; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46682 () Bool)

(assert start!46682)

(declare-fun res!187937 () Bool)

(declare-fun e!152411 () Bool)

(assert (=> start!46682 (=> (not res!187937) (not e!152411))))

(declare-datatypes ((array!10998 0))(
  ( (array!10999 (arr!5770 (Array (_ BitVec 32) (_ BitVec 8))) (size!4822 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10998)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46682 (= res!187937 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4822 arr!308))))))

(assert (=> start!46682 e!152411))

(assert (=> start!46682 true))

(declare-fun array_inv!4563 (array!10998) Bool)

(assert (=> start!46682 (array_inv!4563 arr!308)))

(declare-datatypes ((BitStream!8746 0))(
  ( (BitStream!8747 (buf!5366 array!10998) (currentByte!10094 (_ BitVec 32)) (currentBit!10089 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8746)

(declare-fun e!152414 () Bool)

(declare-fun inv!12 (BitStream!8746) Bool)

(assert (=> start!46682 (and (inv!12 thiss!1870) e!152414)))

(declare-fun b!223871 () Bool)

(declare-fun res!187936 () Bool)

(assert (=> b!223871 (=> (not res!187936) (not e!152411))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223871 (= res!187936 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4822 (buf!5366 thiss!1870))) ((_ sign_extend 32) (currentByte!10094 thiss!1870)) ((_ sign_extend 32) (currentBit!10089 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223873 () Bool)

(assert (=> b!223873 (= e!152411 (not true))))

(declare-fun lt!354939 () (_ BitVec 32))

(declare-fun lt!354933 () (_ BitVec 64))

(declare-datatypes ((Unit!16313 0))(
  ( (Unit!16314) )
))
(declare-datatypes ((tuple3!1170 0))(
  ( (tuple3!1171 (_1!10293 Unit!16313) (_2!10293 BitStream!8746) (_3!727 array!10998)) )
))
(declare-fun lt!354937 () tuple3!1170)

(declare-fun lt!354938 () (_ BitVec 64))

(declare-fun lt!354935 () (_ BitVec 64))

(assert (=> b!223873 (and (= (bvadd lt!354938 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!354939))) lt!354933) (= (bvadd lt!354935 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!354933) (= (buf!5366 thiss!1870) (buf!5366 (_2!10293 lt!354937))) (= (size!4822 arr!308) (size!4822 (_3!727 lt!354937))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223873 (= lt!354933 (bitIndex!0 (size!4822 (buf!5366 (_2!10293 lt!354937))) (currentByte!10094 (_2!10293 lt!354937)) (currentBit!10089 (_2!10293 lt!354937))))))

(assert (=> b!223873 (= lt!354938 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!354935))))

(declare-datatypes ((tuple2!19132 0))(
  ( (tuple2!19133 (_1!10294 (_ BitVec 8)) (_2!10294 BitStream!8746)) )
))
(declare-fun lt!354934 () tuple2!19132)

(assert (=> b!223873 (= lt!354938 (bitIndex!0 (size!4822 (buf!5366 (_2!10294 lt!354934))) (currentByte!10094 (_2!10294 lt!354934)) (currentBit!10089 (_2!10294 lt!354934))))))

(assert (=> b!223873 (= lt!354935 (bitIndex!0 (size!4822 (buf!5366 thiss!1870)) (currentByte!10094 thiss!1870) (currentBit!10089 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8746 array!10998 (_ BitVec 32) (_ BitVec 32)) tuple3!1170)

(assert (=> b!223873 (= lt!354937 (readByteArrayLoop!0 (_2!10294 lt!354934) (array!10999 (store (arr!5770 arr!308) i!761 (_1!10294 lt!354934)) (size!4822 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223873 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4822 (buf!5366 (_2!10294 lt!354934)))) ((_ sign_extend 32) (currentByte!10094 (_2!10294 lt!354934))) ((_ sign_extend 32) (currentBit!10089 (_2!10294 lt!354934))) lt!354939)))

(assert (=> b!223873 (= lt!354939 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!354936 () Unit!16313)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8746 BitStream!8746 (_ BitVec 64) (_ BitVec 32)) Unit!16313)

(assert (=> b!223873 (= lt!354936 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10294 lt!354934) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8746) tuple2!19132)

(assert (=> b!223873 (= lt!354934 (readByte!0 thiss!1870))))

(declare-fun b!223874 () Bool)

(assert (=> b!223874 (= e!152414 (array_inv!4563 (buf!5366 thiss!1870)))))

(declare-fun b!223872 () Bool)

(declare-fun res!187938 () Bool)

(assert (=> b!223872 (=> (not res!187938) (not e!152411))))

(assert (=> b!223872 (= res!187938 (bvslt i!761 to!496))))

(assert (= (and start!46682 res!187937) b!223871))

(assert (= (and b!223871 res!187936) b!223872))

(assert (= (and b!223872 res!187938) b!223873))

(assert (= start!46682 b!223874))

(declare-fun m!343211 () Bool)

(assert (=> start!46682 m!343211))

(declare-fun m!343213 () Bool)

(assert (=> start!46682 m!343213))

(declare-fun m!343215 () Bool)

(assert (=> b!223871 m!343215))

(declare-fun m!343217 () Bool)

(assert (=> b!223873 m!343217))

(declare-fun m!343219 () Bool)

(assert (=> b!223873 m!343219))

(declare-fun m!343221 () Bool)

(assert (=> b!223873 m!343221))

(declare-fun m!343223 () Bool)

(assert (=> b!223873 m!343223))

(declare-fun m!343225 () Bool)

(assert (=> b!223873 m!343225))

(declare-fun m!343227 () Bool)

(assert (=> b!223873 m!343227))

(declare-fun m!343229 () Bool)

(assert (=> b!223873 m!343229))

(declare-fun m!343231 () Bool)

(assert (=> b!223873 m!343231))

(declare-fun m!343233 () Bool)

(assert (=> b!223874 m!343233))

(push 1)

(assert (not start!46682))

(assert (not b!223873))

(assert (not b!223874))

(assert (not b!223871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

