; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5154 () Bool)

(assert start!5154)

(declare-fun b!20705 () Bool)

(declare-fun e!14031 () Bool)

(declare-fun e!14028 () Bool)

(assert (=> b!20705 (= e!14031 e!14028)))

(declare-fun res!17978 () Bool)

(assert (=> b!20705 (=> res!17978 e!14028)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20705 (= res!17978 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun e!14027 () Bool)

(assert (=> b!20705 e!14027))

(declare-fun res!17977 () Bool)

(assert (=> b!20705 (=> (not res!17977) (not e!14027))))

(declare-datatypes ((array!1489 0))(
  ( (array!1490 (arr!1079 (Array (_ BitVec 32) (_ BitVec 8))) (size!635 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1104 0))(
  ( (BitStream!1105 (buf!944 array!1489) (currentByte!2233 (_ BitVec 32)) (currentBit!2228 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1823 0))(
  ( (Unit!1824) )
))
(declare-datatypes ((tuple2!2448 0))(
  ( (tuple2!2449 (_1!1309 Unit!1823) (_2!1309 BitStream!1104)) )
))
(declare-fun lt!29406 () tuple2!2448)

(declare-fun thiss!1379 () BitStream!1104)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20705 (= res!17977 (validate_offset_bits!1 ((_ sign_extend 32) (size!635 (buf!944 (_2!1309 lt!29406)))) ((_ sign_extend 32) (currentByte!2233 thiss!1379)) ((_ sign_extend 32) (currentBit!2228 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29403 () Unit!1823)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1104 array!1489 (_ BitVec 64)) Unit!1823)

(assert (=> b!20705 (= lt!29403 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!944 (_2!1309 lt!29406)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2450 0))(
  ( (tuple2!2451 (_1!1310 BitStream!1104) (_2!1310 BitStream!1104)) )
))
(declare-fun lt!29405 () tuple2!2450)

(declare-fun reader!0 (BitStream!1104 BitStream!1104) tuple2!2450)

(assert (=> b!20705 (= lt!29405 (reader!0 thiss!1379 (_2!1309 lt!29406)))))

(declare-fun b!20706 () Bool)

(assert (=> b!20706 (= e!14028 (validate_offset_bits!1 ((_ sign_extend 32) (size!635 (buf!944 (_2!1309 lt!29406)))) ((_ sign_extend 32) (currentByte!2233 (_2!1309 lt!29406))) ((_ sign_extend 32) (currentBit!2228 (_2!1309 lt!29406))) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun srcBuffer!2 () array!1489)

(declare-fun b!20707 () Bool)

(declare-datatypes ((List!253 0))(
  ( (Nil!250) (Cons!249 (h!368 Bool) (t!1003 List!253)) )
))
(declare-fun head!90 (List!253) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1104 array!1489 (_ BitVec 64) (_ BitVec 64)) List!253)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1104 BitStream!1104 (_ BitVec 64)) List!253)

(assert (=> b!20707 (= e!14027 (= (head!90 (byteArrayBitContentToList!0 (_2!1309 lt!29406) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!90 (bitStreamReadBitsIntoList!0 (_2!1309 lt!29406) (_1!1310 lt!29405) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20708 () Bool)

(declare-fun e!14030 () Bool)

(declare-fun e!14025 () Bool)

(assert (=> b!20708 (= e!14030 (not e!14025))))

(declare-fun res!17981 () Bool)

(assert (=> b!20708 (=> res!17981 e!14025)))

(assert (=> b!20708 (= res!17981 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1104 BitStream!1104) Bool)

(assert (=> b!20708 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29402 () Unit!1823)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1104) Unit!1823)

(assert (=> b!20708 (= lt!29402 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29404 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20708 (= lt!29404 (bitIndex!0 (size!635 (buf!944 thiss!1379)) (currentByte!2233 thiss!1379) (currentBit!2228 thiss!1379)))))

(declare-fun b!20709 () Bool)

(declare-fun res!17979 () Bool)

(assert (=> b!20709 (=> (not res!17979) (not e!14030))))

(assert (=> b!20709 (= res!17979 (validate_offset_bits!1 ((_ sign_extend 32) (size!635 (buf!944 thiss!1379))) ((_ sign_extend 32) (currentByte!2233 thiss!1379)) ((_ sign_extend 32) (currentBit!2228 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20710 () Bool)

(declare-fun e!14029 () Bool)

(declare-fun array_inv!605 (array!1489) Bool)

(assert (=> b!20710 (= e!14029 (array_inv!605 (buf!944 thiss!1379)))))

(declare-fun b!20711 () Bool)

(assert (=> b!20711 (= e!14025 e!14031)))

(declare-fun res!17976 () Bool)

(assert (=> b!20711 (=> res!17976 e!14031)))

(assert (=> b!20711 (= res!17976 (not (isPrefixOf!0 thiss!1379 (_2!1309 lt!29406))))))

(assert (=> b!20711 (validate_offset_bits!1 ((_ sign_extend 32) (size!635 (buf!944 (_2!1309 lt!29406)))) ((_ sign_extend 32) (currentByte!2233 (_2!1309 lt!29406))) ((_ sign_extend 32) (currentBit!2228 (_2!1309 lt!29406))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29407 () Unit!1823)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1104 BitStream!1104 (_ BitVec 64) (_ BitVec 64)) Unit!1823)

(assert (=> b!20711 (= lt!29407 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1309 lt!29406) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1104 (_ BitVec 8) (_ BitVec 32)) tuple2!2448)

(assert (=> b!20711 (= lt!29406 (appendBitFromByte!0 thiss!1379 (select (arr!1079 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17980 () Bool)

(assert (=> start!5154 (=> (not res!17980) (not e!14030))))

(assert (=> start!5154 (= res!17980 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!635 srcBuffer!2))))))))

(assert (=> start!5154 e!14030))

(assert (=> start!5154 true))

(assert (=> start!5154 (array_inv!605 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1104) Bool)

(assert (=> start!5154 (and (inv!12 thiss!1379) e!14029)))

(assert (= (and start!5154 res!17980) b!20709))

(assert (= (and b!20709 res!17979) b!20708))

(assert (= (and b!20708 (not res!17981)) b!20711))

(assert (= (and b!20711 (not res!17976)) b!20705))

(assert (= (and b!20705 res!17977) b!20707))

(assert (= (and b!20705 (not res!17978)) b!20706))

(assert (= start!5154 b!20710))

(declare-fun m!28273 () Bool)

(assert (=> b!20708 m!28273))

(declare-fun m!28275 () Bool)

(assert (=> b!20708 m!28275))

(declare-fun m!28277 () Bool)

(assert (=> b!20708 m!28277))

(declare-fun m!28279 () Bool)

(assert (=> b!20707 m!28279))

(assert (=> b!20707 m!28279))

(declare-fun m!28281 () Bool)

(assert (=> b!20707 m!28281))

(declare-fun m!28283 () Bool)

(assert (=> b!20707 m!28283))

(assert (=> b!20707 m!28283))

(declare-fun m!28285 () Bool)

(assert (=> b!20707 m!28285))

(declare-fun m!28287 () Bool)

(assert (=> b!20711 m!28287))

(declare-fun m!28289 () Bool)

(assert (=> b!20711 m!28289))

(assert (=> b!20711 m!28287))

(declare-fun m!28291 () Bool)

(assert (=> b!20711 m!28291))

(declare-fun m!28293 () Bool)

(assert (=> b!20711 m!28293))

(declare-fun m!28295 () Bool)

(assert (=> b!20711 m!28295))

(declare-fun m!28297 () Bool)

(assert (=> b!20710 m!28297))

(declare-fun m!28299 () Bool)

(assert (=> b!20706 m!28299))

(declare-fun m!28301 () Bool)

(assert (=> b!20705 m!28301))

(declare-fun m!28303 () Bool)

(assert (=> b!20705 m!28303))

(declare-fun m!28305 () Bool)

(assert (=> b!20705 m!28305))

(declare-fun m!28307 () Bool)

(assert (=> b!20709 m!28307))

(declare-fun m!28309 () Bool)

(assert (=> start!5154 m!28309))

(declare-fun m!28311 () Bool)

(assert (=> start!5154 m!28311))

(check-sat (not b!20707) (not b!20705) (not b!20706) (not start!5154) (not b!20708) (not b!20710) (not b!20709) (not b!20711))
(check-sat)
