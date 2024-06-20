; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45146 () Bool)

(assert start!45146)

(declare-fun b!217457 () Bool)

(declare-fun res!182977 () Bool)

(declare-fun e!147854 () Bool)

(assert (=> b!217457 (=> (not res!182977) (not e!147854))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!217457 (= res!182977 (not (= i!590 nBits!348)))))

(declare-fun b!217458 () Bool)

(declare-fun e!147845 () Bool)

(declare-datatypes ((array!10615 0))(
  ( (array!10616 (arr!5591 (Array (_ BitVec 32) (_ BitVec 8))) (size!4661 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8430 0))(
  ( (BitStream!8431 (buf!5205 array!10615) (currentByte!9798 (_ BitVec 32)) (currentBit!9793 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18538 0))(
  ( (tuple2!18539 (_1!9927 BitStream!8430) (_2!9927 Bool)) )
))
(declare-fun lt!344278 () tuple2!18538)

(declare-fun lt!344308 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217458 (= e!147845 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344278))) (currentByte!9798 (_1!9927 lt!344278)) (currentBit!9793 (_1!9927 lt!344278))) lt!344308))))

(declare-fun res!182981 () Bool)

(declare-fun e!147853 () Bool)

(assert (=> start!45146 (=> (not res!182981) (not e!147853))))

(assert (=> start!45146 (= res!182981 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45146 e!147853))

(assert (=> start!45146 true))

(declare-fun thiss!1204 () BitStream!8430)

(declare-fun e!147846 () Bool)

(declare-fun inv!12 (BitStream!8430) Bool)

(assert (=> start!45146 (and (inv!12 thiss!1204) e!147846)))

(declare-fun b!217459 () Bool)

(declare-fun e!147844 () Bool)

(assert (=> b!217459 (= e!147844 e!147845)))

(declare-fun res!182987 () Bool)

(assert (=> b!217459 (=> (not res!182987) (not e!147845))))

(declare-datatypes ((Unit!15480 0))(
  ( (Unit!15481) )
))
(declare-datatypes ((tuple2!18540 0))(
  ( (tuple2!18541 (_1!9928 Unit!15480) (_2!9928 BitStream!8430)) )
))
(declare-fun lt!344281 () tuple2!18540)

(declare-fun lt!344293 () Bool)

(assert (=> b!217459 (= res!182987 (and (= (_2!9927 lt!344278) lt!344293) (= (_1!9927 lt!344278) (_2!9928 lt!344281))))))

(declare-fun readBitPure!0 (BitStream!8430) tuple2!18538)

(declare-fun readerFrom!0 (BitStream!8430 (_ BitVec 32) (_ BitVec 32)) BitStream!8430)

(assert (=> b!217459 (= lt!344278 (readBitPure!0 (readerFrom!0 (_2!9928 lt!344281) (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204))))))

(declare-fun b!217460 () Bool)

(declare-fun res!182984 () Bool)

(declare-fun e!147850 () Bool)

(assert (=> b!217460 (=> (not res!182984) (not e!147850))))

(declare-datatypes ((tuple2!18542 0))(
  ( (tuple2!18543 (_1!9929 BitStream!8430) (_2!9929 (_ BitVec 64))) )
))
(declare-fun lt!344309 () tuple2!18542)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217460 (= res!182984 (= (_2!9929 lt!344309) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!217461 () Bool)

(declare-datatypes ((tuple2!18544 0))(
  ( (tuple2!18545 (_1!9930 BitStream!8430) (_2!9930 BitStream!8430)) )
))
(declare-fun lt!344294 () tuple2!18544)

(assert (=> b!217461 (= e!147850 (= (_1!9929 lt!344309) (_2!9930 lt!344294)))))

(declare-fun b!217462 () Bool)

(declare-fun res!182993 () Bool)

(declare-fun e!147852 () Bool)

(assert (=> b!217462 (=> res!182993 e!147852)))

(declare-fun lt!344306 () tuple2!18540)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!217462 (= res!182993 (not (invariant!0 (currentBit!9793 (_2!9928 lt!344306)) (currentByte!9798 (_2!9928 lt!344306)) (size!4661 (buf!5205 (_2!9928 lt!344306))))))))

(declare-fun b!217463 () Bool)

(declare-fun e!147855 () Bool)

(declare-fun e!147843 () Bool)

(assert (=> b!217463 (= e!147855 e!147843)))

(declare-fun res!182998 () Bool)

(assert (=> b!217463 (=> res!182998 e!147843)))

(declare-fun lt!344288 () tuple2!18542)

(declare-fun lt!344285 () tuple2!18544)

(assert (=> b!217463 (= res!182998 (not (= (_1!9929 lt!344288) (_2!9930 lt!344285))))))

(declare-fun lt!344279 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18542)

(assert (=> b!217463 (= lt!344288 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344285) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344279))))

(declare-fun lt!344305 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217463 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344305)))

(declare-fun lt!344286 () Unit!15480)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8430 array!10615 (_ BitVec 64)) Unit!15480)

(assert (=> b!217463 (= lt!344286 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9928 lt!344281) (buf!5205 (_2!9928 lt!344306)) lt!344305))))

(assert (=> b!217463 (= lt!344305 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!344300 () tuple2!18538)

(declare-fun lt!344282 () (_ BitVec 64))

(declare-fun lt!344307 () (_ BitVec 64))

(assert (=> b!217463 (= lt!344279 (bvor lt!344307 (ite (_2!9927 lt!344300) lt!344282 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217463 (= lt!344309 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344294) nBits!348 i!590 lt!344307))))

(declare-fun lt!344283 () (_ BitVec 64))

(assert (=> b!217463 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204)) lt!344283)))

(declare-fun lt!344290 () Unit!15480)

(assert (=> b!217463 (= lt!344290 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5205 (_2!9928 lt!344306)) lt!344283))))

(assert (=> b!217463 (= lt!344307 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!217463 (= (_2!9927 lt!344300) lt!344293)))

(assert (=> b!217463 (= lt!344300 (readBitPure!0 (_1!9930 lt!344294)))))

(declare-fun reader!0 (BitStream!8430 BitStream!8430) tuple2!18544)

(assert (=> b!217463 (= lt!344285 (reader!0 (_2!9928 lt!344281) (_2!9928 lt!344306)))))

(assert (=> b!217463 (= lt!344294 (reader!0 thiss!1204 (_2!9928 lt!344306)))))

(declare-fun e!147842 () Bool)

(assert (=> b!217463 e!147842))

(declare-fun res!182980 () Bool)

(assert (=> b!217463 (=> (not res!182980) (not e!147842))))

(declare-fun lt!344289 () tuple2!18538)

(declare-fun lt!344295 () tuple2!18538)

(assert (=> b!217463 (= res!182980 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344289))) (currentByte!9798 (_1!9927 lt!344289)) (currentBit!9793 (_1!9927 lt!344289))) (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344295))) (currentByte!9798 (_1!9927 lt!344295)) (currentBit!9793 (_1!9927 lt!344295)))))))

(declare-fun lt!344297 () Unit!15480)

(declare-fun lt!344287 () BitStream!8430)

(declare-fun readBitPrefixLemma!0 (BitStream!8430 BitStream!8430) Unit!15480)

(assert (=> b!217463 (= lt!344297 (readBitPrefixLemma!0 lt!344287 (_2!9928 lt!344306)))))

(assert (=> b!217463 (= lt!344295 (readBitPure!0 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204))))))

(assert (=> b!217463 (= lt!344289 (readBitPure!0 lt!344287))))

(declare-fun e!147848 () Bool)

(assert (=> b!217463 e!147848))

(declare-fun res!182995 () Bool)

(assert (=> b!217463 (=> (not res!182995) (not e!147848))))

