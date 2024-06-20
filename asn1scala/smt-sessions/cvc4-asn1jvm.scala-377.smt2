; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9054 () Bool)

(assert start!9054)

(declare-fun b!44870 () Bool)

(declare-fun res!37971 () Bool)

(declare-fun e!29896 () Bool)

(assert (=> b!44870 (=> (not res!37971) (not e!29896))))

(declare-datatypes ((array!2252 0))(
  ( (array!2253 (arr!1528 (Array (_ BitVec 32) (_ BitVec 8))) (size!1014 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1772 0))(
  ( (BitStream!1773 (buf!1360 array!2252) (currentByte!2847 (_ BitVec 32)) (currentBit!2842 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1772)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44870 (= res!37971 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 thiss!1379))) ((_ sign_extend 32) (currentByte!2847 thiss!1379)) ((_ sign_extend 32) (currentBit!2842 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44871 () Bool)

(declare-fun e!29898 () Bool)

(declare-datatypes ((Unit!3194 0))(
  ( (Unit!3195) )
))
(declare-datatypes ((tuple2!4390 0))(
  ( (tuple2!4391 (_1!2288 Unit!3194) (_2!2288 BitStream!1772)) )
))
(declare-fun lt!68713 () tuple2!4390)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!44871 (= e!29898 (invariant!0 (currentBit!2842 (_2!2288 lt!68713)) (currentByte!2847 (_2!2288 lt!68713)) (size!1014 (buf!1360 (_2!2288 lt!68713)))))))

(declare-fun b!44872 () Bool)

(declare-fun lt!68709 () (_ BitVec 64))

(declare-fun e!29895 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44872 (= e!29895 (= lt!68709 (bvsub (bvsub (bvadd (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44873 () Bool)

(declare-fun e!29894 () Bool)

(assert (=> b!44873 (= e!29896 (not e!29894))))

(declare-fun res!37970 () Bool)

(assert (=> b!44873 (=> res!37970 e!29894)))

(assert (=> b!44873 (= res!37970 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1772 BitStream!1772) Bool)

(assert (=> b!44873 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!68712 () Unit!3194)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1772) Unit!3194)

(assert (=> b!44873 (= lt!68712 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!68714 () (_ BitVec 64))

(assert (=> b!44873 (= lt!68714 (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379)))))

(declare-fun b!44875 () Bool)

(declare-fun e!29900 () Bool)

(assert (=> b!44875 (= e!29900 e!29898)))

(declare-fun res!37980 () Bool)

(assert (=> b!44875 (=> res!37980 e!29898)))

(declare-fun lt!68711 () tuple2!4390)

(assert (=> b!44875 (= res!37980 (not (= (size!1014 (buf!1360 (_2!2288 lt!68713))) (size!1014 (buf!1360 (_2!2288 lt!68711))))))))

(assert (=> b!44875 e!29895))

(declare-fun res!37973 () Bool)

(assert (=> b!44875 (=> (not res!37973) (not e!29895))))

(assert (=> b!44875 (= res!37973 (= (size!1014 (buf!1360 (_2!2288 lt!68711))) (size!1014 (buf!1360 thiss!1379))))))

(declare-fun b!44876 () Bool)

(declare-fun res!37976 () Bool)

(assert (=> b!44876 (=> res!37976 e!29900)))

(assert (=> b!44876 (= res!37976 (not (= (size!1014 (buf!1360 thiss!1379)) (size!1014 (buf!1360 (_2!2288 lt!68711))))))))

(declare-fun b!44877 () Bool)

(declare-fun e!29892 () Bool)

(declare-fun e!29890 () Bool)

(assert (=> b!44877 (= e!29892 e!29890)))

(declare-fun res!37972 () Bool)

(assert (=> b!44877 (=> res!37972 e!29890)))

(assert (=> b!44877 (= res!37972 (not (isPrefixOf!0 (_2!2288 lt!68713) (_2!2288 lt!68711))))))

(assert (=> b!44877 (isPrefixOf!0 thiss!1379 (_2!2288 lt!68711))))

(declare-fun lt!68716 () Unit!3194)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1772 BitStream!1772 BitStream!1772) Unit!3194)

(assert (=> b!44877 (= lt!68716 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2288 lt!68713) (_2!2288 lt!68711)))))

(declare-fun srcBuffer!2 () array!2252)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1772 array!2252 (_ BitVec 64) (_ BitVec 64)) tuple2!4390)

(assert (=> b!44877 (= lt!68711 (appendBitsMSBFirstLoop!0 (_2!2288 lt!68713) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29897 () Bool)

(assert (=> b!44877 e!29897))

(declare-fun res!37978 () Bool)

(assert (=> b!44877 (=> (not res!37978) (not e!29897))))

(assert (=> b!44877 (= res!37978 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 thiss!1379)) ((_ sign_extend 32) (currentBit!2842 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68715 () Unit!3194)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1772 array!2252 (_ BitVec 64)) Unit!3194)

(assert (=> b!44877 (= lt!68715 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1360 (_2!2288 lt!68713)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4392 0))(
  ( (tuple2!4393 (_1!2289 BitStream!1772) (_2!2289 BitStream!1772)) )
))
(declare-fun lt!68708 () tuple2!4392)

(declare-fun reader!0 (BitStream!1772 BitStream!1772) tuple2!4392)

(assert (=> b!44877 (= lt!68708 (reader!0 thiss!1379 (_2!2288 lt!68713)))))

(declare-fun b!44878 () Bool)

(assert (=> b!44878 (= e!29894 e!29892)))

(declare-fun res!37979 () Bool)

(assert (=> b!44878 (=> res!37979 e!29892)))

(assert (=> b!44878 (= res!37979 (not (isPrefixOf!0 thiss!1379 (_2!2288 lt!68713))))))

(assert (=> b!44878 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68710 () Unit!3194)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1772 BitStream!1772 (_ BitVec 64) (_ BitVec 64)) Unit!3194)

(assert (=> b!44878 (= lt!68710 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2288 lt!68713) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1772 (_ BitVec 8) (_ BitVec 32)) tuple2!4390)

(assert (=> b!44878 (= lt!68713 (appendBitFromByte!0 thiss!1379 (select (arr!1528 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44879 () Bool)

(declare-datatypes ((List!527 0))(
  ( (Nil!524) (Cons!523 (h!642 Bool) (t!1277 List!527)) )
))
(declare-fun head!346 (List!527) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1772 array!2252 (_ BitVec 64) (_ BitVec 64)) List!527)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1772 BitStream!1772 (_ BitVec 64)) List!527)

(assert (=> b!44879 (= e!29897 (= (head!346 (byteArrayBitContentToList!0 (_2!2288 lt!68713) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!346 (bitStreamReadBitsIntoList!0 (_2!2288 lt!68713) (_1!2289 lt!68708) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44880 () Bool)

(declare-fun res!37975 () Bool)

(assert (=> b!44880 (=> res!37975 e!29900)))

(assert (=> b!44880 (= res!37975 (not (invariant!0 (currentBit!2842 (_2!2288 lt!68711)) (currentByte!2847 (_2!2288 lt!68711)) (size!1014 (buf!1360 (_2!2288 lt!68711))))))))

(declare-fun b!44881 () Bool)

(declare-fun e!29893 () Bool)

(declare-fun array_inv!939 (array!2252) Bool)

(assert (=> b!44881 (= e!29893 (array_inv!939 (buf!1360 thiss!1379)))))

(declare-fun res!37974 () Bool)

(assert (=> start!9054 (=> (not res!37974) (not e!29896))))

(assert (=> start!9054 (= res!37974 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1014 srcBuffer!2))))))))

(assert (=> start!9054 e!29896))

(assert (=> start!9054 true))

(assert (=> start!9054 (array_inv!939 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1772) Bool)

(assert (=> start!9054 (and (inv!12 thiss!1379) e!29893)))

(declare-fun b!44874 () Bool)

(assert (=> b!44874 (= e!29890 e!29900)))

(declare-fun res!37977 () Bool)

(assert (=> b!44874 (=> res!37977 e!29900)))

(assert (=> b!44874 (= res!37977 (not (= lt!68709 (bvsub (bvadd lt!68714 to!314) i!635))))))

(assert (=> b!44874 (= lt!68709 (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68711))) (currentByte!2847 (_2!2288 lt!68711)) (currentBit!2842 (_2!2288 lt!68711))))))

(assert (= (and start!9054 res!37974) b!44870))

(assert (= (and b!44870 res!37971) b!44873))

(assert (= (and b!44873 (not res!37970)) b!44878))

(assert (= (and b!44878 (not res!37979)) b!44877))

(assert (= (and b!44877 res!37978) b!44879))

(assert (= (and b!44877 (not res!37972)) b!44874))

(assert (= (and b!44874 (not res!37977)) b!44880))

(assert (= (and b!44880 (not res!37975)) b!44876))

(assert (= (and b!44876 (not res!37976)) b!44875))

(assert (= (and b!44875 res!37973) b!44872))

(assert (= (and b!44875 (not res!37980)) b!44871))

(assert (= start!9054 b!44881))

(declare-fun m!68449 () Bool)

(assert (=> b!44872 m!68449))

(declare-fun m!68451 () Bool)

(assert (=> b!44877 m!68451))

(declare-fun m!68453 () Bool)

(assert (=> b!44877 m!68453))

(declare-fun m!68455 () Bool)

(assert (=> b!44877 m!68455))

(declare-fun m!68457 () Bool)

(assert (=> b!44877 m!68457))

(declare-fun m!68459 () Bool)

(assert (=> b!44877 m!68459))

(declare-fun m!68461 () Bool)

(assert (=> b!44877 m!68461))

(declare-fun m!68463 () Bool)

(assert (=> b!44877 m!68463))

(declare-fun m!68465 () Bool)

(assert (=> b!44873 m!68465))

(declare-fun m!68467 () Bool)

(assert (=> b!44873 m!68467))

(declare-fun m!68469 () Bool)

(assert (=> b!44873 m!68469))

(declare-fun m!68471 () Bool)

(assert (=> b!44870 m!68471))

(declare-fun m!68473 () Bool)

(assert (=> b!44871 m!68473))

(declare-fun m!68475 () Bool)

(assert (=> b!44879 m!68475))

(assert (=> b!44879 m!68475))

(declare-fun m!68477 () Bool)

(assert (=> b!44879 m!68477))

(declare-fun m!68479 () Bool)

(assert (=> b!44879 m!68479))

(assert (=> b!44879 m!68479))

(declare-fun m!68481 () Bool)

(assert (=> b!44879 m!68481))

(declare-fun m!68483 () Bool)

(assert (=> b!44878 m!68483))

(declare-fun m!68485 () Bool)

(assert (=> b!44878 m!68485))

(declare-fun m!68487 () Bool)

(assert (=> b!44878 m!68487))

(declare-fun m!68489 () Bool)

(assert (=> b!44878 m!68489))

(assert (=> b!44878 m!68485))

(declare-fun m!68491 () Bool)

(assert (=> b!44878 m!68491))

(declare-fun m!68493 () Bool)

(assert (=> b!44874 m!68493))

(declare-fun m!68495 () Bool)

(assert (=> b!44880 m!68495))

(declare-fun m!68497 () Bool)

(assert (=> start!9054 m!68497))

(declare-fun m!68499 () Bool)

(assert (=> start!9054 m!68499))

(declare-fun m!68501 () Bool)

(assert (=> b!44881 m!68501))

(push 1)

(assert (not b!44877))

(assert (not b!44881))

(assert (not b!44870))

(assert (not start!9054))

(assert (not b!44879))

(assert (not b!44872))

(assert (not b!44874))

(assert (not b!44871))

(assert (not b!44880))

(assert (not b!44873))

(assert (not b!44878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13084 () Bool)

(assert (=> d!13084 (isPrefixOf!0 thiss!1379 (_2!2288 lt!68711))))

(declare-fun lt!68752 () Unit!3194)

(declare-fun choose!30 (BitStream!1772 BitStream!1772 BitStream!1772) Unit!3194)

(assert (=> d!13084 (= lt!68752 (choose!30 thiss!1379 (_2!2288 lt!68713) (_2!2288 lt!68711)))))

(assert (=> d!13084 (isPrefixOf!0 thiss!1379 (_2!2288 lt!68713))))

(assert (=> d!13084 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2288 lt!68713) (_2!2288 lt!68711)) lt!68752)))

(declare-fun bs!3475 () Bool)

(assert (= bs!3475 d!13084))

(assert (=> bs!3475 m!68455))

(declare-fun m!68529 () Bool)

(assert (=> bs!3475 m!68529))

(assert (=> bs!3475 m!68483))

(assert (=> b!44877 d!13084))

(declare-fun d!13086 () Bool)

(assert (=> d!13086 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 thiss!1379)) ((_ sign_extend 32) (currentBit!2842 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68755 () Unit!3194)

(declare-fun choose!9 (BitStream!1772 array!2252 (_ BitVec 64) BitStream!1772) Unit!3194)

(assert (=> d!13086 (= lt!68755 (choose!9 thiss!1379 (buf!1360 (_2!2288 lt!68713)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1773 (buf!1360 (_2!2288 lt!68713)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379))))))

(assert (=> d!13086 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1360 (_2!2288 lt!68713)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68755)))

(declare-fun bs!3476 () Bool)

(assert (= bs!3476 d!13086))

(assert (=> bs!3476 m!68453))

(declare-fun m!68531 () Bool)

(assert (=> bs!3476 m!68531))

(assert (=> b!44877 d!13086))

(declare-fun b!45036 () Bool)

(declare-fun res!38093 () Bool)

(declare-fun e!29983 () Bool)

(assert (=> b!45036 (=> (not res!38093) (not e!29983))))

(declare-fun lt!69030 () tuple2!4390)

(assert (=> b!45036 (= res!38093 (invariant!0 (currentBit!2842 (_2!2288 lt!69030)) (currentByte!2847 (_2!2288 lt!69030)) (size!1014 (buf!1360 (_2!2288 lt!69030)))))))

(declare-fun b!45038 () Bool)

(declare-fun e!29984 () Bool)

(declare-fun lt!69043 () (_ BitVec 64))

(assert (=> b!45038 (= e!29984 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713))) lt!69043))))

(declare-fun b!45039 () Bool)

(declare-fun e!29982 () tuple2!4390)

(declare-fun Unit!3211 () Unit!3194)

(assert (=> b!45039 (= e!29982 (tuple2!4391 Unit!3211 (_2!2288 lt!68713)))))

(assert (=> b!45039 (= (size!1014 (buf!1360 (_2!2288 lt!68713))) (size!1014 (buf!1360 (_2!2288 lt!68713))))))

(declare-fun lt!69049 () Unit!3194)

(declare-fun Unit!3212 () Unit!3194)

(assert (=> b!45039 (= lt!69049 Unit!3212)))

(declare-fun call!538 () tuple2!4392)

(declare-fun checkByteArrayBitContent!0 (BitStream!1772 array!2252 array!2252 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4410 0))(
  ( (tuple2!4411 (_1!2298 array!2252) (_2!2298 BitStream!1772)) )
))
(declare-fun readBits!0 (BitStream!1772 (_ BitVec 64)) tuple2!4410)

