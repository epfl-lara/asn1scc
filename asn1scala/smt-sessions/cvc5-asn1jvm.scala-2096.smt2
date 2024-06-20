; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53132 () Bool)

(assert start!53132)

(declare-fun b!246867 () Bool)

(declare-fun res!206573 () Bool)

(declare-fun e!171034 () Bool)

(assert (=> b!246867 (=> (not res!206573) (not e!171034))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13460 0))(
  ( (array!13461 (arr!6889 (Array (_ BitVec 32) (_ BitVec 8))) (size!5902 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10726 0))(
  ( (BitStream!10727 (buf!6383 array!13460) (currentByte!11779 (_ BitVec 32)) (currentBit!11774 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10726)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246867 (= res!206573 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246868 () Bool)

(declare-fun res!206570 () Bool)

(declare-fun e!171035 () Bool)

(assert (=> b!246868 (=> res!206570 e!171035)))

(declare-datatypes ((Unit!17916 0))(
  ( (Unit!17917) )
))
(declare-datatypes ((tuple2!21192 0))(
  ( (tuple2!21193 (_1!11518 Unit!17916) (_2!11518 BitStream!10726)) )
))
(declare-fun lt!385048 () tuple2!21192)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246868 (= res!206570 (not (= (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048))) (bvadd (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)) (bvsub nBits!297 from!289)))))))

(declare-fun b!246869 () Bool)

(declare-fun e!171030 () Bool)

(declare-fun array_inv!5643 (array!13460) Bool)

(assert (=> b!246869 (= e!171030 (array_inv!5643 (buf!6383 thiss!1005)))))

(declare-fun b!246870 () Bool)

(declare-fun res!206574 () Bool)

(assert (=> b!246870 (=> (not res!206574) (not e!171034))))

(assert (=> b!246870 (= res!206574 (bvslt from!289 nBits!297))))

(declare-fun b!246871 () Bool)

(declare-fun e!171033 () Bool)

(declare-fun e!171039 () Bool)

(assert (=> b!246871 (= e!171033 e!171039)))

(declare-fun res!206561 () Bool)

(assert (=> b!246871 (=> (not res!206561) (not e!171039))))

(declare-fun lt!385039 () (_ BitVec 64))

(declare-fun lt!385056 () tuple2!21192)

(assert (=> b!246871 (= res!206561 (= (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048))) (bvadd (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))) lt!385039)))))

(assert (=> b!246871 (= lt!385039 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246872 () Bool)

(declare-fun e!171032 () Bool)

(declare-datatypes ((tuple2!21194 0))(
  ( (tuple2!21195 (_1!11519 BitStream!10726) (_2!11519 Bool)) )
))
(declare-fun lt!385052 () tuple2!21194)

(declare-fun lt!385036 () tuple2!21194)

(assert (=> b!246872 (= e!171032 (= (_2!11519 lt!385052) (_2!11519 lt!385036)))))

(declare-fun b!246873 () Bool)

(declare-fun e!171031 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246873 (= e!171031 (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385048)))))))

(declare-fun b!246875 () Bool)

(declare-datatypes ((tuple2!21196 0))(
  ( (tuple2!21197 (_1!11520 BitStream!10726) (_2!11520 BitStream!10726)) )
))
(declare-fun lt!385054 () tuple2!21196)

(assert (=> b!246875 (= e!171035 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11520 lt!385054)))) ((_ sign_extend 32) (currentByte!11779 (_1!11520 lt!385054))) ((_ sign_extend 32) (currentBit!11774 (_1!11520 lt!385054))) (bvsub nBits!297 from!289)))))

(declare-fun b!246876 () Bool)

(declare-fun e!171036 () Bool)

(declare-fun e!171038 () Bool)

(assert (=> b!246876 (= e!171036 e!171038)))

(declare-fun res!206558 () Bool)

(assert (=> b!246876 (=> (not res!206558) (not e!171038))))

(declare-fun lt!385050 () (_ BitVec 64))

(declare-fun lt!385042 () (_ BitVec 64))

(assert (=> b!246876 (= res!206558 (= lt!385050 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!385042)))))

(assert (=> b!246876 (= lt!385050 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))))))

(assert (=> b!246876 (= lt!385042 (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(declare-fun b!246877 () Bool)

(declare-fun e!171037 () Bool)

(declare-fun lt!385040 () tuple2!21194)

(assert (=> b!246877 (= e!171037 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385040))) (currentByte!11779 (_1!11519 lt!385040)) (currentBit!11774 (_1!11519 lt!385040))) lt!385050))))

(declare-fun b!246878 () Bool)

(declare-fun res!206569 () Bool)

(assert (=> b!246878 (=> (not res!206569) (not e!171031))))

(assert (=> b!246878 (= res!206569 (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(declare-fun b!246879 () Bool)

(declare-fun e!171040 () Bool)

(assert (=> b!246879 (= e!171040 e!171035)))

(declare-fun res!206559 () Bool)

(assert (=> b!246879 (=> res!206559 e!171035)))

(assert (=> b!246879 (= res!206559 (not (= (size!5902 (buf!6383 thiss!1005)) (size!5902 (buf!6383 (_2!11518 lt!385048))))))))

(declare-fun lt!385038 () tuple2!21194)

(declare-fun lt!385037 () tuple2!21194)

(assert (=> b!246879 (and (= (_2!11519 lt!385038) (_2!11519 lt!385037)) (= (_1!11519 lt!385038) (_2!11520 lt!385054)))))

(declare-fun b!246880 () Bool)

(assert (=> b!246880 (= e!171038 e!171037)))

(declare-fun res!206563 () Bool)

(assert (=> b!246880 (=> (not res!206563) (not e!171037))))

(declare-fun bit!26 () Bool)

(assert (=> b!246880 (= res!206563 (and (= (_2!11519 lt!385040) bit!26) (= (_1!11519 lt!385040) (_2!11518 lt!385056))))))

(declare-fun readBitPure!0 (BitStream!10726) tuple2!21194)

(declare-fun readerFrom!0 (BitStream!10726 (_ BitVec 32) (_ BitVec 32)) BitStream!10726)

(assert (=> b!246880 (= lt!385040 (readBitPure!0 (readerFrom!0 (_2!11518 lt!385056) (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005))))))

(declare-fun b!246881 () Bool)

(assert (=> b!246881 (= e!171034 (not e!171040))))

(declare-fun res!206567 () Bool)

(assert (=> b!246881 (=> res!206567 e!171040)))

(declare-fun lt!385045 () tuple2!21196)

(assert (=> b!246881 (= res!206567 (not (= (_1!11519 lt!385037) (_2!11520 lt!385045))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10726 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21194)

(assert (=> b!246881 (= lt!385037 (checkBitsLoopPure!0 (_1!11520 lt!385045) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385035 () (_ BitVec 64))

(assert (=> b!246881 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385035)))

(declare-fun lt!385046 () Unit!17916)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10726 array!13460 (_ BitVec 64)) Unit!17916)

(assert (=> b!246881 (= lt!385046 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385048)) lt!385035))))

(assert (=> b!246881 (= lt!385038 (checkBitsLoopPure!0 (_1!11520 lt!385054) nBits!297 bit!26 from!289))))

(assert (=> b!246881 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!385044 () Unit!17916)

(assert (=> b!246881 (= lt!385044 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6383 (_2!11518 lt!385048)) (bvsub nBits!297 from!289)))))

(assert (=> b!246881 (= (_2!11519 (readBitPure!0 (_1!11520 lt!385054))) bit!26)))

(declare-fun reader!0 (BitStream!10726 BitStream!10726) tuple2!21196)

(assert (=> b!246881 (= lt!385045 (reader!0 (_2!11518 lt!385056) (_2!11518 lt!385048)))))

(assert (=> b!246881 (= lt!385054 (reader!0 thiss!1005 (_2!11518 lt!385048)))))

(assert (=> b!246881 e!171032))

(declare-fun res!206565 () Bool)

(assert (=> b!246881 (=> (not res!206565) (not e!171032))))

(assert (=> b!246881 (= res!206565 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385052))) (currentByte!11779 (_1!11519 lt!385052)) (currentBit!11774 (_1!11519 lt!385052))) (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385036))) (currentByte!11779 (_1!11519 lt!385036)) (currentBit!11774 (_1!11519 lt!385036)))))))

(declare-fun lt!385043 () Unit!17916)

(declare-fun lt!385049 () BitStream!10726)

(declare-fun readBitPrefixLemma!0 (BitStream!10726 BitStream!10726) Unit!17916)

(assert (=> b!246881 (= lt!385043 (readBitPrefixLemma!0 lt!385049 (_2!11518 lt!385048)))))

(assert (=> b!246881 (= lt!385036 (readBitPure!0 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005))))))

(assert (=> b!246881 (= lt!385052 (readBitPure!0 lt!385049))))