(assert (=> b!217463 (= res!182995 (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(assert (=> b!217463 (= lt!344287 (BitStream!8431 (buf!5205 (_2!9928 lt!344281)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(declare-fun b!217464 () Bool)

(declare-fun e!147849 () Bool)

(assert (=> b!217464 (= e!147849 e!147844)))

(declare-fun res!182989 () Bool)

(assert (=> b!217464 (=> (not res!182989) (not e!147844))))

(declare-fun lt!344301 () (_ BitVec 64))

(assert (=> b!217464 (= res!182989 (= lt!344308 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!344301)))))

(assert (=> b!217464 (= lt!344308 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(assert (=> b!217464 (= lt!344301 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(declare-fun b!217465 () Bool)

(declare-fun res!182982 () Bool)

(assert (=> b!217465 (=> res!182982 e!147852)))

(assert (=> b!217465 (= res!182982 (not (= (size!4661 (buf!5205 (_2!9928 lt!344306))) (size!4661 (buf!5205 thiss!1204)))))))

(declare-fun b!217466 () Bool)

(declare-fun res!182986 () Bool)

(assert (=> b!217466 (=> res!182986 e!147855)))

(declare-fun isPrefixOf!0 (BitStream!8430 BitStream!8430) Bool)

(assert (=> b!217466 (= res!182986 (not (isPrefixOf!0 (_2!9928 lt!344281) (_2!9928 lt!344306))))))

(declare-fun b!217467 () Bool)

(declare-fun res!182988 () Bool)

(declare-fun e!147847 () Bool)

(assert (=> b!217467 (=> res!182988 e!147847)))

(assert (=> b!217467 (= res!182988 (not (= (bitIndex!0 (size!4661 (buf!5205 (_1!9929 lt!344309))) (currentByte!9798 (_1!9929 lt!344309)) (currentBit!9793 (_1!9929 lt!344309))) (bitIndex!0 (size!4661 (buf!5205 (_2!9930 lt!344294))) (currentByte!9798 (_2!9930 lt!344294)) (currentBit!9793 (_2!9930 lt!344294))))))))

(declare-fun b!217468 () Bool)

(declare-fun res!182979 () Bool)

(assert (=> b!217468 (=> res!182979 e!147855)))

(assert (=> b!217468 (= res!182979 (not (isPrefixOf!0 thiss!1204 (_2!9928 lt!344281))))))

(declare-fun b!217469 () Bool)

(assert (=> b!217469 (= e!147853 e!147854)))

(declare-fun res!182990 () Bool)

(assert (=> b!217469 (=> (not res!182990) (not e!147854))))

(assert (=> b!217469 (= res!182990 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204)) lt!344283))))

(assert (=> b!217469 (= lt!344283 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!217470 () Bool)

(assert (=> b!217470 (= e!147848 (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344306)))))))

(declare-fun b!217471 () Bool)

(assert (=> b!217471 (= e!147852 e!147855)))

(declare-fun res!182976 () Bool)

(assert (=> b!217471 (=> res!182976 e!147855)))

(declare-fun lt!344292 () (_ BitVec 64))

(declare-fun lt!344303 () (_ BitVec 64))

(assert (=> b!217471 (= res!182976 (not (= lt!344292 lt!344303)))))

(declare-fun lt!344304 () (_ BitVec 64))

(assert (=> b!217471 (= lt!344303 (bvsub lt!344304 ((_ sign_extend 32) i!590)))))

(declare-fun lt!344280 () (_ BitVec 64))

(assert (=> b!217471 (= lt!344304 (bvadd lt!344280 ((_ sign_extend 32) nBits!348)))))

(declare-fun lt!344291 () (_ BitVec 64))

(declare-fun b!217472 () Bool)

(assert (=> b!217472 (= e!147847 (or (= lt!344291 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!344291 (bvand lt!344303 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!217472 (= lt!344291 (bvand lt!344304 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!217472 e!147850))

(declare-fun res!182997 () Bool)

(assert (=> b!217472 (=> (not res!182997) (not e!147850))))

(assert (=> b!217472 (= res!182997 (= (size!4661 (buf!5205 thiss!1204)) (size!4661 (buf!5205 (_2!9928 lt!344306)))))))

(declare-fun b!217473 () Bool)

(declare-fun e!147851 () Bool)

(assert (=> b!217473 (= e!147854 (not e!147851))))

(declare-fun res!182996 () Bool)

(assert (=> b!217473 (=> res!182996 e!147851)))

(declare-fun lt!344298 () (_ BitVec 64))

(assert (=> b!217473 (= res!182996 (not (= lt!344298 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!344280))))))

(assert (=> b!217473 (= lt!344298 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(assert (=> b!217473 (= lt!344280 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(assert (=> b!217473 e!147849))

(declare-fun res!182978 () Bool)

(assert (=> b!217473 (=> (not res!182978) (not e!147849))))

(assert (=> b!217473 (= res!182978 (= (size!4661 (buf!5205 thiss!1204)) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(declare-fun appendBit!0 (BitStream!8430 Bool) tuple2!18540)

(assert (=> b!217473 (= lt!344281 (appendBit!0 thiss!1204 lt!344293))))

(assert (=> b!217473 (= lt!344293 (not (= (bvand v!189 lt!344282) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217473 (= lt!344282 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!217474 () Bool)

(declare-fun res!182992 () Bool)

(declare-fun e!147840 () Bool)

(assert (=> b!217474 (=> (not res!182992) (not e!147840))))

(declare-fun withMovedBitIndex!0 (BitStream!8430 (_ BitVec 64)) BitStream!8430)

(assert (=> b!217474 (= res!182992 (= (_1!9930 lt!344285) (withMovedBitIndex!0 (_2!9930 lt!344285) (bvsub lt!344298 lt!344292))))))

(declare-fun b!217475 () Bool)

(declare-fun lt!344299 () BitStream!8430)

(assert (=> b!217475 (= e!147840 (and (= lt!344280 (bvsub lt!344298 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9930 lt!344285) lt!344299)) (= (_2!9929 lt!344309) (_2!9929 lt!344288)))))))

(declare-fun b!217476 () Bool)

(assert (=> b!217476 (= e!147842 (= (_2!9927 lt!344289) (_2!9927 lt!344295)))))

(declare-fun b!217477 () Bool)

(declare-fun res!182991 () Bool)

(assert (=> b!217477 (=> (not res!182991) (not e!147844))))

(assert (=> b!217477 (= res!182991 (isPrefixOf!0 thiss!1204 (_2!9928 lt!344281)))))

(declare-fun b!217478 () Bool)

(assert (=> b!217478 (= e!147843 e!147847)))

(declare-fun res!182983 () Bool)

(assert (=> b!217478 (=> res!182983 e!147847)))

(assert (=> b!217478 (= res!182983 (not (= (_1!9930 lt!344285) lt!344299)))))

(assert (=> b!217478 e!147840))

(declare-fun res!182975 () Bool)

(assert (=> b!217478 (=> (not res!182975) (not e!147840))))

(declare-fun lt!344302 () tuple2!18542)

(assert (=> b!217478 (= res!182975 (and (= (_2!9929 lt!344309) (_2!9929 lt!344302)) (= (_1!9929 lt!344309) (_1!9929 lt!344302))))))

(declare-fun lt!344296 () Unit!15480)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15480)

(assert (=> b!217478 (= lt!344296 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9930 lt!344294) nBits!348 i!590 lt!344307))))

(assert (=> b!217478 (= lt!344302 (readNBitsLSBFirstsLoopPure!0 lt!344299 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344279))))

(assert (=> b!217478 (= lt!344299 (withMovedBitIndex!0 (_1!9930 lt!344294) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!217479 () Bool)

(declare-fun res!182994 () Bool)

(assert (=> b!217479 (=> (not res!182994) (not e!147840))))

(assert (=> b!217479 (= res!182994 (= (_1!9930 lt!344294) (withMovedBitIndex!0 (_2!9930 lt!344294) (bvsub lt!344280 lt!344292))))))

(declare-fun b!217480 () Bool)

(declare-fun array_inv!4402 (array!10615) Bool)

(assert (=> b!217480 (= e!147846 (array_inv!4402 (buf!5205 thiss!1204)))))

(declare-fun b!217481 () Bool)

(assert (=> b!217481 (= e!147851 e!147852)))

(declare-fun res!182999 () Bool)

(assert (=> b!217481 (=> res!182999 e!147852)))

(assert (=> b!217481 (= res!182999 (not (= lt!344292 (bvsub (bvsub (bvadd lt!344298 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!217481 (= lt!344292 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344306))) (currentByte!9798 (_2!9928 lt!344306)) (currentBit!9793 (_2!9928 lt!344306))))))

(assert (=> b!217481 (isPrefixOf!0 thiss!1204 (_2!9928 lt!344306))))

(declare-fun lt!344284 () Unit!15480)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8430 BitStream!8430 BitStream!8430) Unit!15480)

(assert (=> b!217481 (= lt!344284 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9928 lt!344281) (_2!9928 lt!344306)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8430 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18540)

(assert (=> b!217481 (= lt!344306 (appendBitsLSBFirstLoopTR!0 (_2!9928 lt!344281) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!217482 () Bool)

(declare-fun res!182985 () Bool)

(assert (=> b!217482 (=> (not res!182985) (not e!147854))))

(assert (=> b!217482 (= res!182985 (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 thiss!1204))))))

(assert (= (and start!45146 res!182981) b!217469))

(assert (= (and b!217469 res!182990) b!217482))

(assert (= (and b!217482 res!182985) b!217457))

(assert (= (and b!217457 res!182977) b!217473))

(assert (= (and b!217473 res!182978) b!217464))

(assert (= (and b!217464 res!182989) b!217477))

(assert (= (and b!217477 res!182991) b!217459))

(assert (= (and b!217459 res!182987) b!217458))

(assert (= (and b!217473 (not res!182996)) b!217481))

(assert (= (and b!217481 (not res!182999)) b!217462))

(assert (= (and b!217462 (not res!182993)) b!217465))

(assert (= (and b!217465 (not res!182982)) b!217471))

(assert (= (and b!217471 (not res!182976)) b!217466))

(assert (= (and b!217466 (not res!182986)) b!217468))

(assert (= (and b!217468 (not res!182979)) b!217463))

(assert (= (and b!217463 res!182995) b!217470))

(assert (= (and b!217463 res!182980) b!217476))

(assert (= (and b!217463 (not res!182998)) b!217478))

(assert (= (and b!217478 res!182975) b!217479))

(assert (= (and b!217479 res!182994) b!217474))

(assert (= (and b!217474 res!182992) b!217475))

(assert (= (and b!217478 (not res!182983)) b!217467))

(assert (= (and b!217467 (not res!182988)) b!217472))

(assert (= (and b!217472 res!182997) b!217460))

(assert (= (and b!217460 res!182984) b!217461))

(assert (= start!45146 b!217480))

(declare-fun m!335505 () Bool)

(assert (=> b!217478 m!335505))

(declare-fun m!335507 () Bool)

(assert (=> b!217478 m!335507))

(declare-fun m!335509 () Bool)

(assert (=> b!217478 m!335509))

(declare-fun m!335511 () Bool)

(assert (=> b!217468 m!335511))

(declare-fun m!335513 () Bool)

(assert (=> b!217460 m!335513))

(assert (=> b!217477 m!335511))

(declare-fun m!335515 () Bool)

(assert (=> b!217464 m!335515))

(declare-fun m!335517 () Bool)

(assert (=> b!217464 m!335517))

(declare-fun m!335519 () Bool)

(assert (=> b!217467 m!335519))

(declare-fun m!335521 () Bool)

(assert (=> b!217467 m!335521))

(declare-fun m!335523 () Bool)

(assert (=> b!217458 m!335523))

(declare-fun m!335525 () Bool)

(assert (=> b!217482 m!335525))

(declare-fun m!335527 () Bool)

(assert (=> b!217466 m!335527))

(declare-fun m!335529 () Bool)

(assert (=> b!217469 m!335529))

(declare-fun m!335531 () Bool)

(assert (=> b!217462 m!335531))

(declare-fun m!335533 () Bool)

(assert (=> b!217481 m!335533))

(declare-fun m!335535 () Bool)

(assert (=> b!217481 m!335535))

(declare-fun m!335537 () Bool)

(assert (=> b!217481 m!335537))

(declare-fun m!335539 () Bool)

(assert (=> b!217481 m!335539))

(declare-fun m!335541 () Bool)

(assert (=> b!217470 m!335541))

(declare-fun m!335543 () Bool)

(assert (=> b!217474 m!335543))

(assert (=> b!217473 m!335515))

(assert (=> b!217473 m!335517))

(declare-fun m!335545 () Bool)

(assert (=> b!217473 m!335545))

(declare-fun m!335547 () Bool)

(assert (=> b!217479 m!335547))

(declare-fun m!335549 () Bool)

(assert (=> b!217459 m!335549))

(assert (=> b!217459 m!335549))

(declare-fun m!335551 () Bool)

(assert (=> b!217459 m!335551))

(declare-fun m!335553 () Bool)

(assert (=> start!45146 m!335553))

(declare-fun m!335555 () Bool)

(assert (=> b!217463 m!335555))

(declare-fun m!335557 () Bool)

(assert (=> b!217463 m!335557))

(declare-fun m!335559 () Bool)

(assert (=> b!217463 m!335559))

(declare-fun m!335561 () Bool)

(assert (=> b!217463 m!335561))

(declare-fun m!335563 () Bool)

(assert (=> b!217463 m!335563))

(declare-fun m!335565 () Bool)

(assert (=> b!217463 m!335565))

(declare-fun m!335567 () Bool)

(assert (=> b!217463 m!335567))

(declare-fun m!335569 () Bool)

(assert (=> b!217463 m!335569))

(declare-fun m!335571 () Bool)

(assert (=> b!217463 m!335571))

(declare-fun m!335573 () Bool)

(assert (=> b!217463 m!335573))

(declare-fun m!335575 () Bool)

(assert (=> b!217463 m!335575))

(declare-fun m!335577 () Bool)

(assert (=> b!217463 m!335577))

(declare-fun m!335579 () Bool)

(assert (=> b!217463 m!335579))

(declare-fun m!335581 () Bool)

(assert (=> b!217463 m!335581))

(declare-fun m!335583 () Bool)

(assert (=> b!217463 m!335583))

(declare-fun m!335585 () Bool)

(assert (=> b!217463 m!335585))

(declare-fun m!335587 () Bool)

(assert (=> b!217480 m!335587))

(check-sat (not start!45146) (not b!217479) (not b!217463) (not b!217474) (not b!217460) (not b!217469) (not b!217468) (not b!217462) (not b!217458) (not b!217480) (not b!217470) (not b!217477) (not b!217467) (not b!217478) (not b!217459) (not b!217464) (not b!217482) (not b!217473) (not b!217481) (not b!217466))
(check-sat)
(get-model)

(declare-fun d!73751 () Bool)

(declare-fun e!147906 () Bool)

(assert (=> d!73751 e!147906))

(declare-fun res!183079 () Bool)

(assert (=> d!73751 (=> (not res!183079) (not e!147906))))

(declare-fun lt!344421 () (_ BitVec 64))

(declare-fun lt!344423 () (_ BitVec 64))

(declare-fun lt!344418 () (_ BitVec 64))

(assert (=> d!73751 (= res!183079 (= lt!344418 (bvsub lt!344421 lt!344423)))))

(assert (=> d!73751 (or (= (bvand lt!344421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344421 lt!344423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!73751 (= lt!344423 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9929 lt!344309)))) ((_ sign_extend 32) (currentByte!9798 (_1!9929 lt!344309))) ((_ sign_extend 32) (currentBit!9793 (_1!9929 lt!344309)))))))

(declare-fun lt!344420 () (_ BitVec 64))

(declare-fun lt!344419 () (_ BitVec 64))

(assert (=> d!73751 (= lt!344421 (bvmul lt!344420 lt!344419))))

(assert (=> d!73751 (or (= lt!344420 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344419 (bvsdiv (bvmul lt!344420 lt!344419) lt!344420)))))

(assert (=> d!73751 (= lt!344419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73751 (= lt!344420 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9929 lt!344309)))))))

(assert (=> d!73751 (= lt!344418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_1!9929 lt!344309))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_1!9929 lt!344309)))))))

(assert (=> d!73751 (invariant!0 (currentBit!9793 (_1!9929 lt!344309)) (currentByte!9798 (_1!9929 lt!344309)) (size!4661 (buf!5205 (_1!9929 lt!344309))))))

(assert (=> d!73751 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9929 lt!344309))) (currentByte!9798 (_1!9929 lt!344309)) (currentBit!9793 (_1!9929 lt!344309))) lt!344418)))

(declare-fun b!217565 () Bool)

(declare-fun res!183080 () Bool)

(assert (=> b!217565 (=> (not res!183080) (not e!147906))))

(assert (=> b!217565 (= res!183080 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344418))))

(declare-fun b!217566 () Bool)

(declare-fun lt!344422 () (_ BitVec 64))

(assert (=> b!217566 (= e!147906 (bvsle lt!344418 (bvmul lt!344422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217566 (or (= lt!344422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344422)))))

(assert (=> b!217566 (= lt!344422 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9929 lt!344309)))))))

(assert (= (and d!73751 res!183079) b!217565))

(assert (= (and b!217565 res!183080) b!217566))

(declare-fun m!335673 () Bool)

(assert (=> d!73751 m!335673))

(declare-fun m!335675 () Bool)

(assert (=> d!73751 m!335675))

(assert (=> b!217467 d!73751))

(declare-fun d!73753 () Bool)

(declare-fun e!147907 () Bool)

(assert (=> d!73753 e!147907))

(declare-fun res!183081 () Bool)

(assert (=> d!73753 (=> (not res!183081) (not e!147907))))

(declare-fun lt!344429 () (_ BitVec 64))

(declare-fun lt!344424 () (_ BitVec 64))

(declare-fun lt!344427 () (_ BitVec 64))

(assert (=> d!73753 (= res!183081 (= lt!344424 (bvsub lt!344427 lt!344429)))))

(assert (=> d!73753 (or (= (bvand lt!344427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344427 lt!344429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73753 (= lt!344429 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9930 lt!344294)))) ((_ sign_extend 32) (currentByte!9798 (_2!9930 lt!344294))) ((_ sign_extend 32) (currentBit!9793 (_2!9930 lt!344294)))))))

(declare-fun lt!344426 () (_ BitVec 64))

(declare-fun lt!344425 () (_ BitVec 64))

(assert (=> d!73753 (= lt!344427 (bvmul lt!344426 lt!344425))))

(assert (=> d!73753 (or (= lt!344426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344425 (bvsdiv (bvmul lt!344426 lt!344425) lt!344426)))))

(assert (=> d!73753 (= lt!344425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73753 (= lt!344426 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9930 lt!344294)))))))

(assert (=> d!73753 (= lt!344424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_2!9930 lt!344294))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_2!9930 lt!344294)))))))

(assert (=> d!73753 (invariant!0 (currentBit!9793 (_2!9930 lt!344294)) (currentByte!9798 (_2!9930 lt!344294)) (size!4661 (buf!5205 (_2!9930 lt!344294))))))

(assert (=> d!73753 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9930 lt!344294))) (currentByte!9798 (_2!9930 lt!344294)) (currentBit!9793 (_2!9930 lt!344294))) lt!344424)))

(declare-fun b!217567 () Bool)

(declare-fun res!183082 () Bool)

(assert (=> b!217567 (=> (not res!183082) (not e!147907))))

(assert (=> b!217567 (= res!183082 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344424))))

(declare-fun b!217568 () Bool)

(declare-fun lt!344428 () (_ BitVec 64))

(assert (=> b!217568 (= e!147907 (bvsle lt!344424 (bvmul lt!344428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217568 (or (= lt!344428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344428)))))

(assert (=> b!217568 (= lt!344428 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9930 lt!344294)))))))

(assert (= (and d!73753 res!183081) b!217567))

(assert (= (and b!217567 res!183082) b!217568))

(declare-fun m!335677 () Bool)

(assert (=> d!73753 m!335677))

(declare-fun m!335679 () Bool)

(assert (=> d!73753 m!335679))

(assert (=> b!217467 d!73753))

(declare-fun d!73755 () Bool)

(declare-fun lt!344444 () tuple2!18542)

(declare-fun lt!344445 () tuple2!18542)

(assert (=> d!73755 (and (= (_2!9929 lt!344444) (_2!9929 lt!344445)) (= (_1!9929 lt!344444) (_1!9929 lt!344445)))))

(declare-fun lt!344443 () (_ BitVec 64))

(declare-fun lt!344447 () Unit!15480)

(declare-fun lt!344442 () Bool)

(declare-fun lt!344446 () BitStream!8430)

(declare-fun choose!56 (BitStream!8430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18542 tuple2!18542 BitStream!8430 (_ BitVec 64) Bool BitStream!8430 (_ BitVec 64) tuple2!18542 tuple2!18542 BitStream!8430 (_ BitVec 64)) Unit!15480)

