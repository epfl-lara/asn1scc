; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52986 () Bool)

(assert start!52986)

(declare-fun res!205262 () Bool)

(declare-fun e!170090 () Bool)

(assert (=> start!52986 (=> (not res!205262) (not e!170090))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52986 (= res!205262 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52986 e!170090))

(assert (=> start!52986 true))

(declare-datatypes ((array!13413 0))(
  ( (array!13414 (arr!6867 (Array (_ BitVec 32) (_ BitVec 8))) (size!5880 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10682 0))(
  ( (BitStream!10683 (buf!6358 array!13413) (currentByte!11748 (_ BitVec 32)) (currentBit!11743 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10682)

(declare-fun e!170092 () Bool)

(declare-fun inv!12 (BitStream!10682) Bool)

(assert (=> start!52986 (and (inv!12 thiss!1005) e!170092)))

(declare-fun b!245479 () Bool)

(declare-fun e!170089 () Bool)

(declare-fun e!170097 () Bool)

(assert (=> b!245479 (= e!170089 e!170097)))

(declare-fun res!205273 () Bool)

(assert (=> b!245479 (=> (not res!205273) (not e!170097))))

(declare-fun lt!382874 () (_ BitVec 64))

(declare-fun lt!382879 () (_ BitVec 64))

(assert (=> b!245479 (= res!205273 (= lt!382874 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!382879)))))

(declare-datatypes ((Unit!17867 0))(
  ( (Unit!17868) )
))
(declare-datatypes ((tuple2!21054 0))(
  ( (tuple2!21055 (_1!11449 Unit!17867) (_2!11449 BitStream!10682)) )
))
(declare-fun lt!382866 () tuple2!21054)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245479 (= lt!382874 (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!382866))) (currentByte!11748 (_2!11449 lt!382866)) (currentBit!11743 (_2!11449 lt!382866))))))

(assert (=> b!245479 (= lt!382879 (bitIndex!0 (size!5880 (buf!6358 thiss!1005)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)))))

(declare-fun b!245480 () Bool)

(declare-fun res!205266 () Bool)

(assert (=> b!245480 (=> (not res!205266) (not e!170097))))

(declare-fun isPrefixOf!0 (BitStream!10682 BitStream!10682) Bool)

(assert (=> b!245480 (= res!205266 (isPrefixOf!0 thiss!1005 (_2!11449 lt!382866)))))

(declare-fun b!245481 () Bool)

(declare-fun res!205272 () Bool)

(declare-fun e!170091 () Bool)

(assert (=> b!245481 (=> (not res!205272) (not e!170091))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245481 (= res!205272 (invariant!0 (currentBit!11743 thiss!1005) (currentByte!11748 thiss!1005) (size!5880 (buf!6358 (_2!11449 lt!382866)))))))

(declare-fun b!245482 () Bool)

(declare-fun e!170099 () Bool)

(declare-datatypes ((tuple2!21056 0))(
  ( (tuple2!21057 (_1!11450 BitStream!10682) (_2!11450 Bool)) )
))
(declare-fun lt!382878 () tuple2!21056)

(declare-fun lt!382882 () tuple2!21056)

(assert (=> b!245482 (= e!170099 (= (_2!11450 lt!382878) (_2!11450 lt!382882)))))

(declare-fun b!245483 () Bool)

(declare-fun array_inv!5621 (array!13413) Bool)

(assert (=> b!245483 (= e!170092 (array_inv!5621 (buf!6358 thiss!1005)))))

(declare-fun b!245484 () Bool)

(declare-fun e!170095 () Bool)

(declare-fun lt!382863 () tuple2!21054)

(assert (=> b!245484 (= e!170095 (invariant!0 (currentBit!11743 (_2!11449 lt!382863)) (currentByte!11748 (_2!11449 lt!382863)) (size!5880 (buf!6358 (_2!11449 lt!382863)))))))

(declare-fun b!245485 () Bool)

(declare-fun res!205269 () Bool)

(assert (=> b!245485 (=> (not res!205269) (not e!170090))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245485 (= res!205269 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 thiss!1005))) ((_ sign_extend 32) (currentByte!11748 thiss!1005)) ((_ sign_extend 32) (currentBit!11743 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245486 () Bool)

(declare-fun res!205275 () Bool)

(assert (=> b!245486 (=> (not res!205275) (not e!170090))))

(assert (=> b!245486 (= res!205275 (bvslt from!289 nBits!297))))

(declare-fun b!245487 () Bool)

(declare-fun e!170088 () Bool)

(declare-fun lt!382868 () tuple2!21056)

(declare-datatypes ((tuple2!21058 0))(
  ( (tuple2!21059 (_1!11451 BitStream!10682) (_2!11451 BitStream!10682)) )
))
(declare-fun lt!382875 () tuple2!21058)

(assert (=> b!245487 (= e!170088 (not (or (not (_2!11450 lt!382868)) (not (= (_1!11450 lt!382868) (_2!11451 lt!382875))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10682 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21056)

(assert (=> b!245487 (= lt!382868 (checkBitsLoopPure!0 (_1!11451 lt!382875) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382867 () (_ BitVec 64))

(assert (=> b!245487 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!382867)))

(declare-fun lt!382880 () Unit!17867)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10682 array!13413 (_ BitVec 64)) Unit!17867)

(assert (=> b!245487 (= lt!382880 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11449 lt!382866) (buf!6358 (_2!11449 lt!382863)) lt!382867))))

(declare-fun reader!0 (BitStream!10682 BitStream!10682) tuple2!21058)

(assert (=> b!245487 (= lt!382875 (reader!0 (_2!11449 lt!382866) (_2!11449 lt!382863)))))

(declare-fun b!245488 () Bool)

(assert (=> b!245488 (= e!170091 (invariant!0 (currentBit!11743 thiss!1005) (currentByte!11748 thiss!1005) (size!5880 (buf!6358 (_2!11449 lt!382863)))))))

(declare-fun b!245489 () Bool)

(declare-fun e!170093 () Bool)

(assert (=> b!245489 (= e!170097 e!170093)))

(declare-fun res!205270 () Bool)

(assert (=> b!245489 (=> (not res!205270) (not e!170093))))

(declare-fun lt!382870 () tuple2!21056)

(assert (=> b!245489 (= res!205270 (and (= (_2!11450 lt!382870) bit!26) (= (_1!11450 lt!382870) (_2!11449 lt!382866))))))

(declare-fun readBitPure!0 (BitStream!10682) tuple2!21056)

(declare-fun readerFrom!0 (BitStream!10682 (_ BitVec 32) (_ BitVec 32)) BitStream!10682)

(assert (=> b!245489 (= lt!382870 (readBitPure!0 (readerFrom!0 (_2!11449 lt!382866) (currentBit!11743 thiss!1005) (currentByte!11748 thiss!1005))))))

(declare-fun b!245490 () Bool)

(declare-fun e!170098 () Bool)

(assert (=> b!245490 (= e!170098 e!170088)))

(declare-fun res!205268 () Bool)

(assert (=> b!245490 (=> (not res!205268) (not e!170088))))

(assert (=> b!245490 (= res!205268 (= (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!382863))) (currentByte!11748 (_2!11449 lt!382863)) (currentBit!11743 (_2!11449 lt!382863))) (bvadd (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!382866))) (currentByte!11748 (_2!11449 lt!382866)) (currentBit!11743 (_2!11449 lt!382866))) lt!382867)))))

