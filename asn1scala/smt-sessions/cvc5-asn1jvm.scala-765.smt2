; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21868 () Bool)

(assert start!21868)

(declare-fun b!110378 () Bool)

(declare-fun e!72381 () Bool)

(declare-fun e!72379 () Bool)

(assert (=> b!110378 (= e!72381 (not e!72379))))

(declare-fun res!91118 () Bool)

(assert (=> b!110378 (=> res!91118 e!72379)))

(declare-fun lt!167088 () (_ BitVec 64))

(declare-fun lt!167087 () (_ BitVec 64))

(assert (=> b!110378 (= res!91118 (not (= lt!167088 (bvadd lt!167088 lt!167087))))))

(declare-datatypes ((array!5048 0))(
  ( (array!5049 (arr!2889 (Array (_ BitVec 32) (_ BitVec 8))) (size!2296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4066 0))(
  ( (BitStream!4067 (buf!2690 array!5048) (currentByte!5244 (_ BitVec 32)) (currentBit!5239 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4066)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110378 (= lt!167088 (bitIndex!0 (size!2296 (buf!2690 thiss!1305)) (currentByte!5244 thiss!1305) (currentBit!5239 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4066 BitStream!4066) Bool)

(assert (=> b!110378 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6757 0))(
  ( (Unit!6758) )
))
(declare-fun lt!167089 () Unit!6757)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4066) Unit!6757)

(assert (=> b!110378 (= lt!167089 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!91117 () Bool)

(declare-fun e!72383 () Bool)

(assert (=> start!21868 (=> (not res!91117) (not e!72383))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21868 (= res!91117 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21868 e!72383))

(assert (=> start!21868 true))

(declare-fun e!72382 () Bool)

(declare-fun inv!12 (BitStream!4066) Bool)

(assert (=> start!21868 (and (inv!12 thiss!1305) e!72382)))

(declare-fun b!110379 () Bool)

(assert (=> b!110379 (= e!72383 e!72381)))

(declare-fun res!91119 () Bool)

(assert (=> b!110379 (=> (not res!91119) (not e!72381))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110379 (= res!91119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2296 (buf!2690 thiss!1305))) ((_ sign_extend 32) (currentByte!5244 thiss!1305)) ((_ sign_extend 32) (currentBit!5239 thiss!1305)) lt!167087))))

(assert (=> b!110379 (= lt!167087 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110380 () Bool)

(declare-fun res!91120 () Bool)

(assert (=> b!110380 (=> (not res!91120) (not e!72381))))

(assert (=> b!110380 (= res!91120 (bvsge i!615 nBits!396))))

(declare-fun b!110381 () Bool)

(declare-fun res!91116 () Bool)

(assert (=> b!110381 (=> (not res!91116) (not e!72381))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110381 (= res!91116 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110382 () Bool)

(declare-fun array_inv!2098 (array!5048) Bool)

(assert (=> b!110382 (= e!72382 (array_inv!2098 (buf!2690 thiss!1305)))))

(declare-fun b!110383 () Bool)

(assert (=> b!110383 (= e!72379 true)))

(declare-datatypes ((tuple2!9186 0))(
  ( (tuple2!9187 (_1!4850 BitStream!4066) (_2!4850 BitStream!4066)) )
))
(declare-fun lt!167090 () tuple2!9186)

(declare-fun reader!0 (BitStream!4066 BitStream!4066) tuple2!9186)

(assert (=> b!110383 (= lt!167090 (reader!0 thiss!1305 thiss!1305))))

(assert (= (and start!21868 res!91117) b!110379))

(assert (= (and b!110379 res!91119) b!110381))

(assert (= (and b!110381 res!91116) b!110380))

(assert (= (and b!110380 res!91120) b!110378))

(assert (= (and b!110378 (not res!91118)) b!110383))

(assert (= start!21868 b!110382))

(declare-fun m!163949 () Bool)

(assert (=> b!110381 m!163949))

(declare-fun m!163951 () Bool)

(assert (=> b!110379 m!163951))

(declare-fun m!163953 () Bool)

(assert (=> b!110382 m!163953))

(declare-fun m!163955 () Bool)

(assert (=> b!110383 m!163955))

(declare-fun m!163957 () Bool)

(assert (=> b!110378 m!163957))

(declare-fun m!163959 () Bool)

(assert (=> b!110378 m!163959))

(declare-fun m!163961 () Bool)

(assert (=> b!110378 m!163961))

(declare-fun m!163963 () Bool)

(assert (=> start!21868 m!163963))

(push 1)

(assert (not b!110379))

(assert (not b!110381))

(assert (not b!110382))

(assert (not b!110383))

(assert (not b!110378))

(assert (not start!21868))

(check-sat)

