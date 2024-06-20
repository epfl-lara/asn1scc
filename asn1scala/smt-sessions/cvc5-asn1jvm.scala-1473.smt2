; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40550 () Bool)

(assert start!40550)

(declare-fun b!186417 () Bool)

(declare-fun res!155224 () Bool)

(declare-fun e!128999 () Bool)

(assert (=> b!186417 (=> (not res!155224) (not e!128999))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!186417 (= res!155224 (not (= i!590 nBits!348)))))

(declare-fun b!186418 () Bool)

(declare-fun res!155215 () Bool)

(assert (=> b!186418 (=> (not res!155215) (not e!128999))))

(declare-datatypes ((array!9826 0))(
  ( (array!9827 (arr!5263 (Array (_ BitVec 32) (_ BitVec 8))) (size!4333 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7774 0))(
  ( (BitStream!7775 (buf!4796 array!9826) (currentByte!9046 (_ BitVec 32)) (currentBit!9041 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7774)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186418 (= res!155215 (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 thiss!1204))))))

(declare-fun b!186419 () Bool)

(declare-fun e!128992 () Bool)

(declare-datatypes ((Unit!13335 0))(
  ( (Unit!13336) )
))
(declare-datatypes ((tuple2!16132 0))(
  ( (tuple2!16133 (_1!8711 Unit!13335) (_2!8711 BitStream!7774)) )
))
(declare-fun lt!287951 () tuple2!16132)

(assert (=> b!186419 (= e!128992 (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287951)))))))

(declare-fun b!186420 () Bool)

(declare-fun res!155209 () Bool)

(declare-fun e!129001 () Bool)

(assert (=> b!186420 (=> res!155209 e!129001)))

(declare-fun lt!287965 () tuple2!16132)

(declare-fun isPrefixOf!0 (BitStream!7774 BitStream!7774) Bool)

(assert (=> b!186420 (= res!155209 (not (isPrefixOf!0 thiss!1204 (_2!8711 lt!287965))))))

(declare-fun b!186421 () Bool)

(declare-fun res!155213 () Bool)

(assert (=> b!186421 (=> res!155213 e!129001)))

(assert (=> b!186421 (= res!155213 (not (invariant!0 (currentBit!9041 (_2!8711 lt!287951)) (currentByte!9046 (_2!8711 lt!287951)) (size!4333 (buf!4796 (_2!8711 lt!287951))))))))

(declare-fun b!186422 () Bool)

(declare-fun e!128996 () Bool)

(assert (=> b!186422 (= e!129001 e!128996)))

(declare-fun res!155216 () Bool)

(assert (=> b!186422 (=> res!155216 e!128996)))

(declare-fun lt!287954 () (_ BitVec 64))

(declare-datatypes ((tuple2!16134 0))(
  ( (tuple2!16135 (_1!8712 BitStream!7774) (_2!8712 BitStream!7774)) )
))
(declare-fun lt!287952 () tuple2!16134)

(declare-datatypes ((tuple2!16136 0))(
  ( (tuple2!16137 (_1!8713 BitStream!7774) (_2!8713 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16136)

(assert (=> b!186422 (= res!155216 (not (= (_1!8713 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!287952) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287954)) (_2!8712 lt!287952))))))

(declare-fun lt!287968 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186422 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!287968)))

(declare-fun lt!287966 () Unit!13335)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7774 array!9826 (_ BitVec 64)) Unit!13335)

(assert (=> b!186422 (= lt!287966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8711 lt!287965) (buf!4796 (_2!8711 lt!287951)) lt!287968))))

(assert (=> b!186422 (= lt!287968 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!287961 () (_ BitVec 64))

(declare-fun lt!287972 () (_ BitVec 64))

(declare-datatypes ((tuple2!16138 0))(
  ( (tuple2!16139 (_1!8714 BitStream!7774) (_2!8714 Bool)) )
))
(declare-fun lt!287973 () tuple2!16138)

(assert (=> b!186422 (= lt!287954 (bvor lt!287961 (ite (_2!8714 lt!287973) lt!287972 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!287970 () tuple2!16136)

(declare-fun lt!287962 () tuple2!16134)

(assert (=> b!186422 (= lt!287970 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!287962) nBits!348 i!590 lt!287961))))

(declare-fun lt!287956 () (_ BitVec 64))

(assert (=> b!186422 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204)) lt!287956)))

(declare-fun lt!287957 () Unit!13335)

(assert (=> b!186422 (= lt!287957 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4796 (_2!8711 lt!287951)) lt!287956))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186422 (= lt!287961 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!287959 () Bool)

(assert (=> b!186422 (= (_2!8714 lt!287973) lt!287959)))

(declare-fun readBitPure!0 (BitStream!7774) tuple2!16138)

(assert (=> b!186422 (= lt!287973 (readBitPure!0 (_1!8712 lt!287962)))))

(declare-fun reader!0 (BitStream!7774 BitStream!7774) tuple2!16134)

(assert (=> b!186422 (= lt!287952 (reader!0 (_2!8711 lt!287965) (_2!8711 lt!287951)))))

(assert (=> b!186422 (= lt!287962 (reader!0 thiss!1204 (_2!8711 lt!287951)))))

(declare-fun e!129002 () Bool)

(assert (=> b!186422 e!129002))

(declare-fun res!155214 () Bool)

(assert (=> b!186422 (=> (not res!155214) (not e!129002))))

(declare-fun lt!287948 () tuple2!16138)

(declare-fun lt!287967 () tuple2!16138)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186422 (= res!155214 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!287948))) (currentByte!9046 (_1!8714 lt!287948)) (currentBit!9041 (_1!8714 lt!287948))) (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!287967))) (currentByte!9046 (_1!8714 lt!287967)) (currentBit!9041 (_1!8714 lt!287967)))))))

(declare-fun lt!287963 () Unit!13335)

(declare-fun lt!287974 () BitStream!7774)

(declare-fun readBitPrefixLemma!0 (BitStream!7774 BitStream!7774) Unit!13335)

(assert (=> b!186422 (= lt!287963 (readBitPrefixLemma!0 lt!287974 (_2!8711 lt!287951)))))

(assert (=> b!186422 (= lt!287967 (readBitPure!0 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204))))))

(assert (=> b!186422 (= lt!287948 (readBitPure!0 lt!287974))))

(assert (=> b!186422 e!128992))

(declare-fun res!155208 () Bool)

(assert (=> b!186422 (=> (not res!155208) (not e!128992))))