(assert (=> b!246881 (= lt!385049 (BitStream!10727 (buf!6383 (_2!11518 lt!385056)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(assert (=> b!246881 e!171031))

(declare-fun res!206564 () Bool)

(assert (=> b!246881 (=> (not res!206564) (not e!171031))))

(declare-fun isPrefixOf!0 (BitStream!10726 BitStream!10726) Bool)

(assert (=> b!246881 (= res!206564 (isPrefixOf!0 thiss!1005 (_2!11518 lt!385048)))))

(declare-fun lt!385047 () Unit!17916)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10726 BitStream!10726 BitStream!10726) Unit!17916)

(assert (=> b!246881 (= lt!385047 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11518 lt!385056) (_2!11518 lt!385048)))))

(assert (=> b!246881 e!171033))

(declare-fun res!206572 () Bool)

(assert (=> b!246881 (=> (not res!206572) (not e!171033))))

(assert (=> b!246881 (= res!206572 (= (size!5902 (buf!6383 (_2!11518 lt!385056))) (size!5902 (buf!6383 (_2!11518 lt!385048)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10726 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21192)

(assert (=> b!246881 (= lt!385048 (appendNBitsLoop!0 (_2!11518 lt!385056) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246881 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385035)))

(assert (=> b!246881 (= lt!385035 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!385041 () Unit!17916)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10726 BitStream!10726 (_ BitVec 64) (_ BitVec 64)) Unit!17916)

(assert (=> b!246881 (= lt!385041 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11518 lt!385056) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246881 e!171036))

(declare-fun res!206571 () Bool)

(assert (=> b!246881 (=> (not res!206571) (not e!171036))))

(assert (=> b!246881 (= res!206571 (= (size!5902 (buf!6383 thiss!1005)) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(declare-fun appendBit!0 (BitStream!10726 Bool) tuple2!21192)

(assert (=> b!246881 (= lt!385056 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246882 () Bool)

(declare-fun lt!385051 () tuple2!21194)

(declare-fun lt!385053 () tuple2!21196)

(assert (=> b!246882 (= e!171039 (not (or (not (_2!11519 lt!385051)) (not (= (_1!11519 lt!385051) (_2!11520 lt!385053))))))))

(assert (=> b!246882 (= lt!385051 (checkBitsLoopPure!0 (_1!11520 lt!385053) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246882 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385039)))

(declare-fun lt!385055 () Unit!17916)

(assert (=> b!246882 (= lt!385055 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385048)) lt!385039))))

(assert (=> b!246882 (= lt!385053 (reader!0 (_2!11518 lt!385056) (_2!11518 lt!385048)))))

(declare-fun b!246874 () Bool)

(declare-fun res!206562 () Bool)

(assert (=> b!246874 (=> (not res!206562) (not e!171038))))

(assert (=> b!246874 (= res!206562 (isPrefixOf!0 thiss!1005 (_2!11518 lt!385056)))))

(declare-fun res!206560 () Bool)

(assert (=> start!53132 (=> (not res!206560) (not e!171034))))

(assert (=> start!53132 (= res!206560 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53132 e!171034))

(assert (=> start!53132 true))

(declare-fun inv!12 (BitStream!10726) Bool)

(assert (=> start!53132 (and (inv!12 thiss!1005) e!171030)))

(declare-fun b!246883 () Bool)

(declare-fun res!206568 () Bool)

(assert (=> b!246883 (=> (not res!206568) (not e!171039))))

(assert (=> b!246883 (= res!206568 (isPrefixOf!0 (_2!11518 lt!385056) (_2!11518 lt!385048)))))

(declare-fun b!246884 () Bool)

(declare-fun res!206566 () Bool)

(assert (=> b!246884 (=> res!206566 e!171040)))

(declare-fun withMovedBitIndex!0 (BitStream!10726 (_ BitVec 64)) BitStream!10726)

(assert (=> b!246884 (= res!206566 (not (= (_1!11520 lt!385045) (withMovedBitIndex!0 (_1!11520 lt!385054) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!53132 res!206560) b!246867))

(assert (= (and b!246867 res!206573) b!246870))

(assert (= (and b!246870 res!206574) b!246881))

(assert (= (and b!246881 res!206571) b!246876))

(assert (= (and b!246876 res!206558) b!246874))

(assert (= (and b!246874 res!206562) b!246880))

(assert (= (and b!246880 res!206563) b!246877))

(assert (= (and b!246881 res!206572) b!246871))

(assert (= (and b!246871 res!206561) b!246883))

(assert (= (and b!246883 res!206568) b!246882))

(assert (= (and b!246881 res!206564) b!246878))

(assert (= (and b!246878 res!206569) b!246873))

(assert (= (and b!246881 res!206565) b!246872))

(assert (= (and b!246881 (not res!206567)) b!246884))

(assert (= (and b!246884 (not res!206566)) b!246879))

(assert (= (and b!246879 (not res!206559)) b!246868))

(assert (= (and b!246868 (not res!206570)) b!246875))

(assert (= start!53132 b!246869))

(declare-fun m!372293 () Bool)

(assert (=> b!246871 m!372293))

(declare-fun m!372295 () Bool)

(assert (=> b!246871 m!372295))

(assert (=> b!246868 m!372293))

(declare-fun m!372297 () Bool)

(assert (=> b!246868 m!372297))

(declare-fun m!372299 () Bool)

(assert (=> b!246867 m!372299))

(declare-fun m!372301 () Bool)

(assert (=> b!246874 m!372301))

(declare-fun m!372303 () Bool)

(assert (=> b!246878 m!372303))

(declare-fun m!372305 () Bool)

(assert (=> b!246882 m!372305))

(declare-fun m!372307 () Bool)

(assert (=> b!246882 m!372307))

(declare-fun m!372309 () Bool)

(assert (=> b!246882 m!372309))

(declare-fun m!372311 () Bool)

(assert (=> b!246882 m!372311))

(declare-fun m!372313 () Bool)

(assert (=> b!246877 m!372313))

(declare-fun m!372315 () Bool)

(assert (=> b!246881 m!372315))

(declare-fun m!372317 () Bool)

(assert (=> b!246881 m!372317))

(declare-fun m!372319 () Bool)

(assert (=> b!246881 m!372319))

(declare-fun m!372321 () Bool)

(assert (=> b!246881 m!372321))

(declare-fun m!372323 () Bool)

(assert (=> b!246881 m!372323))

(declare-fun m!372325 () Bool)

(assert (=> b!246881 m!372325))

(declare-fun m!372327 () Bool)

(assert (=> b!246881 m!372327))

(declare-fun m!372329 () Bool)

(assert (=> b!246881 m!372329))

(declare-fun m!372331 () Bool)

(assert (=> b!246881 m!372331))

(declare-fun m!372333 () Bool)

(assert (=> b!246881 m!372333))

(declare-fun m!372335 () Bool)

(assert (=> b!246881 m!372335))

(declare-fun m!372337 () Bool)

(assert (=> b!246881 m!372337))

(declare-fun m!372339 () Bool)

(assert (=> b!246881 m!372339))

(declare-fun m!372341 () Bool)

(assert (=> b!246881 m!372341))

(declare-fun m!372343 () Bool)

(assert (=> b!246881 m!372343))

(declare-fun m!372345 () Bool)

(assert (=> b!246881 m!372345))

(declare-fun m!372347 () Bool)

(assert (=> b!246881 m!372347))

(declare-fun m!372349 () Bool)

(assert (=> b!246881 m!372349))

(assert (=> b!246881 m!372311))

(declare-fun m!372351 () Bool)

(assert (=> b!246881 m!372351))

(declare-fun m!372353 () Bool)

(assert (=> b!246869 m!372353))

(declare-fun m!372355 () Bool)

(assert (=> b!246883 m!372355))

(declare-fun m!372357 () Bool)

(assert (=> b!246873 m!372357))

(declare-fun m!372359 () Bool)

(assert (=> b!246884 m!372359))

(declare-fun m!372361 () Bool)

(assert (=> b!246880 m!372361))

(assert (=> b!246880 m!372361))

(declare-fun m!372363 () Bool)

(assert (=> b!246880 m!372363))

(assert (=> b!246876 m!372295))

(assert (=> b!246876 m!372297))

(declare-fun m!372365 () Bool)

(assert (=> b!246875 m!372365))

(declare-fun m!372367 () Bool)

(assert (=> start!53132 m!372367))

(push 1)

(assert (not b!246876))

(assert (not b!246883))

(assert (not b!246875))

(assert (not b!246874))

(assert (not b!246881))

(assert (not b!246868))

(assert (not b!246877))

(assert (not start!53132))

(assert (not b!246878))

(assert (not b!246871))

(assert (not b!246867))

(assert (not b!246880))

(assert (not b!246873))

(assert (not b!246869))

(assert (not b!246884))

(assert (not b!246882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82686 () Bool)

(declare-fun e!171166 () Bool)

(assert (=> d!82686 e!171166))

(declare-fun res!206761 () Bool)

(assert (=> d!82686 (=> (not res!206761) (not e!171166))))

(declare-fun lt!385409 () (_ BitVec 64))

(declare-fun lt!385408 () (_ BitVec 64))

(declare-fun lt!385407 () (_ BitVec 64))

(assert (=> d!82686 (= res!206761 (= lt!385409 (bvsub lt!385407 lt!385408)))))

(assert (=> d!82686 (or (= (bvand lt!385407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385407 lt!385408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82686 (= lt!385408 (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385048))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385048)))))))

(declare-fun lt!385410 () (_ BitVec 64))

(declare-fun lt!385406 () (_ BitVec 64))

(assert (=> d!82686 (= lt!385407 (bvmul lt!385410 lt!385406))))

(assert (=> d!82686 (or (= lt!385410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385406 (bvsdiv (bvmul lt!385410 lt!385406) lt!385410)))))

(assert (=> d!82686 (= lt!385406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82686 (= lt!385410 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))))))

(assert (=> d!82686 (= lt!385409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385048))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385048)))))))

(assert (=> d!82686 (invariant!0 (currentBit!11774 (_2!11518 lt!385048)) (currentByte!11779 (_2!11518 lt!385048)) (size!5902 (buf!6383 (_2!11518 lt!385048))))))

(assert (=> d!82686 (= (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048))) lt!385409)))

(declare-fun b!247085 () Bool)

(declare-fun res!206762 () Bool)

(assert (=> b!247085 (=> (not res!206762) (not e!171166))))

(assert (=> b!247085 (= res!206762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385409))))

(declare-fun b!247086 () Bool)

(declare-fun lt!385405 () (_ BitVec 64))

(assert (=> b!247086 (= e!171166 (bvsle lt!385409 (bvmul lt!385405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247086 (or (= lt!385405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385405)))))

(assert (=> b!247086 (= lt!385405 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))))))

(assert (= (and d!82686 res!206761) b!247085))

(assert (= (and b!247085 res!206762) b!247086))

(declare-fun m!372687 () Bool)

(assert (=> d!82686 m!372687))

(declare-fun m!372689 () Bool)

(assert (=> d!82686 m!372689))

(assert (=> b!246868 d!82686))

(declare-fun d!82688 () Bool)

(declare-fun e!171167 () Bool)

(assert (=> d!82688 e!171167))

(declare-fun res!206763 () Bool)

(assert (=> d!82688 (=> (not res!206763) (not e!171167))))

(declare-fun lt!385413 () (_ BitVec 64))

(declare-fun lt!385415 () (_ BitVec 64))

(declare-fun lt!385414 () (_ BitVec 64))

(assert (=> d!82688 (= res!206763 (= lt!385415 (bvsub lt!385413 lt!385414)))))

(assert (=> d!82688 (or (= (bvand lt!385413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385414 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385413 lt!385414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82688 (= lt!385414 (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005))))))

(declare-fun lt!385416 () (_ BitVec 64))

(declare-fun lt!385412 () (_ BitVec 64))

(assert (=> d!82688 (= lt!385413 (bvmul lt!385416 lt!385412))))

(assert (=> d!82688 (or (= lt!385416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385412 (bvsdiv (bvmul lt!385416 lt!385412) lt!385416)))))

(assert (=> d!82688 (= lt!385412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82688 (= lt!385416 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))))))

(assert (=> d!82688 (= lt!385415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11779 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11774 thiss!1005))))))

