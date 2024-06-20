; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52982 () Bool)

(assert start!52982)

(declare-fun b!245378 () Bool)

(declare-fun e!170022 () Bool)

(declare-fun e!170016 () Bool)

(assert (=> b!245378 (= e!170022 e!170016)))

(declare-fun res!205172 () Bool)

(assert (=> b!245378 (=> res!205172 e!170016)))

(declare-datatypes ((array!13409 0))(
  ( (array!13410 (arr!6865 (Array (_ BitVec 32) (_ BitVec 8))) (size!5878 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10678 0))(
  ( (BitStream!10679 (buf!6356 array!13409) (currentByte!11746 (_ BitVec 32)) (currentBit!11741 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10678)

(declare-datatypes ((Unit!17863 0))(
  ( (Unit!17864) )
))
(declare-datatypes ((tuple2!21042 0))(
  ( (tuple2!21043 (_1!11443 Unit!17863) (_2!11443 BitStream!10678)) )
))
(declare-fun lt!382738 () tuple2!21042)

(assert (=> b!245378 (= res!205172 (not (= (size!5878 (buf!6356 thiss!1005)) (size!5878 (buf!6356 (_2!11443 lt!382738))))))))

(declare-datatypes ((tuple2!21044 0))(
  ( (tuple2!21045 (_1!11444 BitStream!10678) (_2!11444 Bool)) )
))
(declare-fun lt!382750 () tuple2!21044)

(declare-fun lt!382731 () tuple2!21044)

(declare-datatypes ((tuple2!21046 0))(
  ( (tuple2!21047 (_1!11445 BitStream!10678) (_2!11445 BitStream!10678)) )
))
(declare-fun lt!382736 () tuple2!21046)

(assert (=> b!245378 (and (= (_2!11444 lt!382750) (_2!11444 lt!382731)) (= (_1!11444 lt!382750) (_2!11445 lt!382736)))))

(declare-fun b!245379 () Bool)

(declare-fun e!170025 () Bool)

(declare-fun lt!382744 () tuple2!21044)

(declare-fun lt!382735 () tuple2!21044)

(assert (=> b!245379 (= e!170025 (= (_2!11444 lt!382744) (_2!11444 lt!382735)))))

(declare-fun b!245380 () Bool)

(declare-fun res!205174 () Bool)

(declare-fun e!170026 () Bool)

(assert (=> b!245380 (=> (not res!205174) (not e!170026))))

(declare-fun lt!382737 () tuple2!21042)

(declare-fun isPrefixOf!0 (BitStream!10678 BitStream!10678) Bool)

(assert (=> b!245380 (= res!205174 (isPrefixOf!0 (_2!11443 lt!382737) (_2!11443 lt!382738)))))

(declare-fun b!245381 () Bool)

(declare-fun e!170018 () Bool)

(assert (=> b!245381 (= e!170018 e!170026)))

(declare-fun res!205179 () Bool)

(assert (=> b!245381 (=> (not res!205179) (not e!170026))))

(declare-fun lt!382740 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245381 (= res!205179 (= (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382738))) (currentByte!11746 (_2!11443 lt!382738)) (currentBit!11741 (_2!11443 lt!382738))) (bvadd (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))) lt!382740)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!245381 (= lt!382740 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245382 () Bool)

(declare-fun e!170021 () Bool)

(declare-fun lt!382734 () tuple2!21044)

(declare-fun lt!382749 () (_ BitVec 64))

(assert (=> b!245382 (= e!170021 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!382734))) (currentByte!11746 (_1!11444 lt!382734)) (currentBit!11741 (_1!11444 lt!382734))) lt!382749))))

