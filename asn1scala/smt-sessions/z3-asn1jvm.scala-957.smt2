; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27070 () Bool)

(assert start!27070)

(declare-fun b!139253 () Bool)

(declare-fun e!92724 () Bool)

(declare-fun e!92725 () Bool)

(assert (=> b!139253 (= e!92724 (not e!92725))))

(declare-fun res!116081 () Bool)

(assert (=> b!139253 (=> res!116081 e!92725)))

(declare-fun lt!217159 () (_ BitVec 64))

(declare-fun lt!217158 () (_ BitVec 64))

(assert (=> b!139253 (= res!116081 (not (= lt!217159 (bvadd lt!217159 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217158)))))))

(declare-datatypes ((array!6335 0))(
  ( (array!6336 (arr!3562 (Array (_ BitVec 32) (_ BitVec 8))) (size!2867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4998 0))(
  ( (BitStream!4999 (buf!3283 array!6335) (currentByte!6113 (_ BitVec 32)) (currentBit!6108 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4998)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139253 (= lt!217159 (bitIndex!0 (size!2867 (buf!3283 thiss!1634)) (currentByte!6113 thiss!1634) (currentBit!6108 thiss!1634)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!139253 (= lt!217158 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4998 BitStream!4998) Bool)

(assert (=> b!139253 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8693 0))(
  ( (Unit!8694) )
))
(declare-fun lt!217156 () Unit!8693)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4998) Unit!8693)

(assert (=> b!139253 (= lt!217156 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!116082 () Bool)

(assert (=> start!27070 (=> (not res!116082) (not e!92724))))

(declare-fun arr!237 () array!6335)

(assert (=> start!27070 (= res!116082 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2867 arr!237))))))

(assert (=> start!27070 e!92724))

(assert (=> start!27070 true))

(declare-fun array_inv!2656 (array!6335) Bool)

(assert (=> start!27070 (array_inv!2656 arr!237)))

(declare-fun e!92726 () Bool)

(declare-fun inv!12 (BitStream!4998) Bool)

(assert (=> start!27070 (and (inv!12 thiss!1634) e!92726)))

(declare-fun b!139254 () Bool)

(declare-fun res!116079 () Bool)

(assert (=> b!139254 (=> (not res!116079) (not e!92724))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139254 (= res!116079 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2867 (buf!3283 thiss!1634))) ((_ sign_extend 32) (currentByte!6113 thiss!1634)) ((_ sign_extend 32) (currentBit!6108 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139255 () Bool)

(declare-datatypes ((tuple2!12186 0))(
  ( (tuple2!12187 (_1!6419 BitStream!4998) (_2!6419 BitStream!4998)) )
))
(declare-fun lt!217160 () tuple2!12186)

(declare-datatypes ((tuple2!12188 0))(
  ( (tuple2!12189 (_1!6420 BitStream!4998) (_2!6420 array!6335)) )
))
(declare-fun lt!217161 () tuple2!12188)

(assert (=> b!139255 (= e!92725 (or (not (= (size!2867 (_2!6420 lt!217161)) (size!2867 arr!237))) (not (= (_1!6420 lt!217161) (_2!6419 lt!217160))) (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4998 array!6335 (_ BitVec 32) (_ BitVec 32)) tuple2!12188)

(assert (=> b!139255 (= lt!217161 (readByteArrayLoopPure!0 (_1!6419 lt!217160) arr!237 from!447 to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139255 (validate_offset_bits!1 ((_ sign_extend 32) (size!2867 (buf!3283 thiss!1634))) ((_ sign_extend 32) (currentByte!6113 thiss!1634)) ((_ sign_extend 32) (currentBit!6108 thiss!1634)) lt!217158)))

(declare-fun lt!217157 () Unit!8693)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4998 array!6335 (_ BitVec 64)) Unit!8693)

(assert (=> b!139255 (= lt!217157 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3283 thiss!1634) lt!217158))))

(declare-fun reader!0 (BitStream!4998 BitStream!4998) tuple2!12186)

(assert (=> b!139255 (= lt!217160 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139256 () Bool)

(declare-fun res!116080 () Bool)

(assert (=> b!139256 (=> (not res!116080) (not e!92724))))

(assert (=> b!139256 (= res!116080 (bvsge from!447 to!404))))

(declare-fun b!139257 () Bool)

(assert (=> b!139257 (= e!92726 (array_inv!2656 (buf!3283 thiss!1634)))))

(assert (= (and start!27070 res!116082) b!139254))

(assert (= (and b!139254 res!116079) b!139256))

(assert (= (and b!139256 res!116080) b!139253))

(assert (= (and b!139253 (not res!116081)) b!139255))

(assert (= start!27070 b!139257))

(declare-fun m!214229 () Bool)

(assert (=> b!139253 m!214229))

(declare-fun m!214231 () Bool)

(assert (=> b!139253 m!214231))

(declare-fun m!214233 () Bool)

(assert (=> b!139253 m!214233))

(declare-fun m!214235 () Bool)

(assert (=> b!139255 m!214235))

(declare-fun m!214237 () Bool)

(assert (=> b!139255 m!214237))

(declare-fun m!214239 () Bool)

(assert (=> b!139255 m!214239))

(declare-fun m!214241 () Bool)

(assert (=> b!139255 m!214241))

(declare-fun m!214243 () Bool)

(assert (=> b!139254 m!214243))

(declare-fun m!214245 () Bool)

(assert (=> b!139257 m!214245))

(declare-fun m!214247 () Bool)

(assert (=> start!27070 m!214247))

(declare-fun m!214249 () Bool)

(assert (=> start!27070 m!214249))

(check-sat (not b!139255) (not start!27070) (not b!139253) (not b!139257) (not b!139254))
(check-sat)
