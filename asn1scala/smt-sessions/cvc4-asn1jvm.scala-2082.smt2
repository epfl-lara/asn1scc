; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52752 () Bool)

(assert start!52752)

(declare-fun b!244159 () Bool)

(declare-fun e!169230 () Bool)

(declare-fun e!169223 () Bool)

(assert (=> b!244159 (= e!169230 e!169223)))

(declare-fun res!204046 () Bool)

(assert (=> b!244159 (=> (not res!204046) (not e!169223))))

(declare-datatypes ((array!13371 0))(
  ( (array!13372 (arr!6849 (Array (_ BitVec 32) (_ BitVec 8))) (size!5862 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10646 0))(
  ( (BitStream!10647 (buf!6334 array!13371) (currentByte!11712 (_ BitVec 32)) (currentBit!11707 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17819 0))(
  ( (Unit!17820) )
))
(declare-datatypes ((tuple2!20934 0))(
  ( (tuple2!20935 (_1!11389 Unit!17819) (_2!11389 BitStream!10646)) )
))
(declare-fun lt!380559 () tuple2!20934)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20936 0))(
  ( (tuple2!20937 (_1!11390 BitStream!10646) (_2!11390 Bool)) )
))
(declare-fun lt!380549 () tuple2!20936)

(assert (=> b!244159 (= res!204046 (and (= (_2!11390 lt!380549) bit!26) (= (_1!11390 lt!380549) (_2!11389 lt!380559))))))

(declare-fun thiss!1005 () BitStream!10646)

(declare-fun readBitPure!0 (BitStream!10646) tuple2!20936)

(declare-fun readerFrom!0 (BitStream!10646 (_ BitVec 32) (_ BitVec 32)) BitStream!10646)

(assert (=> b!244159 (= lt!380549 (readBitPure!0 (readerFrom!0 (_2!11389 lt!380559) (currentBit!11707 thiss!1005) (currentByte!11712 thiss!1005))))))

(declare-fun b!244160 () Bool)

(declare-fun lt!380548 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244160 (= e!169223 (= (bitIndex!0 (size!5862 (buf!6334 (_1!11390 lt!380549))) (currentByte!11712 (_1!11390 lt!380549)) (currentBit!11707 (_1!11390 lt!380549))) lt!380548))))

(declare-fun b!244161 () Bool)

(declare-fun e!169225 () Bool)

(declare-fun lt!380563 () tuple2!20934)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244161 (= e!169225 (invariant!0 (currentBit!11707 thiss!1005) (currentByte!11712 thiss!1005) (size!5862 (buf!6334 (_2!11389 lt!380563)))))))

(declare-fun b!244162 () Bool)

(declare-fun e!169228 () Bool)

(assert (=> b!244162 (= e!169228 e!169230)))

(declare-fun res!204056 () Bool)

(assert (=> b!244162 (=> (not res!204056) (not e!169230))))

(declare-fun lt!380557 () (_ BitVec 64))

(assert (=> b!244162 (= res!204056 (= lt!380548 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380557)))))

(assert (=> b!244162 (= lt!380548 (bitIndex!0 (size!5862 (buf!6334 (_2!11389 lt!380559))) (currentByte!11712 (_2!11389 lt!380559)) (currentBit!11707 (_2!11389 lt!380559))))))

(assert (=> b!244162 (= lt!380557 (bitIndex!0 (size!5862 (buf!6334 thiss!1005)) (currentByte!11712 thiss!1005) (currentBit!11707 thiss!1005)))))

(declare-fun b!244163 () Bool)

(declare-fun res!204048 () Bool)

(assert (=> b!244163 (=> (not res!204048) (not e!169225))))

(assert (=> b!244163 (= res!204048 (invariant!0 (currentBit!11707 thiss!1005) (currentByte!11712 thiss!1005) (size!5862 (buf!6334 (_2!11389 lt!380559)))))))

(declare-fun b!244164 () Bool)

(declare-fun res!204050 () Bool)

(declare-fun e!169226 () Bool)