(assert (=> b!245490 (= lt!382867 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245491 () Bool)

(declare-fun e!170094 () Bool)

(assert (=> b!245491 (= e!170094 e!170095)))

(declare-fun res!205264 () Bool)

(assert (=> b!245491 (=> res!205264 e!170095)))

(assert (=> b!245491 (= res!205264 (not (= (size!5880 (buf!6358 thiss!1005)) (size!5880 (buf!6358 (_2!11449 lt!382863))))))))

(declare-fun lt!382865 () tuple2!21056)

(declare-fun lt!382877 () tuple2!21056)

(declare-fun lt!382881 () tuple2!21058)

(assert (=> b!245491 (and (= (_2!11450 lt!382865) (_2!11450 lt!382877)) (= (_1!11450 lt!382865) (_2!11451 lt!382881)))))

(declare-fun b!245492 () Bool)

(declare-fun res!205260 () Bool)

(assert (=> b!245492 (=> (not res!205260) (not e!170088))))

(assert (=> b!245492 (= res!205260 (isPrefixOf!0 (_2!11449 lt!382866) (_2!11449 lt!382863)))))

(declare-fun b!245493 () Bool)

(declare-fun res!205267 () Bool)

(assert (=> b!245493 (=> res!205267 e!170094)))

(declare-fun lt!382864 () tuple2!21058)

(declare-fun withMovedBitIndex!0 (BitStream!10682 (_ BitVec 64)) BitStream!10682)

(assert (=> b!245493 (= res!205267 (not (= (_1!11451 lt!382864) (withMovedBitIndex!0 (_1!11451 lt!382881) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245494 () Bool)

(assert (=> b!245494 (= e!170093 (= (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!382870))) (currentByte!11748 (_1!11450 lt!382870)) (currentBit!11743 (_1!11450 lt!382870))) lt!382874))))

(declare-fun b!245495 () Bool)

(assert (=> b!245495 (= e!170090 (not e!170094))))

(declare-fun res!205261 () Bool)

(assert (=> b!245495 (=> res!205261 e!170094)))

(assert (=> b!245495 (= res!205261 (not (= (_1!11450 lt!382877) (_2!11451 lt!382864))))))

(assert (=> b!245495 (= lt!382877 (checkBitsLoopPure!0 (_1!11451 lt!382864) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382873 () (_ BitVec 64))

(assert (=> b!245495 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!382873)))

(declare-fun lt!382876 () Unit!17867)

(assert (=> b!245495 (= lt!382876 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11449 lt!382866) (buf!6358 (_2!11449 lt!382863)) lt!382873))))

(assert (=> b!245495 (= lt!382865 (checkBitsLoopPure!0 (_1!11451 lt!382881) nBits!297 bit!26 from!289))))

(assert (=> b!245495 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 thiss!1005)) ((_ sign_extend 32) (currentBit!11743 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382884 () Unit!17867)

(assert (=> b!245495 (= lt!382884 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6358 (_2!11449 lt!382863)) (bvsub nBits!297 from!289)))))

(assert (=> b!245495 (= (_2!11450 (readBitPure!0 (_1!11451 lt!382881))) bit!26)))

(assert (=> b!245495 (= lt!382864 (reader!0 (_2!11449 lt!382866) (_2!11449 lt!382863)))))

(assert (=> b!245495 (= lt!382881 (reader!0 thiss!1005 (_2!11449 lt!382863)))))

(assert (=> b!245495 e!170099))

(declare-fun res!205271 () Bool)

(assert (=> b!245495 (=> (not res!205271) (not e!170099))))

(assert (=> b!245495 (= res!205271 (= (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!382878))) (currentByte!11748 (_1!11450 lt!382878)) (currentBit!11743 (_1!11450 lt!382878))) (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!382882))) (currentByte!11748 (_1!11450 lt!382882)) (currentBit!11743 (_1!11450 lt!382882)))))))

(declare-fun lt!382872 () Unit!17867)

(declare-fun lt!382871 () BitStream!10682)

(declare-fun readBitPrefixLemma!0 (BitStream!10682 BitStream!10682) Unit!17867)

(assert (=> b!245495 (= lt!382872 (readBitPrefixLemma!0 lt!382871 (_2!11449 lt!382863)))))

(assert (=> b!245495 (= lt!382882 (readBitPure!0 (BitStream!10683 (buf!6358 (_2!11449 lt!382863)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005))))))

(assert (=> b!245495 (= lt!382878 (readBitPure!0 lt!382871))))

(assert (=> b!245495 (= lt!382871 (BitStream!10683 (buf!6358 (_2!11449 lt!382866)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)))))

(assert (=> b!245495 e!170091))

(declare-fun res!205265 () Bool)

(assert (=> b!245495 (=> (not res!205265) (not e!170091))))

(assert (=> b!245495 (= res!205265 (isPrefixOf!0 thiss!1005 (_2!11449 lt!382863)))))

(declare-fun lt!382883 () Unit!17867)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10682 BitStream!10682 BitStream!10682) Unit!17867)

(assert (=> b!245495 (= lt!382883 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11449 lt!382866) (_2!11449 lt!382863)))))

(assert (=> b!245495 e!170098))

(declare-fun res!205274 () Bool)

(assert (=> b!245495 (=> (not res!205274) (not e!170098))))

