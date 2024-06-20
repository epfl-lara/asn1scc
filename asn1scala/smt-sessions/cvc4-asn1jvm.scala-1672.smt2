; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46686 () Bool)

(assert start!46686)

(declare-fun b!223897 () Bool)

(declare-fun e!152438 () Bool)

(assert (=> b!223897 (= e!152438 (not true))))

(declare-datatypes ((array!11002 0))(
  ( (array!11003 (arr!5772 (Array (_ BitVec 32) (_ BitVec 8))) (size!4824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8750 0))(
  ( (BitStream!8751 (buf!5368 array!11002) (currentByte!10096 (_ BitVec 32)) (currentBit!10091 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16317 0))(
  ( (Unit!16318) )
))
(declare-datatypes ((tuple3!1174 0))(
  ( (tuple3!1175 (_1!10297 Unit!16317) (_2!10297 BitStream!8750) (_3!729 array!11002)) )
))
(declare-fun lt!354980 () tuple3!1174)

(declare-fun thiss!1870 () BitStream!8750)

(declare-fun lt!354978 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!354981 () (_ BitVec 64))

(declare-fun lt!354975 () (_ BitVec 64))

(declare-fun lt!354979 () (_ BitVec 64))

(declare-fun arr!308 () array!11002)

(assert (=> b!223897 (and (= (bvadd lt!354981 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!354978))) lt!354979) (= (bvadd lt!354975 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!354979) (= (buf!5368 thiss!1870) (buf!5368 (_2!10297 lt!354980))) (= (size!4824 arr!308) (size!4824 (_3!729 lt!354980))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223897 (= lt!354979 (bitIndex!0 (size!4824 (buf!5368 (_2!10297 lt!354980))) (currentByte!10096 (_2!10297 lt!354980)) (currentBit!10091 (_2!10297 lt!354980))))))

(assert (=> b!223897 (= lt!354981 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!354975))))

(declare-datatypes ((tuple2!19136 0))(
  ( (tuple2!19137 (_1!10298 (_ BitVec 8)) (_2!10298 BitStream!8750)) )
))
(declare-fun lt!354977 () tuple2!19136)

(assert (=> b!223897 (= lt!354981 (bitIndex!0 (size!4824 (buf!5368 (_2!10298 lt!354977))) (currentByte!10096 (_2!10298 lt!354977)) (currentBit!10091 (_2!10298 lt!354977))))))

(assert (=> b!223897 (= lt!354975 (bitIndex!0 (size!4824 (buf!5368 thiss!1870)) (currentByte!10096 thiss!1870) (currentBit!10091 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8750 array!11002 (_ BitVec 32) (_ BitVec 32)) tuple3!1174)

(assert (=> b!223897 (= lt!354980 (readByteArrayLoop!0 (_2!10298 lt!354977) (array!11003 (store (arr!5772 arr!308) i!761 (_1!10298 lt!354977)) (size!4824 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223897 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4824 (buf!5368 (_2!10298 lt!354977)))) ((_ sign_extend 32) (currentByte!10096 (_2!10298 lt!354977))) ((_ sign_extend 32) (currentBit!10091 (_2!10298 lt!354977))) lt!354978)))

(assert (=> b!223897 (= lt!354978 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!354976 () Unit!16317)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8750 BitStream!8750 (_ BitVec 64) (_ BitVec 32)) Unit!16317)

(assert (=> b!223897 (= lt!354976 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10298 lt!354977) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8750) tuple2!19136)

(assert (=> b!223897 (= lt!354977 (readByte!0 thiss!1870))))

(declare-fun b!223895 () Bool)

(declare-fun res!187956 () Bool)

(assert (=> b!223895 (=> (not res!187956) (not e!152438))))

(assert (=> b!223895 (= res!187956 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4824 (buf!5368 thiss!1870))) ((_ sign_extend 32) (currentByte!10096 thiss!1870)) ((_ sign_extend 32) (currentBit!10091 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223896 () Bool)

(declare-fun res!187954 () Bool)

(assert (=> b!223896 (=> (not res!187954) (not e!152438))))

(assert (=> b!223896 (= res!187954 (bvslt i!761 to!496))))

(declare-fun b!223898 () Bool)

(declare-fun e!152437 () Bool)

(declare-fun array_inv!4565 (array!11002) Bool)

(assert (=> b!223898 (= e!152437 (array_inv!4565 (buf!5368 thiss!1870)))))

(declare-fun res!187955 () Bool)

(assert (=> start!46686 (=> (not res!187955) (not e!152438))))

(assert (=> start!46686 (= res!187955 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4824 arr!308))))))

(assert (=> start!46686 e!152438))

(assert (=> start!46686 true))

(assert (=> start!46686 (array_inv!4565 arr!308)))

(declare-fun inv!12 (BitStream!8750) Bool)

(assert (=> start!46686 (and (inv!12 thiss!1870) e!152437)))

(assert (= (and start!46686 res!187955) b!223895))

(assert (= (and b!223895 res!187956) b!223896))

(assert (= (and b!223896 res!187954) b!223897))

(assert (= start!46686 b!223898))

(declare-fun m!343259 () Bool)

(assert (=> b!223897 m!343259))

(declare-fun m!343261 () Bool)

(assert (=> b!223897 m!343261))

(declare-fun m!343263 () Bool)

(assert (=> b!223897 m!343263))

(declare-fun m!343265 () Bool)

(assert (=> b!223897 m!343265))

(declare-fun m!343267 () Bool)

(assert (=> b!223897 m!343267))

(declare-fun m!343269 () Bool)

(assert (=> b!223897 m!343269))

(declare-fun m!343271 () Bool)

(assert (=> b!223897 m!343271))

(declare-fun m!343273 () Bool)

(assert (=> b!223897 m!343273))

(declare-fun m!343275 () Bool)

(assert (=> b!223895 m!343275))

(declare-fun m!343277 () Bool)

(assert (=> b!223898 m!343277))

(declare-fun m!343279 () Bool)

(assert (=> start!46686 m!343279))

(declare-fun m!343281 () Bool)

(assert (=> start!46686 m!343281))

(push 1)