(assert (=> b!244164 (=> (not res!204050) (not e!169226))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244164 (= res!204050 (validate_offset_bits!1 ((_ sign_extend 32) (size!5862 (buf!6334 thiss!1005))) ((_ sign_extend 32) (currentByte!11712 thiss!1005)) ((_ sign_extend 32) (currentBit!11707 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244165 () Bool)

(declare-fun e!169224 () Bool)

(declare-fun e!169229 () Bool)

(assert (=> b!244165 (= e!169224 e!169229)))

(declare-fun res!204049 () Bool)

(assert (=> b!244165 (=> (not res!204049) (not e!169229))))

(declare-fun lt!380565 () (_ BitVec 64))

(assert (=> b!244165 (= res!204049 (= (bitIndex!0 (size!5862 (buf!6334 (_2!11389 lt!380563))) (currentByte!11712 (_2!11389 lt!380563)) (currentBit!11707 (_2!11389 lt!380563))) (bvadd (bitIndex!0 (size!5862 (buf!6334 (_2!11389 lt!380559))) (currentByte!11712 (_2!11389 lt!380559)) (currentBit!11707 (_2!11389 lt!380559))) lt!380565)))))

(assert (=> b!244165 (= lt!380565 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244167 () Bool)

(declare-fun res!204047 () Bool)

(assert (=> b!244167 (=> (not res!204047) (not e!169230))))

(declare-fun isPrefixOf!0 (BitStream!10646 BitStream!10646) Bool)

(assert (=> b!244167 (= res!204047 (isPrefixOf!0 thiss!1005 (_2!11389 lt!380559)))))

(declare-fun b!244168 () Bool)

(assert (=> b!244168 (= e!169226 (not true))))

(declare-datatypes ((tuple2!20938 0))(
  ( (tuple2!20939 (_1!11391 BitStream!10646) (_2!11391 BitStream!10646)) )
))
(declare-fun lt!380562 () tuple2!20938)

(declare-fun lt!380558 () tuple2!20936)

(declare-fun checkBitsLoopPure!0 (BitStream!10646 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20936)

(assert (=> b!244168 (= lt!380558 (checkBitsLoopPure!0 (_1!11391 lt!380562) nBits!297 bit!26 from!289))))

(assert (=> b!244168 (validate_offset_bits!1 ((_ sign_extend 32) (size!5862 (buf!6334 (_2!11389 lt!380563)))) ((_ sign_extend 32) (currentByte!11712 thiss!1005)) ((_ sign_extend 32) (currentBit!11707 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380555 () Unit!17819)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10646 array!13371 (_ BitVec 64)) Unit!17819)

(assert (=> b!244168 (= lt!380555 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6334 (_2!11389 lt!380563)) (bvsub nBits!297 from!289)))))

(assert (=> b!244168 (= (_2!11390 (readBitPure!0 (_1!11391 lt!380562))) bit!26)))

(declare-fun lt!380551 () tuple2!20938)

(declare-fun reader!0 (BitStream!10646 BitStream!10646) tuple2!20938)

(assert (=> b!244168 (= lt!380551 (reader!0 (_2!11389 lt!380559) (_2!11389 lt!380563)))))

(assert (=> b!244168 (= lt!380562 (reader!0 thiss!1005 (_2!11389 lt!380563)))))

(declare-fun e!169227 () Bool)

(assert (=> b!244168 e!169227))

(declare-fun res!204045 () Bool)

(assert (=> b!244168 (=> (not res!204045) (not e!169227))))

(declare-fun lt!380550 () tuple2!20936)

(declare-fun lt!380561 () tuple2!20936)

(assert (=> b!244168 (= res!204045 (= (bitIndex!0 (size!5862 (buf!6334 (_1!11390 lt!380550))) (currentByte!11712 (_1!11390 lt!380550)) (currentBit!11707 (_1!11390 lt!380550))) (bitIndex!0 (size!5862 (buf!6334 (_1!11390 lt!380561))) (currentByte!11712 (_1!11390 lt!380561)) (currentBit!11707 (_1!11390 lt!380561)))))))

(declare-fun lt!380560 () Unit!17819)

(declare-fun lt!380556 () BitStream!10646)

(declare-fun readBitPrefixLemma!0 (BitStream!10646 BitStream!10646) Unit!17819)

(assert (=> b!244168 (= lt!380560 (readBitPrefixLemma!0 lt!380556 (_2!11389 lt!380563)))))

(assert (=> b!244168 (= lt!380561 (readBitPure!0 (BitStream!10647 (buf!6334 (_2!11389 lt!380563)) (currentByte!11712 thiss!1005) (currentBit!11707 thiss!1005))))))

(assert (=> b!244168 (= lt!380550 (readBitPure!0 lt!380556))))

(assert (=> b!244168 (= lt!380556 (BitStream!10647 (buf!6334 (_2!11389 lt!380559)) (currentByte!11712 thiss!1005) (currentBit!11707 thiss!1005)))))

(assert (=> b!244168 e!169225))

(declare-fun res!204051 () Bool)

(assert (=> b!244168 (=> (not res!204051) (not e!169225))))

(assert (=> b!244168 (= res!204051 (isPrefixOf!0 thiss!1005 (_2!11389 lt!380563)))))

(declare-fun lt!380554 () Unit!17819)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10646 BitStream!10646 BitStream!10646) Unit!17819)

(assert (=> b!244168 (= lt!380554 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11389 lt!380559) (_2!11389 lt!380563)))))

(assert (=> b!244168 e!169224))

(declare-fun res!204055 () Bool)

(assert (=> b!244168 (=> (not res!204055) (not e!169224))))

(assert (=> b!244168 (= res!204055 (= (size!5862 (buf!6334 (_2!11389 lt!380559))) (size!5862 (buf!6334 (_2!11389 lt!380563)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10646 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20934)

(assert (=> b!244168 (= lt!380563 (appendNBitsLoop!0 (_2!11389 lt!380559) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244168 (validate_offset_bits!1 ((_ sign_extend 32) (size!5862 (buf!6334 (_2!11389 lt!380559)))) ((_ sign_extend 32) (currentByte!11712 (_2!11389 lt!380559))) ((_ sign_extend 32) (currentBit!11707 (_2!11389 lt!380559))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380552 () Unit!17819)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10646 BitStream!10646 (_ BitVec 64) (_ BitVec 64)) Unit!17819)

(assert (=> b!244168 (= lt!380552 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11389 lt!380559) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244168 e!169228))

(declare-fun res!204052 () Bool)

(assert (=> b!244168 (=> (not res!204052) (not e!169228))))

(assert (=> b!244168 (= res!204052 (= (size!5862 (buf!6334 thiss!1005)) (size!5862 (buf!6334 (_2!11389 lt!380559)))))))

(declare-fun appendBit!0 (BitStream!10646 Bool) tuple2!20934)

(assert (=> b!244168 (= lt!380559 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244169 () Bool)

(declare-fun res!204057 () Bool)

(assert (=> b!244169 (=> (not res!204057) (not e!169229))))

(assert (=> b!244169 (= res!204057 (isPrefixOf!0 (_2!11389 lt!380559) (_2!11389 lt!380563)))))

(declare-fun b!244170 () Bool)

(declare-fun res!204054 () Bool)

(assert (=> b!244170 (=> (not res!204054) (not e!169226))))

(assert (=> b!244170 (= res!204054 (bvslt from!289 nBits!297))))

(declare-fun b!244171 () Bool)

(declare-fun lt!380564 () tuple2!20936)

(declare-fun lt!380547 () tuple2!20938)

(assert (=> b!244171 (= e!169229 (not (or (not (_2!11390 lt!380564)) (not (= (_1!11390 lt!380564) (_2!11391 lt!380547))))))))

(assert (=> b!244171 (= lt!380564 (checkBitsLoopPure!0 (_1!11391 lt!380547) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244171 (validate_offset_bits!1 ((_ sign_extend 32) (size!5862 (buf!6334 (_2!11389 lt!380563)))) ((_ sign_extend 32) (currentByte!11712 (_2!11389 lt!380559))) ((_ sign_extend 32) (currentBit!11707 (_2!11389 lt!380559))) lt!380565)))

(declare-fun lt!380553 () Unit!17819)

(assert (=> b!244171 (= lt!380553 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11389 lt!380559) (buf!6334 (_2!11389 lt!380563)) lt!380565))))

(assert (=> b!244171 (= lt!380547 (reader!0 (_2!11389 lt!380559) (_2!11389 lt!380563)))))

(declare-fun b!244172 () Bool)

(assert (=> b!244172 (= e!169227 (= (_2!11390 lt!380550) (_2!11390 lt!380561)))))

(declare-fun res!204053 () Bool)

(assert (=> start!52752 (=> (not res!204053) (not e!169226))))

(assert (=> start!52752 (= res!204053 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52752 e!169226))

(assert (=> start!52752 true))

(declare-fun e!169232 () Bool)

(declare-fun inv!12 (BitStream!10646) Bool)

(assert (=> start!52752 (and (inv!12 thiss!1005) e!169232)))

(declare-fun b!244166 () Bool)

(declare-fun array_inv!5603 (array!13371) Bool)

(assert (=> b!244166 (= e!169232 (array_inv!5603 (buf!6334 thiss!1005)))))

(assert (= (and start!52752 res!204053) b!244164))

(assert (= (and b!244164 res!204050) b!244170))

(assert (= (and b!244170 res!204054) b!244168))

(assert (= (and b!244168 res!204052) b!244162))

(assert (= (and b!244162 res!204056) b!244167))

(assert (= (and b!244167 res!204047) b!244159))

(assert (= (and b!244159 res!204046) b!244160))

(assert (= (and b!244168 res!204055) b!244165))

(assert (= (and b!244165 res!204049) b!244169))

(assert (= (and b!244169 res!204057) b!244171))

(assert (= (and b!244168 res!204051) b!244163))

(assert (= (and b!244163 res!204048) b!244161))

(assert (= (and b!244168 res!204045) b!244172))

(assert (= start!52752 b!244166))

(declare-fun m!367955 () Bool)

(assert (=> b!244166 m!367955))

(declare-fun m!367957 () Bool)

(assert (=> b!244169 m!367957))

(declare-fun m!367959 () Bool)

(assert (=> b!244160 m!367959))

(declare-fun m!367961 () Bool)

(assert (=> b!244161 m!367961))

(declare-fun m!367963 () Bool)

(assert (=> b!244159 m!367963))

(assert (=> b!244159 m!367963))

(declare-fun m!367965 () Bool)

(assert (=> b!244159 m!367965))

(declare-fun m!367967 () Bool)

(assert (=> b!244162 m!367967))

(declare-fun m!367969 () Bool)

(assert (=> b!244162 m!367969))

(declare-fun m!367971 () Bool)

(assert (=> b!244163 m!367971))

(declare-fun m!367973 () Bool)

(assert (=> b!244168 m!367973))

(declare-fun m!367975 () Bool)

(assert (=> b!244168 m!367975))

(declare-fun m!367977 () Bool)

(assert (=> b!244168 m!367977))

(declare-fun m!367979 () Bool)

(assert (=> b!244168 m!367979))

(declare-fun m!367981 () Bool)

(assert (=> b!244168 m!367981))

(declare-fun m!367983 () Bool)

(assert (=> b!244168 m!367983))

(declare-fun m!367985 () Bool)

(assert (=> b!244168 m!367985))

(declare-fun m!367987 () Bool)

(assert (=> b!244168 m!367987))

(declare-fun m!367989 () Bool)

(assert (=> b!244168 m!367989))

(declare-fun m!367991 () Bool)

(assert (=> b!244168 m!367991))

(declare-fun m!367993 () Bool)

(assert (=> b!244168 m!367993))

(declare-fun m!367995 () Bool)

(assert (=> b!244168 m!367995))

(declare-fun m!367997 () Bool)

(assert (=> b!244168 m!367997))

(declare-fun m!367999 () Bool)

(assert (=> b!244168 m!367999))

(declare-fun m!368001 () Bool)

(assert (=> b!244168 m!368001))

(declare-fun m!368003 () Bool)

(assert (=> b!244168 m!368003))

(declare-fun m!368005 () Bool)

(assert (=> b!244168 m!368005))

(declare-fun m!368007 () Bool)

(assert (=> b!244167 m!368007))

(declare-fun m!368009 () Bool)

(assert (=> b!244165 m!368009))

(assert (=> b!244165 m!367967))

(declare-fun m!368011 () Bool)

(assert (=> start!52752 m!368011))

(declare-fun m!368013 () Bool)

(assert (=> b!244171 m!368013))

(declare-fun m!368015 () Bool)

(assert (=> b!244171 m!368015))

(declare-fun m!368017 () Bool)

(assert (=> b!244171 m!368017))

(assert (=> b!244171 m!367975))

(declare-fun m!368019 () Bool)

(assert (=> b!244164 m!368019))

(push 1)

(assert (not start!52752))

(assert (not b!244161))

(assert (not b!244162))

(assert (not b!244171))

(assert (not b!244166))

(assert (not b!244168))

(assert (not b!244167))

(assert (not b!244159))

(assert (not b!244164))

(assert (not b!244169))

(assert (not b!244163))

(assert (not b!244160))

(assert (not b!244165))

(check-sat)

