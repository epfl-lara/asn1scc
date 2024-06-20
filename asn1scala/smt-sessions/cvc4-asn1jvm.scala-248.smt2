; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4850 () Bool)

(assert start!4850)

(declare-fun b!19189 () Bool)

(declare-fun e!12658 () Bool)

(declare-fun e!12655 () Bool)

(assert (=> b!19189 (= e!12658 e!12655)))

(declare-fun res!16772 () Bool)

(assert (=> b!19189 (=> res!16772 e!12655)))

(declare-datatypes ((array!1374 0))(
  ( (array!1375 (arr!1023 (Array (_ BitVec 32) (_ BitVec 8))) (size!582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!998 0))(
  ( (BitStream!999 (buf!882 array!1374) (currentByte!2162 (_ BitVec 32)) (currentBit!2157 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!998)

(declare-datatypes ((Unit!1708 0))(
  ( (Unit!1709) )
))
(declare-datatypes ((tuple2!2176 0))(
  ( (tuple2!2177 (_1!1173 Unit!1708) (_2!1173 BitStream!998)) )
))
(declare-fun lt!27252 () tuple2!2176)

(declare-fun isPrefixOf!0 (BitStream!998 BitStream!998) Bool)

(assert (=> b!19189 (= res!16772 (not (isPrefixOf!0 thiss!1379 (_2!1173 lt!27252))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19189 (validate_offset_bits!1 ((_ sign_extend 32) (size!582 (buf!882 (_2!1173 lt!27252)))) ((_ sign_extend 32) (currentByte!2162 (_2!1173 lt!27252))) ((_ sign_extend 32) (currentBit!2157 (_2!1173 lt!27252))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27254 () Unit!1708)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!998 BitStream!998 (_ BitVec 64) (_ BitVec 64)) Unit!1708)

(assert (=> b!19189 (= lt!27254 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1173 lt!27252) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1374)

(declare-fun appendBitFromByte!0 (BitStream!998 (_ BitVec 8) (_ BitVec 32)) tuple2!2176)

(assert (=> b!19189 (= lt!27252 (appendBitFromByte!0 thiss!1379 (select (arr!1023 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19190 () Bool)

(assert (=> b!19190 (= e!12655 true)))

(declare-datatypes ((tuple2!2178 0))(
  ( (tuple2!2179 (_1!1174 BitStream!998) (_2!1174 BitStream!998)) )
))
(declare-fun lt!27255 () tuple2!2178)

(declare-fun reader!0 (BitStream!998 BitStream!998) tuple2!2178)

(assert (=> b!19190 (= lt!27255 (reader!0 thiss!1379 (_2!1173 lt!27252)))))

(declare-fun b!19191 () Bool)

(declare-fun res!16774 () Bool)

(declare-fun e!12657 () Bool)

(assert (=> b!19191 (=> (not res!16774) (not e!12657))))

(assert (=> b!19191 (= res!16774 (validate_offset_bits!1 ((_ sign_extend 32) (size!582 (buf!882 thiss!1379))) ((_ sign_extend 32) (currentByte!2162 thiss!1379)) ((_ sign_extend 32) (currentBit!2157 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!16775 () Bool)

(assert (=> start!4850 (=> (not res!16775) (not e!12657))))

(assert (=> start!4850 (= res!16775 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!582 srcBuffer!2))))))))

(assert (=> start!4850 e!12657))

(assert (=> start!4850 true))

(declare-fun array_inv!552 (array!1374) Bool)

(assert (=> start!4850 (array_inv!552 srcBuffer!2)))

(declare-fun e!12656 () Bool)

(declare-fun inv!12 (BitStream!998) Bool)

(assert (=> start!4850 (and (inv!12 thiss!1379) e!12656)))

(declare-fun b!19192 () Bool)

(assert (=> b!19192 (= e!12656 (array_inv!552 (buf!882 thiss!1379)))))

(declare-fun b!19193 () Bool)

(assert (=> b!19193 (= e!12657 (not e!12658))))

(declare-fun res!16773 () Bool)

(assert (=> b!19193 (=> res!16773 e!12658)))

(assert (=> b!19193 (= res!16773 (bvsge i!635 to!314))))

(assert (=> b!19193 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27256 () Unit!1708)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!998) Unit!1708)

(assert (=> b!19193 (= lt!27256 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27253 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19193 (= lt!27253 (bitIndex!0 (size!582 (buf!882 thiss!1379)) (currentByte!2162 thiss!1379) (currentBit!2157 thiss!1379)))))

(assert (= (and start!4850 res!16775) b!19191))

(assert (= (and b!19191 res!16774) b!19193))

(assert (= (and b!19193 (not res!16773)) b!19189))

(assert (= (and b!19189 (not res!16772)) b!19190))

(assert (= start!4850 b!19192))

(declare-fun m!25759 () Bool)

(assert (=> b!19192 m!25759))

(declare-fun m!25761 () Bool)

(assert (=> b!19189 m!25761))

(declare-fun m!25763 () Bool)

(assert (=> b!19189 m!25763))

(declare-fun m!25765 () Bool)

(assert (=> b!19189 m!25765))

(assert (=> b!19189 m!25765))

(declare-fun m!25767 () Bool)

(assert (=> b!19189 m!25767))

(declare-fun m!25769 () Bool)

(assert (=> b!19189 m!25769))

(declare-fun m!25771 () Bool)

(assert (=> b!19190 m!25771))

(declare-fun m!25773 () Bool)

(assert (=> start!4850 m!25773))

(declare-fun m!25775 () Bool)

(assert (=> start!4850 m!25775))

(declare-fun m!25777 () Bool)

(assert (=> b!19193 m!25777))

(declare-fun m!25779 () Bool)

(assert (=> b!19193 m!25779))

(declare-fun m!25781 () Bool)

(assert (=> b!19193 m!25781))

(declare-fun m!25783 () Bool)

(assert (=> b!19191 m!25783))

(push 1)

(assert (not b!19192))

(assert (not b!19190))

(assert (not b!19189))

(assert (not b!19191))

(assert (not b!19193))

(assert (not start!4850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