(declare-fun b!245383 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245383 (= e!170016 (invariant!0 (currentBit!11741 (_2!11443 lt!382738)) (currentByte!11746 (_2!11443 lt!382738)) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(declare-fun b!245384 () Bool)

(declare-fun res!205177 () Bool)

(assert (=> b!245384 (=> res!205177 e!170022)))

(declare-fun lt!382743 () tuple2!21046)

(declare-fun withMovedBitIndex!0 (BitStream!10678 (_ BitVec 64)) BitStream!10678)

(assert (=> b!245384 (= res!205177 (not (= (_1!11445 lt!382743) (withMovedBitIndex!0 (_1!11445 lt!382736) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245385 () Bool)

(declare-fun e!170024 () Bool)

(assert (=> b!245385 (= e!170024 (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(declare-fun b!245386 () Bool)

(declare-fun e!170017 () Bool)

(declare-fun e!170019 () Bool)

(assert (=> b!245386 (= e!170017 e!170019)))

(declare-fun res!205178 () Bool)

(assert (=> b!245386 (=> (not res!205178) (not e!170019))))

(declare-fun lt!382748 () (_ BitVec 64))

(assert (=> b!245386 (= res!205178 (= lt!382749 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!382748)))))

(assert (=> b!245386 (= lt!382749 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))))))

(assert (=> b!245386 (= lt!382748 (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(declare-fun b!245387 () Bool)

(declare-fun res!205164 () Bool)

(assert (=> b!245387 (=> (not res!205164) (not e!170024))))

(assert (=> b!245387 (= res!205164 (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(declare-fun res!205170 () Bool)

(declare-fun e!170027 () Bool)

(assert (=> start!52982 (=> (not res!205170) (not e!170027))))

(assert (=> start!52982 (= res!205170 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52982 e!170027))

(assert (=> start!52982 true))

(declare-fun e!170023 () Bool)

(declare-fun inv!12 (BitStream!10678) Bool)

(assert (=> start!52982 (and (inv!12 thiss!1005) e!170023)))

(declare-fun b!245377 () Bool)

(declare-fun res!205176 () Bool)

(assert (=> b!245377 (=> (not res!205176) (not e!170027))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245377 (= res!205176 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245388 () Bool)

(assert (=> b!245388 (= e!170019 e!170021)))

(declare-fun res!205169 () Bool)

(assert (=> b!245388 (=> (not res!205169) (not e!170021))))

(declare-fun bit!26 () Bool)

(assert (=> b!245388 (= res!205169 (and (= (_2!11444 lt!382734) bit!26) (= (_1!11444 lt!382734) (_2!11443 lt!382737))))))

(declare-fun readBitPure!0 (BitStream!10678) tuple2!21044)

(declare-fun readerFrom!0 (BitStream!10678 (_ BitVec 32) (_ BitVec 32)) BitStream!10678)

(assert (=> b!245388 (= lt!382734 (readBitPure!0 (readerFrom!0 (_2!11443 lt!382737) (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005))))))

(declare-fun b!245389 () Bool)

(declare-fun lt!382746 () tuple2!21044)

(declare-fun lt!382751 () tuple2!21046)

(assert (=> b!245389 (= e!170026 (not (or (not (_2!11444 lt!382746)) (not (= (_1!11444 lt!382746) (_2!11445 lt!382751))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10678 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21044)

(assert (=> b!245389 (= lt!382746 (checkBitsLoopPure!0 (_1!11445 lt!382751) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245389 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382740)))

(declare-fun lt!382741 () Unit!17863)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10678 array!13409 (_ BitVec 64)) Unit!17863)

(assert (=> b!245389 (= lt!382741 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!382738)) lt!382740))))

(declare-fun reader!0 (BitStream!10678 BitStream!10678) tuple2!21046)

(assert (=> b!245389 (= lt!382751 (reader!0 (_2!11443 lt!382737) (_2!11443 lt!382738)))))

(declare-fun b!245390 () Bool)

(declare-fun res!205167 () Bool)

(assert (=> b!245390 (=> (not res!205167) (not e!170027))))

(assert (=> b!245390 (= res!205167 (bvslt from!289 nBits!297))))

(declare-fun b!245391 () Bool)

(declare-fun array_inv!5619 (array!13409) Bool)

(assert (=> b!245391 (= e!170023 (array_inv!5619 (buf!6356 thiss!1005)))))

(declare-fun b!245392 () Bool)

(declare-fun res!205175 () Bool)

(assert (=> b!245392 (=> (not res!205175) (not e!170019))))

(assert (=> b!245392 (= res!205175 (isPrefixOf!0 thiss!1005 (_2!11443 lt!382737)))))

(declare-fun b!245393 () Bool)

(assert (=> b!245393 (= e!170027 (not e!170022))))

(declare-fun res!205171 () Bool)

(assert (=> b!245393 (=> res!205171 e!170022)))

(assert (=> b!245393 (= res!205171 (not (= (_1!11444 lt!382731) (_2!11445 lt!382743))))))

(assert (=> b!245393 (= lt!382731 (checkBitsLoopPure!0 (_1!11445 lt!382743) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382733 () (_ BitVec 64))

(assert (=> b!245393 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382733)))

(declare-fun lt!382752 () Unit!17863)

(assert (=> b!245393 (= lt!382752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!382738)) lt!382733))))

(assert (=> b!245393 (= lt!382750 (checkBitsLoopPure!0 (_1!11445 lt!382736) nBits!297 bit!26 from!289))))

(assert (=> b!245393 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382742 () Unit!17863)

(assert (=> b!245393 (= lt!382742 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6356 (_2!11443 lt!382738)) (bvsub nBits!297 from!289)))))

(assert (=> b!245393 (= (_2!11444 (readBitPure!0 (_1!11445 lt!382736))) bit!26)))

(assert (=> b!245393 (= lt!382743 (reader!0 (_2!11443 lt!382737) (_2!11443 lt!382738)))))

(assert (=> b!245393 (= lt!382736 (reader!0 thiss!1005 (_2!11443 lt!382738)))))

(assert (=> b!245393 e!170025))

(declare-fun res!205165 () Bool)

(assert (=> b!245393 (=> (not res!205165) (not e!170025))))

(assert (=> b!245393 (= res!205165 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!382744))) (currentByte!11746 (_1!11444 lt!382744)) (currentBit!11741 (_1!11444 lt!382744))) (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!382735))) (currentByte!11746 (_1!11444 lt!382735)) (currentBit!11741 (_1!11444 lt!382735)))))))

(declare-fun lt!382747 () Unit!17863)

(declare-fun lt!382732 () BitStream!10678)

(declare-fun readBitPrefixLemma!0 (BitStream!10678 BitStream!10678) Unit!17863)

(assert (=> b!245393 (= lt!382747 (readBitPrefixLemma!0 lt!382732 (_2!11443 lt!382738)))))

(assert (=> b!245393 (= lt!382735 (readBitPure!0 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005))))))

(assert (=> b!245393 (= lt!382744 (readBitPure!0 lt!382732))))

(assert (=> b!245393 (= lt!382732 (BitStream!10679 (buf!6356 (_2!11443 lt!382737)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(assert (=> b!245393 e!170024))

(declare-fun res!205168 () Bool)

(assert (=> b!245393 (=> (not res!205168) (not e!170024))))

(assert (=> b!245393 (= res!205168 (isPrefixOf!0 thiss!1005 (_2!11443 lt!382738)))))

(declare-fun lt!382739 () Unit!17863)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10678 BitStream!10678 BitStream!10678) Unit!17863)

(assert (=> b!245393 (= lt!382739 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11443 lt!382737) (_2!11443 lt!382738)))))

(assert (=> b!245393 e!170018))

(declare-fun res!205166 () Bool)

(assert (=> b!245393 (=> (not res!205166) (not e!170018))))

(assert (=> b!245393 (= res!205166 (= (size!5878 (buf!6356 (_2!11443 lt!382737))) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10678 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21042)

(assert (=> b!245393 (= lt!382738 (appendNBitsLoop!0 (_2!11443 lt!382737) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245393 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382733)))

(assert (=> b!245393 (= lt!382733 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!382745 () Unit!17863)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10678 BitStream!10678 (_ BitVec 64) (_ BitVec 64)) Unit!17863)

(assert (=> b!245393 (= lt!382745 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11443 lt!382737) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245393 e!170017))

(declare-fun res!205173 () Bool)

(assert (=> b!245393 (=> (not res!205173) (not e!170017))))

(assert (=> b!245393 (= res!205173 (= (size!5878 (buf!6356 thiss!1005)) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(declare-fun appendBit!0 (BitStream!10678 Bool) tuple2!21042)

(assert (=> b!245393 (= lt!382737 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52982 res!205170) b!245377))

(assert (= (and b!245377 res!205176) b!245390))

(assert (= (and b!245390 res!205167) b!245393))

(assert (= (and b!245393 res!205173) b!245386))

(assert (= (and b!245386 res!205178) b!245392))

(assert (= (and b!245392 res!205175) b!245388))

(assert (= (and b!245388 res!205169) b!245382))

(assert (= (and b!245393 res!205166) b!245381))

(assert (= (and b!245381 res!205179) b!245380))

(assert (= (and b!245380 res!205174) b!245389))

(assert (= (and b!245393 res!205168) b!245387))

(assert (= (and b!245387 res!205164) b!245385))

(assert (= (and b!245393 res!205165) b!245379))

(assert (= (and b!245393 (not res!205171)) b!245384))

(assert (= (and b!245384 (not res!205177)) b!245378))

(assert (= (and b!245378 (not res!205172)) b!245383))

(assert (= start!52982 b!245391))

(declare-fun m!370019 () Bool)

(assert (=> b!245384 m!370019))

(declare-fun m!370021 () Bool)

(assert (=> b!245383 m!370021))

(declare-fun m!370023 () Bool)

(assert (=> b!245377 m!370023))

(declare-fun m!370025 () Bool)

(assert (=> b!245391 m!370025))

(declare-fun m!370027 () Bool)

(assert (=> b!245389 m!370027))

(declare-fun m!370029 () Bool)

(assert (=> b!245389 m!370029))

(declare-fun m!370031 () Bool)

(assert (=> b!245389 m!370031))

(declare-fun m!370033 () Bool)

(assert (=> b!245389 m!370033))

(declare-fun m!370035 () Bool)

(assert (=> b!245388 m!370035))

(assert (=> b!245388 m!370035))

(declare-fun m!370037 () Bool)

(assert (=> b!245388 m!370037))

(declare-fun m!370039 () Bool)

(assert (=> b!245385 m!370039))

(declare-fun m!370041 () Bool)

(assert (=> b!245382 m!370041))

(declare-fun m!370043 () Bool)

(assert (=> start!52982 m!370043))

(declare-fun m!370045 () Bool)

(assert (=> b!245386 m!370045))

(declare-fun m!370047 () Bool)

(assert (=> b!245386 m!370047))

(declare-fun m!370049 () Bool)

(assert (=> b!245381 m!370049))

(assert (=> b!245381 m!370045))

(declare-fun m!370051 () Bool)

(assert (=> b!245393 m!370051))

(declare-fun m!370053 () Bool)

(assert (=> b!245393 m!370053))

(declare-fun m!370055 () Bool)

(assert (=> b!245393 m!370055))

(declare-fun m!370057 () Bool)

(assert (=> b!245393 m!370057))

(declare-fun m!370059 () Bool)

(assert (=> b!245393 m!370059))

(declare-fun m!370061 () Bool)

(assert (=> b!245393 m!370061))

(declare-fun m!370063 () Bool)

(assert (=> b!245393 m!370063))

(declare-fun m!370065 () Bool)

(assert (=> b!245393 m!370065))

(declare-fun m!370067 () Bool)

(assert (=> b!245393 m!370067))

(assert (=> b!245393 m!370033))

(declare-fun m!370069 () Bool)

(assert (=> b!245393 m!370069))

(declare-fun m!370071 () Bool)

(assert (=> b!245393 m!370071))

(declare-fun m!370073 () Bool)

(assert (=> b!245393 m!370073))

(declare-fun m!370075 () Bool)

(assert (=> b!245393 m!370075))

(declare-fun m!370077 () Bool)

(assert (=> b!245393 m!370077))

(declare-fun m!370079 () Bool)

(assert (=> b!245393 m!370079))

(declare-fun m!370081 () Bool)

(assert (=> b!245393 m!370081))

(declare-fun m!370083 () Bool)

(assert (=> b!245393 m!370083))

(declare-fun m!370085 () Bool)

(assert (=> b!245393 m!370085))

(declare-fun m!370087 () Bool)

(assert (=> b!245393 m!370087))

(declare-fun m!370089 () Bool)

(assert (=> b!245387 m!370089))

(declare-fun m!370091 () Bool)

(assert (=> b!245392 m!370091))

(declare-fun m!370093 () Bool)

(assert (=> b!245380 m!370093))

(push 1)

(assert (not b!245392))

(assert (not b!245388))

(assert (not b!245380))

(assert (not b!245387))

(assert (not b!245383))

(assert (not b!245391))

(assert (not start!52982))

(assert (not b!245382))

(assert (not b!245384))

(assert (not b!245377))

(assert (not b!245381))

(assert (not b!245386))

(assert (not b!245385))

(assert (not b!245393))

(assert (not b!245389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82390 () Bool)

(declare-fun res!205338 () Bool)

(declare-fun e!170137 () Bool)

(assert (=> d!82390 (=> (not res!205338) (not e!170137))))

(assert (=> d!82390 (= res!205338 (= (size!5878 (buf!6356 thiss!1005)) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(assert (=> d!82390 (= (isPrefixOf!0 thiss!1005 (_2!11443 lt!382737)) e!170137)))

(declare-fun b!245565 () Bool)

(declare-fun res!205337 () Bool)

(assert (=> b!245565 (=> (not res!205337) (not e!170137))))

(assert (=> b!245565 (= res!205337 (bvsle (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)) (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737)))))))

(declare-fun b!245566 () Bool)

(declare-fun e!170136 () Bool)

(assert (=> b!245566 (= e!170137 e!170136)))

(declare-fun res!205336 () Bool)

(assert (=> b!245566 (=> res!205336 e!170136)))

(assert (=> b!245566 (= res!205336 (= (size!5878 (buf!6356 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245567 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13409 array!13409 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245567 (= e!170136 (arrayBitRangesEq!0 (buf!6356 thiss!1005) (buf!6356 (_2!11443 lt!382737)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005))))))

(assert (= (and d!82390 res!205338) b!245565))

(assert (= (and b!245565 res!205337) b!245566))

(assert (= (and b!245566 (not res!205336)) b!245567))

(assert (=> b!245565 m!370047))

(assert (=> b!245565 m!370045))

(assert (=> b!245567 m!370047))

(assert (=> b!245567 m!370047))

(declare-fun m!370335 () Bool)

(assert (=> b!245567 m!370335))

(assert (=> b!245392 d!82390))

(declare-fun d!82394 () Bool)

(declare-fun e!170143 () Bool)

(assert (=> d!82394 e!170143))

(declare-fun res!205346 () Bool)

(assert (=> d!82394 (=> (not res!205346) (not e!170143))))

(declare-fun lt!383063 () (_ BitVec 64))

(declare-fun lt!383060 () (_ BitVec 64))

(declare-fun lt!383064 () (_ BitVec 64))

(assert (=> d!82394 (= res!205346 (= lt!383064 (bvsub lt!383060 lt!383063)))))

(assert (=> d!82394 (or (= (bvand lt!383060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383060 lt!383063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82394 (= lt!383063 (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382738))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382738)))))))

(declare-fun lt!383061 () (_ BitVec 64))

(declare-fun lt!383059 () (_ BitVec 64))

(assert (=> d!82394 (= lt!383060 (bvmul lt!383061 lt!383059))))

(assert (=> d!82394 (or (= lt!383061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383059 (bvsdiv (bvmul lt!383061 lt!383059) lt!383061)))))

(assert (=> d!82394 (= lt!383059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82394 (= lt!383061 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(assert (=> d!82394 (= lt!383064 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382738))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382738)))))))

(assert (=> d!82394 (invariant!0 (currentBit!11741 (_2!11443 lt!382738)) (currentByte!11746 (_2!11443 lt!382738)) (size!5878 (buf!6356 (_2!11443 lt!382738))))))

(assert (=> d!82394 (= (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382738))) (currentByte!11746 (_2!11443 lt!382738)) (currentBit!11741 (_2!11443 lt!382738))) lt!383064)))

(declare-fun b!245575 () Bool)

(declare-fun res!205347 () Bool)

(assert (=> b!245575 (=> (not res!205347) (not e!170143))))

(assert (=> b!245575 (= res!205347 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383064))))

(declare-fun b!245576 () Bool)

(declare-fun lt!383062 () (_ BitVec 64))

(assert (=> b!245576 (= e!170143 (bvsle lt!383064 (bvmul lt!383062 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245576 (or (= lt!383062 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383062 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383062)))))

(assert (=> b!245576 (= lt!383062 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(assert (= (and d!82394 res!205346) b!245575))

(assert (= (and b!245575 res!205347) b!245576))

(declare-fun m!370359 () Bool)

(assert (=> d!82394 m!370359))

(assert (=> d!82394 m!370021))

(assert (=> b!245381 d!82394))

(declare-fun d!82400 () Bool)

(declare-fun e!170144 () Bool)

(assert (=> d!82400 e!170144))

(declare-fun res!205348 () Bool)

(assert (=> d!82400 (=> (not res!205348) (not e!170144))))

(declare-fun lt!383070 () (_ BitVec 64))

(declare-fun lt!383066 () (_ BitVec 64))

(declare-fun lt!383069 () (_ BitVec 64))

(assert (=> d!82400 (= res!205348 (= lt!383070 (bvsub lt!383066 lt!383069)))))

(assert (=> d!82400 (or (= (bvand lt!383066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383066 lt!383069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82400 (= lt!383069 (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737)))))))

(declare-fun lt!383067 () (_ BitVec 64))

(declare-fun lt!383065 () (_ BitVec 64))

(assert (=> d!82400 (= lt!383066 (bvmul lt!383067 lt!383065))))

(assert (=> d!82400 (or (= lt!383067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383065 (bvsdiv (bvmul lt!383067 lt!383065) lt!383067)))))

(assert (=> d!82400 (= lt!383065 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82400 (= lt!383067 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(assert (=> d!82400 (= lt!383070 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737)))))))

(assert (=> d!82400 (invariant!0 (currentBit!11741 (_2!11443 lt!382737)) (currentByte!11746 (_2!11443 lt!382737)) (size!5878 (buf!6356 (_2!11443 lt!382737))))))

(assert (=> d!82400 (= (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))) lt!383070)))

(declare-fun b!245577 () Bool)

(declare-fun res!205349 () Bool)

(assert (=> b!245577 (=> (not res!205349) (not e!170144))))

(assert (=> b!245577 (= res!205349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383070))))

(declare-fun b!245578 () Bool)

(declare-fun lt!383068 () (_ BitVec 64))

(assert (=> b!245578 (= e!170144 (bvsle lt!383070 (bvmul lt!383068 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245578 (or (= lt!383068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383068)))))

(assert (=> b!245578 (= lt!383068 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(assert (= (and d!82400 res!205348) b!245577))

(assert (= (and b!245577 res!205349) b!245578))

(declare-fun m!370373 () Bool)

(assert (=> d!82400 m!370373))

(declare-fun m!370375 () Bool)

(assert (=> d!82400 m!370375))

(assert (=> b!245381 d!82400))

(declare-fun d!82406 () Bool)

(declare-fun e!170146 () Bool)

(assert (=> d!82406 e!170146))

(declare-fun res!205352 () Bool)

(assert (=> d!82406 (=> (not res!205352) (not e!170146))))

(declare-fun lt!383081 () (_ BitVec 64))

(declare-fun lt!383078 () (_ BitVec 64))

(declare-fun lt!383082 () (_ BitVec 64))

(assert (=> d!82406 (= res!205352 (= lt!383082 (bvsub lt!383078 lt!383081)))))

(assert (=> d!82406 (or (= (bvand lt!383078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383078 lt!383081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82406 (= lt!383081 (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382734)))) ((_ sign_extend 32) (currentByte!11746 (_1!11444 lt!382734))) ((_ sign_extend 32) (currentBit!11741 (_1!11444 lt!382734)))))))

(declare-fun lt!383079 () (_ BitVec 64))

(declare-fun lt!383077 () (_ BitVec 64))

(assert (=> d!82406 (= lt!383078 (bvmul lt!383079 lt!383077))))

(assert (=> d!82406 (or (= lt!383079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383077 (bvsdiv (bvmul lt!383079 lt!383077) lt!383079)))))

(assert (=> d!82406 (= lt!383077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82406 (= lt!383079 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382734)))))))

(assert (=> d!82406 (= lt!383082 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11746 (_1!11444 lt!382734))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11741 (_1!11444 lt!382734)))))))

(assert (=> d!82406 (invariant!0 (currentBit!11741 (_1!11444 lt!382734)) (currentByte!11746 (_1!11444 lt!382734)) (size!5878 (buf!6356 (_1!11444 lt!382734))))))

(assert (=> d!82406 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!382734))) (currentByte!11746 (_1!11444 lt!382734)) (currentBit!11741 (_1!11444 lt!382734))) lt!383082)))

(declare-fun b!245581 () Bool)

(declare-fun res!205353 () Bool)

(assert (=> b!245581 (=> (not res!205353) (not e!170146))))

(assert (=> b!245581 (= res!205353 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383082))))

(declare-fun b!245582 () Bool)

(declare-fun lt!383080 () (_ BitVec 64))

(assert (=> b!245582 (= e!170146 (bvsle lt!383082 (bvmul lt!383080 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245582 (or (= lt!383080 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383080 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383080)))))

(assert (=> b!245582 (= lt!383080 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382734)))))))

(assert (= (and d!82406 res!205352) b!245581))

(assert (= (and b!245581 res!205353) b!245582))

(declare-fun m!370381 () Bool)

(assert (=> d!82406 m!370381))

(declare-fun m!370383 () Bool)

(assert (=> d!82406 m!370383))

(assert (=> b!245382 d!82406))

(declare-fun d!82410 () Bool)

(assert (=> d!82410 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 thiss!1005))))))

(declare-fun bs!20853 () Bool)

(assert (= bs!20853 d!82410))

(declare-fun m!370393 () Bool)

(assert (=> bs!20853 m!370393))

(assert (=> start!52982 d!82410))

(declare-fun d!82420 () Bool)

(assert (=> d!82420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20854 () Bool)

(assert (= bs!20854 d!82420))

(declare-fun m!370395 () Bool)

(assert (=> bs!20854 m!370395))

(assert (=> b!245393 d!82420))

(declare-fun d!82422 () Bool)

(assert (=> d!82422 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382733) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737)))) lt!382733))))

