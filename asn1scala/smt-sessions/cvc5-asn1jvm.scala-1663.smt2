; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46268 () Bool)

(assert start!46268)

(declare-fun res!187073 () Bool)

(declare-fun e!151571 () Bool)

(assert (=> start!46268 (=> (not res!187073) (not e!151571))))

(declare-datatypes ((array!10926 0))(
  ( (array!10927 (arr!5725 (Array (_ BitVec 32) (_ BitVec 8))) (size!4795 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10926)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46268 (= res!187073 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4795 arr!308))))))

(assert (=> start!46268 e!151571))

(assert (=> start!46268 true))

(declare-fun array_inv!4536 (array!10926) Bool)

(assert (=> start!46268 (array_inv!4536 arr!308)))

(declare-datatypes ((BitStream!8692 0))(
  ( (BitStream!8693 (buf!5339 array!10926) (currentByte!10009 (_ BitVec 32)) (currentBit!10004 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8692)

(declare-fun e!151570 () Bool)

(declare-fun inv!12 (BitStream!8692) Bool)

(assert (=> start!46268 (and (inv!12 thiss!1870) e!151570)))

(declare-fun b!222826 () Bool)

(declare-fun res!187071 () Bool)

(assert (=> b!222826 (=> (not res!187071) (not e!151571))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222826 (= res!187071 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4795 (buf!5339 thiss!1870))) ((_ sign_extend 32) (currentByte!10009 thiss!1870)) ((_ sign_extend 32) (currentBit!10004 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222827 () Bool)

(assert (=> b!222827 (= e!151570 (array_inv!4536 (buf!5339 thiss!1870)))))

(declare-fun b!222828 () Bool)

(declare-fun res!187074 () Bool)

(declare-fun e!151569 () Bool)

(assert (=> b!222828 (=> (not res!187074) (not e!151569))))

(declare-datatypes ((tuple2!19010 0))(
  ( (tuple2!19011 (_1!10214 (_ BitVec 8)) (_2!10214 BitStream!8692)) )
))
(declare-fun lt!351445 () tuple2!19010)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222828 (= res!187074 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4795 (buf!5339 (_2!10214 lt!351445))) (currentByte!10009 (_2!10214 lt!351445)) (currentBit!10004 (_2!10214 lt!351445)))))))

(declare-fun b!222829 () Bool)

(assert (=> b!222829 (= e!151569 false)))

(declare-fun lt!351446 () (_ BitVec 64))

(assert (=> b!222829 (= lt!351446 (bitIndex!0 (size!4795 (buf!5339 thiss!1870)) (currentByte!10009 thiss!1870) (currentBit!10004 thiss!1870)))))

(declare-fun b!222830 () Bool)

(declare-fun res!187072 () Bool)

(assert (=> b!222830 (=> (not res!187072) (not e!151571))))

(assert (=> b!222830 (= res!187072 (bvslt i!761 to!496))))

(declare-fun b!222831 () Bool)

(assert (=> b!222831 (= e!151571 e!151569)))

(declare-fun res!187070 () Bool)

(assert (=> b!222831 (=> (not res!187070) (not e!151569))))

(assert (=> b!222831 (= res!187070 (= (size!4795 (buf!5339 thiss!1870)) (size!4795 (buf!5339 (_2!10214 lt!351445)))))))

(declare-fun readByte!0 (BitStream!8692) tuple2!19010)

(assert (=> b!222831 (= lt!351445 (readByte!0 thiss!1870))))

(assert (= (and start!46268 res!187073) b!222826))

(assert (= (and b!222826 res!187071) b!222830))

(assert (= (and b!222830 res!187072) b!222831))

(assert (= (and b!222831 res!187070) b!222828))

(assert (= (and b!222828 res!187074) b!222829))

(assert (= start!46268 b!222827))

(declare-fun m!341077 () Bool)

(assert (=> b!222831 m!341077))

(declare-fun m!341079 () Bool)

(assert (=> b!222829 m!341079))

(declare-fun m!341081 () Bool)

(assert (=> b!222826 m!341081))

(declare-fun m!341083 () Bool)

(assert (=> b!222827 m!341083))

(declare-fun m!341085 () Bool)

(assert (=> start!46268 m!341085))

(declare-fun m!341087 () Bool)

(assert (=> start!46268 m!341087))

(declare-fun m!341089 () Bool)

(assert (=> b!222828 m!341089))

(push 1)

(assert (not start!46268))

(assert (not b!222826))

(assert (not b!222828))

(assert (not b!222831))

(assert (not b!222827))

(assert (not b!222829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

