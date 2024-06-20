; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47502 () Bool)

(assert start!47502)

(declare-fun b!226400 () Bool)

(declare-fun e!154759 () Bool)

(declare-fun lt!360272 () (_ BitVec 64))

(assert (=> b!226400 (= e!154759 (not (or (= lt!360272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!360272) lt!360272)))))))

(declare-fun lt!360274 () (_ BitVec 32))

(assert (=> b!226400 (= lt!360272 ((_ sign_extend 32) lt!360274))))

(declare-datatypes ((array!11325 0))(
  ( (array!11326 (arr!5931 (Array (_ BitVec 32) (_ BitVec 8))) (size!4968 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9032 0))(
  ( (BitStream!9033 (buf!5509 array!11325) (currentByte!10323 (_ BitVec 32)) (currentBit!10318 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19410 0))(
  ( (tuple2!19411 (_1!10506 (_ BitVec 8)) (_2!10506 BitStream!9032)) )
))
(declare-fun lt!360275 () tuple2!19410)

(declare-fun thiss!1870 () BitStream!9032)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226400 (= (bitIndex!0 (size!4968 (buf!5509 (_2!10506 lt!360275))) (currentByte!10323 (_2!10506 lt!360275)) (currentBit!10318 (_2!10506 lt!360275))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4968 (buf!5509 thiss!1870)) (currentByte!10323 thiss!1870) (currentBit!10318 thiss!1870))))))

(declare-fun arr!308 () array!11325)

(declare-datatypes ((Unit!16747 0))(
  ( (Unit!16748) )
))
(declare-datatypes ((tuple3!1318 0))(
  ( (tuple3!1319 (_1!10507 Unit!16747) (_2!10507 BitStream!9032) (_3!801 array!11325)) )
))
(declare-fun lt!360273 () tuple3!1318)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!9032 array!11325 (_ BitVec 32) (_ BitVec 32)) tuple3!1318)

(assert (=> b!226400 (= lt!360273 (readByteArrayLoop!0 (_2!10506 lt!360275) (array!11326 (store (arr!5931 arr!308) i!761 (_1!10506 lt!360275)) (size!4968 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226400 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4968 (buf!5509 (_2!10506 lt!360275)))) ((_ sign_extend 32) (currentByte!10323 (_2!10506 lt!360275))) ((_ sign_extend 32) (currentBit!10318 (_2!10506 lt!360275))) lt!360274)))

(assert (=> b!226400 (= lt!360274 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360276 () Unit!16747)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9032 BitStream!9032 (_ BitVec 64) (_ BitVec 32)) Unit!16747)

(assert (=> b!226400 (= lt!360276 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10506 lt!360275) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9032) tuple2!19410)

(assert (=> b!226400 (= lt!360275 (readByte!0 thiss!1870))))

(declare-fun b!226399 () Bool)

(declare-fun res!189970 () Bool)

(assert (=> b!226399 (=> (not res!189970) (not e!154759))))

(assert (=> b!226399 (= res!189970 (bvslt i!761 to!496))))

(declare-fun b!226401 () Bool)

(declare-fun e!154760 () Bool)

(declare-fun array_inv!4709 (array!11325) Bool)

(assert (=> b!226401 (= e!154760 (array_inv!4709 (buf!5509 thiss!1870)))))

(declare-fun b!226398 () Bool)

(declare-fun res!189969 () Bool)

(assert (=> b!226398 (=> (not res!189969) (not e!154759))))

(assert (=> b!226398 (= res!189969 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4968 (buf!5509 thiss!1870))) ((_ sign_extend 32) (currentByte!10323 thiss!1870)) ((_ sign_extend 32) (currentBit!10318 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189968 () Bool)

(assert (=> start!47502 (=> (not res!189968) (not e!154759))))

(assert (=> start!47502 (= res!189968 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4968 arr!308))))))

(assert (=> start!47502 e!154759))

(assert (=> start!47502 true))

(assert (=> start!47502 (array_inv!4709 arr!308)))

(declare-fun inv!12 (BitStream!9032) Bool)

(assert (=> start!47502 (and (inv!12 thiss!1870) e!154760)))

(assert (= (and start!47502 res!189968) b!226398))

(assert (= (and b!226398 res!189969) b!226399))

(assert (= (and b!226399 res!189970) b!226400))

(assert (= start!47502 b!226401))

(declare-fun m!347763 () Bool)

(assert (=> b!226400 m!347763))

(declare-fun m!347765 () Bool)

(assert (=> b!226400 m!347765))

(declare-fun m!347767 () Bool)

(assert (=> b!226400 m!347767))

(declare-fun m!347769 () Bool)

(assert (=> b!226400 m!347769))

(declare-fun m!347771 () Bool)

(assert (=> b!226400 m!347771))

(declare-fun m!347773 () Bool)

(assert (=> b!226400 m!347773))

(declare-fun m!347775 () Bool)

(assert (=> b!226400 m!347775))

(declare-fun m!347777 () Bool)

(assert (=> b!226401 m!347777))

(declare-fun m!347779 () Bool)

(assert (=> b!226398 m!347779))

(declare-fun m!347781 () Bool)

(assert (=> start!47502 m!347781))

(declare-fun m!347783 () Bool)

(assert (=> start!47502 m!347783))

(push 1)

(assert (not b!226401))

(assert (not start!47502))

(assert (not b!226400))

(assert (not b!226398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

