; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53130 () Bool)

(assert start!53130)

(declare-fun b!246814 () Bool)

(declare-fun e!171002 () Bool)

(assert (=> b!246814 (= e!171002 true)))

(declare-fun lt!384990 () (_ BitVec 64))

(declare-datatypes ((array!13458 0))(
  ( (array!13459 (arr!6888 (Array (_ BitVec 32) (_ BitVec 8))) (size!5901 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10724 0))(
  ( (BitStream!10725 (buf!6382 array!13458) (currentByte!11778 (_ BitVec 32)) (currentBit!11773 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17914 0))(
  ( (Unit!17915) )
))
(declare-datatypes ((tuple2!21186 0))(
  ( (tuple2!21187 (_1!11515 Unit!17914) (_2!11515 BitStream!10724)) )
))
(declare-fun lt!384967 () tuple2!21186)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246814 (= lt!384990 (bitIndex!0 (size!5901 (buf!6382 (_2!11515 lt!384967))) (currentByte!11778 (_2!11515 lt!384967)) (currentBit!11773 (_2!11515 lt!384967))))))

(declare-fun lt!384972 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10724)

(assert (=> b!246814 (= lt!384972 (bitIndex!0 (size!5901 (buf!6382 thiss!1005)) (currentByte!11778 thiss!1005) (currentBit!11773 thiss!1005)))))

(declare-fun b!246815 () Bool)

(declare-fun e!171001 () Bool)

(assert (=> b!246815 (= e!171001 e!171002)))

(declare-fun res!206512 () Bool)

(assert (=> b!246815 (=> res!206512 e!171002)))

(assert (=> b!246815 (= res!206512 (not (= (size!5901 (buf!6382 thiss!1005)) (size!5901 (buf!6382 (_2!11515 lt!384967))))))))

(declare-datatypes ((tuple2!21188 0))(
  ( (tuple2!21189 (_1!11516 BitStream!10724) (_2!11516 Bool)) )
))
(declare-fun lt!384989 () tuple2!21188)

(declare-fun lt!384973 () tuple2!21188)

(declare-datatypes ((tuple2!21190 0))(
  ( (tuple2!21191 (_1!11517 BitStream!10724) (_2!11517 BitStream!10724)) )
))
(declare-fun lt!384983 () tuple2!21190)

(assert (=> b!246815 (and (= (_2!11516 lt!384989) (_2!11516 lt!384973)) (= (_1!11516 lt!384989) (_2!11517 lt!384983)))))

(declare-fun b!246816 () Bool)

(declare-fun res!206518 () Bool)

(declare-fun e!171005 () Bool)

(assert (=> b!246816 (=> (not res!206518) (not e!171005))))

(declare-fun lt!384986 () tuple2!21186)

(declare-fun isPrefixOf!0 (BitStream!10724 BitStream!10724) Bool)

(assert (=> b!246816 (= res!206518 (isPrefixOf!0 (_2!11515 lt!384986) (_2!11515 lt!384967)))))

(declare-fun b!246817 () Bool)

(declare-fun e!170995 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246817 (= e!170995 (invariant!0 (currentBit!11773 thiss!1005) (currentByte!11778 thiss!1005) (size!5901 (buf!6382 (_2!11515 lt!384967)))))))

(declare-fun b!246818 () Bool)

(declare-fun e!170998 () Bool)

(assert (=> b!246818 (= e!170998 (not e!171001))))

(declare-fun res!206516 () Bool)

(assert (=> b!246818 (=> res!206516 e!171001)))

(declare-fun lt!384976 () tuple2!21190)

(assert (=> b!246818 (= res!206516 (not (= (_1!11516 lt!384973) (_2!11517 lt!384976))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10724 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21188)

(assert (=> b!246818 (= lt!384973 (checkBitsLoopPure!0 (_1!11517 lt!384976) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384981 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246818 (validate_offset_bits!1 ((_ sign_extend 32) (size!5901 (buf!6382 (_2!11515 lt!384967)))) ((_ sign_extend 32) (currentByte!11778 (_2!11515 lt!384986))) ((_ sign_extend 32) (currentBit!11773 (_2!11515 lt!384986))) lt!384981)))

(declare-fun lt!384975 () Unit!17914)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10724 array!13458 (_ BitVec 64)) Unit!17914)

(assert (=> b!246818 (= lt!384975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11515 lt!384986) (buf!6382 (_2!11515 lt!384967)) lt!384981))))

(assert (=> b!246818 (= lt!384989 (checkBitsLoopPure!0 (_1!11517 lt!384983) nBits!297 bit!26 from!289))))

(assert (=> b!246818 (validate_offset_bits!1 ((_ sign_extend 32) (size!5901 (buf!6382 (_2!11515 lt!384967)))) ((_ sign_extend 32) (currentByte!11778 thiss!1005)) ((_ sign_extend 32) (currentBit!11773 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384969 () Unit!17914)

(assert (=> b!246818 (= lt!384969 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6382 (_2!11515 lt!384967)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10724) tuple2!21188)

(assert (=> b!246818 (= (_2!11516 (readBitPure!0 (_1!11517 lt!384983))) bit!26)))

(declare-fun reader!0 (BitStream!10724 BitStream!10724) tuple2!21190)

(assert (=> b!246818 (= lt!384976 (reader!0 (_2!11515 lt!384986) (_2!11515 lt!384967)))))

(assert (=> b!246818 (= lt!384983 (reader!0 thiss!1005 (_2!11515 lt!384967)))))

(declare-fun e!170996 () Bool)

(assert (=> b!246818 e!170996))

(declare-fun res!206519 () Bool)

(assert (=> b!246818 (=> (not res!206519) (not e!170996))))

(declare-fun lt!384982 () tuple2!21188)

(declare-fun lt!384987 () tuple2!21188)

(assert (=> b!246818 (= res!206519 (= (bitIndex!0 (size!5901 (buf!6382 (_1!11516 lt!384982))) (currentByte!11778 (_1!11516 lt!384982)) (currentBit!11773 (_1!11516 lt!384982))) (bitIndex!0 (size!5901 (buf!6382 (_1!11516 lt!384987))) (currentByte!11778 (_1!11516 lt!384987)) (currentBit!11773 (_1!11516 lt!384987)))))))

(declare-fun lt!384979 () Unit!17914)

(declare-fun lt!384970 () BitStream!10724)

(declare-fun readBitPrefixLemma!0 (BitStream!10724 BitStream!10724) Unit!17914)

(assert (=> b!246818 (= lt!384979 (readBitPrefixLemma!0 lt!384970 (_2!11515 lt!384967)))))

(assert (=> b!246818 (= lt!384987 (readBitPure!0 (BitStream!10725 (buf!6382 (_2!11515 lt!384967)) (currentByte!11778 thiss!1005) (currentBit!11773 thiss!1005))))))

(assert (=> b!246818 (= lt!384982 (readBitPure!0 lt!384970))))

(assert (=> b!246818 (= lt!384970 (BitStream!10725 (buf!6382 (_2!11515 lt!384986)) (currentByte!11778 thiss!1005) (currentBit!11773 thiss!1005)))))

(assert (=> b!246818 e!170995))

(declare-fun res!206508 () Bool)

(assert (=> b!246818 (=> (not res!206508) (not e!170995))))

(assert (=> b!246818 (= res!206508 (isPrefixOf!0 thiss!1005 (_2!11515 lt!384967)))))

(declare-fun lt!384968 () Unit!17914)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10724 BitStream!10724 BitStream!10724) Unit!17914)

(assert (=> b!246818 (= lt!384968 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11515 lt!384986) (_2!11515 lt!384967)))))

(declare-fun e!170999 () Bool)

(assert (=> b!246818 e!170999))

(declare-fun res!206511 () Bool)

(assert (=> b!246818 (=> (not res!206511) (not e!170999))))

(assert (=> b!246818 (= res!206511 (= (size!5901 (buf!6382 (_2!11515 lt!384986))) (size!5901 (buf!6382 (_2!11515 lt!384967)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10724 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21186)

(assert (=> b!246818 (= lt!384967 (appendNBitsLoop!0 (_2!11515 lt!384986) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246818 (validate_offset_bits!1 ((_ sign_extend 32) (size!5901 (buf!6382 (_2!11515 lt!384986)))) ((_ sign_extend 32) (currentByte!11778 (_2!11515 lt!384986))) ((_ sign_extend 32) (currentBit!11773 (_2!11515 lt!384986))) lt!384981)))

(assert (=> b!246818 (= lt!384981 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384974 () Unit!17914)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10724 BitStream!10724 (_ BitVec 64) (_ BitVec 64)) Unit!17914)

(assert (=> b!246818 (= lt!384974 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11515 lt!384986) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!171004 () Bool)

(assert (=> b!246818 e!171004))

(declare-fun res!206522 () Bool)

(assert (=> b!246818 (=> (not res!206522) (not e!171004))))

(assert (=> b!246818 (= res!206522 (= (size!5901 (buf!6382 thiss!1005)) (size!5901 (buf!6382 (_2!11515 lt!384986)))))))

(declare-fun appendBit!0 (BitStream!10724 Bool) tuple2!21186)

(assert (=> b!246818 (= lt!384986 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246819 () Bool)

(declare-fun res!206509 () Bool)

(assert (=> b!246819 (=> res!206509 e!171001)))

(declare-fun withMovedBitIndex!0 (BitStream!10724 (_ BitVec 64)) BitStream!10724)

(assert (=> b!246819 (= res!206509 (not (= (_1!11517 lt!384976) (withMovedBitIndex!0 (_1!11517 lt!384983) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246820 () Bool)

(declare-fun res!206520 () Bool)

(assert (=> b!246820 (=> (not res!206520) (not e!170998))))

(assert (=> b!246820 (= res!206520 (bvslt from!289 nBits!297))))

(declare-fun b!246821 () Bool)

(declare-fun lt!384980 () tuple2!21188)

(declare-fun lt!384977 () tuple2!21190)

(assert (=> b!246821 (= e!171005 (not (or (not (_2!11516 lt!384980)) (not (= (_1!11516 lt!384980) (_2!11517 lt!384977))))))))

(assert (=> b!246821 (= lt!384980 (checkBitsLoopPure!0 (_1!11517 lt!384977) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384978 () (_ BitVec 64))

(assert (=> b!246821 (validate_offset_bits!1 ((_ sign_extend 32) (size!5901 (buf!6382 (_2!11515 lt!384967)))) ((_ sign_extend 32) (currentByte!11778 (_2!11515 lt!384986))) ((_ sign_extend 32) (currentBit!11773 (_2!11515 lt!384986))) lt!384978)))

(declare-fun lt!384984 () Unit!17914)

(assert (=> b!246821 (= lt!384984 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11515 lt!384986) (buf!6382 (_2!11515 lt!384967)) lt!384978))))

(assert (=> b!246821 (= lt!384977 (reader!0 (_2!11515 lt!384986) (_2!11515 lt!384967)))))

(declare-fun b!246822 () Bool)

(declare-fun e!170994 () Bool)

(assert (=> b!246822 (= e!171004 e!170994)))

(declare-fun res!206521 () Bool)

(assert (=> b!246822 (=> (not res!206521) (not e!170994))))

(declare-fun lt!384971 () (_ BitVec 64))

(declare-fun lt!384985 () (_ BitVec 64))

(assert (=> b!246822 (= res!206521 (= lt!384971 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384985)))))

(assert (=> b!246822 (= lt!384971 (bitIndex!0 (size!5901 (buf!6382 (_2!11515 lt!384986))) (currentByte!11778 (_2!11515 lt!384986)) (currentBit!11773 (_2!11515 lt!384986))))))

(assert (=> b!246822 (= lt!384985 (bitIndex!0 (size!5901 (buf!6382 thiss!1005)) (currentByte!11778 thiss!1005) (currentBit!11773 thiss!1005)))))

(declare-fun res!206514 () Bool)

(assert (=> start!53130 (=> (not res!206514) (not e!170998))))

(assert (=> start!53130 (= res!206514 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53130 e!170998))

(assert (=> start!53130 true))

(declare-fun e!171003 () Bool)

(declare-fun inv!12 (BitStream!10724) Bool)

(assert (=> start!53130 (and (inv!12 thiss!1005) e!171003)))

(declare-fun b!246823 () Bool)

(declare-fun e!170997 () Bool)

(declare-fun lt!384988 () tuple2!21188)

(assert (=> b!246823 (= e!170997 (= (bitIndex!0 (size!5901 (buf!6382 (_1!11516 lt!384988))) (currentByte!11778 (_1!11516 lt!384988)) (currentBit!11773 (_1!11516 lt!384988))) lt!384971))))

(declare-fun b!246824 () Bool)

(declare-fun array_inv!5642 (array!13458) Bool)

(assert (=> b!246824 (= e!171003 (array_inv!5642 (buf!6382 thiss!1005)))))

(declare-fun b!246825 () Bool)

(declare-fun res!206515 () Bool)

(assert (=> b!246825 (=> (not res!206515) (not e!170995))))

(assert (=> b!246825 (= res!206515 (invariant!0 (currentBit!11773 thiss!1005) (currentByte!11778 thiss!1005) (size!5901 (buf!6382 (_2!11515 lt!384986)))))))

(declare-fun b!246826 () Bool)

(declare-fun res!206523 () Bool)

(assert (=> b!246826 (=> (not res!206523) (not e!170994))))

(assert (=> b!246826 (= res!206523 (isPrefixOf!0 thiss!1005 (_2!11515 lt!384986)))))

(declare-fun b!246827 () Bool)

(assert (=> b!246827 (= e!170999 e!171005)))

(declare-fun res!206513 () Bool)

(assert (=> b!246827 (=> (not res!206513) (not e!171005))))

(assert (=> b!246827 (= res!206513 (= (bitIndex!0 (size!5901 (buf!6382 (_2!11515 lt!384967))) (currentByte!11778 (_2!11515 lt!384967)) (currentBit!11773 (_2!11515 lt!384967))) (bvadd (bitIndex!0 (size!5901 (buf!6382 (_2!11515 lt!384986))) (currentByte!11778 (_2!11515 lt!384986)) (currentBit!11773 (_2!11515 lt!384986))) lt!384978)))))

(assert (=> b!246827 (= lt!384978 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246828 () Bool)

(assert (=> b!246828 (= e!170994 e!170997)))

(declare-fun res!206510 () Bool)

(assert (=> b!246828 (=> (not res!206510) (not e!170997))))

(assert (=> b!246828 (= res!206510 (and (= (_2!11516 lt!384988) bit!26) (= (_1!11516 lt!384988) (_2!11515 lt!384986))))))

(declare-fun readerFrom!0 (BitStream!10724 (_ BitVec 32) (_ BitVec 32)) BitStream!10724)

(assert (=> b!246828 (= lt!384988 (readBitPure!0 (readerFrom!0 (_2!11515 lt!384986) (currentBit!11773 thiss!1005) (currentByte!11778 thiss!1005))))))

(declare-fun b!246829 () Bool)

(assert (=> b!246829 (= e!170996 (= (_2!11516 lt!384982) (_2!11516 lt!384987)))))

(declare-fun b!246830 () Bool)

(declare-fun res!206517 () Bool)

(assert (=> b!246830 (=> (not res!206517) (not e!170998))))

(assert (=> b!246830 (= res!206517 (validate_offset_bits!1 ((_ sign_extend 32) (size!5901 (buf!6382 thiss!1005))) ((_ sign_extend 32) (currentByte!11778 thiss!1005)) ((_ sign_extend 32) (currentBit!11773 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53130 res!206514) b!246830))

(assert (= (and b!246830 res!206517) b!246820))

(assert (= (and b!246820 res!206520) b!246818))

(assert (= (and b!246818 res!206522) b!246822))

(assert (= (and b!246822 res!206521) b!246826))

(assert (= (and b!246826 res!206523) b!246828))

(assert (= (and b!246828 res!206510) b!246823))

(assert (= (and b!246818 res!206511) b!246827))

(assert (= (and b!246827 res!206513) b!246816))

(assert (= (and b!246816 res!206518) b!246821))

(assert (= (and b!246818 res!206508) b!246825))

(assert (= (and b!246825 res!206515) b!246817))

(assert (= (and b!246818 res!206519) b!246829))

(assert (= (and b!246818 (not res!206516)) b!246819))

(assert (= (and b!246819 (not res!206509)) b!246815))

(assert (= (and b!246815 (not res!206512)) b!246814))

(assert (= start!53130 b!246824))

(declare-fun m!372219 () Bool)

(assert (=> b!246817 m!372219))

(declare-fun m!372221 () Bool)

(assert (=> b!246825 m!372221))

(declare-fun m!372223 () Bool)

(assert (=> b!246818 m!372223))

(declare-fun m!372225 () Bool)

(assert (=> b!246818 m!372225))

(declare-fun m!372227 () Bool)

(assert (=> b!246818 m!372227))

(declare-fun m!372229 () Bool)

(assert (=> b!246818 m!372229))

(declare-fun m!372231 () Bool)

(assert (=> b!246818 m!372231))

(declare-fun m!372233 () Bool)

(assert (=> b!246818 m!372233))

(declare-fun m!372235 () Bool)

(assert (=> b!246818 m!372235))

(declare-fun m!372237 () Bool)

(assert (=> b!246818 m!372237))

(declare-fun m!372239 () Bool)

(assert (=> b!246818 m!372239))

(declare-fun m!372241 () Bool)

(assert (=> b!246818 m!372241))

(declare-fun m!372243 () Bool)

(assert (=> b!246818 m!372243))

(declare-fun m!372245 () Bool)

(assert (=> b!246818 m!372245))

(declare-fun m!372247 () Bool)

(assert (=> b!246818 m!372247))

(declare-fun m!372249 () Bool)

(assert (=> b!246818 m!372249))

(declare-fun m!372251 () Bool)

(assert (=> b!246818 m!372251))

(declare-fun m!372253 () Bool)

(assert (=> b!246818 m!372253))

(declare-fun m!372255 () Bool)

(assert (=> b!246818 m!372255))

(declare-fun m!372257 () Bool)

(assert (=> b!246818 m!372257))

(declare-fun m!372259 () Bool)

(assert (=> b!246818 m!372259))

(declare-fun m!372261 () Bool)

(assert (=> b!246818 m!372261))

(declare-fun m!372263 () Bool)

(assert (=> b!246828 m!372263))

(assert (=> b!246828 m!372263))

(declare-fun m!372265 () Bool)

(assert (=> b!246828 m!372265))

(declare-fun m!372267 () Bool)

(assert (=> b!246827 m!372267))

(declare-fun m!372269 () Bool)

(assert (=> b!246827 m!372269))

(declare-fun m!372271 () Bool)

(assert (=> b!246816 m!372271))

(declare-fun m!372273 () Bool)

(assert (=> b!246824 m!372273))

(assert (=> b!246822 m!372269))

(declare-fun m!372275 () Bool)

(assert (=> b!246822 m!372275))

(declare-fun m!372277 () Bool)

(assert (=> b!246821 m!372277))

(declare-fun m!372279 () Bool)

(assert (=> b!246821 m!372279))

(declare-fun m!372281 () Bool)

(assert (=> b!246821 m!372281))

(assert (=> b!246821 m!372253))

(assert (=> b!246814 m!372267))

(assert (=> b!246814 m!372275))

(declare-fun m!372283 () Bool)

(assert (=> b!246826 m!372283))

(declare-fun m!372285 () Bool)

(assert (=> start!53130 m!372285))

(declare-fun m!372287 () Bool)

(assert (=> b!246830 m!372287))

(declare-fun m!372289 () Bool)

(assert (=> b!246823 m!372289))

(declare-fun m!372291 () Bool)

(assert (=> b!246819 m!372291))

(push 1)

(assert (not b!246830))

(assert (not b!246814))

(assert (not b!246824))

(assert (not b!246817))

(assert (not b!246816))

(assert (not b!246818))

(assert (not b!246825))

(assert (not b!246819))

(assert (not b!246822))

(assert (not b!246821))

(assert (not start!53130))

(assert (not b!246828))

(assert (not b!246827))

(assert (not b!246826))

(assert (not b!246823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