(assert (=> b!45039 (checkByteArrayBitContent!0 (_2!2288 lt!68713) srcBuffer!2 (_1!2298 (readBits!0 (_1!2289 call!538) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!45040 () Bool)

(declare-fun lt!69051 () tuple2!4390)

(declare-fun Unit!3213 () Unit!3194)

(assert (=> b!45040 (= e!29982 (tuple2!4391 Unit!3213 (_2!2288 lt!69051)))))

(declare-fun lt!69025 () tuple2!4390)

(assert (=> b!45040 (= lt!69025 (appendBitFromByte!0 (_2!2288 lt!68713) (select (arr!1528 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!69033 () (_ BitVec 64))

(assert (=> b!45040 (= lt!69033 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69022 () (_ BitVec 64))

(assert (=> b!45040 (= lt!69022 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69047 () Unit!3194)

(assert (=> b!45040 (= lt!69047 (validateOffsetBitsIneqLemma!0 (_2!2288 lt!68713) (_2!2288 lt!69025) lt!69033 lt!69022))))

(assert (=> b!45040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!69025)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!69025))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!69025))) (bvsub lt!69033 lt!69022))))

(declare-fun lt!69057 () Unit!3194)

(assert (=> b!45040 (= lt!69057 lt!69047)))

(declare-fun lt!69050 () tuple2!4392)

(assert (=> b!45040 (= lt!69050 call!538)))

(declare-fun lt!69042 () (_ BitVec 64))

(assert (=> b!45040 (= lt!69042 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!69028 () Unit!3194)

(assert (=> b!45040 (= lt!69028 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2288 lt!68713) (buf!1360 (_2!2288 lt!69025)) lt!69042))))

(assert (=> b!45040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!69025)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713))) lt!69042)))

(declare-fun lt!69039 () Unit!3194)

(assert (=> b!45040 (= lt!69039 lt!69028)))

(assert (=> b!45040 (= (head!346 (byteArrayBitContentToList!0 (_2!2288 lt!69025) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!346 (bitStreamReadBitsIntoList!0 (_2!2288 lt!69025) (_1!2289 lt!69050) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69055 () Unit!3194)

(declare-fun Unit!3214 () Unit!3194)

(assert (=> b!45040 (= lt!69055 Unit!3214)))

(assert (=> b!45040 (= lt!69051 (appendBitsMSBFirstLoop!0 (_2!2288 lt!69025) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!69031 () Unit!3194)

(assert (=> b!45040 (= lt!69031 (lemmaIsPrefixTransitive!0 (_2!2288 lt!68713) (_2!2288 lt!69025) (_2!2288 lt!69051)))))

(assert (=> b!45040 (isPrefixOf!0 (_2!2288 lt!68713) (_2!2288 lt!69051))))

(declare-fun lt!69034 () Unit!3194)

(assert (=> b!45040 (= lt!69034 lt!69031)))

(assert (=> b!45040 (= (size!1014 (buf!1360 (_2!2288 lt!69051))) (size!1014 (buf!1360 (_2!2288 lt!68713))))))

(declare-fun lt!69021 () Unit!3194)

(declare-fun Unit!3215 () Unit!3194)

(assert (=> b!45040 (= lt!69021 Unit!3215)))

(assert (=> b!45040 (= (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!69051))) (currentByte!2847 (_2!2288 lt!69051)) (currentBit!2842 (_2!2288 lt!69051))) (bvsub (bvadd (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69037 () Unit!3194)

(declare-fun Unit!3216 () Unit!3194)

(assert (=> b!45040 (= lt!69037 Unit!3216)))

(assert (=> b!45040 (= (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!69051))) (currentByte!2847 (_2!2288 lt!69051)) (currentBit!2842 (_2!2288 lt!69051))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!69025))) (currentByte!2847 (_2!2288 lt!69025)) (currentBit!2842 (_2!2288 lt!69025))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69046 () Unit!3194)

(declare-fun Unit!3217 () Unit!3194)

(assert (=> b!45040 (= lt!69046 Unit!3217)))

(declare-fun lt!69038 () tuple2!4392)

(assert (=> b!45040 (= lt!69038 (reader!0 (_2!2288 lt!68713) (_2!2288 lt!69051)))))

(declare-fun lt!69045 () (_ BitVec 64))

(assert (=> b!45040 (= lt!69045 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69026 () Unit!3194)

(assert (=> b!45040 (= lt!69026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2288 lt!68713) (buf!1360 (_2!2288 lt!69051)) lt!69045))))

(assert (=> b!45040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!69051)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713))) lt!69045)))

(declare-fun lt!69040 () Unit!3194)

(assert (=> b!45040 (= lt!69040 lt!69026)))

(declare-fun lt!69023 () tuple2!4392)

(assert (=> b!45040 (= lt!69023 (reader!0 (_2!2288 lt!69025) (_2!2288 lt!69051)))))

(declare-fun lt!69027 () (_ BitVec 64))

(assert (=> b!45040 (= lt!69027 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69060 () Unit!3194)

(assert (=> b!45040 (= lt!69060 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2288 lt!69025) (buf!1360 (_2!2288 lt!69051)) lt!69027))))

(assert (=> b!45040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!69051)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!69025))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!69025))) lt!69027)))