(declare-fun bs!20855 () Bool)

(assert (= bs!20855 d!82422))

(assert (=> bs!20855 m!370373))

(assert (=> b!245393 d!82422))

(declare-datatypes ((tuple2!21062 0))(
  ( (tuple2!21063 (_1!11453 Bool) (_2!11453 BitStream!10678)) )
))
(declare-fun lt!383103 () tuple2!21062)

(declare-fun d!82424 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10678 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21062)

(assert (=> d!82424 (= lt!383103 (checkBitsLoop!0 (_1!11445 lt!382736) nBits!297 bit!26 from!289))))

(assert (=> d!82424 (= (checkBitsLoopPure!0 (_1!11445 lt!382736) nBits!297 bit!26 from!289) (tuple2!21045 (_2!11453 lt!383103) (_1!11453 lt!383103)))))

(declare-fun bs!20860 () Bool)

(assert (= bs!20860 d!82424))

(declare-fun m!370407 () Bool)

(assert (=> bs!20860 m!370407))

(assert (=> b!245393 d!82424))

(declare-fun d!82442 () Bool)

(declare-fun e!170149 () Bool)

(assert (=> d!82442 e!170149))

(declare-fun res!205359 () Bool)

(assert (=> d!82442 (=> (not res!205359) (not e!170149))))

(declare-fun lt!383108 () (_ BitVec 64))

(declare-fun lt!383109 () (_ BitVec 64))

(declare-fun lt!383105 () (_ BitVec 64))

(assert (=> d!82442 (= res!205359 (= lt!383109 (bvsub lt!383105 lt!383108)))))

(assert (=> d!82442 (or (= (bvand lt!383105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383108 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383105 lt!383108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82442 (= lt!383108 (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382735)))) ((_ sign_extend 32) (currentByte!11746 (_1!11444 lt!382735))) ((_ sign_extend 32) (currentBit!11741 (_1!11444 lt!382735)))))))

(declare-fun lt!383106 () (_ BitVec 64))

(declare-fun lt!383104 () (_ BitVec 64))

(assert (=> d!82442 (= lt!383105 (bvmul lt!383106 lt!383104))))

(assert (=> d!82442 (or (= lt!383106 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383104 (bvsdiv (bvmul lt!383106 lt!383104) lt!383106)))))

(assert (=> d!82442 (= lt!383104 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82442 (= lt!383106 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382735)))))))

(assert (=> d!82442 (= lt!383109 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11746 (_1!11444 lt!382735))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11741 (_1!11444 lt!382735)))))))

(assert (=> d!82442 (invariant!0 (currentBit!11741 (_1!11444 lt!382735)) (currentByte!11746 (_1!11444 lt!382735)) (size!5878 (buf!6356 (_1!11444 lt!382735))))))

(assert (=> d!82442 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!382735))) (currentByte!11746 (_1!11444 lt!382735)) (currentBit!11741 (_1!11444 lt!382735))) lt!383109)))

(declare-fun b!245587 () Bool)

(declare-fun res!205360 () Bool)

(assert (=> b!245587 (=> (not res!205360) (not e!170149))))

(assert (=> b!245587 (= res!205360 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383109))))

(declare-fun b!245588 () Bool)

(declare-fun lt!383107 () (_ BitVec 64))

(assert (=> b!245588 (= e!170149 (bvsle lt!383109 (bvmul lt!383107 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245588 (or (= lt!383107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383107)))))

(assert (=> b!245588 (= lt!383107 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382735)))))))

(assert (= (and d!82442 res!205359) b!245587))

(assert (= (and b!245587 res!205360) b!245588))

(declare-fun m!370409 () Bool)