(assert (=> d!82688 (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 thiss!1005)))))

(assert (=> d!82688 (= (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)) lt!385415)))

(declare-fun b!247087 () Bool)

(declare-fun res!206764 () Bool)

(assert (=> b!247087 (=> (not res!206764) (not e!171167))))

(assert (=> b!247087 (= res!206764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385415))))

(declare-fun b!247088 () Bool)

(declare-fun lt!385411 () (_ BitVec 64))

(assert (=> b!247088 (= e!171167 (bvsle lt!385415 (bvmul lt!385411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247088 (or (= lt!385411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385411)))))

(assert (=> b!247088 (= lt!385411 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))))))

(assert (= (and d!82688 res!206763) b!247087))

(assert (= (and b!247087 res!206764) b!247088))

(declare-fun m!372691 () Bool)

(assert (=> d!82688 m!372691))

(declare-fun m!372693 () Bool)

(assert (=> d!82688 m!372693))

(assert (=> b!246868 d!82688))

(declare-fun d!82690 () Bool)

(assert (=> d!82690 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 thiss!1005))))))

(declare-fun bs!20934 () Bool)

(assert (= bs!20934 d!82690))

(assert (=> bs!20934 m!372693))

(assert (=> start!53132 d!82690))

(declare-fun d!82692 () Bool)

(assert (=> d!82692 (= (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385056)))) (and (bvsge (currentBit!11774 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11774 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11779 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385056)))) (and (= (currentBit!11774 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385056))))))))))

(assert (=> b!246878 d!82692))

(declare-fun d!82694 () Bool)

(assert (=> d!82694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20935 () Bool)

(assert (= bs!20935 d!82694))

(assert (=> bs!20935 m!372691))

(assert (=> b!246867 d!82694))

(declare-fun d!82696 () Bool)

(declare-fun e!171168 () Bool)

(assert (=> d!82696 e!171168))

(declare-fun res!206765 () Bool)

(assert (=> d!82696 (=> (not res!206765) (not e!171168))))

(declare-fun lt!385419 () (_ BitVec 64))

(declare-fun lt!385420 () (_ BitVec 64))

(declare-fun lt!385421 () (_ BitVec 64))

(assert (=> d!82696 (= res!206765 (= lt!385421 (bvsub lt!385419 lt!385420)))))

(assert (=> d!82696 (or (= (bvand lt!385419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385419 lt!385420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82696 (= lt!385420 (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385040)))) ((_ sign_extend 32) (currentByte!11779 (_1!11519 lt!385040))) ((_ sign_extend 32) (currentBit!11774 (_1!11519 lt!385040)))))))

(declare-fun lt!385422 () (_ BitVec 64))

(declare-fun lt!385418 () (_ BitVec 64))

(assert (=> d!82696 (= lt!385419 (bvmul lt!385422 lt!385418))))

(assert (=> d!82696 (or (= lt!385422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385418 (bvsdiv (bvmul lt!385422 lt!385418) lt!385422)))))

(assert (=> d!82696 (= lt!385418 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82696 (= lt!385422 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385040)))))))

(assert (=> d!82696 (= lt!385421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11779 (_1!11519 lt!385040))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11774 (_1!11519 lt!385040)))))))

(assert (=> d!82696 (invariant!0 (currentBit!11774 (_1!11519 lt!385040)) (currentByte!11779 (_1!11519 lt!385040)) (size!5902 (buf!6383 (_1!11519 lt!385040))))))

(assert (=> d!82696 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385040))) (currentByte!11779 (_1!11519 lt!385040)) (currentBit!11774 (_1!11519 lt!385040))) lt!385421)))

(declare-fun b!247089 () Bool)

(declare-fun res!206766 () Bool)

(assert (=> b!247089 (=> (not res!206766) (not e!171168))))

(assert (=> b!247089 (= res!206766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385421))))

(declare-fun b!247090 () Bool)

(declare-fun lt!385417 () (_ BitVec 64))

(assert (=> b!247090 (= e!171168 (bvsle lt!385421 (bvmul lt!385417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247090 (or (= lt!385417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385417)))))

(assert (=> b!247090 (= lt!385417 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385040)))))))

(assert (= (and d!82696 res!206765) b!247089))

(assert (= (and b!247089 res!206766) b!247090))

(declare-fun m!372695 () Bool)

(assert (=> d!82696 m!372695))

(declare-fun m!372697 () Bool)

(assert (=> d!82696 m!372697))

(assert (=> b!246877 d!82696))

(declare-fun d!82698 () Bool)

(declare-fun e!171169 () Bool)

(assert (=> d!82698 e!171169))

(declare-fun res!206767 () Bool)

(assert (=> d!82698 (=> (not res!206767) (not e!171169))))

(declare-fun lt!385427 () (_ BitVec 64))

(declare-fun lt!385425 () (_ BitVec 64))

(declare-fun lt!385426 () (_ BitVec 64))

(assert (=> d!82698 (= res!206767 (= lt!385427 (bvsub lt!385425 lt!385426)))))

(assert (=> d!82698 (or (= (bvand lt!385425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385425 lt!385426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82698 (= lt!385426 (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056)))))))

(declare-fun lt!385428 () (_ BitVec 64))

(declare-fun lt!385424 () (_ BitVec 64))

(assert (=> d!82698 (= lt!385425 (bvmul lt!385428 lt!385424))))

(assert (=> d!82698 (or (= lt!385428 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385424 (bvsdiv (bvmul lt!385428 lt!385424) lt!385428)))))

(assert (=> d!82698 (= lt!385424 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82698 (= lt!385428 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(assert (=> d!82698 (= lt!385427 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056)))))))

(assert (=> d!82698 (invariant!0 (currentBit!11774 (_2!11518 lt!385056)) (currentByte!11779 (_2!11518 lt!385056)) (size!5902 (buf!6383 (_2!11518 lt!385056))))))

(assert (=> d!82698 (= (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))) lt!385427)))

(declare-fun b!247091 () Bool)

(declare-fun res!206768 () Bool)

(assert (=> b!247091 (=> (not res!206768) (not e!171169))))

(assert (=> b!247091 (= res!206768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385427))))

(declare-fun b!247092 () Bool)

(declare-fun lt!385423 () (_ BitVec 64))

