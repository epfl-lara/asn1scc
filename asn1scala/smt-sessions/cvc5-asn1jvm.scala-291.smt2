; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5726 () Bool)

(assert start!5726)

(declare-fun b!24882 () Bool)

(declare-fun e!17009 () Bool)

(declare-fun e!17010 () Bool)

(assert (=> b!24882 (= e!17009 (not e!17010))))

(declare-fun res!21507 () Bool)

(assert (=> b!24882 (=> res!21507 e!17010)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24882 (= res!21507 (bvsge i!635 to!314))))

(declare-datatypes ((array!1649 0))(
  ( (array!1650 (arr!1166 (Array (_ BitVec 32) (_ BitVec 8))) (size!710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1252 0))(
  ( (BitStream!1253 (buf!1031 array!1649) (currentByte!2344 (_ BitVec 32)) (currentBit!2339 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1252)

(declare-fun isPrefixOf!0 (BitStream!1252 BitStream!1252) Bool)

(assert (=> b!24882 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2063 0))(
  ( (Unit!2064) )
))
(declare-fun lt!35358 () Unit!2063)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1252) Unit!2063)

(assert (=> b!24882 (= lt!35358 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!35365 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24882 (= lt!35365 (bitIndex!0 (size!710 (buf!1031 thiss!1379)) (currentByte!2344 thiss!1379) (currentBit!2339 thiss!1379)))))

(declare-fun b!24883 () Bool)

(declare-fun res!21502 () Bool)

(assert (=> b!24883 (=> (not res!21502) (not e!17009))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24883 (= res!21502 (validate_offset_bits!1 ((_ sign_extend 32) (size!710 (buf!1031 thiss!1379))) ((_ sign_extend 32) (currentByte!2344 thiss!1379)) ((_ sign_extend 32) (currentBit!2339 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24884 () Bool)

(declare-fun e!17003 () Bool)

(declare-fun e!17008 () Bool)

(assert (=> b!24884 (= e!17003 e!17008)))

(declare-fun res!21510 () Bool)

(assert (=> b!24884 (=> res!21510 e!17008)))

(declare-datatypes ((tuple2!2822 0))(
  ( (tuple2!2823 (_1!1498 Unit!2063) (_2!1498 BitStream!1252)) )
))
(declare-fun lt!35369 () tuple2!2822)

(declare-fun lt!35362 () tuple2!2822)

(assert (=> b!24884 (= res!21510 (not (= (size!710 (buf!1031 (_2!1498 lt!35369))) (size!710 (buf!1031 (_2!1498 lt!35362))))))))

(declare-fun e!17005 () Bool)

(assert (=> b!24884 e!17005))

(declare-fun res!21505 () Bool)

(assert (=> b!24884 (=> (not res!21505) (not e!17005))))

(assert (=> b!24884 (= res!21505 (= (size!710 (buf!1031 (_2!1498 lt!35362))) (size!710 (buf!1031 thiss!1379))))))

(declare-fun b!24885 () Bool)

(declare-fun res!21504 () Bool)

(assert (=> b!24885 (=> res!21504 e!17003)))

(assert (=> b!24885 (= res!21504 (not (= (size!710 (buf!1031 thiss!1379)) (size!710 (buf!1031 (_2!1498 lt!35362))))))))

(declare-fun b!24886 () Bool)

(declare-fun e!17004 () Bool)

(assert (=> b!24886 (= e!17004 e!17003)))

(declare-fun res!21513 () Bool)

(assert (=> b!24886 (=> res!21513 e!17003)))

(declare-fun lt!35370 () (_ BitVec 64))

(assert (=> b!24886 (= res!21513 (not (= lt!35370 (bvsub (bvadd lt!35365 to!314) i!635))))))

(assert (=> b!24886 (= lt!35370 (bitIndex!0 (size!710 (buf!1031 (_2!1498 lt!35362))) (currentByte!2344 (_2!1498 lt!35362)) (currentBit!2339 (_2!1498 lt!35362))))))

(declare-fun b!24887 () Bool)

(assert (=> b!24887 (= e!17008 true)))

(declare-fun lt!35368 () (_ BitVec 64))

(assert (=> b!24887 (validate_offset_bits!1 ((_ sign_extend 32) (size!710 (buf!1031 (_2!1498 lt!35362)))) ((_ sign_extend 32) (currentByte!2344 (_2!1498 lt!35369))) ((_ sign_extend 32) (currentBit!2339 (_2!1498 lt!35369))) lt!35368)))

(declare-fun lt!35360 () Unit!2063)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1252 array!1649 (_ BitVec 64)) Unit!2063)

(assert (=> b!24887 (= lt!35360 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1498 lt!35369) (buf!1031 (_2!1498 lt!35362)) lt!35368))))

(declare-datatypes ((tuple2!2824 0))(
  ( (tuple2!2825 (_1!1499 BitStream!1252) (_2!1499 BitStream!1252)) )
))
(declare-fun lt!35366 () tuple2!2824)

(declare-fun reader!0 (BitStream!1252 BitStream!1252) tuple2!2824)

(assert (=> b!24887 (= lt!35366 (reader!0 (_2!1498 lt!35369) (_2!1498 lt!35362)))))

(assert (=> b!24887 (validate_offset_bits!1 ((_ sign_extend 32) (size!710 (buf!1031 (_2!1498 lt!35362)))) ((_ sign_extend 32) (currentByte!2344 thiss!1379)) ((_ sign_extend 32) (currentBit!2339 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35364 () Unit!2063)

(assert (=> b!24887 (= lt!35364 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1031 (_2!1498 lt!35362)) (bvsub to!314 i!635)))))

(declare-fun lt!35367 () tuple2!2824)

(assert (=> b!24887 (= lt!35367 (reader!0 thiss!1379 (_2!1498 lt!35362)))))

(declare-fun b!24888 () Bool)

(declare-fun e!17007 () Bool)

(assert (=> b!24888 (= e!17010 e!17007)))

(declare-fun res!21512 () Bool)

(assert (=> b!24888 (=> res!21512 e!17007)))

(assert (=> b!24888 (= res!21512 (not (isPrefixOf!0 thiss!1379 (_2!1498 lt!35369))))))

(assert (=> b!24888 (validate_offset_bits!1 ((_ sign_extend 32) (size!710 (buf!1031 (_2!1498 lt!35369)))) ((_ sign_extend 32) (currentByte!2344 (_2!1498 lt!35369))) ((_ sign_extend 32) (currentBit!2339 (_2!1498 lt!35369))) lt!35368)))

(assert (=> b!24888 (= lt!35368 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35371 () Unit!2063)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1252 BitStream!1252 (_ BitVec 64) (_ BitVec 64)) Unit!2063)

(assert (=> b!24888 (= lt!35371 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1498 lt!35369) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1649)

(declare-fun appendBitFromByte!0 (BitStream!1252 (_ BitVec 8) (_ BitVec 32)) tuple2!2822)

(assert (=> b!24888 (= lt!35369 (appendBitFromByte!0 thiss!1379 (select (arr!1166 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!17011 () Bool)

(declare-fun b!24889 () Bool)

(declare-fun lt!35361 () tuple2!2824)

(declare-datatypes ((List!327 0))(
  ( (Nil!324) (Cons!323 (h!442 Bool) (t!1077 List!327)) )
))
(declare-fun head!164 (List!327) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1252 array!1649 (_ BitVec 64) (_ BitVec 64)) List!327)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1252 BitStream!1252 (_ BitVec 64)) List!327)

(assert (=> b!24889 (= e!17011 (= (head!164 (byteArrayBitContentToList!0 (_2!1498 lt!35369) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!164 (bitStreamReadBitsIntoList!0 (_2!1498 lt!35369) (_1!1499 lt!35361) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24890 () Bool)

(declare-fun res!21503 () Bool)

(assert (=> b!24890 (=> res!21503 e!17008)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24890 (= res!21503 (not (invariant!0 (currentBit!2339 (_2!1498 lt!35369)) (currentByte!2344 (_2!1498 lt!35369)) (size!710 (buf!1031 (_2!1498 lt!35362))))))))

(declare-fun b!24891 () Bool)

(declare-fun e!17002 () Bool)

(declare-fun array_inv!679 (array!1649) Bool)

(assert (=> b!24891 (= e!17002 (array_inv!679 (buf!1031 thiss!1379)))))

(declare-fun res!21501 () Bool)

(assert (=> start!5726 (=> (not res!21501) (not e!17009))))

(assert (=> start!5726 (= res!21501 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!710 srcBuffer!2))))))))

(assert (=> start!5726 e!17009))

(assert (=> start!5726 true))

(assert (=> start!5726 (array_inv!679 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1252) Bool)

(assert (=> start!5726 (and (inv!12 thiss!1379) e!17002)))

(declare-fun b!24892 () Bool)

(assert (=> b!24892 (= e!17005 (= lt!35370 (bvsub (bvsub (bvadd (bitIndex!0 (size!710 (buf!1031 (_2!1498 lt!35369))) (currentByte!2344 (_2!1498 lt!35369)) (currentBit!2339 (_2!1498 lt!35369))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24893 () Bool)

(declare-fun res!21511 () Bool)

(assert (=> b!24893 (=> res!21511 e!17003)))

(assert (=> b!24893 (= res!21511 (not (invariant!0 (currentBit!2339 (_2!1498 lt!35362)) (currentByte!2344 (_2!1498 lt!35362)) (size!710 (buf!1031 (_2!1498 lt!35362))))))))

(declare-fun b!24894 () Bool)

(declare-fun res!21509 () Bool)

(assert (=> b!24894 (=> res!21509 e!17008)))

(assert (=> b!24894 (= res!21509 (not (invariant!0 (currentBit!2339 (_2!1498 lt!35369)) (currentByte!2344 (_2!1498 lt!35369)) (size!710 (buf!1031 (_2!1498 lt!35369))))))))

(declare-fun b!24895 () Bool)

(assert (=> b!24895 (= e!17007 e!17004)))

(declare-fun res!21508 () Bool)

(assert (=> b!24895 (=> res!21508 e!17004)))

(assert (=> b!24895 (= res!21508 (not (isPrefixOf!0 (_2!1498 lt!35369) (_2!1498 lt!35362))))))

(assert (=> b!24895 (isPrefixOf!0 thiss!1379 (_2!1498 lt!35362))))

(declare-fun lt!35359 () Unit!2063)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1252 BitStream!1252 BitStream!1252) Unit!2063)

(assert (=> b!24895 (= lt!35359 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1498 lt!35369) (_2!1498 lt!35362)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1252 array!1649 (_ BitVec 64) (_ BitVec 64)) tuple2!2822)

(assert (=> b!24895 (= lt!35362 (appendBitsMSBFirstLoop!0 (_2!1498 lt!35369) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24895 e!17011))

(declare-fun res!21506 () Bool)

(assert (=> b!24895 (=> (not res!21506) (not e!17011))))

(assert (=> b!24895 (= res!21506 (validate_offset_bits!1 ((_ sign_extend 32) (size!710 (buf!1031 (_2!1498 lt!35369)))) ((_ sign_extend 32) (currentByte!2344 thiss!1379)) ((_ sign_extend 32) (currentBit!2339 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35363 () Unit!2063)

(assert (=> b!24895 (= lt!35363 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1031 (_2!1498 lt!35369)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24895 (= lt!35361 (reader!0 thiss!1379 (_2!1498 lt!35369)))))

(assert (= (and start!5726 res!21501) b!24883))

(assert (= (and b!24883 res!21502) b!24882))

(assert (= (and b!24882 (not res!21507)) b!24888))

(assert (= (and b!24888 (not res!21512)) b!24895))

(assert (= (and b!24895 res!21506) b!24889))

(assert (= (and b!24895 (not res!21508)) b!24886))

(assert (= (and b!24886 (not res!21513)) b!24893))

(assert (= (and b!24893 (not res!21511)) b!24885))

(assert (= (and b!24885 (not res!21504)) b!24884))

(assert (= (and b!24884 res!21505) b!24892))

(assert (= (and b!24884 (not res!21510)) b!24894))

(assert (= (and b!24894 (not res!21509)) b!24890))

(assert (= (and b!24890 (not res!21503)) b!24887))

(assert (= start!5726 b!24891))

(declare-fun m!35229 () Bool)

(assert (=> b!24894 m!35229))

(declare-fun m!35231 () Bool)

(assert (=> b!24883 m!35231))

(declare-fun m!35233 () Bool)

(assert (=> b!24891 m!35233))

(declare-fun m!35235 () Bool)

(assert (=> b!24893 m!35235))

(declare-fun m!35237 () Bool)

(assert (=> b!24889 m!35237))

(assert (=> b!24889 m!35237))

(declare-fun m!35239 () Bool)

(assert (=> b!24889 m!35239))

(declare-fun m!35241 () Bool)

(assert (=> b!24889 m!35241))

(assert (=> b!24889 m!35241))

(declare-fun m!35243 () Bool)

(assert (=> b!24889 m!35243))

(declare-fun m!35245 () Bool)

(assert (=> b!24890 m!35245))

(declare-fun m!35247 () Bool)

(assert (=> b!24888 m!35247))

(declare-fun m!35249 () Bool)

(assert (=> b!24888 m!35249))

(declare-fun m!35251 () Bool)

(assert (=> b!24888 m!35251))

(assert (=> b!24888 m!35249))

(declare-fun m!35253 () Bool)

(assert (=> b!24888 m!35253))

(declare-fun m!35255 () Bool)

(assert (=> b!24888 m!35255))

(declare-fun m!35257 () Bool)

(assert (=> b!24895 m!35257))

(declare-fun m!35259 () Bool)

(assert (=> b!24895 m!35259))

(declare-fun m!35261 () Bool)

(assert (=> b!24895 m!35261))

(declare-fun m!35263 () Bool)

(assert (=> b!24895 m!35263))

(declare-fun m!35265 () Bool)

(assert (=> b!24895 m!35265))

(declare-fun m!35267 () Bool)

(assert (=> b!24895 m!35267))

(declare-fun m!35269 () Bool)

(assert (=> b!24895 m!35269))

(declare-fun m!35271 () Bool)

(assert (=> start!5726 m!35271))

(declare-fun m!35273 () Bool)

(assert (=> start!5726 m!35273))

(declare-fun m!35275 () Bool)

(assert (=> b!24887 m!35275))

(declare-fun m!35277 () Bool)

(assert (=> b!24887 m!35277))

(declare-fun m!35279 () Bool)

(assert (=> b!24887 m!35279))

(declare-fun m!35281 () Bool)

(assert (=> b!24887 m!35281))

(declare-fun m!35283 () Bool)

(assert (=> b!24887 m!35283))

(declare-fun m!35285 () Bool)

(assert (=> b!24887 m!35285))

(declare-fun m!35287 () Bool)

(assert (=> b!24886 m!35287))

(declare-fun m!35289 () Bool)

(assert (=> b!24882 m!35289))

(declare-fun m!35291 () Bool)

(assert (=> b!24882 m!35291))

(declare-fun m!35293 () Bool)

(assert (=> b!24882 m!35293))

(declare-fun m!35295 () Bool)

(assert (=> b!24892 m!35295))

(push 1)