(assert (=> d!73755 (= lt!344447 (choose!56 (_1!9930 lt!344294) nBits!348 i!590 lt!344307 lt!344444 (tuple2!18543 (_1!9929 lt!344444) (_2!9929 lt!344444)) (_1!9929 lt!344444) (_2!9929 lt!344444) lt!344442 lt!344446 lt!344443 lt!344445 (tuple2!18543 (_1!9929 lt!344445) (_2!9929 lt!344445)) (_1!9929 lt!344445) (_2!9929 lt!344445)))))

(assert (=> d!73755 (= lt!344445 (readNBitsLSBFirstsLoopPure!0 lt!344446 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!344443))))

(assert (=> d!73755 (= lt!344443 (bvor lt!344307 (ite lt!344442 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73755 (= lt!344446 (withMovedBitIndex!0 (_1!9930 lt!344294) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73755 (= lt!344442 (_2!9927 (readBitPure!0 (_1!9930 lt!344294))))))

(assert (=> d!73755 (= lt!344444 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344294) nBits!348 i!590 lt!344307))))

(assert (=> d!73755 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9930 lt!344294) nBits!348 i!590 lt!344307) lt!344447)))

(declare-fun bs!18007 () Bool)

(assert (= bs!18007 d!73755))

(declare-fun m!335681 () Bool)

(assert (=> bs!18007 m!335681))

(declare-fun m!335683 () Bool)

(assert (=> bs!18007 m!335683))

(assert (=> bs!18007 m!335581))

(assert (=> bs!18007 m!335559))

(assert (=> bs!18007 m!335509))

(assert (=> b!217478 d!73755))

(declare-datatypes ((tuple2!18554 0))(
  ( (tuple2!18555 (_1!9935 (_ BitVec 64)) (_2!9935 BitStream!8430)) )
))
(declare-fun lt!344450 () tuple2!18554)

(declare-fun d!73757 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18554)

(assert (=> d!73757 (= lt!344450 (readNBitsLSBFirstsLoop!0 lt!344299 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344279))))

(assert (=> d!73757 (= (readNBitsLSBFirstsLoopPure!0 lt!344299 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344279) (tuple2!18543 (_2!9935 lt!344450) (_1!9935 lt!344450)))))

(declare-fun bs!18008 () Bool)

(assert (= bs!18008 d!73757))

(declare-fun m!335685 () Bool)

(assert (=> bs!18008 m!335685))

(assert (=> b!217478 d!73757))

(declare-fun d!73759 () Bool)

(declare-fun e!147910 () Bool)

(assert (=> d!73759 e!147910))

(declare-fun res!183085 () Bool)

(assert (=> d!73759 (=> (not res!183085) (not e!147910))))

(declare-fun lt!344456 () (_ BitVec 64))

(declare-fun lt!344455 () BitStream!8430)

(assert (=> d!73759 (= res!183085 (= (bvadd lt!344456 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4661 (buf!5205 lt!344455)) (currentByte!9798 lt!344455) (currentBit!9793 lt!344455))))))

(assert (=> d!73759 (or (not (= (bvand lt!344456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344456 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73759 (= lt!344456 (bitIndex!0 (size!4661 (buf!5205 (_1!9930 lt!344294))) (currentByte!9798 (_1!9930 lt!344294)) (currentBit!9793 (_1!9930 lt!344294))))))

(declare-fun moveBitIndex!0 (BitStream!8430 (_ BitVec 64)) tuple2!18540)

(assert (=> d!73759 (= lt!344455 (_2!9928 (moveBitIndex!0 (_1!9930 lt!344294) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8430 (_ BitVec 64)) Bool)

(assert (=> d!73759 (moveBitIndexPrecond!0 (_1!9930 lt!344294) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73759 (= (withMovedBitIndex!0 (_1!9930 lt!344294) #b0000000000000000000000000000000000000000000000000000000000000001) lt!344455)))

(declare-fun b!217571 () Bool)

(assert (=> b!217571 (= e!147910 (= (size!4661 (buf!5205 (_1!9930 lt!344294))) (size!4661 (buf!5205 lt!344455))))))

(assert (= (and d!73759 res!183085) b!217571))

(declare-fun m!335687 () Bool)

(assert (=> d!73759 m!335687))

(declare-fun m!335689 () Bool)

(assert (=> d!73759 m!335689))

(declare-fun m!335691 () Bool)

(assert (=> d!73759 m!335691))

(declare-fun m!335693 () Bool)

(assert (=> d!73759 m!335693))

(assert (=> b!217478 d!73759))

(declare-fun d!73761 () Bool)

(declare-fun e!147911 () Bool)

(assert (=> d!73761 e!147911))

(declare-fun res!183086 () Bool)

(assert (=> d!73761 (=> (not res!183086) (not e!147911))))

(declare-fun lt!344458 () (_ BitVec 64))

(declare-fun lt!344457 () BitStream!8430)

(assert (=> d!73761 (= res!183086 (= (bvadd lt!344458 (bvsub lt!344280 lt!344292)) (bitIndex!0 (size!4661 (buf!5205 lt!344457)) (currentByte!9798 lt!344457) (currentBit!9793 lt!344457))))))

(assert (=> d!73761 (or (not (= (bvand lt!344458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344280 lt!344292) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344458 (bvsub lt!344280 lt!344292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73761 (= lt!344458 (bitIndex!0 (size!4661 (buf!5205 (_2!9930 lt!344294))) (currentByte!9798 (_2!9930 lt!344294)) (currentBit!9793 (_2!9930 lt!344294))))))

(assert (=> d!73761 (= lt!344457 (_2!9928 (moveBitIndex!0 (_2!9930 lt!344294) (bvsub lt!344280 lt!344292))))))

(assert (=> d!73761 (moveBitIndexPrecond!0 (_2!9930 lt!344294) (bvsub lt!344280 lt!344292))))

(assert (=> d!73761 (= (withMovedBitIndex!0 (_2!9930 lt!344294) (bvsub lt!344280 lt!344292)) lt!344457)))

(declare-fun b!217572 () Bool)

(assert (=> b!217572 (= e!147911 (= (size!4661 (buf!5205 (_2!9930 lt!344294))) (size!4661 (buf!5205 lt!344457))))))

(assert (= (and d!73761 res!183086) b!217572))

(declare-fun m!335695 () Bool)

(assert (=> d!73761 m!335695))

(assert (=> d!73761 m!335521))

(declare-fun m!335697 () Bool)

(assert (=> d!73761 m!335697))

(declare-fun m!335699 () Bool)

(assert (=> d!73761 m!335699))

(assert (=> b!217479 d!73761))

(declare-fun d!73763 () Bool)

(declare-fun res!183095 () Bool)

(declare-fun e!147917 () Bool)

(assert (=> d!73763 (=> (not res!183095) (not e!147917))))

(assert (=> d!73763 (= res!183095 (= (size!4661 (buf!5205 thiss!1204)) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(assert (=> d!73763 (= (isPrefixOf!0 thiss!1204 (_2!9928 lt!344281)) e!147917)))

(declare-fun b!217579 () Bool)

(declare-fun res!183094 () Bool)

(assert (=> b!217579 (=> (not res!183094) (not e!147917))))

(assert (=> b!217579 (= res!183094 (bvsle (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281)))))))

(declare-fun b!217580 () Bool)

(declare-fun e!147916 () Bool)

(assert (=> b!217580 (= e!147917 e!147916)))

(declare-fun res!183093 () Bool)

(assert (=> b!217580 (=> res!183093 e!147916)))

(assert (=> b!217580 (= res!183093 (= (size!4661 (buf!5205 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217581 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10615 array!10615 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217581 (= e!147916 (arrayBitRangesEq!0 (buf!5205 thiss!1204) (buf!5205 (_2!9928 lt!344281)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204))))))

(assert (= (and d!73763 res!183095) b!217579))

(assert (= (and b!217579 res!183094) b!217580))

(assert (= (and b!217580 (not res!183093)) b!217581))

(assert (=> b!217579 m!335517))

(assert (=> b!217579 m!335515))

(assert (=> b!217581 m!335517))

(assert (=> b!217581 m!335517))

(declare-fun m!335701 () Bool)

(assert (=> b!217581 m!335701))

(assert (=> b!217468 d!73763))

(declare-fun d!73765 () Bool)

(assert (=> d!73765 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204)) lt!344283) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204))) lt!344283))))

(declare-fun bs!18009 () Bool)

(assert (= bs!18009 d!73765))

(declare-fun m!335703 () Bool)

(assert (=> bs!18009 m!335703))

(assert (=> b!217469 d!73765))

(declare-fun d!73767 () Bool)

(declare-fun e!147918 () Bool)

(assert (=> d!73767 e!147918))

(declare-fun res!183096 () Bool)

(assert (=> d!73767 (=> (not res!183096) (not e!147918))))

(declare-fun lt!344459 () (_ BitVec 64))

(declare-fun lt!344464 () (_ BitVec 64))

(declare-fun lt!344462 () (_ BitVec 64))

(assert (=> d!73767 (= res!183096 (= lt!344459 (bvsub lt!344462 lt!344464)))))

(assert (=> d!73767 (or (= (bvand lt!344462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344462 lt!344464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73767 (= lt!344464 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344278)))) ((_ sign_extend 32) (currentByte!9798 (_1!9927 lt!344278))) ((_ sign_extend 32) (currentBit!9793 (_1!9927 lt!344278)))))))

(declare-fun lt!344461 () (_ BitVec 64))

(declare-fun lt!344460 () (_ BitVec 64))

(assert (=> d!73767 (= lt!344462 (bvmul lt!344461 lt!344460))))

(assert (=> d!73767 (or (= lt!344461 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344460 (bvsdiv (bvmul lt!344461 lt!344460) lt!344461)))))

(assert (=> d!73767 (= lt!344460 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73767 (= lt!344461 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344278)))))))

(assert (=> d!73767 (= lt!344459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_1!9927 lt!344278))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_1!9927 lt!344278)))))))

(assert (=> d!73767 (invariant!0 (currentBit!9793 (_1!9927 lt!344278)) (currentByte!9798 (_1!9927 lt!344278)) (size!4661 (buf!5205 (_1!9927 lt!344278))))))

(assert (=> d!73767 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344278))) (currentByte!9798 (_1!9927 lt!344278)) (currentBit!9793 (_1!9927 lt!344278))) lt!344459)))

(declare-fun b!217582 () Bool)

(declare-fun res!183097 () Bool)

(assert (=> b!217582 (=> (not res!183097) (not e!147918))))

(assert (=> b!217582 (= res!183097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344459))))

(declare-fun b!217583 () Bool)

(declare-fun lt!344463 () (_ BitVec 64))

(assert (=> b!217583 (= e!147918 (bvsle lt!344459 (bvmul lt!344463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217583 (or (= lt!344463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344463)))))

(assert (=> b!217583 (= lt!344463 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344278)))))))

(assert (= (and d!73767 res!183096) b!217582))

(assert (= (and b!217582 res!183097) b!217583))

(declare-fun m!335705 () Bool)

(assert (=> d!73767 m!335705))

(declare-fun m!335707 () Bool)

(assert (=> d!73767 m!335707))

(assert (=> b!217458 d!73767))

(declare-fun d!73769 () Bool)

(declare-datatypes ((tuple2!18556 0))(
  ( (tuple2!18557 (_1!9936 Bool) (_2!9936 BitStream!8430)) )
))
(declare-fun lt!344467 () tuple2!18556)

(declare-fun readBit!0 (BitStream!8430) tuple2!18556)

(assert (=> d!73769 (= lt!344467 (readBit!0 (readerFrom!0 (_2!9928 lt!344281) (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204))))))

(assert (=> d!73769 (= (readBitPure!0 (readerFrom!0 (_2!9928 lt!344281) (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204))) (tuple2!18539 (_2!9936 lt!344467) (_1!9936 lt!344467)))))

(declare-fun bs!18010 () Bool)

(assert (= bs!18010 d!73769))

(assert (=> bs!18010 m!335549))

(declare-fun m!335709 () Bool)

(assert (=> bs!18010 m!335709))

(assert (=> b!217459 d!73769))

(declare-fun d!73771 () Bool)

(declare-fun e!147921 () Bool)

(assert (=> d!73771 e!147921))

(declare-fun res!183101 () Bool)

(assert (=> d!73771 (=> (not res!183101) (not e!147921))))

(assert (=> d!73771 (= res!183101 (invariant!0 (currentBit!9793 (_2!9928 lt!344281)) (currentByte!9798 (_2!9928 lt!344281)) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(assert (=> d!73771 (= (readerFrom!0 (_2!9928 lt!344281) (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204)) (BitStream!8431 (buf!5205 (_2!9928 lt!344281)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(declare-fun b!217586 () Bool)

(assert (=> b!217586 (= e!147921 (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(assert (= (and d!73771 res!183101) b!217586))

(declare-fun m!335711 () Bool)

(assert (=> d!73771 m!335711))

(assert (=> b!217586 m!335563))

(assert (=> b!217459 d!73771))

(declare-fun d!73773 () Bool)

(assert (=> d!73773 (= (array_inv!4402 (buf!5205 thiss!1204)) (bvsge (size!4661 (buf!5205 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!217480 d!73773))

(declare-fun d!73775 () Bool)

(declare-fun e!147922 () Bool)

(assert (=> d!73775 e!147922))

(declare-fun res!183102 () Bool)

(assert (=> d!73775 (=> (not res!183102) (not e!147922))))

(declare-fun lt!344473 () (_ BitVec 64))

(declare-fun lt!344471 () (_ BitVec 64))

(declare-fun lt!344468 () (_ BitVec 64))

(assert (=> d!73775 (= res!183102 (= lt!344468 (bvsub lt!344471 lt!344473)))))

(assert (=> d!73775 (or (= (bvand lt!344471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344471 lt!344473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73775 (= lt!344473 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344306))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344306)))))))

(declare-fun lt!344470 () (_ BitVec 64))

(declare-fun lt!344469 () (_ BitVec 64))

(assert (=> d!73775 (= lt!344471 (bvmul lt!344470 lt!344469))))

(assert (=> d!73775 (or (= lt!344470 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344469 (bvsdiv (bvmul lt!344470 lt!344469) lt!344470)))))

(assert (=> d!73775 (= lt!344469 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73775 (= lt!344470 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))))))

(assert (=> d!73775 (= lt!344468 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344306))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344306)))))))

(assert (=> d!73775 (invariant!0 (currentBit!9793 (_2!9928 lt!344306)) (currentByte!9798 (_2!9928 lt!344306)) (size!4661 (buf!5205 (_2!9928 lt!344306))))))

(assert (=> d!73775 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344306))) (currentByte!9798 (_2!9928 lt!344306)) (currentBit!9793 (_2!9928 lt!344306))) lt!344468)))

(declare-fun b!217587 () Bool)

(declare-fun res!183103 () Bool)

(assert (=> b!217587 (=> (not res!183103) (not e!147922))))

(assert (=> b!217587 (= res!183103 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344468))))