(assert (=> b!247092 (= e!171169 (bvsle lt!385427 (bvmul lt!385423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247092 (or (= lt!385423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385423)))))

(assert (=> b!247092 (= lt!385423 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(assert (= (and d!82698 res!206767) b!247091))

(assert (= (and b!247091 res!206768) b!247092))

(declare-fun m!372699 () Bool)

(assert (=> d!82698 m!372699))

(declare-fun m!372701 () Bool)

(assert (=> d!82698 m!372701))

(assert (=> b!246876 d!82698))

(assert (=> b!246876 d!82688))

(declare-fun d!82700 () Bool)

(assert (=> d!82700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11520 lt!385054)))) ((_ sign_extend 32) (currentByte!11779 (_1!11520 lt!385054))) ((_ sign_extend 32) (currentBit!11774 (_1!11520 lt!385054))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11520 lt!385054)))) ((_ sign_extend 32) (currentByte!11779 (_1!11520 lt!385054))) ((_ sign_extend 32) (currentBit!11774 (_1!11520 lt!385054)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20936 () Bool)

(assert (= bs!20936 d!82700))

(declare-fun m!372703 () Bool)

(assert (=> bs!20936 m!372703))

(assert (=> b!246875 d!82700))

(declare-fun d!82702 () Bool)

(declare-fun res!206776 () Bool)

(declare-fun e!171174 () Bool)

(assert (=> d!82702 (=> (not res!206776) (not e!171174))))

(assert (=> d!82702 (= res!206776 (= (size!5902 (buf!6383 thiss!1005)) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(assert (=> d!82702 (= (isPrefixOf!0 thiss!1005 (_2!11518 lt!385056)) e!171174)))

(declare-fun b!247099 () Bool)

(declare-fun res!206777 () Bool)

(assert (=> b!247099 (=> (not res!206777) (not e!171174))))

(assert (=> b!247099 (= res!206777 (bvsle (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)) (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056)))))))

(declare-fun b!247100 () Bool)

(declare-fun e!171175 () Bool)

(assert (=> b!247100 (= e!171174 e!171175)))

(declare-fun res!206775 () Bool)

(assert (=> b!247100 (=> res!206775 e!171175)))

(assert (=> b!247100 (= res!206775 (= (size!5902 (buf!6383 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247101 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13460 array!13460 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247101 (= e!171175 (arrayBitRangesEq!0 (buf!6383 thiss!1005) (buf!6383 (_2!11518 lt!385056)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005))))))

(assert (= (and d!82702 res!206776) b!247099))

(assert (= (and b!247099 res!206777) b!247100))

(assert (= (and b!247100 (not res!206775)) b!247101))

(assert (=> b!247099 m!372297))

(assert (=> b!247099 m!372295))

(assert (=> b!247101 m!372297))

(assert (=> b!247101 m!372297))

(declare-fun m!372705 () Bool)

(assert (=> b!247101 m!372705))

(assert (=> b!246874 d!82702))

(declare-fun d!82704 () Bool)

(declare-fun e!171178 () Bool)

(assert (=> d!82704 e!171178))

(declare-fun res!206780 () Bool)

(assert (=> d!82704 (=> (not res!206780) (not e!171178))))

(declare-fun lt!385434 () (_ BitVec 64))

(declare-fun lt!385433 () BitStream!10726)

(assert (=> d!82704 (= res!206780 (= (bvadd lt!385434 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5902 (buf!6383 lt!385433)) (currentByte!11779 lt!385433) (currentBit!11774 lt!385433))))))

(assert (=> d!82704 (or (not (= (bvand lt!385434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385434 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82704 (= lt!385434 (bitIndex!0 (size!5902 (buf!6383 (_1!11520 lt!385054))) (currentByte!11779 (_1!11520 lt!385054)) (currentBit!11774 (_1!11520 lt!385054))))))

(declare-fun moveBitIndex!0 (BitStream!10726 (_ BitVec 64)) tuple2!21192)

(assert (=> d!82704 (= lt!385433 (_2!11518 (moveBitIndex!0 (_1!11520 lt!385054) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10726 (_ BitVec 64)) Bool)

(assert (=> d!82704 (moveBitIndexPrecond!0 (_1!11520 lt!385054) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!82704 (= (withMovedBitIndex!0 (_1!11520 lt!385054) #b0000000000000000000000000000000000000000000000000000000000000001) lt!385433)))

(declare-fun b!247104 () Bool)

(assert (=> b!247104 (= e!171178 (= (size!5902 (buf!6383 (_1!11520 lt!385054))) (size!5902 (buf!6383 lt!385433))))))

(assert (= (and d!82704 res!206780) b!247104))

(declare-fun m!372707 () Bool)

(assert (=> d!82704 m!372707))

(declare-fun m!372709 () Bool)

(assert (=> d!82704 m!372709))

(declare-fun m!372711 () Bool)

(assert (=> d!82704 m!372711))

(declare-fun m!372713 () Bool)

(assert (=> d!82704 m!372713))

(assert (=> b!246884 d!82704))

(declare-fun d!82706 () Bool)

(assert (=> d!82706 (= (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385048)))) (and (bvsge (currentBit!11774 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11774 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11779 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385048)))) (and (= (currentBit!11774 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385048))))))))))

(assert (=> b!246873 d!82706))

(declare-fun d!82708 () Bool)

(declare-fun res!206782 () Bool)

(declare-fun e!171179 () Bool)

(assert (=> d!82708 (=> (not res!206782) (not e!171179))))

(assert (=> d!82708 (= res!206782 (= (size!5902 (buf!6383 (_2!11518 lt!385056))) (size!5902 (buf!6383 (_2!11518 lt!385048)))))))

(assert (=> d!82708 (= (isPrefixOf!0 (_2!11518 lt!385056) (_2!11518 lt!385048)) e!171179)))

(declare-fun b!247105 () Bool)

(declare-fun res!206783 () Bool)

(assert (=> b!247105 (=> (not res!206783) (not e!171179))))

(assert (=> b!247105 (= res!206783 (bvsle (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))) (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048)))))))

(declare-fun b!247106 () Bool)

(declare-fun e!171180 () Bool)

(assert (=> b!247106 (= e!171179 e!171180)))

(declare-fun res!206781 () Bool)

(assert (=> b!247106 (=> res!206781 e!171180)))

(assert (=> b!247106 (= res!206781 (= (size!5902 (buf!6383 (_2!11518 lt!385056))) #b00000000000000000000000000000000))))

(declare-fun b!247107 () Bool)

(assert (=> b!247107 (= e!171180 (arrayBitRangesEq!0 (buf!6383 (_2!11518 lt!385056)) (buf!6383 (_2!11518 lt!385048)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056)))))))

(assert (= (and d!82708 res!206782) b!247105))

(assert (= (and b!247105 res!206783) b!247106))

(assert (= (and b!247106 (not res!206781)) b!247107))

(assert (=> b!247105 m!372295))

(assert (=> b!247105 m!372293))

(assert (=> b!247107 m!372295))

(assert (=> b!247107 m!372295))

(declare-fun m!372715 () Bool)

(assert (=> b!247107 m!372715))

(assert (=> b!246883 d!82708))

(declare-datatypes ((tuple2!21212 0))(
  ( (tuple2!21213 (_1!11528 Bool) (_2!11528 BitStream!10726)) )
))
(declare-fun lt!385437 () tuple2!21212)

(declare-fun d!82710 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10726 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21212)

(assert (=> d!82710 (= lt!385437 (checkBitsLoop!0 (_1!11520 lt!385053) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82710 (= (checkBitsLoopPure!0 (_1!11520 lt!385053) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21195 (_2!11528 lt!385437) (_1!11528 lt!385437)))))

(declare-fun bs!20937 () Bool)

(assert (= bs!20937 d!82710))

(declare-fun m!372717 () Bool)

(assert (=> bs!20937 m!372717))

(assert (=> b!246882 d!82710))

(declare-fun d!82712 () Bool)

(assert (=> d!82712 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385039) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056)))) lt!385039))))

(declare-fun bs!20938 () Bool)

(assert (= bs!20938 d!82712))

(declare-fun m!372719 () Bool)

(assert (=> bs!20938 m!372719))

(assert (=> b!246882 d!82712))

(declare-fun d!82714 () Bool)

(assert (=> d!82714 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385039)))

(declare-fun lt!385440 () Unit!17916)

(declare-fun choose!9 (BitStream!10726 array!13460 (_ BitVec 64) BitStream!10726) Unit!17916)

(assert (=> d!82714 (= lt!385440 (choose!9 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385048)) lt!385039 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056)))))))

(assert (=> d!82714 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385048)) lt!385039) lt!385440)))

(declare-fun bs!20939 () Bool)

(assert (= bs!20939 d!82714))

(assert (=> bs!20939 m!372307))

(declare-fun m!372721 () Bool)

(assert (=> bs!20939 m!372721))

(assert (=> b!246882 d!82714))

(declare-fun b!247118 () Bool)

(declare-fun e!171186 () Unit!17916)

(declare-fun Unit!17924 () Unit!17916)

(assert (=> b!247118 (= e!171186 Unit!17924)))

(declare-fun b!247119 () Bool)

(declare-fun lt!385493 () Unit!17916)

(assert (=> b!247119 (= e!171186 lt!385493)))

(declare-fun lt!385499 () (_ BitVec 64))

