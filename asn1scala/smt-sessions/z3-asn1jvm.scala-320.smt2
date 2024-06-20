; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6916 () Bool)

(assert start!6916)

(declare-fun b!33226 () Bool)

(declare-fun res!28458 () Bool)

(declare-fun e!22023 () Bool)

(assert (=> b!33226 (=> res!28458 e!22023)))

(declare-datatypes ((array!1852 0))(
  ( (array!1853 (arr!1293 (Array (_ BitVec 32) (_ BitVec 8))) (size!818 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1428 0))(
  ( (BitStream!1429 (buf!1146 array!1852) (currentByte!2513 (_ BitVec 32)) (currentBit!2508 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2491 0))(
  ( (Unit!2492) )
))
(declare-datatypes ((tuple2!3386 0))(
  ( (tuple2!3387 (_1!1780 Unit!2491) (_2!1780 BitStream!1428)) )
))
(declare-fun lt!48931 () tuple2!3386)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33226 (= res!28458 (not (invariant!0 (currentBit!2508 (_2!1780 lt!48931)) (currentByte!2513 (_2!1780 lt!48931)) (size!818 (buf!1146 (_2!1780 lt!48931))))))))

(declare-fun lt!48927 () (_ BitVec 64))

(declare-fun e!22031 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!33227 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33227 (= e!22031 (= lt!48927 (bvsub (bvsub (bvadd (bitIndex!0 (size!818 (buf!1146 (_2!1780 lt!48931))) (currentByte!2513 (_2!1780 lt!48931)) (currentBit!2508 (_2!1780 lt!48931))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33228 () Bool)

(declare-fun e!22022 () Bool)

(declare-fun thiss!1379 () BitStream!1428)

(declare-fun array_inv!767 (array!1852) Bool)

(assert (=> b!33228 (= e!22022 (array_inv!767 (buf!1146 thiss!1379)))))

(declare-fun b!33229 () Bool)

(declare-fun res!28456 () Bool)

(declare-fun e!22027 () Bool)

(assert (=> b!33229 (=> (not res!28456) (not e!22027))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33229 (= res!28456 (validate_offset_bits!1 ((_ sign_extend 32) (size!818 (buf!1146 thiss!1379))) ((_ sign_extend 32) (currentByte!2513 thiss!1379)) ((_ sign_extend 32) (currentBit!2508 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33230 () Bool)

(declare-fun res!28457 () Bool)

(declare-fun e!22032 () Bool)

(assert (=> b!33230 (=> res!28457 e!22032)))

(declare-datatypes ((List!415 0))(
  ( (Nil!412) (Cons!411 (h!530 Bool) (t!1165 List!415)) )
))
(declare-fun lt!48933 () List!415)

(declare-fun length!141 (List!415) Int)

(assert (=> b!33230 (= res!28457 (<= (length!141 lt!48933) 0))))

(declare-fun b!33231 () Bool)

(declare-fun res!28454 () Bool)

(assert (=> b!33231 (=> res!28454 e!22023)))

(declare-fun lt!48926 () tuple2!3386)

(assert (=> b!33231 (= res!28454 (not (invariant!0 (currentBit!2508 (_2!1780 lt!48931)) (currentByte!2513 (_2!1780 lt!48931)) (size!818 (buf!1146 (_2!1780 lt!48926))))))))

(declare-fun b!33232 () Bool)

(declare-fun e!22026 () Bool)

(assert (=> b!33232 (= e!22026 e!22023)))

(declare-fun res!28445 () Bool)

(assert (=> b!33232 (=> res!28445 e!22023)))

(assert (=> b!33232 (= res!28445 (not (= (size!818 (buf!1146 (_2!1780 lt!48931))) (size!818 (buf!1146 (_2!1780 lt!48926))))))))

(assert (=> b!33232 e!22031))

(declare-fun res!28449 () Bool)

(assert (=> b!33232 (=> (not res!28449) (not e!22031))))

(assert (=> b!33232 (= res!28449 (= (size!818 (buf!1146 (_2!1780 lt!48926))) (size!818 (buf!1146 thiss!1379))))))

(declare-fun b!33234 () Bool)

(declare-fun res!28453 () Bool)

(assert (=> b!33234 (=> res!28453 e!22026)))

(assert (=> b!33234 (= res!28453 (not (invariant!0 (currentBit!2508 (_2!1780 lt!48926)) (currentByte!2513 (_2!1780 lt!48926)) (size!818 (buf!1146 (_2!1780 lt!48926))))))))

(declare-fun b!33235 () Bool)

(declare-fun res!28450 () Bool)

(assert (=> b!33235 (=> res!28450 e!22026)))

(assert (=> b!33235 (= res!28450 (not (= (size!818 (buf!1146 thiss!1379)) (size!818 (buf!1146 (_2!1780 lt!48926))))))))

(declare-fun b!33236 () Bool)

(assert (=> b!33236 (= e!22023 e!22032)))

(declare-fun res!28451 () Bool)

(assert (=> b!33236 (=> res!28451 e!22032)))

(assert (=> b!33236 (= res!28451 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3388 0))(
  ( (tuple2!3389 (_1!1781 BitStream!1428) (_2!1781 BitStream!1428)) )
))
(declare-fun lt!48940 () tuple2!3388)

(declare-fun lt!48939 () List!415)

(declare-fun lt!48936 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1428 BitStream!1428 (_ BitVec 64)) List!415)

(assert (=> b!33236 (= lt!48939 (bitStreamReadBitsIntoList!0 (_2!1780 lt!48926) (_1!1781 lt!48940) lt!48936))))

(declare-fun lt!48932 () tuple2!3388)

(assert (=> b!33236 (= lt!48933 (bitStreamReadBitsIntoList!0 (_2!1780 lt!48926) (_1!1781 lt!48932) (bvsub to!314 i!635)))))

(assert (=> b!33236 (validate_offset_bits!1 ((_ sign_extend 32) (size!818 (buf!1146 (_2!1780 lt!48926)))) ((_ sign_extend 32) (currentByte!2513 (_2!1780 lt!48931))) ((_ sign_extend 32) (currentBit!2508 (_2!1780 lt!48931))) lt!48936)))

(declare-fun lt!48935 () Unit!2491)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1428 array!1852 (_ BitVec 64)) Unit!2491)

(assert (=> b!33236 (= lt!48935 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1780 lt!48931) (buf!1146 (_2!1780 lt!48926)) lt!48936))))

(declare-fun reader!0 (BitStream!1428 BitStream!1428) tuple2!3388)

(assert (=> b!33236 (= lt!48940 (reader!0 (_2!1780 lt!48931) (_2!1780 lt!48926)))))

(assert (=> b!33236 (validate_offset_bits!1 ((_ sign_extend 32) (size!818 (buf!1146 (_2!1780 lt!48926)))) ((_ sign_extend 32) (currentByte!2513 thiss!1379)) ((_ sign_extend 32) (currentBit!2508 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48938 () Unit!2491)

(assert (=> b!33236 (= lt!48938 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1146 (_2!1780 lt!48926)) (bvsub to!314 i!635)))))

(assert (=> b!33236 (= lt!48932 (reader!0 thiss!1379 (_2!1780 lt!48926)))))

(declare-fun b!33237 () Bool)

(declare-fun e!22028 () Bool)

(declare-fun e!22030 () Bool)

(assert (=> b!33237 (= e!22028 e!22030)))

(declare-fun res!28444 () Bool)

(assert (=> b!33237 (=> res!28444 e!22030)))

(declare-fun isPrefixOf!0 (BitStream!1428 BitStream!1428) Bool)

(assert (=> b!33237 (= res!28444 (not (isPrefixOf!0 (_2!1780 lt!48931) (_2!1780 lt!48926))))))

(assert (=> b!33237 (isPrefixOf!0 thiss!1379 (_2!1780 lt!48926))))

(declare-fun lt!48929 () Unit!2491)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1428 BitStream!1428 BitStream!1428) Unit!2491)

(assert (=> b!33237 (= lt!48929 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1780 lt!48931) (_2!1780 lt!48926)))))

(declare-fun srcBuffer!2 () array!1852)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1428 array!1852 (_ BitVec 64) (_ BitVec 64)) tuple2!3386)

(assert (=> b!33237 (= lt!48926 (appendBitsMSBFirstLoop!0 (_2!1780 lt!48931) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22025 () Bool)

(assert (=> b!33237 e!22025))

(declare-fun res!28447 () Bool)

(assert (=> b!33237 (=> (not res!28447) (not e!22025))))

(assert (=> b!33237 (= res!28447 (validate_offset_bits!1 ((_ sign_extend 32) (size!818 (buf!1146 (_2!1780 lt!48931)))) ((_ sign_extend 32) (currentByte!2513 thiss!1379)) ((_ sign_extend 32) (currentBit!2508 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48925 () Unit!2491)

(assert (=> b!33237 (= lt!48925 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1146 (_2!1780 lt!48931)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48937 () tuple2!3388)

(assert (=> b!33237 (= lt!48937 (reader!0 thiss!1379 (_2!1780 lt!48931)))))

(declare-fun b!33238 () Bool)

(assert (=> b!33238 (= e!22032 true)))

(declare-fun tail!132 (List!415) List!415)

(assert (=> b!33238 (= lt!48939 (tail!132 lt!48933))))

(declare-fun lt!48934 () Unit!2491)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1428 BitStream!1428 BitStream!1428 BitStream!1428 (_ BitVec 64) List!415) Unit!2491)

(assert (=> b!33238 (= lt!48934 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1780 lt!48926) (_2!1780 lt!48926) (_1!1781 lt!48932) (_1!1781 lt!48940) (bvsub to!314 i!635) lt!48933))))

(declare-fun b!33239 () Bool)

(declare-fun e!22024 () Bool)

(assert (=> b!33239 (= e!22027 (not e!22024))))

(declare-fun res!28452 () Bool)

(assert (=> b!33239 (=> res!28452 e!22024)))

(assert (=> b!33239 (= res!28452 (bvsge i!635 to!314))))

(assert (=> b!33239 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48930 () Unit!2491)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1428) Unit!2491)

(assert (=> b!33239 (= lt!48930 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48924 () (_ BitVec 64))

(assert (=> b!33239 (= lt!48924 (bitIndex!0 (size!818 (buf!1146 thiss!1379)) (currentByte!2513 thiss!1379) (currentBit!2508 thiss!1379)))))

(declare-fun b!33240 () Bool)

(assert (=> b!33240 (= e!22030 e!22026)))

(declare-fun res!28446 () Bool)

(assert (=> b!33240 (=> res!28446 e!22026)))

(assert (=> b!33240 (= res!28446 (not (= lt!48927 (bvsub (bvadd lt!48924 to!314) i!635))))))

(assert (=> b!33240 (= lt!48927 (bitIndex!0 (size!818 (buf!1146 (_2!1780 lt!48926))) (currentByte!2513 (_2!1780 lt!48926)) (currentBit!2508 (_2!1780 lt!48926))))))

(declare-fun b!33241 () Bool)

(declare-fun head!252 (List!415) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1428 array!1852 (_ BitVec 64) (_ BitVec 64)) List!415)

(assert (=> b!33241 (= e!22025 (= (head!252 (byteArrayBitContentToList!0 (_2!1780 lt!48931) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!252 (bitStreamReadBitsIntoList!0 (_2!1780 lt!48931) (_1!1781 lt!48937) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!28448 () Bool)

(assert (=> start!6916 (=> (not res!28448) (not e!22027))))

(assert (=> start!6916 (= res!28448 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!818 srcBuffer!2))))))))

(assert (=> start!6916 e!22027))

(assert (=> start!6916 true))

(assert (=> start!6916 (array_inv!767 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1428) Bool)

(assert (=> start!6916 (and (inv!12 thiss!1379) e!22022)))

(declare-fun b!33233 () Bool)

(assert (=> b!33233 (= e!22024 e!22028)))

(declare-fun res!28455 () Bool)

(assert (=> b!33233 (=> res!28455 e!22028)))

(assert (=> b!33233 (= res!28455 (not (isPrefixOf!0 thiss!1379 (_2!1780 lt!48931))))))

(assert (=> b!33233 (validate_offset_bits!1 ((_ sign_extend 32) (size!818 (buf!1146 (_2!1780 lt!48931)))) ((_ sign_extend 32) (currentByte!2513 (_2!1780 lt!48931))) ((_ sign_extend 32) (currentBit!2508 (_2!1780 lt!48931))) lt!48936)))

(assert (=> b!33233 (= lt!48936 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48928 () Unit!2491)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1428 BitStream!1428 (_ BitVec 64) (_ BitVec 64)) Unit!2491)

(assert (=> b!33233 (= lt!48928 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1780 lt!48931) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1428 (_ BitVec 8) (_ BitVec 32)) tuple2!3386)

(assert (=> b!33233 (= lt!48931 (appendBitFromByte!0 thiss!1379 (select (arr!1293 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!6916 res!28448) b!33229))

(assert (= (and b!33229 res!28456) b!33239))

(assert (= (and b!33239 (not res!28452)) b!33233))

(assert (= (and b!33233 (not res!28455)) b!33237))

(assert (= (and b!33237 res!28447) b!33241))

(assert (= (and b!33237 (not res!28444)) b!33240))

(assert (= (and b!33240 (not res!28446)) b!33234))

(assert (= (and b!33234 (not res!28453)) b!33235))

(assert (= (and b!33235 (not res!28450)) b!33232))

(assert (= (and b!33232 res!28449) b!33227))

(assert (= (and b!33232 (not res!28445)) b!33226))

(assert (= (and b!33226 (not res!28458)) b!33231))

(assert (= (and b!33231 (not res!28454)) b!33236))

(assert (= (and b!33236 (not res!28451)) b!33230))

(assert (= (and b!33230 (not res!28457)) b!33238))

(assert (= start!6916 b!33228))

(declare-fun m!49251 () Bool)

(assert (=> b!33226 m!49251))

(declare-fun m!49253 () Bool)

(assert (=> b!33229 m!49253))

(declare-fun m!49255 () Bool)

(assert (=> b!33241 m!49255))

(assert (=> b!33241 m!49255))

(declare-fun m!49257 () Bool)

(assert (=> b!33241 m!49257))

(declare-fun m!49259 () Bool)

(assert (=> b!33241 m!49259))

(assert (=> b!33241 m!49259))

(declare-fun m!49261 () Bool)

(assert (=> b!33241 m!49261))

(declare-fun m!49263 () Bool)

(assert (=> b!33231 m!49263))

(declare-fun m!49265 () Bool)

(assert (=> b!33234 m!49265))

(declare-fun m!49267 () Bool)

(assert (=> b!33227 m!49267))

(declare-fun m!49269 () Bool)

(assert (=> b!33238 m!49269))

(declare-fun m!49271 () Bool)

(assert (=> b!33238 m!49271))

(declare-fun m!49273 () Bool)

(assert (=> b!33237 m!49273))

(declare-fun m!49275 () Bool)

(assert (=> b!33237 m!49275))

(declare-fun m!49277 () Bool)

(assert (=> b!33237 m!49277))

(declare-fun m!49279 () Bool)

(assert (=> b!33237 m!49279))

(declare-fun m!49281 () Bool)

(assert (=> b!33237 m!49281))

(declare-fun m!49283 () Bool)

(assert (=> b!33237 m!49283))

(declare-fun m!49285 () Bool)

(assert (=> b!33237 m!49285))

(declare-fun m!49287 () Bool)

(assert (=> b!33230 m!49287))

(declare-fun m!49289 () Bool)

(assert (=> b!33239 m!49289))

(declare-fun m!49291 () Bool)

(assert (=> b!33239 m!49291))

(declare-fun m!49293 () Bool)

(assert (=> b!33239 m!49293))

(declare-fun m!49295 () Bool)

(assert (=> b!33236 m!49295))

(declare-fun m!49297 () Bool)

(assert (=> b!33236 m!49297))

(declare-fun m!49299 () Bool)

(assert (=> b!33236 m!49299))

(declare-fun m!49301 () Bool)

(assert (=> b!33236 m!49301))

(declare-fun m!49303 () Bool)

(assert (=> b!33236 m!49303))

(declare-fun m!49305 () Bool)

(assert (=> b!33236 m!49305))

(declare-fun m!49307 () Bool)

(assert (=> b!33236 m!49307))

(declare-fun m!49309 () Bool)

(assert (=> b!33236 m!49309))

(declare-fun m!49311 () Bool)

(assert (=> b!33240 m!49311))

(declare-fun m!49313 () Bool)

(assert (=> start!6916 m!49313))

(declare-fun m!49315 () Bool)

(assert (=> start!6916 m!49315))

(declare-fun m!49317 () Bool)

(assert (=> b!33233 m!49317))

(declare-fun m!49319 () Bool)

(assert (=> b!33233 m!49319))

(assert (=> b!33233 m!49317))

(declare-fun m!49321 () Bool)

(assert (=> b!33233 m!49321))

(declare-fun m!49323 () Bool)

(assert (=> b!33233 m!49323))

(declare-fun m!49325 () Bool)

(assert (=> b!33233 m!49325))

(declare-fun m!49327 () Bool)

(assert (=> b!33228 m!49327))

(check-sat (not b!33239) (not b!33234) (not start!6916) (not b!33241) (not b!33236) (not b!33233) (not b!33230) (not b!33237) (not b!33238) (not b!33226) (not b!33228) (not b!33227) (not b!33229) (not b!33231) (not b!33240))