(declare-fun b!217588 () Bool)

(declare-fun lt!344472 () (_ BitVec 64))

(assert (=> b!217588 (= e!147922 (bvsle lt!344468 (bvmul lt!344472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217588 (or (= lt!344472 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344472 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344472)))))

(assert (=> b!217588 (= lt!344472 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))))))

(assert (= (and d!73775 res!183102) b!217587))

(assert (= (and b!217587 res!183103) b!217588))

(declare-fun m!335713 () Bool)

(assert (=> d!73775 m!335713))

(assert (=> d!73775 m!335531))

(assert (=> b!217481 d!73775))

(declare-fun d!73777 () Bool)

(declare-fun res!183106 () Bool)

(declare-fun e!147924 () Bool)

(assert (=> d!73777 (=> (not res!183106) (not e!147924))))

(assert (=> d!73777 (= res!183106 (= (size!4661 (buf!5205 thiss!1204)) (size!4661 (buf!5205 (_2!9928 lt!344306)))))))

(assert (=> d!73777 (= (isPrefixOf!0 thiss!1204 (_2!9928 lt!344306)) e!147924)))

(declare-fun b!217589 () Bool)

(declare-fun res!183105 () Bool)

(assert (=> b!217589 (=> (not res!183105) (not e!147924))))

(assert (=> b!217589 (= res!183105 (bvsle (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344306))) (currentByte!9798 (_2!9928 lt!344306)) (currentBit!9793 (_2!9928 lt!344306)))))))

(declare-fun b!217590 () Bool)

(declare-fun e!147923 () Bool)

(assert (=> b!217590 (= e!147924 e!147923)))

(declare-fun res!183104 () Bool)

(assert (=> b!217590 (=> res!183104 e!147923)))

(assert (=> b!217590 (= res!183104 (= (size!4661 (buf!5205 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217591 () Bool)

(assert (=> b!217591 (= e!147923 (arrayBitRangesEq!0 (buf!5205 thiss!1204) (buf!5205 (_2!9928 lt!344306)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204))))))

(assert (= (and d!73777 res!183106) b!217589))

(assert (= (and b!217589 res!183105) b!217590))

(assert (= (and b!217590 (not res!183104)) b!217591))

(assert (=> b!217589 m!335517))

(assert (=> b!217589 m!335533))

(assert (=> b!217591 m!335517))

(assert (=> b!217591 m!335517))

(declare-fun m!335715 () Bool)

(assert (=> b!217591 m!335715))

(assert (=> b!217481 d!73777))

(declare-fun d!73779 () Bool)

(assert (=> d!73779 (isPrefixOf!0 thiss!1204 (_2!9928 lt!344306))))

(declare-fun lt!344476 () Unit!15480)

(declare-fun choose!30 (BitStream!8430 BitStream!8430 BitStream!8430) Unit!15480)

(assert (=> d!73779 (= lt!344476 (choose!30 thiss!1204 (_2!9928 lt!344281) (_2!9928 lt!344306)))))

(assert (=> d!73779 (isPrefixOf!0 thiss!1204 (_2!9928 lt!344281))))

(assert (=> d!73779 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9928 lt!344281) (_2!9928 lt!344306)) lt!344476)))

(declare-fun bs!18011 () Bool)

(assert (= bs!18011 d!73779))

(assert (=> bs!18011 m!335535))

(declare-fun m!335717 () Bool)

(assert (=> bs!18011 m!335717))

(assert (=> bs!18011 m!335511))

(assert (=> b!217481 d!73779))

(declare-fun b!217676 () Bool)

(declare-fun e!147984 () Bool)

(declare-fun lt!344674 () tuple2!18538)

(declare-fun lt!344690 () tuple2!18538)

(assert (=> b!217676 (= e!147984 (= (_2!9927 lt!344674) (_2!9927 lt!344690)))))

(declare-fun b!217677 () Bool)

(declare-fun e!147977 () (_ BitVec 64))

(assert (=> b!217677 (= e!147977 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!217678 () Bool)

(declare-fun res!183188 () Bool)

(declare-fun call!3405 () Bool)

(assert (=> b!217678 (= res!183188 call!3405)))

(declare-fun e!147982 () Bool)

(assert (=> b!217678 (=> (not res!183188) (not e!147982))))

(declare-fun b!217679 () Bool)

(declare-fun e!147978 () tuple2!18540)

(declare-fun Unit!15484 () Unit!15480)

(assert (=> b!217679 (= e!147978 (tuple2!18541 Unit!15484 (_2!9928 lt!344281)))))

(declare-fun lt!344714 () Unit!15480)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8430) Unit!15480)

(assert (=> b!217679 (= lt!344714 (lemmaIsPrefixRefl!0 (_2!9928 lt!344281)))))

(assert (=> b!217679 call!3405))

(declare-fun lt!344684 () Unit!15480)

(assert (=> b!217679 (= lt!344684 lt!344714)))

(declare-fun b!217680 () Bool)

(declare-fun res!183189 () Bool)

(declare-fun e!147983 () Bool)

(assert (=> b!217680 (=> (not res!183189) (not e!147983))))

(declare-fun lt!344711 () tuple2!18540)

(declare-fun lt!344677 () (_ BitVec 64))

(declare-fun lt!344683 () (_ BitVec 64))

(assert (=> b!217680 (= res!183189 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344711))) (currentByte!9798 (_2!9928 lt!344711)) (currentBit!9793 (_2!9928 lt!344711))) (bvsub lt!344683 lt!344677)))))

(assert (=> b!217680 (or (= (bvand lt!344683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344677 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344683 lt!344677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217680 (= lt!344677 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!344706 () (_ BitVec 64))

(declare-fun lt!344678 () (_ BitVec 64))

(assert (=> b!217680 (= lt!344683 (bvadd lt!344706 lt!344678))))

(assert (=> b!217680 (or (not (= (bvand lt!344706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344678 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344706 lt!344678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217680 (= lt!344678 ((_ sign_extend 32) nBits!348))))

(assert (=> b!217680 (= lt!344706 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(declare-fun b!217681 () Bool)

(declare-fun e!147981 () Bool)

(declare-fun lt!344696 () tuple2!18538)

(declare-fun lt!344703 () tuple2!18540)

(assert (=> b!217681 (= e!147981 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344696))) (currentByte!9798 (_1!9927 lt!344696)) (currentBit!9793 (_1!9927 lt!344696))) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344703))) (currentByte!9798 (_2!9928 lt!344703)) (currentBit!9793 (_2!9928 lt!344703)))))))

(declare-fun b!217682 () Bool)

(declare-fun e!147985 () Bool)

(declare-fun lt!344685 () tuple2!18542)

(declare-fun lt!344700 () tuple2!18544)

(assert (=> b!217682 (= e!147985 (= (_1!9929 lt!344685) (_2!9930 lt!344700)))))

(declare-fun b!217683 () Bool)

(declare-fun e!147980 () Bool)

(declare-fun lt!344701 () (_ BitVec 64))

(assert (=> b!217683 (= e!147980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344281)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344701))))

(declare-fun d!73781 () Bool)

(assert (=> d!73781 e!147983))

(declare-fun res!183194 () Bool)

(assert (=> d!73781 (=> (not res!183194) (not e!147983))))

(assert (=> d!73781 (= res!183194 (invariant!0 (currentBit!9793 (_2!9928 lt!344711)) (currentByte!9798 (_2!9928 lt!344711)) (size!4661 (buf!5205 (_2!9928 lt!344711)))))))

(assert (=> d!73781 (= lt!344711 e!147978)))

(declare-fun c!10634 () Bool)

(assert (=> d!73781 (= c!10634 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!73781 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73781 (= (appendBitsLSBFirstLoopTR!0 (_2!9928 lt!344281) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!344711)))

(declare-fun b!217684 () Bool)

(declare-fun res!183185 () Bool)

(assert (=> b!217684 (=> (not res!183185) (not e!147983))))

(assert (=> b!217684 (= res!183185 (isPrefixOf!0 (_2!9928 lt!344281) (_2!9928 lt!344711)))))

(declare-fun b!217685 () Bool)

(assert (=> b!217685 (= e!147977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!3402 () Bool)

(assert (=> bm!3402 (= call!3405 (isPrefixOf!0 (_2!9928 lt!344281) (ite c!10634 (_2!9928 lt!344281) (_2!9928 lt!344703))))))

(declare-fun b!217686 () Bool)

(declare-fun e!147979 () Bool)

(assert (=> b!217686 (= e!147983 e!147979)))

(declare-fun res!183191 () Bool)

(assert (=> b!217686 (=> (not res!183191) (not e!147979))))

(declare-fun lt!344689 () tuple2!18542)

(assert (=> b!217686 (= res!183191 (= (_2!9929 lt!344689) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!344708 () tuple2!18544)

(assert (=> b!217686 (= lt!344689 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344708) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!344672 () Unit!15480)

(declare-fun lt!344679 () Unit!15480)

(assert (=> b!217686 (= lt!344672 lt!344679)))

(assert (=> b!217686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344711)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344701)))

(assert (=> b!217686 (= lt!344679 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9928 lt!344281) (buf!5205 (_2!9928 lt!344711)) lt!344701))))

(assert (=> b!217686 e!147980))

(declare-fun res!183184 () Bool)

(assert (=> b!217686 (=> (not res!183184) (not e!147980))))

(assert (=> b!217686 (= res!183184 (and (= (size!4661 (buf!5205 (_2!9928 lt!344281))) (size!4661 (buf!5205 (_2!9928 lt!344711)))) (bvsge lt!344701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217686 (= lt!344701 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!217686 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!217686 (= lt!344708 (reader!0 (_2!9928 lt!344281) (_2!9928 lt!344711)))))

(declare-fun b!217687 () Bool)

(assert (=> b!217687 (= lt!344696 (readBitPure!0 (readerFrom!0 (_2!9928 lt!344703) (currentBit!9793 (_2!9928 lt!344281)) (currentByte!9798 (_2!9928 lt!344281)))))))

(declare-fun res!183195 () Bool)

(declare-fun lt!344702 () Bool)

(assert (=> b!217687 (= res!183195 (and (= (_2!9927 lt!344696) lt!344702) (= (_1!9927 lt!344696) (_2!9928 lt!344703))))))

(assert (=> b!217687 (=> (not res!183195) (not e!147981))))

(assert (=> b!217687 (= e!147982 e!147981)))

(declare-fun b!217688 () Bool)

(declare-fun res!183186 () Bool)

(assert (=> b!217688 (= res!183186 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344703))) (currentByte!9798 (_2!9928 lt!344703)) (currentBit!9793 (_2!9928 lt!344703))) (bvadd (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!217688 (=> (not res!183186) (not e!147982))))

(declare-fun b!217689 () Bool)

(assert (=> b!217689 (= e!147979 (= (_1!9929 lt!344689) (_2!9930 lt!344708)))))

(declare-fun b!217690 () Bool)

(declare-fun res!183190 () Bool)

(assert (=> b!217690 (=> (not res!183190) (not e!147983))))

(assert (=> b!217690 (= res!183190 (= (size!4661 (buf!5205 (_2!9928 lt!344281))) (size!4661 (buf!5205 (_2!9928 lt!344711)))))))

(declare-fun b!217691 () Bool)

(declare-fun lt!344664 () tuple2!18540)

(assert (=> b!217691 (= e!147978 (tuple2!18541 (_1!9928 lt!344664) (_2!9928 lt!344664)))))

(assert (=> b!217691 (= lt!344702 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217691 (= lt!344703 (appendBit!0 (_2!9928 lt!344281) lt!344702))))

(declare-fun res!183193 () Bool)

(assert (=> b!217691 (= res!183193 (= (size!4661 (buf!5205 (_2!9928 lt!344281))) (size!4661 (buf!5205 (_2!9928 lt!344703)))))))

(assert (=> b!217691 (=> (not res!183193) (not e!147982))))

(assert (=> b!217691 e!147982))

(declare-fun lt!344692 () tuple2!18540)

(assert (=> b!217691 (= lt!344692 lt!344703)))

(assert (=> b!217691 (= lt!344664 (appendBitsLSBFirstLoopTR!0 (_2!9928 lt!344692) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!344691 () Unit!15480)

(assert (=> b!217691 (= lt!344691 (lemmaIsPrefixTransitive!0 (_2!9928 lt!344281) (_2!9928 lt!344692) (_2!9928 lt!344664)))))

(assert (=> b!217691 (isPrefixOf!0 (_2!9928 lt!344281) (_2!9928 lt!344664))))

(declare-fun lt!344710 () Unit!15480)

(assert (=> b!217691 (= lt!344710 lt!344691)))

(assert (=> b!217691 (invariant!0 (currentBit!9793 (_2!9928 lt!344281)) (currentByte!9798 (_2!9928 lt!344281)) (size!4661 (buf!5205 (_2!9928 lt!344692))))))

(declare-fun lt!344712 () BitStream!8430)

(assert (=> b!217691 (= lt!344712 (BitStream!8431 (buf!5205 (_2!9928 lt!344692)) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(assert (=> b!217691 (invariant!0 (currentBit!9793 lt!344712) (currentByte!9798 lt!344712) (size!4661 (buf!5205 (_2!9928 lt!344664))))))

(declare-fun lt!344671 () BitStream!8430)

(assert (=> b!217691 (= lt!344671 (BitStream!8431 (buf!5205 (_2!9928 lt!344664)) (currentByte!9798 lt!344712) (currentBit!9793 lt!344712)))))

(assert (=> b!217691 (= lt!344674 (readBitPure!0 lt!344712))))

(assert (=> b!217691 (= lt!344690 (readBitPure!0 lt!344671))))

(declare-fun lt!344681 () Unit!15480)

(assert (=> b!217691 (= lt!344681 (readBitPrefixLemma!0 lt!344712 (_2!9928 lt!344664)))))

(declare-fun res!183187 () Bool)

(assert (=> b!217691 (= res!183187 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344674))) (currentByte!9798 (_1!9927 lt!344674)) (currentBit!9793 (_1!9927 lt!344674))) (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344690))) (currentByte!9798 (_1!9927 lt!344690)) (currentBit!9793 (_1!9927 lt!344690)))))))

(assert (=> b!217691 (=> (not res!183187) (not e!147984))))

(assert (=> b!217691 e!147984))

(declare-fun lt!344667 () Unit!15480)

(assert (=> b!217691 (= lt!344667 lt!344681)))

(declare-fun lt!344694 () tuple2!18544)

(assert (=> b!217691 (= lt!344694 (reader!0 (_2!9928 lt!344281) (_2!9928 lt!344664)))))

(declare-fun lt!344676 () tuple2!18544)

(assert (=> b!217691 (= lt!344676 (reader!0 (_2!9928 lt!344692) (_2!9928 lt!344664)))))

(declare-fun lt!344686 () tuple2!18538)

(assert (=> b!217691 (= lt!344686 (readBitPure!0 (_1!9930 lt!344694)))))

(assert (=> b!217691 (= (_2!9927 lt!344686) lt!344702)))

(declare-fun lt!344695 () Unit!15480)

(declare-fun Unit!15485 () Unit!15480)

(assert (=> b!217691 (= lt!344695 Unit!15485)))

(declare-fun lt!344693 () (_ BitVec 64))

(assert (=> b!217691 (= lt!344693 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344715 () (_ BitVec 64))

(assert (=> b!217691 (= lt!344715 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344709 () Unit!15480)

(assert (=> b!217691 (= lt!344709 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9928 lt!344281) (buf!5205 (_2!9928 lt!344664)) lt!344715))))

(assert (=> b!217691 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344664)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344715)))

(declare-fun lt!344699 () Unit!15480)

(assert (=> b!217691 (= lt!344699 lt!344709)))

(declare-fun lt!344661 () tuple2!18542)

(assert (=> b!217691 (= lt!344661 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344694) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344693))))

(declare-fun lt!344698 () (_ BitVec 64))

(assert (=> b!217691 (= lt!344698 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!344687 () Unit!15480)

(assert (=> b!217691 (= lt!344687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9928 lt!344692) (buf!5205 (_2!9928 lt!344664)) lt!344698))))

(assert (=> b!217691 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344664)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344692))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344692))) lt!344698)))