(assert (=> b!245495 (= res!205274 (= (size!5880 (buf!6358 (_2!11449 lt!382866))) (size!5880 (buf!6358 (_2!11449 lt!382863)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10682 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21054)

(assert (=> b!245495 (= lt!382863 (appendNBitsLoop!0 (_2!11449 lt!382866) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245495 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382866)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!382873)))

(assert (=> b!245495 (= lt!382873 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!382869 () Unit!17867)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10682 BitStream!10682 (_ BitVec 64) (_ BitVec 64)) Unit!17867)

(assert (=> b!245495 (= lt!382869 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11449 lt!382866) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245495 e!170089))

(declare-fun res!205263 () Bool)

(assert (=> b!245495 (=> (not res!205263) (not e!170089))))

(assert (=> b!245495 (= res!205263 (= (size!5880 (buf!6358 thiss!1005)) (size!5880 (buf!6358 (_2!11449 lt!382866)))))))

(declare-fun appendBit!0 (BitStream!10682 Bool) tuple2!21054)

(assert (=> b!245495 (= lt!382866 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52986 res!205262) b!245485))

(assert (= (and b!245485 res!205269) b!245486))

(assert (= (and b!245486 res!205275) b!245495))

(assert (= (and b!245495 res!205263) b!245479))

(assert (= (and b!245479 res!205273) b!245480))

(assert (= (and b!245480 res!205266) b!245489))

(assert (= (and b!245489 res!205270) b!245494))

(assert (= (and b!245495 res!205274) b!245490))

(assert (= (and b!245490 res!205268) b!245492))

(assert (= (and b!245492 res!205260) b!245487))

(assert (= (and b!245495 res!205265) b!245481))

(assert (= (and b!245481 res!205272) b!245488))

(assert (= (and b!245495 res!205271) b!245482))

(assert (= (and b!245495 (not res!205261)) b!245493))

(assert (= (and b!245493 (not res!205267)) b!245491))

(assert (= (and b!245491 (not res!205264)) b!245484))

(assert (= start!52986 b!245483))

(declare-fun m!370171 () Bool)

(assert (=> b!245479 m!370171))

(declare-fun m!370173 () Bool)

(assert (=> b!245479 m!370173))

(declare-fun m!370175 () Bool)

(assert (=> start!52986 m!370175))

(declare-fun m!370177 () Bool)

(assert (=> b!245484 m!370177))

(declare-fun m!370179 () Bool)

(assert (=> b!245481 m!370179))

(declare-fun m!370181 () Bool)

(assert (=> b!245493 m!370181))

(declare-fun m!370183 () Bool)

(assert (=> b!245490 m!370183))

(assert (=> b!245490 m!370171))

(declare-fun m!370185 () Bool)

(assert (=> b!245489 m!370185))

(assert (=> b!245489 m!370185))

(declare-fun m!370187 () Bool)

(assert (=> b!245489 m!370187))

(declare-fun m!370189 () Bool)

(assert (=> b!245485 m!370189))

(declare-fun m!370191 () Bool)

(assert (=> b!245487 m!370191))

(declare-fun m!370193 () Bool)

(assert (=> b!245487 m!370193))

(declare-fun m!370195 () Bool)

(assert (=> b!245487 m!370195))

(declare-fun m!370197 () Bool)

(assert (=> b!245487 m!370197))

(declare-fun m!370199 () Bool)

(assert (=> b!245480 m!370199))

(declare-fun m!370201 () Bool)

(assert (=> b!245495 m!370201))

(declare-fun m!370203 () Bool)

(assert (=> b!245495 m!370203))

(declare-fun m!370205 () Bool)

(assert (=> b!245495 m!370205))

(declare-fun m!370207 () Bool)

(assert (=> b!245495 m!370207))

(declare-fun m!370209 () Bool)

(assert (=> b!245495 m!370209))

(declare-fun m!370211 () Bool)

(assert (=> b!245495 m!370211))

(declare-fun m!370213 () Bool)

(assert (=> b!245495 m!370213))

(declare-fun m!370215 () Bool)

(assert (=> b!245495 m!370215))

(declare-fun m!370217 () Bool)

(assert (=> b!245495 m!370217))

(declare-fun m!370219 () Bool)

(assert (=> b!245495 m!370219))

(declare-fun m!370221 () Bool)

(assert (=> b!245495 m!370221))

(declare-fun m!370223 () Bool)

(assert (=> b!245495 m!370223))

(declare-fun m!370225 () Bool)

(assert (=> b!245495 m!370225))

(declare-fun m!370227 () Bool)

(assert (=> b!245495 m!370227))

(declare-fun m!370229 () Bool)

(assert (=> b!245495 m!370229))

(declare-fun m!370231 () Bool)

(assert (=> b!245495 m!370231))

(declare-fun m!370233 () Bool)

(assert (=> b!245495 m!370233))

(assert (=> b!245495 m!370197))

(declare-fun m!370235 () Bool)

(assert (=> b!245495 m!370235))

(declare-fun m!370237 () Bool)

(assert (=> b!245495 m!370237))

(declare-fun m!370239 () Bool)

(assert (=> b!245483 m!370239))

(declare-fun m!370241 () Bool)

(assert (=> b!245492 m!370241))

(declare-fun m!370243 () Bool)

(assert (=> b!245488 m!370243))

(declare-fun m!370245 () Bool)

(assert (=> b!245494 m!370245))

(push 1)

(assert (not start!52986))

(assert (not b!245492))

(assert (not b!245479))

(assert (not b!245484))

(assert (not b!245487))

(assert (not b!245490))

(assert (not b!245494))

(assert (not b!245495))

(assert (not b!245488))

(assert (not b!245489))

(assert (not b!245481))

(assert (not b!245493))

(assert (not b!245483))

(assert (not b!245485))

(assert (not b!245480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82478 () Bool)

(declare-fun e!170176 () Bool)

(assert (=> d!82478 e!170176))

(declare-fun res!205399 () Bool)

(assert (=> d!82478 (=> (not res!205399) (not e!170176))))

(declare-fun lt!383229 () (_ BitVec 64))

(declare-fun lt!383225 () (_ BitVec 64))

(declare-fun lt!383230 () (_ BitVec 64))

(assert (=> d!82478 (= res!205399 (= lt!383225 (bvsub lt!383230 lt!383229)))))

(assert (=> d!82478 (or (= (bvand lt!383230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383230 lt!383229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82478 (= lt!383229 (remainingBits!0 ((_ sign_extend 32) (size!5880 (buf!6358 (_1!11450 lt!382870)))) ((_ sign_extend 32) (currentByte!11748 (_1!11450 lt!382870))) ((_ sign_extend 32) (currentBit!11743 (_1!11450 lt!382870)))))))

(declare-fun lt!383227 () (_ BitVec 64))

(declare-fun lt!383226 () (_ BitVec 64))

(assert (=> d!82478 (= lt!383230 (bvmul lt!383227 lt!383226))))

(assert (=> d!82478 (or (= lt!383227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383226 (bvsdiv (bvmul lt!383227 lt!383226) lt!383227)))))

(assert (=> d!82478 (= lt!383226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82478 (= lt!383227 ((_ sign_extend 32) (size!5880 (buf!6358 (_1!11450 lt!382870)))))))

(assert (=> d!82478 (= lt!383225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11748 (_1!11450 lt!382870))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11743 (_1!11450 lt!382870)))))))

(assert (=> d!82478 (invariant!0 (currentBit!11743 (_1!11450 lt!382870)) (currentByte!11748 (_1!11450 lt!382870)) (size!5880 (buf!6358 (_1!11450 lt!382870))))))

(assert (=> d!82478 (= (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!382870))) (currentByte!11748 (_1!11450 lt!382870)) (currentBit!11743 (_1!11450 lt!382870))) lt!383225)))

(declare-fun b!245632 () Bool)

(declare-fun res!205398 () Bool)

(assert (=> b!245632 (=> (not res!205398) (not e!170176))))

(assert (=> b!245632 (= res!205398 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383225))))

(declare-fun b!245633 () Bool)

(declare-fun lt!383228 () (_ BitVec 64))

(assert (=> b!245633 (= e!170176 (bvsle lt!383225 (bvmul lt!383228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245633 (or (= lt!383228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383228)))))

(assert (=> b!245633 (= lt!383228 ((_ sign_extend 32) (size!5880 (buf!6358 (_1!11450 lt!382870)))))))

(assert (= (and d!82478 res!205399) b!245632))

(assert (= (and b!245632 res!205398) b!245633))

(declare-fun m!370485 () Bool)

(assert (=> d!82478 m!370485))

(declare-fun m!370487 () Bool)

(assert (=> d!82478 m!370487))

(assert (=> b!245494 d!82478))

(declare-fun d!82480 () Bool)

(assert (=> d!82480 (= (array_inv!5621 (buf!6358 thiss!1005)) (bvsge (size!5880 (buf!6358 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!245483 d!82480))

(declare-fun d!82482 () Bool)

(assert (=> d!82482 (= (invariant!0 (currentBit!11743 (_2!11449 lt!382863)) (currentByte!11748 (_2!11449 lt!382863)) (size!5880 (buf!6358 (_2!11449 lt!382863)))) (and (bvsge (currentBit!11743 (_2!11449 lt!382863)) #b00000000000000000000000000000000) (bvslt (currentBit!11743 (_2!11449 lt!382863)) #b00000000000000000000000000001000) (bvsge (currentByte!11748 (_2!11449 lt!382863)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11748 (_2!11449 lt!382863)) (size!5880 (buf!6358 (_2!11449 lt!382863)))) (and (= (currentBit!11743 (_2!11449 lt!382863)) #b00000000000000000000000000000000) (= (currentByte!11748 (_2!11449 lt!382863)) (size!5880 (buf!6358 (_2!11449 lt!382863))))))))))

(assert (=> b!245484 d!82482))

(declare-fun d!82484 () Bool)

(assert (=> d!82484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!382873) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866)))) lt!382873))))

(declare-fun bs!20866 () Bool)

(assert (= bs!20866 d!82484))

(declare-fun m!370489 () Bool)

(assert (=> bs!20866 m!370489))

(assert (=> b!245495 d!82484))

(declare-fun d!82486 () Bool)

(declare-fun e!170177 () Bool)

(assert (=> d!82486 e!170177))

(declare-fun res!205401 () Bool)

(assert (=> d!82486 (=> (not res!205401) (not e!170177))))

(declare-fun lt!383236 () (_ BitVec 64))

(declare-fun lt!383235 () (_ BitVec 64))

(declare-fun lt!383231 () (_ BitVec 64))

(assert (=> d!82486 (= res!205401 (= lt!383231 (bvsub lt!383236 lt!383235)))))

(assert (=> d!82486 (or (= (bvand lt!383236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383236 lt!383235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82486 (= lt!383235 (remainingBits!0 ((_ sign_extend 32) (size!5880 (buf!6358 (_1!11450 lt!382882)))) ((_ sign_extend 32) (currentByte!11748 (_1!11450 lt!382882))) ((_ sign_extend 32) (currentBit!11743 (_1!11450 lt!382882)))))))

(declare-fun lt!383233 () (_ BitVec 64))

(declare-fun lt!383232 () (_ BitVec 64))

(assert (=> d!82486 (= lt!383236 (bvmul lt!383233 lt!383232))))

(assert (=> d!82486 (or (= lt!383233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!383232 (bvsdiv (bvmul lt!383233 lt!383232) lt!383233)))))

(assert (=> d!82486 (= lt!383232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82486 (= lt!383233 ((_ sign_extend 32) (size!5880 (buf!6358 (_1!11450 lt!382882)))))))

(assert (=> d!82486 (= lt!383231 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11748 (_1!11450 lt!382882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11743 (_1!11450 lt!382882)))))))

(assert (=> d!82486 (invariant!0 (currentBit!11743 (_1!11450 lt!382882)) (currentByte!11748 (_1!11450 lt!382882)) (size!5880 (buf!6358 (_1!11450 lt!382882))))))

(assert (=> d!82486 (= (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!382882))) (currentByte!11748 (_1!11450 lt!382882)) (currentBit!11743 (_1!11450 lt!382882))) lt!383231)))

(declare-fun b!245634 () Bool)

(declare-fun res!205400 () Bool)

(assert (=> b!245634 (=> (not res!205400) (not e!170177))))

(assert (=> b!245634 (= res!205400 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!383231))))

(declare-fun b!245635 () Bool)

(declare-fun lt!383234 () (_ BitVec 64))

(assert (=> b!245635 (= e!170177 (bvsle lt!383231 (bvmul lt!383234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245635 (or (= lt!383234 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!383234 #b0000000000000000000000000000000000000000000000000000000000001000) lt!383234)))))

(assert (=> b!245635 (= lt!383234 ((_ sign_extend 32) (size!5880 (buf!6358 (_1!11450 lt!382882)))))))

(assert (= (and d!82486 res!205401) b!245634))

(assert (= (and b!245634 res!205400) b!245635))

(declare-fun m!370491 () Bool)

(assert (=> d!82486 m!370491))

(declare-fun m!370493 () Bool)

(assert (=> d!82486 m!370493))

(assert (=> b!245495 d!82486))

(declare-datatypes ((tuple2!21064 0))(
  ( (tuple2!21065 (_1!11454 Bool) (_2!11454 BitStream!10682)) )
))
(declare-fun lt!383239 () tuple2!21064)

(declare-fun d!82488 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10682 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21064)

(assert (=> d!82488 (= lt!383239 (checkBitsLoop!0 (_1!11451 lt!382881) nBits!297 bit!26 from!289))))

(assert (=> d!82488 (= (checkBitsLoopPure!0 (_1!11451 lt!382881) nBits!297 bit!26 from!289) (tuple2!21057 (_2!11454 lt!383239) (_1!11454 lt!383239)))))

(declare-fun bs!20867 () Bool)

(assert (= bs!20867 d!82488))

(declare-fun m!370495 () Bool)

(assert (=> bs!20867 m!370495))

(assert (=> b!245495 d!82488))

(declare-fun b!245663 () Bool)

(declare-fun e!170192 () Bool)

(declare-fun lt!383280 () tuple2!21056)

(declare-fun lt!383281 () tuple2!21054)

(assert (=> b!245663 (= e!170192 (= (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!383280))) (currentByte!11748 (_1!11450 lt!383280)) (currentBit!11743 (_1!11450 lt!383280))) (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!383281))) (currentByte!11748 (_2!11449 lt!383281)) (currentBit!11743 (_2!11449 lt!383281)))))))

(declare-fun b!245661 () Bool)

(declare-fun res!205426 () Bool)

(declare-fun e!170191 () Bool)

(assert (=> b!245661 (=> (not res!205426) (not e!170191))))

(assert (=> b!245661 (= res!205426 (isPrefixOf!0 thiss!1005 (_2!11449 lt!383281)))))

(declare-fun b!245662 () Bool)

(assert (=> b!245662 (= e!170191 e!170192)))

(declare-fun res!205427 () Bool)

(assert (=> b!245662 (=> (not res!205427) (not e!170192))))

(assert (=> b!245662 (= res!205427 (and (= (_2!11450 lt!383280) bit!26) (= (_1!11450 lt!383280) (_2!11449 lt!383281))))))

(assert (=> b!245662 (= lt!383280 (readBitPure!0 (readerFrom!0 (_2!11449 lt!383281) (currentBit!11743 thiss!1005) (currentByte!11748 thiss!1005))))))

(declare-fun b!245660 () Bool)

(declare-fun res!205428 () Bool)

(assert (=> b!245660 (=> (not res!205428) (not e!170191))))

(declare-fun lt!383278 () (_ BitVec 64))

(declare-fun lt!383279 () (_ BitVec 64))

(assert (=> b!245660 (= res!205428 (= (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!383281))) (currentByte!11748 (_2!11449 lt!383281)) (currentBit!11743 (_2!11449 lt!383281))) (bvadd lt!383278 lt!383279)))))

(assert (=> b!245660 (or (not (= (bvand lt!383278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383279 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383278 lt!383279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245660 (= lt!383279 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!245660 (= lt!383278 (bitIndex!0 (size!5880 (buf!6358 thiss!1005)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)))))

(declare-fun d!82490 () Bool)

(assert (=> d!82490 e!170191))

(declare-fun res!205425 () Bool)

(assert (=> d!82490 (=> (not res!205425) (not e!170191))))

(assert (=> d!82490 (= res!205425 (= (size!5880 (buf!6358 thiss!1005)) (size!5880 (buf!6358 (_2!11449 lt!383281)))))))

(declare-fun choose!16 (BitStream!10682 Bool) tuple2!21054)

(assert (=> d!82490 (= lt!383281 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82490 (validate_offset_bit!0 ((_ sign_extend 32) (size!5880 (buf!6358 thiss!1005))) ((_ sign_extend 32) (currentByte!11748 thiss!1005)) ((_ sign_extend 32) (currentBit!11743 thiss!1005)))))

(assert (=> d!82490 (= (appendBit!0 thiss!1005 bit!26) lt!383281)))

(assert (= (and d!82490 res!205425) b!245660))

(assert (= (and b!245660 res!205428) b!245661))

(assert (= (and b!245661 res!205426) b!245662))

(assert (= (and b!245662 res!205427) b!245663))

(declare-fun m!370519 () Bool)

(assert (=> b!245660 m!370519))

(assert (=> b!245660 m!370173))

(declare-fun m!370521 () Bool)

(assert (=> b!245662 m!370521))

(assert (=> b!245662 m!370521))

(declare-fun m!370523 () Bool)

(assert (=> b!245662 m!370523))

(declare-fun m!370525 () Bool)

(assert (=> b!245663 m!370525))

(assert (=> b!245663 m!370519))

(declare-fun m!370527 () Bool)

(assert (=> b!245661 m!370527))

(declare-fun m!370529 () Bool)

(assert (=> d!82490 m!370529))

(declare-fun m!370531 () Bool)

(assert (=> d!82490 m!370531))

(assert (=> b!245495 d!82490))

(declare-fun d!82498 () Bool)

(declare-fun res!205435 () Bool)

(declare-fun e!170197 () Bool)

(assert (=> d!82498 (=> (not res!205435) (not e!170197))))

(assert (=> d!82498 (= res!205435 (= (size!5880 (buf!6358 thiss!1005)) (size!5880 (buf!6358 (_2!11449 lt!382863)))))))

(assert (=> d!82498 (= (isPrefixOf!0 thiss!1005 (_2!11449 lt!382863)) e!170197)))

(declare-fun b!245670 () Bool)

(declare-fun res!205437 () Bool)

(assert (=> b!245670 (=> (not res!205437) (not e!170197))))

(assert (=> b!245670 (= res!205437 (bvsle (bitIndex!0 (size!5880 (buf!6358 thiss!1005)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)) (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!382863))) (currentByte!11748 (_2!11449 lt!382863)) (currentBit!11743 (_2!11449 lt!382863)))))))

(declare-fun b!245671 () Bool)

(declare-fun e!170198 () Bool)

(assert (=> b!245671 (= e!170197 e!170198)))

(declare-fun res!205436 () Bool)

(assert (=> b!245671 (=> res!205436 e!170198)))

(assert (=> b!245671 (= res!205436 (= (size!5880 (buf!6358 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245672 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13413 array!13413 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245672 (= e!170198 (arrayBitRangesEq!0 (buf!6358 thiss!1005) (buf!6358 (_2!11449 lt!382863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5880 (buf!6358 thiss!1005)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005))))))

(assert (= (and d!82498 res!205435) b!245670))

(assert (= (and b!245670 res!205437) b!245671))

(assert (= (and b!245671 (not res!205436)) b!245672))

(assert (=> b!245670 m!370173))

(assert (=> b!245670 m!370183))

(assert (=> b!245672 m!370173))

(assert (=> b!245672 m!370173))

(declare-fun m!370533 () Bool)

(assert (=> b!245672 m!370533))

(assert (=> b!245495 d!82498))

(declare-fun d!82500 () Bool)

(declare-fun e!170207 () Bool)

(assert (=> d!82500 e!170207))

(declare-fun res!205452 () Bool)

(assert (=> d!82500 (=> (not res!205452) (not e!170207))))

(declare-fun lt!383305 () tuple2!21056)

(declare-fun lt!383303 () tuple2!21056)

(assert (=> d!82500 (= res!205452 (= (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!383305))) (currentByte!11748 (_1!11450 lt!383305)) (currentBit!11743 (_1!11450 lt!383305))) (bitIndex!0 (size!5880 (buf!6358 (_1!11450 lt!383303))) (currentByte!11748 (_1!11450 lt!383303)) (currentBit!11743 (_1!11450 lt!383303)))))))

(declare-fun lt!383306 () BitStream!10682)

(declare-fun lt!383304 () Unit!17867)

(declare-fun choose!50 (BitStream!10682 BitStream!10682 BitStream!10682 tuple2!21056 tuple2!21056 BitStream!10682 Bool tuple2!21056 tuple2!21056 BitStream!10682 Bool) Unit!17867)

(assert (=> d!82500 (= lt!383304 (choose!50 lt!382871 (_2!11449 lt!382863) lt!383306 lt!383305 (tuple2!21057 (_1!11450 lt!383305) (_2!11450 lt!383305)) (_1!11450 lt!383305) (_2!11450 lt!383305) lt!383303 (tuple2!21057 (_1!11450 lt!383303) (_2!11450 lt!383303)) (_1!11450 lt!383303) (_2!11450 lt!383303)))))

(assert (=> d!82500 (= lt!383303 (readBitPure!0 lt!383306))))

(assert (=> d!82500 (= lt!383305 (readBitPure!0 lt!382871))))

(assert (=> d!82500 (= lt!383306 (BitStream!10683 (buf!6358 (_2!11449 lt!382863)) (currentByte!11748 lt!382871) (currentBit!11743 lt!382871)))))

(assert (=> d!82500 (invariant!0 (currentBit!11743 lt!382871) (currentByte!11748 lt!382871) (size!5880 (buf!6358 (_2!11449 lt!382863))))))

(assert (=> d!82500 (= (readBitPrefixLemma!0 lt!382871 (_2!11449 lt!382863)) lt!383304)))

(declare-fun b!245688 () Bool)

(assert (=> b!245688 (= e!170207 (= (_2!11450 lt!383305) (_2!11450 lt!383303)))))

(assert (= (and d!82500 res!205452) b!245688))

(declare-fun m!370553 () Bool)

(assert (=> d!82500 m!370553))

(assert (=> d!82500 m!370233))

(declare-fun m!370555 () Bool)

(assert (=> d!82500 m!370555))

(declare-fun m!370557 () Bool)

(assert (=> d!82500 m!370557))

(declare-fun m!370559 () Bool)

(assert (=> d!82500 m!370559))

(declare-fun m!370561 () Bool)

(assert (=> d!82500 m!370561))

(assert (=> b!245495 d!82500))

(declare-fun d!82508 () Bool)

(assert (=> d!82508 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382866)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!382873) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382866)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866)))) lt!382873))))