(assert (=> d!82442 m!370409))

(declare-fun m!370411 () Bool)

(assert (=> d!82442 m!370411))

(assert (=> b!245393 d!82442))

(declare-fun d!82444 () Bool)

(declare-fun e!170160 () Bool)

(assert (=> d!82444 e!170160))

(declare-fun res!205374 () Bool)

(assert (=> d!82444 (=> (not res!205374) (not e!170160))))

(declare-fun lt!383126 () tuple2!21044)

(declare-fun lt!383127 () tuple2!21044)

(assert (=> d!82444 (= res!205374 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!383126))) (currentByte!11746 (_1!11444 lt!383126)) (currentBit!11741 (_1!11444 lt!383126))) (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!383127))) (currentByte!11746 (_1!11444 lt!383127)) (currentBit!11741 (_1!11444 lt!383127)))))))

(declare-fun lt!383125 () BitStream!10678)

(declare-fun lt!383124 () Unit!17863)

(declare-fun choose!50 (BitStream!10678 BitStream!10678 BitStream!10678 tuple2!21044 tuple2!21044 BitStream!10678 Bool tuple2!21044 tuple2!21044 BitStream!10678 Bool) Unit!17863)

(assert (=> d!82444 (= lt!383124 (choose!50 lt!382732 (_2!11443 lt!382738) lt!383125 lt!383126 (tuple2!21045 (_1!11444 lt!383126) (_2!11444 lt!383126)) (_1!11444 lt!383126) (_2!11444 lt!383126) lt!383127 (tuple2!21045 (_1!11444 lt!383127) (_2!11444 lt!383127)) (_1!11444 lt!383127) (_2!11444 lt!383127)))))

(assert (=> d!82444 (= lt!383127 (readBitPure!0 lt!383125))))

(assert (=> d!82444 (= lt!383126 (readBitPure!0 lt!382732))))

(assert (=> d!82444 (= lt!383125 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 lt!382732) (currentBit!11741 lt!382732)))))

(assert (=> d!82444 (invariant!0 (currentBit!11741 lt!382732) (currentByte!11746 lt!382732) (size!5878 (buf!6356 (_2!11443 lt!382738))))))

(assert (=> d!82444 (= (readBitPrefixLemma!0 lt!382732 (_2!11443 lt!382738)) lt!383124)))

(declare-fun b!245602 () Bool)

(assert (=> b!245602 (= e!170160 (= (_2!11444 lt!383126) (_2!11444 lt!383127)))))

(assert (= (and d!82444 res!205374) b!245602))

(declare-fun m!370421 () Bool)

(assert (=> d!82444 m!370421))

(declare-fun m!370423 () Bool)

(assert (=> d!82444 m!370423))

(declare-fun m!370425 () Bool)

(assert (=> d!82444 m!370425))

(assert (=> d!82444 m!370071))

(declare-fun m!370427 () Bool)

(assert (=> d!82444 m!370427))

(declare-fun m!370429 () Bool)

(assert (=> d!82444 m!370429))

(assert (=> b!245393 d!82444))

(declare-fun d!82460 () Bool)

(declare-fun e!170163 () Bool)

(assert (=> d!82460 e!170163))

(declare-fun res!205377 () Bool)

(assert (=> d!82460 (=> (not res!205377) (not e!170163))))

(declare-fun lt!383137 () (_ BitVec 64))

(declare-fun lt!383136 () (_ BitVec 64))

(declare-fun lt!383133 () (_ BitVec 64))

(assert (=> d!82460 (= res!205377 (= lt!383137 (bvsub lt!383133 lt!383136)))))

(assert (=> d!82460 (or (= (bvand lt!383133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383136 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383133 lt!383136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82460 (= lt!383136 (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382744)))) ((_ sign_extend 32) (currentByte!11746 (_1!11444 lt!382744))) ((_ sign_extend 32) (currentBit!11741 (_1!11444 lt!382744)))))))

(declare-fun lt!383134 () (_ BitVec 64))

(declare-fun lt!383132 () (_ BitVec 64))

(assert (=> d!82460 (= lt!383133 (bvmul lt!383134 lt!383132))))

(assert (=> d!82460 (or (= lt!383134 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383132 (bvsdiv (bvmul lt!383134 lt!383132) lt!383134)))))

(assert (=> d!82460 (= lt!383132 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82460 (= lt!383134 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382744)))))))

(assert (=> d!82460 (= lt!383137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11746 (_1!11444 lt!382744))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11741 (_1!11444 lt!382744)))))))

(assert (=> d!82460 (invariant!0 (currentBit!11741 (_1!11444 lt!382744)) (currentByte!11746 (_1!11444 lt!382744)) (size!5878 (buf!6356 (_1!11444 lt!382744))))))

(assert (=> d!82460 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!382744))) (currentByte!11746 (_1!11444 lt!382744)) (currentBit!11741 (_1!11444 lt!382744))) lt!383137)))

(declare-fun b!245605 () Bool)

(declare-fun res!205378 () Bool)

(assert (=> b!245605 (=> (not res!205378) (not e!170163))))

(assert (=> b!245605 (= res!205378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383137))))

(declare-fun b!245606 () Bool)

(declare-fun lt!383135 () (_ BitVec 64))

(assert (=> b!245606 (= e!170163 (bvsle lt!383137 (bvmul lt!383135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245606 (or (= lt!383135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383135)))))

(assert (=> b!245606 (= lt!383135 ((_ sign_extend 32) (size!5878 (buf!6356 (_1!11444 lt!382744)))))))

(assert (= (and d!82460 res!205377) b!245605))

(assert (= (and b!245605 res!205378) b!245606))

(declare-fun m!370431 () Bool)

(assert (=> d!82460 m!370431))

(declare-fun m!370433 () Bool)

(assert (=> d!82460 m!370433))

(assert (=> b!245393 d!82460))

(declare-fun d!82462 () Bool)

(declare-fun lt!383148 () tuple2!21062)

(declare-fun readBit!0 (BitStream!10678) tuple2!21062)

(assert (=> d!82462 (= lt!383148 (readBit!0 (_1!11445 lt!382736)))))

(assert (=> d!82462 (= (readBitPure!0 (_1!11445 lt!382736)) (tuple2!21045 (_2!11453 lt!383148) (_1!11453 lt!383148)))))

(declare-fun bs!20862 () Bool)

(assert (= bs!20862 d!82462))

(declare-fun m!370445 () Bool)

(assert (=> bs!20862 m!370445))

(assert (=> b!245393 d!82462))

(declare-fun d!82466 () Bool)

(assert (=> d!82466 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382733) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737)))) lt!382733))))

(declare-fun bs!20863 () Bool)

(assert (= bs!20863 d!82466))

(declare-fun m!370447 () Bool)

(assert (=> bs!20863 m!370447))

(assert (=> b!245393 d!82466))

(declare-fun b!245620 () Bool)

(declare-fun e!170170 () Unit!17863)

(declare-fun Unit!17871 () Unit!17863)

(assert (=> b!245620 (= e!170170 Unit!17871)))

(declare-fun b!245621 () Bool)

(declare-fun lt!383198 () Unit!17863)

(assert (=> b!245621 (= e!170170 lt!383198)))

(declare-fun lt!383207 () (_ BitVec 64))

