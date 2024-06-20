; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47726 () Bool)

(assert start!47726)

(declare-fun b!227164 () Bool)

(declare-fun res!190589 () Bool)

(declare-fun e!155398 () Bool)

(assert (=> b!227164 (=> (not res!190589) (not e!155398))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227164 (= res!190589 (bvslt i!761 to!496))))

(declare-fun b!227165 () Bool)

(assert (=> b!227165 (= e!155398 (not (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((array!11393 0))(
  ( (array!11394 (arr!5971 (Array (_ BitVec 32) (_ BitVec 8))) (size!4996 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11393)

(declare-fun lt!362879 () array!11393)

(declare-fun arrayRangesEq!832 (array!11393 array!11393 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227165 (arrayRangesEq!832 arr!308 lt!362879 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((BitStream!9088 0))(
  ( (BitStream!9089 (buf!5537 array!11393) (currentByte!10375 (_ BitVec 32)) (currentBit!10370 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19514 0))(
  ( (tuple2!19515 (_1!10586 (_ BitVec 8)) (_2!10586 BitStream!9088)) )
))
(declare-fun lt!362883 () tuple2!19514)

(declare-datatypes ((Unit!16935 0))(
  ( (Unit!16936) )
))
(declare-fun lt!362886 () Unit!16935)

(declare-fun arrayUpdatedAtPrefixLemma!391 (array!11393 (_ BitVec 32) (_ BitVec 8)) Unit!16935)

(assert (=> b!227165 (= lt!362886 (arrayUpdatedAtPrefixLemma!391 arr!308 i!761 (_1!10586 lt!362883)))))

(declare-fun lt!362884 () (_ BitVec 32))

(declare-fun lt!362880 () (_ BitVec 64))

(declare-fun lt!362885 () (_ BitVec 64))

(declare-fun lt!362878 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9088)

(declare-datatypes ((tuple3!1374 0))(
  ( (tuple3!1375 (_1!10587 Unit!16935) (_2!10587 BitStream!9088) (_3!829 array!11393)) )
))
(declare-fun lt!362882 () tuple3!1374)

(assert (=> b!227165 (and (= (bvadd lt!362878 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362884))) lt!362880) (= (bvadd lt!362885 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362880) (= (buf!5537 thiss!1870) (buf!5537 (_2!10587 lt!362882))) (= (size!4996 arr!308) (size!4996 (_3!829 lt!362882))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227165 (= lt!362880 (bitIndex!0 (size!4996 (buf!5537 (_2!10587 lt!362882))) (currentByte!10375 (_2!10587 lt!362882)) (currentBit!10370 (_2!10587 lt!362882))))))

(assert (=> b!227165 (= lt!362878 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362885))))

(assert (=> b!227165 (= lt!362878 (bitIndex!0 (size!4996 (buf!5537 (_2!10586 lt!362883))) (currentByte!10375 (_2!10586 lt!362883)) (currentBit!10370 (_2!10586 lt!362883))))))

(assert (=> b!227165 (= lt!362885 (bitIndex!0 (size!4996 (buf!5537 thiss!1870)) (currentByte!10375 thiss!1870) (currentBit!10370 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9088 array!11393 (_ BitVec 32) (_ BitVec 32)) tuple3!1374)

(assert (=> b!227165 (= lt!362882 (readByteArrayLoop!0 (_2!10586 lt!362883) lt!362879 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227165 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4996 (buf!5537 (_2!10586 lt!362883)))) ((_ sign_extend 32) (currentByte!10375 (_2!10586 lt!362883))) ((_ sign_extend 32) (currentBit!10370 (_2!10586 lt!362883))) lt!362884)))

(assert (=> b!227165 (= lt!362884 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362881 () Unit!16935)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9088 BitStream!9088 (_ BitVec 64) (_ BitVec 32)) Unit!16935)

(assert (=> b!227165 (= lt!362881 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10586 lt!362883) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227165 (= lt!362879 (array!11394 (store (arr!5971 arr!308) i!761 (_1!10586 lt!362883)) (size!4996 arr!308)))))

(declare-fun readByte!0 (BitStream!9088) tuple2!19514)

(assert (=> b!227165 (= lt!362883 (readByte!0 thiss!1870))))

(declare-fun b!227166 () Bool)

(declare-fun e!155395 () Bool)

(declare-fun array_inv!4737 (array!11393) Bool)

(assert (=> b!227166 (= e!155395 (array_inv!4737 (buf!5537 thiss!1870)))))

(declare-fun b!227163 () Bool)

(declare-fun res!190590 () Bool)

(assert (=> b!227163 (=> (not res!190590) (not e!155398))))

(assert (=> b!227163 (= res!190590 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4996 (buf!5537 thiss!1870))) ((_ sign_extend 32) (currentByte!10375 thiss!1870)) ((_ sign_extend 32) (currentBit!10370 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190591 () Bool)

(assert (=> start!47726 (=> (not res!190591) (not e!155398))))

(assert (=> start!47726 (= res!190591 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4996 arr!308))))))

(assert (=> start!47726 e!155398))

(assert (=> start!47726 true))

(assert (=> start!47726 (array_inv!4737 arr!308)))

(declare-fun inv!12 (BitStream!9088) Bool)

(assert (=> start!47726 (and (inv!12 thiss!1870) e!155395)))

(assert (= (and start!47726 res!190591) b!227163))

(assert (= (and b!227163 res!190590) b!227164))

(assert (= (and b!227164 res!190589) b!227165))

(assert (= start!47726 b!227166))

(declare-fun m!349219 () Bool)

(assert (=> b!227165 m!349219))

(declare-fun m!349221 () Bool)

(assert (=> b!227165 m!349221))

(declare-fun m!349223 () Bool)

(assert (=> b!227165 m!349223))

(declare-fun m!349225 () Bool)

(assert (=> b!227165 m!349225))

(declare-fun m!349227 () Bool)

(assert (=> b!227165 m!349227))

(declare-fun m!349229 () Bool)

(assert (=> b!227165 m!349229))

(declare-fun m!349231 () Bool)

(assert (=> b!227165 m!349231))

(declare-fun m!349233 () Bool)

(assert (=> b!227165 m!349233))

(declare-fun m!349235 () Bool)

(assert (=> b!227165 m!349235))

(declare-fun m!349237 () Bool)

(assert (=> b!227165 m!349237))

(declare-fun m!349239 () Bool)

(assert (=> b!227166 m!349239))

(declare-fun m!349241 () Bool)

(assert (=> b!227163 m!349241))

(declare-fun m!349243 () Bool)

(assert (=> start!47726 m!349243))

(declare-fun m!349245 () Bool)

(assert (=> start!47726 m!349245))

(push 1)

(assert (not b!227165))

(assert (not b!227166))

(assert (not start!47726))

(assert (not b!227163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