(assert (=> b!247119 (= lt!385499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!385500 () (_ BitVec 64))

(assert (=> b!247119 (= lt!385500 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13460 array!13460 (_ BitVec 64) (_ BitVec 64)) Unit!17916)

(assert (=> b!247119 (= lt!385493 (arrayBitRangesEqSymmetric!0 (buf!6383 (_2!11518 lt!385056)) (buf!6383 (_2!11518 lt!385048)) lt!385499 lt!385500))))

(assert (=> b!247119 (arrayBitRangesEq!0 (buf!6383 (_2!11518 lt!385048)) (buf!6383 (_2!11518 lt!385056)) lt!385499 lt!385500)))

(declare-fun b!247120 () Bool)

(declare-fun res!206792 () Bool)

(declare-fun e!171185 () Bool)

(assert (=> b!247120 (=> (not res!206792) (not e!171185))))

(declare-fun lt!385488 () tuple2!21196)

(assert (=> b!247120 (= res!206792 (isPrefixOf!0 (_1!11520 lt!385488) (_2!11518 lt!385056)))))

(declare-fun d!82716 () Bool)

(assert (=> d!82716 e!171185))

(declare-fun res!206790 () Bool)

(assert (=> d!82716 (=> (not res!206790) (not e!171185))))

(assert (=> d!82716 (= res!206790 (isPrefixOf!0 (_1!11520 lt!385488) (_2!11520 lt!385488)))))

(declare-fun lt!385498 () BitStream!10726)

(assert (=> d!82716 (= lt!385488 (tuple2!21197 lt!385498 (_2!11518 lt!385048)))))

(declare-fun lt!385485 () Unit!17916)

(declare-fun lt!385495 () Unit!17916)

(assert (=> d!82716 (= lt!385485 lt!385495)))

(assert (=> d!82716 (isPrefixOf!0 lt!385498 (_2!11518 lt!385048))))

(assert (=> d!82716 (= lt!385495 (lemmaIsPrefixTransitive!0 lt!385498 (_2!11518 lt!385048) (_2!11518 lt!385048)))))

(declare-fun lt!385489 () Unit!17916)

(declare-fun lt!385487 () Unit!17916)

(assert (=> d!82716 (= lt!385489 lt!385487)))

(assert (=> d!82716 (isPrefixOf!0 lt!385498 (_2!11518 lt!385048))))

(assert (=> d!82716 (= lt!385487 (lemmaIsPrefixTransitive!0 lt!385498 (_2!11518 lt!385056) (_2!11518 lt!385048)))))

(declare-fun lt!385492 () Unit!17916)

(assert (=> d!82716 (= lt!385492 e!171186)))

(declare-fun c!11507 () Bool)

(assert (=> d!82716 (= c!11507 (not (= (size!5902 (buf!6383 (_2!11518 lt!385056))) #b00000000000000000000000000000000)))))

(declare-fun lt!385484 () Unit!17916)

(declare-fun lt!385491 () Unit!17916)

(assert (=> d!82716 (= lt!385484 lt!385491)))

(assert (=> d!82716 (isPrefixOf!0 (_2!11518 lt!385048) (_2!11518 lt!385048))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10726) Unit!17916)

(assert (=> d!82716 (= lt!385491 (lemmaIsPrefixRefl!0 (_2!11518 lt!385048)))))

(declare-fun lt!385481 () Unit!17916)

(declare-fun lt!385490 () Unit!17916)

(assert (=> d!82716 (= lt!385481 lt!385490)))

(assert (=> d!82716 (= lt!385490 (lemmaIsPrefixRefl!0 (_2!11518 lt!385048)))))

(declare-fun lt!385482 () Unit!17916)

(declare-fun lt!385486 () Unit!17916)

(assert (=> d!82716 (= lt!385482 lt!385486)))

(assert (=> d!82716 (isPrefixOf!0 lt!385498 lt!385498)))

(assert (=> d!82716 (= lt!385486 (lemmaIsPrefixRefl!0 lt!385498))))

(declare-fun lt!385494 () Unit!17916)

(declare-fun lt!385483 () Unit!17916)

(assert (=> d!82716 (= lt!385494 lt!385483)))

(assert (=> d!82716 (isPrefixOf!0 (_2!11518 lt!385056) (_2!11518 lt!385056))))

(assert (=> d!82716 (= lt!385483 (lemmaIsPrefixRefl!0 (_2!11518 lt!385056)))))

(assert (=> d!82716 (= lt!385498 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))))))

(assert (=> d!82716 (isPrefixOf!0 (_2!11518 lt!385056) (_2!11518 lt!385048))))

(assert (=> d!82716 (= (reader!0 (_2!11518 lt!385056) (_2!11518 lt!385048)) lt!385488)))

(declare-fun b!247121 () Bool)

(declare-fun res!206791 () Bool)

(assert (=> b!247121 (=> (not res!206791) (not e!171185))))

(assert (=> b!247121 (= res!206791 (isPrefixOf!0 (_2!11520 lt!385488) (_2!11518 lt!385048)))))

(declare-fun lt!385497 () (_ BitVec 64))

(declare-fun lt!385496 () (_ BitVec 64))

(declare-fun b!247122 () Bool)

(assert (=> b!247122 (= e!171185 (= (_1!11520 lt!385488) (withMovedBitIndex!0 (_2!11520 lt!385488) (bvsub lt!385497 lt!385496))))))

(assert (=> b!247122 (or (= (bvand lt!385497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385497 lt!385496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247122 (= lt!385496 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048))))))

(assert (=> b!247122 (= lt!385497 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))))))

(assert (= (and d!82716 c!11507) b!247119))

(assert (= (and d!82716 (not c!11507)) b!247118))

(assert (= (and d!82716 res!206790) b!247120))

(assert (= (and b!247120 res!206792) b!247121))

(assert (= (and b!247121 res!206791) b!247122))

(declare-fun m!372723 () Bool)

(assert (=> b!247120 m!372723))

(assert (=> b!247119 m!372295))

(declare-fun m!372725 () Bool)

(assert (=> b!247119 m!372725))

(declare-fun m!372727 () Bool)

(assert (=> b!247119 m!372727))

(declare-fun m!372729 () Bool)

(assert (=> b!247121 m!372729))

(declare-fun m!372731 () Bool)

(assert (=> b!247122 m!372731))

(assert (=> b!247122 m!372293))

(assert (=> b!247122 m!372295))

(declare-fun m!372733 () Bool)

(assert (=> d!82716 m!372733))

(declare-fun m!372735 () Bool)

(assert (=> d!82716 m!372735))

(declare-fun m!372737 () Bool)

(assert (=> d!82716 m!372737))

(declare-fun m!372739 () Bool)

(assert (=> d!82716 m!372739))

(declare-fun m!372741 () Bool)

(assert (=> d!82716 m!372741))

(declare-fun m!372743 () Bool)

(assert (=> d!82716 m!372743))

(declare-fun m!372745 () Bool)

(assert (=> d!82716 m!372745))

(declare-fun m!372747 () Bool)

(assert (=> d!82716 m!372747))

(declare-fun m!372749 () Bool)

(assert (=> d!82716 m!372749))

(declare-fun m!372751 () Bool)

(assert (=> d!82716 m!372751))

(assert (=> d!82716 m!372355))

(assert (=> b!246882 d!82716))

(assert (=> b!246871 d!82686))

(assert (=> b!246871 d!82698))

(declare-fun d!82718 () Bool)

(assert (=> d!82718 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385035)))

(declare-fun lt!385501 () Unit!17916)

(assert (=> d!82718 (= lt!385501 (choose!9 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385048)) lt!385035 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056)))))))

(assert (=> d!82718 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385048)) lt!385035) lt!385501)))

(declare-fun bs!20940 () Bool)

(assert (= bs!20940 d!82718))

(assert (=> bs!20940 m!372327))

(declare-fun m!372753 () Bool)

(assert (=> bs!20940 m!372753))

(assert (=> b!246881 d!82718))

(declare-fun d!82720 () Bool)

(assert (=> d!82720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385035) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056)))) lt!385035))))

(declare-fun bs!20941 () Bool)

(assert (= bs!20941 d!82720))

(assert (=> bs!20941 m!372719))

(assert (=> b!246881 d!82720))

(declare-fun b!247123 () Bool)

(declare-fun e!171188 () Unit!17916)

(declare-fun Unit!17925 () Unit!17916)

(assert (=> b!247123 (= e!171188 Unit!17925)))

(declare-fun b!247124 () Bool)

(declare-fun lt!385514 () Unit!17916)

(assert (=> b!247124 (= e!171188 lt!385514)))

(declare-fun lt!385520 () (_ BitVec 64))