(assert (=> b!186422 (= res!155208 (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(assert (=> b!186422 (= lt!287974 (BitStream!7775 (buf!4796 (_2!8711 lt!287965)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(declare-fun b!186423 () Bool)

(declare-fun e!128995 () Bool)

(assert (=> b!186423 (= e!128999 (not e!128995))))

(declare-fun res!155218 () Bool)

(assert (=> b!186423 (=> res!155218 e!128995)))

(declare-fun lt!287969 () (_ BitVec 64))

(declare-fun lt!287958 () (_ BitVec 64))

(assert (=> b!186423 (= res!155218 (not (= lt!287969 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287958))))))

(assert (=> b!186423 (= lt!287969 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(assert (=> b!186423 (= lt!287958 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(declare-fun e!128997 () Bool)

(assert (=> b!186423 e!128997))

(declare-fun res!155210 () Bool)

(assert (=> b!186423 (=> (not res!155210) (not e!128997))))

(assert (=> b!186423 (= res!155210 (= (size!4333 (buf!4796 thiss!1204)) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(declare-fun appendBit!0 (BitStream!7774 Bool) tuple2!16132)

(assert (=> b!186423 (= lt!287965 (appendBit!0 thiss!1204 lt!287959))))

(assert (=> b!186423 (= lt!287959 (not (= (bvand v!189 lt!287972) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186423 (= lt!287972 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186424 () Bool)

(declare-fun e!129003 () Bool)

(assert (=> b!186424 (= e!128997 e!129003)))

(declare-fun res!155222 () Bool)

(assert (=> b!186424 (=> (not res!155222) (not e!129003))))

(declare-fun lt!287950 () (_ BitVec 64))

(declare-fun lt!287955 () (_ BitVec 64))

(assert (=> b!186424 (= res!155222 (= lt!287950 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287955)))))

(assert (=> b!186424 (= lt!287950 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(assert (=> b!186424 (= lt!287955 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(declare-fun b!186425 () Bool)

(assert (=> b!186425 (= e!129002 (= (_2!8714 lt!287948) (_2!8714 lt!287967)))))

(declare-fun b!186426 () Bool)

(declare-fun e!128993 () Bool)

(assert (=> b!186426 (= e!129003 e!128993)))

(declare-fun res!155217 () Bool)

(assert (=> b!186426 (=> (not res!155217) (not e!128993))))

(declare-fun lt!287960 () tuple2!16138)

(assert (=> b!186426 (= res!155217 (and (= (_2!8714 lt!287960) lt!287959) (= (_1!8714 lt!287960) (_2!8711 lt!287965))))))

(declare-fun readerFrom!0 (BitStream!7774 (_ BitVec 32) (_ BitVec 32)) BitStream!7774)

(assert (=> b!186426 (= lt!287960 (readBitPure!0 (readerFrom!0 (_2!8711 lt!287965) (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204))))))

(declare-fun b!186427 () Bool)

(declare-fun res!155219 () Bool)

(assert (=> b!186427 (=> (not res!155219) (not e!129003))))

(assert (=> b!186427 (= res!155219 (isPrefixOf!0 thiss!1204 (_2!8711 lt!287965)))))

(declare-fun b!186428 () Bool)

(assert (=> b!186428 (= e!128995 e!129001)))

(declare-fun res!155212 () Bool)

(assert (=> b!186428 (=> res!155212 e!129001)))

(declare-fun lt!287953 () (_ BitVec 64))

(assert (=> b!186428 (= res!155212 (not (= lt!287953 (bvsub (bvsub (bvadd lt!287969 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186428 (= lt!287953 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287951))) (currentByte!9046 (_2!8711 lt!287951)) (currentBit!9041 (_2!8711 lt!287951))))))

(assert (=> b!186428 (isPrefixOf!0 thiss!1204 (_2!8711 lt!287951))))

(declare-fun lt!287971 () Unit!13335)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7774 BitStream!7774 BitStream!7774) Unit!13335)

(assert (=> b!186428 (= lt!287971 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8711 lt!287965) (_2!8711 lt!287951)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7774 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16132)

(assert (=> b!186428 (= lt!287951 (appendBitsLSBFirstLoopTR!0 (_2!8711 lt!287965) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!186429 () Bool)

(declare-fun e!129004 () Bool)

(declare-fun array_inv!4074 (array!9826) Bool)

(assert (=> b!186429 (= e!129004 (array_inv!4074 (buf!4796 thiss!1204)))))

(declare-fun b!186430 () Bool)

(assert (=> b!186430 (= e!128996 (invariant!0 (currentBit!9041 (_2!8711 lt!287965)) (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(declare-fun e!129000 () Bool)

(assert (=> b!186430 e!129000))

(declare-fun res!155221 () Bool)

(assert (=> b!186430 (=> (not res!155221) (not e!129000))))

(declare-fun lt!287949 () tuple2!16136)

(assert (=> b!186430 (= res!155221 (and (= (_2!8713 lt!287970) (_2!8713 lt!287949)) (= (_1!8713 lt!287970) (_1!8713 lt!287949))))))

(declare-fun lt!287964 () Unit!13335)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13335)

(assert (=> b!186430 (= lt!287964 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8712 lt!287962) nBits!348 i!590 lt!287961))))

(declare-fun withMovedBitIndex!0 (BitStream!7774 (_ BitVec 64)) BitStream!7774)

(assert (=> b!186430 (= lt!287949 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287954))))

(declare-fun b!186431 () Bool)

(declare-fun e!128998 () Bool)

(assert (=> b!186431 (= e!128998 e!128999)))

(declare-fun res!155226 () Bool)

(assert (=> b!186431 (=> (not res!155226) (not e!128999))))

(assert (=> b!186431 (= res!155226 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204)) lt!287956))))

(assert (=> b!186431 (= lt!287956 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!186432 () Bool)

(declare-fun res!155223 () Bool)

(assert (=> b!186432 (=> res!155223 e!129001)))

(assert (=> b!186432 (= res!155223 (not (isPrefixOf!0 (_2!8711 lt!287965) (_2!8711 lt!287951))))))

(declare-fun res!155225 () Bool)

(assert (=> start!40550 (=> (not res!155225) (not e!128998))))

(assert (=> start!40550 (= res!155225 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40550 e!128998))

(assert (=> start!40550 true))

(declare-fun inv!12 (BitStream!7774) Bool)

(assert (=> start!40550 (and (inv!12 thiss!1204) e!129004)))

(declare-fun b!186433 () Bool)

(assert (=> b!186433 (= e!129000 (= (_1!8712 lt!287952) (withMovedBitIndex!0 (_2!8712 lt!287952) (bvsub lt!287969 lt!287953))))))

(declare-fun b!186434 () Bool)

(assert (=> b!186434 (= e!128993 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!287960))) (currentByte!9046 (_1!8714 lt!287960)) (currentBit!9041 (_1!8714 lt!287960))) lt!287950))))

(declare-fun b!186435 () Bool)

(declare-fun res!155211 () Bool)

(assert (=> b!186435 (=> res!155211 e!129001)))

(assert (=> b!186435 (= res!155211 (or (not (= (size!4333 (buf!4796 (_2!8711 lt!287951))) (size!4333 (buf!4796 thiss!1204)))) (not (= lt!287953 (bvsub (bvadd lt!287958 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!186436 () Bool)

(declare-fun res!155220 () Bool)

(assert (=> b!186436 (=> (not res!155220) (not e!129000))))

(assert (=> b!186436 (= res!155220 (= (_1!8712 lt!287962) (withMovedBitIndex!0 (_2!8712 lt!287962) (bvsub lt!287958 lt!287953))))))

(assert (= (and start!40550 res!155225) b!186431))

(assert (= (and b!186431 res!155226) b!186418))

(assert (= (and b!186418 res!155215) b!186417))

(assert (= (and b!186417 res!155224) b!186423))

(assert (= (and b!186423 res!155210) b!186424))

(assert (= (and b!186424 res!155222) b!186427))

(assert (= (and b!186427 res!155219) b!186426))

(assert (= (and b!186426 res!155217) b!186434))

(assert (= (and b!186423 (not res!155218)) b!186428))

(assert (= (and b!186428 (not res!155212)) b!186421))

(assert (= (and b!186421 (not res!155213)) b!186435))

(assert (= (and b!186435 (not res!155211)) b!186432))

(assert (= (and b!186432 (not res!155223)) b!186420))

(assert (= (and b!186420 (not res!155209)) b!186422))

(assert (= (and b!186422 res!155208) b!186419))

(assert (= (and b!186422 res!155214) b!186425))

(assert (= (and b!186422 (not res!155216)) b!186430))

(assert (= (and b!186430 res!155221) b!186436))

(assert (= (and b!186436 res!155220) b!186433))

(assert (= start!40550 b!186429))

(declare-fun m!289807 () Bool)

(assert (=> b!186424 m!289807))

(declare-fun m!289809 () Bool)

(assert (=> b!186424 m!289809))

(declare-fun m!289811 () Bool)

(assert (=> b!186419 m!289811))

(declare-fun m!289813 () Bool)

(assert (=> b!186430 m!289813))

(declare-fun m!289815 () Bool)

(assert (=> b!186430 m!289815))

(declare-fun m!289817 () Bool)

(assert (=> b!186430 m!289817))

(assert (=> b!186430 m!289817))

(declare-fun m!289819 () Bool)

(assert (=> b!186430 m!289819))

(declare-fun m!289821 () Bool)

(assert (=> b!186433 m!289821))

(declare-fun m!289823 () Bool)

(assert (=> b!186434 m!289823))

(declare-fun m!289825 () Bool)

(assert (=> b!186421 m!289825))

(declare-fun m!289827 () Bool)

(assert (=> b!186431 m!289827))

(declare-fun m!289829 () Bool)

(assert (=> b!186422 m!289829))

(declare-fun m!289831 () Bool)

(assert (=> b!186422 m!289831))

(declare-fun m!289833 () Bool)

(assert (=> b!186422 m!289833))

(declare-fun m!289835 () Bool)

(assert (=> b!186422 m!289835))

(declare-fun m!289837 () Bool)

(assert (=> b!186422 m!289837))

(declare-fun m!289839 () Bool)

(assert (=> b!186422 m!289839))

(declare-fun m!289841 () Bool)

(assert (=> b!186422 m!289841))

(declare-fun m!289843 () Bool)

(assert (=> b!186422 m!289843))

(declare-fun m!289845 () Bool)

(assert (=> b!186422 m!289845))

(declare-fun m!289847 () Bool)

(assert (=> b!186422 m!289847))

(declare-fun m!289849 () Bool)

(assert (=> b!186422 m!289849))

(declare-fun m!289851 () Bool)

(assert (=> b!186422 m!289851))

(declare-fun m!289853 () Bool)

(assert (=> b!186422 m!289853))

(declare-fun m!289855 () Bool)

(assert (=> b!186422 m!289855))

(declare-fun m!289857 () Bool)

(assert (=> b!186422 m!289857))

(declare-fun m!289859 () Bool)

(assert (=> b!186422 m!289859))

(declare-fun m!289861 () Bool)

(assert (=> b!186428 m!289861))

(declare-fun m!289863 () Bool)

(assert (=> b!186428 m!289863))

(declare-fun m!289865 () Bool)

(assert (=> b!186428 m!289865))

(declare-fun m!289867 () Bool)

(assert (=> b!186428 m!289867))

(declare-fun m!289869 () Bool)

(assert (=> b!186432 m!289869))

(declare-fun m!289871 () Bool)

(assert (=> b!186426 m!289871))

(assert (=> b!186426 m!289871))

(declare-fun m!289873 () Bool)

(assert (=> b!186426 m!289873))

(declare-fun m!289875 () Bool)

(assert (=> b!186420 m!289875))

(assert (=> b!186427 m!289875))

(declare-fun m!289877 () Bool)

(assert (=> start!40550 m!289877))

(declare-fun m!289879 () Bool)

(assert (=> b!186418 m!289879))

(assert (=> b!186423 m!289807))

(assert (=> b!186423 m!289809))

(declare-fun m!289881 () Bool)

(assert (=> b!186423 m!289881))

(declare-fun m!289883 () Bool)

(assert (=> b!186429 m!289883))

(declare-fun m!289885 () Bool)

(assert (=> b!186436 m!289885))

(push 1)

(assert (not b!186427))

(assert (not b!186431))

(assert (not b!186434))

(assert (not b!186429))

(assert (not b!186432))

(assert (not b!186419))

(assert (not b!186430))

(assert (not b!186424))

(assert (not b!186436))

(assert (not b!186420))

(assert (not b!186422))

(assert (not b!186433))

(assert (not b!186421))

(assert (not b!186418))

(assert (not start!40550))

(assert (not b!186426))

(assert (not b!186428))

(assert (not b!186423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64263 () Bool)

(declare-fun e!129085 () Bool)

(assert (=> d!64263 e!129085))

(declare-fun res!155346 () Bool)

(assert (=> d!64263 (=> (not res!155346) (not e!129085))))

(declare-fun lt!288152 () (_ BitVec 64))

(declare-fun lt!288150 () (_ BitVec 64))

(declare-fun lt!288153 () (_ BitVec 64))

(assert (=> d!64263 (= res!155346 (= lt!288153 (bvsub lt!288152 lt!288150)))))

(assert (=> d!64263 (or (= (bvand lt!288152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288152 lt!288150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64263 (= lt!288150 (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287965)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965)))))))

(declare-fun lt!288151 () (_ BitVec 64))

(declare-fun lt!288154 () (_ BitVec 64))

(assert (=> d!64263 (= lt!288152 (bvmul lt!288151 lt!288154))))

(assert (=> d!64263 (or (= lt!288151 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288154 (bvsdiv (bvmul lt!288151 lt!288154) lt!288151)))))

(assert (=> d!64263 (= lt!288154 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64263 (= lt!288151 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(assert (=> d!64263 (= lt!288153 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965)))))))

(assert (=> d!64263 (invariant!0 (currentBit!9041 (_2!8711 lt!287965)) (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!287965))))))

(assert (=> d!64263 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))) lt!288153)))

(declare-fun b!186561 () Bool)

(declare-fun res!155345 () Bool)

(assert (=> b!186561 (=> (not res!155345) (not e!129085))))

(assert (=> b!186561 (= res!155345 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288153))))

(declare-fun b!186562 () Bool)

(declare-fun lt!288149 () (_ BitVec 64))

(assert (=> b!186562 (= e!129085 (bvsle lt!288153 (bvmul lt!288149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186562 (or (= lt!288149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288149)))))

(assert (=> b!186562 (= lt!288149 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(assert (= (and d!64263 res!155346) b!186561))

(assert (= (and b!186561 res!155345) b!186562))

(declare-fun m!290047 () Bool)

(assert (=> d!64263 m!290047))

(assert (=> d!64263 m!289813))

(assert (=> b!186424 d!64263))

(declare-fun d!64267 () Bool)

(declare-fun e!129086 () Bool)

(assert (=> d!64267 e!129086))

(declare-fun res!155348 () Bool)

(assert (=> d!64267 (=> (not res!155348) (not e!129086))))

(declare-fun lt!288156 () (_ BitVec 64))

(declare-fun lt!288158 () (_ BitVec 64))

(declare-fun lt!288159 () (_ BitVec 64))

(assert (=> d!64267 (= res!155348 (= lt!288159 (bvsub lt!288158 lt!288156)))))

(assert (=> d!64267 (or (= (bvand lt!288158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288158 lt!288156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64267 (= lt!288156 (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204))))))

(declare-fun lt!288157 () (_ BitVec 64))

(declare-fun lt!288160 () (_ BitVec 64))

(assert (=> d!64267 (= lt!288158 (bvmul lt!288157 lt!288160))))

(assert (=> d!64267 (or (= lt!288157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288160 (bvsdiv (bvmul lt!288157 lt!288160) lt!288157)))))

(assert (=> d!64267 (= lt!288160 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64267 (= lt!288157 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))))))

(assert (=> d!64267 (= lt!288159 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9046 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9041 thiss!1204))))))

(assert (=> d!64267 (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 thiss!1204)))))

(assert (=> d!64267 (= (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)) lt!288159)))

(declare-fun b!186563 () Bool)

(declare-fun res!155347 () Bool)

(assert (=> b!186563 (=> (not res!155347) (not e!129086))))

(assert (=> b!186563 (= res!155347 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288159))))

(declare-fun b!186564 () Bool)

(declare-fun lt!288155 () (_ BitVec 64))

(assert (=> b!186564 (= e!129086 (bvsle lt!288159 (bvmul lt!288155 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186564 (or (= lt!288155 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288155 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288155)))))

(assert (=> b!186564 (= lt!288155 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))))))

(assert (= (and d!64267 res!155348) b!186563))

(assert (= (and b!186563 res!155347) b!186564))

(declare-fun m!290049 () Bool)

(assert (=> d!64267 m!290049))

(assert (=> d!64267 m!289879))

(assert (=> b!186424 d!64267))

(declare-fun d!64269 () Bool)

(declare-fun e!129087 () Bool)

(assert (=> d!64269 e!129087))

(declare-fun res!155350 () Bool)

(assert (=> d!64269 (=> (not res!155350) (not e!129087))))

(declare-fun lt!288162 () (_ BitVec 64))

(declare-fun lt!288165 () (_ BitVec 64))

(declare-fun lt!288164 () (_ BitVec 64))

(assert (=> d!64269 (= res!155350 (= lt!288165 (bvsub lt!288164 lt!288162)))))

(assert (=> d!64269 (or (= (bvand lt!288164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288164 lt!288162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64269 (= lt!288162 (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287960)))) ((_ sign_extend 32) (currentByte!9046 (_1!8714 lt!287960))) ((_ sign_extend 32) (currentBit!9041 (_1!8714 lt!287960)))))))

(declare-fun lt!288163 () (_ BitVec 64))

(declare-fun lt!288166 () (_ BitVec 64))

(assert (=> d!64269 (= lt!288164 (bvmul lt!288163 lt!288166))))

(assert (=> d!64269 (or (= lt!288163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288166 (bvsdiv (bvmul lt!288163 lt!288166) lt!288163)))))

(assert (=> d!64269 (= lt!288166 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64269 (= lt!288163 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287960)))))))

(assert (=> d!64269 (= lt!288165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9046 (_1!8714 lt!287960))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9041 (_1!8714 lt!287960)))))))

(assert (=> d!64269 (invariant!0 (currentBit!9041 (_1!8714 lt!287960)) (currentByte!9046 (_1!8714 lt!287960)) (size!4333 (buf!4796 (_1!8714 lt!287960))))))

(assert (=> d!64269 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!287960))) (currentByte!9046 (_1!8714 lt!287960)) (currentBit!9041 (_1!8714 lt!287960))) lt!288165)))

(declare-fun b!186565 () Bool)

(declare-fun res!155349 () Bool)

(assert (=> b!186565 (=> (not res!155349) (not e!129087))))

(assert (=> b!186565 (= res!155349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288165))))

(declare-fun b!186566 () Bool)

(declare-fun lt!288161 () (_ BitVec 64))

(assert (=> b!186566 (= e!129087 (bvsle lt!288165 (bvmul lt!288161 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186566 (or (= lt!288161 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288161 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288161)))))

(assert (=> b!186566 (= lt!288161 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287960)))))))

(assert (= (and d!64269 res!155350) b!186565))

(assert (= (and b!186565 res!155349) b!186566))

(declare-fun m!290051 () Bool)

(assert (=> d!64269 m!290051))

(declare-fun m!290053 () Bool)

(assert (=> d!64269 m!290053))

(assert (=> b!186434 d!64269))

(assert (=> b!186423 d!64263))

(assert (=> b!186423 d!64267))

(declare-fun d!64271 () Bool)

(declare-fun e!129095 () Bool)

(assert (=> d!64271 e!129095))

(declare-fun res!155368 () Bool)

(assert (=> d!64271 (=> (not res!155368) (not e!129095))))

(declare-fun lt!288196 () tuple2!16132)

(assert (=> d!64271 (= res!155368 (= (size!4333 (buf!4796 thiss!1204)) (size!4333 (buf!4796 (_2!8711 lt!288196)))))))

(declare-fun choose!16 (BitStream!7774 Bool) tuple2!16132)

(assert (=> d!64271 (= lt!288196 (choose!16 thiss!1204 lt!287959))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64271 (validate_offset_bit!0 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204)))))

(assert (=> d!64271 (= (appendBit!0 thiss!1204 lt!287959) lt!288196)))

(declare-fun b!186584 () Bool)

(declare-fun e!129096 () Bool)

(assert (=> b!186584 (= e!129095 e!129096)))

(declare-fun res!155367 () Bool)

(assert (=> b!186584 (=> (not res!155367) (not e!129096))))

(declare-fun lt!288193 () tuple2!16138)

(assert (=> b!186584 (= res!155367 (and (= (_2!8714 lt!288193) lt!287959) (= (_1!8714 lt!288193) (_2!8711 lt!288196))))))

(assert (=> b!186584 (= lt!288193 (readBitPure!0 (readerFrom!0 (_2!8711 lt!288196) (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204))))))

(declare-fun b!186585 () Bool)

(assert (=> b!186585 (= e!129096 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!288193))) (currentByte!9046 (_1!8714 lt!288193)) (currentBit!9041 (_1!8714 lt!288193))) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288196))) (currentByte!9046 (_2!8711 lt!288196)) (currentBit!9041 (_2!8711 lt!288196)))))))