(declare-fun bs!20871 () Bool)

(assert (= bs!20871 d!82508))

(declare-fun m!370563 () Bool)

(assert (=> bs!20871 m!370563))

(assert (=> b!245495 d!82508))

(declare-fun d!82510 () Bool)

(declare-fun lt!383331 () tuple2!21064)

(declare-fun readBit!0 (BitStream!10682) tuple2!21064)

(assert (=> d!82510 (= lt!383331 (readBit!0 (_1!11451 lt!382881)))))

(assert (=> d!82510 (= (readBitPure!0 (_1!11451 lt!382881)) (tuple2!21057 (_2!11454 lt!383331) (_1!11454 lt!383331)))))

(declare-fun bs!20873 () Bool)

(assert (= bs!20873 d!82510))

(declare-fun m!370593 () Bool)

(assert (=> bs!20873 m!370593))

(assert (=> b!245495 d!82510))

(declare-fun b!245714 () Bool)

(declare-fun res!205479 () Bool)

(declare-fun e!170223 () Bool)

(assert (=> b!245714 (=> (not res!205479) (not e!170223))))

(declare-fun lt!383366 () tuple2!21054)

(assert (=> b!245714 (= res!205479 (isPrefixOf!0 (_2!11449 lt!382866) (_2!11449 lt!383366)))))