(declare-fun lt!344666 () Unit!15480)

(assert (=> b!217691 (= lt!344666 lt!344687)))

(declare-fun lt!344669 () tuple2!18542)

(assert (=> b!217691 (= lt!344669 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344676) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!344693 (ite (_2!9927 lt!344686) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!344662 () tuple2!18542)

(assert (=> b!217691 (= lt!344662 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344694) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344693))))

(declare-fun c!10633 () Bool)

(assert (=> b!217691 (= c!10633 (_2!9927 (readBitPure!0 (_1!9930 lt!344694))))))

(declare-fun lt!344673 () tuple2!18542)

(assert (=> b!217691 (= lt!344673 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9930 lt!344694) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!344693 e!147977)))))

(declare-fun lt!344670 () Unit!15480)

(assert (=> b!217691 (= lt!344670 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9930 lt!344694) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344693))))

(assert (=> b!217691 (and (= (_2!9929 lt!344662) (_2!9929 lt!344673)) (= (_1!9929 lt!344662) (_1!9929 lt!344673)))))

(declare-fun lt!344680 () Unit!15480)

(assert (=> b!217691 (= lt!344680 lt!344670)))

(assert (=> b!217691 (= (_1!9930 lt!344694) (withMovedBitIndex!0 (_2!9930 lt!344694) (bvsub (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344664))) (currentByte!9798 (_2!9928 lt!344664)) (currentBit!9793 (_2!9928 lt!344664))))))))

(declare-fun lt!344697 () Unit!15480)

(declare-fun Unit!15486 () Unit!15480)

(assert (=> b!217691 (= lt!344697 Unit!15486)))

(assert (=> b!217691 (= (_1!9930 lt!344676) (withMovedBitIndex!0 (_2!9930 lt!344676) (bvsub (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344692))) (currentByte!9798 (_2!9928 lt!344692)) (currentBit!9793 (_2!9928 lt!344692))) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344664))) (currentByte!9798 (_2!9928 lt!344664)) (currentBit!9793 (_2!9928 lt!344664))))))))

(declare-fun lt!344688 () Unit!15480)

(declare-fun Unit!15487 () Unit!15480)

(assert (=> b!217691 (= lt!344688 Unit!15487)))

(assert (=> b!217691 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))) (bvsub (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344692))) (currentByte!9798 (_2!9928 lt!344692)) (currentBit!9793 (_2!9928 lt!344692))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!344675 () Unit!15480)

(declare-fun Unit!15488 () Unit!15480)

(assert (=> b!217691 (= lt!344675 Unit!15488)))

(assert (=> b!217691 (= (_2!9929 lt!344661) (_2!9929 lt!344669))))

(declare-fun lt!344665 () Unit!15480)

(declare-fun Unit!15489 () Unit!15480)

(assert (=> b!217691 (= lt!344665 Unit!15489)))

(assert (=> b!217691 (invariant!0 (currentBit!9793 (_2!9928 lt!344664)) (currentByte!9798 (_2!9928 lt!344664)) (size!4661 (buf!5205 (_2!9928 lt!344664))))))

(declare-fun lt!344704 () Unit!15480)

(declare-fun Unit!15490 () Unit!15480)

(assert (=> b!217691 (= lt!344704 Unit!15490)))

(assert (=> b!217691 (= (size!4661 (buf!5205 (_2!9928 lt!344281))) (size!4661 (buf!5205 (_2!9928 lt!344664))))))

(declare-fun lt!344705 () Unit!15480)

(declare-fun Unit!15491 () Unit!15480)

(assert (=> b!217691 (= lt!344705 Unit!15491)))

(assert (=> b!217691 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344664))) (currentByte!9798 (_2!9928 lt!344664)) (currentBit!9793 (_2!9928 lt!344664))) (bvsub (bvadd (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344682 () Unit!15480)

(declare-fun Unit!15492 () Unit!15480)

(assert (=> b!217691 (= lt!344682 Unit!15492)))

(declare-fun lt!344663 () Unit!15480)

(declare-fun Unit!15493 () Unit!15480)

(assert (=> b!217691 (= lt!344663 Unit!15493)))

(assert (=> b!217691 (= lt!344700 (reader!0 (_2!9928 lt!344281) (_2!9928 lt!344664)))))

(declare-fun lt!344713 () (_ BitVec 64))

(assert (=> b!217691 (= lt!344713 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344660 () Unit!15480)

(assert (=> b!217691 (= lt!344660 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9928 lt!344281) (buf!5205 (_2!9928 lt!344664)) lt!344713))))

(assert (=> b!217691 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344664)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344713)))

(declare-fun lt!344707 () Unit!15480)

(assert (=> b!217691 (= lt!344707 lt!344660)))

(assert (=> b!217691 (= lt!344685 (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!183192 () Bool)

(assert (=> b!217691 (= res!183192 (= (_2!9929 lt!344685) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!217691 (=> (not res!183192) (not e!147985))))

(assert (=> b!217691 e!147985))

(declare-fun lt!344668 () Unit!15480)

(declare-fun Unit!15494 () Unit!15480)

(assert (=> b!217691 (= lt!344668 Unit!15494)))

(assert (= (and d!73781 c!10634) b!217679))

(assert (= (and d!73781 (not c!10634)) b!217691))

(assert (= (and b!217691 res!183193) b!217688))

(assert (= (and b!217688 res!183186) b!217678))

(assert (= (and b!217678 res!183188) b!217687))

(assert (= (and b!217687 res!183195) b!217681))

(assert (= (and b!217691 res!183187) b!217676))

(assert (= (and b!217691 c!10633) b!217677))

(assert (= (and b!217691 (not c!10633)) b!217685))

(assert (= (and b!217691 res!183192) b!217682))

(assert (= (or b!217679 b!217678) bm!3402))

(assert (= (and d!73781 res!183194) b!217690))

(assert (= (and b!217690 res!183190) b!217680))

(assert (= (and b!217680 res!183189) b!217684))

(assert (= (and b!217684 res!183185) b!217686))

(assert (= (and b!217686 res!183184) b!217683))

(assert (= (and b!217686 res!183191) b!217689))

(declare-fun m!335771 () Bool)

(assert (=> b!217681 m!335771))

(declare-fun m!335773 () Bool)

(assert (=> b!217681 m!335773))

(declare-fun m!335775 () Bool)

(assert (=> b!217680 m!335775))

(assert (=> b!217680 m!335515))

(declare-fun m!335777 () Bool)

(assert (=> b!217683 m!335777))

(declare-fun m!335779 () Bool)

(assert (=> b!217679 m!335779))

(declare-fun m!335781 () Bool)

(assert (=> b!217687 m!335781))

(assert (=> b!217687 m!335781))

(declare-fun m!335783 () Bool)

(assert (=> b!217687 m!335783))

(declare-fun m!335785 () Bool)

(assert (=> b!217684 m!335785))

(declare-fun m!335787 () Bool)

(assert (=> bm!3402 m!335787))

(declare-fun m!335789 () Bool)

(assert (=> d!73781 m!335789))

(declare-fun m!335791 () Bool)

(assert (=> b!217691 m!335791))

(declare-fun m!335793 () Bool)

(assert (=> b!217691 m!335793))

(declare-fun m!335795 () Bool)

(assert (=> b!217691 m!335795))

(assert (=> b!217691 m!335515))

(declare-fun m!335797 () Bool)

(assert (=> b!217691 m!335797))

(declare-fun m!335799 () Bool)

(assert (=> b!217691 m!335799))

(declare-fun m!335801 () Bool)

(assert (=> b!217691 m!335801))

(declare-fun m!335803 () Bool)

(assert (=> b!217691 m!335803))

(declare-fun m!335805 () Bool)

(assert (=> b!217691 m!335805))

(declare-fun m!335807 () Bool)

(assert (=> b!217691 m!335807))

(declare-fun m!335809 () Bool)

(assert (=> b!217691 m!335809))

(declare-fun m!335811 () Bool)

(assert (=> b!217691 m!335811))

(declare-fun m!335813 () Bool)

(assert (=> b!217691 m!335813))

(declare-fun m!335815 () Bool)

(assert (=> b!217691 m!335815))

(declare-fun m!335817 () Bool)

(assert (=> b!217691 m!335817))

(declare-fun m!335819 () Bool)

(assert (=> b!217691 m!335819))

(declare-fun m!335821 () Bool)

(assert (=> b!217691 m!335821))

(declare-fun m!335823 () Bool)

(assert (=> b!217691 m!335823))

(declare-fun m!335825 () Bool)

(assert (=> b!217691 m!335825))

(assert (=> b!217691 m!335513))

(declare-fun m!335827 () Bool)

(assert (=> b!217691 m!335827))

(declare-fun m!335829 () Bool)

(assert (=> b!217691 m!335829))

(declare-fun m!335831 () Bool)

(assert (=> b!217691 m!335831))

(declare-fun m!335833 () Bool)

(assert (=> b!217691 m!335833))

(declare-fun m!335835 () Bool)

(assert (=> b!217691 m!335835))

(declare-fun m!335837 () Bool)

(assert (=> b!217691 m!335837))

(declare-fun m!335839 () Bool)

(assert (=> b!217691 m!335839))

(declare-fun m!335841 () Bool)

(assert (=> b!217691 m!335841))

(declare-fun m!335843 () Bool)

(assert (=> b!217691 m!335843))

(declare-fun m!335845 () Bool)

(assert (=> b!217691 m!335845))

(assert (=> b!217691 m!335797))

(declare-fun m!335847 () Bool)

(assert (=> b!217691 m!335847))

(declare-fun m!335849 () Bool)

(assert (=> b!217691 m!335849))

(declare-fun m!335851 () Bool)

(assert (=> b!217691 m!335851))

(declare-fun m!335853 () Bool)

(assert (=> b!217691 m!335853))

(assert (=> b!217688 m!335773))

(assert (=> b!217688 m!335515))

(declare-fun m!335855 () Bool)

(assert (=> b!217686 m!335855))

(assert (=> b!217686 m!335803))

(assert (=> b!217686 m!335513))

(declare-fun m!335857 () Bool)

(assert (=> b!217686 m!335857))

(declare-fun m!335859 () Bool)

(assert (=> b!217686 m!335859))

(declare-fun m!335861 () Bool)

(assert (=> b!217686 m!335861))

(assert (=> b!217481 d!73781))

(declare-fun d!73833 () Bool)

(assert (=> d!73833 (= (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344306)))) (and (bvsge (currentBit!9793 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9793 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9798 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344306)))) (and (= (currentBit!9793 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344306))))))))))

(assert (=> b!217470 d!73833))

(declare-fun d!73835 () Bool)

(assert (=> d!73835 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!217460 d!73835))

(declare-fun d!73837 () Bool)

(assert (=> d!73837 (= (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 thiss!1204))) (and (bvsge (currentBit!9793 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9793 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9798 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9798 thiss!1204) (size!4661 (buf!5205 thiss!1204))) (and (= (currentBit!9793 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9798 thiss!1204) (size!4661 (buf!5205 thiss!1204)))))))))

(assert (=> b!217482 d!73837))

(declare-fun d!73839 () Bool)

(declare-fun e!147986 () Bool)

(assert (=> d!73839 e!147986))

(declare-fun res!183196 () Bool)

(assert (=> d!73839 (=> (not res!183196) (not e!147986))))

(declare-fun lt!344721 () (_ BitVec 64))

(declare-fun lt!344716 () (_ BitVec 64))

(declare-fun lt!344719 () (_ BitVec 64))

(assert (=> d!73839 (= res!183196 (= lt!344716 (bvsub lt!344719 lt!344721)))))

(assert (=> d!73839 (or (= (bvand lt!344719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344719 lt!344721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73839 (= lt!344721 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344281)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281)))))))

(declare-fun lt!344718 () (_ BitVec 64))

(declare-fun lt!344717 () (_ BitVec 64))

(assert (=> d!73839 (= lt!344719 (bvmul lt!344718 lt!344717))))

(assert (=> d!73839 (or (= lt!344718 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344717 (bvsdiv (bvmul lt!344718 lt!344717) lt!344718)))))