(declare-fun b!186583 () Bool)

(declare-fun res!155365 () Bool)

(assert (=> b!186583 (=> (not res!155365) (not e!129095))))

(assert (=> b!186583 (= res!155365 (isPrefixOf!0 thiss!1204 (_2!8711 lt!288196)))))

(declare-fun b!186582 () Bool)

(declare-fun res!155366 () Bool)

(assert (=> b!186582 (=> (not res!155366) (not e!129095))))

(declare-fun lt!288195 () (_ BitVec 64))

(declare-fun lt!288194 () (_ BitVec 64))

(assert (=> b!186582 (= res!155366 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288196))) (currentByte!9046 (_2!8711 lt!288196)) (currentBit!9041 (_2!8711 lt!288196))) (bvadd lt!288195 lt!288194)))))

(assert (=> b!186582 (or (not (= (bvand lt!288195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288194 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288195 lt!288194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186582 (= lt!288194 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!186582 (= lt!288195 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(assert (= (and d!64271 res!155368) b!186582))

(assert (= (and b!186582 res!155366) b!186583))

(assert (= (and b!186583 res!155365) b!186584))

(assert (= (and b!186584 res!155367) b!186585))

(declare-fun m!290061 () Bool)

(assert (=> b!186585 m!290061))

(declare-fun m!290063 () Bool)

(assert (=> b!186585 m!290063))

(assert (=> b!186582 m!290063))

(assert (=> b!186582 m!289809))

(declare-fun m!290065 () Bool)

(assert (=> d!64271 m!290065))

(declare-fun m!290067 () Bool)

(assert (=> d!64271 m!290067))

(declare-fun m!290069 () Bool)

(assert (=> b!186583 m!290069))

(declare-fun m!290071 () Bool)

(assert (=> b!186584 m!290071))

(assert (=> b!186584 m!290071))

(declare-fun m!290073 () Bool)

(assert (=> b!186584 m!290073))

(assert (=> b!186423 d!64271))

(declare-fun d!64283 () Bool)

(assert (=> d!64283 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 thiss!1204))))))

(declare-fun bs!15998 () Bool)

(assert (= bs!15998 d!64283))

(assert (=> bs!15998 m!289879))

(assert (=> start!40550 d!64283))

(declare-fun d!64285 () Bool)

(declare-fun e!129102 () Bool)

(assert (=> d!64285 e!129102))

(declare-fun res!155374 () Bool)

(assert (=> d!64285 (=> (not res!155374) (not e!129102))))

(declare-fun lt!288208 () (_ BitVec 64))

(declare-fun lt!288207 () BitStream!7774)

(assert (=> d!64285 (= res!155374 (= (bvadd lt!288208 (bvsub lt!287969 lt!287953)) (bitIndex!0 (size!4333 (buf!4796 lt!288207)) (currentByte!9046 lt!288207) (currentBit!9041 lt!288207))))))

(assert (=> d!64285 (or (not (= (bvand lt!288208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287969 lt!287953) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288208 (bvsub lt!287969 lt!287953)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64285 (= lt!288208 (bitIndex!0 (size!4333 (buf!4796 (_2!8712 lt!287952))) (currentByte!9046 (_2!8712 lt!287952)) (currentBit!9041 (_2!8712 lt!287952))))))

(declare-fun moveBitIndex!0 (BitStream!7774 (_ BitVec 64)) tuple2!16132)

(assert (=> d!64285 (= lt!288207 (_2!8711 (moveBitIndex!0 (_2!8712 lt!287952) (bvsub lt!287969 lt!287953))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7774 (_ BitVec 64)) Bool)

(assert (=> d!64285 (moveBitIndexPrecond!0 (_2!8712 lt!287952) (bvsub lt!287969 lt!287953))))

(assert (=> d!64285 (= (withMovedBitIndex!0 (_2!8712 lt!287952) (bvsub lt!287969 lt!287953)) lt!288207)))

(declare-fun b!186591 () Bool)

(assert (=> b!186591 (= e!129102 (= (size!4333 (buf!4796 (_2!8712 lt!287952))) (size!4333 (buf!4796 lt!288207))))))

(assert (= (and d!64285 res!155374) b!186591))

(declare-fun m!290083 () Bool)

(assert (=> d!64285 m!290083))

(declare-fun m!290085 () Bool)

(assert (=> d!64285 m!290085))

(declare-fun m!290087 () Bool)

(assert (=> d!64285 m!290087))

(declare-fun m!290089 () Bool)

(assert (=> d!64285 m!290089))

(assert (=> b!186433 d!64285))

(declare-fun d!64293 () Bool)

(declare-datatypes ((tuple2!16158 0))(
  ( (tuple2!16159 (_1!8724 Bool) (_2!8724 BitStream!7774)) )
))
(declare-fun lt!288223 () tuple2!16158)

(declare-fun readBit!0 (BitStream!7774) tuple2!16158)

(assert (=> d!64293 (= lt!288223 (readBit!0 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204))))))

(assert (=> d!64293 (= (readBitPure!0 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204))) (tuple2!16139 (_2!8724 lt!288223) (_1!8724 lt!288223)))))

(declare-fun bs!16000 () Bool)

(assert (= bs!16000 d!64293))

(declare-fun m!290091 () Bool)

(assert (=> bs!16000 m!290091))

(assert (=> b!186422 d!64293))

(declare-fun d!64295 () Bool)

(assert (=> d!64295 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204)) lt!287956) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204))) lt!287956))))

(declare-fun bs!16001 () Bool)

(assert (= bs!16001 d!64295))

(declare-fun m!290093 () Bool)

(assert (=> bs!16001 m!290093))

(assert (=> b!186422 d!64295))

(declare-fun d!64297 () Bool)

(declare-datatypes ((tuple2!16160 0))(
  ( (tuple2!16161 (_1!8725 (_ BitVec 64)) (_2!8725 BitStream!7774)) )
))
(declare-fun lt!288232 () tuple2!16160)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16160)

(assert (=> d!64297 (= lt!288232 (readNBitsLSBFirstsLoop!0 (_1!8712 lt!287952) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287954))))

(assert (=> d!64297 (= (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!287952) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287954) (tuple2!16137 (_2!8725 lt!288232) (_1!8725 lt!288232)))))

(declare-fun bs!16003 () Bool)

(assert (= bs!16003 d!64297))

(declare-fun m!290099 () Bool)

(assert (=> bs!16003 m!290099))

(assert (=> b!186422 d!64297))

(declare-fun d!64301 () Bool)

(assert (=> d!64301 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!186422 d!64301))

(declare-fun b!186631 () Bool)

(declare-fun e!129125 () Unit!13335)

(declare-fun lt!288311 () Unit!13335)

(assert (=> b!186631 (= e!129125 lt!288311)))

(declare-fun lt!288307 () (_ BitVec 64))

