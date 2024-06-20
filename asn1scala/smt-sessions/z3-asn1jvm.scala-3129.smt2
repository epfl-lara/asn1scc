; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71974 () Bool)

(assert start!71974)

(declare-fun res!264943 () Bool)

(declare-fun e!232553 () Bool)

(assert (=> start!71974 (=> (not res!264943) (not e!232553))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71974 (= res!264943 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71974 e!232553))

(assert (=> start!71974 true))

(declare-datatypes ((array!20595 0))(
  ( (array!20596 (arr!10055 (Array (_ BitVec 32) (_ BitVec 8))) (size!8963 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14088 0))(
  ( (BitStream!14089 (buf!8105 array!20595) (currentByte!14961 (_ BitVec 32)) (currentBit!14956 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14088)

(declare-fun e!232556 () Bool)

(declare-fun inv!12 (BitStream!14088) Bool)

(assert (=> start!71974 (and (inv!12 thiss!1793) e!232556)))

(declare-fun b!322750 () Bool)

(declare-fun res!264941 () Bool)

(declare-fun e!232554 () Bool)

(assert (=> b!322750 (=> (not res!264941) (not e!232554))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322750 (= res!264941 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322751 () Bool)

(declare-fun res!264942 () Bool)

(declare-fun e!232555 () Bool)

(assert (=> b!322751 (=> (not res!264942) (not e!232555))))

(declare-datatypes ((tuple2!23610 0))(
  ( (tuple2!23611 (_1!13434 (_ BitVec 64)) (_2!13434 BitStream!14088)) )
))
(declare-fun lt!445511 () tuple2!23610)

(declare-fun lt!445510 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322751 (= res!264942 (= (bitIndex!0 (size!8963 (buf!8105 (_2!13434 lt!445511))) (currentByte!14961 (_2!13434 lt!445511)) (currentBit!14956 (_2!13434 lt!445511))) (bvadd (bitIndex!0 (size!8963 (buf!8105 thiss!1793)) (currentByte!14961 thiss!1793) (currentBit!14956 thiss!1793)) lt!445510)))))

(declare-fun b!322752 () Bool)

(declare-fun res!264945 () Bool)

(assert (=> b!322752 (=> (not res!264945) (not e!232554))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322752 (= res!264945 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322753 () Bool)

(assert (=> b!322753 (= e!232554 e!232555)))

(declare-fun res!264946 () Bool)

(assert (=> b!322753 (=> (not res!264946) (not e!232555))))

(assert (=> b!322753 (= res!264946 (= (buf!8105 (_2!13434 lt!445511)) (buf!8105 thiss!1793)))))

(declare-datatypes ((tuple2!23612 0))(
  ( (tuple2!23613 (_1!13435 Bool) (_2!13435 BitStream!14088)) )
))
(declare-fun lt!445509 () tuple2!23612)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23610)

(assert (=> b!322753 (= lt!445511 (readNBitsLSBFirstsLoop!0 (_2!13435 lt!445509) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13435 lt!445509) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14088) tuple2!23612)

(assert (=> b!322753 (= lt!445509 (readBit!0 thiss!1793))))

(declare-fun b!322754 () Bool)

(assert (=> b!322754 (= e!232553 e!232554)))

(declare-fun res!264944 () Bool)

(assert (=> b!322754 (=> (not res!264944) (not e!232554))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322754 (= res!264944 (validate_offset_bits!1 ((_ sign_extend 32) (size!8963 (buf!8105 thiss!1793))) ((_ sign_extend 32) (currentByte!14961 thiss!1793)) ((_ sign_extend 32) (currentBit!14956 thiss!1793)) lt!445510))))

(assert (=> b!322754 (= lt!445510 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322755 () Bool)

(declare-fun array_inv!8515 (array!20595) Bool)

(assert (=> b!322755 (= e!232556 (array_inv!8515 (buf!8105 thiss!1793)))))

(declare-fun b!322756 () Bool)

(assert (=> b!322756 (= e!232555 (bvsgt i!743 #b00000000000000000000000001000000))))

(assert (= (and start!71974 res!264943) b!322754))

(assert (= (and b!322754 res!264944) b!322752))

(assert (= (and b!322752 res!264945) b!322750))

(assert (= (and b!322750 res!264941) b!322753))

(assert (= (and b!322753 res!264946) b!322751))

(assert (= (and b!322751 res!264942) b!322756))

(assert (= start!71974 b!322755))

(declare-fun m!461011 () Bool)

(assert (=> start!71974 m!461011))

(declare-fun m!461013 () Bool)

(assert (=> b!322751 m!461013))

(declare-fun m!461015 () Bool)

(assert (=> b!322751 m!461015))

(declare-fun m!461017 () Bool)

(assert (=> b!322754 m!461017))

(declare-fun m!461019 () Bool)

(assert (=> b!322755 m!461019))

(declare-fun m!461021 () Bool)

(assert (=> b!322752 m!461021))

(declare-fun m!461023 () Bool)

(assert (=> b!322753 m!461023))

(declare-fun m!461025 () Bool)

(assert (=> b!322753 m!461025))

(check-sat (not b!322754) (not b!322752) (not b!322753) (not b!322755) (not b!322751) (not start!71974))
(check-sat)