(assert (=> b!247124 (= lt!385520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!385521 () (_ BitVec 64))

(assert (=> b!247124 (= lt!385521 (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(assert (=> b!247124 (= lt!385514 (arrayBitRangesEqSymmetric!0 (buf!6383 thiss!1005) (buf!6383 (_2!11518 lt!385048)) lt!385520 lt!385521))))

(assert (=> b!247124 (arrayBitRangesEq!0 (buf!6383 (_2!11518 lt!385048)) (buf!6383 thiss!1005) lt!385520 lt!385521)))

(declare-fun b!247125 () Bool)

(declare-fun res!206795 () Bool)

(declare-fun e!171187 () Bool)

(assert (=> b!247125 (=> (not res!206795) (not e!171187))))

(declare-fun lt!385509 () tuple2!21196)

(assert (=> b!247125 (= res!206795 (isPrefixOf!0 (_1!11520 lt!385509) thiss!1005))))

(declare-fun d!82722 () Bool)

(assert (=> d!82722 e!171187))

(declare-fun res!206793 () Bool)

(assert (=> d!82722 (=> (not res!206793) (not e!171187))))

(assert (=> d!82722 (= res!206793 (isPrefixOf!0 (_1!11520 lt!385509) (_2!11520 lt!385509)))))

(declare-fun lt!385519 () BitStream!10726)

(assert (=> d!82722 (= lt!385509 (tuple2!21197 lt!385519 (_2!11518 lt!385048)))))

(declare-fun lt!385506 () Unit!17916)

(declare-fun lt!385516 () Unit!17916)

(assert (=> d!82722 (= lt!385506 lt!385516)))

(assert (=> d!82722 (isPrefixOf!0 lt!385519 (_2!11518 lt!385048))))

(assert (=> d!82722 (= lt!385516 (lemmaIsPrefixTransitive!0 lt!385519 (_2!11518 lt!385048) (_2!11518 lt!385048)))))

(declare-fun lt!385510 () Unit!17916)

(declare-fun lt!385508 () Unit!17916)

(assert (=> d!82722 (= lt!385510 lt!385508)))

(assert (=> d!82722 (isPrefixOf!0 lt!385519 (_2!11518 lt!385048))))

(assert (=> d!82722 (= lt!385508 (lemmaIsPrefixTransitive!0 lt!385519 thiss!1005 (_2!11518 lt!385048)))))

(declare-fun lt!385513 () Unit!17916)

(assert (=> d!82722 (= lt!385513 e!171188)))

(declare-fun c!11508 () Bool)

(assert (=> d!82722 (= c!11508 (not (= (size!5902 (buf!6383 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!385505 () Unit!17916)

(declare-fun lt!385512 () Unit!17916)

(assert (=> d!82722 (= lt!385505 lt!385512)))

(assert (=> d!82722 (isPrefixOf!0 (_2!11518 lt!385048) (_2!11518 lt!385048))))

(assert (=> d!82722 (= lt!385512 (lemmaIsPrefixRefl!0 (_2!11518 lt!385048)))))

(declare-fun lt!385502 () Unit!17916)

(declare-fun lt!385511 () Unit!17916)

(assert (=> d!82722 (= lt!385502 lt!385511)))

(assert (=> d!82722 (= lt!385511 (lemmaIsPrefixRefl!0 (_2!11518 lt!385048)))))

(declare-fun lt!385503 () Unit!17916)

(declare-fun lt!385507 () Unit!17916)

(assert (=> d!82722 (= lt!385503 lt!385507)))

(assert (=> d!82722 (isPrefixOf!0 lt!385519 lt!385519)))

(assert (=> d!82722 (= lt!385507 (lemmaIsPrefixRefl!0 lt!385519))))

(declare-fun lt!385515 () Unit!17916)

(declare-fun lt!385504 () Unit!17916)

(assert (=> d!82722 (= lt!385515 lt!385504)))

(assert (=> d!82722 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82722 (= lt!385504 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82722 (= lt!385519 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(assert (=> d!82722 (isPrefixOf!0 thiss!1005 (_2!11518 lt!385048))))

(assert (=> d!82722 (= (reader!0 thiss!1005 (_2!11518 lt!385048)) lt!385509)))

(declare-fun b!247126 () Bool)

(declare-fun res!206794 () Bool)

(assert (=> b!247126 (=> (not res!206794) (not e!171187))))

(assert (=> b!247126 (= res!206794 (isPrefixOf!0 (_2!11520 lt!385509) (_2!11518 lt!385048)))))

(declare-fun b!247127 () Bool)

(declare-fun lt!385518 () (_ BitVec 64))

(declare-fun lt!385517 () (_ BitVec 64))

(assert (=> b!247127 (= e!171187 (= (_1!11520 lt!385509) (withMovedBitIndex!0 (_2!11520 lt!385509) (bvsub lt!385518 lt!385517))))))

(assert (=> b!247127 (or (= (bvand lt!385518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385517 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385518 lt!385517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247127 (= lt!385517 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048))))))

(assert (=> b!247127 (= lt!385518 (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(assert (= (and d!82722 c!11508) b!247124))

(assert (= (and d!82722 (not c!11508)) b!247123))

(assert (= (and d!82722 res!206793) b!247125))

(assert (= (and b!247125 res!206795) b!247126))

(assert (= (and b!247126 res!206794) b!247127))

(declare-fun m!372755 () Bool)

(assert (=> b!247125 m!372755))

(assert (=> b!247124 m!372297))

(declare-fun m!372757 () Bool)

(assert (=> b!247124 m!372757))

(declare-fun m!372759 () Bool)

(assert (=> b!247124 m!372759))

(declare-fun m!372761 () Bool)

(assert (=> b!247126 m!372761))

(declare-fun m!372763 () Bool)

(assert (=> b!247127 m!372763))

(assert (=> b!247127 m!372293))

(assert (=> b!247127 m!372297))

(declare-fun m!372765 () Bool)

(assert (=> d!82722 m!372765))

(declare-fun m!372767 () Bool)

(assert (=> d!82722 m!372767))

(declare-fun m!372769 () Bool)

(assert (=> d!82722 m!372769))

(assert (=> d!82722 m!372739))

(declare-fun m!372771 () Bool)

(assert (=> d!82722 m!372771))

(declare-fun m!372773 () Bool)

(assert (=> d!82722 m!372773))

(declare-fun m!372775 () Bool)

(assert (=> d!82722 m!372775))

(declare-fun m!372777 () Bool)

(assert (=> d!82722 m!372777))

(declare-fun m!372779 () Bool)

(assert (=> d!82722 m!372779))

(assert (=> d!82722 m!372751))

(assert (=> d!82722 m!372329))

(assert (=> b!246881 d!82722))

(declare-fun d!82724 () Bool)

(declare-fun res!206797 () Bool)

(declare-fun e!171189 () Bool)

(assert (=> d!82724 (=> (not res!206797) (not e!171189))))

(assert (=> d!82724 (= res!206797 (= (size!5902 (buf!6383 thiss!1005)) (size!5902 (buf!6383 (_2!11518 lt!385048)))))))

(assert (=> d!82724 (= (isPrefixOf!0 thiss!1005 (_2!11518 lt!385048)) e!171189)))

(declare-fun b!247128 () Bool)

(declare-fun res!206798 () Bool)

(assert (=> b!247128 (=> (not res!206798) (not e!171189))))

(assert (=> b!247128 (= res!206798 (bvsle (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)) (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385048))) (currentByte!11779 (_2!11518 lt!385048)) (currentBit!11774 (_2!11518 lt!385048)))))))

(declare-fun b!247129 () Bool)

(declare-fun e!171190 () Bool)

(assert (=> b!247129 (= e!171189 e!171190)))

(declare-fun res!206796 () Bool)

(assert (=> b!247129 (=> res!206796 e!171190)))

(assert (=> b!247129 (= res!206796 (= (size!5902 (buf!6383 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247130 () Bool)

(assert (=> b!247130 (= e!171190 (arrayBitRangesEq!0 (buf!6383 thiss!1005) (buf!6383 (_2!11518 lt!385048)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005))))))

(assert (= (and d!82724 res!206797) b!247128))

(assert (= (and b!247128 res!206798) b!247129))

(assert (= (and b!247129 (not res!206796)) b!247130))

(assert (=> b!247128 m!372297))

(assert (=> b!247128 m!372293))

(assert (=> b!247130 m!372297))

(assert (=> b!247130 m!372297))

(declare-fun m!372781 () Bool)

(assert (=> b!247130 m!372781))

(assert (=> b!246881 d!82724))

(declare-fun d!82726 () Bool)

(declare-fun e!171196 () Bool)

(assert (=> d!82726 e!171196))

(declare-fun res!206807 () Bool)

(assert (=> d!82726 (=> (not res!206807) (not e!171196))))

(declare-fun lt!385531 () tuple2!21192)

(assert (=> d!82726 (= res!206807 (= (size!5902 (buf!6383 thiss!1005)) (size!5902 (buf!6383 (_2!11518 lt!385531)))))))

(declare-fun choose!16 (BitStream!10726 Bool) tuple2!21192)

(assert (=> d!82726 (= lt!385531 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82726 (validate_offset_bit!0 ((_ sign_extend 32) (size!5902 (buf!6383 thiss!1005))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005)))))

(assert (=> d!82726 (= (appendBit!0 thiss!1005 bit!26) lt!385531)))

(declare-fun b!247143 () Bool)

(declare-fun e!171195 () Bool)

(declare-fun lt!385530 () tuple2!21194)

(assert (=> b!247143 (= e!171195 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385530))) (currentByte!11779 (_1!11519 lt!385530)) (currentBit!11774 (_1!11519 lt!385530))) (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385531))) (currentByte!11779 (_2!11518 lt!385531)) (currentBit!11774 (_2!11518 lt!385531)))))))

(declare-fun b!247141 () Bool)

(declare-fun res!206810 () Bool)

(assert (=> b!247141 (=> (not res!206810) (not e!171196))))

(assert (=> b!247141 (= res!206810 (isPrefixOf!0 thiss!1005 (_2!11518 lt!385531)))))

(declare-fun b!247142 () Bool)

(assert (=> b!247142 (= e!171196 e!171195)))

(declare-fun res!206808 () Bool)

(assert (=> b!247142 (=> (not res!206808) (not e!171195))))

(assert (=> b!247142 (= res!206808 (and (= (_2!11519 lt!385530) bit!26) (= (_1!11519 lt!385530) (_2!11518 lt!385531))))))

(assert (=> b!247142 (= lt!385530 (readBitPure!0 (readerFrom!0 (_2!11518 lt!385531) (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005))))))

(declare-fun b!247140 () Bool)

(declare-fun res!206809 () Bool)

(assert (=> b!247140 (=> (not res!206809) (not e!171196))))

(declare-fun lt!385532 () (_ BitVec 64))

(declare-fun lt!385533 () (_ BitVec 64))

(assert (=> b!247140 (= res!206809 (= (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385531))) (currentByte!11779 (_2!11518 lt!385531)) (currentBit!11774 (_2!11518 lt!385531))) (bvadd lt!385532 lt!385533)))))

(assert (=> b!247140 (or (not (= (bvand lt!385532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385533 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385532 lt!385533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247140 (= lt!385533 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!247140 (= lt!385532 (bitIndex!0 (size!5902 (buf!6383 thiss!1005)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(assert (= (and d!82726 res!206807) b!247140))

(assert (= (and b!247140 res!206809) b!247141))

(assert (= (and b!247141 res!206810) b!247142))

(assert (= (and b!247142 res!206808) b!247143))

(declare-fun m!372783 () Bool)

(assert (=> b!247143 m!372783))

(declare-fun m!372785 () Bool)

(assert (=> b!247143 m!372785))

(declare-fun m!372787 () Bool)

(assert (=> b!247142 m!372787))

(assert (=> b!247142 m!372787))

(declare-fun m!372789 () Bool)

(assert (=> b!247142 m!372789))

(declare-fun m!372791 () Bool)

(assert (=> d!82726 m!372791))

(declare-fun m!372793 () Bool)

(assert (=> d!82726 m!372793))

(declare-fun m!372795 () Bool)

(assert (=> b!247141 m!372795))

(assert (=> b!247140 m!372785))

(assert (=> b!247140 m!372297))

(assert (=> b!246881 d!82726))

(declare-fun d!82728 () Bool)

(declare-fun lt!385536 () tuple2!21212)

(declare-fun readBit!0 (BitStream!10726) tuple2!21212)

(assert (=> d!82728 (= lt!385536 (readBit!0 (_1!11520 lt!385054)))))

(assert (=> d!82728 (= (readBitPure!0 (_1!11520 lt!385054)) (tuple2!21195 (_2!11528 lt!385536) (_1!11528 lt!385536)))))

(declare-fun bs!20942 () Bool)

(assert (= bs!20942 d!82728))

(declare-fun m!372797 () Bool)

(assert (=> bs!20942 m!372797))

(assert (=> b!246881 d!82728))

(declare-fun d!82730 () Bool)

(assert (=> d!82730 (isPrefixOf!0 thiss!1005 (_2!11518 lt!385048))))

(declare-fun lt!385539 () Unit!17916)

(declare-fun choose!30 (BitStream!10726 BitStream!10726 BitStream!10726) Unit!17916)

(assert (=> d!82730 (= lt!385539 (choose!30 thiss!1005 (_2!11518 lt!385056) (_2!11518 lt!385048)))))

(assert (=> d!82730 (isPrefixOf!0 thiss!1005 (_2!11518 lt!385056))))

(assert (=> d!82730 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11518 lt!385056) (_2!11518 lt!385048)) lt!385539)))

(declare-fun bs!20943 () Bool)

(assert (= bs!20943 d!82730))

(assert (=> bs!20943 m!372329))

(declare-fun m!372799 () Bool)

(assert (=> bs!20943 m!372799))

(assert (=> bs!20943 m!372301))

(assert (=> b!246881 d!82730))

(declare-fun lt!385540 () tuple2!21212)

(declare-fun d!82732 () Bool)

(assert (=> d!82732 (= lt!385540 (checkBitsLoop!0 (_1!11520 lt!385054) nBits!297 bit!26 from!289))))

(assert (=> d!82732 (= (checkBitsLoopPure!0 (_1!11520 lt!385054) nBits!297 bit!26 from!289) (tuple2!21195 (_2!11528 lt!385540) (_1!11528 lt!385540)))))

(declare-fun bs!20944 () Bool)

(assert (= bs!20944 d!82732))

(declare-fun m!372801 () Bool)

(assert (=> bs!20944 m!372801))

(assert (=> b!246881 d!82732))

(declare-fun d!82734 () Bool)

(declare-fun e!171197 () Bool)

(assert (=> d!82734 e!171197))

(declare-fun res!206811 () Bool)

(assert (=> d!82734 (=> (not res!206811) (not e!171197))))

(declare-fun lt!385544 () (_ BitVec 64))

(declare-fun lt!385545 () (_ BitVec 64))

(declare-fun lt!385543 () (_ BitVec 64))

(assert (=> d!82734 (= res!206811 (= lt!385545 (bvsub lt!385543 lt!385544)))))

(assert (=> d!82734 (or (= (bvand lt!385543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385543 lt!385544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82734 (= lt!385544 (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385052)))) ((_ sign_extend 32) (currentByte!11779 (_1!11519 lt!385052))) ((_ sign_extend 32) (currentBit!11774 (_1!11519 lt!385052)))))))

(declare-fun lt!385546 () (_ BitVec 64))

(declare-fun lt!385542 () (_ BitVec 64))

(assert (=> d!82734 (= lt!385543 (bvmul lt!385546 lt!385542))))

(assert (=> d!82734 (or (= lt!385546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385542 (bvsdiv (bvmul lt!385546 lt!385542) lt!385546)))))

(assert (=> d!82734 (= lt!385542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82734 (= lt!385546 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385052)))))))

(assert (=> d!82734 (= lt!385545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11779 (_1!11519 lt!385052))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11774 (_1!11519 lt!385052)))))))

(assert (=> d!82734 (invariant!0 (currentBit!11774 (_1!11519 lt!385052)) (currentByte!11779 (_1!11519 lt!385052)) (size!5902 (buf!6383 (_1!11519 lt!385052))))))

(assert (=> d!82734 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385052))) (currentByte!11779 (_1!11519 lt!385052)) (currentBit!11774 (_1!11519 lt!385052))) lt!385545)))

(declare-fun b!247144 () Bool)

(declare-fun res!206812 () Bool)

(assert (=> b!247144 (=> (not res!206812) (not e!171197))))

(assert (=> b!247144 (= res!206812 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385545))))

(declare-fun b!247145 () Bool)

(declare-fun lt!385541 () (_ BitVec 64))

(assert (=> b!247145 (= e!171197 (bvsle lt!385545 (bvmul lt!385541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247145 (or (= lt!385541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385541)))))

(assert (=> b!247145 (= lt!385541 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385052)))))))

