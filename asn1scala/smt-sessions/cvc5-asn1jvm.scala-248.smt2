; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4846 () Bool)

(assert start!4846)

(declare-fun b!19159 () Bool)

(declare-fun e!12620 () Bool)

(assert (=> b!19159 (= e!12620 true)))

(declare-datatypes ((array!1370 0))(
  ( (array!1371 (arr!1021 (Array (_ BitVec 32) (_ BitVec 8))) (size!580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!994 0))(
  ( (BitStream!995 (buf!880 array!1370) (currentByte!2160 (_ BitVec 32)) (currentBit!2155 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2168 0))(
  ( (tuple2!2169 (_1!1169 BitStream!994) (_2!1169 BitStream!994)) )
))
(declare-fun lt!27225 () tuple2!2168)

(declare-fun thiss!1379 () BitStream!994)

(declare-datatypes ((Unit!1704 0))(
  ( (Unit!1705) )
))
(declare-datatypes ((tuple2!2170 0))(
  ( (tuple2!2171 (_1!1170 Unit!1704) (_2!1170 BitStream!994)) )
))
(declare-fun lt!27224 () tuple2!2170)

(declare-fun reader!0 (BitStream!994 BitStream!994) tuple2!2168)

(assert (=> b!19159 (= lt!27225 (reader!0 thiss!1379 (_2!1170 lt!27224)))))

(declare-fun b!19160 () Bool)

(declare-fun res!16749 () Bool)

(declare-fun e!12622 () Bool)

(assert (=> b!19160 (=> (not res!16749) (not e!12622))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19160 (= res!16749 (validate_offset_bits!1 ((_ sign_extend 32) (size!580 (buf!880 thiss!1379))) ((_ sign_extend 32) (currentByte!2160 thiss!1379)) ((_ sign_extend 32) (currentBit!2155 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19161 () Bool)

(declare-fun e!12619 () Bool)

(declare-fun array_inv!550 (array!1370) Bool)

(assert (=> b!19161 (= e!12619 (array_inv!550 (buf!880 thiss!1379)))))

(declare-fun b!19162 () Bool)

(declare-fun e!12623 () Bool)

(assert (=> b!19162 (= e!12622 (not e!12623))))

(declare-fun res!16751 () Bool)

(assert (=> b!19162 (=> res!16751 e!12623)))

(assert (=> b!19162 (= res!16751 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!994 BitStream!994) Bool)

(assert (=> b!19162 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27222 () Unit!1704)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!994) Unit!1704)

(assert (=> b!19162 (= lt!27222 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27226 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19162 (= lt!27226 (bitIndex!0 (size!580 (buf!880 thiss!1379)) (currentByte!2160 thiss!1379) (currentBit!2155 thiss!1379)))))

(declare-fun res!16748 () Bool)

(assert (=> start!4846 (=> (not res!16748) (not e!12622))))

(declare-fun srcBuffer!2 () array!1370)

(assert (=> start!4846 (= res!16748 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!580 srcBuffer!2))))))))

(assert (=> start!4846 e!12622))

(assert (=> start!4846 true))

(assert (=> start!4846 (array_inv!550 srcBuffer!2)))

(declare-fun inv!12 (BitStream!994) Bool)

(assert (=> start!4846 (and (inv!12 thiss!1379) e!12619)))

(declare-fun b!19163 () Bool)

(assert (=> b!19163 (= e!12623 e!12620)))

(declare-fun res!16750 () Bool)

(assert (=> b!19163 (=> res!16750 e!12620)))

(assert (=> b!19163 (= res!16750 (not (isPrefixOf!0 thiss!1379 (_2!1170 lt!27224))))))

(assert (=> b!19163 (validate_offset_bits!1 ((_ sign_extend 32) (size!580 (buf!880 (_2!1170 lt!27224)))) ((_ sign_extend 32) (currentByte!2160 (_2!1170 lt!27224))) ((_ sign_extend 32) (currentBit!2155 (_2!1170 lt!27224))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27223 () Unit!1704)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!994 BitStream!994 (_ BitVec 64) (_ BitVec 64)) Unit!1704)

(assert (=> b!19163 (= lt!27223 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1170 lt!27224) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!994 (_ BitVec 8) (_ BitVec 32)) tuple2!2170)

(assert (=> b!19163 (= lt!27224 (appendBitFromByte!0 thiss!1379 (select (arr!1021 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4846 res!16748) b!19160))

(assert (= (and b!19160 res!16749) b!19162))

(assert (= (and b!19162 (not res!16751)) b!19163))

(assert (= (and b!19163 (not res!16750)) b!19159))

(assert (= start!4846 b!19161))

(declare-fun m!25707 () Bool)

(assert (=> b!19162 m!25707))

(declare-fun m!25709 () Bool)

(assert (=> b!19162 m!25709))

(declare-fun m!25711 () Bool)

(assert (=> b!19162 m!25711))

(declare-fun m!25713 () Bool)

(assert (=> start!4846 m!25713))

(declare-fun m!25715 () Bool)

(assert (=> start!4846 m!25715))

(declare-fun m!25717 () Bool)

(assert (=> b!19159 m!25717))

(declare-fun m!25719 () Bool)

(assert (=> b!19161 m!25719))

(declare-fun m!25721 () Bool)

(assert (=> b!19160 m!25721))

(declare-fun m!25723 () Bool)

(assert (=> b!19163 m!25723))

(declare-fun m!25725 () Bool)

(assert (=> b!19163 m!25725))

(declare-fun m!25727 () Bool)

(assert (=> b!19163 m!25727))

(declare-fun m!25729 () Bool)

(assert (=> b!19163 m!25729))

(assert (=> b!19163 m!25723))

(declare-fun m!25731 () Bool)

(assert (=> b!19163 m!25731))

(push 1)

(assert (not b!19159))

(assert (not b!19162))

(assert (not b!19161))

(assert (not start!4846))

(assert (not b!19163))

(assert (not b!19160))

(check-sat)

(pop 1)