(assert (=> d!73839 (= lt!344717 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73839 (= lt!344718 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(assert (=> d!73839 (= lt!344716 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281)))))))

(assert (=> d!73839 (invariant!0 (currentBit!9793 (_2!9928 lt!344281)) (currentByte!9798 (_2!9928 lt!344281)) (size!4661 (buf!5205 (_2!9928 lt!344281))))))

(assert (=> d!73839 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))) lt!344716)))

(declare-fun b!217692 () Bool)

(declare-fun res!183197 () Bool)

(assert (=> b!217692 (=> (not res!183197) (not e!147986))))

(assert (=> b!217692 (= res!183197 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344716))))

(declare-fun b!217693 () Bool)

(declare-fun lt!344720 () (_ BitVec 64))

(assert (=> b!217693 (= e!147986 (bvsle lt!344716 (bvmul lt!344720 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217693 (or (= lt!344720 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344720 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344720)))))

(assert (=> b!217693 (= lt!344720 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344281)))))))

(assert (= (and d!73839 res!183196) b!217692))

(assert (= (and b!217692 res!183197) b!217693))

(declare-fun m!335863 () Bool)

(assert (=> d!73839 m!335863))

(assert (=> d!73839 m!335711))

(assert (=> b!217473 d!73839))

(declare-fun d!73841 () Bool)

(declare-fun e!147987 () Bool)

(assert (=> d!73841 e!147987))

(declare-fun res!183198 () Bool)

(assert (=> d!73841 (=> (not res!183198) (not e!147987))))

(declare-fun lt!344722 () (_ BitVec 64))

(declare-fun lt!344727 () (_ BitVec 64))

(declare-fun lt!344725 () (_ BitVec 64))

(assert (=> d!73841 (= res!183198 (= lt!344722 (bvsub lt!344725 lt!344727)))))

(assert (=> d!73841 (or (= (bvand lt!344725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344727 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344725 lt!344727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73841 (= lt!344727 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204))))))

(declare-fun lt!344724 () (_ BitVec 64))

(declare-fun lt!344723 () (_ BitVec 64))

(assert (=> d!73841 (= lt!344725 (bvmul lt!344724 lt!344723))))

(assert (=> d!73841 (or (= lt!344724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344723 (bvsdiv (bvmul lt!344724 lt!344723) lt!344724)))))

(assert (=> d!73841 (= lt!344723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73841 (= lt!344724 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))))))

(assert (=> d!73841 (= lt!344722 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 thiss!1204))))))

(assert (=> d!73841 (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 thiss!1204)))))

(assert (=> d!73841 (= (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)) lt!344722)))

(declare-fun b!217694 () Bool)

(declare-fun res!183199 () Bool)

(assert (=> b!217694 (=> (not res!183199) (not e!147987))))

(assert (=> b!217694 (= res!183199 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344722))))

(declare-fun b!217695 () Bool)

(declare-fun lt!344726 () (_ BitVec 64))

(assert (=> b!217695 (= e!147987 (bvsle lt!344722 (bvmul lt!344726 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217695 (or (= lt!344726 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344726 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344726)))))

(assert (=> b!217695 (= lt!344726 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))))))

(assert (= (and d!73841 res!183198) b!217694))

(assert (= (and b!217694 res!183199) b!217695))

(assert (=> d!73841 m!335703))

(assert (=> d!73841 m!335525))

(assert (=> b!217473 d!73841))

(declare-fun b!217705 () Bool)

(declare-fun res!183209 () Bool)

(declare-fun e!147993 () Bool)

(assert (=> b!217705 (=> (not res!183209) (not e!147993))))

(declare-fun lt!344738 () (_ BitVec 64))

(declare-fun lt!344736 () (_ BitVec 64))

(declare-fun lt!344737 () tuple2!18540)

(assert (=> b!217705 (= res!183209 (= (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344737))) (currentByte!9798 (_2!9928 lt!344737)) (currentBit!9793 (_2!9928 lt!344737))) (bvadd lt!344738 lt!344736)))))

(assert (=> b!217705 (or (not (= (bvand lt!344738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344736 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344738 lt!344736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217705 (= lt!344736 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!217705 (= lt!344738 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(declare-fun b!217706 () Bool)

(declare-fun res!183208 () Bool)

(assert (=> b!217706 (=> (not res!183208) (not e!147993))))

(assert (=> b!217706 (= res!183208 (isPrefixOf!0 thiss!1204 (_2!9928 lt!344737)))))

(declare-fun b!217707 () Bool)

(declare-fun e!147992 () Bool)

(assert (=> b!217707 (= e!147993 e!147992)))

(declare-fun res!183210 () Bool)

(assert (=> b!217707 (=> (not res!183210) (not e!147992))))

(declare-fun lt!344739 () tuple2!18538)

(assert (=> b!217707 (= res!183210 (and (= (_2!9927 lt!344739) lt!344293) (= (_1!9927 lt!344739) (_2!9928 lt!344737))))))

(assert (=> b!217707 (= lt!344739 (readBitPure!0 (readerFrom!0 (_2!9928 lt!344737) (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204))))))

(declare-fun d!73843 () Bool)

(assert (=> d!73843 e!147993))

(declare-fun res!183211 () Bool)

(assert (=> d!73843 (=> (not res!183211) (not e!147993))))

(assert (=> d!73843 (= res!183211 (= (size!4661 (buf!5205 thiss!1204)) (size!4661 (buf!5205 (_2!9928 lt!344737)))))))

(declare-fun choose!16 (BitStream!8430 Bool) tuple2!18540)

(assert (=> d!73843 (= lt!344737 (choose!16 thiss!1204 lt!344293))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!73843 (validate_offset_bit!0 ((_ sign_extend 32) (size!4661 (buf!5205 thiss!1204))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204)))))

(assert (=> d!73843 (= (appendBit!0 thiss!1204 lt!344293) lt!344737)))

(declare-fun b!217708 () Bool)

(assert (=> b!217708 (= e!147992 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344739))) (currentByte!9798 (_1!9927 lt!344739)) (currentBit!9793 (_1!9927 lt!344739))) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344737))) (currentByte!9798 (_2!9928 lt!344737)) (currentBit!9793 (_2!9928 lt!344737)))))))

(assert (= (and d!73843 res!183211) b!217705))

(assert (= (and b!217705 res!183209) b!217706))

(assert (= (and b!217706 res!183208) b!217707))

(assert (= (and b!217707 res!183210) b!217708))

(declare-fun m!335865 () Bool)

(assert (=> d!73843 m!335865))

(declare-fun m!335867 () Bool)

(assert (=> d!73843 m!335867))

(declare-fun m!335869 () Bool)

(assert (=> b!217708 m!335869))

(declare-fun m!335871 () Bool)

(assert (=> b!217708 m!335871))

(assert (=> b!217705 m!335871))

(assert (=> b!217705 m!335517))

(declare-fun m!335873 () Bool)

(assert (=> b!217706 m!335873))

(declare-fun m!335875 () Bool)

(assert (=> b!217707 m!335875))

(assert (=> b!217707 m!335875))

(declare-fun m!335877 () Bool)

(assert (=> b!217707 m!335877))

(assert (=> b!217473 d!73843))

(declare-fun d!73845 () Bool)

(assert (=> d!73845 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 thiss!1204))))))

(declare-fun bs!18019 () Bool)

(assert (= bs!18019 d!73845))

(assert (=> bs!18019 m!335525))

(assert (=> start!45146 d!73845))

(declare-fun d!73847 () Bool)

(assert (=> d!73847 (= (invariant!0 (currentBit!9793 (_2!9928 lt!344306)) (currentByte!9798 (_2!9928 lt!344306)) (size!4661 (buf!5205 (_2!9928 lt!344306)))) (and (bvsge (currentBit!9793 (_2!9928 lt!344306)) #b00000000000000000000000000000000) (bvslt (currentBit!9793 (_2!9928 lt!344306)) #b00000000000000000000000000001000) (bvsge (currentByte!9798 (_2!9928 lt!344306)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9798 (_2!9928 lt!344306)) (size!4661 (buf!5205 (_2!9928 lt!344306)))) (and (= (currentBit!9793 (_2!9928 lt!344306)) #b00000000000000000000000000000000) (= (currentByte!9798 (_2!9928 lt!344306)) (size!4661 (buf!5205 (_2!9928 lt!344306))))))))))

(assert (=> b!217462 d!73847))

(declare-fun d!73849 () Bool)

(assert (=> d!73849 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344305) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281)))) lt!344305))))

(declare-fun bs!18020 () Bool)

(assert (= bs!18020 d!73849))

(declare-fun m!335879 () Bool)

(assert (=> bs!18020 m!335879))

(assert (=> b!217463 d!73849))

(declare-fun b!217719 () Bool)

(declare-fun res!183219 () Bool)

(declare-fun e!147999 () Bool)

(assert (=> b!217719 (=> (not res!183219) (not e!147999))))

(declare-fun lt!344784 () tuple2!18544)

(assert (=> b!217719 (= res!183219 (isPrefixOf!0 (_2!9930 lt!344784) (_2!9928 lt!344306)))))

(declare-fun b!217720 () Bool)

(declare-fun e!147998 () Unit!15480)

(declare-fun Unit!15495 () Unit!15480)

(assert (=> b!217720 (= e!147998 Unit!15495)))

(declare-fun d!73851 () Bool)

(assert (=> d!73851 e!147999))

(declare-fun res!183218 () Bool)

(assert (=> d!73851 (=> (not res!183218) (not e!147999))))

(assert (=> d!73851 (= res!183218 (isPrefixOf!0 (_1!9930 lt!344784) (_2!9930 lt!344784)))))

(declare-fun lt!344790 () BitStream!8430)

(assert (=> d!73851 (= lt!344784 (tuple2!18545 lt!344790 (_2!9928 lt!344306)))))

(declare-fun lt!344798 () Unit!15480)

(declare-fun lt!344789 () Unit!15480)

(assert (=> d!73851 (= lt!344798 lt!344789)))

(assert (=> d!73851 (isPrefixOf!0 lt!344790 (_2!9928 lt!344306))))

(assert (=> d!73851 (= lt!344789 (lemmaIsPrefixTransitive!0 lt!344790 (_2!9928 lt!344306) (_2!9928 lt!344306)))))

(declare-fun lt!344788 () Unit!15480)

(declare-fun lt!344785 () Unit!15480)

(assert (=> d!73851 (= lt!344788 lt!344785)))

(assert (=> d!73851 (isPrefixOf!0 lt!344790 (_2!9928 lt!344306))))

(assert (=> d!73851 (= lt!344785 (lemmaIsPrefixTransitive!0 lt!344790 (_2!9928 lt!344281) (_2!9928 lt!344306)))))

(declare-fun lt!344791 () Unit!15480)

(assert (=> d!73851 (= lt!344791 e!147998)))

(declare-fun c!10637 () Bool)

