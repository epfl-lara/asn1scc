; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6918 () Bool)

(assert start!6918)

(declare-fun b!33274 () Bool)

(declare-fun e!22058 () Bool)

(assert (=> b!33274 (= e!22058 true)))

(declare-datatypes ((List!416 0))(
  ( (Nil!413) (Cons!412 (h!531 Bool) (t!1166 List!416)) )
))
(declare-fun lt!48986 () List!416)

(declare-fun lt!48980 () List!416)

(declare-fun tail!133 (List!416) List!416)

(assert (=> b!33274 (= lt!48986 (tail!133 lt!48980))))

(declare-datatypes ((array!1854 0))(
  ( (array!1855 (arr!1294 (Array (_ BitVec 32) (_ BitVec 8))) (size!819 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1430 0))(
  ( (BitStream!1431 (buf!1147 array!1854) (currentByte!2514 (_ BitVec 32)) (currentBit!2509 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3390 0))(
  ( (tuple2!3391 (_1!1782 BitStream!1430) (_2!1782 BitStream!1430)) )
))
(declare-fun lt!48983 () tuple2!3390)

(declare-datatypes ((Unit!2493 0))(
  ( (Unit!2494) )
))
(declare-datatypes ((tuple2!3392 0))(
  ( (tuple2!3393 (_1!1783 Unit!2493) (_2!1783 BitStream!1430)) )
))
(declare-fun lt!48984 () tuple2!3392)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!48975 () tuple2!3390)

(declare-fun lt!48989 () Unit!2493)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1430 BitStream!1430 BitStream!1430 BitStream!1430 (_ BitVec 64) List!416) Unit!2493)

(assert (=> b!33274 (= lt!48989 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1783 lt!48984) (_2!1783 lt!48984) (_1!1782 lt!48983) (_1!1782 lt!48975) (bvsub to!314 i!635) lt!48980))))

(declare-fun b!33275 () Bool)

(declare-fun e!22063 () Bool)

(assert (=> b!33275 (= e!22063 e!22058)))

(declare-fun res!28492 () Bool)

(assert (=> b!33275 (=> res!28492 e!22058)))

(assert (=> b!33275 (= res!28492 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!48988 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1430 BitStream!1430 (_ BitVec 64)) List!416)

(assert (=> b!33275 (= lt!48986 (bitStreamReadBitsIntoList!0 (_2!1783 lt!48984) (_1!1782 lt!48975) lt!48988))))

(assert (=> b!33275 (= lt!48980 (bitStreamReadBitsIntoList!0 (_2!1783 lt!48984) (_1!1782 lt!48983) (bvsub to!314 i!635)))))

(declare-fun lt!48976 () tuple2!3392)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33275 (validate_offset_bits!1 ((_ sign_extend 32) (size!819 (buf!1147 (_2!1783 lt!48984)))) ((_ sign_extend 32) (currentByte!2514 (_2!1783 lt!48976))) ((_ sign_extend 32) (currentBit!2509 (_2!1783 lt!48976))) lt!48988)))

(declare-fun lt!48987 () Unit!2493)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1430 array!1854 (_ BitVec 64)) Unit!2493)

(assert (=> b!33275 (= lt!48987 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1783 lt!48976) (buf!1147 (_2!1783 lt!48984)) lt!48988))))

(declare-fun reader!0 (BitStream!1430 BitStream!1430) tuple2!3390)

(assert (=> b!33275 (= lt!48975 (reader!0 (_2!1783 lt!48976) (_2!1783 lt!48984)))))

(declare-fun thiss!1379 () BitStream!1430)

(assert (=> b!33275 (validate_offset_bits!1 ((_ sign_extend 32) (size!819 (buf!1147 (_2!1783 lt!48984)))) ((_ sign_extend 32) (currentByte!2514 thiss!1379)) ((_ sign_extend 32) (currentBit!2509 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48982 () Unit!2493)

(assert (=> b!33275 (= lt!48982 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1147 (_2!1783 lt!48984)) (bvsub to!314 i!635)))))

(assert (=> b!33275 (= lt!48983 (reader!0 thiss!1379 (_2!1783 lt!48984)))))

(declare-fun res!28489 () Bool)

(declare-fun e!22060 () Bool)

(assert (=> start!6918 (=> (not res!28489) (not e!22060))))

(declare-fun srcBuffer!2 () array!1854)

(assert (=> start!6918 (= res!28489 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!819 srcBuffer!2))))))))