(assert (=> b!245621 (= lt!383207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!383205 () (_ BitVec 64))

(assert (=> b!245621 (= lt!383205 (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13409 array!13409 (_ BitVec 64) (_ BitVec 64)) Unit!17863)

(assert (=> b!245621 (= lt!383198 (arrayBitRangesEqSymmetric!0 (buf!6356 thiss!1005) (buf!6356 (_2!11443 lt!382738)) lt!383207 lt!383205))))

(assert (=> b!245621 (arrayBitRangesEq!0 (buf!6356 (_2!11443 lt!382738)) (buf!6356 thiss!1005) lt!383207 lt!383205)))

(declare-fun d!82468 () Bool)

(declare-fun e!170171 () Bool)

(assert (=> d!82468 e!170171))

(declare-fun res!205390 () Bool)

(assert (=> d!82468 (=> (not res!205390) (not e!170171))))

(declare-fun lt!383203 () tuple2!21046)

(assert (=> d!82468 (= res!205390 (isPrefixOf!0 (_1!11445 lt!383203) (_2!11445 lt!383203)))))

(declare-fun lt!383201 () BitStream!10678)

(assert (=> d!82468 (= lt!383203 (tuple2!21047 lt!383201 (_2!11443 lt!382738)))))

(declare-fun lt!383204 () Unit!17863)

(declare-fun lt!383195 () Unit!17863)

(assert (=> d!82468 (= lt!383204 lt!383195)))

(assert (=> d!82468 (isPrefixOf!0 lt!383201 (_2!11443 lt!382738))))

(assert (=> d!82468 (= lt!383195 (lemmaIsPrefixTransitive!0 lt!383201 (_2!11443 lt!382738) (_2!11443 lt!382738)))))

(declare-fun lt!383196 () Unit!17863)

(declare-fun lt!383208 () Unit!17863)

(assert (=> d!82468 (= lt!383196 lt!383208)))

(assert (=> d!82468 (isPrefixOf!0 lt!383201 (_2!11443 lt!382738))))

(assert (=> d!82468 (= lt!383208 (lemmaIsPrefixTransitive!0 lt!383201 thiss!1005 (_2!11443 lt!382738)))))

(declare-fun lt!383191 () Unit!17863)

(assert (=> d!82468 (= lt!383191 e!170170)))

(declare-fun c!11495 () Bool)

(assert (=> d!82468 (= c!11495 (not (= (size!5878 (buf!6356 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!383202 () Unit!17863)

(declare-fun lt!383200 () Unit!17863)

(assert (=> d!82468 (= lt!383202 lt!383200)))

(assert (=> d!82468 (isPrefixOf!0 (_2!11443 lt!382738) (_2!11443 lt!382738))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10678) Unit!17863)

(assert (=> d!82468 (= lt!383200 (lemmaIsPrefixRefl!0 (_2!11443 lt!382738)))))

(declare-fun lt!383189 () Unit!17863)

(declare-fun lt!383194 () Unit!17863)

(assert (=> d!82468 (= lt!383189 lt!383194)))

(assert (=> d!82468 (= lt!383194 (lemmaIsPrefixRefl!0 (_2!11443 lt!382738)))))

(declare-fun lt!383193 () Unit!17863)

(declare-fun lt!383199 () Unit!17863)

(assert (=> d!82468 (= lt!383193 lt!383199)))

(assert (=> d!82468 (isPrefixOf!0 lt!383201 lt!383201)))

(assert (=> d!82468 (= lt!383199 (lemmaIsPrefixRefl!0 lt!383201))))

(declare-fun lt!383197 () Unit!17863)

(declare-fun lt!383190 () Unit!17863)

(assert (=> d!82468 (= lt!383197 lt!383190)))

(assert (=> d!82468 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82468 (= lt!383190 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82468 (= lt!383201 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(assert (=> d!82468 (isPrefixOf!0 thiss!1005 (_2!11443 lt!382738))))

(assert (=> d!82468 (= (reader!0 thiss!1005 (_2!11443 lt!382738)) lt!383203)))

(declare-fun b!245622 () Bool)

(declare-fun lt!383192 () (_ BitVec 64))

(declare-fun lt!383206 () (_ BitVec 64))

(assert (=> b!245622 (= e!170171 (= (_1!11445 lt!383203) (withMovedBitIndex!0 (_2!11445 lt!383203) (bvsub lt!383206 lt!383192))))))

(assert (=> b!245622 (or (= (bvand lt!383206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383206 lt!383192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245622 (= lt!383192 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382738))) (currentByte!11746 (_2!11443 lt!382738)) (currentBit!11741 (_2!11443 lt!382738))))))

(assert (=> b!245622 (= lt!383206 (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(declare-fun b!245623 () Bool)

(declare-fun res!205388 () Bool)

(assert (=> b!245623 (=> (not res!205388) (not e!170171))))

(assert (=> b!245623 (= res!205388 (isPrefixOf!0 (_2!11445 lt!383203) (_2!11443 lt!382738)))))

(declare-fun b!245624 () Bool)

(declare-fun res!205389 () Bool)

(assert (=> b!245624 (=> (not res!205389) (not e!170171))))

(assert (=> b!245624 (= res!205389 (isPrefixOf!0 (_1!11445 lt!383203) thiss!1005))))

(assert (= (and d!82468 c!11495) b!245621))

(assert (= (and d!82468 (not c!11495)) b!245620))

(assert (= (and d!82468 res!205390) b!245624))

(assert (= (and b!245624 res!205389) b!245623))

(assert (= (and b!245623 res!205388) b!245622))

(assert (=> b!245621 m!370047))

(declare-fun m!370449 () Bool)

(assert (=> b!245621 m!370449))

(declare-fun m!370451 () Bool)

(assert (=> b!245621 m!370451))

(declare-fun m!370453 () Bool)

(assert (=> b!245623 m!370453))

(declare-fun m!370455 () Bool)

(assert (=> b!245624 m!370455))

(declare-fun m!370457 () Bool)

(assert (=> d!82468 m!370457))

(declare-fun m!370459 () Bool)

(assert (=> d!82468 m!370459))

(declare-fun m!370461 () Bool)

(assert (=> d!82468 m!370461))

(declare-fun m!370463 () Bool)

(assert (=> d!82468 m!370463))

(declare-fun m!370465 () Bool)

(assert (=> d!82468 m!370465))

(declare-fun m!370467 () Bool)

(assert (=> d!82468 m!370467))

(declare-fun m!370469 () Bool)

(assert (=> d!82468 m!370469))

(assert (=> d!82468 m!370051))

(declare-fun m!370471 () Bool)

(assert (=> d!82468 m!370471))

(declare-fun m!370473 () Bool)

(assert (=> d!82468 m!370473))

(declare-fun m!370475 () Bool)

(assert (=> d!82468 m!370475))

(declare-fun m!370477 () Bool)

(assert (=> b!245622 m!370477))

(assert (=> b!245622 m!370049))

(assert (=> b!245622 m!370047))

(assert (=> b!245393 d!82468))

(declare-fun d!82470 () Bool)

(declare-fun lt!383209 () tuple2!21062)

(assert (=> d!82470 (= lt!383209 (readBit!0 lt!382732))))

(assert (=> d!82470 (= (readBitPure!0 lt!382732) (tuple2!21045 (_2!11453 lt!383209) (_1!11453 lt!383209)))))

(declare-fun bs!20864 () Bool)

(assert (= bs!20864 d!82470))

(declare-fun m!370479 () Bool)

(assert (=> bs!20864 m!370479))

(assert (=> b!245393 d!82470))

(declare-fun d!82472 () Bool)

(declare-fun res!205393 () Bool)

(declare-fun e!170173 () Bool)

(assert (=> d!82472 (=> (not res!205393) (not e!170173))))

(assert (=> d!82472 (= res!205393 (= (size!5878 (buf!6356 thiss!1005)) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(assert (=> d!82472 (= (isPrefixOf!0 thiss!1005 (_2!11443 lt!382738)) e!170173)))

(declare-fun b!245625 () Bool)

(declare-fun res!205392 () Bool)

(assert (=> b!245625 (=> (not res!205392) (not e!170173))))

(assert (=> b!245625 (= res!205392 (bvsle (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)) (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382738))) (currentByte!11746 (_2!11443 lt!382738)) (currentBit!11741 (_2!11443 lt!382738)))))))

(declare-fun b!245626 () Bool)

(declare-fun e!170172 () Bool)

(assert (=> b!245626 (= e!170173 e!170172)))

(declare-fun res!205391 () Bool)

(assert (=> b!245626 (=> res!205391 e!170172)))

(assert (=> b!245626 (= res!205391 (= (size!5878 (buf!6356 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245627 () Bool)

(assert (=> b!245627 (= e!170172 (arrayBitRangesEq!0 (buf!6356 thiss!1005) (buf!6356 (_2!11443 lt!382738)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005))))))

(assert (= (and d!82472 res!205393) b!245625))

(assert (= (and b!245625 res!205392) b!245626))

(assert (= (and b!245626 (not res!205391)) b!245627))

(assert (=> b!245625 m!370047))

(assert (=> b!245625 m!370049))

(assert (=> b!245627 m!370047))

(assert (=> b!245627 m!370047))

(declare-fun m!370481 () Bool)

(assert (=> b!245627 m!370481))

(assert (=> b!245393 d!82472))

(declare-fun d!82474 () Bool)

(assert (=> d!82474 (isPrefixOf!0 thiss!1005 (_2!11443 lt!382738))))

(declare-fun lt!383212 () Unit!17863)

(declare-fun choose!30 (BitStream!10678 BitStream!10678 BitStream!10678) Unit!17863)

(assert (=> d!82474 (= lt!383212 (choose!30 thiss!1005 (_2!11443 lt!382737) (_2!11443 lt!382738)))))

(assert (=> d!82474 (isPrefixOf!0 thiss!1005 (_2!11443 lt!382737))))

(assert (=> d!82474 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11443 lt!382737) (_2!11443 lt!382738)) lt!383212)))

(declare-fun bs!20865 () Bool)

(assert (= bs!20865 d!82474))

(assert (=> bs!20865 m!370051))

(declare-fun m!370483 () Bool)

(assert (=> bs!20865 m!370483))

(assert (=> bs!20865 m!370091))

(assert (=> b!245393 d!82474))

(declare-fun d!82476 () Bool)

(declare-fun e!170183 () Bool)

(assert (=> d!82476 e!170183))

(declare-fun res!205413 () Bool)

(assert (=> d!82476 (=> (not res!205413) (not e!170183))))

(declare-fun lt!383257 () tuple2!21042)

(assert (=> d!82476 (= res!205413 (= (size!5878 (buf!6356 (_2!11443 lt!382737))) (size!5878 (buf!6356 (_2!11443 lt!383257)))))))

(declare-fun choose!51 (BitStream!10678 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21042)

(assert (=> d!82476 (= lt!383257 (choose!51 (_2!11443 lt!382737) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82476 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82476 (= (appendNBitsLoop!0 (_2!11443 lt!382737) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!383257)))

(declare-fun b!245644 () Bool)

(declare-fun res!205412 () Bool)

(assert (=> b!245644 (=> (not res!205412) (not e!170183))))

(declare-fun lt!383260 () (_ BitVec 64))

(declare-fun lt!383258 () (_ BitVec 64))

(assert (=> b!245644 (= res!205412 (= (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!383257))) (currentByte!11746 (_2!11443 lt!383257)) (currentBit!11741 (_2!11443 lt!383257))) (bvadd lt!383260 lt!383258)))))

(assert (=> b!245644 (or (not (= (bvand lt!383260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383258 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383260 lt!383258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245644 (= lt!383258 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245644 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245644 (= lt!383260 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))))))

(declare-fun b!245646 () Bool)

(declare-fun lt!383261 () tuple2!21044)

(declare-fun lt!383263 () tuple2!21046)

(assert (=> b!245646 (= e!170183 (and (_2!11444 lt!383261) (= (_1!11444 lt!383261) (_2!11445 lt!383263))))))

(assert (=> b!245646 (= lt!383261 (checkBitsLoopPure!0 (_1!11445 lt!383263) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383259 () Unit!17863)

(declare-fun lt!383262 () Unit!17863)

(assert (=> b!245646 (= lt!383259 lt!383262)))

(declare-fun lt!383256 () (_ BitVec 64))

(assert (=> b!245646 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!383257)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!383256)))

(assert (=> b!245646 (= lt!383262 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!383257)) lt!383256))))

(declare-fun e!170182 () Bool)

(assert (=> b!245646 e!170182))

(declare-fun res!205411 () Bool)

(assert (=> b!245646 (=> (not res!205411) (not e!170182))))

(assert (=> b!245646 (= res!205411 (and (= (size!5878 (buf!6356 (_2!11443 lt!382737))) (size!5878 (buf!6356 (_2!11443 lt!383257)))) (bvsge lt!383256 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245646 (= lt!383256 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245646 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245646 (= lt!383263 (reader!0 (_2!11443 lt!382737) (_2!11443 lt!383257)))))

(declare-fun b!245647 () Bool)

(assert (=> b!245647 (= e!170182 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!383256))))

(declare-fun b!245645 () Bool)

(declare-fun res!205410 () Bool)

(assert (=> b!245645 (=> (not res!205410) (not e!170183))))

(assert (=> b!245645 (= res!205410 (isPrefixOf!0 (_2!11443 lt!382737) (_2!11443 lt!383257)))))

(assert (= (and d!82476 res!205413) b!245644))

(assert (= (and b!245644 res!205412) b!245645))

(assert (= (and b!245645 res!205410) b!245646))

(assert (= (and b!245646 res!205411) b!245647))

(declare-fun m!370497 () Bool)

(assert (=> b!245644 m!370497))

(assert (=> b!245644 m!370045))

(declare-fun m!370499 () Bool)

(assert (=> d!82476 m!370499))

(declare-fun m!370501 () Bool)

(assert (=> b!245646 m!370501))

(declare-fun m!370503 () Bool)

(assert (=> b!245646 m!370503))

(declare-fun m!370505 () Bool)

(assert (=> b!245646 m!370505))

(declare-fun m!370507 () Bool)

(assert (=> b!245646 m!370507))

(declare-fun m!370509 () Bool)

(assert (=> b!245645 m!370509))

(declare-fun m!370511 () Bool)

(assert (=> b!245647 m!370511))

(assert (=> b!245393 d!82476))

(declare-fun d!82492 () Bool)

(declare-fun e!170186 () Bool)

(assert (=> d!82492 e!170186))

(declare-fun res!205416 () Bool)

(assert (=> d!82492 (=> (not res!205416) (not e!170186))))

(assert (=> d!82492 (= res!205416 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!383266 () Unit!17863)

(declare-fun choose!27 (BitStream!10678 BitStream!10678 (_ BitVec 64) (_ BitVec 64)) Unit!17863)

(assert (=> d!82492 (= lt!383266 (choose!27 thiss!1005 (_2!11443 lt!382737) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82492 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11443 lt!382737) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!383266)))

(declare-fun b!245650 () Bool)

(assert (=> b!245650 (= e!170186 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382737)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82492 res!205416) b!245650))

(declare-fun m!370513 () Bool)

(assert (=> d!82492 m!370513))

(declare-fun m!370515 () Bool)

(assert (=> b!245650 m!370515))

(assert (=> b!245393 d!82492))

(declare-fun d!82494 () Bool)

(assert (=> d!82494 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382733)))

(declare-fun lt!383269 () Unit!17863)

(declare-fun choose!9 (BitStream!10678 array!13409 (_ BitVec 64) BitStream!10678) Unit!17863)

(assert (=> d!82494 (= lt!383269 (choose!9 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!382738)) lt!382733 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737)))))))

(assert (=> d!82494 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!382738)) lt!382733) lt!383269)))

(declare-fun bs!20868 () Bool)

(assert (= bs!20868 d!82494))

(assert (=> bs!20868 m!370065))

(declare-fun m!370517 () Bool)

(assert (=> bs!20868 m!370517))

(assert (=> b!245393 d!82494))

(declare-fun d!82496 () Bool)

(declare-fun e!170205 () Bool)

(assert (=> d!82496 e!170205))

(declare-fun res!205450 () Bool)

(assert (=> d!82496 (=> (not res!205450) (not e!170205))))

(declare-fun lt!383301 () tuple2!21042)

(assert (=> d!82496 (= res!205450 (= (size!5878 (buf!6356 thiss!1005)) (size!5878 (buf!6356 (_2!11443 lt!383301)))))))

(declare-fun choose!16 (BitStream!10678 Bool) tuple2!21042)

(assert (=> d!82496 (= lt!383301 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82496 (validate_offset_bit!0 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005)))))

(assert (=> d!82496 (= (appendBit!0 thiss!1005 bit!26) lt!383301)))

(declare-fun b!245685 () Bool)

(declare-fun res!205451 () Bool)

(assert (=> b!245685 (=> (not res!205451) (not e!170205))))

(assert (=> b!245685 (= res!205451 (isPrefixOf!0 thiss!1005 (_2!11443 lt!383301)))))

(declare-fun b!245687 () Bool)

(declare-fun e!170206 () Bool)

(declare-fun lt!383299 () tuple2!21044)

(assert (=> b!245687 (= e!170206 (= (bitIndex!0 (size!5878 (buf!6356 (_1!11444 lt!383299))) (currentByte!11746 (_1!11444 lt!383299)) (currentBit!11741 (_1!11444 lt!383299))) (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!383301))) (currentByte!11746 (_2!11443 lt!383301)) (currentBit!11741 (_2!11443 lt!383301)))))))

(declare-fun b!245684 () Bool)

(declare-fun res!205449 () Bool)

(assert (=> b!245684 (=> (not res!205449) (not e!170205))))

(declare-fun lt!383300 () (_ BitVec 64))

(declare-fun lt!383298 () (_ BitVec 64))

(assert (=> b!245684 (= res!205449 (= (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!383301))) (currentByte!11746 (_2!11443 lt!383301)) (currentBit!11741 (_2!11443 lt!383301))) (bvadd lt!383298 lt!383300)))))

(assert (=> b!245684 (or (not (= (bvand lt!383298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383300 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383298 lt!383300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245684 (= lt!383300 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!245684 (= lt!383298 (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(declare-fun b!245686 () Bool)

(assert (=> b!245686 (= e!170205 e!170206)))

(declare-fun res!205448 () Bool)

(assert (=> b!245686 (=> (not res!205448) (not e!170206))))

(assert (=> b!245686 (= res!205448 (and (= (_2!11444 lt!383299) bit!26) (= (_1!11444 lt!383299) (_2!11443 lt!383301))))))

(assert (=> b!245686 (= lt!383299 (readBitPure!0 (readerFrom!0 (_2!11443 lt!383301) (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005))))))

(assert (= (and d!82496 res!205450) b!245684))

(assert (= (and b!245684 res!205449) b!245685))

(assert (= (and b!245685 res!205451) b!245686))

(assert (= (and b!245686 res!205448) b!245687))

(declare-fun m!370535 () Bool)

(assert (=> b!245687 m!370535))

(declare-fun m!370537 () Bool)

(assert (=> b!245687 m!370537))

(declare-fun m!370539 () Bool)

(assert (=> b!245685 m!370539))

(assert (=> b!245684 m!370537))

(assert (=> b!245684 m!370047))

(declare-fun m!370541 () Bool)

(assert (=> d!82496 m!370541))

(declare-fun m!370543 () Bool)

(assert (=> d!82496 m!370543))

(declare-fun m!370545 () Bool)

(assert (=> b!245686 m!370545))

(assert (=> b!245686 m!370545))

(declare-fun m!370547 () Bool)

(assert (=> b!245686 m!370547))

(assert (=> b!245393 d!82496))

(declare-fun d!82502 () Bool)

(declare-fun lt!383302 () tuple2!21062)

(assert (=> d!82502 (= lt!383302 (readBit!0 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005))))))

(assert (=> d!82502 (= (readBitPure!0 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005))) (tuple2!21045 (_2!11453 lt!383302) (_1!11453 lt!383302)))))

(declare-fun bs!20869 () Bool)

(assert (= bs!20869 d!82502))

(declare-fun m!370549 () Bool)

(assert (=> bs!20869 m!370549))

(assert (=> b!245393 d!82502))

(declare-fun lt!383307 () tuple2!21062)

(declare-fun d!82504 () Bool)

(assert (=> d!82504 (= lt!383307 (checkBitsLoop!0 (_1!11445 lt!382743) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82504 (= (checkBitsLoopPure!0 (_1!11445 lt!382743) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21045 (_2!11453 lt!383307) (_1!11453 lt!383307)))))

(declare-fun bs!20870 () Bool)

(assert (= bs!20870 d!82504))

(declare-fun m!370551 () Bool)

(assert (=> bs!20870 m!370551))

(assert (=> b!245393 d!82504))

(declare-fun b!245689 () Bool)

(declare-fun e!170208 () Unit!17863)

(declare-fun Unit!17872 () Unit!17863)

(assert (=> b!245689 (= e!170208 Unit!17872)))

(declare-fun b!245690 () Bool)

(declare-fun lt!383317 () Unit!17863)

(assert (=> b!245690 (= e!170208 lt!383317)))

(declare-fun lt!383326 () (_ BitVec 64))

(assert (=> b!245690 (= lt!383326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!383324 () (_ BitVec 64))

(assert (=> b!245690 (= lt!383324 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))))))

(assert (=> b!245690 (= lt!383317 (arrayBitRangesEqSymmetric!0 (buf!6356 (_2!11443 lt!382737)) (buf!6356 (_2!11443 lt!382738)) lt!383326 lt!383324))))

(assert (=> b!245690 (arrayBitRangesEq!0 (buf!6356 (_2!11443 lt!382738)) (buf!6356 (_2!11443 lt!382737)) lt!383326 lt!383324)))

(declare-fun d!82506 () Bool)

(declare-fun e!170209 () Bool)

(assert (=> d!82506 e!170209))

(declare-fun res!205455 () Bool)

(assert (=> d!82506 (=> (not res!205455) (not e!170209))))

(declare-fun lt!383322 () tuple2!21046)

(assert (=> d!82506 (= res!205455 (isPrefixOf!0 (_1!11445 lt!383322) (_2!11445 lt!383322)))))

(declare-fun lt!383320 () BitStream!10678)

(assert (=> d!82506 (= lt!383322 (tuple2!21047 lt!383320 (_2!11443 lt!382738)))))

(declare-fun lt!383323 () Unit!17863)

(declare-fun lt!383314 () Unit!17863)

(assert (=> d!82506 (= lt!383323 lt!383314)))

(assert (=> d!82506 (isPrefixOf!0 lt!383320 (_2!11443 lt!382738))))

(assert (=> d!82506 (= lt!383314 (lemmaIsPrefixTransitive!0 lt!383320 (_2!11443 lt!382738) (_2!11443 lt!382738)))))

(declare-fun lt!383315 () Unit!17863)

(declare-fun lt!383327 () Unit!17863)

(assert (=> d!82506 (= lt!383315 lt!383327)))

(assert (=> d!82506 (isPrefixOf!0 lt!383320 (_2!11443 lt!382738))))

(assert (=> d!82506 (= lt!383327 (lemmaIsPrefixTransitive!0 lt!383320 (_2!11443 lt!382737) (_2!11443 lt!382738)))))

(declare-fun lt!383310 () Unit!17863)

(assert (=> d!82506 (= lt!383310 e!170208)))

(declare-fun c!11496 () Bool)

(assert (=> d!82506 (= c!11496 (not (= (size!5878 (buf!6356 (_2!11443 lt!382737))) #b00000000000000000000000000000000)))))

(declare-fun lt!383321 () Unit!17863)

(declare-fun lt!383319 () Unit!17863)

(assert (=> d!82506 (= lt!383321 lt!383319)))

(assert (=> d!82506 (isPrefixOf!0 (_2!11443 lt!382738) (_2!11443 lt!382738))))

(assert (=> d!82506 (= lt!383319 (lemmaIsPrefixRefl!0 (_2!11443 lt!382738)))))

(declare-fun lt!383308 () Unit!17863)

(declare-fun lt!383313 () Unit!17863)

(assert (=> d!82506 (= lt!383308 lt!383313)))

(assert (=> d!82506 (= lt!383313 (lemmaIsPrefixRefl!0 (_2!11443 lt!382738)))))

(declare-fun lt!383312 () Unit!17863)

(declare-fun lt!383318 () Unit!17863)

(assert (=> d!82506 (= lt!383312 lt!383318)))

(assert (=> d!82506 (isPrefixOf!0 lt!383320 lt!383320)))

(assert (=> d!82506 (= lt!383318 (lemmaIsPrefixRefl!0 lt!383320))))

(declare-fun lt!383316 () Unit!17863)

(declare-fun lt!383309 () Unit!17863)

(assert (=> d!82506 (= lt!383316 lt!383309)))

(assert (=> d!82506 (isPrefixOf!0 (_2!11443 lt!382737) (_2!11443 lt!382737))))

(assert (=> d!82506 (= lt!383309 (lemmaIsPrefixRefl!0 (_2!11443 lt!382737)))))

(assert (=> d!82506 (= lt!383320 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))))))

(assert (=> d!82506 (isPrefixOf!0 (_2!11443 lt!382737) (_2!11443 lt!382738))))

(assert (=> d!82506 (= (reader!0 (_2!11443 lt!382737) (_2!11443 lt!382738)) lt!383322)))

(declare-fun lt!383311 () (_ BitVec 64))

(declare-fun b!245691 () Bool)

(declare-fun lt!383325 () (_ BitVec 64))

(assert (=> b!245691 (= e!170209 (= (_1!11445 lt!383322) (withMovedBitIndex!0 (_2!11445 lt!383322) (bvsub lt!383325 lt!383311))))))

(assert (=> b!245691 (or (= (bvand lt!383325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383311 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383325 lt!383311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245691 (= lt!383311 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382738))) (currentByte!11746 (_2!11443 lt!382738)) (currentBit!11741 (_2!11443 lt!382738))))))

(assert (=> b!245691 (= lt!383325 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))))))

(declare-fun b!245692 () Bool)

(declare-fun res!205453 () Bool)

(assert (=> b!245692 (=> (not res!205453) (not e!170209))))

(assert (=> b!245692 (= res!205453 (isPrefixOf!0 (_2!11445 lt!383322) (_2!11443 lt!382738)))))

(declare-fun b!245693 () Bool)

(declare-fun res!205454 () Bool)

(assert (=> b!245693 (=> (not res!205454) (not e!170209))))

(assert (=> b!245693 (= res!205454 (isPrefixOf!0 (_1!11445 lt!383322) (_2!11443 lt!382737)))))

(assert (= (and d!82506 c!11496) b!245690))

(assert (= (and d!82506 (not c!11496)) b!245689))

(assert (= (and d!82506 res!205455) b!245693))

(assert (= (and b!245693 res!205454) b!245692))

(assert (= (and b!245692 res!205453) b!245691))

(assert (=> b!245690 m!370045))

(declare-fun m!370565 () Bool)

(assert (=> b!245690 m!370565))

(declare-fun m!370567 () Bool)

(assert (=> b!245690 m!370567))

(declare-fun m!370569 () Bool)

(assert (=> b!245692 m!370569))

(declare-fun m!370571 () Bool)

(assert (=> b!245693 m!370571))

(assert (=> d!82506 m!370457))

(declare-fun m!370573 () Bool)

(assert (=> d!82506 m!370573))

(declare-fun m!370575 () Bool)

(assert (=> d!82506 m!370575))

(assert (=> d!82506 m!370463))

(declare-fun m!370577 () Bool)

(assert (=> d!82506 m!370577))

(declare-fun m!370579 () Bool)

(assert (=> d!82506 m!370579))

(declare-fun m!370581 () Bool)

(assert (=> d!82506 m!370581))

(assert (=> d!82506 m!370093))

(declare-fun m!370583 () Bool)

(assert (=> d!82506 m!370583))

(declare-fun m!370585 () Bool)

(assert (=> d!82506 m!370585))

(declare-fun m!370587 () Bool)

(assert (=> d!82506 m!370587))

(declare-fun m!370589 () Bool)

(assert (=> b!245691 m!370589))

(assert (=> b!245691 m!370049))

(assert (=> b!245691 m!370045))

(assert (=> b!245393 d!82506))

(declare-fun d!82512 () Bool)

(assert (=> d!82512 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383328 () Unit!17863)

(assert (=> d!82512 (= lt!383328 (choose!9 thiss!1005 (buf!6356 (_2!11443 lt!382738)) (bvsub nBits!297 from!289) (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005))))))

(assert (=> d!82512 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6356 (_2!11443 lt!382738)) (bvsub nBits!297 from!289)) lt!383328)))

(declare-fun bs!20872 () Bool)

(assert (= bs!20872 d!82512))

(assert (=> bs!20872 m!370087))

(declare-fun m!370591 () Bool)

(assert (=> bs!20872 m!370591))

(assert (=> b!245393 d!82512))

(declare-fun d!82514 () Bool)

(assert (=> d!82514 (= (invariant!0 (currentBit!11741 (_2!11443 lt!382738)) (currentByte!11746 (_2!11443 lt!382738)) (size!5878 (buf!6356 (_2!11443 lt!382738)))) (and (bvsge (currentBit!11741 (_2!11443 lt!382738)) #b00000000000000000000000000000000) (bvslt (currentBit!11741 (_2!11443 lt!382738)) #b00000000000000000000000000001000) (bvsge (currentByte!11746 (_2!11443 lt!382738)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11746 (_2!11443 lt!382738)) (size!5878 (buf!6356 (_2!11443 lt!382738)))) (and (= (currentBit!11741 (_2!11443 lt!382738)) #b00000000000000000000000000000000) (= (currentByte!11746 (_2!11443 lt!382738)) (size!5878 (buf!6356 (_2!11443 lt!382738))))))))))

(assert (=> b!245383 d!82514))

(declare-fun d!82518 () Bool)

(declare-fun lt!383332 () tuple2!21062)

(assert (=> d!82518 (= lt!383332 (checkBitsLoop!0 (_1!11445 lt!382751) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82518 (= (checkBitsLoopPure!0 (_1!11445 lt!382751) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21045 (_2!11453 lt!383332) (_1!11453 lt!383332)))))

(declare-fun bs!20874 () Bool)

(assert (= bs!20874 d!82518))

(declare-fun m!370595 () Bool)

(assert (=> bs!20874 m!370595))

(assert (=> b!245389 d!82518))

(declare-fun d!82520 () Bool)

(assert (=> d!82520 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382740) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737)))) lt!382740))))

(declare-fun bs!20875 () Bool)

(assert (= bs!20875 d!82520))

(assert (=> bs!20875 m!370447))

(assert (=> b!245389 d!82520))

(declare-fun d!82522 () Bool)

(assert (=> d!82522 (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 (_2!11443 lt!382738)))) ((_ sign_extend 32) (currentByte!11746 (_2!11443 lt!382737))) ((_ sign_extend 32) (currentBit!11741 (_2!11443 lt!382737))) lt!382740)))

(declare-fun lt!383333 () Unit!17863)

(assert (=> d!82522 (= lt!383333 (choose!9 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!382738)) lt!382740 (BitStream!10679 (buf!6356 (_2!11443 lt!382738)) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737)))))))