(assert (=> d!73851 (= c!10637 (not (= (size!4661 (buf!5205 (_2!9928 lt!344281))) #b00000000000000000000000000000000)))))

(declare-fun lt!344781 () Unit!15480)

(declare-fun lt!344794 () Unit!15480)

(assert (=> d!73851 (= lt!344781 lt!344794)))

(assert (=> d!73851 (isPrefixOf!0 (_2!9928 lt!344306) (_2!9928 lt!344306))))

(assert (=> d!73851 (= lt!344794 (lemmaIsPrefixRefl!0 (_2!9928 lt!344306)))))

(declare-fun lt!344796 () Unit!15480)

(declare-fun lt!344792 () Unit!15480)

(assert (=> d!73851 (= lt!344796 lt!344792)))

(assert (=> d!73851 (= lt!344792 (lemmaIsPrefixRefl!0 (_2!9928 lt!344306)))))

(declare-fun lt!344782 () Unit!15480)

(declare-fun lt!344787 () Unit!15480)

(assert (=> d!73851 (= lt!344782 lt!344787)))

(assert (=> d!73851 (isPrefixOf!0 lt!344790 lt!344790)))

(assert (=> d!73851 (= lt!344787 (lemmaIsPrefixRefl!0 lt!344790))))

(declare-fun lt!344786 () Unit!15480)

(declare-fun lt!344795 () Unit!15480)

(assert (=> d!73851 (= lt!344786 lt!344795)))

(assert (=> d!73851 (isPrefixOf!0 (_2!9928 lt!344281) (_2!9928 lt!344281))))

(assert (=> d!73851 (= lt!344795 (lemmaIsPrefixRefl!0 (_2!9928 lt!344281)))))

(assert (=> d!73851 (= lt!344790 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(assert (=> d!73851 (isPrefixOf!0 (_2!9928 lt!344281) (_2!9928 lt!344306))))

(assert (=> d!73851 (= (reader!0 (_2!9928 lt!344281) (_2!9928 lt!344306)) lt!344784)))

(declare-fun b!217721 () Bool)

(declare-fun res!183220 () Bool)

(assert (=> b!217721 (=> (not res!183220) (not e!147999))))

(assert (=> b!217721 (= res!183220 (isPrefixOf!0 (_1!9930 lt!344784) (_2!9928 lt!344281)))))

(declare-fun b!217722 () Bool)

(declare-fun lt!344780 () (_ BitVec 64))

(declare-fun lt!344783 () (_ BitVec 64))

(assert (=> b!217722 (= e!147999 (= (_1!9930 lt!344784) (withMovedBitIndex!0 (_2!9930 lt!344784) (bvsub lt!344783 lt!344780))))))

(assert (=> b!217722 (or (= (bvand lt!344783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344783 lt!344780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217722 (= lt!344780 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344306))) (currentByte!9798 (_2!9928 lt!344306)) (currentBit!9793 (_2!9928 lt!344306))))))

(assert (=> b!217722 (= lt!344783 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(declare-fun b!217723 () Bool)

(declare-fun lt!344797 () Unit!15480)

(assert (=> b!217723 (= e!147998 lt!344797)))

(declare-fun lt!344793 () (_ BitVec 64))

(assert (=> b!217723 (= lt!344793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!344799 () (_ BitVec 64))

(assert (=> b!217723 (= lt!344799 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10615 array!10615 (_ BitVec 64) (_ BitVec 64)) Unit!15480)

(assert (=> b!217723 (= lt!344797 (arrayBitRangesEqSymmetric!0 (buf!5205 (_2!9928 lt!344281)) (buf!5205 (_2!9928 lt!344306)) lt!344793 lt!344799))))

(assert (=> b!217723 (arrayBitRangesEq!0 (buf!5205 (_2!9928 lt!344306)) (buf!5205 (_2!9928 lt!344281)) lt!344793 lt!344799)))

(assert (= (and d!73851 c!10637) b!217723))

(assert (= (and d!73851 (not c!10637)) b!217720))

(assert (= (and d!73851 res!183218) b!217721))

(assert (= (and b!217721 res!183220) b!217719))

(assert (= (and b!217719 res!183219) b!217722))

(assert (=> d!73851 m!335779))

(assert (=> d!73851 m!335527))

(declare-fun m!335881 () Bool)

(assert (=> d!73851 m!335881))

(declare-fun m!335883 () Bool)

(assert (=> d!73851 m!335883))

(declare-fun m!335885 () Bool)

(assert (=> d!73851 m!335885))

(declare-fun m!335887 () Bool)

(assert (=> d!73851 m!335887))

(declare-fun m!335889 () Bool)

(assert (=> d!73851 m!335889))

(declare-fun m!335891 () Bool)

(assert (=> d!73851 m!335891))

(declare-fun m!335893 () Bool)

(assert (=> d!73851 m!335893))

(declare-fun m!335895 () Bool)

(assert (=> d!73851 m!335895))

(declare-fun m!335897 () Bool)

(assert (=> d!73851 m!335897))

(assert (=> b!217723 m!335515))

(declare-fun m!335899 () Bool)

(assert (=> b!217723 m!335899))

(declare-fun m!335901 () Bool)

(assert (=> b!217723 m!335901))

(declare-fun m!335903 () Bool)

(assert (=> b!217721 m!335903))

(declare-fun m!335905 () Bool)

(assert (=> b!217722 m!335905))

(assert (=> b!217722 m!335533))

(assert (=> b!217722 m!335515))

(declare-fun m!335907 () Bool)

(assert (=> b!217719 m!335907))

(assert (=> b!217463 d!73851))

(declare-fun d!73853 () Bool)

(declare-fun e!148002 () Bool)

(assert (=> d!73853 e!148002))

(declare-fun res!183223 () Bool)

(assert (=> d!73853 (=> (not res!183223) (not e!148002))))

(declare-fun lt!344808 () tuple2!18538)

(declare-fun lt!344810 () tuple2!18538)

(assert (=> d!73853 (= res!183223 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344808))) (currentByte!9798 (_1!9927 lt!344808)) (currentBit!9793 (_1!9927 lt!344808))) (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344810))) (currentByte!9798 (_1!9927 lt!344810)) (currentBit!9793 (_1!9927 lt!344810)))))))

(declare-fun lt!344809 () Unit!15480)

(declare-fun lt!344811 () BitStream!8430)

(declare-fun choose!50 (BitStream!8430 BitStream!8430 BitStream!8430 tuple2!18538 tuple2!18538 BitStream!8430 Bool tuple2!18538 tuple2!18538 BitStream!8430 Bool) Unit!15480)

(assert (=> d!73853 (= lt!344809 (choose!50 lt!344287 (_2!9928 lt!344306) lt!344811 lt!344808 (tuple2!18539 (_1!9927 lt!344808) (_2!9927 lt!344808)) (_1!9927 lt!344808) (_2!9927 lt!344808) lt!344810 (tuple2!18539 (_1!9927 lt!344810) (_2!9927 lt!344810)) (_1!9927 lt!344810) (_2!9927 lt!344810)))))

(assert (=> d!73853 (= lt!344810 (readBitPure!0 lt!344811))))

(assert (=> d!73853 (= lt!344808 (readBitPure!0 lt!344287))))

(assert (=> d!73853 (= lt!344811 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 lt!344287) (currentBit!9793 lt!344287)))))

(assert (=> d!73853 (invariant!0 (currentBit!9793 lt!344287) (currentByte!9798 lt!344287) (size!4661 (buf!5205 (_2!9928 lt!344306))))))

(assert (=> d!73853 (= (readBitPrefixLemma!0 lt!344287 (_2!9928 lt!344306)) lt!344809)))

(declare-fun b!217726 () Bool)

(assert (=> b!217726 (= e!148002 (= (_2!9927 lt!344808) (_2!9927 lt!344810)))))

(assert (= (and d!73853 res!183223) b!217726))

(assert (=> d!73853 m!335569))

(declare-fun m!335909 () Bool)

(assert (=> d!73853 m!335909))

(declare-fun m!335911 () Bool)

(assert (=> d!73853 m!335911))

(declare-fun m!335913 () Bool)

(assert (=> d!73853 m!335913))

(declare-fun m!335915 () Bool)

(assert (=> d!73853 m!335915))

(declare-fun m!335917 () Bool)

(assert (=> d!73853 m!335917))

(assert (=> b!217463 d!73853))

(declare-fun d!73855 () Bool)

(declare-fun lt!344812 () tuple2!18556)

(assert (=> d!73855 (= lt!344812 (readBit!0 (_1!9930 lt!344294)))))

(assert (=> d!73855 (= (readBitPure!0 (_1!9930 lt!344294)) (tuple2!18539 (_2!9936 lt!344812) (_1!9936 lt!344812)))))

(declare-fun bs!18021 () Bool)

(assert (= bs!18021 d!73855))

(declare-fun m!335919 () Bool)

(assert (=> bs!18021 m!335919))

(assert (=> b!217463 d!73855))

(declare-fun d!73857 () Bool)

(declare-fun lt!344813 () tuple2!18556)

(assert (=> d!73857 (= lt!344813 (readBit!0 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204))))))

(assert (=> d!73857 (= (readBitPure!0 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204))) (tuple2!18539 (_2!9936 lt!344813) (_1!9936 lt!344813)))))

(declare-fun bs!18022 () Bool)

(assert (= bs!18022 d!73857))

(declare-fun m!335921 () Bool)

(assert (=> bs!18022 m!335921))

(assert (=> b!217463 d!73857))

(declare-fun d!73859 () Bool)

(assert (=> d!73859 (= (invariant!0 (currentBit!9793 thiss!1204) (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344281)))) (and (bvsge (currentBit!9793 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9793 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9798 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344281)))) (and (= (currentBit!9793 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9798 thiss!1204) (size!4661 (buf!5205 (_2!9928 lt!344281))))))))))

(assert (=> b!217463 d!73859))

(declare-fun d!73861 () Bool)

(assert (=> d!73861 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204)) lt!344283) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204))) lt!344283))))

(declare-fun bs!18023 () Bool)

(assert (= bs!18023 d!73861))

(declare-fun m!335923 () Bool)

(assert (=> bs!18023 m!335923))

(assert (=> b!217463 d!73861))

(declare-fun d!73863 () Bool)

(declare-fun e!148003 () Bool)

(assert (=> d!73863 e!148003))

(declare-fun res!183224 () Bool)

(assert (=> d!73863 (=> (not res!183224) (not e!148003))))

(declare-fun lt!344817 () (_ BitVec 64))

(declare-fun lt!344819 () (_ BitVec 64))

(declare-fun lt!344814 () (_ BitVec 64))

(assert (=> d!73863 (= res!183224 (= lt!344814 (bvsub lt!344817 lt!344819)))))

(assert (=> d!73863 (or (= (bvand lt!344817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344817 lt!344819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73863 (= lt!344819 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344289)))) ((_ sign_extend 32) (currentByte!9798 (_1!9927 lt!344289))) ((_ sign_extend 32) (currentBit!9793 (_1!9927 lt!344289)))))))

(declare-fun lt!344816 () (_ BitVec 64))

(declare-fun lt!344815 () (_ BitVec 64))

(assert (=> d!73863 (= lt!344817 (bvmul lt!344816 lt!344815))))

(assert (=> d!73863 (or (= lt!344816 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344815 (bvsdiv (bvmul lt!344816 lt!344815) lt!344816)))))

(assert (=> d!73863 (= lt!344815 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73863 (= lt!344816 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344289)))))))

(assert (=> d!73863 (= lt!344814 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_1!9927 lt!344289))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_1!9927 lt!344289)))))))

(assert (=> d!73863 (invariant!0 (currentBit!9793 (_1!9927 lt!344289)) (currentByte!9798 (_1!9927 lt!344289)) (size!4661 (buf!5205 (_1!9927 lt!344289))))))

(assert (=> d!73863 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344289))) (currentByte!9798 (_1!9927 lt!344289)) (currentBit!9793 (_1!9927 lt!344289))) lt!344814)))

(declare-fun b!217727 () Bool)

(declare-fun res!183225 () Bool)

(assert (=> b!217727 (=> (not res!183225) (not e!148003))))

(assert (=> b!217727 (= res!183225 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344814))))

(declare-fun b!217728 () Bool)

(declare-fun lt!344818 () (_ BitVec 64))

(assert (=> b!217728 (= e!148003 (bvsle lt!344814 (bvmul lt!344818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217728 (or (= lt!344818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344818)))))

(assert (=> b!217728 (= lt!344818 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344289)))))))

(assert (= (and d!73863 res!183224) b!217727))

(assert (= (and b!217727 res!183225) b!217728))

(declare-fun m!335925 () Bool)

(assert (=> d!73863 m!335925))

(declare-fun m!335927 () Bool)

(assert (=> d!73863 m!335927))

(assert (=> b!217463 d!73863))

(declare-fun d!73865 () Bool)

(declare-fun lt!344820 () tuple2!18556)

(assert (=> d!73865 (= lt!344820 (readBit!0 lt!344287))))

(assert (=> d!73865 (= (readBitPure!0 lt!344287) (tuple2!18539 (_2!9936 lt!344820) (_1!9936 lt!344820)))))

(declare-fun bs!18024 () Bool)

(assert (= bs!18024 d!73865))

(declare-fun m!335929 () Bool)

(assert (=> bs!18024 m!335929))

(assert (=> b!217463 d!73865))

(declare-fun d!73867 () Bool)

(assert (=> d!73867 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 (_2!9928 lt!344281))) ((_ sign_extend 32) (currentBit!9793 (_2!9928 lt!344281))) lt!344305)))

(declare-fun lt!344823 () Unit!15480)

(declare-fun choose!9 (BitStream!8430 array!10615 (_ BitVec 64) BitStream!8430) Unit!15480)

(assert (=> d!73867 (= lt!344823 (choose!9 (_2!9928 lt!344281) (buf!5205 (_2!9928 lt!344306)) lt!344305 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281)))))))

(assert (=> d!73867 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9928 lt!344281) (buf!5205 (_2!9928 lt!344306)) lt!344305) lt!344823)))

(declare-fun bs!18025 () Bool)

(assert (= bs!18025 d!73867))

(assert (=> bs!18025 m!335561))

(declare-fun m!335931 () Bool)

(assert (=> bs!18025 m!335931))

(assert (=> b!217463 d!73867))

(declare-fun b!217729 () Bool)

(declare-fun res!183227 () Bool)

(declare-fun e!148005 () Bool)

(assert (=> b!217729 (=> (not res!183227) (not e!148005))))

(declare-fun lt!344828 () tuple2!18544)

(assert (=> b!217729 (= res!183227 (isPrefixOf!0 (_2!9930 lt!344828) (_2!9928 lt!344306)))))

(declare-fun b!217730 () Bool)

(declare-fun e!148004 () Unit!15480)

(declare-fun Unit!15496 () Unit!15480)

(assert (=> b!217730 (= e!148004 Unit!15496)))

(declare-fun d!73869 () Bool)

(assert (=> d!73869 e!148005))

(declare-fun res!183226 () Bool)

(assert (=> d!73869 (=> (not res!183226) (not e!148005))))

(assert (=> d!73869 (= res!183226 (isPrefixOf!0 (_1!9930 lt!344828) (_2!9930 lt!344828)))))

(declare-fun lt!344834 () BitStream!8430)

(assert (=> d!73869 (= lt!344828 (tuple2!18545 lt!344834 (_2!9928 lt!344306)))))

(declare-fun lt!344842 () Unit!15480)

(declare-fun lt!344833 () Unit!15480)

(assert (=> d!73869 (= lt!344842 lt!344833)))

(assert (=> d!73869 (isPrefixOf!0 lt!344834 (_2!9928 lt!344306))))

(assert (=> d!73869 (= lt!344833 (lemmaIsPrefixTransitive!0 lt!344834 (_2!9928 lt!344306) (_2!9928 lt!344306)))))

(declare-fun lt!344832 () Unit!15480)

(declare-fun lt!344829 () Unit!15480)

(assert (=> d!73869 (= lt!344832 lt!344829)))

(assert (=> d!73869 (isPrefixOf!0 lt!344834 (_2!9928 lt!344306))))

(assert (=> d!73869 (= lt!344829 (lemmaIsPrefixTransitive!0 lt!344834 thiss!1204 (_2!9928 lt!344306)))))

(declare-fun lt!344835 () Unit!15480)

(assert (=> d!73869 (= lt!344835 e!148004)))

(declare-fun c!10638 () Bool)