(assert (=> b!186631 (= lt!288307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!288310 () (_ BitVec 64))

(assert (=> b!186631 (= lt!288310 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9826 array!9826 (_ BitVec 64) (_ BitVec 64)) Unit!13335)

(assert (=> b!186631 (= lt!288311 (arrayBitRangesEqSymmetric!0 (buf!4796 thiss!1204) (buf!4796 (_2!8711 lt!287951)) lt!288307 lt!288310))))

(declare-fun arrayBitRangesEq!0 (array!9826 array!9826 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186631 (arrayBitRangesEq!0 (buf!4796 (_2!8711 lt!287951)) (buf!4796 thiss!1204) lt!288307 lt!288310)))

(declare-fun d!64305 () Bool)

(declare-fun e!129124 () Bool)

(assert (=> d!64305 e!129124))

(declare-fun res!155412 () Bool)

(assert (=> d!64305 (=> (not res!155412) (not e!129124))))

(declare-fun lt!288318 () tuple2!16134)

(assert (=> d!64305 (= res!155412 (isPrefixOf!0 (_1!8712 lt!288318) (_2!8712 lt!288318)))))

(declare-fun lt!288308 () BitStream!7774)

(assert (=> d!64305 (= lt!288318 (tuple2!16135 lt!288308 (_2!8711 lt!287951)))))

(declare-fun lt!288309 () Unit!13335)

(declare-fun lt!288316 () Unit!13335)

(assert (=> d!64305 (= lt!288309 lt!288316)))

(assert (=> d!64305 (isPrefixOf!0 lt!288308 (_2!8711 lt!287951))))

(assert (=> d!64305 (= lt!288316 (lemmaIsPrefixTransitive!0 lt!288308 (_2!8711 lt!287951) (_2!8711 lt!287951)))))

(declare-fun lt!288322 () Unit!13335)

(declare-fun lt!288313 () Unit!13335)

(assert (=> d!64305 (= lt!288322 lt!288313)))

(assert (=> d!64305 (isPrefixOf!0 lt!288308 (_2!8711 lt!287951))))

(assert (=> d!64305 (= lt!288313 (lemmaIsPrefixTransitive!0 lt!288308 thiss!1204 (_2!8711 lt!287951)))))

(declare-fun lt!288319 () Unit!13335)

(assert (=> d!64305 (= lt!288319 e!129125)))

(declare-fun c!9509 () Bool)

(assert (=> d!64305 (= c!9509 (not (= (size!4333 (buf!4796 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!288306 () Unit!13335)

(declare-fun lt!288305 () Unit!13335)

(assert (=> d!64305 (= lt!288306 lt!288305)))

(assert (=> d!64305 (isPrefixOf!0 (_2!8711 lt!287951) (_2!8711 lt!287951))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7774) Unit!13335)

(assert (=> d!64305 (= lt!288305 (lemmaIsPrefixRefl!0 (_2!8711 lt!287951)))))

(declare-fun lt!288314 () Unit!13335)

(declare-fun lt!288312 () Unit!13335)

(assert (=> d!64305 (= lt!288314 lt!288312)))

(assert (=> d!64305 (= lt!288312 (lemmaIsPrefixRefl!0 (_2!8711 lt!287951)))))

(declare-fun lt!288324 () Unit!13335)

(declare-fun lt!288323 () Unit!13335)

(assert (=> d!64305 (= lt!288324 lt!288323)))

(assert (=> d!64305 (isPrefixOf!0 lt!288308 lt!288308)))

(assert (=> d!64305 (= lt!288323 (lemmaIsPrefixRefl!0 lt!288308))))

(declare-fun lt!288317 () Unit!13335)

(declare-fun lt!288320 () Unit!13335)

(assert (=> d!64305 (= lt!288317 lt!288320)))

(assert (=> d!64305 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64305 (= lt!288320 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64305 (= lt!288308 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(assert (=> d!64305 (isPrefixOf!0 thiss!1204 (_2!8711 lt!287951))))

(assert (=> d!64305 (= (reader!0 thiss!1204 (_2!8711 lt!287951)) lt!288318)))

(declare-fun b!186632 () Bool)

(declare-fun res!155411 () Bool)

(assert (=> b!186632 (=> (not res!155411) (not e!129124))))

(assert (=> b!186632 (= res!155411 (isPrefixOf!0 (_1!8712 lt!288318) thiss!1204))))

(declare-fun b!186633 () Bool)

(declare-fun res!155410 () Bool)

(assert (=> b!186633 (=> (not res!155410) (not e!129124))))

(assert (=> b!186633 (= res!155410 (isPrefixOf!0 (_2!8712 lt!288318) (_2!8711 lt!287951)))))

(declare-fun b!186634 () Bool)

(declare-fun Unit!13341 () Unit!13335)

(assert (=> b!186634 (= e!129125 Unit!13341)))

(declare-fun lt!288321 () (_ BitVec 64))

(declare-fun b!186635 () Bool)

(declare-fun lt!288315 () (_ BitVec 64))

(assert (=> b!186635 (= e!129124 (= (_1!8712 lt!288318) (withMovedBitIndex!0 (_2!8712 lt!288318) (bvsub lt!288321 lt!288315))))))

(assert (=> b!186635 (or (= (bvand lt!288321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288321 lt!288315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186635 (= lt!288315 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287951))) (currentByte!9046 (_2!8711 lt!287951)) (currentBit!9041 (_2!8711 lt!287951))))))

(assert (=> b!186635 (= lt!288321 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(assert (= (and d!64305 c!9509) b!186631))

(assert (= (and d!64305 (not c!9509)) b!186634))

(assert (= (and d!64305 res!155412) b!186632))

(assert (= (and b!186632 res!155411) b!186633))

(assert (= (and b!186633 res!155410) b!186635))

(declare-fun m!290133 () Bool)

(assert (=> b!186633 m!290133))

(assert (=> b!186631 m!289809))

(declare-fun m!290135 () Bool)

(assert (=> b!186631 m!290135))

(declare-fun m!290137 () Bool)

(assert (=> b!186631 m!290137))

(declare-fun m!290139 () Bool)

(assert (=> d!64305 m!290139))

(declare-fun m!290141 () Bool)

(assert (=> d!64305 m!290141))

(declare-fun m!290143 () Bool)

(assert (=> d!64305 m!290143))

(declare-fun m!290145 () Bool)

(assert (=> d!64305 m!290145))

(declare-fun m!290147 () Bool)

(assert (=> d!64305 m!290147))

(declare-fun m!290149 () Bool)

(assert (=> d!64305 m!290149))

(declare-fun m!290151 () Bool)

(assert (=> d!64305 m!290151))

(declare-fun m!290153 () Bool)

(assert (=> d!64305 m!290153))

(declare-fun m!290155 () Bool)

(assert (=> d!64305 m!290155))

(declare-fun m!290157 () Bool)

(assert (=> d!64305 m!290157))

(assert (=> d!64305 m!289863))

(declare-fun m!290159 () Bool)

(assert (=> b!186635 m!290159))

(assert (=> b!186635 m!289861))

(assert (=> b!186635 m!289809))

(declare-fun m!290161 () Bool)

(assert (=> b!186632 m!290161))

(assert (=> b!186422 d!64305))

(declare-fun d!64325 () Bool)

(declare-fun lt!288325 () tuple2!16158)

(assert (=> d!64325 (= lt!288325 (readBit!0 (_1!8712 lt!287962)))))

(assert (=> d!64325 (= (readBitPure!0 (_1!8712 lt!287962)) (tuple2!16139 (_2!8724 lt!288325) (_1!8724 lt!288325)))))

(declare-fun bs!16007 () Bool)

(assert (= bs!16007 d!64325))

(declare-fun m!290163 () Bool)

(assert (=> bs!16007 m!290163))

(assert (=> b!186422 d!64325))

(declare-fun b!186637 () Bool)

(declare-fun e!129128 () Unit!13335)

(declare-fun lt!288332 () Unit!13335)

(assert (=> b!186637 (= e!129128 lt!288332)))

(declare-fun lt!288328 () (_ BitVec 64))

(assert (=> b!186637 (= lt!288328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!288331 () (_ BitVec 64))

(assert (=> b!186637 (= lt!288331 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(assert (=> b!186637 (= lt!288332 (arrayBitRangesEqSymmetric!0 (buf!4796 (_2!8711 lt!287965)) (buf!4796 (_2!8711 lt!287951)) lt!288328 lt!288331))))

(assert (=> b!186637 (arrayBitRangesEq!0 (buf!4796 (_2!8711 lt!287951)) (buf!4796 (_2!8711 lt!287965)) lt!288328 lt!288331)))

(declare-fun d!64327 () Bool)

(declare-fun e!129127 () Bool)

(assert (=> d!64327 e!129127))

(declare-fun res!155416 () Bool)

(assert (=> d!64327 (=> (not res!155416) (not e!129127))))

(declare-fun lt!288339 () tuple2!16134)

(assert (=> d!64327 (= res!155416 (isPrefixOf!0 (_1!8712 lt!288339) (_2!8712 lt!288339)))))

(declare-fun lt!288329 () BitStream!7774)

(assert (=> d!64327 (= lt!288339 (tuple2!16135 lt!288329 (_2!8711 lt!287951)))))

(declare-fun lt!288330 () Unit!13335)

(declare-fun lt!288337 () Unit!13335)

(assert (=> d!64327 (= lt!288330 lt!288337)))

(assert (=> d!64327 (isPrefixOf!0 lt!288329 (_2!8711 lt!287951))))

(assert (=> d!64327 (= lt!288337 (lemmaIsPrefixTransitive!0 lt!288329 (_2!8711 lt!287951) (_2!8711 lt!287951)))))

(declare-fun lt!288343 () Unit!13335)

(declare-fun lt!288334 () Unit!13335)

(assert (=> d!64327 (= lt!288343 lt!288334)))

(assert (=> d!64327 (isPrefixOf!0 lt!288329 (_2!8711 lt!287951))))

(assert (=> d!64327 (= lt!288334 (lemmaIsPrefixTransitive!0 lt!288329 (_2!8711 lt!287965) (_2!8711 lt!287951)))))

(declare-fun lt!288340 () Unit!13335)

(assert (=> d!64327 (= lt!288340 e!129128)))

(declare-fun c!9510 () Bool)

(assert (=> d!64327 (= c!9510 (not (= (size!4333 (buf!4796 (_2!8711 lt!287965))) #b00000000000000000000000000000000)))))

(declare-fun lt!288327 () Unit!13335)

(declare-fun lt!288326 () Unit!13335)

(assert (=> d!64327 (= lt!288327 lt!288326)))

(assert (=> d!64327 (isPrefixOf!0 (_2!8711 lt!287951) (_2!8711 lt!287951))))

(assert (=> d!64327 (= lt!288326 (lemmaIsPrefixRefl!0 (_2!8711 lt!287951)))))

(declare-fun lt!288335 () Unit!13335)

(declare-fun lt!288333 () Unit!13335)

(assert (=> d!64327 (= lt!288335 lt!288333)))

(assert (=> d!64327 (= lt!288333 (lemmaIsPrefixRefl!0 (_2!8711 lt!287951)))))

(declare-fun lt!288345 () Unit!13335)

(declare-fun lt!288344 () Unit!13335)

(assert (=> d!64327 (= lt!288345 lt!288344)))

(assert (=> d!64327 (isPrefixOf!0 lt!288329 lt!288329)))

(assert (=> d!64327 (= lt!288344 (lemmaIsPrefixRefl!0 lt!288329))))

(declare-fun lt!288338 () Unit!13335)

(declare-fun lt!288341 () Unit!13335)

(assert (=> d!64327 (= lt!288338 lt!288341)))

(assert (=> d!64327 (isPrefixOf!0 (_2!8711 lt!287965) (_2!8711 lt!287965))))

(assert (=> d!64327 (= lt!288341 (lemmaIsPrefixRefl!0 (_2!8711 lt!287965)))))

(assert (=> d!64327 (= lt!288329 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(assert (=> d!64327 (isPrefixOf!0 (_2!8711 lt!287965) (_2!8711 lt!287951))))

(assert (=> d!64327 (= (reader!0 (_2!8711 lt!287965) (_2!8711 lt!287951)) lt!288339)))

(declare-fun b!186638 () Bool)

(declare-fun res!155415 () Bool)

(assert (=> b!186638 (=> (not res!155415) (not e!129127))))

(assert (=> b!186638 (= res!155415 (isPrefixOf!0 (_1!8712 lt!288339) (_2!8711 lt!287965)))))

(declare-fun b!186639 () Bool)

(declare-fun res!155414 () Bool)

(assert (=> b!186639 (=> (not res!155414) (not e!129127))))

(assert (=> b!186639 (= res!155414 (isPrefixOf!0 (_2!8712 lt!288339) (_2!8711 lt!287951)))))

(declare-fun b!186640 () Bool)

(declare-fun Unit!13342 () Unit!13335)

(assert (=> b!186640 (= e!129128 Unit!13342)))

(declare-fun lt!288342 () (_ BitVec 64))

(declare-fun b!186641 () Bool)

(declare-fun lt!288336 () (_ BitVec 64))

(assert (=> b!186641 (= e!129127 (= (_1!8712 lt!288339) (withMovedBitIndex!0 (_2!8712 lt!288339) (bvsub lt!288342 lt!288336))))))

(assert (=> b!186641 (or (= (bvand lt!288342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288342 lt!288336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186641 (= lt!288336 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287951))) (currentByte!9046 (_2!8711 lt!287951)) (currentBit!9041 (_2!8711 lt!287951))))))

(assert (=> b!186641 (= lt!288342 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(assert (= (and d!64327 c!9510) b!186637))

(assert (= (and d!64327 (not c!9510)) b!186640))

(assert (= (and d!64327 res!155416) b!186638))

(assert (= (and b!186638 res!155415) b!186639))

(assert (= (and b!186639 res!155414) b!186641))

(declare-fun m!290165 () Bool)

(assert (=> b!186639 m!290165))

(assert (=> b!186637 m!289807))

(declare-fun m!290167 () Bool)

(assert (=> b!186637 m!290167))

(declare-fun m!290169 () Bool)

(assert (=> b!186637 m!290169))

(declare-fun m!290171 () Bool)

(assert (=> d!64327 m!290171))

(declare-fun m!290173 () Bool)

(assert (=> d!64327 m!290173))

(assert (=> d!64327 m!290143))

(assert (=> d!64327 m!290145))

(declare-fun m!290175 () Bool)

(assert (=> d!64327 m!290175))

(declare-fun m!290177 () Bool)

(assert (=> d!64327 m!290177))

(declare-fun m!290179 () Bool)

(assert (=> d!64327 m!290179))

(declare-fun m!290181 () Bool)

(assert (=> d!64327 m!290181))

(declare-fun m!290183 () Bool)

(assert (=> d!64327 m!290183))

(declare-fun m!290185 () Bool)

(assert (=> d!64327 m!290185))

(assert (=> d!64327 m!289869))

(declare-fun m!290187 () Bool)

(assert (=> b!186641 m!290187))

(assert (=> b!186641 m!289861))

(assert (=> b!186641 m!289807))

(declare-fun m!290189 () Bool)

(assert (=> b!186638 m!290189))

(assert (=> b!186422 d!64327))

(declare-fun d!64329 () Bool)

(declare-fun e!129135 () Bool)

(assert (=> d!64329 e!129135))

(declare-fun res!155424 () Bool)

(assert (=> d!64329 (=> (not res!155424) (not e!129135))))

(declare-fun lt!288374 () tuple2!16138)

(declare-fun lt!288375 () tuple2!16138)

(assert (=> d!64329 (= res!155424 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!288374))) (currentByte!9046 (_1!8714 lt!288374)) (currentBit!9041 (_1!8714 lt!288374))) (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!288375))) (currentByte!9046 (_1!8714 lt!288375)) (currentBit!9041 (_1!8714 lt!288375)))))))

(declare-fun lt!288377 () Unit!13335)

(declare-fun lt!288376 () BitStream!7774)

(declare-fun choose!50 (BitStream!7774 BitStream!7774 BitStream!7774 tuple2!16138 tuple2!16138 BitStream!7774 Bool tuple2!16138 tuple2!16138 BitStream!7774 Bool) Unit!13335)

(assert (=> d!64329 (= lt!288377 (choose!50 lt!287974 (_2!8711 lt!287951) lt!288376 lt!288374 (tuple2!16139 (_1!8714 lt!288374) (_2!8714 lt!288374)) (_1!8714 lt!288374) (_2!8714 lt!288374) lt!288375 (tuple2!16139 (_1!8714 lt!288375) (_2!8714 lt!288375)) (_1!8714 lt!288375) (_2!8714 lt!288375)))))

(assert (=> d!64329 (= lt!288375 (readBitPure!0 lt!288376))))

(assert (=> d!64329 (= lt!288374 (readBitPure!0 lt!287974))))

(assert (=> d!64329 (= lt!288376 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 lt!287974) (currentBit!9041 lt!287974)))))

(assert (=> d!64329 (invariant!0 (currentBit!9041 lt!287974) (currentByte!9046 lt!287974) (size!4333 (buf!4796 (_2!8711 lt!287951))))))

(assert (=> d!64329 (= (readBitPrefixLemma!0 lt!287974 (_2!8711 lt!287951)) lt!288377)))

(declare-fun b!186649 () Bool)

(assert (=> b!186649 (= e!129135 (= (_2!8714 lt!288374) (_2!8714 lt!288375)))))

(assert (= (and d!64329 res!155424) b!186649))

(declare-fun m!290209 () Bool)

(assert (=> d!64329 m!290209))

(declare-fun m!290211 () Bool)

(assert (=> d!64329 m!290211))

(declare-fun m!290213 () Bool)

(assert (=> d!64329 m!290213))

(assert (=> d!64329 m!289847))

(declare-fun m!290215 () Bool)

(assert (=> d!64329 m!290215))

(declare-fun m!290217 () Bool)

(assert (=> d!64329 m!290217))

(assert (=> b!186422 d!64329))

(declare-fun d!64341 () Bool)

(assert (=> d!64341 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!287968)))

(declare-fun lt!288386 () Unit!13335)

(declare-fun choose!9 (BitStream!7774 array!9826 (_ BitVec 64) BitStream!7774) Unit!13335)

(assert (=> d!64341 (= lt!288386 (choose!9 (_2!8711 lt!287965) (buf!4796 (_2!8711 lt!287951)) lt!287968 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965)))))))

(assert (=> d!64341 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8711 lt!287965) (buf!4796 (_2!8711 lt!287951)) lt!287968) lt!288386)))

(declare-fun bs!16014 () Bool)

(assert (= bs!16014 d!64341))

(assert (=> bs!16014 m!289837))

(declare-fun m!290227 () Bool)

(assert (=> bs!16014 m!290227))

(assert (=> b!186422 d!64341))

(declare-fun d!64351 () Bool)

(assert (=> d!64351 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204)) lt!287956)))

(declare-fun lt!288387 () Unit!13335)

(assert (=> d!64351 (= lt!288387 (choose!9 thiss!1204 (buf!4796 (_2!8711 lt!287951)) lt!287956 (BitStream!7775 (buf!4796 (_2!8711 lt!287951)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204))))))

(assert (=> d!64351 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4796 (_2!8711 lt!287951)) lt!287956) lt!288387)))

(declare-fun bs!16015 () Bool)

(assert (= bs!16015 d!64351))

(assert (=> bs!16015 m!289835))

(declare-fun m!290229 () Bool)

(assert (=> bs!16015 m!290229))

(assert (=> b!186422 d!64351))

(declare-fun d!64353 () Bool)

(declare-fun e!129136 () Bool)

(assert (=> d!64353 e!129136))

(declare-fun res!155426 () Bool)

(assert (=> d!64353 (=> (not res!155426) (not e!129136))))

(declare-fun lt!288389 () (_ BitVec 64))

(declare-fun lt!288392 () (_ BitVec 64))

(declare-fun lt!288391 () (_ BitVec 64))

(assert (=> d!64353 (= res!155426 (= lt!288392 (bvsub lt!288391 lt!288389)))))

(assert (=> d!64353 (or (= (bvand lt!288391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288391 lt!288389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64353 (= lt!288389 (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287948)))) ((_ sign_extend 32) (currentByte!9046 (_1!8714 lt!287948))) ((_ sign_extend 32) (currentBit!9041 (_1!8714 lt!287948)))))))

(declare-fun lt!288390 () (_ BitVec 64))

(declare-fun lt!288393 () (_ BitVec 64))

(assert (=> d!64353 (= lt!288391 (bvmul lt!288390 lt!288393))))

(assert (=> d!64353 (or (= lt!288390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288393 (bvsdiv (bvmul lt!288390 lt!288393) lt!288390)))))

(assert (=> d!64353 (= lt!288393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64353 (= lt!288390 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287948)))))))

(assert (=> d!64353 (= lt!288392 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9046 (_1!8714 lt!287948))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9041 (_1!8714 lt!287948)))))))