(assert (=> d!82522 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11443 lt!382737) (buf!6356 (_2!11443 lt!382738)) lt!382740) lt!383333)))

(declare-fun bs!20876 () Bool)

(assert (= bs!20876 d!82522))

(assert (=> bs!20876 m!370029))

(declare-fun m!370597 () Bool)

(assert (=> bs!20876 m!370597))

(assert (=> b!245389 d!82522))

(assert (=> b!245389 d!82506))

(declare-fun d!82524 () Bool)

(declare-fun res!205458 () Bool)

(declare-fun e!170211 () Bool)

(assert (=> d!82524 (=> (not res!205458) (not e!170211))))

(assert (=> d!82524 (= res!205458 (= (size!5878 (buf!6356 (_2!11443 lt!382737))) (size!5878 (buf!6356 (_2!11443 lt!382738)))))))

(assert (=> d!82524 (= (isPrefixOf!0 (_2!11443 lt!382737) (_2!11443 lt!382738)) e!170211)))

(declare-fun b!245694 () Bool)

(declare-fun res!205457 () Bool)

(assert (=> b!245694 (=> (not res!205457) (not e!170211))))

(assert (=> b!245694 (= res!205457 (bvsle (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737))) (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382738))) (currentByte!11746 (_2!11443 lt!382738)) (currentBit!11741 (_2!11443 lt!382738)))))))