(declare-fun b!245713 () Bool)

(declare-fun res!205478 () Bool)

(assert (=> b!245713 (=> (not res!205478) (not e!170223))))

(declare-fun lt!383365 () (_ BitVec 64))

(declare-fun lt!383363 () (_ BitVec 64))

(assert (=> b!245713 (= res!205478 (= (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!383366))) (currentByte!11748 (_2!11449 lt!383366)) (currentBit!11743 (_2!11449 lt!383366))) (bvadd lt!383363 lt!383365)))))

(assert (=> b!245713 (or (not (= (bvand lt!383363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383365 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!383363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!383363 lt!383365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245713 (= lt!383365 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245713 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245713 (= lt!383363 (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!382866))) (currentByte!11748 (_2!11449 lt!382866)) (currentBit!11743 (_2!11449 lt!382866))))))

(declare-fun b!245715 () Bool)

(declare-fun lt!383370 () tuple2!21056)

(declare-fun lt!383368 () tuple2!21058)

(assert (=> b!245715 (= e!170223 (and (_2!11450 lt!383370) (= (_1!11450 lt!383370) (_2!11451 lt!383368))))))

(assert (=> b!245715 (= lt!383370 (checkBitsLoopPure!0 (_1!11451 lt!383368) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383369 () Unit!17867)

(declare-fun lt!383364 () Unit!17867)

(assert (=> b!245715 (= lt!383369 lt!383364)))

(declare-fun lt!383367 () (_ BitVec 64))

(assert (=> b!245715 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!383366)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!383367)))

(assert (=> b!245715 (= lt!383364 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11449 lt!382866) (buf!6358 (_2!11449 lt!383366)) lt!383367))))

(declare-fun e!170224 () Bool)

(assert (=> b!245715 e!170224))

(declare-fun res!205476 () Bool)

(assert (=> b!245715 (=> (not res!205476) (not e!170224))))

(assert (=> b!245715 (= res!205476 (and (= (size!5880 (buf!6358 (_2!11449 lt!382866))) (size!5880 (buf!6358 (_2!11449 lt!383366)))) (bvsge lt!383367 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245715 (= lt!383367 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245715 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245715 (= lt!383368 (reader!0 (_2!11449 lt!382866) (_2!11449 lt!383366)))))

(declare-fun d!82516 () Bool)

(assert (=> d!82516 e!170223))

(declare-fun res!205477 () Bool)

(assert (=> d!82516 (=> (not res!205477) (not e!170223))))

(assert (=> d!82516 (= res!205477 (= (size!5880 (buf!6358 (_2!11449 lt!382866))) (size!5880 (buf!6358 (_2!11449 lt!383366)))))))

(declare-fun choose!51 (BitStream!10682 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21054)

(assert (=> d!82516 (= lt!383366 (choose!51 (_2!11449 lt!382866) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82516 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82516 (= (appendNBitsLoop!0 (_2!11449 lt!382866) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!383366)))

(declare-fun b!245716 () Bool)

(assert (=> b!245716 (= e!170224 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382866)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) lt!383367))))

(assert (= (and d!82516 res!205477) b!245713))

(assert (= (and b!245713 res!205478) b!245714))

(assert (= (and b!245714 res!205479) b!245715))

(assert (= (and b!245715 res!205476) b!245716))

(declare-fun m!370613 () Bool)

(assert (=> b!245714 m!370613))

(declare-fun m!370615 () Bool)

(assert (=> b!245716 m!370615))

(declare-fun m!370617 () Bool)

(assert (=> b!245715 m!370617))

(declare-fun m!370619 () Bool)

(assert (=> b!245715 m!370619))

(declare-fun m!370621 () Bool)

(assert (=> b!245715 m!370621))

(declare-fun m!370623 () Bool)

(assert (=> b!245715 m!370623))

(declare-fun m!370625 () Bool)

(assert (=> b!245713 m!370625))

(assert (=> b!245713 m!370171))

(declare-fun m!370627 () Bool)

(assert (=> d!82516 m!370627))

(assert (=> b!245495 d!82516))

(declare-fun lt!383371 () tuple2!21064)

(declare-fun d!82542 () Bool)

(assert (=> d!82542 (= lt!383371 (checkBitsLoop!0 (_1!11451 lt!382864) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82542 (= (checkBitsLoopPure!0 (_1!11451 lt!382864) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21057 (_2!11454 lt!383371) (_1!11454 lt!383371)))))

(declare-fun bs!20879 () Bool)

(assert (= bs!20879 d!82542))

(declare-fun m!370629 () Bool)

(assert (=> bs!20879 m!370629))

(assert (=> b!245495 d!82542))

(declare-fun d!82544 () Bool)

(assert (=> d!82544 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 thiss!1005)) ((_ sign_extend 32) (currentBit!11743 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383374 () Unit!17867)

(declare-fun choose!9 (BitStream!10682 array!13413 (_ BitVec 64) BitStream!10682) Unit!17867)

(assert (=> d!82544 (= lt!383374 (choose!9 thiss!1005 (buf!6358 (_2!11449 lt!382863)) (bvsub nBits!297 from!289) (BitStream!10683 (buf!6358 (_2!11449 lt!382863)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005))))))

(assert (=> d!82544 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6358 (_2!11449 lt!382863)) (bvsub nBits!297 from!289)) lt!383374)))

(declare-fun bs!20880 () Bool)

(assert (= bs!20880 d!82544))

(assert (=> bs!20880 m!370203))

(declare-fun m!370631 () Bool)

(assert (=> bs!20880 m!370631))

(assert (=> b!245495 d!82544))

(declare-fun d!82546 () Bool)

(declare-fun lt!383375 () tuple2!21064)

(assert (=> d!82546 (= lt!383375 (readBit!0 lt!382871))))

(assert (=> d!82546 (= (readBitPure!0 lt!382871) (tuple2!21057 (_2!11454 lt!383375) (_1!11454 lt!383375)))))

(declare-fun bs!20881 () Bool)

(assert (= bs!20881 d!82546))

(declare-fun m!370633 () Bool)

(assert (=> bs!20881 m!370633))

(assert (=> b!245495 d!82546))

(declare-fun d!82548 () Bool)

(declare-fun e!170227 () Bool)

(assert (=> d!82548 e!170227))

(declare-fun res!205482 () Bool)

(assert (=> d!82548 (=> (not res!205482) (not e!170227))))

(assert (=> d!82548 (= res!205482 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!383378 () Unit!17867)

(declare-fun choose!27 (BitStream!10682 BitStream!10682 (_ BitVec 64) (_ BitVec 64)) Unit!17867)

(assert (=> d!82548 (= lt!383378 (choose!27 thiss!1005 (_2!11449 lt!382866) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82548 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11449 lt!382866) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!383378)))

(declare-fun b!245719 () Bool)

(assert (=> b!245719 (= e!170227 (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382866)))) ((_ sign_extend 32) (currentByte!11748 (_2!11449 lt!382866))) ((_ sign_extend 32) (currentBit!11743 (_2!11449 lt!382866))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82548 res!205482) b!245719))

(declare-fun m!370635 () Bool)

(assert (=> d!82548 m!370635))

(declare-fun m!370637 () Bool)

(assert (=> b!245719 m!370637))

(assert (=> b!245495 d!82548))

(declare-fun b!245730 () Bool)

(declare-fun lt!383429 () (_ BitVec 64))

(declare-fun lt!383436 () tuple2!21058)

(declare-fun lt!383421 () (_ BitVec 64))

(declare-fun e!170232 () Bool)

(assert (=> b!245730 (= e!170232 (= (_1!11451 lt!383436) (withMovedBitIndex!0 (_2!11451 lt!383436) (bvsub lt!383421 lt!383429))))))

(assert (=> b!245730 (or (= (bvand lt!383421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!383429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!383421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!383421 lt!383429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245730 (= lt!383429 (bitIndex!0 (size!5880 (buf!6358 (_2!11449 lt!382863))) (currentByte!11748 (_2!11449 lt!382863)) (currentBit!11743 (_2!11449 lt!382863))))))

(assert (=> b!245730 (= lt!383421 (bitIndex!0 (size!5880 (buf!6358 thiss!1005)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)))))

(declare-fun b!245731 () Bool)

(declare-fun e!170233 () Unit!17867)

(declare-fun lt!383427 () Unit!17867)

(assert (=> b!245731 (= e!170233 lt!383427)))

(declare-fun lt!383419 () (_ BitVec 64))

(assert (=> b!245731 (= lt!383419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!383423 () (_ BitVec 64))

(assert (=> b!245731 (= lt!383423 (bitIndex!0 (size!5880 (buf!6358 thiss!1005)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13413 array!13413 (_ BitVec 64) (_ BitVec 64)) Unit!17867)

(assert (=> b!245731 (= lt!383427 (arrayBitRangesEqSymmetric!0 (buf!6358 thiss!1005) (buf!6358 (_2!11449 lt!382863)) lt!383419 lt!383423))))

(assert (=> b!245731 (arrayBitRangesEq!0 (buf!6358 (_2!11449 lt!382863)) (buf!6358 thiss!1005) lt!383419 lt!383423)))

(declare-fun b!245732 () Bool)

(declare-fun res!205491 () Bool)

(assert (=> b!245732 (=> (not res!205491) (not e!170232))))

(assert (=> b!245732 (= res!205491 (isPrefixOf!0 (_1!11451 lt!383436) thiss!1005))))

(declare-fun b!245733 () Bool)

(declare-fun Unit!17873 () Unit!17867)

(assert (=> b!245733 (= e!170233 Unit!17873)))

(declare-fun b!245734 () Bool)

(declare-fun res!205490 () Bool)

(assert (=> b!245734 (=> (not res!205490) (not e!170232))))

(assert (=> b!245734 (= res!205490 (isPrefixOf!0 (_2!11451 lt!383436) (_2!11449 lt!382863)))))

(declare-fun d!82550 () Bool)

(assert (=> d!82550 e!170232))

(declare-fun res!205489 () Bool)

(assert (=> d!82550 (=> (not res!205489) (not e!170232))))

(assert (=> d!82550 (= res!205489 (isPrefixOf!0 (_1!11451 lt!383436) (_2!11451 lt!383436)))))

(declare-fun lt!383437 () BitStream!10682)

(assert (=> d!82550 (= lt!383436 (tuple2!21059 lt!383437 (_2!11449 lt!382863)))))

(declare-fun lt!383420 () Unit!17867)

(declare-fun lt!383432 () Unit!17867)

(assert (=> d!82550 (= lt!383420 lt!383432)))

(assert (=> d!82550 (isPrefixOf!0 lt!383437 (_2!11449 lt!382863))))

(assert (=> d!82550 (= lt!383432 (lemmaIsPrefixTransitive!0 lt!383437 (_2!11449 lt!382863) (_2!11449 lt!382863)))))

(declare-fun lt!383431 () Unit!17867)

(declare-fun lt!383435 () Unit!17867)

(assert (=> d!82550 (= lt!383431 lt!383435)))

(assert (=> d!82550 (isPrefixOf!0 lt!383437 (_2!11449 lt!382863))))

(assert (=> d!82550 (= lt!383435 (lemmaIsPrefixTransitive!0 lt!383437 thiss!1005 (_2!11449 lt!382863)))))

(declare-fun lt!383422 () Unit!17867)

(assert (=> d!82550 (= lt!383422 e!170233)))

(declare-fun c!11499 () Bool)

(assert (=> d!82550 (= c!11499 (not (= (size!5880 (buf!6358 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!383426 () Unit!17867)

(declare-fun lt!383425 () Unit!17867)

(assert (=> d!82550 (= lt!383426 lt!383425)))

(assert (=> d!82550 (isPrefixOf!0 (_2!11449 lt!382863) (_2!11449 lt!382863))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10682) Unit!17867)

(assert (=> d!82550 (= lt!383425 (lemmaIsPrefixRefl!0 (_2!11449 lt!382863)))))

(declare-fun lt!383430 () Unit!17867)

(declare-fun lt!383428 () Unit!17867)

(assert (=> d!82550 (= lt!383430 lt!383428)))

(assert (=> d!82550 (= lt!383428 (lemmaIsPrefixRefl!0 (_2!11449 lt!382863)))))

(declare-fun lt!383434 () Unit!17867)

(declare-fun lt!383424 () Unit!17867)

(assert (=> d!82550 (= lt!383434 lt!383424)))

(assert (=> d!82550 (isPrefixOf!0 lt!383437 lt!383437)))

(assert (=> d!82550 (= lt!383424 (lemmaIsPrefixRefl!0 lt!383437))))

(declare-fun lt!383433 () Unit!17867)

(declare-fun lt!383438 () Unit!17867)

(assert (=> d!82550 (= lt!383433 lt!383438)))

(assert (=> d!82550 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82550 (= lt!383438 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82550 (= lt!383437 (BitStream!10683 (buf!6358 (_2!11449 lt!382863)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005)))))

(assert (=> d!82550 (isPrefixOf!0 thiss!1005 (_2!11449 lt!382863))))

(assert (=> d!82550 (= (reader!0 thiss!1005 (_2!11449 lt!382863)) lt!383436)))

(assert (= (and d!82550 c!11499) b!245731))

(assert (= (and d!82550 (not c!11499)) b!245733))

(assert (= (and d!82550 res!205489) b!245732))

(assert (= (and b!245732 res!205491) b!245734))

(assert (= (and b!245734 res!205490) b!245730))

(declare-fun m!370639 () Bool)

(assert (=> d!82550 m!370639))

(declare-fun m!370641 () Bool)

(assert (=> d!82550 m!370641))

(declare-fun m!370643 () Bool)

(assert (=> d!82550 m!370643))

(declare-fun m!370645 () Bool)

(assert (=> d!82550 m!370645))

(declare-fun m!370647 () Bool)

(assert (=> d!82550 m!370647))

(declare-fun m!370649 () Bool)

(assert (=> d!82550 m!370649))

(declare-fun m!370651 () Bool)

(assert (=> d!82550 m!370651))

(declare-fun m!370653 () Bool)

(assert (=> d!82550 m!370653))

(declare-fun m!370655 () Bool)

(assert (=> d!82550 m!370655))

(declare-fun m!370657 () Bool)

(assert (=> d!82550 m!370657))

(assert (=> d!82550 m!370211))

(declare-fun m!370659 () Bool)

(assert (=> b!245732 m!370659))

(declare-fun m!370661 () Bool)

(assert (=> b!245730 m!370661))

(assert (=> b!245730 m!370183))

(assert (=> b!245730 m!370173))

(assert (=> b!245731 m!370173))

(declare-fun m!370663 () Bool)

(assert (=> b!245731 m!370663))

(declare-fun m!370665 () Bool)

(assert (=> b!245731 m!370665))

(declare-fun m!370667 () Bool)

(assert (=> b!245734 m!370667))

(assert (=> b!245495 d!82550))

(declare-fun d!82552 () Bool)

(assert (=> d!82552 (isPrefixOf!0 thiss!1005 (_2!11449 lt!382863))))

(declare-fun lt!383441 () Unit!17867)

(declare-fun choose!30 (BitStream!10682 BitStream!10682 BitStream!10682) Unit!17867)

(assert (=> d!82552 (= lt!383441 (choose!30 thiss!1005 (_2!11449 lt!382866) (_2!11449 lt!382863)))))

(assert (=> d!82552 (isPrefixOf!0 thiss!1005 (_2!11449 lt!382866))))

(assert (=> d!82552 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11449 lt!382866) (_2!11449 lt!382863)) lt!383441)))

(declare-fun bs!20882 () Bool)

(assert (= bs!20882 d!82552))

(assert (=> bs!20882 m!370211))

(declare-fun m!370669 () Bool)

(assert (=> bs!20882 m!370669))

(assert (=> bs!20882 m!370199))

(assert (=> b!245495 d!82552))

(declare-fun d!82554 () Bool)

(assert (=> d!82554 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 thiss!1005)) ((_ sign_extend 32) (currentBit!11743 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5880 (buf!6358 (_2!11449 lt!382863)))) ((_ sign_extend 32) (currentByte!11748 thiss!1005)) ((_ sign_extend 32) (currentBit!11743 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20883 () Bool)

(assert (= bs!20883 d!82554))

(declare-fun m!370671 () Bool)

(assert (=> bs!20883 m!370671))

(assert (=> b!245495 d!82554))

(declare-fun d!82556 () Bool)

(declare-fun lt!383442 () tuple2!21064)

(assert (=> d!82556 (= lt!383442 (readBit!0 (BitStream!10683 (buf!6358 (_2!11449 lt!382863)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005))))))

(assert (=> d!82556 (= (readBitPure!0 (BitStream!10683 (buf!6358 (_2!11449 lt!382863)) (currentByte!11748 thiss!1005) (currentBit!11743 thiss!1005))) (tuple2!21057 (_2!11454 lt!383442) (_1!11454 lt!383442)))))

(declare-fun bs!20884 () Bool)

(assert (= bs!20884 d!82556))

(declare-fun m!370673 () Bool)