(assert (=> d!64353 (invariant!0 (currentBit!9041 (_1!8714 lt!287948)) (currentByte!9046 (_1!8714 lt!287948)) (size!4333 (buf!4796 (_1!8714 lt!287948))))))

(assert (=> d!64353 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!287948))) (currentByte!9046 (_1!8714 lt!287948)) (currentBit!9041 (_1!8714 lt!287948))) lt!288392)))

(declare-fun b!186650 () Bool)

(declare-fun res!155425 () Bool)

(assert (=> b!186650 (=> (not res!155425) (not e!129136))))

(assert (=> b!186650 (= res!155425 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288392))))

(declare-fun b!186651 () Bool)

(declare-fun lt!288388 () (_ BitVec 64))

(assert (=> b!186651 (= e!129136 (bvsle lt!288392 (bvmul lt!288388 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186651 (or (= lt!288388 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288388 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288388)))))

(assert (=> b!186651 (= lt!288388 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287948)))))))

(assert (= (and d!64353 res!155426) b!186650))

(assert (= (and b!186650 res!155425) b!186651))

(declare-fun m!290231 () Bool)

(assert (=> d!64353 m!290231))

(declare-fun m!290233 () Bool)

(assert (=> d!64353 m!290233))

(assert (=> b!186422 d!64353))

(declare-fun d!64355 () Bool)

(assert (=> d!64355 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!287968) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965)))) lt!287968))))

(declare-fun bs!16016 () Bool)

(assert (= bs!16016 d!64355))

(declare-fun m!290235 () Bool)

(assert (=> bs!16016 m!290235))

(assert (=> b!186422 d!64355))

(declare-fun d!64357 () Bool)

(declare-fun e!129137 () Bool)

(assert (=> d!64357 e!129137))

(declare-fun res!155428 () Bool)

(assert (=> d!64357 (=> (not res!155428) (not e!129137))))

(declare-fun lt!288397 () (_ BitVec 64))

(declare-fun lt!288398 () (_ BitVec 64))

(declare-fun lt!288395 () (_ BitVec 64))

(assert (=> d!64357 (= res!155428 (= lt!288398 (bvsub lt!288397 lt!288395)))))

(assert (=> d!64357 (or (= (bvand lt!288397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288395 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288397 lt!288395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64357 (= lt!288395 (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287967)))) ((_ sign_extend 32) (currentByte!9046 (_1!8714 lt!287967))) ((_ sign_extend 32) (currentBit!9041 (_1!8714 lt!287967)))))))

(declare-fun lt!288396 () (_ BitVec 64))

(declare-fun lt!288399 () (_ BitVec 64))

(assert (=> d!64357 (= lt!288397 (bvmul lt!288396 lt!288399))))

(assert (=> d!64357 (or (= lt!288396 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288399 (bvsdiv (bvmul lt!288396 lt!288399) lt!288396)))))

(assert (=> d!64357 (= lt!288399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64357 (= lt!288396 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287967)))))))

(assert (=> d!64357 (= lt!288398 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9046 (_1!8714 lt!287967))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9041 (_1!8714 lt!287967)))))))

(assert (=> d!64357 (invariant!0 (currentBit!9041 (_1!8714 lt!287967)) (currentByte!9046 (_1!8714 lt!287967)) (size!4333 (buf!4796 (_1!8714 lt!287967))))))

(assert (=> d!64357 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!287967))) (currentByte!9046 (_1!8714 lt!287967)) (currentBit!9041 (_1!8714 lt!287967))) lt!288398)))

(declare-fun b!186652 () Bool)

(declare-fun res!155427 () Bool)

(assert (=> b!186652 (=> (not res!155427) (not e!129137))))

(assert (=> b!186652 (= res!155427 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288398))))

(declare-fun b!186653 () Bool)

(declare-fun lt!288394 () (_ BitVec 64))

(assert (=> b!186653 (= e!129137 (bvsle lt!288398 (bvmul lt!288394 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186653 (or (= lt!288394 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288394 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288394)))))

(assert (=> b!186653 (= lt!288394 ((_ sign_extend 32) (size!4333 (buf!4796 (_1!8714 lt!287967)))))))

(assert (= (and d!64357 res!155428) b!186652))

(assert (= (and b!186652 res!155427) b!186653))

(declare-fun m!290237 () Bool)

(assert (=> d!64357 m!290237))

(declare-fun m!290239 () Bool)

(assert (=> d!64357 m!290239))

(assert (=> b!186422 d!64357))

(declare-fun d!64359 () Bool)

(declare-fun lt!288400 () tuple2!16160)

(assert (=> d!64359 (= lt!288400 (readNBitsLSBFirstsLoop!0 (_1!8712 lt!287962) nBits!348 i!590 lt!287961))))

(assert (=> d!64359 (= (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!287962) nBits!348 i!590 lt!287961) (tuple2!16137 (_2!8725 lt!288400) (_1!8725 lt!288400)))))

(declare-fun bs!16017 () Bool)

(assert (= bs!16017 d!64359))

(declare-fun m!290241 () Bool)

(assert (=> bs!16017 m!290241))

(assert (=> b!186422 d!64359))

(declare-fun d!64361 () Bool)

(assert (=> d!64361 (= (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287965)))) (and (bvsge (currentBit!9041 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9041 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9046 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287965)))) (and (= (currentBit!9041 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287965))))))))))

(assert (=> b!186422 d!64361))

(declare-fun d!64363 () Bool)

(declare-fun lt!288401 () tuple2!16158)

(assert (=> d!64363 (= lt!288401 (readBit!0 lt!287974))))

(assert (=> d!64363 (= (readBitPure!0 lt!287974) (tuple2!16139 (_2!8724 lt!288401) (_1!8724 lt!288401)))))

(declare-fun bs!16018 () Bool)

(assert (= bs!16018 d!64363))

(declare-fun m!290243 () Bool)

(assert (=> bs!16018 m!290243))

(assert (=> b!186422 d!64363))

(declare-fun d!64365 () Bool)

(declare-fun res!155437 () Bool)

(declare-fun e!129143 () Bool)

(assert (=> d!64365 (=> (not res!155437) (not e!129143))))

(assert (=> d!64365 (= res!155437 (= (size!4333 (buf!4796 thiss!1204)) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(assert (=> d!64365 (= (isPrefixOf!0 thiss!1204 (_2!8711 lt!287965)) e!129143)))

(declare-fun b!186660 () Bool)

(declare-fun res!155436 () Bool)

(assert (=> b!186660 (=> (not res!155436) (not e!129143))))

(assert (=> b!186660 (= res!155436 (bvsle (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965)))))))

(declare-fun b!186661 () Bool)

(declare-fun e!129142 () Bool)

(assert (=> b!186661 (= e!129143 e!129142)))

(declare-fun res!155435 () Bool)

(assert (=> b!186661 (=> res!155435 e!129142)))

(assert (=> b!186661 (= res!155435 (= (size!4333 (buf!4796 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186662 () Bool)

(assert (=> b!186662 (= e!129142 (arrayBitRangesEq!0 (buf!4796 thiss!1204) (buf!4796 (_2!8711 lt!287965)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204))))))

(assert (= (and d!64365 res!155437) b!186660))

(assert (= (and b!186660 res!155436) b!186661))

(assert (= (and b!186661 (not res!155435)) b!186662))

(assert (=> b!186660 m!289809))

(assert (=> b!186660 m!289807))

(assert (=> b!186662 m!289809))

(assert (=> b!186662 m!289809))

(declare-fun m!290245 () Bool)

(assert (=> b!186662 m!290245))

(assert (=> b!186427 d!64365))

(declare-fun d!64367 () Bool)

(declare-fun lt!288402 () tuple2!16158)

(assert (=> d!64367 (= lt!288402 (readBit!0 (readerFrom!0 (_2!8711 lt!287965) (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204))))))

(assert (=> d!64367 (= (readBitPure!0 (readerFrom!0 (_2!8711 lt!287965) (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204))) (tuple2!16139 (_2!8724 lt!288402) (_1!8724 lt!288402)))))

(declare-fun bs!16019 () Bool)

(assert (= bs!16019 d!64367))

(assert (=> bs!16019 m!289871))

(declare-fun m!290247 () Bool)

(assert (=> bs!16019 m!290247))

(assert (=> b!186426 d!64367))

(declare-fun d!64369 () Bool)

(declare-fun e!129146 () Bool)

(assert (=> d!64369 e!129146))

(declare-fun res!155441 () Bool)

(assert (=> d!64369 (=> (not res!155441) (not e!129146))))

(assert (=> d!64369 (= res!155441 (invariant!0 (currentBit!9041 (_2!8711 lt!287965)) (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(assert (=> d!64369 (= (readerFrom!0 (_2!8711 lt!287965) (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204)) (BitStream!7775 (buf!4796 (_2!8711 lt!287965)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)))))

(declare-fun b!186665 () Bool)

(assert (=> b!186665 (= e!129146 (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287965)))))))

(assert (= (and d!64369 res!155441) b!186665))

(assert (=> d!64369 m!289813))

(assert (=> b!186665 m!289855))

(assert (=> b!186426 d!64369))

(declare-fun d!64371 () Bool)

(declare-fun e!129147 () Bool)

(assert (=> d!64371 e!129147))

(declare-fun res!155442 () Bool)

(assert (=> d!64371 (=> (not res!155442) (not e!129147))))

(declare-fun lt!288403 () BitStream!7774)

(declare-fun lt!288404 () (_ BitVec 64))

(assert (=> d!64371 (= res!155442 (= (bvadd lt!288404 (bvsub lt!287958 lt!287953)) (bitIndex!0 (size!4333 (buf!4796 lt!288403)) (currentByte!9046 lt!288403) (currentBit!9041 lt!288403))))))

(assert (=> d!64371 (or (not (= (bvand lt!288404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287958 lt!287953) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288404 (bvsub lt!287958 lt!287953)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64371 (= lt!288404 (bitIndex!0 (size!4333 (buf!4796 (_2!8712 lt!287962))) (currentByte!9046 (_2!8712 lt!287962)) (currentBit!9041 (_2!8712 lt!287962))))))

(assert (=> d!64371 (= lt!288403 (_2!8711 (moveBitIndex!0 (_2!8712 lt!287962) (bvsub lt!287958 lt!287953))))))

(assert (=> d!64371 (moveBitIndexPrecond!0 (_2!8712 lt!287962) (bvsub lt!287958 lt!287953))))

(assert (=> d!64371 (= (withMovedBitIndex!0 (_2!8712 lt!287962) (bvsub lt!287958 lt!287953)) lt!288403)))

(declare-fun b!186666 () Bool)

(assert (=> b!186666 (= e!129147 (= (size!4333 (buf!4796 (_2!8712 lt!287962))) (size!4333 (buf!4796 lt!288403))))))

(assert (= (and d!64371 res!155442) b!186666))

(declare-fun m!290249 () Bool)

(assert (=> d!64371 m!290249))

(declare-fun m!290251 () Bool)

(assert (=> d!64371 m!290251))

(declare-fun m!290253 () Bool)

(assert (=> d!64371 m!290253))

(declare-fun m!290255 () Bool)

(assert (=> d!64371 m!290255))

(assert (=> b!186436 d!64371))

(declare-fun d!64373 () Bool)

(assert (=> d!64373 (= (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287951)))) (and (bvsge (currentBit!9041 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9041 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9046 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287951)))) (and (= (currentBit!9041 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9046 thiss!1204) (size!4333 (buf!4796 (_2!8711 lt!287951))))))))))

(assert (=> b!186419 d!64373))

(declare-fun d!64375 () Bool)

(assert (=> d!64375 (= (array_inv!4074 (buf!4796 thiss!1204)) (bvsge (size!4333 (buf!4796 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!186429 d!64375))

(declare-fun d!64377 () Bool)

(assert (=> d!64377 (= (invariant!0 (currentBit!9041 thiss!1204) (currentByte!9046 thiss!1204) (size!4333 (buf!4796 thiss!1204))) (and (bvsge (currentBit!9041 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9041 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9046 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9046 thiss!1204) (size!4333 (buf!4796 thiss!1204))) (and (= (currentBit!9041 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9046 thiss!1204) (size!4333 (buf!4796 thiss!1204)))))))))

(assert (=> b!186418 d!64377))

(declare-fun d!64379 () Bool)

(declare-fun e!129148 () Bool)

(assert (=> d!64379 e!129148))

(declare-fun res!155444 () Bool)

(assert (=> d!64379 (=> (not res!155444) (not e!129148))))

(declare-fun lt!288406 () (_ BitVec 64))

(declare-fun lt!288408 () (_ BitVec 64))

(declare-fun lt!288409 () (_ BitVec 64))

(assert (=> d!64379 (= res!155444 (= lt!288409 (bvsub lt!288408 lt!288406)))))

(assert (=> d!64379 (or (= (bvand lt!288408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288408 lt!288406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64379 (= lt!288406 (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287951))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287951)))))))

(declare-fun lt!288407 () (_ BitVec 64))

(declare-fun lt!288410 () (_ BitVec 64))

(assert (=> d!64379 (= lt!288408 (bvmul lt!288407 lt!288410))))

(assert (=> d!64379 (or (= lt!288407 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288410 (bvsdiv (bvmul lt!288407 lt!288410) lt!288407)))))

(assert (=> d!64379 (= lt!288410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64379 (= lt!288407 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))))))

(assert (=> d!64379 (= lt!288409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287951))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287951)))))))

