; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52620 () Bool)

(assert start!52620)

(declare-fun b!243148 () Bool)

(declare-fun res!203116 () Bool)

(declare-fun e!168545 () Bool)

(assert (=> b!243148 (=> (not res!203116) (not e!168545))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!243148 (= res!203116 (bvslt from!289 nBits!297))))

(declare-fun b!243150 () Bool)

(declare-fun e!168550 () Bool)

(declare-datatypes ((array!13332 0))(
  ( (array!13333 (arr!6831 (Array (_ BitVec 32) (_ BitVec 8))) (size!5844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10610 0))(
  ( (BitStream!10611 (buf!6313 array!13332) (currentByte!11685 (_ BitVec 32)) (currentBit!11680 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20820 0))(
  ( (tuple2!20821 (_1!11332 BitStream!10610) (_2!11332 Bool)) )
))
(declare-fun lt!378989 () tuple2!20820)

(declare-fun lt!378990 () tuple2!20820)

(assert (=> b!243150 (= e!168550 (= (_2!11332 lt!378989) (_2!11332 lt!378990)))))

(declare-fun b!243151 () Bool)

(declare-fun e!168547 () Bool)

(declare-fun e!168549 () Bool)

(assert (=> b!243151 (= e!168547 e!168549)))

(declare-fun res!203120 () Bool)

(assert (=> b!243151 (=> (not res!203120) (not e!168549))))

(declare-fun lt!378983 () (_ BitVec 64))

(declare-datatypes ((Unit!17777 0))(
  ( (Unit!17778) )
))
(declare-datatypes ((tuple2!20822 0))(
  ( (tuple2!20823 (_1!11333 Unit!17777) (_2!11333 BitStream!10610)) )
))
(declare-fun lt!378993 () tuple2!20822)

(declare-fun lt!378987 () tuple2!20822)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243151 (= res!203120 (= (bitIndex!0 (size!5844 (buf!6313 (_2!11333 lt!378987))) (currentByte!11685 (_2!11333 lt!378987)) (currentBit!11680 (_2!11333 lt!378987))) (bvadd (bitIndex!0 (size!5844 (buf!6313 (_2!11333 lt!378993))) (currentByte!11685 (_2!11333 lt!378993)) (currentBit!11680 (_2!11333 lt!378993))) lt!378983)))))

(assert (=> b!243151 (= lt!378983 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243152 () Bool)

(declare-fun e!168551 () Bool)

(declare-fun thiss!1005 () BitStream!10610)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243152 (= e!168551 (invariant!0 (currentBit!11680 thiss!1005) (currentByte!11685 thiss!1005) (size!5844 (buf!6313 (_2!11333 lt!378987)))))))

(declare-fun b!243153 () Bool)

(declare-fun lt!378998 () tuple2!20820)

(declare-datatypes ((tuple2!20824 0))(
  ( (tuple2!20825 (_1!11334 BitStream!10610) (_2!11334 BitStream!10610)) )
))
(declare-fun lt!378986 () tuple2!20824)

(assert (=> b!243153 (= e!168549 (not (or (not (_2!11332 lt!378998)) (not (= (_1!11332 lt!378998) (_2!11334 lt!378986))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10610 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20820)

(assert (=> b!243153 (= lt!378998 (checkBitsLoopPure!0 (_1!11334 lt!378986) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243153 (validate_offset_bits!1 ((_ sign_extend 32) (size!5844 (buf!6313 (_2!11333 lt!378987)))) ((_ sign_extend 32) (currentByte!11685 (_2!11333 lt!378993))) ((_ sign_extend 32) (currentBit!11680 (_2!11333 lt!378993))) lt!378983)))

(declare-fun lt!378999 () Unit!17777)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10610 array!13332 (_ BitVec 64)) Unit!17777)

(assert (=> b!243153 (= lt!378999 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11333 lt!378993) (buf!6313 (_2!11333 lt!378987)) lt!378983))))

(declare-fun reader!0 (BitStream!10610 BitStream!10610) tuple2!20824)

(assert (=> b!243153 (= lt!378986 (reader!0 (_2!11333 lt!378993) (_2!11333 lt!378987)))))

(declare-fun b!243154 () Bool)

(declare-fun res!203123 () Bool)

(assert (=> b!243154 (=> (not res!203123) (not e!168549))))

(declare-fun isPrefixOf!0 (BitStream!10610 BitStream!10610) Bool)

(assert (=> b!243154 (= res!203123 (isPrefixOf!0 (_2!11333 lt!378993) (_2!11333 lt!378987)))))

(declare-fun b!243155 () Bool)

(declare-fun e!168548 () Bool)

(declare-fun array_inv!5585 (array!13332) Bool)

(assert (=> b!243155 (= e!168548 (array_inv!5585 (buf!6313 thiss!1005)))))

(declare-fun b!243156 () Bool)

(declare-fun e!168542 () Bool)

(declare-fun lt!378985 () tuple2!20820)

(declare-fun lt!378992 () (_ BitVec 64))

(assert (=> b!243156 (= e!168542 (= (bitIndex!0 (size!5844 (buf!6313 (_1!11332 lt!378985))) (currentByte!11685 (_1!11332 lt!378985)) (currentBit!11680 (_1!11332 lt!378985))) lt!378992))))

(declare-fun b!243157 () Bool)

(assert (=> b!243157 (= e!168545 (not true))))

(declare-fun lt!378994 () tuple2!20824)

(declare-fun readBitPure!0 (BitStream!10610) tuple2!20820)

(assert (=> b!243157 (= (_2!11332 (readBitPure!0 (_1!11334 lt!378994))) bit!26)))

(declare-fun lt!378988 () tuple2!20824)

(assert (=> b!243157 (= lt!378988 (reader!0 (_2!11333 lt!378993) (_2!11333 lt!378987)))))

(assert (=> b!243157 (= lt!378994 (reader!0 thiss!1005 (_2!11333 lt!378987)))))

(assert (=> b!243157 e!168550))

(declare-fun res!203113 () Bool)

(assert (=> b!243157 (=> (not res!203113) (not e!168550))))

(assert (=> b!243157 (= res!203113 (= (bitIndex!0 (size!5844 (buf!6313 (_1!11332 lt!378989))) (currentByte!11685 (_1!11332 lt!378989)) (currentBit!11680 (_1!11332 lt!378989))) (bitIndex!0 (size!5844 (buf!6313 (_1!11332 lt!378990))) (currentByte!11685 (_1!11332 lt!378990)) (currentBit!11680 (_1!11332 lt!378990)))))))

(declare-fun lt!378991 () Unit!17777)

(declare-fun lt!378984 () BitStream!10610)

(declare-fun readBitPrefixLemma!0 (BitStream!10610 BitStream!10610) Unit!17777)

(assert (=> b!243157 (= lt!378991 (readBitPrefixLemma!0 lt!378984 (_2!11333 lt!378987)))))

(assert (=> b!243157 (= lt!378990 (readBitPure!0 (BitStream!10611 (buf!6313 (_2!11333 lt!378987)) (currentByte!11685 thiss!1005) (currentBit!11680 thiss!1005))))))

(assert (=> b!243157 (= lt!378989 (readBitPure!0 lt!378984))))

(assert (=> b!243157 (= lt!378984 (BitStream!10611 (buf!6313 (_2!11333 lt!378993)) (currentByte!11685 thiss!1005) (currentBit!11680 thiss!1005)))))

(assert (=> b!243157 e!168551))

(declare-fun res!203124 () Bool)

(assert (=> b!243157 (=> (not res!203124) (not e!168551))))

(assert (=> b!243157 (= res!203124 (isPrefixOf!0 thiss!1005 (_2!11333 lt!378987)))))

(declare-fun lt!378997 () Unit!17777)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10610 BitStream!10610 BitStream!10610) Unit!17777)

(assert (=> b!243157 (= lt!378997 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11333 lt!378993) (_2!11333 lt!378987)))))

(assert (=> b!243157 e!168547))

(declare-fun res!203117 () Bool)

(assert (=> b!243157 (=> (not res!203117) (not e!168547))))

(assert (=> b!243157 (= res!203117 (= (size!5844 (buf!6313 (_2!11333 lt!378993))) (size!5844 (buf!6313 (_2!11333 lt!378987)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10610 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20822)

(assert (=> b!243157 (= lt!378987 (appendNBitsLoop!0 (_2!11333 lt!378993) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243157 (validate_offset_bits!1 ((_ sign_extend 32) (size!5844 (buf!6313 (_2!11333 lt!378993)))) ((_ sign_extend 32) (currentByte!11685 (_2!11333 lt!378993))) ((_ sign_extend 32) (currentBit!11680 (_2!11333 lt!378993))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378995 () Unit!17777)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10610 BitStream!10610 (_ BitVec 64) (_ BitVec 64)) Unit!17777)

(assert (=> b!243157 (= lt!378995 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11333 lt!378993) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168546 () Bool)

(assert (=> b!243157 e!168546))

(declare-fun res!203119 () Bool)

(assert (=> b!243157 (=> (not res!203119) (not e!168546))))

(assert (=> b!243157 (= res!203119 (= (size!5844 (buf!6313 thiss!1005)) (size!5844 (buf!6313 (_2!11333 lt!378993)))))))

(declare-fun appendBit!0 (BitStream!10610 Bool) tuple2!20822)

(assert (=> b!243157 (= lt!378993 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!203122 () Bool)

(assert (=> start!52620 (=> (not res!203122) (not e!168545))))

(assert (=> start!52620 (= res!203122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52620 e!168545))

(assert (=> start!52620 true))

(declare-fun inv!12 (BitStream!10610) Bool)

(assert (=> start!52620 (and (inv!12 thiss!1005) e!168548)))

(declare-fun b!243149 () Bool)

(declare-fun res!203118 () Bool)

(assert (=> b!243149 (=> (not res!203118) (not e!168551))))

(assert (=> b!243149 (= res!203118 (invariant!0 (currentBit!11680 thiss!1005) (currentByte!11685 thiss!1005) (size!5844 (buf!6313 (_2!11333 lt!378993)))))))

(declare-fun b!243158 () Bool)

(declare-fun res!203112 () Bool)

(assert (=> b!243158 (=> (not res!203112) (not e!168545))))

(assert (=> b!243158 (= res!203112 (validate_offset_bits!1 ((_ sign_extend 32) (size!5844 (buf!6313 thiss!1005))) ((_ sign_extend 32) (currentByte!11685 thiss!1005)) ((_ sign_extend 32) (currentBit!11680 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243159 () Bool)

(declare-fun e!168544 () Bool)

(assert (=> b!243159 (= e!168546 e!168544)))

(declare-fun res!203114 () Bool)

(assert (=> b!243159 (=> (not res!203114) (not e!168544))))

(declare-fun lt!378996 () (_ BitVec 64))

(assert (=> b!243159 (= res!203114 (= lt!378992 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378996)))))

(assert (=> b!243159 (= lt!378992 (bitIndex!0 (size!5844 (buf!6313 (_2!11333 lt!378993))) (currentByte!11685 (_2!11333 lt!378993)) (currentBit!11680 (_2!11333 lt!378993))))))

(assert (=> b!243159 (= lt!378996 (bitIndex!0 (size!5844 (buf!6313 thiss!1005)) (currentByte!11685 thiss!1005) (currentBit!11680 thiss!1005)))))

(declare-fun b!243160 () Bool)

(assert (=> b!243160 (= e!168544 e!168542)))

(declare-fun res!203121 () Bool)

(assert (=> b!243160 (=> (not res!203121) (not e!168542))))

(assert (=> b!243160 (= res!203121 (and (= (_2!11332 lt!378985) bit!26) (= (_1!11332 lt!378985) (_2!11333 lt!378993))))))

(declare-fun readerFrom!0 (BitStream!10610 (_ BitVec 32) (_ BitVec 32)) BitStream!10610)

(assert (=> b!243160 (= lt!378985 (readBitPure!0 (readerFrom!0 (_2!11333 lt!378993) (currentBit!11680 thiss!1005) (currentByte!11685 thiss!1005))))))

(declare-fun b!243161 () Bool)

(declare-fun res!203115 () Bool)

(assert (=> b!243161 (=> (not res!203115) (not e!168544))))

(assert (=> b!243161 (= res!203115 (isPrefixOf!0 thiss!1005 (_2!11333 lt!378993)))))

(assert (= (and start!52620 res!203122) b!243158))

(assert (= (and b!243158 res!203112) b!243148))

(assert (= (and b!243148 res!203116) b!243157))

(assert (= (and b!243157 res!203119) b!243159))

(assert (= (and b!243159 res!203114) b!243161))

(assert (= (and b!243161 res!203115) b!243160))

(assert (= (and b!243160 res!203121) b!243156))

(assert (= (and b!243157 res!203117) b!243151))

(assert (= (and b!243151 res!203120) b!243154))

(assert (= (and b!243154 res!203123) b!243153))

(assert (= (and b!243157 res!203124) b!243149))

(assert (= (and b!243149 res!203118) b!243152))

(assert (= (and b!243157 res!203113) b!243150))

(assert (= start!52620 b!243155))

(declare-fun m!366353 () Bool)

(assert (=> b!243161 m!366353))

(declare-fun m!366355 () Bool)

(assert (=> b!243159 m!366355))

(declare-fun m!366357 () Bool)

(assert (=> b!243159 m!366357))

(declare-fun m!366359 () Bool)

(assert (=> start!52620 m!366359))

(declare-fun m!366361 () Bool)

(assert (=> b!243156 m!366361))

(declare-fun m!366363 () Bool)

(assert (=> b!243151 m!366363))

(assert (=> b!243151 m!366355))

(declare-fun m!366365 () Bool)

(assert (=> b!243160 m!366365))

(assert (=> b!243160 m!366365))

(declare-fun m!366367 () Bool)

(assert (=> b!243160 m!366367))

(declare-fun m!366369 () Bool)

(assert (=> b!243149 m!366369))

(declare-fun m!366371 () Bool)

(assert (=> b!243153 m!366371))

(declare-fun m!366373 () Bool)

(assert (=> b!243153 m!366373))

(declare-fun m!366375 () Bool)

(assert (=> b!243153 m!366375))

(declare-fun m!366377 () Bool)

(assert (=> b!243153 m!366377))

(declare-fun m!366379 () Bool)

(assert (=> b!243157 m!366379))

(declare-fun m!366381 () Bool)

(assert (=> b!243157 m!366381))

(declare-fun m!366383 () Bool)

(assert (=> b!243157 m!366383))

(declare-fun m!366385 () Bool)

(assert (=> b!243157 m!366385))

(declare-fun m!366387 () Bool)

(assert (=> b!243157 m!366387))

(declare-fun m!366389 () Bool)

(assert (=> b!243157 m!366389))

(declare-fun m!366391 () Bool)

(assert (=> b!243157 m!366391))

(declare-fun m!366393 () Bool)

(assert (=> b!243157 m!366393))

(assert (=> b!243157 m!366377))

(declare-fun m!366395 () Bool)

(assert (=> b!243157 m!366395))

(declare-fun m!366397 () Bool)

(assert (=> b!243157 m!366397))

(declare-fun m!366399 () Bool)

(assert (=> b!243157 m!366399))

(declare-fun m!366401 () Bool)

(assert (=> b!243157 m!366401))

(declare-fun m!366403 () Bool)

(assert (=> b!243157 m!366403))

(declare-fun m!366405 () Bool)

(assert (=> b!243152 m!366405))

(declare-fun m!366407 () Bool)

(assert (=> b!243155 m!366407))

(declare-fun m!366409 () Bool)

(assert (=> b!243158 m!366409))

(declare-fun m!366411 () Bool)

(assert (=> b!243154 m!366411))

(push 1)

(assert (not start!52620))

(assert (not b!243160))

(assert (not b!243157))

(assert (not b!243154))

(assert (not b!243158))

(assert (not b!243153))

(assert (not b!243155))

(assert (not b!243149))

(assert (not b!243159))

(assert (not b!243161))

(assert (not b!243152))

(assert (not b!243156))

(assert (not b!243151))

(check-sat)

