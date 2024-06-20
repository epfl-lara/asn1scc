; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4848 () Bool)

(assert start!4848)

(declare-fun res!16763 () Bool)

(declare-fun e!12640 () Bool)

(assert (=> start!4848 (=> (not res!16763) (not e!12640))))

(declare-datatypes ((array!1372 0))(
  ( (array!1373 (arr!1022 (Array (_ BitVec 32) (_ BitVec 8))) (size!581 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1372)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4848 (= res!16763 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!581 srcBuffer!2))))))))

(assert (=> start!4848 e!12640))

(assert (=> start!4848 true))

(declare-fun array_inv!551 (array!1372) Bool)

(assert (=> start!4848 (array_inv!551 srcBuffer!2)))

(declare-datatypes ((BitStream!996 0))(
  ( (BitStream!997 (buf!881 array!1372) (currentByte!2161 (_ BitVec 32)) (currentBit!2156 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!996)

(declare-fun e!12639 () Bool)

(declare-fun inv!12 (BitStream!996) Bool)

(assert (=> start!4848 (and (inv!12 thiss!1379) e!12639)))

(declare-fun b!19174 () Bool)

(declare-fun res!16761 () Bool)

(assert (=> b!19174 (=> (not res!16761) (not e!12640))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19174 (= res!16761 (validate_offset_bits!1 ((_ sign_extend 32) (size!581 (buf!881 thiss!1379))) ((_ sign_extend 32) (currentByte!2161 thiss!1379)) ((_ sign_extend 32) (currentBit!2156 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19175 () Bool)

(declare-fun e!12638 () Bool)

(declare-fun e!12642 () Bool)

(assert (=> b!19175 (= e!12638 e!12642)))

(declare-fun res!16760 () Bool)

(assert (=> b!19175 (=> res!16760 e!12642)))

(declare-datatypes ((Unit!1706 0))(
  ( (Unit!1707) )
))
(declare-datatypes ((tuple2!2172 0))(
  ( (tuple2!2173 (_1!1171 Unit!1706) (_2!1171 BitStream!996)) )
))
(declare-fun lt!27237 () tuple2!2172)

(declare-fun isPrefixOf!0 (BitStream!996 BitStream!996) Bool)

(assert (=> b!19175 (= res!16760 (not (isPrefixOf!0 thiss!1379 (_2!1171 lt!27237))))))

(assert (=> b!19175 (validate_offset_bits!1 ((_ sign_extend 32) (size!581 (buf!881 (_2!1171 lt!27237)))) ((_ sign_extend 32) (currentByte!2161 (_2!1171 lt!27237))) ((_ sign_extend 32) (currentBit!2156 (_2!1171 lt!27237))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27238 () Unit!1706)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!996 BitStream!996 (_ BitVec 64) (_ BitVec 64)) Unit!1706)

(assert (=> b!19175 (= lt!27238 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1171 lt!27237) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!996 (_ BitVec 8) (_ BitVec 32)) tuple2!2172)

(assert (=> b!19175 (= lt!27237 (appendBitFromByte!0 thiss!1379 (select (arr!1022 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19176 () Bool)

(assert (=> b!19176 (= e!12642 true)))

(declare-datatypes ((tuple2!2174 0))(
  ( (tuple2!2175 (_1!1172 BitStream!996) (_2!1172 BitStream!996)) )
))
(declare-fun lt!27239 () tuple2!2174)

(declare-fun reader!0 (BitStream!996 BitStream!996) tuple2!2174)

(assert (=> b!19176 (= lt!27239 (reader!0 thiss!1379 (_2!1171 lt!27237)))))

(declare-fun b!19177 () Bool)

(assert (=> b!19177 (= e!12639 (array_inv!551 (buf!881 thiss!1379)))))

(declare-fun b!19178 () Bool)

(assert (=> b!19178 (= e!12640 (not e!12638))))

(declare-fun res!16762 () Bool)

(assert (=> b!19178 (=> res!16762 e!12638)))

(assert (=> b!19178 (= res!16762 (bvsge i!635 to!314))))

(assert (=> b!19178 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27240 () Unit!1706)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!996) Unit!1706)

(assert (=> b!19178 (= lt!27240 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27241 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19178 (= lt!27241 (bitIndex!0 (size!581 (buf!881 thiss!1379)) (currentByte!2161 thiss!1379) (currentBit!2156 thiss!1379)))))

(assert (= (and start!4848 res!16763) b!19174))

(assert (= (and b!19174 res!16761) b!19178))

(assert (= (and b!19178 (not res!16762)) b!19175))

(assert (= (and b!19175 (not res!16760)) b!19176))

(assert (= start!4848 b!19177))

(declare-fun m!25733 () Bool)

(assert (=> b!19177 m!25733))

(declare-fun m!25735 () Bool)

(assert (=> start!4848 m!25735))

(declare-fun m!25737 () Bool)

(assert (=> start!4848 m!25737))

(declare-fun m!25739 () Bool)

(assert (=> b!19178 m!25739))

(declare-fun m!25741 () Bool)

(assert (=> b!19178 m!25741))

(declare-fun m!25743 () Bool)

(assert (=> b!19178 m!25743))

(declare-fun m!25745 () Bool)

(assert (=> b!19175 m!25745))

(declare-fun m!25747 () Bool)

(assert (=> b!19175 m!25747))

(declare-fun m!25749 () Bool)

(assert (=> b!19175 m!25749))

(declare-fun m!25751 () Bool)

(assert (=> b!19175 m!25751))

(assert (=> b!19175 m!25745))

(declare-fun m!25753 () Bool)

(assert (=> b!19175 m!25753))

(declare-fun m!25755 () Bool)

(assert (=> b!19176 m!25755))

(declare-fun m!25757 () Bool)

(assert (=> b!19174 m!25757))

(check-sat (not b!19176) (not b!19174) (not b!19175) (not b!19178) (not start!4848) (not b!19177))