(assert (=> d!64379 (invariant!0 (currentBit!9041 (_2!8711 lt!287951)) (currentByte!9046 (_2!8711 lt!287951)) (size!4333 (buf!4796 (_2!8711 lt!287951))))))

(assert (=> d!64379 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287951))) (currentByte!9046 (_2!8711 lt!287951)) (currentBit!9041 (_2!8711 lt!287951))) lt!288409)))

(declare-fun b!186667 () Bool)

(declare-fun res!155443 () Bool)

(assert (=> b!186667 (=> (not res!155443) (not e!129148))))

(assert (=> b!186667 (= res!155443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288409))))

(declare-fun b!186668 () Bool)

(declare-fun lt!288405 () (_ BitVec 64))

(assert (=> b!186668 (= e!129148 (bvsle lt!288409 (bvmul lt!288405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186668 (or (= lt!288405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288405)))))

(assert (=> b!186668 (= lt!288405 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287951)))))))

(assert (= (and d!64379 res!155444) b!186667))

(assert (= (and b!186667 res!155443) b!186668))

(declare-fun m!290257 () Bool)

(assert (=> d!64379 m!290257))

(assert (=> d!64379 m!289825))

(assert (=> b!186428 d!64379))

(declare-fun d!64381 () Bool)

(declare-fun res!155447 () Bool)

(declare-fun e!129150 () Bool)

(assert (=> d!64381 (=> (not res!155447) (not e!129150))))

(assert (=> d!64381 (= res!155447 (= (size!4333 (buf!4796 thiss!1204)) (size!4333 (buf!4796 (_2!8711 lt!287951)))))))

(assert (=> d!64381 (= (isPrefixOf!0 thiss!1204 (_2!8711 lt!287951)) e!129150)))

(declare-fun b!186669 () Bool)

(declare-fun res!155446 () Bool)

(assert (=> b!186669 (=> (not res!155446) (not e!129150))))

(assert (=> b!186669 (= res!155446 (bvsle (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204)) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287951))) (currentByte!9046 (_2!8711 lt!287951)) (currentBit!9041 (_2!8711 lt!287951)))))))

(declare-fun b!186670 () Bool)

(declare-fun e!129149 () Bool)

(assert (=> b!186670 (= e!129150 e!129149)))

(declare-fun res!155445 () Bool)

(assert (=> b!186670 (=> res!155445 e!129149)))

(assert (=> b!186670 (= res!155445 (= (size!4333 (buf!4796 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186671 () Bool)

(assert (=> b!186671 (= e!129149 (arrayBitRangesEq!0 (buf!4796 thiss!1204) (buf!4796 (_2!8711 lt!287951)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4333 (buf!4796 thiss!1204)) (currentByte!9046 thiss!1204) (currentBit!9041 thiss!1204))))))

(assert (= (and d!64381 res!155447) b!186669))

(assert (= (and b!186669 res!155446) b!186670))

(assert (= (and b!186670 (not res!155445)) b!186671))

(assert (=> b!186669 m!289809))

(assert (=> b!186669 m!289861))

(assert (=> b!186671 m!289809))

(assert (=> b!186671 m!289809))

(declare-fun m!290259 () Bool)

(assert (=> b!186671 m!290259))

(assert (=> b!186428 d!64381))

(declare-fun d!64383 () Bool)

(assert (=> d!64383 (isPrefixOf!0 thiss!1204 (_2!8711 lt!287951))))

(declare-fun lt!288413 () Unit!13335)

(declare-fun choose!30 (BitStream!7774 BitStream!7774 BitStream!7774) Unit!13335)

(assert (=> d!64383 (= lt!288413 (choose!30 thiss!1204 (_2!8711 lt!287965) (_2!8711 lt!287951)))))

(assert (=> d!64383 (isPrefixOf!0 thiss!1204 (_2!8711 lt!287965))))

(assert (=> d!64383 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8711 lt!287965) (_2!8711 lt!287951)) lt!288413)))

(declare-fun bs!16020 () Bool)

(assert (= bs!16020 d!64383))

(assert (=> bs!16020 m!289863))

(declare-fun m!290261 () Bool)

(assert (=> bs!16020 m!290261))

(assert (=> bs!16020 m!289875))

(assert (=> b!186428 d!64383))

(declare-fun b!186749 () Bool)

(declare-fun e!129195 () Bool)

(declare-fun lt!288703 () tuple2!16138)

(declare-fun lt!288708 () tuple2!16138)

(assert (=> b!186749 (= e!129195 (= (_2!8714 lt!288703) (_2!8714 lt!288708)))))

(declare-fun b!186750 () Bool)

(declare-fun e!129193 () Bool)

(declare-fun e!129199 () Bool)

(assert (=> b!186750 (= e!129193 e!129199)))

(declare-fun res!155505 () Bool)

(assert (=> b!186750 (=> (not res!155505) (not e!129199))))

(declare-fun lt!288700 () tuple2!16136)

(assert (=> b!186750 (= res!155505 (= (_2!8713 lt!288700) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!288689 () tuple2!16134)

(assert (=> b!186750 (= lt!288700 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!288689) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!288736 () Unit!13335)

(declare-fun lt!288722 () Unit!13335)

(assert (=> b!186750 (= lt!288736 lt!288722)))

(declare-fun lt!288741 () tuple2!16132)

(declare-fun lt!288693 () (_ BitVec 64))

(assert (=> b!186750 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!288741)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!288693)))

(assert (=> b!186750 (= lt!288722 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8711 lt!287965) (buf!4796 (_2!8711 lt!288741)) lt!288693))))

(declare-fun e!129196 () Bool)

(assert (=> b!186750 e!129196))

(declare-fun res!155502 () Bool)

(assert (=> b!186750 (=> (not res!155502) (not e!129196))))

(assert (=> b!186750 (= res!155502 (and (= (size!4333 (buf!4796 (_2!8711 lt!287965))) (size!4333 (buf!4796 (_2!8711 lt!288741)))) (bvsge lt!288693 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186750 (= lt!288693 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!186750 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!186750 (= lt!288689 (reader!0 (_2!8711 lt!287965) (_2!8711 lt!288741)))))

(declare-fun b!186751 () Bool)

(declare-fun res!155508 () Bool)

(declare-fun call!2999 () Bool)

(assert (=> b!186751 (= res!155508 call!2999)))

(declare-fun e!129197 () Bool)

(assert (=> b!186751 (=> (not res!155508) (not e!129197))))

(declare-fun b!186752 () Bool)

(assert (=> b!186752 (= e!129199 (= (_1!8713 lt!288700) (_2!8712 lt!288689)))))

(declare-fun b!186753 () Bool)

(declare-fun e!129198 () Bool)

(declare-fun lt!288734 () tuple2!16138)

(declare-fun lt!288695 () tuple2!16132)

(assert (=> b!186753 (= e!129198 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!288734))) (currentByte!9046 (_1!8714 lt!288734)) (currentBit!9041 (_1!8714 lt!288734))) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288695))) (currentByte!9046 (_2!8711 lt!288695)) (currentBit!9041 (_2!8711 lt!288695)))))))

(declare-fun b!186754 () Bool)

(declare-fun e!129191 () tuple2!16132)

(declare-fun lt!288692 () tuple2!16132)

(assert (=> b!186754 (= e!129191 (tuple2!16133 (_1!8711 lt!288692) (_2!8711 lt!288692)))))

(declare-fun lt!288709 () Bool)

(assert (=> b!186754 (= lt!288709 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186754 (= lt!288695 (appendBit!0 (_2!8711 lt!287965) lt!288709))))

(declare-fun res!155507 () Bool)

(assert (=> b!186754 (= res!155507 (= (size!4333 (buf!4796 (_2!8711 lt!287965))) (size!4333 (buf!4796 (_2!8711 lt!288695)))))))

(assert (=> b!186754 (=> (not res!155507) (not e!129197))))

(assert (=> b!186754 e!129197))

(declare-fun lt!288730 () tuple2!16132)

(assert (=> b!186754 (= lt!288730 lt!288695)))

(assert (=> b!186754 (= lt!288692 (appendBitsLSBFirstLoopTR!0 (_2!8711 lt!288730) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!288718 () Unit!13335)

(assert (=> b!186754 (= lt!288718 (lemmaIsPrefixTransitive!0 (_2!8711 lt!287965) (_2!8711 lt!288730) (_2!8711 lt!288692)))))

(assert (=> b!186754 (isPrefixOf!0 (_2!8711 lt!287965) (_2!8711 lt!288692))))

(declare-fun lt!288717 () Unit!13335)

(assert (=> b!186754 (= lt!288717 lt!288718)))

(assert (=> b!186754 (invariant!0 (currentBit!9041 (_2!8711 lt!287965)) (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!288730))))))

(declare-fun lt!288743 () BitStream!7774)

(assert (=> b!186754 (= lt!288743 (BitStream!7775 (buf!4796 (_2!8711 lt!288730)) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(assert (=> b!186754 (invariant!0 (currentBit!9041 lt!288743) (currentByte!9046 lt!288743) (size!4333 (buf!4796 (_2!8711 lt!288692))))))

(declare-fun lt!288698 () BitStream!7774)

(assert (=> b!186754 (= lt!288698 (BitStream!7775 (buf!4796 (_2!8711 lt!288692)) (currentByte!9046 lt!288743) (currentBit!9041 lt!288743)))))

(assert (=> b!186754 (= lt!288703 (readBitPure!0 lt!288743))))

(assert (=> b!186754 (= lt!288708 (readBitPure!0 lt!288698))))

(declare-fun lt!288712 () Unit!13335)

(assert (=> b!186754 (= lt!288712 (readBitPrefixLemma!0 lt!288743 (_2!8711 lt!288692)))))

(declare-fun res!155501 () Bool)

(assert (=> b!186754 (= res!155501 (= (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!288703))) (currentByte!9046 (_1!8714 lt!288703)) (currentBit!9041 (_1!8714 lt!288703))) (bitIndex!0 (size!4333 (buf!4796 (_1!8714 lt!288708))) (currentByte!9046 (_1!8714 lt!288708)) (currentBit!9041 (_1!8714 lt!288708)))))))

(assert (=> b!186754 (=> (not res!155501) (not e!129195))))

(assert (=> b!186754 e!129195))

(declare-fun lt!288726 () Unit!13335)

(assert (=> b!186754 (= lt!288726 lt!288712)))

(declare-fun lt!288691 () tuple2!16134)

(assert (=> b!186754 (= lt!288691 (reader!0 (_2!8711 lt!287965) (_2!8711 lt!288692)))))

(declare-fun lt!288715 () tuple2!16134)

(assert (=> b!186754 (= lt!288715 (reader!0 (_2!8711 lt!288730) (_2!8711 lt!288692)))))

(declare-fun lt!288719 () tuple2!16138)

(assert (=> b!186754 (= lt!288719 (readBitPure!0 (_1!8712 lt!288691)))))

(assert (=> b!186754 (= (_2!8714 lt!288719) lt!288709)))

(declare-fun lt!288727 () Unit!13335)

(declare-fun Unit!13344 () Unit!13335)

(assert (=> b!186754 (= lt!288727 Unit!13344)))

(declare-fun lt!288701 () (_ BitVec 64))

(assert (=> b!186754 (= lt!288701 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288740 () (_ BitVec 64))

(assert (=> b!186754 (= lt!288740 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288733 () Unit!13335)

(assert (=> b!186754 (= lt!288733 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8711 lt!287965) (buf!4796 (_2!8711 lt!288692)) lt!288740))))

(assert (=> b!186754 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!288692)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!288740)))

(declare-fun lt!288702 () Unit!13335)

(assert (=> b!186754 (= lt!288702 lt!288733)))

(declare-fun lt!288732 () tuple2!16136)

(assert (=> b!186754 (= lt!288732 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!288691) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288701))))

(declare-fun lt!288707 () (_ BitVec 64))

(assert (=> b!186754 (= lt!288707 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!288711 () Unit!13335)

(assert (=> b!186754 (= lt!288711 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8711 lt!288730) (buf!4796 (_2!8711 lt!288692)) lt!288707))))

(assert (=> b!186754 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!288692)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!288730))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!288730))) lt!288707)))