(assert (= (and d!82734 res!206811) b!247144))

(assert (= (and b!247144 res!206812) b!247145))

(declare-fun m!372803 () Bool)

(assert (=> d!82734 m!372803))

(declare-fun m!372805 () Bool)

(assert (=> d!82734 m!372805))

(assert (=> b!246881 d!82734))

(declare-fun d!82736 () Bool)

(declare-fun e!171198 () Bool)

(assert (=> d!82736 e!171198))

(declare-fun res!206813 () Bool)

(assert (=> d!82736 (=> (not res!206813) (not e!171198))))

(declare-fun lt!385551 () (_ BitVec 64))

(declare-fun lt!385550 () (_ BitVec 64))

(declare-fun lt!385549 () (_ BitVec 64))

(assert (=> d!82736 (= res!206813 (= lt!385551 (bvsub lt!385549 lt!385550)))))

(assert (=> d!82736 (or (= (bvand lt!385549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385549 lt!385550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82736 (= lt!385550 (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385036)))) ((_ sign_extend 32) (currentByte!11779 (_1!11519 lt!385036))) ((_ sign_extend 32) (currentBit!11774 (_1!11519 lt!385036)))))))

(declare-fun lt!385552 () (_ BitVec 64))

(declare-fun lt!385548 () (_ BitVec 64))

(assert (=> d!82736 (= lt!385549 (bvmul lt!385552 lt!385548))))

(assert (=> d!82736 (or (= lt!385552 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385548 (bvsdiv (bvmul lt!385552 lt!385548) lt!385552)))))

(assert (=> d!82736 (= lt!385548 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82736 (= lt!385552 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385036)))))))

(assert (=> d!82736 (= lt!385551 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11779 (_1!11519 lt!385036))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11774 (_1!11519 lt!385036)))))))

(assert (=> d!82736 (invariant!0 (currentBit!11774 (_1!11519 lt!385036)) (currentByte!11779 (_1!11519 lt!385036)) (size!5902 (buf!6383 (_1!11519 lt!385036))))))

(assert (=> d!82736 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385036))) (currentByte!11779 (_1!11519 lt!385036)) (currentBit!11774 (_1!11519 lt!385036))) lt!385551)))

(declare-fun b!247146 () Bool)

(declare-fun res!206814 () Bool)

(assert (=> b!247146 (=> (not res!206814) (not e!171198))))

(assert (=> b!247146 (= res!206814 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385551))))

(declare-fun b!247147 () Bool)

(declare-fun lt!385547 () (_ BitVec 64))

(assert (=> b!247147 (= e!171198 (bvsle lt!385551 (bvmul lt!385547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247147 (or (= lt!385547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385547)))))

(assert (=> b!247147 (= lt!385547 ((_ sign_extend 32) (size!5902 (buf!6383 (_1!11519 lt!385036)))))))

(assert (= (and d!82736 res!206813) b!247146))

(assert (= (and b!247146 res!206814) b!247147))

(declare-fun m!372807 () Bool)

(assert (=> d!82736 m!372807))

(declare-fun m!372809 () Bool)

(assert (=> d!82736 m!372809))

(assert (=> b!246881 d!82736))

(declare-fun d!82738 () Bool)

(assert (=> d!82738 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20945 () Bool)

(assert (= bs!20945 d!82738))

(declare-fun m!372811 () Bool)

(assert (=> bs!20945 m!372811))

(assert (=> b!246881 d!82738))

(declare-fun lt!385553 () tuple2!21212)

(declare-fun d!82740 () Bool)

(assert (=> d!82740 (= lt!385553 (checkBitsLoop!0 (_1!11520 lt!385045) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82740 (= (checkBitsLoopPure!0 (_1!11520 lt!385045) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21195 (_2!11528 lt!385553) (_1!11528 lt!385553)))))

(declare-fun bs!20946 () Bool)

(assert (= bs!20946 d!82740))

(declare-fun m!372813 () Bool)

(assert (=> bs!20946 m!372813))

(assert (=> b!246881 d!82740))

(declare-fun d!82742 () Bool)

(declare-fun e!171201 () Bool)

(assert (=> d!82742 e!171201))

(declare-fun res!206817 () Bool)

(assert (=> d!82742 (=> (not res!206817) (not e!171201))))

(assert (=> d!82742 (= res!206817 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!385556 () Unit!17916)

(declare-fun choose!27 (BitStream!10726 BitStream!10726 (_ BitVec 64) (_ BitVec 64)) Unit!17916)

(assert (=> d!82742 (= lt!385556 (choose!27 thiss!1005 (_2!11518 lt!385056) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82742 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11518 lt!385056) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!385556)))

(declare-fun b!247150 () Bool)

(assert (=> b!247150 (= e!171201 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82742 res!206817) b!247150))

(declare-fun m!372815 () Bool)

(assert (=> d!82742 m!372815))

(declare-fun m!372817 () Bool)

(assert (=> b!247150 m!372817))

(assert (=> b!246881 d!82742))

(declare-fun d!82744 () Bool)

(declare-fun e!171204 () Bool)

(assert (=> d!82744 e!171204))

(declare-fun res!206820 () Bool)

(assert (=> d!82744 (=> (not res!206820) (not e!171204))))

(declare-fun lt!385565 () tuple2!21194)

(declare-fun lt!385568 () tuple2!21194)

(assert (=> d!82744 (= res!206820 (= (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385565))) (currentByte!11779 (_1!11519 lt!385565)) (currentBit!11774 (_1!11519 lt!385565))) (bitIndex!0 (size!5902 (buf!6383 (_1!11519 lt!385568))) (currentByte!11779 (_1!11519 lt!385568)) (currentBit!11774 (_1!11519 lt!385568)))))))

(declare-fun lt!385567 () Unit!17916)

(declare-fun lt!385566 () BitStream!10726)

(declare-fun choose!50 (BitStream!10726 BitStream!10726 BitStream!10726 tuple2!21194 tuple2!21194 BitStream!10726 Bool tuple2!21194 tuple2!21194 BitStream!10726 Bool) Unit!17916)

(assert (=> d!82744 (= lt!385567 (choose!50 lt!385049 (_2!11518 lt!385048) lt!385566 lt!385565 (tuple2!21195 (_1!11519 lt!385565) (_2!11519 lt!385565)) (_1!11519 lt!385565) (_2!11519 lt!385565) lt!385568 (tuple2!21195 (_1!11519 lt!385568) (_2!11519 lt!385568)) (_1!11519 lt!385568) (_2!11519 lt!385568)))))

(assert (=> d!82744 (= lt!385568 (readBitPure!0 lt!385566))))

(assert (=> d!82744 (= lt!385565 (readBitPure!0 lt!385049))))

(assert (=> d!82744 (= lt!385566 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 lt!385049) (currentBit!11774 lt!385049)))))

(assert (=> d!82744 (invariant!0 (currentBit!11774 lt!385049) (currentByte!11779 lt!385049) (size!5902 (buf!6383 (_2!11518 lt!385048))))))

(assert (=> d!82744 (= (readBitPrefixLemma!0 lt!385049 (_2!11518 lt!385048)) lt!385567)))

(declare-fun b!247153 () Bool)

(assert (=> b!247153 (= e!171204 (= (_2!11519 lt!385565) (_2!11519 lt!385568)))))

(assert (= (and d!82744 res!206820) b!247153))

(declare-fun m!372819 () Bool)

(assert (=> d!82744 m!372819))

(declare-fun m!372821 () Bool)

(assert (=> d!82744 m!372821))

(declare-fun m!372823 () Bool)

(assert (=> d!82744 m!372823))

(assert (=> d!82744 m!372315))

(declare-fun m!372825 () Bool)

(assert (=> d!82744 m!372825))

(declare-fun m!372827 () Bool)

(assert (=> d!82744 m!372827))

(assert (=> b!246881 d!82744))

(declare-fun b!247163 () Bool)

(declare-fun res!206829 () Bool)

(declare-fun e!171210 () Bool)

(assert (=> b!247163 (=> (not res!206829) (not e!171210))))

(declare-fun lt!385587 () tuple2!21192)

(assert (=> b!247163 (= res!206829 (isPrefixOf!0 (_2!11518 lt!385056) (_2!11518 lt!385587)))))

(declare-fun b!247162 () Bool)

(declare-fun res!206831 () Bool)

(assert (=> b!247162 (=> (not res!206831) (not e!171210))))

(declare-fun lt!385590 () (_ BitVec 64))

(declare-fun lt!385588 () (_ BitVec 64))

(assert (=> b!247162 (= res!206831 (= (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385587))) (currentByte!11779 (_2!11518 lt!385587)) (currentBit!11774 (_2!11518 lt!385587))) (bvadd lt!385588 lt!385590)))))