(assert (=> d!73869 (= c!10638 (not (= (size!4661 (buf!5205 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!344825 () Unit!15480)

(declare-fun lt!344838 () Unit!15480)

(assert (=> d!73869 (= lt!344825 lt!344838)))

(assert (=> d!73869 (isPrefixOf!0 (_2!9928 lt!344306) (_2!9928 lt!344306))))

(assert (=> d!73869 (= lt!344838 (lemmaIsPrefixRefl!0 (_2!9928 lt!344306)))))

(declare-fun lt!344840 () Unit!15480)

(declare-fun lt!344836 () Unit!15480)

(assert (=> d!73869 (= lt!344840 lt!344836)))

(assert (=> d!73869 (= lt!344836 (lemmaIsPrefixRefl!0 (_2!9928 lt!344306)))))

(declare-fun lt!344826 () Unit!15480)

(declare-fun lt!344831 () Unit!15480)

(assert (=> d!73869 (= lt!344826 lt!344831)))

(assert (=> d!73869 (isPrefixOf!0 lt!344834 lt!344834)))

(assert (=> d!73869 (= lt!344831 (lemmaIsPrefixRefl!0 lt!344834))))

(declare-fun lt!344830 () Unit!15480)

(declare-fun lt!344839 () Unit!15480)

(assert (=> d!73869 (= lt!344830 lt!344839)))

(assert (=> d!73869 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!73869 (= lt!344839 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!73869 (= lt!344834 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(assert (=> d!73869 (isPrefixOf!0 thiss!1204 (_2!9928 lt!344306))))

(assert (=> d!73869 (= (reader!0 thiss!1204 (_2!9928 lt!344306)) lt!344828)))

(declare-fun b!217731 () Bool)

(declare-fun res!183228 () Bool)

(assert (=> b!217731 (=> (not res!183228) (not e!148005))))

(assert (=> b!217731 (= res!183228 (isPrefixOf!0 (_1!9930 lt!344828) thiss!1204))))

(declare-fun lt!344824 () (_ BitVec 64))

(declare-fun lt!344827 () (_ BitVec 64))

(declare-fun b!217732 () Bool)

(assert (=> b!217732 (= e!148005 (= (_1!9930 lt!344828) (withMovedBitIndex!0 (_2!9930 lt!344828) (bvsub lt!344827 lt!344824))))))

(assert (=> b!217732 (or (= (bvand lt!344827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344827 lt!344824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217732 (= lt!344824 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344306))) (currentByte!9798 (_2!9928 lt!344306)) (currentBit!9793 (_2!9928 lt!344306))))))

(assert (=> b!217732 (= lt!344827 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(declare-fun b!217733 () Bool)

(declare-fun lt!344841 () Unit!15480)

(assert (=> b!217733 (= e!148004 lt!344841)))

(declare-fun lt!344837 () (_ BitVec 64))

(assert (=> b!217733 (= lt!344837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!344843 () (_ BitVec 64))

(assert (=> b!217733 (= lt!344843 (bitIndex!0 (size!4661 (buf!5205 thiss!1204)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204)))))

(assert (=> b!217733 (= lt!344841 (arrayBitRangesEqSymmetric!0 (buf!5205 thiss!1204) (buf!5205 (_2!9928 lt!344306)) lt!344837 lt!344843))))

(assert (=> b!217733 (arrayBitRangesEq!0 (buf!5205 (_2!9928 lt!344306)) (buf!5205 thiss!1204) lt!344837 lt!344843)))

(assert (= (and d!73869 c!10638) b!217733))

(assert (= (and d!73869 (not c!10638)) b!217730))

(assert (= (and d!73869 res!183226) b!217731))

(assert (= (and b!217731 res!183228) b!217729))

(assert (= (and b!217729 res!183227) b!217732))

(declare-fun m!335933 () Bool)

(assert (=> d!73869 m!335933))

(assert (=> d!73869 m!335535))

(declare-fun m!335935 () Bool)

(assert (=> d!73869 m!335935))

(assert (=> d!73869 m!335883))

(declare-fun m!335937 () Bool)

(assert (=> d!73869 m!335937))

(declare-fun m!335939 () Bool)

(assert (=> d!73869 m!335939))

(assert (=> d!73869 m!335889))

(declare-fun m!335941 () Bool)

(assert (=> d!73869 m!335941))

(declare-fun m!335943 () Bool)

(assert (=> d!73869 m!335943))

(declare-fun m!335945 () Bool)

(assert (=> d!73869 m!335945))

(declare-fun m!335947 () Bool)

(assert (=> d!73869 m!335947))

(assert (=> b!217733 m!335517))

(declare-fun m!335949 () Bool)

(assert (=> b!217733 m!335949))

(declare-fun m!335951 () Bool)

(assert (=> b!217733 m!335951))

(declare-fun m!335953 () Bool)

(assert (=> b!217731 m!335953))

(declare-fun m!335955 () Bool)

(assert (=> b!217732 m!335955))

(assert (=> b!217732 m!335533))

(assert (=> b!217732 m!335517))

(declare-fun m!335957 () Bool)

(assert (=> b!217729 m!335957))

(assert (=> b!217463 d!73869))

(declare-fun lt!344844 () tuple2!18554)

(declare-fun d!73871 () Bool)

(assert (=> d!73871 (= lt!344844 (readNBitsLSBFirstsLoop!0 (_1!9930 lt!344285) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344279))))

(assert (=> d!73871 (= (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344285) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344279) (tuple2!18543 (_2!9935 lt!344844) (_1!9935 lt!344844)))))

(declare-fun bs!18026 () Bool)

(assert (= bs!18026 d!73871))

(declare-fun m!335959 () Bool)

(assert (=> bs!18026 m!335959))

(assert (=> b!217463 d!73871))

(declare-fun d!73873 () Bool)

(assert (=> d!73873 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!217463 d!73873))

(declare-fun d!73875 () Bool)

(assert (=> d!73875 (validate_offset_bits!1 ((_ sign_extend 32) (size!4661 (buf!5205 (_2!9928 lt!344306)))) ((_ sign_extend 32) (currentByte!9798 thiss!1204)) ((_ sign_extend 32) (currentBit!9793 thiss!1204)) lt!344283)))

(declare-fun lt!344845 () Unit!15480)

(assert (=> d!73875 (= lt!344845 (choose!9 thiss!1204 (buf!5205 (_2!9928 lt!344306)) lt!344283 (BitStream!8431 (buf!5205 (_2!9928 lt!344306)) (currentByte!9798 thiss!1204) (currentBit!9793 thiss!1204))))))

(assert (=> d!73875 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5205 (_2!9928 lt!344306)) lt!344283) lt!344845)))

(declare-fun bs!18027 () Bool)

(assert (= bs!18027 d!73875))

(assert (=> bs!18027 m!335577))

(declare-fun m!335961 () Bool)

(assert (=> bs!18027 m!335961))

(assert (=> b!217463 d!73875))

(declare-fun d!73877 () Bool)

(declare-fun e!148006 () Bool)

(assert (=> d!73877 e!148006))

(declare-fun res!183229 () Bool)

(assert (=> d!73877 (=> (not res!183229) (not e!148006))))

(declare-fun lt!344846 () (_ BitVec 64))

(declare-fun lt!344849 () (_ BitVec 64))

(declare-fun lt!344851 () (_ BitVec 64))

(assert (=> d!73877 (= res!183229 (= lt!344846 (bvsub lt!344849 lt!344851)))))

(assert (=> d!73877 (or (= (bvand lt!344849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344849 lt!344851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73877 (= lt!344851 (remainingBits!0 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344295)))) ((_ sign_extend 32) (currentByte!9798 (_1!9927 lt!344295))) ((_ sign_extend 32) (currentBit!9793 (_1!9927 lt!344295)))))))

(declare-fun lt!344848 () (_ BitVec 64))

(declare-fun lt!344847 () (_ BitVec 64))

(assert (=> d!73877 (= lt!344849 (bvmul lt!344848 lt!344847))))

(assert (=> d!73877 (or (= lt!344848 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344847 (bvsdiv (bvmul lt!344848 lt!344847) lt!344848)))))

(assert (=> d!73877 (= lt!344847 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73877 (= lt!344848 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344295)))))))

(assert (=> d!73877 (= lt!344846 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9798 (_1!9927 lt!344295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9793 (_1!9927 lt!344295)))))))

(assert (=> d!73877 (invariant!0 (currentBit!9793 (_1!9927 lt!344295)) (currentByte!9798 (_1!9927 lt!344295)) (size!4661 (buf!5205 (_1!9927 lt!344295))))))

(assert (=> d!73877 (= (bitIndex!0 (size!4661 (buf!5205 (_1!9927 lt!344295))) (currentByte!9798 (_1!9927 lt!344295)) (currentBit!9793 (_1!9927 lt!344295))) lt!344846)))

(declare-fun b!217734 () Bool)

(declare-fun res!183230 () Bool)

(assert (=> b!217734 (=> (not res!183230) (not e!148006))))

(assert (=> b!217734 (= res!183230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344846))))

(declare-fun b!217735 () Bool)

(declare-fun lt!344850 () (_ BitVec 64))

(assert (=> b!217735 (= e!148006 (bvsle lt!344846 (bvmul lt!344850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217735 (or (= lt!344850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344850)))))

(assert (=> b!217735 (= lt!344850 ((_ sign_extend 32) (size!4661 (buf!5205 (_1!9927 lt!344295)))))))

(assert (= (and d!73877 res!183229) b!217734))

(assert (= (and b!217734 res!183230) b!217735))

(declare-fun m!335963 () Bool)

(assert (=> d!73877 m!335963))

(declare-fun m!335965 () Bool)

(assert (=> d!73877 m!335965))

(assert (=> b!217463 d!73877))

(declare-fun d!73879 () Bool)

(declare-fun lt!344852 () tuple2!18554)

(assert (=> d!73879 (= lt!344852 (readNBitsLSBFirstsLoop!0 (_1!9930 lt!344294) nBits!348 i!590 lt!344307))))

(assert (=> d!73879 (= (readNBitsLSBFirstsLoopPure!0 (_1!9930 lt!344294) nBits!348 i!590 lt!344307) (tuple2!18543 (_2!9935 lt!344852) (_1!9935 lt!344852)))))

(declare-fun bs!18028 () Bool)

(assert (= bs!18028 d!73879))

(declare-fun m!335967 () Bool)

(assert (=> bs!18028 m!335967))

(assert (=> b!217463 d!73879))

(declare-fun d!73881 () Bool)

(declare-fun e!148007 () Bool)

(assert (=> d!73881 e!148007))

(declare-fun res!183231 () Bool)

(assert (=> d!73881 (=> (not res!183231) (not e!148007))))

(declare-fun lt!344854 () (_ BitVec 64))

(declare-fun lt!344853 () BitStream!8430)

(assert (=> d!73881 (= res!183231 (= (bvadd lt!344854 (bvsub lt!344298 lt!344292)) (bitIndex!0 (size!4661 (buf!5205 lt!344853)) (currentByte!9798 lt!344853) (currentBit!9793 lt!344853))))))

(assert (=> d!73881 (or (not (= (bvand lt!344854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344298 lt!344292) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344854 (bvsub lt!344298 lt!344292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73881 (= lt!344854 (bitIndex!0 (size!4661 (buf!5205 (_2!9930 lt!344285))) (currentByte!9798 (_2!9930 lt!344285)) (currentBit!9793 (_2!9930 lt!344285))))))

(assert (=> d!73881 (= lt!344853 (_2!9928 (moveBitIndex!0 (_2!9930 lt!344285) (bvsub lt!344298 lt!344292))))))

(assert (=> d!73881 (moveBitIndexPrecond!0 (_2!9930 lt!344285) (bvsub lt!344298 lt!344292))))

(assert (=> d!73881 (= (withMovedBitIndex!0 (_2!9930 lt!344285) (bvsub lt!344298 lt!344292)) lt!344853)))

(declare-fun b!217736 () Bool)

(assert (=> b!217736 (= e!148007 (= (size!4661 (buf!5205 (_2!9930 lt!344285))) (size!4661 (buf!5205 lt!344853))))))

(assert (= (and d!73881 res!183231) b!217736))

(declare-fun m!335969 () Bool)

(assert (=> d!73881 m!335969))

(declare-fun m!335971 () Bool)

(assert (=> d!73881 m!335971))

(declare-fun m!335973 () Bool)

(assert (=> d!73881 m!335973))

(declare-fun m!335975 () Bool)

(assert (=> d!73881 m!335975))

(assert (=> b!217474 d!73881))

(assert (=> b!217464 d!73839))

(assert (=> b!217464 d!73841))

(assert (=> b!217477 d!73763))

(declare-fun d!73883 () Bool)

(declare-fun res!183234 () Bool)

(declare-fun e!148009 () Bool)

(assert (=> d!73883 (=> (not res!183234) (not e!148009))))

(assert (=> d!73883 (= res!183234 (= (size!4661 (buf!5205 (_2!9928 lt!344281))) (size!4661 (buf!5205 (_2!9928 lt!344306)))))))

(assert (=> d!73883 (= (isPrefixOf!0 (_2!9928 lt!344281) (_2!9928 lt!344306)) e!148009)))

(declare-fun b!217737 () Bool)

(declare-fun res!183233 () Bool)

(assert (=> b!217737 (=> (not res!183233) (not e!148009))))

(assert (=> b!217737 (= res!183233 (bvsle (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281))) (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344306))) (currentByte!9798 (_2!9928 lt!344306)) (currentBit!9793 (_2!9928 lt!344306)))))))

(declare-fun b!217738 () Bool)

(declare-fun e!148008 () Bool)

(assert (=> b!217738 (= e!148009 e!148008)))

(declare-fun res!183232 () Bool)

(assert (=> b!217738 (=> res!183232 e!148008)))

(assert (=> b!217738 (= res!183232 (= (size!4661 (buf!5205 (_2!9928 lt!344281))) #b00000000000000000000000000000000))))

(declare-fun b!217739 () Bool)

(assert (=> b!217739 (= e!148008 (arrayBitRangesEq!0 (buf!5205 (_2!9928 lt!344281)) (buf!5205 (_2!9928 lt!344306)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4661 (buf!5205 (_2!9928 lt!344281))) (currentByte!9798 (_2!9928 lt!344281)) (currentBit!9793 (_2!9928 lt!344281)))))))

(assert (= (and d!73883 res!183234) b!217737))

(assert (= (and b!217737 res!183233) b!217738))

(assert (= (and b!217738 (not res!183232)) b!217739))

(assert (=> b!217737 m!335515))

(assert (=> b!217737 m!335533))

(assert (=> b!217739 m!335515))

(assert (=> b!217739 m!335515))

(declare-fun m!335977 () Bool)

(assert (=> b!217739 m!335977))

(assert (=> b!217466 d!73883))

(check-sat (not b!217687) (not b!217737) (not b!217683) (not b!217684) (not b!217680) (not d!73779) (not b!217586) (not b!217686) (not d!73771) (not b!217739) (not d!73857) (not b!217681) (not d!73753) (not b!217679) (not b!217581) (not d!73849) (not d!73861) (not d!73757) (not b!217688) (not d!73769) (not d!73781) (not d!73853) (not b!217691) (not d!73841) (not d!73761) (not d!73877) (not b!217722) (not b!217708) (not d!73863) (not d!73767) (not b!217705) (not d!73869) (not b!217707) (not b!217733) (not b!217591) (not b!217719) (not b!217706) (not b!217579) (not d!73879) (not b!217589) (not d!73759) (not d!73871) (not d!73765) (not b!217723) (not d!73755) (not b!217732) (not d!73843) (not d!73751) (not d!73851) (not b!217731) (not d!73839) (not d!73881) (not d!73775) (not d!73865) (not bm!3402) (not d!73855) (not d!73867) (not d!73845) (not b!217729) (not d!73875) (not b!217721))