(declare-fun lt!288699 () Unit!13335)

(assert (=> b!186754 (= lt!288699 lt!288711)))

(declare-fun lt!288728 () tuple2!16136)

(assert (=> b!186754 (= lt!288728 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!288715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!288701 (ite (_2!8714 lt!288719) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!288714 () tuple2!16136)

(assert (=> b!186754 (= lt!288714 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!288691) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288701))))

(declare-fun c!9524 () Bool)

(assert (=> b!186754 (= c!9524 (_2!8714 (readBitPure!0 (_1!8712 lt!288691))))))

(declare-fun e!129194 () (_ BitVec 64))

(declare-fun lt!288723 () tuple2!16136)

(assert (=> b!186754 (= lt!288723 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8712 lt!288691) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!288701 e!129194)))))

(declare-fun lt!288725 () Unit!13335)

(assert (=> b!186754 (= lt!288725 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8712 lt!288691) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288701))))

(assert (=> b!186754 (and (= (_2!8713 lt!288714) (_2!8713 lt!288723)) (= (_1!8713 lt!288714) (_1!8713 lt!288723)))))

(declare-fun lt!288735 () Unit!13335)

(assert (=> b!186754 (= lt!288735 lt!288725)))

(assert (=> b!186754 (= (_1!8712 lt!288691) (withMovedBitIndex!0 (_2!8712 lt!288691) (bvsub (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288692))) (currentByte!9046 (_2!8711 lt!288692)) (currentBit!9041 (_2!8711 lt!288692))))))))

(declare-fun lt!288690 () Unit!13335)

(declare-fun Unit!13345 () Unit!13335)

(assert (=> b!186754 (= lt!288690 Unit!13345)))

(assert (=> b!186754 (= (_1!8712 lt!288715) (withMovedBitIndex!0 (_2!8712 lt!288715) (bvsub (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288730))) (currentByte!9046 (_2!8711 lt!288730)) (currentBit!9041 (_2!8711 lt!288730))) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288692))) (currentByte!9046 (_2!8711 lt!288692)) (currentBit!9041 (_2!8711 lt!288692))))))))

(declare-fun lt!288739 () Unit!13335)

(declare-fun Unit!13346 () Unit!13335)

(assert (=> b!186754 (= lt!288739 Unit!13346)))

(assert (=> b!186754 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))) (bvsub (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288730))) (currentByte!9046 (_2!8711 lt!288730)) (currentBit!9041 (_2!8711 lt!288730))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!288696 () Unit!13335)

(declare-fun Unit!13347 () Unit!13335)

(assert (=> b!186754 (= lt!288696 Unit!13347)))

(assert (=> b!186754 (= (_2!8713 lt!288732) (_2!8713 lt!288728))))

(declare-fun lt!288724 () Unit!13335)

(declare-fun Unit!13348 () Unit!13335)

(assert (=> b!186754 (= lt!288724 Unit!13348)))

(assert (=> b!186754 (invariant!0 (currentBit!9041 (_2!8711 lt!288692)) (currentByte!9046 (_2!8711 lt!288692)) (size!4333 (buf!4796 (_2!8711 lt!288692))))))

(declare-fun lt!288688 () Unit!13335)

(declare-fun Unit!13349 () Unit!13335)

(assert (=> b!186754 (= lt!288688 Unit!13349)))

(assert (=> b!186754 (= (size!4333 (buf!4796 (_2!8711 lt!287965))) (size!4333 (buf!4796 (_2!8711 lt!288692))))))

(declare-fun lt!288705 () Unit!13335)

(declare-fun Unit!13350 () Unit!13335)

(assert (=> b!186754 (= lt!288705 Unit!13350)))

(assert (=> b!186754 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288692))) (currentByte!9046 (_2!8711 lt!288692)) (currentBit!9041 (_2!8711 lt!288692))) (bvsub (bvadd (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288729 () Unit!13335)

(declare-fun Unit!13351 () Unit!13335)

(assert (=> b!186754 (= lt!288729 Unit!13351)))

(declare-fun lt!288731 () Unit!13335)

(declare-fun Unit!13352 () Unit!13335)

(assert (=> b!186754 (= lt!288731 Unit!13352)))

(declare-fun lt!288706 () tuple2!16134)

(assert (=> b!186754 (= lt!288706 (reader!0 (_2!8711 lt!287965) (_2!8711 lt!288692)))))

(declare-fun lt!288710 () (_ BitVec 64))

(assert (=> b!186754 (= lt!288710 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288704 () Unit!13335)

(assert (=> b!186754 (= lt!288704 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8711 lt!287965) (buf!4796 (_2!8711 lt!288692)) lt!288710))))

(assert (=> b!186754 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!288692)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!288710)))

(declare-fun lt!288694 () Unit!13335)

(assert (=> b!186754 (= lt!288694 lt!288704)))

(declare-fun lt!288737 () tuple2!16136)

(assert (=> b!186754 (= lt!288737 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!288706) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!155506 () Bool)

(assert (=> b!186754 (= res!155506 (= (_2!8713 lt!288737) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!129192 () Bool)

(assert (=> b!186754 (=> (not res!155506) (not e!129192))))

(assert (=> b!186754 e!129192))

(declare-fun lt!288742 () Unit!13335)

(declare-fun Unit!13353 () Unit!13335)

(assert (=> b!186754 (= lt!288742 Unit!13353)))

(declare-fun b!186755 () Bool)

(assert (=> b!186755 (= e!129194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!186756 () Bool)

(declare-fun res!155510 () Bool)

(assert (=> b!186756 (=> (not res!155510) (not e!129193))))

(assert (=> b!186756 (= res!155510 (= (size!4333 (buf!4796 (_2!8711 lt!287965))) (size!4333 (buf!4796 (_2!8711 lt!288741)))))))

(declare-fun b!186757 () Bool)

(assert (=> b!186757 (= e!129196 (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 (_2!8711 lt!287965)))) ((_ sign_extend 32) (currentByte!9046 (_2!8711 lt!287965))) ((_ sign_extend 32) (currentBit!9041 (_2!8711 lt!287965))) lt!288693))))

(declare-fun d!64385 () Bool)

(assert (=> d!64385 e!129193))

(declare-fun res!155504 () Bool)

(assert (=> d!64385 (=> (not res!155504) (not e!129193))))

(assert (=> d!64385 (= res!155504 (invariant!0 (currentBit!9041 (_2!8711 lt!288741)) (currentByte!9046 (_2!8711 lt!288741)) (size!4333 (buf!4796 (_2!8711 lt!288741)))))))

(assert (=> d!64385 (= lt!288741 e!129191)))

(declare-fun c!9523 () Bool)

(assert (=> d!64385 (= c!9523 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64385 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64385 (= (appendBitsLSBFirstLoopTR!0 (_2!8711 lt!287965) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!288741)))

(declare-fun bm!2996 () Bool)

(assert (=> bm!2996 (= call!2999 (isPrefixOf!0 (_2!8711 lt!287965) (ite c!9523 (_2!8711 lt!287965) (_2!8711 lt!288695))))))

(declare-fun b!186758 () Bool)

(assert (=> b!186758 (= e!129192 (= (_1!8713 lt!288737) (_2!8712 lt!288706)))))

(declare-fun b!186759 () Bool)

(declare-fun res!155509 () Bool)

(assert (=> b!186759 (=> (not res!155509) (not e!129193))))

(assert (=> b!186759 (= res!155509 (isPrefixOf!0 (_2!8711 lt!287965) (_2!8711 lt!288741)))))

(declare-fun b!186760 () Bool)

(assert (=> b!186760 (= lt!288734 (readBitPure!0 (readerFrom!0 (_2!8711 lt!288695) (currentBit!9041 (_2!8711 lt!287965)) (currentByte!9046 (_2!8711 lt!287965)))))))

(declare-fun res!155503 () Bool)

(assert (=> b!186760 (= res!155503 (and (= (_2!8714 lt!288734) lt!288709) (= (_1!8714 lt!288734) (_2!8711 lt!288695))))))

(assert (=> b!186760 (=> (not res!155503) (not e!129198))))

(assert (=> b!186760 (= e!129197 e!129198)))

(declare-fun b!186761 () Bool)

(declare-fun res!155511 () Bool)

(assert (=> b!186761 (=> (not res!155511) (not e!129193))))

(declare-fun lt!288720 () (_ BitVec 64))

(declare-fun lt!288738 () (_ BitVec 64))

(assert (=> b!186761 (= res!155511 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288741))) (currentByte!9046 (_2!8711 lt!288741)) (currentBit!9041 (_2!8711 lt!288741))) (bvsub lt!288720 lt!288738)))))