(assert (=> start!6918 e!22060))

(assert (=> start!6918 true))

(declare-fun array_inv!768 (array!1854) Bool)

(assert (=> start!6918 (array_inv!768 srcBuffer!2)))

(declare-fun e!22065 () Bool)

(declare-fun inv!12 (BitStream!1430) Bool)

(assert (=> start!6918 (and (inv!12 thiss!1379) e!22065)))

(declare-fun b!33276 () Bool)

(declare-fun res!28495 () Bool)

(assert (=> b!33276 (=> (not res!28495) (not e!22060))))

(assert (=> b!33276 (= res!28495 (validate_offset_bits!1 ((_ sign_extend 32) (size!819 (buf!1147 thiss!1379))) ((_ sign_extend 32) (currentByte!2514 thiss!1379)) ((_ sign_extend 32) (currentBit!2509 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33277 () Bool)

(declare-fun e!22067 () Bool)

(declare-fun e!22068 () Bool)

(assert (=> b!33277 (= e!22067 e!22068)))

(declare-fun res!28502 () Bool)

(assert (=> b!33277 (=> res!28502 e!22068)))

(declare-fun isPrefixOf!0 (BitStream!1430 BitStream!1430) Bool)

(assert (=> b!33277 (= res!28502 (not (isPrefixOf!0 (_2!1783 lt!48976) (_2!1783 lt!48984))))))

(assert (=> b!33277 (isPrefixOf!0 thiss!1379 (_2!1783 lt!48984))))

(declare-fun lt!48991 () Unit!2493)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1430 BitStream!1430 BitStream!1430) Unit!2493)

(assert (=> b!33277 (= lt!48991 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1783 lt!48976) (_2!1783 lt!48984)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1430 array!1854 (_ BitVec 64) (_ BitVec 64)) tuple2!3392)

(assert (=> b!33277 (= lt!48984 (appendBitsMSBFirstLoop!0 (_2!1783 lt!48976) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22069 () Bool)

(assert (=> b!33277 e!22069))

(declare-fun res!28490 () Bool)

(assert (=> b!33277 (=> (not res!28490) (not e!22069))))

(assert (=> b!33277 (= res!28490 (validate_offset_bits!1 ((_ sign_extend 32) (size!819 (buf!1147 (_2!1783 lt!48976)))) ((_ sign_extend 32) (currentByte!2514 thiss!1379)) ((_ sign_extend 32) (currentBit!2509 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48981 () Unit!2493)

(assert (=> b!33277 (= lt!48981 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1147 (_2!1783 lt!48976)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48978 () tuple2!3390)

(assert (=> b!33277 (= lt!48978 (reader!0 thiss!1379 (_2!1783 lt!48976)))))

(declare-fun b!33278 () Bool)

(declare-fun res!28501 () Bool)

(assert (=> b!33278 (=> res!28501 e!22063)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33278 (= res!28501 (not (invariant!0 (currentBit!2509 (_2!1783 lt!48976)) (currentByte!2514 (_2!1783 lt!48976)) (size!819 (buf!1147 (_2!1783 lt!48984))))))))

(declare-fun b!33279 () Bool)

(declare-fun e!22066 () Bool)

(assert (=> b!33279 (= e!22066 e!22067)))

(declare-fun res!28497 () Bool)

(assert (=> b!33279 (=> res!28497 e!22067)))

(assert (=> b!33279 (= res!28497 (not (isPrefixOf!0 thiss!1379 (_2!1783 lt!48976))))))

(assert (=> b!33279 (validate_offset_bits!1 ((_ sign_extend 32) (size!819 (buf!1147 (_2!1783 lt!48976)))) ((_ sign_extend 32) (currentByte!2514 (_2!1783 lt!48976))) ((_ sign_extend 32) (currentBit!2509 (_2!1783 lt!48976))) lt!48988)))

(assert (=> b!33279 (= lt!48988 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48977 () Unit!2493)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1430 BitStream!1430 (_ BitVec 64) (_ BitVec 64)) Unit!2493)

(assert (=> b!33279 (= lt!48977 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1783 lt!48976) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1430 (_ BitVec 8) (_ BitVec 32)) tuple2!3392)

(assert (=> b!33279 (= lt!48976 (appendBitFromByte!0 thiss!1379 (select (arr!1294 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!22064 () Bool)

(declare-fun lt!48985 () (_ BitVec 64))

(declare-fun b!33280 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33280 (= e!22064 (= lt!48985 (bvsub (bvsub (bvadd (bitIndex!0 (size!819 (buf!1147 (_2!1783 lt!48976))) (currentByte!2514 (_2!1783 lt!48976)) (currentBit!2509 (_2!1783 lt!48976))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33281 () Bool)

(declare-fun head!253 (List!416) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1430 array!1854 (_ BitVec 64) (_ BitVec 64)) List!416)

(assert (=> b!33281 (= e!22069 (= (head!253 (byteArrayBitContentToList!0 (_2!1783 lt!48976) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!253 (bitStreamReadBitsIntoList!0 (_2!1783 lt!48976) (_1!1782 lt!48978) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33282 () Bool)

(declare-fun res!28503 () Bool)

(assert (=> b!33282 (=> res!28503 e!22063)))

(assert (=> b!33282 (= res!28503 (not (invariant!0 (currentBit!2509 (_2!1783 lt!48976)) (currentByte!2514 (_2!1783 lt!48976)) (size!819 (buf!1147 (_2!1783 lt!48976))))))))

(declare-fun b!33283 () Bool)

(declare-fun res!28500 () Bool)

(assert (=> b!33283 (=> res!28500 e!22058)))

(declare-fun length!142 (List!416) Int)

(assert (=> b!33283 (= res!28500 (<= (length!142 lt!48980) 0))))

(declare-fun b!33284 () Bool)

(declare-fun res!28491 () Bool)

(declare-fun e!22062 () Bool)

(assert (=> b!33284 (=> res!28491 e!22062)))

(assert (=> b!33284 (= res!28491 (not (= (size!819 (buf!1147 thiss!1379)) (size!819 (buf!1147 (_2!1783 lt!48984))))))))

(declare-fun b!33285 () Bool)

(assert (=> b!33285 (= e!22060 (not e!22066))))

(declare-fun res!28494 () Bool)

(assert (=> b!33285 (=> res!28494 e!22066)))

(assert (=> b!33285 (= res!28494 (bvsge i!635 to!314))))

(assert (=> b!33285 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48990 () Unit!2493)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1430) Unit!2493)

(assert (=> b!33285 (= lt!48990 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48979 () (_ BitVec 64))

(assert (=> b!33285 (= lt!48979 (bitIndex!0 (size!819 (buf!1147 thiss!1379)) (currentByte!2514 thiss!1379) (currentBit!2509 thiss!1379)))))

(declare-fun b!33286 () Bool)

(assert (=> b!33286 (= e!22062 e!22063)))

(declare-fun res!28498 () Bool)

(assert (=> b!33286 (=> res!28498 e!22063)))

(assert (=> b!33286 (= res!28498 (not (= (size!819 (buf!1147 (_2!1783 lt!48976))) (size!819 (buf!1147 (_2!1783 lt!48984))))))))

(assert (=> b!33286 e!22064))

(declare-fun res!28499 () Bool)

(assert (=> b!33286 (=> (not res!28499) (not e!22064))))

(assert (=> b!33286 (= res!28499 (= (size!819 (buf!1147 (_2!1783 lt!48984))) (size!819 (buf!1147 thiss!1379))))))

(declare-fun b!33287 () Bool)

(declare-fun res!28493 () Bool)

(assert (=> b!33287 (=> res!28493 e!22062)))

(assert (=> b!33287 (= res!28493 (not (invariant!0 (currentBit!2509 (_2!1783 lt!48984)) (currentByte!2514 (_2!1783 lt!48984)) (size!819 (buf!1147 (_2!1783 lt!48984))))))))

(declare-fun b!33288 () Bool)

(assert (=> b!33288 (= e!22068 e!22062)))

(declare-fun res!28496 () Bool)

(assert (=> b!33288 (=> res!28496 e!22062)))

(assert (=> b!33288 (= res!28496 (not (= lt!48985 (bvsub (bvadd lt!48979 to!314) i!635))))))

(assert (=> b!33288 (= lt!48985 (bitIndex!0 (size!819 (buf!1147 (_2!1783 lt!48984))) (currentByte!2514 (_2!1783 lt!48984)) (currentBit!2509 (_2!1783 lt!48984))))))

(declare-fun b!33289 () Bool)

(assert (=> b!33289 (= e!22065 (array_inv!768 (buf!1147 thiss!1379)))))

(assert (= (and start!6918 res!28489) b!33276))

(assert (= (and b!33276 res!28495) b!33285))

(assert (= (and b!33285 (not res!28494)) b!33279))

(assert (= (and b!33279 (not res!28497)) b!33277))

(assert (= (and b!33277 res!28490) b!33281))

(assert (= (and b!33277 (not res!28502)) b!33288))

(assert (= (and b!33288 (not res!28496)) b!33287))

(assert (= (and b!33287 (not res!28493)) b!33284))

(assert (= (and b!33284 (not res!28491)) b!33286))

(assert (= (and b!33286 res!28499) b!33280))

(assert (= (and b!33286 (not res!28498)) b!33282))

(assert (= (and b!33282 (not res!28503)) b!33278))

(assert (= (and b!33278 (not res!28501)) b!33275))

(assert (= (and b!33275 (not res!28492)) b!33283))

(assert (= (and b!33283 (not res!28500)) b!33274))

(assert (= start!6918 b!33289))

(declare-fun m!49329 () Bool)

(assert (=> b!33289 m!49329))

(declare-fun m!49331 () Bool)

(assert (=> start!6918 m!49331))

(declare-fun m!49333 () Bool)

(assert (=> start!6918 m!49333))

(declare-fun m!49335 () Bool)

(assert (=> b!33283 m!49335))

(declare-fun m!49337 () Bool)

(assert (=> b!33275 m!49337))

(declare-fun m!49339 () Bool)

(assert (=> b!33275 m!49339))

(declare-fun m!49341 () Bool)

(assert (=> b!33275 m!49341))

(declare-fun m!49343 () Bool)

(assert (=> b!33275 m!49343))

(declare-fun m!49345 () Bool)

(assert (=> b!33275 m!49345))

(declare-fun m!49347 () Bool)

(assert (=> b!33275 m!49347))

(declare-fun m!49349 () Bool)

(assert (=> b!33275 m!49349))

(declare-fun m!49351 () Bool)

(assert (=> b!33275 m!49351))

(declare-fun m!49353 () Bool)

(assert (=> b!33277 m!49353))

(declare-fun m!49355 () Bool)

(assert (=> b!33277 m!49355))

(declare-fun m!49357 () Bool)

(assert (=> b!33277 m!49357))

(declare-fun m!49359 () Bool)

(assert (=> b!33277 m!49359))

(declare-fun m!49361 () Bool)

(assert (=> b!33277 m!49361))

(declare-fun m!49363 () Bool)

(assert (=> b!33277 m!49363))

(declare-fun m!49365 () Bool)

(assert (=> b!33277 m!49365))

(declare-fun m!49367 () Bool)

(assert (=> b!33280 m!49367))

(declare-fun m!49369 () Bool)

(assert (=> b!33276 m!49369))

(declare-fun m!49371 () Bool)

(assert (=> b!33287 m!49371))

(declare-fun m!49373 () Bool)

(assert (=> b!33282 m!49373))

(declare-fun m!49375 () Bool)

(assert (=> b!33281 m!49375))

(assert (=> b!33281 m!49375))

(declare-fun m!49377 () Bool)

(assert (=> b!33281 m!49377))

(declare-fun m!49379 () Bool)

(assert (=> b!33281 m!49379))

(assert (=> b!33281 m!49379))

(declare-fun m!49381 () Bool)

(assert (=> b!33281 m!49381))

(declare-fun m!49383 () Bool)

(assert (=> b!33279 m!49383))

(declare-fun m!49385 () Bool)

(assert (=> b!33279 m!49385))

(declare-fun m!49387 () Bool)

(assert (=> b!33279 m!49387))

(assert (=> b!33279 m!49383))

(declare-fun m!49389 () Bool)

(assert (=> b!33279 m!49389))

(declare-fun m!49391 () Bool)

(assert (=> b!33279 m!49391))

(declare-fun m!49393 () Bool)

(assert (=> b!33278 m!49393))

(declare-fun m!49395 () Bool)

(assert (=> b!33288 m!49395))

(declare-fun m!49397 () Bool)

(assert (=> b!33274 m!49397))

(declare-fun m!49399 () Bool)

(assert (=> b!33274 m!49399))

(declare-fun m!49401 () Bool)

(assert (=> b!33285 m!49401))

(declare-fun m!49403 () Bool)

(assert (=> b!33285 m!49403))

(declare-fun m!49405 () Bool)

(assert (=> b!33285 m!49405))

(push 1)

