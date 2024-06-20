; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4862 () Bool)

(assert start!4862)

(declare-fun b!19280 () Bool)

(declare-fun e!12764 () Bool)

(declare-fun e!12767 () Bool)

(assert (=> b!19280 (= e!12764 e!12767)))

(declare-fun res!16844 () Bool)

(assert (=> b!19280 (=> res!16844 e!12767)))

(declare-datatypes ((array!1386 0))(
  ( (array!1387 (arr!1029 (Array (_ BitVec 32) (_ BitVec 8))) (size!588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1010 0))(
  ( (BitStream!1011 (buf!888 array!1386) (currentByte!2168 (_ BitVec 32)) (currentBit!2163 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1010)

(declare-datatypes ((Unit!1720 0))(
  ( (Unit!1721) )
))
(declare-datatypes ((tuple2!2200 0))(
  ( (tuple2!2201 (_1!1185 Unit!1720) (_2!1185 BitStream!1010)) )
))
(declare-fun lt!27346 () tuple2!2200)

(declare-fun isPrefixOf!0 (BitStream!1010 BitStream!1010) Bool)

(assert (=> b!19280 (= res!16844 (not (isPrefixOf!0 thiss!1379 (_2!1185 lt!27346))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19280 (validate_offset_bits!1 ((_ sign_extend 32) (size!588 (buf!888 (_2!1185 lt!27346)))) ((_ sign_extend 32) (currentByte!2168 (_2!1185 lt!27346))) ((_ sign_extend 32) (currentBit!2163 (_2!1185 lt!27346))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27342 () Unit!1720)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1010 BitStream!1010 (_ BitVec 64) (_ BitVec 64)) Unit!1720)

(assert (=> b!19280 (= lt!27342 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1185 lt!27346) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1386)

(declare-fun appendBitFromByte!0 (BitStream!1010 (_ BitVec 8) (_ BitVec 32)) tuple2!2200)

(assert (=> b!19280 (= lt!27346 (appendBitFromByte!0 thiss!1379 (select (arr!1029 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19281 () Bool)

(declare-fun e!12763 () Bool)

(assert (=> b!19281 (= e!12763 (not e!12764))))

(declare-fun res!16846 () Bool)

(assert (=> b!19281 (=> res!16846 e!12764)))

(assert (=> b!19281 (= res!16846 (bvsge i!635 to!314))))

(assert (=> b!19281 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27344 () Unit!1720)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1010) Unit!1720)

(assert (=> b!19281 (= lt!27344 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27343 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19281 (= lt!27343 (bitIndex!0 (size!588 (buf!888 thiss!1379)) (currentByte!2168 thiss!1379) (currentBit!2163 thiss!1379)))))

(declare-fun b!19282 () Bool)

(assert (=> b!19282 (= e!12767 true)))

(declare-datatypes ((tuple2!2202 0))(
  ( (tuple2!2203 (_1!1186 BitStream!1010) (_2!1186 BitStream!1010)) )
))
(declare-fun lt!27345 () tuple2!2202)

(declare-fun reader!0 (BitStream!1010 BitStream!1010) tuple2!2202)

(assert (=> b!19282 (= lt!27345 (reader!0 thiss!1379 (_2!1185 lt!27346)))))

(declare-fun b!19283 () Bool)

(declare-fun e!12768 () Bool)

(declare-fun array_inv!558 (array!1386) Bool)

(assert (=> b!19283 (= e!12768 (array_inv!558 (buf!888 thiss!1379)))))

(declare-fun res!16847 () Bool)

(assert (=> start!4862 (=> (not res!16847) (not e!12763))))

(assert (=> start!4862 (= res!16847 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!588 srcBuffer!2))))))))

(assert (=> start!4862 e!12763))

(assert (=> start!4862 true))

(assert (=> start!4862 (array_inv!558 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1010) Bool)

(assert (=> start!4862 (and (inv!12 thiss!1379) e!12768)))

(declare-fun b!19279 () Bool)

(declare-fun res!16845 () Bool)

(assert (=> b!19279 (=> (not res!16845) (not e!12763))))

(assert (=> b!19279 (= res!16845 (validate_offset_bits!1 ((_ sign_extend 32) (size!588 (buf!888 thiss!1379))) ((_ sign_extend 32) (currentByte!2168 thiss!1379)) ((_ sign_extend 32) (currentBit!2163 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4862 res!16847) b!19279))

(assert (= (and b!19279 res!16845) b!19281))

(assert (= (and b!19281 (not res!16846)) b!19280))

(assert (= (and b!19280 (not res!16844)) b!19282))

(assert (= start!4862 b!19283))

(declare-fun m!25915 () Bool)

(assert (=> start!4862 m!25915))

(declare-fun m!25917 () Bool)

(assert (=> start!4862 m!25917))

(declare-fun m!25919 () Bool)

(assert (=> b!19283 m!25919))

(declare-fun m!25921 () Bool)

(assert (=> b!19280 m!25921))

(declare-fun m!25923 () Bool)

(assert (=> b!19280 m!25923))

(declare-fun m!25925 () Bool)

(assert (=> b!19280 m!25925))

(declare-fun m!25927 () Bool)

(assert (=> b!19280 m!25927))

(assert (=> b!19280 m!25925))

(declare-fun m!25929 () Bool)

(assert (=> b!19280 m!25929))

(declare-fun m!25931 () Bool)

(assert (=> b!19281 m!25931))

(declare-fun m!25933 () Bool)

(assert (=> b!19281 m!25933))

(declare-fun m!25935 () Bool)

(assert (=> b!19281 m!25935))

(declare-fun m!25937 () Bool)

(assert (=> b!19282 m!25937))

(declare-fun m!25939 () Bool)

(assert (=> b!19279 m!25939))

(push 1)

(assert (not b!19279))

(assert (not b!19280))

(assert (not b!19282))

(assert (not start!4862))

(assert (not b!19281))

(assert (not b!19283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

