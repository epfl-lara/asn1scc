; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47384 () Bool)

(assert start!47384)

(declare-fun b!226009 () Bool)

(declare-fun res!189659 () Bool)

(declare-fun e!154427 () Bool)

(assert (=> b!226009 (=> (not res!189659) (not e!154427))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226009 (= res!189659 (bvslt i!761 to!496))))

(declare-fun res!189660 () Bool)

(assert (=> start!47384 (=> (not res!189660) (not e!154427))))

(declare-datatypes ((array!11285 0))(
  ( (array!11286 (arr!5908 (Array (_ BitVec 32) (_ BitVec 8))) (size!4951 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11285)

(assert (=> start!47384 (= res!189660 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4951 arr!308))))))

(assert (=> start!47384 e!154427))

(assert (=> start!47384 true))

(declare-fun array_inv!4692 (array!11285) Bool)

(assert (=> start!47384 (array_inv!4692 arr!308)))

(declare-datatypes ((BitStream!8998 0))(
  ( (BitStream!8999 (buf!5492 array!11285) (currentByte!10294 (_ BitVec 32)) (currentBit!10289 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8998)

(declare-fun e!154426 () Bool)

(declare-fun inv!12 (BitStream!8998) Bool)

(assert (=> start!47384 (and (inv!12 thiss!1870) e!154426)))

(declare-fun b!226008 () Bool)

(declare-fun res!189661 () Bool)

(assert (=> b!226008 (=> (not res!189661) (not e!154427))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226008 (= res!189661 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4951 (buf!5492 thiss!1870))) ((_ sign_extend 32) (currentByte!10294 thiss!1870)) ((_ sign_extend 32) (currentBit!10289 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226010 () Bool)

(assert (=> b!226010 (= e!154427 (not (bvslt (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) (bvsub to!496 i!761))))))

(declare-datatypes ((tuple2!19352 0))(
  ( (tuple2!19353 (_1!10463 (_ BitVec 8)) (_2!10463 BitStream!8998)) )
))
(declare-fun lt!359121 () tuple2!19352)

(assert (=> b!226010 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4951 (buf!5492 (_2!10463 lt!359121)))) ((_ sign_extend 32) (currentByte!10294 (_2!10463 lt!359121))) ((_ sign_extend 32) (currentBit!10289 (_2!10463 lt!359121))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16647 0))(
  ( (Unit!16648) )
))
(declare-fun lt!359120 () Unit!16647)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8998 BitStream!8998 (_ BitVec 64) (_ BitVec 32)) Unit!16647)

(assert (=> b!226010 (= lt!359120 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10463 lt!359121) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8998) tuple2!19352)

(assert (=> b!226010 (= lt!359121 (readByte!0 thiss!1870))))

(declare-fun b!226011 () Bool)

(assert (=> b!226011 (= e!154426 (array_inv!4692 (buf!5492 thiss!1870)))))

(assert (= (and start!47384 res!189660) b!226008))

(assert (= (and b!226008 res!189661) b!226009))

(assert (= (and b!226009 res!189659) b!226010))

(assert (= start!47384 b!226011))

(declare-fun m!347047 () Bool)

(assert (=> start!47384 m!347047))

(declare-fun m!347049 () Bool)

(assert (=> start!47384 m!347049))

(declare-fun m!347051 () Bool)

(assert (=> b!226008 m!347051))

(declare-fun m!347053 () Bool)

(assert (=> b!226010 m!347053))

(declare-fun m!347055 () Bool)

(assert (=> b!226010 m!347055))

(declare-fun m!347057 () Bool)

(assert (=> b!226010 m!347057))

(declare-fun m!347059 () Bool)

(assert (=> b!226011 m!347059))

(push 1)

(assert (not start!47384))

(assert (not b!226011))

(assert (not b!226010))

(assert (not b!226008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

