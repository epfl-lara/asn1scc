; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52614 () Bool)

(assert start!52614)

(declare-fun b!243022 () Bool)

(declare-fun e!168459 () Bool)

(declare-datatypes ((array!13326 0))(
  ( (array!13327 (arr!6828 (Array (_ BitVec 32) (_ BitVec 8))) (size!5841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10604 0))(
  ( (BitStream!10605 (buf!6310 array!13326) (currentByte!11682 (_ BitVec 32)) (currentBit!11677 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20802 0))(
  ( (tuple2!20803 (_1!11323 BitStream!10604) (_2!11323 Bool)) )
))
(declare-fun lt!378831 () tuple2!20802)

(declare-fun lt!378832 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243022 (= e!168459 (= (bitIndex!0 (size!5841 (buf!6310 (_1!11323 lt!378831))) (currentByte!11682 (_1!11323 lt!378831)) (currentBit!11677 (_1!11323 lt!378831))) lt!378832))))

(declare-fun b!243023 () Bool)

(declare-fun res!203002 () Bool)

(declare-fun e!168452 () Bool)

(assert (=> b!243023 (=> (not res!203002) (not e!168452))))

(declare-fun thiss!1005 () BitStream!10604)

(declare-datatypes ((Unit!17771 0))(
  ( (Unit!17772) )
))
(declare-datatypes ((tuple2!20804 0))(
  ( (tuple2!20805 (_1!11324 Unit!17771) (_2!11324 BitStream!10604)) )
))
(declare-fun lt!378841 () tuple2!20804)

(declare-fun isPrefixOf!0 (BitStream!10604 BitStream!10604) Bool)

(assert (=> b!243023 (= res!203002 (isPrefixOf!0 thiss!1005 (_2!11324 lt!378841)))))

(declare-fun b!243024 () Bool)

(declare-fun e!168455 () Bool)

(declare-fun e!168456 () Bool)

(assert (=> b!243024 (= e!168455 e!168456)))

(declare-fun res!203007 () Bool)

(assert (=> b!243024 (=> (not res!203007) (not e!168456))))

(declare-fun lt!378833 () tuple2!20804)

(declare-fun lt!378842 () (_ BitVec 64))

(assert (=> b!243024 (= res!203007 (= (bitIndex!0 (size!5841 (buf!6310 (_2!11324 lt!378833))) (currentByte!11682 (_2!11324 lt!378833)) (currentBit!11677 (_2!11324 lt!378833))) (bvadd (bitIndex!0 (size!5841 (buf!6310 (_2!11324 lt!378841))) (currentByte!11682 (_2!11324 lt!378841)) (currentBit!11677 (_2!11324 lt!378841))) lt!378842)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!243024 (= lt!378842 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243025 () Bool)

(declare-fun lt!378844 () tuple2!20802)

(declare-datatypes ((tuple2!20806 0))(
  ( (tuple2!20807 (_1!11325 BitStream!10604) (_2!11325 BitStream!10604)) )
))
(declare-fun lt!378846 () tuple2!20806)

(assert (=> b!243025 (= e!168456 (not (or (not (_2!11323 lt!378844)) (not (= (_1!11323 lt!378844) (_2!11325 lt!378846))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10604 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20802)

(assert (=> b!243025 (= lt!378844 (checkBitsLoopPure!0 (_1!11325 lt!378846) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243025 (validate_offset_bits!1 ((_ sign_extend 32) (size!5841 (buf!6310 (_2!11324 lt!378833)))) ((_ sign_extend 32) (currentByte!11682 (_2!11324 lt!378841))) ((_ sign_extend 32) (currentBit!11677 (_2!11324 lt!378841))) lt!378842)))

(declare-fun lt!378837 () Unit!17771)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10604 array!13326 (_ BitVec 64)) Unit!17771)

(assert (=> b!243025 (= lt!378837 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11324 lt!378841) (buf!6310 (_2!11324 lt!378833)) lt!378842))))

(declare-fun reader!0 (BitStream!10604 BitStream!10604) tuple2!20806)

(assert (=> b!243025 (= lt!378846 (reader!0 (_2!11324 lt!378841) (_2!11324 lt!378833)))))

(declare-fun b!243026 () Bool)

(declare-fun res!203006 () Bool)

(assert (=> b!243026 (=> (not res!203006) (not e!168456))))

(assert (=> b!243026 (= res!203006 (isPrefixOf!0 (_2!11324 lt!378841) (_2!11324 lt!378833)))))

(declare-fun b!243027 () Bool)

(declare-fun e!168454 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243027 (= e!168454 (invariant!0 (currentBit!11677 thiss!1005) (currentByte!11682 thiss!1005) (size!5841 (buf!6310 (_2!11324 lt!378833)))))))

(declare-fun b!243028 () Bool)

(declare-fun e!168457 () Bool)

(assert (=> b!243028 (= e!168457 (not true))))

(declare-fun lt!378838 () tuple2!20806)

(declare-fun readBitPure!0 (BitStream!10604) tuple2!20802)

(assert (=> b!243028 (= (_2!11323 (readBitPure!0 (_1!11325 lt!378838))) bit!26)))

(declare-fun lt!378843 () tuple2!20806)

(assert (=> b!243028 (= lt!378843 (reader!0 (_2!11324 lt!378841) (_2!11324 lt!378833)))))

(assert (=> b!243028 (= lt!378838 (reader!0 thiss!1005 (_2!11324 lt!378833)))))

(declare-fun e!168453 () Bool)

(assert (=> b!243028 e!168453))

(declare-fun res!203001 () Bool)

(assert (=> b!243028 (=> (not res!203001) (not e!168453))))

(declare-fun lt!378836 () tuple2!20802)

(declare-fun lt!378839 () tuple2!20802)

(assert (=> b!243028 (= res!203001 (= (bitIndex!0 (size!5841 (buf!6310 (_1!11323 lt!378836))) (currentByte!11682 (_1!11323 lt!378836)) (currentBit!11677 (_1!11323 lt!378836))) (bitIndex!0 (size!5841 (buf!6310 (_1!11323 lt!378839))) (currentByte!11682 (_1!11323 lt!378839)) (currentBit!11677 (_1!11323 lt!378839)))))))

(declare-fun lt!378845 () Unit!17771)

(declare-fun lt!378835 () BitStream!10604)

(declare-fun readBitPrefixLemma!0 (BitStream!10604 BitStream!10604) Unit!17771)

(assert (=> b!243028 (= lt!378845 (readBitPrefixLemma!0 lt!378835 (_2!11324 lt!378833)))))

(assert (=> b!243028 (= lt!378839 (readBitPure!0 (BitStream!10605 (buf!6310 (_2!11324 lt!378833)) (currentByte!11682 thiss!1005) (currentBit!11677 thiss!1005))))))

(assert (=> b!243028 (= lt!378836 (readBitPure!0 lt!378835))))

(assert (=> b!243028 (= lt!378835 (BitStream!10605 (buf!6310 (_2!11324 lt!378841)) (currentByte!11682 thiss!1005) (currentBit!11677 thiss!1005)))))

(assert (=> b!243028 e!168454))

(declare-fun res!203003 () Bool)

(assert (=> b!243028 (=> (not res!203003) (not e!168454))))

(assert (=> b!243028 (= res!203003 (isPrefixOf!0 thiss!1005 (_2!11324 lt!378833)))))

(declare-fun lt!378840 () Unit!17771)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10604 BitStream!10604 BitStream!10604) Unit!17771)

(assert (=> b!243028 (= lt!378840 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11324 lt!378841) (_2!11324 lt!378833)))))

(assert (=> b!243028 e!168455))

(declare-fun res!202995 () Bool)

(assert (=> b!243028 (=> (not res!202995) (not e!168455))))

(assert (=> b!243028 (= res!202995 (= (size!5841 (buf!6310 (_2!11324 lt!378841))) (size!5841 (buf!6310 (_2!11324 lt!378833)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10604 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20804)

(assert (=> b!243028 (= lt!378833 (appendNBitsLoop!0 (_2!11324 lt!378841) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243028 (validate_offset_bits!1 ((_ sign_extend 32) (size!5841 (buf!6310 (_2!11324 lt!378841)))) ((_ sign_extend 32) (currentByte!11682 (_2!11324 lt!378841))) ((_ sign_extend 32) (currentBit!11677 (_2!11324 lt!378841))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378830 () Unit!17771)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10604 BitStream!10604 (_ BitVec 64) (_ BitVec 64)) Unit!17771)

(assert (=> b!243028 (= lt!378830 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11324 lt!378841) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168460 () Bool)

(assert (=> b!243028 e!168460))

(declare-fun res!203000 () Bool)

(assert (=> b!243028 (=> (not res!203000) (not e!168460))))

(assert (=> b!243028 (= res!203000 (= (size!5841 (buf!6310 thiss!1005)) (size!5841 (buf!6310 (_2!11324 lt!378841)))))))

(declare-fun appendBit!0 (BitStream!10604 Bool) tuple2!20804)

(assert (=> b!243028 (= lt!378841 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243029 () Bool)

(declare-fun res!202997 () Bool)

(assert (=> b!243029 (=> (not res!202997) (not e!168457))))

(assert (=> b!243029 (= res!202997 (validate_offset_bits!1 ((_ sign_extend 32) (size!5841 (buf!6310 thiss!1005))) ((_ sign_extend 32) (currentByte!11682 thiss!1005)) ((_ sign_extend 32) (currentBit!11677 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!203004 () Bool)

(assert (=> start!52614 (=> (not res!203004) (not e!168457))))

(assert (=> start!52614 (= res!203004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52614 e!168457))

(assert (=> start!52614 true))

(declare-fun e!168458 () Bool)

(declare-fun inv!12 (BitStream!10604) Bool)

(assert (=> start!52614 (and (inv!12 thiss!1005) e!168458)))

(declare-fun b!243030 () Bool)

(declare-fun res!202996 () Bool)

(assert (=> b!243030 (=> (not res!202996) (not e!168454))))

(assert (=> b!243030 (= res!202996 (invariant!0 (currentBit!11677 thiss!1005) (currentByte!11682 thiss!1005) (size!5841 (buf!6310 (_2!11324 lt!378841)))))))

(declare-fun b!243031 () Bool)

(assert (=> b!243031 (= e!168460 e!168452)))

(declare-fun res!203005 () Bool)

(assert (=> b!243031 (=> (not res!203005) (not e!168452))))

(declare-fun lt!378834 () (_ BitVec 64))

(assert (=> b!243031 (= res!203005 (= lt!378832 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378834)))))

(assert (=> b!243031 (= lt!378832 (bitIndex!0 (size!5841 (buf!6310 (_2!11324 lt!378841))) (currentByte!11682 (_2!11324 lt!378841)) (currentBit!11677 (_2!11324 lt!378841))))))

(assert (=> b!243031 (= lt!378834 (bitIndex!0 (size!5841 (buf!6310 thiss!1005)) (currentByte!11682 thiss!1005) (currentBit!11677 thiss!1005)))))

(declare-fun b!243032 () Bool)

(assert (=> b!243032 (= e!168452 e!168459)))

(declare-fun res!202999 () Bool)

(assert (=> b!243032 (=> (not res!202999) (not e!168459))))

(assert (=> b!243032 (= res!202999 (and (= (_2!11323 lt!378831) bit!26) (= (_1!11323 lt!378831) (_2!11324 lt!378841))))))

(declare-fun readerFrom!0 (BitStream!10604 (_ BitVec 32) (_ BitVec 32)) BitStream!10604)

(assert (=> b!243032 (= lt!378831 (readBitPure!0 (readerFrom!0 (_2!11324 lt!378841) (currentBit!11677 thiss!1005) (currentByte!11682 thiss!1005))))))

(declare-fun b!243033 () Bool)

(assert (=> b!243033 (= e!168453 (= (_2!11323 lt!378836) (_2!11323 lt!378839)))))

(declare-fun b!243034 () Bool)

(declare-fun array_inv!5582 (array!13326) Bool)

(assert (=> b!243034 (= e!168458 (array_inv!5582 (buf!6310 thiss!1005)))))

(declare-fun b!243035 () Bool)

(declare-fun res!202998 () Bool)

(assert (=> b!243035 (=> (not res!202998) (not e!168457))))

(assert (=> b!243035 (= res!202998 (bvslt from!289 nBits!297))))

(assert (= (and start!52614 res!203004) b!243029))

(assert (= (and b!243029 res!202997) b!243035))

(assert (= (and b!243035 res!202998) b!243028))

(assert (= (and b!243028 res!203000) b!243031))

(assert (= (and b!243031 res!203005) b!243023))

(assert (= (and b!243023 res!203002) b!243032))

(assert (= (and b!243032 res!202999) b!243022))

(assert (= (and b!243028 res!202995) b!243024))

(assert (= (and b!243024 res!203007) b!243026))

(assert (= (and b!243026 res!203006) b!243025))

(assert (= (and b!243028 res!203003) b!243030))

(assert (= (and b!243030 res!202996) b!243027))

(assert (= (and b!243028 res!203001) b!243033))

(assert (= start!52614 b!243034))

(declare-fun m!366173 () Bool)

(assert (=> b!243030 m!366173))

(declare-fun m!366175 () Bool)

(assert (=> b!243025 m!366175))

(declare-fun m!366177 () Bool)

(assert (=> b!243025 m!366177))

(declare-fun m!366179 () Bool)

(assert (=> b!243025 m!366179))

(declare-fun m!366181 () Bool)

(assert (=> b!243025 m!366181))

(declare-fun m!366183 () Bool)

(assert (=> b!243026 m!366183))

(declare-fun m!366185 () Bool)

(assert (=> b!243028 m!366185))

(declare-fun m!366187 () Bool)

(assert (=> b!243028 m!366187))

(declare-fun m!366189 () Bool)

(assert (=> b!243028 m!366189))

(declare-fun m!366191 () Bool)

(assert (=> b!243028 m!366191))

(declare-fun m!366193 () Bool)

(assert (=> b!243028 m!366193))

(declare-fun m!366195 () Bool)

(assert (=> b!243028 m!366195))

(declare-fun m!366197 () Bool)

(assert (=> b!243028 m!366197))

(declare-fun m!366199 () Bool)

(assert (=> b!243028 m!366199))

(assert (=> b!243028 m!366181))

(declare-fun m!366201 () Bool)

(assert (=> b!243028 m!366201))

(declare-fun m!366203 () Bool)

(assert (=> b!243028 m!366203))

(declare-fun m!366205 () Bool)

(assert (=> b!243028 m!366205))

(declare-fun m!366207 () Bool)

(assert (=> b!243028 m!366207))

(declare-fun m!366209 () Bool)

(assert (=> b!243028 m!366209))

(declare-fun m!366211 () Bool)

(assert (=> b!243023 m!366211))

(declare-fun m!366213 () Bool)

(assert (=> b!243031 m!366213))

(declare-fun m!366215 () Bool)

(assert (=> b!243031 m!366215))

(declare-fun m!366217 () Bool)

(assert (=> b!243032 m!366217))

(assert (=> b!243032 m!366217))

(declare-fun m!366219 () Bool)

(assert (=> b!243032 m!366219))

(declare-fun m!366221 () Bool)

(assert (=> start!52614 m!366221))

(declare-fun m!366223 () Bool)

(assert (=> b!243024 m!366223))

(assert (=> b!243024 m!366213))

(declare-fun m!366225 () Bool)

(assert (=> b!243022 m!366225))

(declare-fun m!366227 () Bool)

(assert (=> b!243034 m!366227))

(declare-fun m!366229 () Bool)

(assert (=> b!243029 m!366229))

(declare-fun m!366231 () Bool)

(assert (=> b!243027 m!366231))

(push 1)

(assert (not b!243022))

(assert (not b!243034))

(assert (not b!243027))

(assert (not b!243031))

(assert (not b!243026))

(assert (not b!243030))

(assert (not start!52614))

(assert (not b!243029))

(assert (not b!243024))

(assert (not b!243028))

(assert (not b!243023))

(assert (not b!243032))

(assert (not b!243025))