(declare-fun b!245695 () Bool)

(declare-fun e!170210 () Bool)

(assert (=> b!245695 (= e!170211 e!170210)))

(declare-fun res!205456 () Bool)

(assert (=> b!245695 (=> res!205456 e!170210)))

(assert (=> b!245695 (= res!205456 (= (size!5878 (buf!6356 (_2!11443 lt!382737))) #b00000000000000000000000000000000))))

(declare-fun b!245696 () Bool)

(assert (=> b!245696 (= e!170210 (arrayBitRangesEq!0 (buf!6356 (_2!11443 lt!382737)) (buf!6356 (_2!11443 lt!382738)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5878 (buf!6356 (_2!11443 lt!382737))) (currentByte!11746 (_2!11443 lt!382737)) (currentBit!11741 (_2!11443 lt!382737)))))))

(assert (= (and d!82524 res!205458) b!245694))

(assert (= (and b!245694 res!205457) b!245695))

(assert (= (and b!245695 (not res!205456)) b!245696))

(assert (=> b!245694 m!370045))

(assert (=> b!245694 m!370049))

(assert (=> b!245696 m!370045))

(assert (=> b!245696 m!370045))

(declare-fun m!370599 () Bool)

(assert (=> b!245696 m!370599))

(assert (=> b!245380 d!82524))

(declare-fun d!82526 () Bool)

(assert (=> d!82526 (= (array_inv!5619 (buf!6356 thiss!1005)) (bvsge (size!5878 (buf!6356 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!245391 d!82526))

(declare-fun d!82528 () Bool)

(assert (=> d!82528 (= (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382737)))) (and (bvsge (currentBit!11741 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11741 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11746 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382737)))) (and (= (currentBit!11741 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382737))))))))))