(declare-fun lt!69044 () Unit!3194)

(assert (=> b!45040 (= lt!69044 lt!69060)))

(declare-fun lt!69041 () List!527)

(assert (=> b!45040 (= lt!69041 (byteArrayBitContentToList!0 (_2!2288 lt!69051) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!69062 () List!527)

(assert (=> b!45040 (= lt!69062 (byteArrayBitContentToList!0 (_2!2288 lt!69051) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69053 () List!527)

(assert (=> b!45040 (= lt!69053 (bitStreamReadBitsIntoList!0 (_2!2288 lt!69051) (_1!2289 lt!69038) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!69054 () List!527)

(assert (=> b!45040 (= lt!69054 (bitStreamReadBitsIntoList!0 (_2!2288 lt!69051) (_1!2289 lt!69023) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!69059 () (_ BitVec 64))

(assert (=> b!45040 (= lt!69059 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!69035 () Unit!3194)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1772 BitStream!1772 BitStream!1772 BitStream!1772 (_ BitVec 64) List!527) Unit!3194)

(assert (=> b!45040 (= lt!69035 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2288 lt!69051) (_2!2288 lt!69051) (_1!2289 lt!69038) (_1!2289 lt!69023) lt!69059 lt!69053))))

(declare-fun tail!219 (List!527) List!527)

(assert (=> b!45040 (= (bitStreamReadBitsIntoList!0 (_2!2288 lt!69051) (_1!2289 lt!69023) (bvsub lt!69059 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!219 lt!69053))))

(declare-fun lt!69058 () Unit!3194)

(assert (=> b!45040 (= lt!69058 lt!69035)))

(declare-fun lt!69052 () Unit!3194)

(declare-fun lt!69056 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2252 array!2252 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3194)

(assert (=> b!45040 (= lt!69052 (arrayBitRangesEqImpliesEq!0 (buf!1360 (_2!2288 lt!69025)) (buf!1360 (_2!2288 lt!69051)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!69056 (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!69025))) (currentByte!2847 (_2!2288 lt!69025)) (currentBit!2842 (_2!2288 lt!69025)))))))

(declare-fun bitAt!0 (array!2252 (_ BitVec 64)) Bool)

(assert (=> b!45040 (= (bitAt!0 (buf!1360 (_2!2288 lt!69025)) lt!69056) (bitAt!0 (buf!1360 (_2!2288 lt!69051)) lt!69056))))

(declare-fun lt!69020 () Unit!3194)

(assert (=> b!45040 (= lt!69020 lt!69052)))

(declare-fun b!45041 () Bool)

(declare-fun res!38091 () Bool)

(assert (=> b!45041 (=> (not res!38091) (not e!29983))))

(assert (=> b!45041 (= res!38091 (= (size!1014 (buf!1360 (_2!2288 lt!69030))) (size!1014 (buf!1360 (_2!2288 lt!68713)))))))

(declare-fun b!45042 () Bool)

(declare-fun res!38092 () Bool)

(assert (=> b!45042 (=> (not res!38092) (not e!29983))))

(assert (=> b!45042 (= res!38092 (= (size!1014 (buf!1360 (_2!2288 lt!68713))) (size!1014 (buf!1360 (_2!2288 lt!69030)))))))

(declare-fun b!45037 () Bool)

(declare-fun lt!69029 () tuple2!4392)

(assert (=> b!45037 (= e!29983 (= (bitStreamReadBitsIntoList!0 (_2!2288 lt!69030) (_1!2289 lt!69029) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2288 lt!69030) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!45037 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45037 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69024 () Unit!3194)

(declare-fun lt!69032 () Unit!3194)

(assert (=> b!45037 (= lt!69024 lt!69032)))

(assert (=> b!45037 (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!69030)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713))) lt!69043)))

(assert (=> b!45037 (= lt!69032 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2288 lt!68713) (buf!1360 (_2!2288 lt!69030)) lt!69043))))

(assert (=> b!45037 e!29984))

(declare-fun res!38090 () Bool)

(assert (=> b!45037 (=> (not res!38090) (not e!29984))))

(assert (=> b!45037 (= res!38090 (and (= (size!1014 (buf!1360 (_2!2288 lt!68713))) (size!1014 (buf!1360 (_2!2288 lt!69030)))) (bvsge lt!69043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45037 (= lt!69043 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!45037 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45037 (= lt!69029 (reader!0 (_2!2288 lt!68713) (_2!2288 lt!69030)))))

(declare-fun d!13088 () Bool)

(assert (=> d!13088 e!29983))

(declare-fun res!38089 () Bool)

(assert (=> d!13088 (=> (not res!38089) (not e!29983))))

(declare-fun lt!69063 () (_ BitVec 64))

(assert (=> d!13088 (= res!38089 (= (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!69030))) (currentByte!2847 (_2!2288 lt!69030)) (currentBit!2842 (_2!2288 lt!69030))) (bvsub lt!69063 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13088 (or (= (bvand lt!69063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69063 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69061 () (_ BitVec 64))

(assert (=> d!13088 (= lt!69063 (bvadd lt!69061 to!314))))

(assert (=> d!13088 (or (not (= (bvand lt!69061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!69061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!69061 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13088 (= lt!69061 (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713))))))

(assert (=> d!13088 (= lt!69030 e!29982)))

(declare-fun c!3026 () Bool)

(assert (=> d!13088 (= c!3026 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!69036 () Unit!3194)

(declare-fun lt!69048 () Unit!3194)

(assert (=> d!13088 (= lt!69036 lt!69048)))

(assert (=> d!13088 (isPrefixOf!0 (_2!2288 lt!68713) (_2!2288 lt!68713))))

(assert (=> d!13088 (= lt!69048 (lemmaIsPrefixRefl!0 (_2!2288 lt!68713)))))

(assert (=> d!13088 (= lt!69056 (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713))))))

(assert (=> d!13088 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13088 (= (appendBitsMSBFirstLoop!0 (_2!2288 lt!68713) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!69030)))

(declare-fun b!45043 () Bool)

(declare-fun res!38094 () Bool)

(assert (=> b!45043 (=> (not res!38094) (not e!29983))))

(assert (=> b!45043 (= res!38094 (isPrefixOf!0 (_2!2288 lt!68713) (_2!2288 lt!69030)))))

(declare-fun bm!535 () Bool)

(assert (=> bm!535 (= call!538 (reader!0 (_2!2288 lt!68713) (ite c!3026 (_2!2288 lt!69025) (_2!2288 lt!68713))))))

(assert (= (and d!13088 c!3026) b!45040))

(assert (= (and d!13088 (not c!3026)) b!45039))

(assert (= (or b!45040 b!45039) bm!535))

(assert (= (and d!13088 res!38089) b!45036))

(assert (= (and b!45036 res!38093) b!45042))

(assert (= (and b!45042 res!38092) b!45043))

(assert (= (and b!45043 res!38094) b!45041))

(assert (= (and b!45041 res!38091) b!45037))

(assert (= (and b!45037 res!38090) b!45038))

(declare-fun m!68617 () Bool)

(assert (=> b!45043 m!68617))

(declare-fun m!68619 () Bool)

(assert (=> b!45037 m!68619))

(declare-fun m!68621 () Bool)

(assert (=> b!45037 m!68621))

(declare-fun m!68623 () Bool)

(assert (=> b!45037 m!68623))

(declare-fun m!68625 () Bool)

(assert (=> b!45037 m!68625))

(declare-fun m!68627 () Bool)

(assert (=> b!45037 m!68627))

(declare-fun m!68629 () Bool)

(assert (=> b!45036 m!68629))

(declare-fun m!68631 () Bool)

(assert (=> b!45040 m!68631))

(declare-fun m!68633 () Bool)

(assert (=> b!45040 m!68633))

(declare-fun m!68635 () Bool)

(assert (=> b!45040 m!68635))

(declare-fun m!68637 () Bool)

(assert (=> b!45040 m!68637))

(declare-fun m!68639 () Bool)

(assert (=> b!45040 m!68639))

(declare-fun m!68641 () Bool)

(assert (=> b!45040 m!68641))

(declare-fun m!68643 () Bool)

(assert (=> b!45040 m!68643))

(declare-fun m!68645 () Bool)

(assert (=> b!45040 m!68645))

(declare-fun m!68647 () Bool)

(assert (=> b!45040 m!68647))

(declare-fun m!68649 () Bool)

(assert (=> b!45040 m!68649))

(declare-fun m!68651 () Bool)

(assert (=> b!45040 m!68651))

(declare-fun m!68653 () Bool)

(assert (=> b!45040 m!68653))

(assert (=> b!45040 m!68449))

(declare-fun m!68655 () Bool)

(assert (=> b!45040 m!68655))

(declare-fun m!68657 () Bool)

(assert (=> b!45040 m!68657))

(assert (=> b!45040 m!68635))

(declare-fun m!68659 () Bool)

(assert (=> b!45040 m!68659))

(declare-fun m!68661 () Bool)

(assert (=> b!45040 m!68661))

(declare-fun m!68663 () Bool)

(assert (=> b!45040 m!68663))

(declare-fun m!68665 () Bool)

(assert (=> b!45040 m!68665))

(declare-fun m!68667 () Bool)

(assert (=> b!45040 m!68667))

(declare-fun m!68669 () Bool)

(assert (=> b!45040 m!68669))

(declare-fun m!68671 () Bool)

(assert (=> b!45040 m!68671))

(declare-fun m!68673 () Bool)

(assert (=> b!45040 m!68673))

(declare-fun m!68675 () Bool)

(assert (=> b!45040 m!68675))

(assert (=> b!45040 m!68669))

(declare-fun m!68677 () Bool)

(assert (=> b!45040 m!68677))

(declare-fun m!68679 () Bool)

(assert (=> b!45040 m!68679))

(assert (=> b!45040 m!68655))

(declare-fun m!68681 () Bool)

(assert (=> b!45040 m!68681))

(declare-fun m!68683 () Bool)

(assert (=> b!45040 m!68683))

(declare-fun m!68685 () Bool)

(assert (=> b!45040 m!68685))

(declare-fun m!68687 () Bool)

(assert (=> b!45040 m!68687))

(declare-fun m!68689 () Bool)

(assert (=> b!45040 m!68689))

(assert (=> b!45040 m!68631))

(declare-fun m!68691 () Bool)

(assert (=> b!45040 m!68691))

(declare-fun m!68693 () Bool)

(assert (=> b!45039 m!68693))

(declare-fun m!68695 () Bool)

(assert (=> b!45039 m!68695))

(declare-fun m!68697 () Bool)

(assert (=> d!13088 m!68697))

(assert (=> d!13088 m!68449))

(declare-fun m!68699 () Bool)

(assert (=> d!13088 m!68699))

(declare-fun m!68701 () Bool)

(assert (=> d!13088 m!68701))

(declare-fun m!68703 () Bool)

(assert (=> b!45038 m!68703))

(declare-fun m!68705 () Bool)

(assert (=> bm!535 m!68705))

(assert (=> b!44877 d!13088))

(declare-fun d!13124 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13124 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 thiss!1379)) ((_ sign_extend 32) (currentBit!2842 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 thiss!1379)) ((_ sign_extend 32) (currentBit!2842 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3484 () Bool)

(assert (= bs!3484 d!13124))

(declare-fun m!68707 () Bool)

(assert (=> bs!3484 m!68707))

(assert (=> b!44877 d!13124))

(declare-fun d!13126 () Bool)

(declare-fun res!38113 () Bool)

(declare-fun e!29994 () Bool)

(assert (=> d!13126 (=> (not res!38113) (not e!29994))))

(assert (=> d!13126 (= res!38113 (= (size!1014 (buf!1360 (_2!2288 lt!68713))) (size!1014 (buf!1360 (_2!2288 lt!68711)))))))

(assert (=> d!13126 (= (isPrefixOf!0 (_2!2288 lt!68713) (_2!2288 lt!68711)) e!29994)))

(declare-fun b!45062 () Bool)

(declare-fun res!38115 () Bool)

(assert (=> b!45062 (=> (not res!38115) (not e!29994))))

(assert (=> b!45062 (= res!38115 (bvsle (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713))) (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68711))) (currentByte!2847 (_2!2288 lt!68711)) (currentBit!2842 (_2!2288 lt!68711)))))))

(declare-fun b!45063 () Bool)

(declare-fun e!29993 () Bool)

(assert (=> b!45063 (= e!29994 e!29993)))

(declare-fun res!38114 () Bool)

(assert (=> b!45063 (=> res!38114 e!29993)))

(assert (=> b!45063 (= res!38114 (= (size!1014 (buf!1360 (_2!2288 lt!68713))) #b00000000000000000000000000000000))))

(declare-fun b!45064 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2252 array!2252 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45064 (= e!29993 (arrayBitRangesEq!0 (buf!1360 (_2!2288 lt!68713)) (buf!1360 (_2!2288 lt!68711)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713)))))))

(assert (= (and d!13126 res!38113) b!45062))

(assert (= (and b!45062 res!38115) b!45063))

(assert (= (and b!45063 (not res!38114)) b!45064))

(assert (=> b!45062 m!68449))

(assert (=> b!45062 m!68493))

(assert (=> b!45064 m!68449))

(assert (=> b!45064 m!68449))

(declare-fun m!68709 () Bool)

(assert (=> b!45064 m!68709))

(assert (=> b!44877 d!13126))

(declare-fun b!45089 () Bool)

(declare-fun lt!69202 () (_ BitVec 64))

(declare-fun lt!69207 () tuple2!4392)

(declare-fun e!30007 () Bool)

(declare-fun lt!69200 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1772 (_ BitVec 64)) BitStream!1772)

(assert (=> b!45089 (= e!30007 (= (_1!2289 lt!69207) (withMovedBitIndex!0 (_2!2289 lt!69207) (bvsub lt!69200 lt!69202))))))

(assert (=> b!45089 (or (= (bvand lt!69200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69202 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69200 lt!69202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45089 (= lt!69202 (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713))))))

(assert (=> b!45089 (= lt!69200 (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379)))))

(declare-fun b!45090 () Bool)

(declare-fun e!30006 () Unit!3194)

(declare-fun Unit!3219 () Unit!3194)

(assert (=> b!45090 (= e!30006 Unit!3219)))

(declare-fun d!13128 () Bool)

(assert (=> d!13128 e!30007))

(declare-fun res!38134 () Bool)

(assert (=> d!13128 (=> (not res!38134) (not e!30007))))

(assert (=> d!13128 (= res!38134 (isPrefixOf!0 (_1!2289 lt!69207) (_2!2289 lt!69207)))))

(declare-fun lt!69193 () BitStream!1772)

(assert (=> d!13128 (= lt!69207 (tuple2!4393 lt!69193 (_2!2288 lt!68713)))))

(declare-fun lt!69197 () Unit!3194)

(declare-fun lt!69206 () Unit!3194)

(assert (=> d!13128 (= lt!69197 lt!69206)))

(assert (=> d!13128 (isPrefixOf!0 lt!69193 (_2!2288 lt!68713))))

(assert (=> d!13128 (= lt!69206 (lemmaIsPrefixTransitive!0 lt!69193 (_2!2288 lt!68713) (_2!2288 lt!68713)))))

(declare-fun lt!69199 () Unit!3194)

(declare-fun lt!69210 () Unit!3194)

(assert (=> d!13128 (= lt!69199 lt!69210)))

(assert (=> d!13128 (isPrefixOf!0 lt!69193 (_2!2288 lt!68713))))

(assert (=> d!13128 (= lt!69210 (lemmaIsPrefixTransitive!0 lt!69193 thiss!1379 (_2!2288 lt!68713)))))

(declare-fun lt!69204 () Unit!3194)

(assert (=> d!13128 (= lt!69204 e!30006)))

(declare-fun c!3030 () Bool)

(assert (=> d!13128 (= c!3030 (not (= (size!1014 (buf!1360 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!69211 () Unit!3194)

(declare-fun lt!69198 () Unit!3194)

(assert (=> d!13128 (= lt!69211 lt!69198)))

(assert (=> d!13128 (isPrefixOf!0 (_2!2288 lt!68713) (_2!2288 lt!68713))))

(assert (=> d!13128 (= lt!69198 (lemmaIsPrefixRefl!0 (_2!2288 lt!68713)))))

(declare-fun lt!69205 () Unit!3194)

(declare-fun lt!69209 () Unit!3194)

(assert (=> d!13128 (= lt!69205 lt!69209)))

(assert (=> d!13128 (= lt!69209 (lemmaIsPrefixRefl!0 (_2!2288 lt!68713)))))

(declare-fun lt!69195 () Unit!3194)

(declare-fun lt!69194 () Unit!3194)

(assert (=> d!13128 (= lt!69195 lt!69194)))

(assert (=> d!13128 (isPrefixOf!0 lt!69193 lt!69193)))

(assert (=> d!13128 (= lt!69194 (lemmaIsPrefixRefl!0 lt!69193))))

(declare-fun lt!69203 () Unit!3194)

(declare-fun lt!69201 () Unit!3194)

(assert (=> d!13128 (= lt!69203 lt!69201)))

(assert (=> d!13128 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13128 (= lt!69201 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13128 (= lt!69193 (BitStream!1773 (buf!1360 (_2!2288 lt!68713)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379)))))

(assert (=> d!13128 (isPrefixOf!0 thiss!1379 (_2!2288 lt!68713))))

(assert (=> d!13128 (= (reader!0 thiss!1379 (_2!2288 lt!68713)) lt!69207)))

(declare-fun b!45091 () Bool)

(declare-fun res!38135 () Bool)

(assert (=> b!45091 (=> (not res!38135) (not e!30007))))

(assert (=> b!45091 (= res!38135 (isPrefixOf!0 (_2!2289 lt!69207) (_2!2288 lt!68713)))))

(declare-fun b!45092 () Bool)

(declare-fun lt!69196 () Unit!3194)

(assert (=> b!45092 (= e!30006 lt!69196)))

(declare-fun lt!69192 () (_ BitVec 64))

(assert (=> b!45092 (= lt!69192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69208 () (_ BitVec 64))

(assert (=> b!45092 (= lt!69208 (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2252 array!2252 (_ BitVec 64) (_ BitVec 64)) Unit!3194)

(assert (=> b!45092 (= lt!69196 (arrayBitRangesEqSymmetric!0 (buf!1360 thiss!1379) (buf!1360 (_2!2288 lt!68713)) lt!69192 lt!69208))))

(assert (=> b!45092 (arrayBitRangesEq!0 (buf!1360 (_2!2288 lt!68713)) (buf!1360 thiss!1379) lt!69192 lt!69208)))

(declare-fun b!45093 () Bool)

(declare-fun res!38136 () Bool)

(assert (=> b!45093 (=> (not res!38136) (not e!30007))))

(assert (=> b!45093 (= res!38136 (isPrefixOf!0 (_1!2289 lt!69207) thiss!1379))))

(assert (= (and d!13128 c!3030) b!45092))

(assert (= (and d!13128 (not c!3030)) b!45090))

(assert (= (and d!13128 res!38134) b!45093))

(assert (= (and b!45093 res!38136) b!45091))

(assert (= (and b!45091 res!38135) b!45089))

(declare-fun m!68811 () Bool)

(assert (=> b!45093 m!68811))

(declare-fun m!68813 () Bool)

(assert (=> d!13128 m!68813))

(assert (=> d!13128 m!68465))

(assert (=> d!13128 m!68701))

(declare-fun m!68815 () Bool)

(assert (=> d!13128 m!68815))

(assert (=> d!13128 m!68699))

(assert (=> d!13128 m!68467))

(assert (=> d!13128 m!68483))

(declare-fun m!68817 () Bool)

(assert (=> d!13128 m!68817))

(declare-fun m!68819 () Bool)

(assert (=> d!13128 m!68819))

(declare-fun m!68821 () Bool)

(assert (=> d!13128 m!68821))

(declare-fun m!68823 () Bool)

(assert (=> d!13128 m!68823))

(declare-fun m!68825 () Bool)

(assert (=> b!45089 m!68825))

(assert (=> b!45089 m!68449))

(assert (=> b!45089 m!68469))

(declare-fun m!68827 () Bool)

(assert (=> b!45091 m!68827))

(assert (=> b!45092 m!68469))

(declare-fun m!68829 () Bool)

(assert (=> b!45092 m!68829))

(declare-fun m!68831 () Bool)

(assert (=> b!45092 m!68831))

(assert (=> b!44877 d!13128))

(declare-fun d!13142 () Bool)

(declare-fun res!38137 () Bool)

(declare-fun e!30009 () Bool)

(assert (=> d!13142 (=> (not res!38137) (not e!30009))))

(assert (=> d!13142 (= res!38137 (= (size!1014 (buf!1360 thiss!1379)) (size!1014 (buf!1360 (_2!2288 lt!68711)))))))

(assert (=> d!13142 (= (isPrefixOf!0 thiss!1379 (_2!2288 lt!68711)) e!30009)))

(declare-fun b!45094 () Bool)

(declare-fun res!38139 () Bool)

(assert (=> b!45094 (=> (not res!38139) (not e!30009))))

(assert (=> b!45094 (= res!38139 (bvsle (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379)) (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68711))) (currentByte!2847 (_2!2288 lt!68711)) (currentBit!2842 (_2!2288 lt!68711)))))))

(declare-fun b!45095 () Bool)

(declare-fun e!30008 () Bool)

(assert (=> b!45095 (= e!30009 e!30008)))

(declare-fun res!38138 () Bool)

(assert (=> b!45095 (=> res!38138 e!30008)))

(assert (=> b!45095 (= res!38138 (= (size!1014 (buf!1360 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45096 () Bool)

(assert (=> b!45096 (= e!30008 (arrayBitRangesEq!0 (buf!1360 thiss!1379) (buf!1360 (_2!2288 lt!68711)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379))))))

(assert (= (and d!13142 res!38137) b!45094))

(assert (= (and b!45094 res!38139) b!45095))

(assert (= (and b!45095 (not res!38138)) b!45096))

(assert (=> b!45094 m!68469))

(assert (=> b!45094 m!68493))

(assert (=> b!45096 m!68469))

(assert (=> b!45096 m!68469))

(declare-fun m!68833 () Bool)

(assert (=> b!45096 m!68833))

(assert (=> b!44877 d!13142))

(declare-fun d!13144 () Bool)

(assert (=> d!13144 (= (head!346 (byteArrayBitContentToList!0 (_2!2288 lt!68713) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!642 (byteArrayBitContentToList!0 (_2!2288 lt!68713) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44879 d!13144))

(declare-fun d!13146 () Bool)

(declare-fun c!3033 () Bool)

(assert (=> d!13146 (= c!3033 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30012 () List!527)

(assert (=> d!13146 (= (byteArrayBitContentToList!0 (_2!2288 lt!68713) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30012)))

(declare-fun b!45101 () Bool)

(assert (=> b!45101 (= e!30012 Nil!524)))

(declare-fun b!45102 () Bool)

(assert (=> b!45102 (= e!30012 (Cons!523 (not (= (bvand ((_ sign_extend 24) (select (arr!1528 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2288 lt!68713) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13146 c!3033) b!45101))

(assert (= (and d!13146 (not c!3033)) b!45102))

(assert (=> b!45102 m!68485))

(declare-fun m!68835 () Bool)

(assert (=> b!45102 m!68835))

(declare-fun m!68837 () Bool)

(assert (=> b!45102 m!68837))

(assert (=> b!44879 d!13146))

(declare-fun d!13148 () Bool)

(assert (=> d!13148 (= (head!346 (bitStreamReadBitsIntoList!0 (_2!2288 lt!68713) (_1!2289 lt!68708) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!642 (bitStreamReadBitsIntoList!0 (_2!2288 lt!68713) (_1!2289 lt!68708) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44879 d!13148))

(declare-fun b!45117 () Bool)

(declare-fun e!30019 () Bool)

(declare-fun lt!69247 () List!527)

(declare-fun isEmpty!130 (List!527) Bool)

(assert (=> b!45117 (= e!30019 (isEmpty!130 lt!69247))))

(declare-datatypes ((tuple2!4412 0))(
  ( (tuple2!4413 (_1!2299 Bool) (_2!2299 BitStream!1772)) )
))
(declare-fun lt!69248 () tuple2!4412)

(declare-fun b!45116 () Bool)

(declare-datatypes ((tuple2!4414 0))(
  ( (tuple2!4415 (_1!2300 List!527) (_2!2300 BitStream!1772)) )
))
(declare-fun e!30020 () tuple2!4414)

(declare-fun lt!69246 () (_ BitVec 64))

(assert (=> b!45116 (= e!30020 (tuple2!4415 (Cons!523 (_1!2299 lt!69248) (bitStreamReadBitsIntoList!0 (_2!2288 lt!68713) (_2!2299 lt!69248) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!69246))) (_2!2299 lt!69248)))))

(declare-fun readBit!0 (BitStream!1772) tuple2!4412)

(assert (=> b!45116 (= lt!69248 (readBit!0 (_1!2289 lt!68708)))))

(assert (=> b!45116 (= lt!69246 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45115 () Bool)

(assert (=> b!45115 (= e!30020 (tuple2!4415 Nil!524 (_1!2289 lt!68708)))))

(declare-fun d!13150 () Bool)

(assert (=> d!13150 e!30019))

(declare-fun c!3041 () Bool)

(assert (=> d!13150 (= c!3041 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13150 (= lt!69247 (_1!2300 e!30020))))

(declare-fun c!3040 () Bool)

(assert (=> d!13150 (= c!3040 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13150 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13150 (= (bitStreamReadBitsIntoList!0 (_2!2288 lt!68713) (_1!2289 lt!68708) #b0000000000000000000000000000000000000000000000000000000000000001) lt!69247)))

(declare-fun b!45118 () Bool)

(declare-fun length!228 (List!527) Int)

(assert (=> b!45118 (= e!30019 (> (length!228 lt!69247) 0))))

(assert (= (and d!13150 c!3040) b!45115))

(assert (= (and d!13150 (not c!3040)) b!45116))

(assert (= (and d!13150 c!3041) b!45117))

(assert (= (and d!13150 (not c!3041)) b!45118))

(declare-fun m!68839 () Bool)

(assert (=> b!45117 m!68839))

(declare-fun m!68841 () Bool)

(assert (=> b!45116 m!68841))

(declare-fun m!68843 () Bool)

(assert (=> b!45116 m!68843))

(declare-fun m!68845 () Bool)

(assert (=> b!45118 m!68845))

(assert (=> b!44879 d!13150))

(declare-fun d!13152 () Bool)

(declare-fun res!38140 () Bool)

(declare-fun e!30022 () Bool)

(assert (=> d!13152 (=> (not res!38140) (not e!30022))))

(assert (=> d!13152 (= res!38140 (= (size!1014 (buf!1360 thiss!1379)) (size!1014 (buf!1360 (_2!2288 lt!68713)))))))

(assert (=> d!13152 (= (isPrefixOf!0 thiss!1379 (_2!2288 lt!68713)) e!30022)))

(declare-fun b!45119 () Bool)

(declare-fun res!38142 () Bool)

(assert (=> b!45119 (=> (not res!38142) (not e!30022))))

(assert (=> b!45119 (= res!38142 (bvsle (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379)) (bitIndex!0 (size!1014 (buf!1360 (_2!2288 lt!68713))) (currentByte!2847 (_2!2288 lt!68713)) (currentBit!2842 (_2!2288 lt!68713)))))))

(declare-fun b!45120 () Bool)

(declare-fun e!30021 () Bool)

(assert (=> b!45120 (= e!30022 e!30021)))

(declare-fun res!38141 () Bool)

(assert (=> b!45120 (=> res!38141 e!30021)))

(assert (=> b!45120 (= res!38141 (= (size!1014 (buf!1360 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45121 () Bool)

(assert (=> b!45121 (= e!30021 (arrayBitRangesEq!0 (buf!1360 thiss!1379) (buf!1360 (_2!2288 lt!68713)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1014 (buf!1360 thiss!1379)) (currentByte!2847 thiss!1379) (currentBit!2842 thiss!1379))))))

(assert (= (and d!13152 res!38140) b!45119))

(assert (= (and b!45119 res!38142) b!45120))

(assert (= (and b!45120 (not res!38141)) b!45121))

(assert (=> b!45119 m!68469))

(assert (=> b!45119 m!68449))

(assert (=> b!45121 m!68469))

(assert (=> b!45121 m!68469))

(declare-fun m!68847 () Bool)

(assert (=> b!45121 m!68847))

(assert (=> b!44878 d!13152))

(declare-fun d!13154 () Bool)

(assert (=> d!13154 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1014 (buf!1360 (_2!2288 lt!68713)))) ((_ sign_extend 32) (currentByte!2847 (_2!2288 lt!68713))) ((_ sign_extend 32) (currentBit!2842 (_2!2288 lt!68713)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3488 () Bool)

(assert (= bs!3488 d!13154))

(declare-fun m!68849 () Bool)

(assert (=> bs!3488 m!68849))