(assert (=> b!247162 (or (not (= (bvand lt!385588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385590 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385588 lt!385590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247162 (= lt!385590 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247162 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247162 (= lt!385588 (bitIndex!0 (size!5902 (buf!6383 (_2!11518 lt!385056))) (currentByte!11779 (_2!11518 lt!385056)) (currentBit!11774 (_2!11518 lt!385056))))))

(declare-fun b!247165 () Bool)

(declare-fun e!171209 () Bool)

(declare-fun lt!385586 () (_ BitVec 64))

(assert (=> b!247165 (= e!171209 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385586))))

(declare-fun d!82746 () Bool)

(assert (=> d!82746 e!171210))

(declare-fun res!206830 () Bool)

(assert (=> d!82746 (=> (not res!206830) (not e!171210))))

(assert (=> d!82746 (= res!206830 (= (size!5902 (buf!6383 (_2!11518 lt!385056))) (size!5902 (buf!6383 (_2!11518 lt!385587)))))))

(declare-fun choose!51 (BitStream!10726 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21192)

(assert (=> d!82746 (= lt!385587 (choose!51 (_2!11518 lt!385056) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82746 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82746 (= (appendNBitsLoop!0 (_2!11518 lt!385056) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!385587)))

(declare-fun b!247164 () Bool)

(declare-fun lt!385585 () tuple2!21194)

(declare-fun lt!385592 () tuple2!21196)

(assert (=> b!247164 (= e!171210 (and (_2!11519 lt!385585) (= (_1!11519 lt!385585) (_2!11520 lt!385592))))))

(assert (=> b!247164 (= lt!385585 (checkBitsLoopPure!0 (_1!11520 lt!385592) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385591 () Unit!17916)

(declare-fun lt!385589 () Unit!17916)

(assert (=> b!247164 (= lt!385591 lt!385589)))

(assert (=> b!247164 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385587)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385586)))

(assert (=> b!247164 (= lt!385589 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11518 lt!385056) (buf!6383 (_2!11518 lt!385587)) lt!385586))))

(assert (=> b!247164 e!171209))

(declare-fun res!206832 () Bool)

(assert (=> b!247164 (=> (not res!206832) (not e!171209))))

(assert (=> b!247164 (= res!206832 (and (= (size!5902 (buf!6383 (_2!11518 lt!385056))) (size!5902 (buf!6383 (_2!11518 lt!385587)))) (bvsge lt!385586 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247164 (= lt!385586 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247164 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247164 (= lt!385592 (reader!0 (_2!11518 lt!385056) (_2!11518 lt!385587)))))

(assert (= (and d!82746 res!206830) b!247162))

(assert (= (and b!247162 res!206831) b!247163))

(assert (= (and b!247163 res!206829) b!247164))

(assert (= (and b!247164 res!206832) b!247165))

(declare-fun m!372829 () Bool)

(assert (=> b!247164 m!372829))

(declare-fun m!372831 () Bool)

(assert (=> b!247164 m!372831))

(declare-fun m!372833 () Bool)

(assert (=> b!247164 m!372833))

(declare-fun m!372835 () Bool)

(assert (=> b!247164 m!372835))

(declare-fun m!372837 () Bool)

(assert (=> b!247162 m!372837))

(assert (=> b!247162 m!372295))

(declare-fun m!372839 () Bool)

(assert (=> d!82746 m!372839))

(declare-fun m!372841 () Bool)

(assert (=> b!247165 m!372841))

(declare-fun m!372843 () Bool)

(assert (=> b!247163 m!372843))

(assert (=> b!246881 d!82746))

(declare-fun d!82748 () Bool)

(assert (=> d!82748 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056))) lt!385035) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385056)))) ((_ sign_extend 32) (currentByte!11779 (_2!11518 lt!385056))) ((_ sign_extend 32) (currentBit!11774 (_2!11518 lt!385056)))) lt!385035))))

(declare-fun bs!20947 () Bool)

(assert (= bs!20947 d!82748))

(assert (=> bs!20947 m!372699))

(assert (=> b!246881 d!82748))

(assert (=> b!246881 d!82716))

(declare-fun d!82750 () Bool)

(declare-fun lt!385593 () tuple2!21212)

(assert (=> d!82750 (= lt!385593 (readBit!0 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005))))))

(assert (=> d!82750 (= (readBitPure!0 (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005))) (tuple2!21195 (_2!11528 lt!385593) (_1!11528 lt!385593)))))

(declare-fun bs!20948 () Bool)

(assert (= bs!20948 d!82750))

(declare-fun m!372845 () Bool)

(assert (=> bs!20948 m!372845))

(assert (=> b!246881 d!82750))

(declare-fun d!82752 () Bool)

(declare-fun lt!385594 () tuple2!21212)

(assert (=> d!82752 (= lt!385594 (readBit!0 lt!385049))))

(assert (=> d!82752 (= (readBitPure!0 lt!385049) (tuple2!21195 (_2!11528 lt!385594) (_1!11528 lt!385594)))))

(declare-fun bs!20949 () Bool)

(assert (= bs!20949 d!82752))

(declare-fun m!372847 () Bool)

(assert (=> bs!20949 m!372847))

(assert (=> b!246881 d!82752))

(declare-fun d!82754 () Bool)

(assert (=> d!82754 (validate_offset_bits!1 ((_ sign_extend 32) (size!5902 (buf!6383 (_2!11518 lt!385048)))) ((_ sign_extend 32) (currentByte!11779 thiss!1005)) ((_ sign_extend 32) (currentBit!11774 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!385595 () Unit!17916)

(assert (=> d!82754 (= lt!385595 (choose!9 thiss!1005 (buf!6383 (_2!11518 lt!385048)) (bvsub nBits!297 from!289) (BitStream!10727 (buf!6383 (_2!11518 lt!385048)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005))))))

(assert (=> d!82754 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6383 (_2!11518 lt!385048)) (bvsub nBits!297 from!289)) lt!385595)))

(declare-fun bs!20950 () Bool)

(assert (= bs!20950 d!82754))

(assert (=> bs!20950 m!372333))

(declare-fun m!372849 () Bool)

(assert (=> bs!20950 m!372849))

(assert (=> b!246881 d!82754))

(declare-fun d!82756 () Bool)

(declare-fun lt!385596 () tuple2!21212)

(assert (=> d!82756 (= lt!385596 (readBit!0 (readerFrom!0 (_2!11518 lt!385056) (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005))))))

(assert (=> d!82756 (= (readBitPure!0 (readerFrom!0 (_2!11518 lt!385056) (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005))) (tuple2!21195 (_2!11528 lt!385596) (_1!11528 lt!385596)))))

(declare-fun bs!20951 () Bool)

(assert (= bs!20951 d!82756))

(assert (=> bs!20951 m!372361))

(declare-fun m!372851 () Bool)

(assert (=> bs!20951 m!372851))

(assert (=> b!246880 d!82756))

(declare-fun d!82758 () Bool)

(declare-fun e!171213 () Bool)

(assert (=> d!82758 e!171213))

(declare-fun res!206836 () Bool)

(assert (=> d!82758 (=> (not res!206836) (not e!171213))))

(assert (=> d!82758 (= res!206836 (invariant!0 (currentBit!11774 (_2!11518 lt!385056)) (currentByte!11779 (_2!11518 lt!385056)) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(assert (=> d!82758 (= (readerFrom!0 (_2!11518 lt!385056) (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005)) (BitStream!10727 (buf!6383 (_2!11518 lt!385056)) (currentByte!11779 thiss!1005) (currentBit!11774 thiss!1005)))))

(declare-fun b!247168 () Bool)

(assert (=> b!247168 (= e!171213 (invariant!0 (currentBit!11774 thiss!1005) (currentByte!11779 thiss!1005) (size!5902 (buf!6383 (_2!11518 lt!385056)))))))

(assert (= (and d!82758 res!206836) b!247168))

(assert (=> d!82758 m!372701))

(assert (=> b!247168 m!372303))

(assert (=> b!246880 d!82758))

(declare-fun d!82760 () Bool)

(assert (=> d!82760 (= (array_inv!5643 (buf!6383 thiss!1005)) (bvsge (size!5902 (buf!6383 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!246869 d!82760))

(push 1)

(assert (not d!82710))

(assert (not d!82740))

(assert (not b!247168))

(assert (not b!247141))

(assert (not d!82690))

(assert (not d!82748))

(assert (not d!82704))

(assert (not b!247127))

(assert (not b!247120))

(assert (not d!82720))

(assert (not d!82696))

(assert (not b!247128))

(assert (not d!82694))

(assert (not d!82722))

(assert (not d!82716))

(assert (not d!82754))

(assert (not b!247140))

(assert (not d!82736))

(assert (not d!82718))

(assert (not b!247105))

(assert (not d!82732))

(assert (not b!247130))

(assert (not d!82728))

(assert (not d!82734))

(assert (not b!247165))

(assert (not b!247164))

(assert (not b!247143))

(assert (not b!247122))

(assert (not b!247121))

(assert (not b!247163))

(assert (not b!247125))

(assert (not d!82700))

(assert (not b!247101))

(assert (not d!82738))

(assert (not d!82686))

(assert (not b!247150))

(assert (not b!247162))

(assert (not d!82750))

(assert (not d!82730))

(assert (not b!247107))

(assert (not d!82712))

(assert (not b!247126))

(assert (not b!247124))

(assert (not d!82744))

(assert (not b!247099))

(assert (not d!82698))

(assert (not b!247119))

(assert (not d!82714))

(assert (not d!82742))

(assert (not b!247142))

(assert (not d!82726))

(assert (not d!82746))

(assert (not d!82752))

(assert (not d!82756))

(assert (not d!82688))

(assert (not d!82758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