(assert (=> b!245387 d!82528))

(declare-fun d!82530 () Bool)

(declare-fun lt!383334 () tuple2!21062)

(assert (=> d!82530 (= lt!383334 (readBit!0 (readerFrom!0 (_2!11443 lt!382737) (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005))))))

(assert (=> d!82530 (= (readBitPure!0 (readerFrom!0 (_2!11443 lt!382737) (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005))) (tuple2!21045 (_2!11453 lt!383334) (_1!11453 lt!383334)))))

(declare-fun bs!20877 () Bool)

(assert (= bs!20877 d!82530))

(assert (=> bs!20877 m!370035))

(declare-fun m!370601 () Bool)

(assert (=> bs!20877 m!370601))

(assert (=> b!245388 d!82530))

(declare-fun d!82532 () Bool)

(declare-fun e!170214 () Bool)

(assert (=> d!82532 e!170214))

(declare-fun res!205462 () Bool)

(assert (=> d!82532 (=> (not res!205462) (not e!170214))))

(assert (=> d!82532 (= res!205462 (invariant!0 (currentBit!11741 (_2!11443 lt!382737)) (currentByte!11746 (_2!11443 lt!382737)) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(assert (=> d!82532 (= (readerFrom!0 (_2!11443 lt!382737) (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005)) (BitStream!10679 (buf!6356 (_2!11443 lt!382737)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)))))

(declare-fun b!245699 () Bool)

(assert (=> b!245699 (= e!170214 (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382737)))))))

(assert (= (and d!82532 res!205462) b!245699))

(assert (=> d!82532 m!370375))

(assert (=> b!245699 m!370089))

(assert (=> b!245388 d!82532))

(declare-fun d!82534 () Bool)

(assert (=> d!82534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20878 () Bool)

(assert (= bs!20878 d!82534))

(declare-fun m!370603 () Bool)

(assert (=> bs!20878 m!370603))

(assert (=> b!245377 d!82534))

(declare-fun d!82536 () Bool)

(declare-fun e!170217 () Bool)

(assert (=> d!82536 e!170217))

(declare-fun res!205465 () Bool)

(assert (=> d!82536 (=> (not res!205465) (not e!170217))))

(declare-fun lt!383340 () (_ BitVec 64))

(declare-fun lt!383339 () BitStream!10678)

(assert (=> d!82536 (= res!205465 (= (bvadd lt!383340 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5878 (buf!6356 lt!383339)) (currentByte!11746 lt!383339) (currentBit!11741 lt!383339))))))

(assert (=> d!82536 (or (not (= (bvand lt!383340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383340 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82536 (= lt!383340 (bitIndex!0 (size!5878 (buf!6356 (_1!11445 lt!382736))) (currentByte!11746 (_1!11445 lt!382736)) (currentBit!11741 (_1!11445 lt!382736))))))

(declare-fun moveBitIndex!0 (BitStream!10678 (_ BitVec 64)) tuple2!21042)

(assert (=> d!82536 (= lt!383339 (_2!11443 (moveBitIndex!0 (_1!11445 lt!382736) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10678 (_ BitVec 64)) Bool)

(assert (=> d!82536 (moveBitIndexPrecond!0 (_1!11445 lt!382736) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!82536 (= (withMovedBitIndex!0 (_1!11445 lt!382736) #b0000000000000000000000000000000000000000000000000000000000000001) lt!383339)))

(declare-fun b!245702 () Bool)

(assert (=> b!245702 (= e!170217 (= (size!5878 (buf!6356 (_1!11445 lt!382736))) (size!5878 (buf!6356 lt!383339))))))

(assert (= (and d!82536 res!205465) b!245702))

(declare-fun m!370605 () Bool)

(assert (=> d!82536 m!370605))

(declare-fun m!370607 () Bool)

(assert (=> d!82536 m!370607))

(declare-fun m!370609 () Bool)

(assert (=> d!82536 m!370609))

(declare-fun m!370611 () Bool)

(assert (=> d!82536 m!370611))

(assert (=> b!245384 d!82536))

(declare-fun d!82538 () Bool)

(assert (=> d!82538 (= (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382738)))) (and (bvsge (currentBit!11741 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11741 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11746 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382738)))) (and (= (currentBit!11741 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11746 thiss!1005) (size!5878 (buf!6356 (_2!11443 lt!382738))))))))))

(assert (=> b!245385 d!82538))

(assert (=> b!245386 d!82400))

(declare-fun d!82540 () Bool)

(declare-fun e!170218 () Bool)

(assert (=> d!82540 e!170218))

(declare-fun res!205466 () Bool)

(assert (=> d!82540 (=> (not res!205466) (not e!170218))))

(declare-fun lt!383346 () (_ BitVec 64))

(declare-fun lt!383342 () (_ BitVec 64))

(declare-fun lt!383345 () (_ BitVec 64))

(assert (=> d!82540 (= res!205466 (= lt!383346 (bvsub lt!383342 lt!383345)))))

(assert (=> d!82540 (or (= (bvand lt!383342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383342 lt!383345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82540 (= lt!383345 (remainingBits!0 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))) ((_ sign_extend 32) (currentByte!11746 thiss!1005)) ((_ sign_extend 32) (currentBit!11741 thiss!1005))))))

(declare-fun lt!383343 () (_ BitVec 64))

(declare-fun lt!383341 () (_ BitVec 64))

(assert (=> d!82540 (= lt!383342 (bvmul lt!383343 lt!383341))))

(assert (=> d!82540 (or (= lt!383343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383341 (bvsdiv (bvmul lt!383343 lt!383341) lt!383343)))))

(assert (=> d!82540 (= lt!383341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82540 (= lt!383343 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))))))

(assert (=> d!82540 (= lt!383346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11746 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11741 thiss!1005))))))

(assert (=> d!82540 (invariant!0 (currentBit!11741 thiss!1005) (currentByte!11746 thiss!1005) (size!5878 (buf!6356 thiss!1005)))))

(assert (=> d!82540 (= (bitIndex!0 (size!5878 (buf!6356 thiss!1005)) (currentByte!11746 thiss!1005) (currentBit!11741 thiss!1005)) lt!383346)))

(declare-fun b!245703 () Bool)

(declare-fun res!205467 () Bool)

(assert (=> b!245703 (=> (not res!205467) (not e!170218))))

(assert (=> b!245703 (= res!205467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383346))))

(declare-fun b!245704 () Bool)

(declare-fun lt!383344 () (_ BitVec 64))

(assert (=> b!245704 (= e!170218 (bvsle lt!383346 (bvmul lt!383344 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245704 (or (= lt!383344 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383344 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383344)))))

(assert (=> b!245704 (= lt!383344 ((_ sign_extend 32) (size!5878 (buf!6356 thiss!1005))))))

(assert (= (and d!82540 res!205466) b!245703))

(assert (= (and b!245703 res!205467) b!245704))

(assert (=> d!82540 m!370603))

(assert (=> d!82540 m!370393))

(assert (=> b!245386 d!82540))

(push 1)

(assert (not d!82534))

(assert (not b!245691))

(assert (not b!245686))

(assert (not d!82492))

(assert (not d!82536))

(assert (not b!245625))

(assert (not d!82442))

(assert (not b!245627))

(assert (not d!82530))

(assert (not d!82504))

(assert (not d!82460))

(assert (not d!82532))

(assert (not b!245567))

(assert (not d!82410))

(assert (not b!245647))

(assert (not b!245645))

(assert (not d!82466))

(assert (not d!82474))

(assert (not b!245650))

(assert (not b!245644))

(assert (not d!82494))

(assert (not d!82394))

(assert (not d!82420))

(assert (not b!245685))

(assert (not d!82400))

(assert (not b!245621))

(assert (not d!82520))

(assert (not d!82522))

(assert (not b!245696))

(assert (not b!245622))

(assert (not d!82462))

(assert (not b!245687))

(assert (not d!82502))

(assert (not d!82506))

(assert (not b!245692))

(assert (not d!82444))

(assert (not d!82518))

(assert (not b!245624))

(assert (not d!82406))

(assert (not d!82468))

(assert (not d!82422))

(assert (not b!245699))

(assert (not b!245693))

(assert (not b!245623))

(assert (not b!245565))

(assert (not b!245646))

(assert (not d!82424))

(assert (not b!245684))

(assert (not d!82476))

(assert (not d!82496))

(assert (not b!245690))

(assert (not d!82470))

(assert (not b!245694))

(assert (not d!82540))

(assert (not d!82512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