(assert (=> b!186761 (or (= (bvand lt!288720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288720 lt!288738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186761 (= lt!288738 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!288713 () (_ BitVec 64))

(declare-fun lt!288716 () (_ BitVec 64))

(assert (=> b!186761 (= lt!288720 (bvadd lt!288713 lt!288716))))

(assert (=> b!186761 (or (not (= (bvand lt!288713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288716 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288713 lt!288716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186761 (= lt!288716 ((_ sign_extend 32) nBits!348))))

(assert (=> b!186761 (= lt!288713 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))))))

(declare-fun b!186762 () Bool)

(assert (=> b!186762 (= e!129194 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!186763 () Bool)

(declare-fun res!155512 () Bool)

(assert (=> b!186763 (= res!155512 (= (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!288695))) (currentByte!9046 (_2!8711 lt!288695)) (currentBit!9041 (_2!8711 lt!288695))) (bvadd (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!186763 (=> (not res!155512) (not e!129197))))

(declare-fun b!186764 () Bool)

(declare-fun Unit!13355 () Unit!13335)

(assert (=> b!186764 (= e!129191 (tuple2!16133 Unit!13355 (_2!8711 lt!287965)))))

(declare-fun lt!288721 () Unit!13335)

(assert (=> b!186764 (= lt!288721 (lemmaIsPrefixRefl!0 (_2!8711 lt!287965)))))

(assert (=> b!186764 call!2999))

(declare-fun lt!288697 () Unit!13335)

(assert (=> b!186764 (= lt!288697 lt!288721)))

(assert (= (and d!64385 c!9523) b!186764))

(assert (= (and d!64385 (not c!9523)) b!186754))

(assert (= (and b!186754 res!155507) b!186763))

(assert (= (and b!186763 res!155512) b!186751))

(assert (= (and b!186751 res!155508) b!186760))

(assert (= (and b!186760 res!155503) b!186753))

(assert (= (and b!186754 res!155501) b!186749))

(assert (= (and b!186754 c!9524) b!186762))

(assert (= (and b!186754 (not c!9524)) b!186755))

(assert (= (and b!186754 res!155506) b!186758))

(assert (= (or b!186764 b!186751) bm!2996))

(assert (= (and d!64385 res!155504) b!186756))

(assert (= (and b!186756 res!155510) b!186761))

(assert (= (and b!186761 res!155511) b!186759))

(assert (= (and b!186759 res!155509) b!186750))

(assert (= (and b!186750 res!155502) b!186757))

(assert (= (and b!186750 res!155505) b!186752))

(assert (=> b!186764 m!290183))

(declare-fun m!290335 () Bool)

(assert (=> b!186763 m!290335))

(assert (=> b!186763 m!289807))

(declare-fun m!290337 () Bool)

(assert (=> bm!2996 m!290337))

(declare-fun m!290339 () Bool)

(assert (=> b!186754 m!290339))

(declare-fun m!290341 () Bool)

(assert (=> b!186754 m!290341))

(declare-fun m!290343 () Bool)

(assert (=> b!186754 m!290343))

(declare-fun m!290345 () Bool)

(assert (=> b!186754 m!290345))

(declare-fun m!290347 () Bool)

(assert (=> b!186754 m!290347))

(declare-fun m!290349 () Bool)

(assert (=> b!186754 m!290349))

(assert (=> b!186754 m!289807))

(declare-fun m!290351 () Bool)

(assert (=> b!186754 m!290351))

(declare-fun m!290353 () Bool)

(assert (=> b!186754 m!290353))

(declare-fun m!290355 () Bool)

(assert (=> b!186754 m!290355))

(declare-fun m!290357 () Bool)

(assert (=> b!186754 m!290357))

(declare-fun m!290359 () Bool)

(assert (=> b!186754 m!290359))

(declare-fun m!290361 () Bool)

(assert (=> b!186754 m!290361))

(assert (=> b!186754 m!290351))

(declare-fun m!290363 () Bool)

(assert (=> b!186754 m!290363))

(declare-fun m!290365 () Bool)

(assert (=> b!186754 m!290365))

(declare-fun m!290367 () Bool)

(assert (=> b!186754 m!290367))

(declare-fun m!290369 () Bool)

(assert (=> b!186754 m!290369))

(declare-fun m!290371 () Bool)

(assert (=> b!186754 m!290371))

(declare-fun m!290373 () Bool)

(assert (=> b!186754 m!290373))

(declare-fun m!290375 () Bool)

(assert (=> b!186754 m!290375))

(declare-fun m!290377 () Bool)

(assert (=> b!186754 m!290377))

(declare-fun m!290379 () Bool)

(assert (=> b!186754 m!290379))

(declare-fun m!290381 () Bool)

(assert (=> b!186754 m!290381))

(declare-fun m!290383 () Bool)

(assert (=> b!186754 m!290383))

(declare-fun m!290385 () Bool)

(assert (=> b!186754 m!290385))

(declare-fun m!290387 () Bool)

(assert (=> b!186754 m!290387))

(declare-fun m!290389 () Bool)

(assert (=> b!186754 m!290389))

(declare-fun m!290391 () Bool)

(assert (=> b!186754 m!290391))

(declare-fun m!290393 () Bool)

(assert (=> b!186754 m!290393))

(declare-fun m!290395 () Bool)

(assert (=> b!186754 m!290395))

(declare-fun m!290397 () Bool)

(assert (=> b!186754 m!290397))

(declare-fun m!290399 () Bool)

(assert (=> b!186754 m!290399))

(declare-fun m!290401 () Bool)

(assert (=> b!186754 m!290401))

(declare-fun m!290403 () Bool)

(assert (=> b!186754 m!290403))

(assert (=> b!186750 m!290367))

(declare-fun m!290405 () Bool)

(assert (=> b!186750 m!290405))

(assert (=> b!186750 m!290349))

(declare-fun m!290411 () Bool)

(assert (=> b!186750 m!290411))

(declare-fun m!290413 () Bool)

(assert (=> b!186750 m!290413))

(declare-fun m!290415 () Bool)

(assert (=> b!186750 m!290415))

(declare-fun m!290417 () Bool)

(assert (=> d!64385 m!290417))

(declare-fun m!290419 () Bool)

(assert (=> b!186761 m!290419))

(assert (=> b!186761 m!289807))

(declare-fun m!290421 () Bool)

(assert (=> b!186759 m!290421))

(declare-fun m!290423 () Bool)

(assert (=> b!186760 m!290423))

(assert (=> b!186760 m!290423))

(declare-fun m!290425 () Bool)

(assert (=> b!186760 m!290425))

(declare-fun m!290427 () Bool)

(assert (=> b!186753 m!290427))

(assert (=> b!186753 m!290335))

(declare-fun m!290429 () Bool)

(assert (=> b!186757 m!290429))

(assert (=> b!186428 d!64385))

(declare-fun d!64411 () Bool)

(declare-fun res!155535 () Bool)

(declare-fun e!129212 () Bool)

(assert (=> d!64411 (=> (not res!155535) (not e!129212))))

(assert (=> d!64411 (= res!155535 (= (size!4333 (buf!4796 (_2!8711 lt!287965))) (size!4333 (buf!4796 (_2!8711 lt!287951)))))))

(assert (=> d!64411 (= (isPrefixOf!0 (_2!8711 lt!287965) (_2!8711 lt!287951)) e!129212)))

(declare-fun b!186785 () Bool)

(declare-fun res!155534 () Bool)

(assert (=> b!186785 (=> (not res!155534) (not e!129212))))

(assert (=> b!186785 (= res!155534 (bvsle (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965))) (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287951))) (currentByte!9046 (_2!8711 lt!287951)) (currentBit!9041 (_2!8711 lt!287951)))))))

(declare-fun b!186786 () Bool)

(declare-fun e!129211 () Bool)

(assert (=> b!186786 (= e!129212 e!129211)))

(declare-fun res!155533 () Bool)

(assert (=> b!186786 (=> res!155533 e!129211)))

(assert (=> b!186786 (= res!155533 (= (size!4333 (buf!4796 (_2!8711 lt!287965))) #b00000000000000000000000000000000))))

(declare-fun b!186787 () Bool)

(assert (=> b!186787 (= e!129211 (arrayBitRangesEq!0 (buf!4796 (_2!8711 lt!287965)) (buf!4796 (_2!8711 lt!287951)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4333 (buf!4796 (_2!8711 lt!287965))) (currentByte!9046 (_2!8711 lt!287965)) (currentBit!9041 (_2!8711 lt!287965)))))))

(assert (= (and d!64411 res!155535) b!186785))

(assert (= (and b!186785 res!155534) b!186786))

(assert (= (and b!186786 (not res!155533)) b!186787))

(assert (=> b!186785 m!289807))

(assert (=> b!186785 m!289861))

(assert (=> b!186787 m!289807))

(assert (=> b!186787 m!289807))

(declare-fun m!290431 () Bool)

(assert (=> b!186787 m!290431))

(assert (=> b!186432 d!64411))

(declare-fun d!64413 () Bool)

(assert (=> d!64413 (= (invariant!0 (currentBit!9041 (_2!8711 lt!287951)) (currentByte!9046 (_2!8711 lt!287951)) (size!4333 (buf!4796 (_2!8711 lt!287951)))) (and (bvsge (currentBit!9041 (_2!8711 lt!287951)) #b00000000000000000000000000000000) (bvslt (currentBit!9041 (_2!8711 lt!287951)) #b00000000000000000000000000001000) (bvsge (currentByte!9046 (_2!8711 lt!287951)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9046 (_2!8711 lt!287951)) (size!4333 (buf!4796 (_2!8711 lt!287951)))) (and (= (currentBit!9041 (_2!8711 lt!287951)) #b00000000000000000000000000000000) (= (currentByte!9046 (_2!8711 lt!287951)) (size!4333 (buf!4796 (_2!8711 lt!287951))))))))))

(assert (=> b!186421 d!64413))

(declare-fun d!64415 () Bool)

(assert (=> d!64415 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204)) lt!287956) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4333 (buf!4796 thiss!1204))) ((_ sign_extend 32) (currentByte!9046 thiss!1204)) ((_ sign_extend 32) (currentBit!9041 thiss!1204))) lt!287956))))

(declare-fun bs!16025 () Bool)

(assert (= bs!16025 d!64415))

(assert (=> bs!16025 m!290049))

(assert (=> b!186431 d!64415))

(assert (=> b!186420 d!64365))

(declare-fun d!64417 () Bool)

(assert (=> d!64417 (= (invariant!0 (currentBit!9041 (_2!8711 lt!287965)) (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!287965)))) (and (bvsge (currentBit!9041 (_2!8711 lt!287965)) #b00000000000000000000000000000000) (bvslt (currentBit!9041 (_2!8711 lt!287965)) #b00000000000000000000000000001000) (bvsge (currentByte!9046 (_2!8711 lt!287965)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!287965)))) (and (= (currentBit!9041 (_2!8711 lt!287965)) #b00000000000000000000000000000000) (= (currentByte!9046 (_2!8711 lt!287965)) (size!4333 (buf!4796 (_2!8711 lt!287965))))))))))

(assert (=> b!186430 d!64417))

(declare-fun d!64419 () Bool)

(declare-fun lt!288899 () tuple2!16136)

(declare-fun lt!288898 () tuple2!16136)

(assert (=> d!64419 (and (= (_2!8713 lt!288899) (_2!8713 lt!288898)) (= (_1!8713 lt!288899) (_1!8713 lt!288898)))))

(declare-fun lt!288896 () BitStream!7774)

(declare-fun lt!288901 () (_ BitVec 64))

(declare-fun lt!288897 () Unit!13335)

(declare-fun lt!288900 () Bool)

(declare-fun choose!56 (BitStream!7774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16136 tuple2!16136 BitStream!7774 (_ BitVec 64) Bool BitStream!7774 (_ BitVec 64) tuple2!16136 tuple2!16136 BitStream!7774 (_ BitVec 64)) Unit!13335)

(assert (=> d!64419 (= lt!288897 (choose!56 (_1!8712 lt!287962) nBits!348 i!590 lt!287961 lt!288899 (tuple2!16137 (_1!8713 lt!288899) (_2!8713 lt!288899)) (_1!8713 lt!288899) (_2!8713 lt!288899) lt!288900 lt!288896 lt!288901 lt!288898 (tuple2!16137 (_1!8713 lt!288898) (_2!8713 lt!288898)) (_1!8713 lt!288898) (_2!8713 lt!288898)))))

(assert (=> d!64419 (= lt!288898 (readNBitsLSBFirstsLoopPure!0 lt!288896 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!288901))))

(assert (=> d!64419 (= lt!288901 (bvor lt!287961 (ite lt!288900 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64419 (= lt!288896 (withMovedBitIndex!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64419 (= lt!288900 (_2!8714 (readBitPure!0 (_1!8712 lt!287962))))))

(assert (=> d!64419 (= lt!288899 (readNBitsLSBFirstsLoopPure!0 (_1!8712 lt!287962) nBits!348 i!590 lt!287961))))

(assert (=> d!64419 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8712 lt!287962) nBits!348 i!590 lt!287961) lt!288897)))

(declare-fun bs!16027 () Bool)

(assert (= bs!16027 d!64419))

(declare-fun m!290545 () Bool)

(assert (=> bs!16027 m!290545))

(declare-fun m!290547 () Bool)

(assert (=> bs!16027 m!290547))

(assert (=> bs!16027 m!289849))

(assert (=> bs!16027 m!289817))

(assert (=> bs!16027 m!289843))

(assert (=> b!186430 d!64419))

(declare-fun lt!288902 () tuple2!16160)

(declare-fun d!64431 () Bool)

(assert (=> d!64431 (= lt!288902 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287954))))

(assert (=> d!64431 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287954) (tuple2!16137 (_2!8725 lt!288902) (_1!8725 lt!288902)))))

(declare-fun bs!16028 () Bool)

(assert (= bs!16028 d!64431))

(assert (=> bs!16028 m!289817))

(declare-fun m!290551 () Bool)

(assert (=> bs!16028 m!290551))

(assert (=> b!186430 d!64431))

(declare-fun d!64435 () Bool)

(declare-fun e!129236 () Bool)

(assert (=> d!64435 e!129236))

(declare-fun res!155568 () Bool)

(assert (=> d!64435 (=> (not res!155568) (not e!129236))))

(declare-fun lt!288904 () (_ BitVec 64))

(declare-fun lt!288903 () BitStream!7774)

(assert (=> d!64435 (= res!155568 (= (bvadd lt!288904 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4333 (buf!4796 lt!288903)) (currentByte!9046 lt!288903) (currentBit!9041 lt!288903))))))

(assert (=> d!64435 (or (not (= (bvand lt!288904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288904 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64435 (= lt!288904 (bitIndex!0 (size!4333 (buf!4796 (_1!8712 lt!287962))) (currentByte!9046 (_1!8712 lt!287962)) (currentBit!9041 (_1!8712 lt!287962))))))

(assert (=> d!64435 (= lt!288903 (_2!8711 (moveBitIndex!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64435 (moveBitIndexPrecond!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64435 (= (withMovedBitIndex!0 (_1!8712 lt!287962) #b0000000000000000000000000000000000000000000000000000000000000001) lt!288903)))

(declare-fun b!186824 () Bool)

(assert (=> b!186824 (= e!129236 (= (size!4333 (buf!4796 (_1!8712 lt!287962))) (size!4333 (buf!4796 lt!288903))))))

(assert (= (and d!64435 res!155568) b!186824))

(declare-fun m!290553 () Bool)

(assert (=> d!64435 m!290553))

(declare-fun m!290555 () Bool)

(assert (=> d!64435 m!290555))

(declare-fun m!290557 () Bool)

(assert (=> d!64435 m!290557))

(declare-fun m!290559 () Bool)

(assert (=> d!64435 m!290559))

(assert (=> b!186430 d!64435))

(push 1)

(assert (not d!64435))

(assert (not b!186764))

(assert (not b!186665))

(assert (not d!64283))

(assert (not d!64325))

(assert (not d!64367))

(assert (not b!186582))

(assert (not d!64341))

(assert (not d!64363))

(assert (not d!64269))

(assert (not b!186754))

(assert (not d!64357))

(assert (not d!64419))

(assert (not d!64369))

(assert (not b!186785))

(assert (not b!186641))

(assert (not d!64355))

(assert (not d!64353))

(assert (not d!64267))

(assert (not d!64329))

(assert (not b!186638))

(assert (not d!64293))

(assert (not d!64379))

(assert (not d!64271))

(assert (not b!186757))

(assert (not b!186662))

(assert (not b!186639))

(assert (not b!186787))

(assert (not b!186750))

(assert (not d!64359))

(assert (not d!64385))

(assert (not d!64383))

(assert (not b!186633))

(assert (not b!186671))

(assert (not d!64285))

(assert (not b!186583))

(assert (not b!186760))

(assert (not b!186753))

(assert (not d!64415))

(assert (not d!64351))

(assert (not b!186635))

(assert (not b!186631))

(assert (not d!64371))

(assert (not d!64431))

(assert (not b!186669))

(assert (not b!186759))

(assert (not d!64295))

(assert (not b!186761))

(assert (not d!64263))

(assert (not b!186632))

(assert (not b!186584))

(assert (not b!186660))

(assert (not d!64327))

(assert (not b!186637))

(assert (not b!186585))

(assert (not d!64305))

(assert (not bm!2996))

(assert (not d!64297))

(assert (not b!186763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

