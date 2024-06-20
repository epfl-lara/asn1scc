; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40662 () Bool)

(assert start!40662)

(declare-fun b!187090 () Bool)

(declare-fun e!129396 () Bool)

(declare-fun e!129399 () Bool)

(assert (=> b!187090 (= e!129396 e!129399)))

(declare-fun res!155806 () Bool)

(assert (=> b!187090 (=> (not res!155806) (not e!129399))))

(declare-fun lt!289457 () (_ BitVec 64))

(declare-fun lt!289461 () (_ BitVec 64))

(assert (=> b!187090 (= res!155806 (= lt!289457 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!289461)))))

(declare-datatypes ((array!9838 0))(
  ( (array!9839 (arr!5268 (Array (_ BitVec 32) (_ BitVec 8))) (size!4338 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7784 0))(
  ( (BitStream!7785 (buf!4804 array!9838) (currentByte!9060 (_ BitVec 32)) (currentBit!9055 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13371 0))(
  ( (Unit!13372) )
))
(declare-datatypes ((tuple2!16180 0))(
  ( (tuple2!16181 (_1!8735 Unit!13371) (_2!8735 BitStream!7784)) )
))
(declare-fun lt!289452 () tuple2!16180)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187090 (= lt!289457 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(declare-fun thiss!1204 () BitStream!7784)

(assert (=> b!187090 (= lt!289461 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(declare-fun b!187091 () Bool)

(declare-fun e!129401 () Bool)

(declare-fun lt!289453 () tuple2!16180)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187091 (= e!129401 (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289453)))))))

(declare-fun b!187092 () Bool)

(declare-fun e!129394 () Bool)

(declare-datatypes ((tuple2!16182 0))(
  ( (tuple2!16183 (_1!8736 BitStream!7784) (_2!8736 Bool)) )
))
(declare-fun lt!289451 () tuple2!16182)

(declare-fun lt!289465 () tuple2!16182)

(assert (=> b!187092 (= e!129394 (= (_2!8736 lt!289451) (_2!8736 lt!289465)))))

(declare-fun b!187093 () Bool)

(declare-fun e!129395 () Bool)

(declare-fun e!129397 () Bool)

(assert (=> b!187093 (= e!129395 e!129397)))

(declare-fun res!155822 () Bool)

(assert (=> b!187093 (=> (not res!155822) (not e!129397))))

(declare-fun lt!289473 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187093 (= res!155822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204)) lt!289473))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!187093 (= lt!289473 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!187094 () Bool)

(declare-fun res!155816 () Bool)

(declare-fun e!129400 () Bool)

(assert (=> b!187094 (=> (not res!155816) (not e!129400))))

(declare-fun lt!289470 () (_ BitVec 64))

(declare-datatypes ((tuple2!16184 0))(
  ( (tuple2!16185 (_1!8737 BitStream!7784) (_2!8737 BitStream!7784)) )
))
(declare-fun lt!289472 () tuple2!16184)

(declare-fun lt!289450 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7784 (_ BitVec 64)) BitStream!7784)

(assert (=> b!187094 (= res!155816 (= (_1!8737 lt!289472) (withMovedBitIndex!0 (_2!8737 lt!289472) (bvsub lt!289450 lt!289470))))))

(declare-fun b!187095 () Bool)

(declare-fun e!129402 () Bool)

(declare-fun e!129393 () Bool)

(assert (=> b!187095 (= e!129402 e!129393)))

(declare-fun res!155823 () Bool)

(assert (=> b!187095 (=> res!155823 e!129393)))

(assert (=> b!187095 (= res!155823 (not (= lt!289470 (bvsub (bvsub (bvadd lt!289450 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!187095 (= lt!289470 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289453))) (currentByte!9060 (_2!8735 lt!289453)) (currentBit!9055 (_2!8735 lt!289453))))))

(declare-fun isPrefixOf!0 (BitStream!7784 BitStream!7784) Bool)

(assert (=> b!187095 (isPrefixOf!0 thiss!1204 (_2!8735 lt!289453))))

(declare-fun lt!289466 () Unit!13371)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7784 BitStream!7784 BitStream!7784) Unit!13371)

(assert (=> b!187095 (= lt!289466 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8735 lt!289452) (_2!8735 lt!289453)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7784 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16180)

(assert (=> b!187095 (= lt!289453 (appendBitsLSBFirstLoopTR!0 (_2!8735 lt!289452) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!187096 () Bool)

(declare-fun res!155815 () Bool)

(assert (=> b!187096 (=> res!155815 e!129393)))

(assert (=> b!187096 (= res!155815 (not (isPrefixOf!0 (_2!8735 lt!289452) (_2!8735 lt!289453))))))

(declare-fun b!187097 () Bool)

(declare-fun e!129404 () Bool)

(declare-fun lt!289458 () tuple2!16184)

(declare-fun moveBitIndexPrecond!0 (BitStream!7784 (_ BitVec 64)) Bool)

(assert (=> b!187097 (= e!129404 (moveBitIndexPrecond!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!187097 e!129400))

(declare-fun res!155820 () Bool)

(assert (=> b!187097 (=> (not res!155820) (not e!129400))))

(declare-datatypes ((tuple2!16186 0))(
  ( (tuple2!16187 (_1!8738 BitStream!7784) (_2!8738 (_ BitVec 64))) )
))
(declare-fun lt!289454 () tuple2!16186)

(declare-fun lt!289469 () tuple2!16186)

(assert (=> b!187097 (= res!155820 (and (= (_2!8738 lt!289454) (_2!8738 lt!289469)) (= (_1!8738 lt!289454) (_1!8738 lt!289469))))))

(declare-fun lt!289467 () (_ BitVec 64))

(declare-fun lt!289471 () Unit!13371)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13371)

(assert (=> b!187097 (= lt!289471 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8737 lt!289458) nBits!348 i!590 lt!289467))))

(declare-fun lt!289464 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16186)

(assert (=> b!187097 (= lt!289469 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289464))))

(declare-fun b!187098 () Bool)

(declare-fun res!155813 () Bool)

(assert (=> b!187098 (=> (not res!155813) (not e!129397))))

(assert (=> b!187098 (= res!155813 (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 thiss!1204))))))

(declare-fun res!155809 () Bool)

(assert (=> start!40662 (=> (not res!155809) (not e!129395))))

(assert (=> start!40662 (= res!155809 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40662 e!129395))

(assert (=> start!40662 true))

(declare-fun e!129403 () Bool)

(declare-fun inv!12 (BitStream!7784) Bool)

(assert (=> start!40662 (and (inv!12 thiss!1204) e!129403)))

(declare-fun b!187099 () Bool)

(declare-fun e!129405 () Bool)

(declare-fun lt!289474 () tuple2!16182)

(assert (=> b!187099 (= e!129405 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289474))) (currentByte!9060 (_1!8736 lt!289474)) (currentBit!9055 (_1!8736 lt!289474))) lt!289457))))

(declare-fun b!187100 () Bool)

(assert (=> b!187100 (= e!129399 e!129405)))

(declare-fun res!155821 () Bool)

(assert (=> b!187100 (=> (not res!155821) (not e!129405))))

(declare-fun lt!289449 () Bool)

(assert (=> b!187100 (= res!155821 (and (= (_2!8736 lt!289474) lt!289449) (= (_1!8736 lt!289474) (_2!8735 lt!289452))))))

(declare-fun readBitPure!0 (BitStream!7784) tuple2!16182)

(declare-fun readerFrom!0 (BitStream!7784 (_ BitVec 32) (_ BitVec 32)) BitStream!7784)

(assert (=> b!187100 (= lt!289474 (readBitPure!0 (readerFrom!0 (_2!8735 lt!289452) (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204))))))

(declare-fun b!187101 () Bool)

(declare-fun res!155817 () Bool)

(assert (=> b!187101 (=> (not res!155817) (not e!129399))))

(assert (=> b!187101 (= res!155817 (isPrefixOf!0 thiss!1204 (_2!8735 lt!289452)))))

(declare-fun b!187102 () Bool)

(declare-fun array_inv!4079 (array!9838) Bool)

(assert (=> b!187102 (= e!129403 (array_inv!4079 (buf!4804 thiss!1204)))))

(declare-fun b!187103 () Bool)

(declare-fun lt!289460 () (_ BitVec 64))

(assert (=> b!187103 (= e!129400 (= lt!289460 (bvsub lt!289450 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!187104 () Bool)

(declare-fun res!155808 () Bool)

(assert (=> b!187104 (=> res!155808 e!129393)))

(assert (=> b!187104 (= res!155808 (or (not (= (size!4338 (buf!4804 (_2!8735 lt!289453))) (size!4338 (buf!4804 thiss!1204)))) (not (= lt!289470 (bvsub (bvadd lt!289460 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!187105 () Bool)

(declare-fun res!155818 () Bool)

(assert (=> b!187105 (=> res!155818 e!129393)))

(assert (=> b!187105 (= res!155818 (not (invariant!0 (currentBit!9055 (_2!8735 lt!289453)) (currentByte!9060 (_2!8735 lt!289453)) (size!4338 (buf!4804 (_2!8735 lt!289453))))))))

(declare-fun b!187106 () Bool)

(declare-fun res!155811 () Bool)

(assert (=> b!187106 (=> (not res!155811) (not e!129397))))

(assert (=> b!187106 (= res!155811 (not (= i!590 nBits!348)))))

(declare-fun b!187107 () Bool)

(declare-fun res!155810 () Bool)

(assert (=> b!187107 (=> res!155810 e!129393)))

(assert (=> b!187107 (= res!155810 (not (isPrefixOf!0 thiss!1204 (_2!8735 lt!289452))))))

(declare-fun b!187108 () Bool)

(assert (=> b!187108 (= e!129393 e!129404)))

(declare-fun res!155807 () Bool)

(assert (=> b!187108 (=> res!155807 e!129404)))

(assert (=> b!187108 (= res!155807 (not (= (_1!8738 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!289472) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289464)) (_2!8737 lt!289472))))))

(declare-fun lt!289456 () (_ BitVec 64))

(assert (=> b!187108 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!289456)))

(declare-fun lt!289459 () Unit!13371)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7784 array!9838 (_ BitVec 64)) Unit!13371)

(assert (=> b!187108 (= lt!289459 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8735 lt!289452) (buf!4804 (_2!8735 lt!289453)) lt!289456))))

(assert (=> b!187108 (= lt!289456 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!289463 () (_ BitVec 64))

(declare-fun lt!289448 () tuple2!16182)

(assert (=> b!187108 (= lt!289464 (bvor lt!289467 (ite (_2!8736 lt!289448) lt!289463 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187108 (= lt!289454 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!289458) nBits!348 i!590 lt!289467))))

(assert (=> b!187108 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204)) lt!289473)))

(declare-fun lt!289462 () Unit!13371)

(assert (=> b!187108 (= lt!289462 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4804 (_2!8735 lt!289453)) lt!289473))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187108 (= lt!289467 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!187108 (= (_2!8736 lt!289448) lt!289449)))

(assert (=> b!187108 (= lt!289448 (readBitPure!0 (_1!8737 lt!289458)))))

(declare-fun reader!0 (BitStream!7784 BitStream!7784) tuple2!16184)

(assert (=> b!187108 (= lt!289472 (reader!0 (_2!8735 lt!289452) (_2!8735 lt!289453)))))

(assert (=> b!187108 (= lt!289458 (reader!0 thiss!1204 (_2!8735 lt!289453)))))

(assert (=> b!187108 e!129394))

(declare-fun res!155819 () Bool)

(assert (=> b!187108 (=> (not res!155819) (not e!129394))))

(assert (=> b!187108 (= res!155819 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289451))) (currentByte!9060 (_1!8736 lt!289451)) (currentBit!9055 (_1!8736 lt!289451))) (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289465))) (currentByte!9060 (_1!8736 lt!289465)) (currentBit!9055 (_1!8736 lt!289465)))))))

(declare-fun lt!289468 () Unit!13371)

(declare-fun lt!289455 () BitStream!7784)

(declare-fun readBitPrefixLemma!0 (BitStream!7784 BitStream!7784) Unit!13371)

(assert (=> b!187108 (= lt!289468 (readBitPrefixLemma!0 lt!289455 (_2!8735 lt!289453)))))

(assert (=> b!187108 (= lt!289465 (readBitPure!0 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204))))))

(assert (=> b!187108 (= lt!289451 (readBitPure!0 lt!289455))))

(assert (=> b!187108 e!129401))

(declare-fun res!155805 () Bool)

(assert (=> b!187108 (=> (not res!155805) (not e!129401))))

(assert (=> b!187108 (= res!155805 (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(assert (=> b!187108 (= lt!289455 (BitStream!7785 (buf!4804 (_2!8735 lt!289452)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(declare-fun b!187109 () Bool)

(assert (=> b!187109 (= e!129397 (not e!129402))))

(declare-fun res!155814 () Bool)

(assert (=> b!187109 (=> res!155814 e!129402)))

(assert (=> b!187109 (= res!155814 (not (= lt!289450 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!289460))))))

(assert (=> b!187109 (= lt!289450 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(assert (=> b!187109 (= lt!289460 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(assert (=> b!187109 e!129396))

(declare-fun res!155824 () Bool)

(assert (=> b!187109 (=> (not res!155824) (not e!129396))))

(assert (=> b!187109 (= res!155824 (= (size!4338 (buf!4804 thiss!1204)) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(declare-fun appendBit!0 (BitStream!7784 Bool) tuple2!16180)

(assert (=> b!187109 (= lt!289452 (appendBit!0 thiss!1204 lt!289449))))

(assert (=> b!187109 (= lt!289449 (not (= (bvand v!189 lt!289463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187109 (= lt!289463 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!187110 () Bool)

(declare-fun res!155812 () Bool)

(assert (=> b!187110 (=> (not res!155812) (not e!129400))))

(assert (=> b!187110 (= res!155812 (= (_1!8737 lt!289458) (withMovedBitIndex!0 (_2!8737 lt!289458) (bvsub lt!289460 lt!289470))))))

(assert (= (and start!40662 res!155809) b!187093))

(assert (= (and b!187093 res!155822) b!187098))

(assert (= (and b!187098 res!155813) b!187106))

(assert (= (and b!187106 res!155811) b!187109))

(assert (= (and b!187109 res!155824) b!187090))

(assert (= (and b!187090 res!155806) b!187101))

(assert (= (and b!187101 res!155817) b!187100))

(assert (= (and b!187100 res!155821) b!187099))

(assert (= (and b!187109 (not res!155814)) b!187095))

(assert (= (and b!187095 (not res!155823)) b!187105))

(assert (= (and b!187105 (not res!155818)) b!187104))

(assert (= (and b!187104 (not res!155808)) b!187096))

(assert (= (and b!187096 (not res!155815)) b!187107))

(assert (= (and b!187107 (not res!155810)) b!187108))

(assert (= (and b!187108 res!155805) b!187091))

(assert (= (and b!187108 res!155819) b!187092))

(assert (= (and b!187108 (not res!155807)) b!187097))

(assert (= (and b!187097 res!155820) b!187110))

(assert (= (and b!187110 res!155812) b!187094))

(assert (= (and b!187094 res!155816) b!187103))

(assert (= start!40662 b!187102))

(declare-fun m!290849 () Bool)

(assert (=> b!187107 m!290849))

(declare-fun m!290851 () Bool)

(assert (=> b!187098 m!290851))

(declare-fun m!290853 () Bool)

(assert (=> b!187100 m!290853))

(assert (=> b!187100 m!290853))

(declare-fun m!290855 () Bool)

(assert (=> b!187100 m!290855))

(declare-fun m!290857 () Bool)

(assert (=> b!187096 m!290857))

(declare-fun m!290859 () Bool)

(assert (=> b!187109 m!290859))

(declare-fun m!290861 () Bool)

(assert (=> b!187109 m!290861))

(declare-fun m!290863 () Bool)

(assert (=> b!187109 m!290863))

(assert (=> b!187090 m!290859))

(assert (=> b!187090 m!290861))

(declare-fun m!290865 () Bool)

(assert (=> b!187094 m!290865))

(declare-fun m!290867 () Bool)

(assert (=> b!187097 m!290867))

(declare-fun m!290869 () Bool)

(assert (=> b!187097 m!290869))

(declare-fun m!290871 () Bool)

(assert (=> b!187097 m!290871))

(assert (=> b!187097 m!290871))

(declare-fun m!290873 () Bool)

(assert (=> b!187097 m!290873))

(declare-fun m!290875 () Bool)

(assert (=> b!187099 m!290875))

(declare-fun m!290877 () Bool)

(assert (=> b!187110 m!290877))

(declare-fun m!290879 () Bool)

(assert (=> start!40662 m!290879))

(declare-fun m!290881 () Bool)

(assert (=> b!187108 m!290881))

(declare-fun m!290883 () Bool)

(assert (=> b!187108 m!290883))

(declare-fun m!290885 () Bool)

(assert (=> b!187108 m!290885))

(declare-fun m!290887 () Bool)

(assert (=> b!187108 m!290887))

(declare-fun m!290889 () Bool)

(assert (=> b!187108 m!290889))

(declare-fun m!290891 () Bool)

(assert (=> b!187108 m!290891))

(declare-fun m!290893 () Bool)

(assert (=> b!187108 m!290893))

(declare-fun m!290895 () Bool)

(assert (=> b!187108 m!290895))

(declare-fun m!290897 () Bool)

(assert (=> b!187108 m!290897))

(declare-fun m!290899 () Bool)

(assert (=> b!187108 m!290899))

(declare-fun m!290901 () Bool)

(assert (=> b!187108 m!290901))

(declare-fun m!290903 () Bool)

(assert (=> b!187108 m!290903))

(declare-fun m!290905 () Bool)

(assert (=> b!187108 m!290905))

(declare-fun m!290907 () Bool)

(assert (=> b!187108 m!290907))

(declare-fun m!290909 () Bool)

(assert (=> b!187108 m!290909))

(declare-fun m!290911 () Bool)

(assert (=> b!187108 m!290911))

(declare-fun m!290913 () Bool)

(assert (=> b!187105 m!290913))

(declare-fun m!290915 () Bool)

(assert (=> b!187091 m!290915))

(declare-fun m!290917 () Bool)

(assert (=> b!187102 m!290917))

(declare-fun m!290919 () Bool)

(assert (=> b!187093 m!290919))

(declare-fun m!290921 () Bool)

(assert (=> b!187095 m!290921))

(declare-fun m!290923 () Bool)

(assert (=> b!187095 m!290923))

(declare-fun m!290925 () Bool)

(assert (=> b!187095 m!290925))

(declare-fun m!290927 () Bool)

(assert (=> b!187095 m!290927))

(assert (=> b!187101 m!290849))

(push 1)

(assert (not b!187101))

(assert (not b!187095))

(assert (not b!187091))

(assert (not b!187090))

(assert (not b!187102))

(assert (not b!187094))

(assert (not b!187105))

(assert (not b!187096))

(assert (not b!187110))

(assert (not b!187093))

(assert (not b!187099))

(assert (not b!187109))

(assert (not b!187108))

(assert (not b!187100))

(assert (not b!187097))

(assert (not b!187107))

(assert (not start!40662))

(assert (not b!187098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64519 () Bool)

(assert (=> d!64519 (= (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 thiss!1204))) (and (bvsge (currentBit!9055 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9055 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9060 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9060 thiss!1204) (size!4338 (buf!4804 thiss!1204))) (and (= (currentBit!9055 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9060 thiss!1204) (size!4338 (buf!4804 thiss!1204)))))))))

(assert (=> b!187098 d!64519))

(declare-fun d!64521 () Bool)

(declare-fun res!155866 () Bool)

(declare-fun e!129432 () Bool)

(assert (=> d!64521 (=> (not res!155866) (not e!129432))))

(assert (=> d!64521 (= res!155866 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8737 lt!289458))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8737 lt!289458))))))))))

(assert (=> d!64521 (= (moveBitIndexPrecond!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001) e!129432)))

(declare-fun b!187154 () Bool)

(declare-fun lt!289554 () (_ BitVec 64))

(assert (=> b!187154 (= e!129432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289554) (bvsle lt!289554 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8737 lt!289458))))))))))

(assert (=> b!187154 (= lt!289554 (bvadd (bitIndex!0 (size!4338 (buf!4804 (_1!8737 lt!289458))) (currentByte!9060 (_1!8737 lt!289458)) (currentBit!9055 (_1!8737 lt!289458))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!64521 res!155866) b!187154))

(declare-fun m!290977 () Bool)

(assert (=> b!187154 m!290977))

(assert (=> b!187097 d!64521))

(declare-fun d!64527 () Bool)

(declare-fun lt!289574 () tuple2!16186)

(declare-fun lt!289572 () tuple2!16186)

(assert (=> d!64527 (and (= (_2!8738 lt!289574) (_2!8738 lt!289572)) (= (_1!8738 lt!289574) (_1!8738 lt!289572)))))

(declare-fun lt!289571 () Unit!13371)

(declare-fun lt!289573 () Bool)

(declare-fun lt!289569 () BitStream!7784)

(declare-fun lt!289570 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16186 tuple2!16186 BitStream!7784 (_ BitVec 64) Bool BitStream!7784 (_ BitVec 64) tuple2!16186 tuple2!16186 BitStream!7784 (_ BitVec 64)) Unit!13371)

(assert (=> d!64527 (= lt!289571 (choose!56 (_1!8737 lt!289458) nBits!348 i!590 lt!289467 lt!289574 (tuple2!16187 (_1!8738 lt!289574) (_2!8738 lt!289574)) (_1!8738 lt!289574) (_2!8738 lt!289574) lt!289573 lt!289569 lt!289570 lt!289572 (tuple2!16187 (_1!8738 lt!289572) (_2!8738 lt!289572)) (_1!8738 lt!289572) (_2!8738 lt!289572)))))

(assert (=> d!64527 (= lt!289572 (readNBitsLSBFirstsLoopPure!0 lt!289569 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!289570))))

(assert (=> d!64527 (= lt!289570 (bvor lt!289467 (ite lt!289573 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64527 (= lt!289569 (withMovedBitIndex!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64527 (= lt!289573 (_2!8736 (readBitPure!0 (_1!8737 lt!289458))))))

(assert (=> d!64527 (= lt!289574 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!289458) nBits!348 i!590 lt!289467))))

(assert (=> d!64527 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8737 lt!289458) nBits!348 i!590 lt!289467) lt!289571)))

(declare-fun bs!16054 () Bool)

(assert (= bs!16054 d!64527))

(assert (=> bs!16054 m!290885))

(declare-fun m!290983 () Bool)

(assert (=> bs!16054 m!290983))

(assert (=> bs!16054 m!290871))

(assert (=> bs!16054 m!290881))

(declare-fun m!290985 () Bool)

(assert (=> bs!16054 m!290985))

(assert (=> b!187097 d!64527))

(declare-fun d!64537 () Bool)

(declare-datatypes ((tuple2!16192 0))(
  ( (tuple2!16193 (_1!8741 (_ BitVec 64)) (_2!8741 BitStream!7784)) )
))
(declare-fun lt!289577 () tuple2!16192)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16192)

(assert (=> d!64537 (= lt!289577 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289464))))

(assert (=> d!64537 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289464) (tuple2!16187 (_2!8741 lt!289577) (_1!8741 lt!289577)))))

(declare-fun bs!16055 () Bool)

(assert (= bs!16055 d!64537))

(assert (=> bs!16055 m!290871))

(declare-fun m!290987 () Bool)

(assert (=> bs!16055 m!290987))

(assert (=> b!187097 d!64537))

(declare-fun d!64539 () Bool)

(declare-fun e!129438 () Bool)

(assert (=> d!64539 e!129438))

(declare-fun res!155872 () Bool)

(assert (=> d!64539 (=> (not res!155872) (not e!129438))))

(declare-fun lt!289583 () (_ BitVec 64))

(declare-fun lt!289582 () BitStream!7784)

(assert (=> d!64539 (= res!155872 (= (bvadd lt!289583 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4338 (buf!4804 lt!289582)) (currentByte!9060 lt!289582) (currentBit!9055 lt!289582))))))

(assert (=> d!64539 (or (not (= (bvand lt!289583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289583 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64539 (= lt!289583 (bitIndex!0 (size!4338 (buf!4804 (_1!8737 lt!289458))) (currentByte!9060 (_1!8737 lt!289458)) (currentBit!9055 (_1!8737 lt!289458))))))

(declare-fun moveBitIndex!0 (BitStream!7784 (_ BitVec 64)) tuple2!16180)

(assert (=> d!64539 (= lt!289582 (_2!8735 (moveBitIndex!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64539 (moveBitIndexPrecond!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64539 (= (withMovedBitIndex!0 (_1!8737 lt!289458) #b0000000000000000000000000000000000000000000000000000000000000001) lt!289582)))

(declare-fun b!187160 () Bool)

(assert (=> b!187160 (= e!129438 (= (size!4338 (buf!4804 (_1!8737 lt!289458))) (size!4338 (buf!4804 lt!289582))))))

(assert (= (and d!64539 res!155872) b!187160))

(declare-fun m!290989 () Bool)

(assert (=> d!64539 m!290989))

(assert (=> d!64539 m!290977))

(declare-fun m!290991 () Bool)

(assert (=> d!64539 m!290991))

(assert (=> d!64539 m!290867))

(assert (=> b!187097 d!64539))

(declare-fun d!64541 () Bool)

(assert (=> d!64541 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!187108 d!64541))

(declare-fun d!64543 () Bool)

(assert (=> d!64543 (= (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289452)))) (and (bvsge (currentBit!9055 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9055 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9060 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289452)))) (and (= (currentBit!9055 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289452))))))))))

(assert (=> b!187108 d!64543))

(declare-fun d!64545 () Bool)

(assert (=> d!64545 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!289456)))

(declare-fun lt!289586 () Unit!13371)

(declare-fun choose!9 (BitStream!7784 array!9838 (_ BitVec 64) BitStream!7784) Unit!13371)

(assert (=> d!64545 (= lt!289586 (choose!9 (_2!8735 lt!289452) (buf!4804 (_2!8735 lt!289453)) lt!289456 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452)))))))

(assert (=> d!64545 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8735 lt!289452) (buf!4804 (_2!8735 lt!289453)) lt!289456) lt!289586)))

(declare-fun bs!16056 () Bool)

(assert (= bs!16056 d!64545))

(assert (=> bs!16056 m!290907))

(declare-fun m!290993 () Bool)

(assert (=> bs!16056 m!290993))

(assert (=> b!187108 d!64545))

(declare-fun d!64547 () Bool)

(declare-fun e!129447 () Bool)

(assert (=> d!64547 e!129447))

(declare-fun res!155886 () Bool)

(assert (=> d!64547 (=> (not res!155886) (not e!129447))))

(declare-fun lt!289660 () (_ BitVec 64))

(declare-fun lt!289661 () (_ BitVec 64))

(declare-fun lt!289659 () (_ BitVec 64))

(assert (=> d!64547 (= res!155886 (= lt!289661 (bvsub lt!289659 lt!289660)))))

(assert (=> d!64547 (or (= (bvand lt!289659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289659 lt!289660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64547 (= lt!289660 (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289451)))) ((_ sign_extend 32) (currentByte!9060 (_1!8736 lt!289451))) ((_ sign_extend 32) (currentBit!9055 (_1!8736 lt!289451)))))))

(declare-fun lt!289662 () (_ BitVec 64))

(declare-fun lt!289663 () (_ BitVec 64))

(assert (=> d!64547 (= lt!289659 (bvmul lt!289662 lt!289663))))

(assert (=> d!64547 (or (= lt!289662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289663 (bvsdiv (bvmul lt!289662 lt!289663) lt!289662)))))

(assert (=> d!64547 (= lt!289663 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64547 (= lt!289662 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289451)))))))

(assert (=> d!64547 (= lt!289661 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9060 (_1!8736 lt!289451))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9055 (_1!8736 lt!289451)))))))

(assert (=> d!64547 (invariant!0 (currentBit!9055 (_1!8736 lt!289451)) (currentByte!9060 (_1!8736 lt!289451)) (size!4338 (buf!4804 (_1!8736 lt!289451))))))

(assert (=> d!64547 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289451))) (currentByte!9060 (_1!8736 lt!289451)) (currentBit!9055 (_1!8736 lt!289451))) lt!289661)))

(declare-fun b!187180 () Bool)

(declare-fun res!155887 () Bool)

(assert (=> b!187180 (=> (not res!155887) (not e!129447))))

(assert (=> b!187180 (= res!155887 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289661))))

(declare-fun b!187181 () Bool)

(declare-fun lt!289664 () (_ BitVec 64))

(assert (=> b!187181 (= e!129447 (bvsle lt!289661 (bvmul lt!289664 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187181 (or (= lt!289664 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289664 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289664)))))

(assert (=> b!187181 (= lt!289664 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289451)))))))

(assert (= (and d!64547 res!155886) b!187180))

(assert (= (and b!187180 res!155887) b!187181))

(declare-fun m!291025 () Bool)

(assert (=> d!64547 m!291025))

(declare-fun m!291027 () Bool)

(assert (=> d!64547 m!291027))

(assert (=> b!187108 d!64547))

(declare-fun lt!289671 () tuple2!16192)

(declare-fun d!64551 () Bool)

(assert (=> d!64551 (= lt!289671 (readNBitsLSBFirstsLoop!0 (_1!8737 lt!289472) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289464))))

(assert (=> d!64551 (= (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!289472) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289464) (tuple2!16187 (_2!8741 lt!289671) (_1!8741 lt!289671)))))

(declare-fun bs!16057 () Bool)

(assert (= bs!16057 d!64551))

(declare-fun m!291033 () Bool)

(assert (=> bs!16057 m!291033))

(assert (=> b!187108 d!64551))

(declare-fun d!64555 () Bool)

(declare-fun e!129454 () Bool)

(assert (=> d!64555 e!129454))

(declare-fun res!155896 () Bool)

(assert (=> d!64555 (=> (not res!155896) (not e!129454))))

(declare-fun lt!289698 () tuple2!16182)

(declare-fun lt!289699 () tuple2!16182)

(assert (=> d!64555 (= res!155896 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289698))) (currentByte!9060 (_1!8736 lt!289698)) (currentBit!9055 (_1!8736 lt!289698))) (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289699))) (currentByte!9060 (_1!8736 lt!289699)) (currentBit!9055 (_1!8736 lt!289699)))))))

(declare-fun lt!289697 () BitStream!7784)

(declare-fun lt!289696 () Unit!13371)

(declare-fun choose!50 (BitStream!7784 BitStream!7784 BitStream!7784 tuple2!16182 tuple2!16182 BitStream!7784 Bool tuple2!16182 tuple2!16182 BitStream!7784 Bool) Unit!13371)

(assert (=> d!64555 (= lt!289696 (choose!50 lt!289455 (_2!8735 lt!289453) lt!289697 lt!289698 (tuple2!16183 (_1!8736 lt!289698) (_2!8736 lt!289698)) (_1!8736 lt!289698) (_2!8736 lt!289698) lt!289699 (tuple2!16183 (_1!8736 lt!289699) (_2!8736 lt!289699)) (_1!8736 lt!289699) (_2!8736 lt!289699)))))

(assert (=> d!64555 (= lt!289699 (readBitPure!0 lt!289697))))

(assert (=> d!64555 (= lt!289698 (readBitPure!0 lt!289455))))

(assert (=> d!64555 (= lt!289697 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 lt!289455) (currentBit!9055 lt!289455)))))

(assert (=> d!64555 (invariant!0 (currentBit!9055 lt!289455) (currentByte!9060 lt!289455) (size!4338 (buf!4804 (_2!8735 lt!289453))))))

(assert (=> d!64555 (= (readBitPrefixLemma!0 lt!289455 (_2!8735 lt!289453)) lt!289696)))

(declare-fun b!187190 () Bool)

(assert (=> b!187190 (= e!129454 (= (_2!8736 lt!289698) (_2!8736 lt!289699)))))

(assert (= (and d!64555 res!155896) b!187190))

(declare-fun m!291047 () Bool)

(assert (=> d!64555 m!291047))

(assert (=> d!64555 m!290887))

(declare-fun m!291049 () Bool)

(assert (=> d!64555 m!291049))

(declare-fun m!291051 () Bool)

(assert (=> d!64555 m!291051))

(declare-fun m!291053 () Bool)

(assert (=> d!64555 m!291053))

(declare-fun m!291055 () Bool)

(assert (=> d!64555 m!291055))

(assert (=> b!187108 d!64555))

(declare-fun d!64569 () Bool)

(declare-fun lt!289700 () tuple2!16192)

(assert (=> d!64569 (= lt!289700 (readNBitsLSBFirstsLoop!0 (_1!8737 lt!289458) nBits!348 i!590 lt!289467))))

(assert (=> d!64569 (= (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!289458) nBits!348 i!590 lt!289467) (tuple2!16187 (_2!8741 lt!289700) (_1!8741 lt!289700)))))

(declare-fun bs!16062 () Bool)

(assert (= bs!16062 d!64569))

(declare-fun m!291057 () Bool)

(assert (=> bs!16062 m!291057))

(assert (=> b!187108 d!64569))

(declare-fun d!64571 () Bool)

(declare-datatypes ((tuple2!16194 0))(
  ( (tuple2!16195 (_1!8742 Bool) (_2!8742 BitStream!7784)) )
))
(declare-fun lt!289727 () tuple2!16194)

(declare-fun readBit!0 (BitStream!7784) tuple2!16194)

(assert (=> d!64571 (= lt!289727 (readBit!0 lt!289455))))

(assert (=> d!64571 (= (readBitPure!0 lt!289455) (tuple2!16183 (_2!8742 lt!289727) (_1!8742 lt!289727)))))

(declare-fun bs!16063 () Bool)

(assert (= bs!16063 d!64571))

(declare-fun m!291069 () Bool)

(assert (=> bs!16063 m!291069))

(assert (=> b!187108 d!64571))

(declare-fun d!64575 () Bool)

(declare-fun lt!289728 () tuple2!16194)

(assert (=> d!64575 (= lt!289728 (readBit!0 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204))))))

(assert (=> d!64575 (= (readBitPure!0 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204))) (tuple2!16183 (_2!8742 lt!289728) (_1!8742 lt!289728)))))

(declare-fun bs!16064 () Bool)

(assert (= bs!16064 d!64575))

(declare-fun m!291079 () Bool)

(assert (=> bs!16064 m!291079))

(assert (=> b!187108 d!64575))

(declare-fun d!64577 () Bool)

(assert (=> d!64577 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204)) lt!289473)))

(declare-fun lt!289729 () Unit!13371)

(assert (=> d!64577 (= lt!289729 (choose!9 thiss!1204 (buf!4804 (_2!8735 lt!289453)) lt!289473 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204))))))

(assert (=> d!64577 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4804 (_2!8735 lt!289453)) lt!289473) lt!289729)))

(declare-fun bs!16065 () Bool)

(assert (= bs!16065 d!64577))

(assert (=> bs!16065 m!290883))

(declare-fun m!291099 () Bool)

(assert (=> bs!16065 m!291099))

(assert (=> b!187108 d!64577))

(declare-fun d!64581 () Bool)

(assert (=> d!64581 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204)) lt!289473) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204))) lt!289473))))

(declare-fun bs!16067 () Bool)

(assert (= bs!16067 d!64581))

(declare-fun m!291103 () Bool)

(assert (=> bs!16067 m!291103))

(assert (=> b!187108 d!64581))

(declare-fun d!64585 () Bool)

(declare-fun lt!289731 () tuple2!16194)

(assert (=> d!64585 (= lt!289731 (readBit!0 (_1!8737 lt!289458)))))

(assert (=> d!64585 (= (readBitPure!0 (_1!8737 lt!289458)) (tuple2!16183 (_2!8742 lt!289731) (_1!8742 lt!289731)))))

(declare-fun bs!16068 () Bool)

(assert (= bs!16068 d!64585))

(declare-fun m!291105 () Bool)

(assert (=> bs!16068 m!291105))

(assert (=> b!187108 d!64585))

(declare-fun d!64587 () Bool)

(declare-fun e!129458 () Bool)

(assert (=> d!64587 e!129458))

(declare-fun res!155901 () Bool)

(assert (=> d!64587 (=> (not res!155901) (not e!129458))))

(declare-fun lt!289732 () (_ BitVec 64))

(declare-fun lt!289733 () (_ BitVec 64))

(declare-fun lt!289734 () (_ BitVec 64))

(assert (=> d!64587 (= res!155901 (= lt!289734 (bvsub lt!289732 lt!289733)))))

(assert (=> d!64587 (or (= (bvand lt!289732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289733 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289732 lt!289733) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64587 (= lt!289733 (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289465)))) ((_ sign_extend 32) (currentByte!9060 (_1!8736 lt!289465))) ((_ sign_extend 32) (currentBit!9055 (_1!8736 lt!289465)))))))

(declare-fun lt!289735 () (_ BitVec 64))

(declare-fun lt!289736 () (_ BitVec 64))

(assert (=> d!64587 (= lt!289732 (bvmul lt!289735 lt!289736))))

(assert (=> d!64587 (or (= lt!289735 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289736 (bvsdiv (bvmul lt!289735 lt!289736) lt!289735)))))

(assert (=> d!64587 (= lt!289736 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64587 (= lt!289735 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289465)))))))

(assert (=> d!64587 (= lt!289734 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9060 (_1!8736 lt!289465))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9055 (_1!8736 lt!289465)))))))

(assert (=> d!64587 (invariant!0 (currentBit!9055 (_1!8736 lt!289465)) (currentByte!9060 (_1!8736 lt!289465)) (size!4338 (buf!4804 (_1!8736 lt!289465))))))

(assert (=> d!64587 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289465))) (currentByte!9060 (_1!8736 lt!289465)) (currentBit!9055 (_1!8736 lt!289465))) lt!289734)))

(declare-fun b!187197 () Bool)

(declare-fun res!155902 () Bool)

(assert (=> b!187197 (=> (not res!155902) (not e!129458))))

(assert (=> b!187197 (= res!155902 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289734))))

(declare-fun b!187198 () Bool)

(declare-fun lt!289737 () (_ BitVec 64))

(assert (=> b!187198 (= e!129458 (bvsle lt!289734 (bvmul lt!289737 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187198 (or (= lt!289737 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289737 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289737)))))

(assert (=> b!187198 (= lt!289737 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289465)))))))

(assert (= (and d!64587 res!155901) b!187197))

(assert (= (and b!187197 res!155902) b!187198))

(declare-fun m!291107 () Bool)

(assert (=> d!64587 m!291107))

(declare-fun m!291109 () Bool)

(assert (=> d!64587 m!291109))

(assert (=> b!187108 d!64587))

(declare-fun d!64589 () Bool)

(assert (=> d!64589 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!289456) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452)))) lt!289456))))

(declare-fun bs!16069 () Bool)

(assert (= bs!16069 d!64589))

(declare-fun m!291111 () Bool)

(assert (=> bs!16069 m!291111))

(assert (=> b!187108 d!64589))

(declare-fun b!187218 () Bool)

(declare-fun e!129469 () Unit!13371)

(declare-fun lt!289803 () Unit!13371)

(assert (=> b!187218 (= e!129469 lt!289803)))

(declare-fun lt!289806 () (_ BitVec 64))

(assert (=> b!187218 (= lt!289806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!289795 () (_ BitVec 64))

(assert (=> b!187218 (= lt!289795 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9838 array!9838 (_ BitVec 64) (_ BitVec 64)) Unit!13371)

(assert (=> b!187218 (= lt!289803 (arrayBitRangesEqSymmetric!0 (buf!4804 thiss!1204) (buf!4804 (_2!8735 lt!289453)) lt!289806 lt!289795))))

(declare-fun arrayBitRangesEq!0 (array!9838 array!9838 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187218 (arrayBitRangesEq!0 (buf!4804 (_2!8735 lt!289453)) (buf!4804 thiss!1204) lt!289806 lt!289795)))

(declare-fun b!187219 () Bool)

(declare-fun res!155920 () Bool)

(declare-fun e!129470 () Bool)

(assert (=> b!187219 (=> (not res!155920) (not e!129470))))

(declare-fun lt!289808 () tuple2!16184)

(assert (=> b!187219 (= res!155920 (isPrefixOf!0 (_1!8737 lt!289808) thiss!1204))))

(declare-fun b!187220 () Bool)

(declare-fun res!155919 () Bool)

(assert (=> b!187220 (=> (not res!155919) (not e!129470))))

(assert (=> b!187220 (= res!155919 (isPrefixOf!0 (_2!8737 lt!289808) (_2!8735 lt!289453)))))

(declare-fun lt!289802 () (_ BitVec 64))

(declare-fun b!187222 () Bool)

(declare-fun lt!289807 () (_ BitVec 64))

(assert (=> b!187222 (= e!129470 (= (_1!8737 lt!289808) (withMovedBitIndex!0 (_2!8737 lt!289808) (bvsub lt!289802 lt!289807))))))

(assert (=> b!187222 (or (= (bvand lt!289802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289802 lt!289807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187222 (= lt!289807 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289453))) (currentByte!9060 (_2!8735 lt!289453)) (currentBit!9055 (_2!8735 lt!289453))))))

(assert (=> b!187222 (= lt!289802 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(declare-fun d!64591 () Bool)

(assert (=> d!64591 e!129470))

(declare-fun res!155918 () Bool)

(assert (=> d!64591 (=> (not res!155918) (not e!129470))))

(assert (=> d!64591 (= res!155918 (isPrefixOf!0 (_1!8737 lt!289808) (_2!8737 lt!289808)))))

(declare-fun lt!289812 () BitStream!7784)

(assert (=> d!64591 (= lt!289808 (tuple2!16185 lt!289812 (_2!8735 lt!289453)))))

(declare-fun lt!289796 () Unit!13371)

(declare-fun lt!289798 () Unit!13371)

(assert (=> d!64591 (= lt!289796 lt!289798)))

(assert (=> d!64591 (isPrefixOf!0 lt!289812 (_2!8735 lt!289453))))

(assert (=> d!64591 (= lt!289798 (lemmaIsPrefixTransitive!0 lt!289812 (_2!8735 lt!289453) (_2!8735 lt!289453)))))

(declare-fun lt!289793 () Unit!13371)

(declare-fun lt!289801 () Unit!13371)

(assert (=> d!64591 (= lt!289793 lt!289801)))

(assert (=> d!64591 (isPrefixOf!0 lt!289812 (_2!8735 lt!289453))))

(assert (=> d!64591 (= lt!289801 (lemmaIsPrefixTransitive!0 lt!289812 thiss!1204 (_2!8735 lt!289453)))))

(declare-fun lt!289794 () Unit!13371)

(assert (=> d!64591 (= lt!289794 e!129469)))

(declare-fun c!9543 () Bool)

(assert (=> d!64591 (= c!9543 (not (= (size!4338 (buf!4804 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!289811 () Unit!13371)

(declare-fun lt!289809 () Unit!13371)

(assert (=> d!64591 (= lt!289811 lt!289809)))

(assert (=> d!64591 (isPrefixOf!0 (_2!8735 lt!289453) (_2!8735 lt!289453))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7784) Unit!13371)

(assert (=> d!64591 (= lt!289809 (lemmaIsPrefixRefl!0 (_2!8735 lt!289453)))))

(declare-fun lt!289804 () Unit!13371)

(declare-fun lt!289800 () Unit!13371)

(assert (=> d!64591 (= lt!289804 lt!289800)))

(assert (=> d!64591 (= lt!289800 (lemmaIsPrefixRefl!0 (_2!8735 lt!289453)))))

(declare-fun lt!289797 () Unit!13371)

(declare-fun lt!289805 () Unit!13371)

(assert (=> d!64591 (= lt!289797 lt!289805)))

(assert (=> d!64591 (isPrefixOf!0 lt!289812 lt!289812)))

(assert (=> d!64591 (= lt!289805 (lemmaIsPrefixRefl!0 lt!289812))))

(declare-fun lt!289799 () Unit!13371)

(declare-fun lt!289810 () Unit!13371)

(assert (=> d!64591 (= lt!289799 lt!289810)))

(assert (=> d!64591 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64591 (= lt!289810 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64591 (= lt!289812 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(assert (=> d!64591 (isPrefixOf!0 thiss!1204 (_2!8735 lt!289453))))

(assert (=> d!64591 (= (reader!0 thiss!1204 (_2!8735 lt!289453)) lt!289808)))

(declare-fun b!187221 () Bool)

(declare-fun Unit!13386 () Unit!13371)

(assert (=> b!187221 (= e!129469 Unit!13386)))

(assert (= (and d!64591 c!9543) b!187218))

(assert (= (and d!64591 (not c!9543)) b!187221))

(assert (= (and d!64591 res!155918) b!187219))

(assert (= (and b!187219 res!155920) b!187220))

(assert (= (and b!187220 res!155919) b!187222))

(declare-fun m!291133 () Bool)

(assert (=> b!187219 m!291133))

(declare-fun m!291135 () Bool)

(assert (=> b!187220 m!291135))

(assert (=> b!187218 m!290861))

(declare-fun m!291137 () Bool)

(assert (=> b!187218 m!291137))

(declare-fun m!291139 () Bool)

(assert (=> b!187218 m!291139))

(declare-fun m!291141 () Bool)

(assert (=> b!187222 m!291141))

(assert (=> b!187222 m!290921))

(assert (=> b!187222 m!290861))

(declare-fun m!291143 () Bool)

(assert (=> d!64591 m!291143))

(declare-fun m!291145 () Bool)

(assert (=> d!64591 m!291145))

(declare-fun m!291147 () Bool)

(assert (=> d!64591 m!291147))

(declare-fun m!291149 () Bool)

(assert (=> d!64591 m!291149))

(declare-fun m!291151 () Bool)

(assert (=> d!64591 m!291151))

(declare-fun m!291153 () Bool)

(assert (=> d!64591 m!291153))

(declare-fun m!291155 () Bool)

(assert (=> d!64591 m!291155))

(declare-fun m!291157 () Bool)

(assert (=> d!64591 m!291157))

(declare-fun m!291159 () Bool)

(assert (=> d!64591 m!291159))

(assert (=> d!64591 m!290923))

(declare-fun m!291161 () Bool)

(assert (=> d!64591 m!291161))

(assert (=> b!187108 d!64591))

(declare-fun b!187223 () Bool)

(declare-fun e!129471 () Unit!13371)

(declare-fun lt!289823 () Unit!13371)

(assert (=> b!187223 (= e!129471 lt!289823)))

(declare-fun lt!289826 () (_ BitVec 64))

(assert (=> b!187223 (= lt!289826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!289815 () (_ BitVec 64))

(assert (=> b!187223 (= lt!289815 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(assert (=> b!187223 (= lt!289823 (arrayBitRangesEqSymmetric!0 (buf!4804 (_2!8735 lt!289452)) (buf!4804 (_2!8735 lt!289453)) lt!289826 lt!289815))))

(assert (=> b!187223 (arrayBitRangesEq!0 (buf!4804 (_2!8735 lt!289453)) (buf!4804 (_2!8735 lt!289452)) lt!289826 lt!289815)))

(declare-fun b!187224 () Bool)

(declare-fun res!155923 () Bool)

(declare-fun e!129472 () Bool)

(assert (=> b!187224 (=> (not res!155923) (not e!129472))))

(declare-fun lt!289828 () tuple2!16184)

(assert (=> b!187224 (= res!155923 (isPrefixOf!0 (_1!8737 lt!289828) (_2!8735 lt!289452)))))

(declare-fun b!187225 () Bool)

(declare-fun res!155922 () Bool)

(assert (=> b!187225 (=> (not res!155922) (not e!129472))))

(assert (=> b!187225 (= res!155922 (isPrefixOf!0 (_2!8737 lt!289828) (_2!8735 lt!289453)))))

(declare-fun b!187227 () Bool)

(declare-fun lt!289827 () (_ BitVec 64))

(declare-fun lt!289822 () (_ BitVec 64))

(assert (=> b!187227 (= e!129472 (= (_1!8737 lt!289828) (withMovedBitIndex!0 (_2!8737 lt!289828) (bvsub lt!289822 lt!289827))))))

(assert (=> b!187227 (or (= (bvand lt!289822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289822 lt!289827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187227 (= lt!289827 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289453))) (currentByte!9060 (_2!8735 lt!289453)) (currentBit!9055 (_2!8735 lt!289453))))))

(assert (=> b!187227 (= lt!289822 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(declare-fun d!64611 () Bool)

(assert (=> d!64611 e!129472))

(declare-fun res!155921 () Bool)

(assert (=> d!64611 (=> (not res!155921) (not e!129472))))

(assert (=> d!64611 (= res!155921 (isPrefixOf!0 (_1!8737 lt!289828) (_2!8737 lt!289828)))))

(declare-fun lt!289832 () BitStream!7784)

(assert (=> d!64611 (= lt!289828 (tuple2!16185 lt!289832 (_2!8735 lt!289453)))))

(declare-fun lt!289816 () Unit!13371)

(declare-fun lt!289818 () Unit!13371)

(assert (=> d!64611 (= lt!289816 lt!289818)))

(assert (=> d!64611 (isPrefixOf!0 lt!289832 (_2!8735 lt!289453))))

(assert (=> d!64611 (= lt!289818 (lemmaIsPrefixTransitive!0 lt!289832 (_2!8735 lt!289453) (_2!8735 lt!289453)))))

(declare-fun lt!289813 () Unit!13371)

(declare-fun lt!289821 () Unit!13371)

(assert (=> d!64611 (= lt!289813 lt!289821)))

(assert (=> d!64611 (isPrefixOf!0 lt!289832 (_2!8735 lt!289453))))

(assert (=> d!64611 (= lt!289821 (lemmaIsPrefixTransitive!0 lt!289832 (_2!8735 lt!289452) (_2!8735 lt!289453)))))

(declare-fun lt!289814 () Unit!13371)

(assert (=> d!64611 (= lt!289814 e!129471)))

(declare-fun c!9544 () Bool)

(assert (=> d!64611 (= c!9544 (not (= (size!4338 (buf!4804 (_2!8735 lt!289452))) #b00000000000000000000000000000000)))))

(declare-fun lt!289831 () Unit!13371)

(declare-fun lt!289829 () Unit!13371)

(assert (=> d!64611 (= lt!289831 lt!289829)))

(assert (=> d!64611 (isPrefixOf!0 (_2!8735 lt!289453) (_2!8735 lt!289453))))

(assert (=> d!64611 (= lt!289829 (lemmaIsPrefixRefl!0 (_2!8735 lt!289453)))))

(declare-fun lt!289824 () Unit!13371)

(declare-fun lt!289820 () Unit!13371)

(assert (=> d!64611 (= lt!289824 lt!289820)))

(assert (=> d!64611 (= lt!289820 (lemmaIsPrefixRefl!0 (_2!8735 lt!289453)))))

(declare-fun lt!289817 () Unit!13371)

(declare-fun lt!289825 () Unit!13371)

(assert (=> d!64611 (= lt!289817 lt!289825)))

(assert (=> d!64611 (isPrefixOf!0 lt!289832 lt!289832)))

(assert (=> d!64611 (= lt!289825 (lemmaIsPrefixRefl!0 lt!289832))))

(declare-fun lt!289819 () Unit!13371)

(declare-fun lt!289830 () Unit!13371)

(assert (=> d!64611 (= lt!289819 lt!289830)))

(assert (=> d!64611 (isPrefixOf!0 (_2!8735 lt!289452) (_2!8735 lt!289452))))

(assert (=> d!64611 (= lt!289830 (lemmaIsPrefixRefl!0 (_2!8735 lt!289452)))))

(assert (=> d!64611 (= lt!289832 (BitStream!7785 (buf!4804 (_2!8735 lt!289453)) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(assert (=> d!64611 (isPrefixOf!0 (_2!8735 lt!289452) (_2!8735 lt!289453))))

(assert (=> d!64611 (= (reader!0 (_2!8735 lt!289452) (_2!8735 lt!289453)) lt!289828)))

(declare-fun b!187226 () Bool)

(declare-fun Unit!13387 () Unit!13371)

(assert (=> b!187226 (= e!129471 Unit!13387)))

(assert (= (and d!64611 c!9544) b!187223))

(assert (= (and d!64611 (not c!9544)) b!187226))

(assert (= (and d!64611 res!155921) b!187224))

(assert (= (and b!187224 res!155923) b!187225))

(assert (= (and b!187225 res!155922) b!187227))

(declare-fun m!291163 () Bool)

(assert (=> b!187224 m!291163))

(declare-fun m!291165 () Bool)

(assert (=> b!187225 m!291165))

(assert (=> b!187223 m!290859))

(declare-fun m!291167 () Bool)

(assert (=> b!187223 m!291167))

(declare-fun m!291169 () Bool)

(assert (=> b!187223 m!291169))

(declare-fun m!291171 () Bool)

(assert (=> b!187227 m!291171))

(assert (=> b!187227 m!290921))

(assert (=> b!187227 m!290859))

(declare-fun m!291173 () Bool)

(assert (=> d!64611 m!291173))

(declare-fun m!291175 () Bool)

(assert (=> d!64611 m!291175))

(assert (=> d!64611 m!291147))

(declare-fun m!291177 () Bool)

(assert (=> d!64611 m!291177))

(declare-fun m!291179 () Bool)

(assert (=> d!64611 m!291179))

(declare-fun m!291181 () Bool)

(assert (=> d!64611 m!291181))

(declare-fun m!291183 () Bool)

(assert (=> d!64611 m!291183))

(declare-fun m!291185 () Bool)

(assert (=> d!64611 m!291185))

(assert (=> d!64611 m!291159))

(assert (=> d!64611 m!290857))

(declare-fun m!291187 () Bool)

(assert (=> d!64611 m!291187))

(assert (=> b!187108 d!64611))

(declare-fun d!64613 () Bool)

(declare-fun e!129473 () Bool)

(assert (=> d!64613 e!129473))

(declare-fun res!155924 () Bool)

(assert (=> d!64613 (=> (not res!155924) (not e!129473))))

(declare-fun lt!289835 () (_ BitVec 64))

(declare-fun lt!289834 () (_ BitVec 64))

(declare-fun lt!289833 () (_ BitVec 64))

(assert (=> d!64613 (= res!155924 (= lt!289835 (bvsub lt!289833 lt!289834)))))

(assert (=> d!64613 (or (= (bvand lt!289833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289833 lt!289834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64613 (= lt!289834 (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289474)))) ((_ sign_extend 32) (currentByte!9060 (_1!8736 lt!289474))) ((_ sign_extend 32) (currentBit!9055 (_1!8736 lt!289474)))))))

(declare-fun lt!289836 () (_ BitVec 64))

(declare-fun lt!289837 () (_ BitVec 64))

(assert (=> d!64613 (= lt!289833 (bvmul lt!289836 lt!289837))))

(assert (=> d!64613 (or (= lt!289836 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289837 (bvsdiv (bvmul lt!289836 lt!289837) lt!289836)))))

(assert (=> d!64613 (= lt!289837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64613 (= lt!289836 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289474)))))))

(assert (=> d!64613 (= lt!289835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9060 (_1!8736 lt!289474))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9055 (_1!8736 lt!289474)))))))

(assert (=> d!64613 (invariant!0 (currentBit!9055 (_1!8736 lt!289474)) (currentByte!9060 (_1!8736 lt!289474)) (size!4338 (buf!4804 (_1!8736 lt!289474))))))

(assert (=> d!64613 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289474))) (currentByte!9060 (_1!8736 lt!289474)) (currentBit!9055 (_1!8736 lt!289474))) lt!289835)))

(declare-fun b!187228 () Bool)

(declare-fun res!155925 () Bool)

(assert (=> b!187228 (=> (not res!155925) (not e!129473))))

(assert (=> b!187228 (= res!155925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289835))))

(declare-fun b!187229 () Bool)

(declare-fun lt!289838 () (_ BitVec 64))

(assert (=> b!187229 (= e!129473 (bvsle lt!289835 (bvmul lt!289838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187229 (or (= lt!289838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289838)))))

(assert (=> b!187229 (= lt!289838 ((_ sign_extend 32) (size!4338 (buf!4804 (_1!8736 lt!289474)))))))

(assert (= (and d!64613 res!155924) b!187228))

(assert (= (and b!187228 res!155925) b!187229))

(declare-fun m!291189 () Bool)

(assert (=> d!64613 m!291189))

(declare-fun m!291191 () Bool)

(assert (=> d!64613 m!291191))

(assert (=> b!187099 d!64613))

(declare-fun d!64615 () Bool)

(declare-fun e!129474 () Bool)

(assert (=> d!64615 e!129474))

(declare-fun res!155926 () Bool)

(assert (=> d!64615 (=> (not res!155926) (not e!129474))))

(declare-fun lt!289840 () (_ BitVec 64))

(declare-fun lt!289839 () BitStream!7784)

(assert (=> d!64615 (= res!155926 (= (bvadd lt!289840 (bvsub lt!289460 lt!289470)) (bitIndex!0 (size!4338 (buf!4804 lt!289839)) (currentByte!9060 lt!289839) (currentBit!9055 lt!289839))))))

(assert (=> d!64615 (or (not (= (bvand lt!289840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289460 lt!289470) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289840 (bvsub lt!289460 lt!289470)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64615 (= lt!289840 (bitIndex!0 (size!4338 (buf!4804 (_2!8737 lt!289458))) (currentByte!9060 (_2!8737 lt!289458)) (currentBit!9055 (_2!8737 lt!289458))))))

(assert (=> d!64615 (= lt!289839 (_2!8735 (moveBitIndex!0 (_2!8737 lt!289458) (bvsub lt!289460 lt!289470))))))

(assert (=> d!64615 (moveBitIndexPrecond!0 (_2!8737 lt!289458) (bvsub lt!289460 lt!289470))))

(assert (=> d!64615 (= (withMovedBitIndex!0 (_2!8737 lt!289458) (bvsub lt!289460 lt!289470)) lt!289839)))

(declare-fun b!187230 () Bool)

(assert (=> b!187230 (= e!129474 (= (size!4338 (buf!4804 (_2!8737 lt!289458))) (size!4338 (buf!4804 lt!289839))))))

(assert (= (and d!64615 res!155926) b!187230))

(declare-fun m!291193 () Bool)

(assert (=> d!64615 m!291193))

(declare-fun m!291195 () Bool)

(assert (=> d!64615 m!291195))

(declare-fun m!291197 () Bool)

(assert (=> d!64615 m!291197))

(declare-fun m!291199 () Bool)

(assert (=> d!64615 m!291199))

(assert (=> b!187110 d!64615))

(declare-fun d!64617 () Bool)

(declare-fun e!129475 () Bool)

(assert (=> d!64617 e!129475))

(declare-fun res!155927 () Bool)

(assert (=> d!64617 (=> (not res!155927) (not e!129475))))

(declare-fun lt!289841 () (_ BitVec 64))

(declare-fun lt!289842 () (_ BitVec 64))

(declare-fun lt!289843 () (_ BitVec 64))

(assert (=> d!64617 (= res!155927 (= lt!289843 (bvsub lt!289841 lt!289842)))))

(assert (=> d!64617 (or (= (bvand lt!289841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289842 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289841 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289841 lt!289842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64617 (= lt!289842 (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289452)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452)))))))

(declare-fun lt!289844 () (_ BitVec 64))

(declare-fun lt!289845 () (_ BitVec 64))

(assert (=> d!64617 (= lt!289841 (bvmul lt!289844 lt!289845))))

(assert (=> d!64617 (or (= lt!289844 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289845 (bvsdiv (bvmul lt!289844 lt!289845) lt!289844)))))

(assert (=> d!64617 (= lt!289845 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64617 (= lt!289844 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(assert (=> d!64617 (= lt!289843 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452)))))))

(assert (=> d!64617 (invariant!0 (currentBit!9055 (_2!8735 lt!289452)) (currentByte!9060 (_2!8735 lt!289452)) (size!4338 (buf!4804 (_2!8735 lt!289452))))))

(assert (=> d!64617 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))) lt!289843)))

(declare-fun b!187231 () Bool)

(declare-fun res!155928 () Bool)

(assert (=> b!187231 (=> (not res!155928) (not e!129475))))

(assert (=> b!187231 (= res!155928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289843))))

(declare-fun b!187232 () Bool)

(declare-fun lt!289846 () (_ BitVec 64))

(assert (=> b!187232 (= e!129475 (bvsle lt!289843 (bvmul lt!289846 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187232 (or (= lt!289846 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289846 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289846)))))

(assert (=> b!187232 (= lt!289846 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(assert (= (and d!64617 res!155927) b!187231))

(assert (= (and b!187231 res!155928) b!187232))

(declare-fun m!291201 () Bool)

(assert (=> d!64617 m!291201))

(declare-fun m!291203 () Bool)

(assert (=> d!64617 m!291203))

(assert (=> b!187109 d!64617))

(declare-fun d!64619 () Bool)

(declare-fun e!129476 () Bool)

(assert (=> d!64619 e!129476))

(declare-fun res!155929 () Bool)

(assert (=> d!64619 (=> (not res!155929) (not e!129476))))

(declare-fun lt!289847 () (_ BitVec 64))

(declare-fun lt!289849 () (_ BitVec 64))

(declare-fun lt!289848 () (_ BitVec 64))

(assert (=> d!64619 (= res!155929 (= lt!289849 (bvsub lt!289847 lt!289848)))))

(assert (=> d!64619 (or (= (bvand lt!289847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289847 lt!289848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64619 (= lt!289848 (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204))))))

(declare-fun lt!289850 () (_ BitVec 64))

(declare-fun lt!289851 () (_ BitVec 64))

(assert (=> d!64619 (= lt!289847 (bvmul lt!289850 lt!289851))))

(assert (=> d!64619 (or (= lt!289850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289851 (bvsdiv (bvmul lt!289850 lt!289851) lt!289850)))))

(assert (=> d!64619 (= lt!289851 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64619 (= lt!289850 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))))))

(assert (=> d!64619 (= lt!289849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9060 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9055 thiss!1204))))))

(assert (=> d!64619 (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 thiss!1204)))))

(assert (=> d!64619 (= (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)) lt!289849)))

(declare-fun b!187233 () Bool)

(declare-fun res!155930 () Bool)

(assert (=> b!187233 (=> (not res!155930) (not e!129476))))

(assert (=> b!187233 (= res!155930 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289849))))

(declare-fun b!187234 () Bool)

(declare-fun lt!289852 () (_ BitVec 64))

(assert (=> b!187234 (= e!129476 (bvsle lt!289849 (bvmul lt!289852 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187234 (or (= lt!289852 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289852 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289852)))))

(assert (=> b!187234 (= lt!289852 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))))))

(assert (= (and d!64619 res!155929) b!187233))

(assert (= (and b!187233 res!155930) b!187234))

(declare-fun m!291205 () Bool)

(assert (=> d!64619 m!291205))

(assert (=> d!64619 m!290851))

(assert (=> b!187109 d!64619))

(declare-fun b!187247 () Bool)

(declare-fun e!129481 () Bool)

(declare-fun lt!289863 () tuple2!16182)

(declare-fun lt!289864 () tuple2!16180)

(assert (=> b!187247 (= e!129481 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!289863))) (currentByte!9060 (_1!8736 lt!289863)) (currentBit!9055 (_1!8736 lt!289863))) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289864))) (currentByte!9060 (_2!8735 lt!289864)) (currentBit!9055 (_2!8735 lt!289864)))))))

(declare-fun b!187244 () Bool)

(declare-fun res!155940 () Bool)

(declare-fun e!129482 () Bool)

(assert (=> b!187244 (=> (not res!155940) (not e!129482))))

(declare-fun lt!289862 () (_ BitVec 64))

(declare-fun lt!289861 () (_ BitVec 64))

(assert (=> b!187244 (= res!155940 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289864))) (currentByte!9060 (_2!8735 lt!289864)) (currentBit!9055 (_2!8735 lt!289864))) (bvadd lt!289862 lt!289861)))))

(assert (=> b!187244 (or (not (= (bvand lt!289862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289861 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289862 lt!289861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187244 (= lt!289861 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!187244 (= lt!289862 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(declare-fun b!187246 () Bool)

(assert (=> b!187246 (= e!129482 e!129481)))

(declare-fun res!155942 () Bool)

(assert (=> b!187246 (=> (not res!155942) (not e!129481))))

(assert (=> b!187246 (= res!155942 (and (= (_2!8736 lt!289863) lt!289449) (= (_1!8736 lt!289863) (_2!8735 lt!289864))))))

(assert (=> b!187246 (= lt!289863 (readBitPure!0 (readerFrom!0 (_2!8735 lt!289864) (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204))))))

(declare-fun d!64621 () Bool)

(assert (=> d!64621 e!129482))

(declare-fun res!155939 () Bool)

(assert (=> d!64621 (=> (not res!155939) (not e!129482))))

(assert (=> d!64621 (= res!155939 (= (size!4338 (buf!4804 thiss!1204)) (size!4338 (buf!4804 (_2!8735 lt!289864)))))))

(declare-fun choose!16 (BitStream!7784 Bool) tuple2!16180)

(assert (=> d!64621 (= lt!289864 (choose!16 thiss!1204 lt!289449))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64621 (validate_offset_bit!0 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204)))))

(assert (=> d!64621 (= (appendBit!0 thiss!1204 lt!289449) lt!289864)))

(declare-fun b!187245 () Bool)

(declare-fun res!155941 () Bool)

(assert (=> b!187245 (=> (not res!155941) (not e!129482))))

(assert (=> b!187245 (= res!155941 (isPrefixOf!0 thiss!1204 (_2!8735 lt!289864)))))

(assert (= (and d!64621 res!155939) b!187244))

(assert (= (and b!187244 res!155940) b!187245))

(assert (= (and b!187245 res!155941) b!187246))

(assert (= (and b!187246 res!155942) b!187247))

(declare-fun m!291207 () Bool)

(assert (=> d!64621 m!291207))

(declare-fun m!291209 () Bool)

(assert (=> d!64621 m!291209))

(declare-fun m!291211 () Bool)

(assert (=> b!187245 m!291211))

(declare-fun m!291213 () Bool)

(assert (=> b!187247 m!291213))

(declare-fun m!291215 () Bool)

(assert (=> b!187247 m!291215))

(declare-fun m!291217 () Bool)

(assert (=> b!187246 m!291217))

(assert (=> b!187246 m!291217))

(declare-fun m!291219 () Bool)

(assert (=> b!187246 m!291219))

(assert (=> b!187244 m!291215))

(assert (=> b!187244 m!290861))

(assert (=> b!187109 d!64621))

(assert (=> b!187090 d!64617))

(assert (=> b!187090 d!64619))

(declare-fun d!64623 () Bool)

(declare-fun lt!289865 () tuple2!16194)

(assert (=> d!64623 (= lt!289865 (readBit!0 (readerFrom!0 (_2!8735 lt!289452) (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204))))))

(assert (=> d!64623 (= (readBitPure!0 (readerFrom!0 (_2!8735 lt!289452) (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204))) (tuple2!16183 (_2!8742 lt!289865) (_1!8742 lt!289865)))))

(declare-fun bs!16073 () Bool)

(assert (= bs!16073 d!64623))

(assert (=> bs!16073 m!290853))

(declare-fun m!291221 () Bool)

(assert (=> bs!16073 m!291221))

(assert (=> b!187100 d!64623))

(declare-fun d!64625 () Bool)

(declare-fun e!129485 () Bool)

(assert (=> d!64625 e!129485))

(declare-fun res!155946 () Bool)

(assert (=> d!64625 (=> (not res!155946) (not e!129485))))

(assert (=> d!64625 (= res!155946 (invariant!0 (currentBit!9055 (_2!8735 lt!289452)) (currentByte!9060 (_2!8735 lt!289452)) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(assert (=> d!64625 (= (readerFrom!0 (_2!8735 lt!289452) (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204)) (BitStream!7785 (buf!4804 (_2!8735 lt!289452)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)))))

(declare-fun b!187250 () Bool)

(assert (=> b!187250 (= e!129485 (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(assert (= (and d!64625 res!155946) b!187250))

(assert (=> d!64625 m!291203))

(assert (=> b!187250 m!290895))

(assert (=> b!187100 d!64625))

(declare-fun d!64627 () Bool)

(assert (=> d!64627 (= (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289453)))) (and (bvsge (currentBit!9055 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9055 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9060 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289453)))) (and (= (currentBit!9055 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9060 thiss!1204) (size!4338 (buf!4804 (_2!8735 lt!289453))))))))))

(assert (=> b!187091 d!64627))

(declare-fun d!64629 () Bool)

(assert (=> d!64629 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9055 thiss!1204) (currentByte!9060 thiss!1204) (size!4338 (buf!4804 thiss!1204))))))

(declare-fun bs!16074 () Bool)

(assert (= bs!16074 d!64629))

(assert (=> bs!16074 m!290851))

(assert (=> start!40662 d!64629))

(declare-fun d!64631 () Bool)

(assert (=> d!64631 (= (array_inv!4079 (buf!4804 thiss!1204)) (bvsge (size!4338 (buf!4804 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!187102 d!64631))

(declare-fun d!64633 () Bool)

(declare-fun res!155953 () Bool)

(declare-fun e!129490 () Bool)

(assert (=> d!64633 (=> (not res!155953) (not e!129490))))

(assert (=> d!64633 (= res!155953 (= (size!4338 (buf!4804 thiss!1204)) (size!4338 (buf!4804 (_2!8735 lt!289452)))))))

(assert (=> d!64633 (= (isPrefixOf!0 thiss!1204 (_2!8735 lt!289452)) e!129490)))

(declare-fun b!187257 () Bool)

(declare-fun res!155955 () Bool)

(assert (=> b!187257 (=> (not res!155955) (not e!129490))))

(assert (=> b!187257 (= res!155955 (bvsle (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452)))))))

(declare-fun b!187258 () Bool)

(declare-fun e!129491 () Bool)

(assert (=> b!187258 (= e!129490 e!129491)))

(declare-fun res!155954 () Bool)

(assert (=> b!187258 (=> res!155954 e!129491)))

(assert (=> b!187258 (= res!155954 (= (size!4338 (buf!4804 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187259 () Bool)

(assert (=> b!187259 (= e!129491 (arrayBitRangesEq!0 (buf!4804 thiss!1204) (buf!4804 (_2!8735 lt!289452)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204))))))

(assert (= (and d!64633 res!155953) b!187257))

(assert (= (and b!187257 res!155955) b!187258))

(assert (= (and b!187258 (not res!155954)) b!187259))

(assert (=> b!187257 m!290861))

(assert (=> b!187257 m!290859))

(assert (=> b!187259 m!290861))

(assert (=> b!187259 m!290861))

(declare-fun m!291223 () Bool)

(assert (=> b!187259 m!291223))

(assert (=> b!187101 d!64633))

(declare-fun d!64635 () Bool)

(declare-fun e!129492 () Bool)

(assert (=> d!64635 e!129492))

(declare-fun res!155956 () Bool)

(assert (=> d!64635 (=> (not res!155956) (not e!129492))))

(declare-fun lt!289866 () BitStream!7784)

(declare-fun lt!289867 () (_ BitVec 64))

(assert (=> d!64635 (= res!155956 (= (bvadd lt!289867 (bvsub lt!289450 lt!289470)) (bitIndex!0 (size!4338 (buf!4804 lt!289866)) (currentByte!9060 lt!289866) (currentBit!9055 lt!289866))))))

(assert (=> d!64635 (or (not (= (bvand lt!289867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289450 lt!289470) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!289867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!289867 (bvsub lt!289450 lt!289470)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64635 (= lt!289867 (bitIndex!0 (size!4338 (buf!4804 (_2!8737 lt!289472))) (currentByte!9060 (_2!8737 lt!289472)) (currentBit!9055 (_2!8737 lt!289472))))))

(assert (=> d!64635 (= lt!289866 (_2!8735 (moveBitIndex!0 (_2!8737 lt!289472) (bvsub lt!289450 lt!289470))))))

(assert (=> d!64635 (moveBitIndexPrecond!0 (_2!8737 lt!289472) (bvsub lt!289450 lt!289470))))

(assert (=> d!64635 (= (withMovedBitIndex!0 (_2!8737 lt!289472) (bvsub lt!289450 lt!289470)) lt!289866)))

(declare-fun b!187260 () Bool)

(assert (=> b!187260 (= e!129492 (= (size!4338 (buf!4804 (_2!8737 lt!289472))) (size!4338 (buf!4804 lt!289866))))))

(assert (= (and d!64635 res!155956) b!187260))

(declare-fun m!291225 () Bool)

(assert (=> d!64635 m!291225))

(declare-fun m!291227 () Bool)

(assert (=> d!64635 m!291227))

(declare-fun m!291229 () Bool)

(assert (=> d!64635 m!291229))

(declare-fun m!291231 () Bool)

(assert (=> d!64635 m!291231))

(assert (=> b!187094 d!64635))

(declare-fun d!64637 () Bool)

(assert (=> d!64637 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204)) lt!289473) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 thiss!1204))) ((_ sign_extend 32) (currentByte!9060 thiss!1204)) ((_ sign_extend 32) (currentBit!9055 thiss!1204))) lt!289473))))

(declare-fun bs!16075 () Bool)

(assert (= bs!16075 d!64637))

(assert (=> bs!16075 m!291205))

(assert (=> b!187093 d!64637))

(declare-fun d!64639 () Bool)

(declare-fun e!129493 () Bool)

(assert (=> d!64639 e!129493))

(declare-fun res!155957 () Bool)

(assert (=> d!64639 (=> (not res!155957) (not e!129493))))

(declare-fun lt!289868 () (_ BitVec 64))

(declare-fun lt!289870 () (_ BitVec 64))

(declare-fun lt!289869 () (_ BitVec 64))

(assert (=> d!64639 (= res!155957 (= lt!289870 (bvsub lt!289868 lt!289869)))))

(assert (=> d!64639 (or (= (bvand lt!289868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!289869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!289868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!289868 lt!289869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64639 (= lt!289869 (remainingBits!0 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289453))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289453)))))))

(declare-fun lt!289871 () (_ BitVec 64))

(declare-fun lt!289872 () (_ BitVec 64))

(assert (=> d!64639 (= lt!289868 (bvmul lt!289871 lt!289872))))

(assert (=> d!64639 (or (= lt!289871 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!289872 (bvsdiv (bvmul lt!289871 lt!289872) lt!289871)))))

(assert (=> d!64639 (= lt!289872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64639 (= lt!289871 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))))))

(assert (=> d!64639 (= lt!289870 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289453))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289453)))))))

(assert (=> d!64639 (invariant!0 (currentBit!9055 (_2!8735 lt!289453)) (currentByte!9060 (_2!8735 lt!289453)) (size!4338 (buf!4804 (_2!8735 lt!289453))))))

(assert (=> d!64639 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289453))) (currentByte!9060 (_2!8735 lt!289453)) (currentBit!9055 (_2!8735 lt!289453))) lt!289870)))

(declare-fun b!187261 () Bool)

(declare-fun res!155958 () Bool)

(assert (=> b!187261 (=> (not res!155958) (not e!129493))))

(assert (=> b!187261 (= res!155958 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!289870))))

(declare-fun b!187262 () Bool)

(declare-fun lt!289873 () (_ BitVec 64))

(assert (=> b!187262 (= e!129493 (bvsle lt!289870 (bvmul lt!289873 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187262 (or (= lt!289873 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!289873 #b0000000000000000000000000000000000000000000000000000000000001000) lt!289873)))))

(assert (=> b!187262 (= lt!289873 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289453)))))))

(assert (= (and d!64639 res!155957) b!187261))

(assert (= (and b!187261 res!155958) b!187262))

(declare-fun m!291233 () Bool)

(assert (=> d!64639 m!291233))

(assert (=> d!64639 m!290913))

(assert (=> b!187095 d!64639))

(declare-fun d!64641 () Bool)

(declare-fun res!155959 () Bool)

(declare-fun e!129494 () Bool)

(assert (=> d!64641 (=> (not res!155959) (not e!129494))))

(assert (=> d!64641 (= res!155959 (= (size!4338 (buf!4804 thiss!1204)) (size!4338 (buf!4804 (_2!8735 lt!289453)))))))

(assert (=> d!64641 (= (isPrefixOf!0 thiss!1204 (_2!8735 lt!289453)) e!129494)))

(declare-fun b!187263 () Bool)

(declare-fun res!155961 () Bool)

(assert (=> b!187263 (=> (not res!155961) (not e!129494))))

(assert (=> b!187263 (= res!155961 (bvsle (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204)) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289453))) (currentByte!9060 (_2!8735 lt!289453)) (currentBit!9055 (_2!8735 lt!289453)))))))

(declare-fun b!187264 () Bool)

(declare-fun e!129495 () Bool)

(assert (=> b!187264 (= e!129494 e!129495)))

(declare-fun res!155960 () Bool)

(assert (=> b!187264 (=> res!155960 e!129495)))

(assert (=> b!187264 (= res!155960 (= (size!4338 (buf!4804 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187265 () Bool)

(assert (=> b!187265 (= e!129495 (arrayBitRangesEq!0 (buf!4804 thiss!1204) (buf!4804 (_2!8735 lt!289453)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4338 (buf!4804 thiss!1204)) (currentByte!9060 thiss!1204) (currentBit!9055 thiss!1204))))))

(assert (= (and d!64641 res!155959) b!187263))

(assert (= (and b!187263 res!155961) b!187264))

(assert (= (and b!187264 (not res!155960)) b!187265))

(assert (=> b!187263 m!290861))

(assert (=> b!187263 m!290921))

(assert (=> b!187265 m!290861))

(assert (=> b!187265 m!290861))

(declare-fun m!291235 () Bool)

(assert (=> b!187265 m!291235))

(assert (=> b!187095 d!64641))

(declare-fun d!64643 () Bool)

(assert (=> d!64643 (isPrefixOf!0 thiss!1204 (_2!8735 lt!289453))))

(declare-fun lt!289876 () Unit!13371)

(declare-fun choose!30 (BitStream!7784 BitStream!7784 BitStream!7784) Unit!13371)

(assert (=> d!64643 (= lt!289876 (choose!30 thiss!1204 (_2!8735 lt!289452) (_2!8735 lt!289453)))))

(assert (=> d!64643 (isPrefixOf!0 thiss!1204 (_2!8735 lt!289452))))

(assert (=> d!64643 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8735 lt!289452) (_2!8735 lt!289453)) lt!289876)))

(declare-fun bs!16076 () Bool)

(assert (= bs!16076 d!64643))

(assert (=> bs!16076 m!290923))

(declare-fun m!291237 () Bool)

(assert (=> bs!16076 m!291237))

(assert (=> bs!16076 m!290849))

(assert (=> b!187095 d!64643))

(declare-fun b!187346 () Bool)

(declare-fun e!129541 () tuple2!16180)

(declare-fun lt!290179 () tuple2!16180)

(assert (=> b!187346 (= e!129541 (tuple2!16181 (_1!8735 lt!290179) (_2!8735 lt!290179)))))

(declare-fun lt!290178 () Bool)

(assert (=> b!187346 (= lt!290178 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!290182 () tuple2!16180)

(assert (=> b!187346 (= lt!290182 (appendBit!0 (_2!8735 lt!289452) lt!290178))))

(declare-fun res!156026 () Bool)

(assert (=> b!187346 (= res!156026 (= (size!4338 (buf!4804 (_2!8735 lt!289452))) (size!4338 (buf!4804 (_2!8735 lt!290182)))))))

(declare-fun e!129545 () Bool)

(assert (=> b!187346 (=> (not res!156026) (not e!129545))))

(assert (=> b!187346 e!129545))

(declare-fun lt!290168 () tuple2!16180)

(assert (=> b!187346 (= lt!290168 lt!290182)))

(assert (=> b!187346 (= lt!290179 (appendBitsLSBFirstLoopTR!0 (_2!8735 lt!290168) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!290163 () Unit!13371)

(assert (=> b!187346 (= lt!290163 (lemmaIsPrefixTransitive!0 (_2!8735 lt!289452) (_2!8735 lt!290168) (_2!8735 lt!290179)))))

(declare-fun call!3011 () Bool)

(assert (=> b!187346 call!3011))

(declare-fun lt!290200 () Unit!13371)

(assert (=> b!187346 (= lt!290200 lt!290163)))

(assert (=> b!187346 (invariant!0 (currentBit!9055 (_2!8735 lt!289452)) (currentByte!9060 (_2!8735 lt!289452)) (size!4338 (buf!4804 (_2!8735 lt!290168))))))

(declare-fun lt!290195 () BitStream!7784)

(assert (=> b!187346 (= lt!290195 (BitStream!7785 (buf!4804 (_2!8735 lt!290168)) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(assert (=> b!187346 (invariant!0 (currentBit!9055 lt!290195) (currentByte!9060 lt!290195) (size!4338 (buf!4804 (_2!8735 lt!290179))))))

(declare-fun lt!290172 () BitStream!7784)

(assert (=> b!187346 (= lt!290172 (BitStream!7785 (buf!4804 (_2!8735 lt!290179)) (currentByte!9060 lt!290195) (currentBit!9055 lt!290195)))))

(declare-fun lt!290159 () tuple2!16182)

(assert (=> b!187346 (= lt!290159 (readBitPure!0 lt!290195))))

(declare-fun lt!290171 () tuple2!16182)

(assert (=> b!187346 (= lt!290171 (readBitPure!0 lt!290172))))

(declare-fun lt!290169 () Unit!13371)

(assert (=> b!187346 (= lt!290169 (readBitPrefixLemma!0 lt!290195 (_2!8735 lt!290179)))))

(declare-fun res!156022 () Bool)

(assert (=> b!187346 (= res!156022 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!290159))) (currentByte!9060 (_1!8736 lt!290159)) (currentBit!9055 (_1!8736 lt!290159))) (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!290171))) (currentByte!9060 (_1!8736 lt!290171)) (currentBit!9055 (_1!8736 lt!290171)))))))

(declare-fun e!129543 () Bool)

(assert (=> b!187346 (=> (not res!156022) (not e!129543))))

(assert (=> b!187346 e!129543))

(declare-fun lt!290199 () Unit!13371)

(assert (=> b!187346 (= lt!290199 lt!290169)))

(declare-fun lt!290203 () tuple2!16184)

(assert (=> b!187346 (= lt!290203 (reader!0 (_2!8735 lt!289452) (_2!8735 lt!290179)))))

(declare-fun lt!290188 () tuple2!16184)

(assert (=> b!187346 (= lt!290188 (reader!0 (_2!8735 lt!290168) (_2!8735 lt!290179)))))

(declare-fun lt!290193 () tuple2!16182)

(assert (=> b!187346 (= lt!290193 (readBitPure!0 (_1!8737 lt!290203)))))

(assert (=> b!187346 (= (_2!8736 lt!290193) lt!290178)))

(declare-fun lt!290198 () Unit!13371)

(declare-fun Unit!13388 () Unit!13371)

(assert (=> b!187346 (= lt!290198 Unit!13388)))

(declare-fun lt!290190 () (_ BitVec 64))

(assert (=> b!187346 (= lt!290190 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290197 () (_ BitVec 64))

(assert (=> b!187346 (= lt!290197 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290170 () Unit!13371)

(assert (=> b!187346 (= lt!290170 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8735 lt!289452) (buf!4804 (_2!8735 lt!290179)) lt!290197))))

(assert (=> b!187346 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!290179)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!290197)))

(declare-fun lt!290202 () Unit!13371)

(assert (=> b!187346 (= lt!290202 lt!290170)))

(declare-fun lt!290201 () tuple2!16186)

(assert (=> b!187346 (= lt!290201 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!290203) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290190))))

(declare-fun lt!290206 () (_ BitVec 64))

(assert (=> b!187346 (= lt!290206 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!290175 () Unit!13371)

(assert (=> b!187346 (= lt!290175 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8735 lt!290168) (buf!4804 (_2!8735 lt!290179)) lt!290206))))

(assert (=> b!187346 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!290179)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!290168))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!290168))) lt!290206)))

(declare-fun lt!290166 () Unit!13371)

(assert (=> b!187346 (= lt!290166 lt!290175)))

(declare-fun lt!290185 () tuple2!16186)

(assert (=> b!187346 (= lt!290185 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!290188) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!290190 (ite (_2!8736 lt!290193) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!290208 () tuple2!16186)

(assert (=> b!187346 (= lt!290208 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!290203) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290190))))

(declare-fun c!9556 () Bool)

(assert (=> b!187346 (= c!9556 (_2!8736 (readBitPure!0 (_1!8737 lt!290203))))))

(declare-fun e!129547 () (_ BitVec 64))

(declare-fun lt!290204 () tuple2!16186)

(assert (=> b!187346 (= lt!290204 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8737 lt!290203) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!290190 e!129547)))))

(declare-fun lt!290176 () Unit!13371)

(assert (=> b!187346 (= lt!290176 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8737 lt!290203) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290190))))

(assert (=> b!187346 (and (= (_2!8738 lt!290208) (_2!8738 lt!290204)) (= (_1!8738 lt!290208) (_1!8738 lt!290204)))))

(declare-fun lt!290187 () Unit!13371)

(assert (=> b!187346 (= lt!290187 lt!290176)))

(assert (=> b!187346 (= (_1!8737 lt!290203) (withMovedBitIndex!0 (_2!8737 lt!290203) (bvsub (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290179))) (currentByte!9060 (_2!8735 lt!290179)) (currentBit!9055 (_2!8735 lt!290179))))))))

(declare-fun lt!290174 () Unit!13371)

(declare-fun Unit!13389 () Unit!13371)

(assert (=> b!187346 (= lt!290174 Unit!13389)))

(assert (=> b!187346 (= (_1!8737 lt!290188) (withMovedBitIndex!0 (_2!8737 lt!290188) (bvsub (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290168))) (currentByte!9060 (_2!8735 lt!290168)) (currentBit!9055 (_2!8735 lt!290168))) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290179))) (currentByte!9060 (_2!8735 lt!290179)) (currentBit!9055 (_2!8735 lt!290179))))))))

(declare-fun lt!290196 () Unit!13371)

(declare-fun Unit!13390 () Unit!13371)

(assert (=> b!187346 (= lt!290196 Unit!13390)))

(assert (=> b!187346 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))) (bvsub (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290168))) (currentByte!9060 (_2!8735 lt!290168)) (currentBit!9055 (_2!8735 lt!290168))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!290167 () Unit!13371)

(declare-fun Unit!13391 () Unit!13371)

(assert (=> b!187346 (= lt!290167 Unit!13391)))

(assert (=> b!187346 (= (_2!8738 lt!290201) (_2!8738 lt!290185))))

(declare-fun lt!290173 () Unit!13371)

(declare-fun Unit!13392 () Unit!13371)

(assert (=> b!187346 (= lt!290173 Unit!13392)))

(assert (=> b!187346 (invariant!0 (currentBit!9055 (_2!8735 lt!290179)) (currentByte!9060 (_2!8735 lt!290179)) (size!4338 (buf!4804 (_2!8735 lt!290179))))))

(declare-fun lt!290161 () Unit!13371)

(declare-fun Unit!13393 () Unit!13371)

(assert (=> b!187346 (= lt!290161 Unit!13393)))

(assert (=> b!187346 (= (size!4338 (buf!4804 (_2!8735 lt!289452))) (size!4338 (buf!4804 (_2!8735 lt!290179))))))

(declare-fun lt!290164 () Unit!13371)

(declare-fun Unit!13394 () Unit!13371)

(assert (=> b!187346 (= lt!290164 Unit!13394)))

(assert (=> b!187346 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290179))) (currentByte!9060 (_2!8735 lt!290179)) (currentBit!9055 (_2!8735 lt!290179))) (bvsub (bvadd (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290191 () Unit!13371)

(declare-fun Unit!13395 () Unit!13371)

(assert (=> b!187346 (= lt!290191 Unit!13395)))

(declare-fun lt!290157 () Unit!13371)

(declare-fun Unit!13396 () Unit!13371)

(assert (=> b!187346 (= lt!290157 Unit!13396)))

(declare-fun lt!290186 () tuple2!16184)

(assert (=> b!187346 (= lt!290186 (reader!0 (_2!8735 lt!289452) (_2!8735 lt!290179)))))

(declare-fun lt!290160 () (_ BitVec 64))

(assert (=> b!187346 (= lt!290160 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!290184 () Unit!13371)

(assert (=> b!187346 (= lt!290184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8735 lt!289452) (buf!4804 (_2!8735 lt!290179)) lt!290160))))

(assert (=> b!187346 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!290179)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!290160)))

(declare-fun lt!290183 () Unit!13371)

(assert (=> b!187346 (= lt!290183 lt!290184)))

(declare-fun lt!290211 () tuple2!16186)

(assert (=> b!187346 (= lt!290211 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!290186) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156032 () Bool)

(assert (=> b!187346 (= res!156032 (= (_2!8738 lt!290211) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!129542 () Bool)

(assert (=> b!187346 (=> (not res!156032) (not e!129542))))

(assert (=> b!187346 e!129542))

(declare-fun lt!290180 () Unit!13371)

(declare-fun Unit!13397 () Unit!13371)

(assert (=> b!187346 (= lt!290180 Unit!13397)))

(declare-fun b!187347 () Bool)

(declare-fun Unit!13398 () Unit!13371)

(assert (=> b!187347 (= e!129541 (tuple2!16181 Unit!13398 (_2!8735 lt!289452)))))

(declare-fun lt!290158 () Unit!13371)

(assert (=> b!187347 (= lt!290158 (lemmaIsPrefixRefl!0 (_2!8735 lt!289452)))))

(assert (=> b!187347 call!3011))

(declare-fun lt!290162 () Unit!13371)

(assert (=> b!187347 (= lt!290162 lt!290158)))

(declare-fun b!187348 () Bool)

(declare-fun e!129546 () Bool)

(declare-fun lt!290194 () tuple2!16186)

(declare-fun lt!290212 () tuple2!16184)

(assert (=> b!187348 (= e!129546 (= (_1!8738 lt!290194) (_2!8737 lt!290212)))))

(declare-fun b!187349 () Bool)

(declare-fun lt!290207 () tuple2!16182)

(assert (=> b!187349 (= lt!290207 (readBitPure!0 (readerFrom!0 (_2!8735 lt!290182) (currentBit!9055 (_2!8735 lt!289452)) (currentByte!9060 (_2!8735 lt!289452)))))))

(declare-fun res!156028 () Bool)

(assert (=> b!187349 (= res!156028 (and (= (_2!8736 lt!290207) lt!290178) (= (_1!8736 lt!290207) (_2!8735 lt!290182))))))

(declare-fun e!129549 () Bool)

(assert (=> b!187349 (=> (not res!156028) (not e!129549))))

(assert (=> b!187349 (= e!129545 e!129549)))

(declare-fun b!187351 () Bool)

(declare-fun res!156027 () Bool)

(assert (=> b!187351 (= res!156027 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290182))) (currentByte!9060 (_2!8735 lt!290182)) (currentBit!9055 (_2!8735 lt!290182))) (bvadd (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!187351 (=> (not res!156027) (not e!129545))))

(declare-fun b!187352 () Bool)

(declare-fun res!156023 () Bool)

(declare-fun e!129544 () Bool)

(assert (=> b!187352 (=> (not res!156023) (not e!129544))))

(declare-fun lt!290205 () (_ BitVec 64))

(declare-fun lt!290210 () tuple2!16180)

(declare-fun lt!290209 () (_ BitVec 64))

(assert (=> b!187352 (= res!156023 (= (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290210))) (currentByte!9060 (_2!8735 lt!290210)) (currentBit!9055 (_2!8735 lt!290210))) (bvsub lt!290209 lt!290205)))))

(assert (=> b!187352 (or (= (bvand lt!290209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290209 lt!290205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187352 (= lt!290205 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!290192 () (_ BitVec 64))

(declare-fun lt!290165 () (_ BitVec 64))

(assert (=> b!187352 (= lt!290209 (bvadd lt!290192 lt!290165))))

(assert (=> b!187352 (or (not (= (bvand lt!290192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290192 lt!290165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187352 (= lt!290165 ((_ sign_extend 32) nBits!348))))

(assert (=> b!187352 (= lt!290192 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))))))

(declare-fun c!9555 () Bool)

(declare-fun bm!3008 () Bool)

(assert (=> bm!3008 (= call!3011 (isPrefixOf!0 (_2!8735 lt!289452) (ite c!9555 (_2!8735 lt!289452) (_2!8735 lt!290179))))))

(declare-fun b!187353 () Bool)

(assert (=> b!187353 (= e!129547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!187354 () Bool)

(assert (=> b!187354 (= e!129544 e!129546)))

(declare-fun res!156030 () Bool)

(assert (=> b!187354 (=> (not res!156030) (not e!129546))))

(assert (=> b!187354 (= res!156030 (= (_2!8738 lt!290194) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!187354 (= lt!290194 (readNBitsLSBFirstsLoopPure!0 (_1!8737 lt!290212) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!290177 () Unit!13371)

(declare-fun lt!290189 () Unit!13371)

(assert (=> b!187354 (= lt!290177 lt!290189)))

(declare-fun lt!290181 () (_ BitVec 64))

(assert (=> b!187354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!290210)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!290181)))

(assert (=> b!187354 (= lt!290189 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8735 lt!289452) (buf!4804 (_2!8735 lt!290210)) lt!290181))))

(declare-fun e!129548 () Bool)

(assert (=> b!187354 e!129548))

(declare-fun res!156033 () Bool)

(assert (=> b!187354 (=> (not res!156033) (not e!129548))))

(assert (=> b!187354 (= res!156033 (and (= (size!4338 (buf!4804 (_2!8735 lt!289452))) (size!4338 (buf!4804 (_2!8735 lt!290210)))) (bvsge lt!290181 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187354 (= lt!290181 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!187354 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!187354 (= lt!290212 (reader!0 (_2!8735 lt!289452) (_2!8735 lt!290210)))))

(declare-fun b!187355 () Bool)

(assert (=> b!187355 (= e!129542 (= (_1!8738 lt!290211) (_2!8737 lt!290186)))))

(declare-fun b!187356 () Bool)

(declare-fun res!156024 () Bool)

(assert (=> b!187356 (= res!156024 (isPrefixOf!0 (_2!8735 lt!289452) (_2!8735 lt!290182)))))

(assert (=> b!187356 (=> (not res!156024) (not e!129545))))

(declare-fun b!187357 () Bool)

(assert (=> b!187357 (= e!129547 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!187358 () Bool)

(declare-fun res!156029 () Bool)

(assert (=> b!187358 (=> (not res!156029) (not e!129544))))

(assert (=> b!187358 (= res!156029 (= (size!4338 (buf!4804 (_2!8735 lt!289452))) (size!4338 (buf!4804 (_2!8735 lt!290210)))))))

(declare-fun b!187359 () Bool)

(assert (=> b!187359 (= e!129549 (= (bitIndex!0 (size!4338 (buf!4804 (_1!8736 lt!290207))) (currentByte!9060 (_1!8736 lt!290207)) (currentBit!9055 (_1!8736 lt!290207))) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!290182))) (currentByte!9060 (_2!8735 lt!290182)) (currentBit!9055 (_2!8735 lt!290182)))))))

(declare-fun d!64645 () Bool)

(assert (=> d!64645 e!129544))

(declare-fun res!156031 () Bool)

(assert (=> d!64645 (=> (not res!156031) (not e!129544))))

(assert (=> d!64645 (= res!156031 (invariant!0 (currentBit!9055 (_2!8735 lt!290210)) (currentByte!9060 (_2!8735 lt!290210)) (size!4338 (buf!4804 (_2!8735 lt!290210)))))))

(assert (=> d!64645 (= lt!290210 e!129541)))

(assert (=> d!64645 (= c!9555 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64645 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64645 (= (appendBitsLSBFirstLoopTR!0 (_2!8735 lt!289452) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!290210)))

(declare-fun b!187350 () Bool)

(assert (=> b!187350 (= e!129543 (= (_2!8736 lt!290159) (_2!8736 lt!290171)))))

(declare-fun b!187360 () Bool)

(declare-fun res!156025 () Bool)

(assert (=> b!187360 (=> (not res!156025) (not e!129544))))

(assert (=> b!187360 (= res!156025 (isPrefixOf!0 (_2!8735 lt!289452) (_2!8735 lt!290210)))))

(declare-fun b!187361 () Bool)

(assert (=> b!187361 (= e!129548 (validate_offset_bits!1 ((_ sign_extend 32) (size!4338 (buf!4804 (_2!8735 lt!289452)))) ((_ sign_extend 32) (currentByte!9060 (_2!8735 lt!289452))) ((_ sign_extend 32) (currentBit!9055 (_2!8735 lt!289452))) lt!290181))))

(assert (= (and d!64645 c!9555) b!187347))

(assert (= (and d!64645 (not c!9555)) b!187346))

(assert (= (and b!187346 res!156026) b!187351))

(assert (= (and b!187351 res!156027) b!187356))

(assert (= (and b!187356 res!156024) b!187349))

(assert (= (and b!187349 res!156028) b!187359))

(assert (= (and b!187346 res!156022) b!187350))

(assert (= (and b!187346 c!9556) b!187357))

(assert (= (and b!187346 (not c!9556)) b!187353))

(assert (= (and b!187346 res!156032) b!187355))

(assert (= (or b!187347 b!187346) bm!3008))

(assert (= (and d!64645 res!156031) b!187358))

(assert (= (and b!187358 res!156029) b!187352))

(assert (= (and b!187352 res!156023) b!187360))

(assert (= (and b!187360 res!156025) b!187354))

(assert (= (and b!187354 res!156033) b!187361))

(assert (= (and b!187354 res!156030) b!187348))

(declare-fun m!291331 () Bool)

(assert (=> d!64645 m!291331))

(declare-fun m!291333 () Bool)

(assert (=> b!187346 m!291333))

(declare-fun m!291335 () Bool)

(assert (=> b!187346 m!291335))

(declare-fun m!291337 () Bool)

(assert (=> b!187346 m!291337))

(declare-fun m!291339 () Bool)

(assert (=> b!187346 m!291339))

(declare-fun m!291341 () Bool)

(assert (=> b!187346 m!291341))

(declare-fun m!291343 () Bool)

(assert (=> b!187346 m!291343))

(assert (=> b!187346 m!290859))

(declare-fun m!291345 () Bool)

(assert (=> b!187346 m!291345))

(declare-fun m!291347 () Bool)

(assert (=> b!187346 m!291347))

(declare-fun m!291349 () Bool)

(assert (=> b!187346 m!291349))

(declare-fun m!291351 () Bool)

(assert (=> b!187346 m!291351))

(declare-fun m!291353 () Bool)

(assert (=> b!187346 m!291353))

(declare-fun m!291355 () Bool)

(assert (=> b!187346 m!291355))

(declare-fun m!291357 () Bool)

(assert (=> b!187346 m!291357))

(declare-fun m!291359 () Bool)

(assert (=> b!187346 m!291359))

(declare-fun m!291361 () Bool)

(assert (=> b!187346 m!291361))

(declare-fun m!291363 () Bool)

(assert (=> b!187346 m!291363))

(declare-fun m!291365 () Bool)

(assert (=> b!187346 m!291365))

(declare-fun m!291367 () Bool)

(assert (=> b!187346 m!291367))

(declare-fun m!291369 () Bool)

(assert (=> b!187346 m!291369))

(declare-fun m!291371 () Bool)

(assert (=> b!187346 m!291371))

(declare-fun m!291373 () Bool)

(assert (=> b!187346 m!291373))

(declare-fun m!291375 () Bool)

(assert (=> b!187346 m!291375))

(declare-fun m!291377 () Bool)

(assert (=> b!187346 m!291377))

(declare-fun m!291379 () Bool)

(assert (=> b!187346 m!291379))

(declare-fun m!291381 () Bool)

(assert (=> b!187346 m!291381))

(declare-fun m!291383 () Bool)

(assert (=> b!187346 m!291383))

(declare-fun m!291385 () Bool)

(assert (=> b!187346 m!291385))

(declare-fun m!291387 () Bool)

(assert (=> b!187346 m!291387))

(declare-fun m!291389 () Bool)

(assert (=> b!187346 m!291389))

(assert (=> b!187346 m!291385))

(declare-fun m!291391 () Bool)

(assert (=> b!187346 m!291391))

(declare-fun m!291393 () Bool)

(assert (=> b!187346 m!291393))

(declare-fun m!291395 () Bool)

(assert (=> b!187346 m!291395))

(declare-fun m!291397 () Bool)

(assert (=> b!187359 m!291397))

(declare-fun m!291399 () Bool)

(assert (=> b!187359 m!291399))

(declare-fun m!291401 () Bool)

(assert (=> b!187349 m!291401))

(assert (=> b!187349 m!291401))

(declare-fun m!291403 () Bool)

(assert (=> b!187349 m!291403))

(declare-fun m!291405 () Bool)

(assert (=> b!187352 m!291405))

(assert (=> b!187352 m!290859))

(declare-fun m!291407 () Bool)

(assert (=> b!187360 m!291407))

(declare-fun m!291409 () Bool)

(assert (=> b!187356 m!291409))

(assert (=> b!187347 m!291187))

(declare-fun m!291411 () Bool)

(assert (=> b!187361 m!291411))

(assert (=> b!187351 m!291399))

(assert (=> b!187351 m!290859))

(declare-fun m!291413 () Bool)

(assert (=> bm!3008 m!291413))

(assert (=> b!187354 m!291357))

(declare-fun m!291415 () Bool)

(assert (=> b!187354 m!291415))

(declare-fun m!291417 () Bool)

(assert (=> b!187354 m!291417))

(declare-fun m!291419 () Bool)

(assert (=> b!187354 m!291419))

(declare-fun m!291421 () Bool)

(assert (=> b!187354 m!291421))

(assert (=> b!187354 m!291353))

(assert (=> b!187095 d!64645))

(declare-fun d!64647 () Bool)

(assert (=> d!64647 (= (invariant!0 (currentBit!9055 (_2!8735 lt!289453)) (currentByte!9060 (_2!8735 lt!289453)) (size!4338 (buf!4804 (_2!8735 lt!289453)))) (and (bvsge (currentBit!9055 (_2!8735 lt!289453)) #b00000000000000000000000000000000) (bvslt (currentBit!9055 (_2!8735 lt!289453)) #b00000000000000000000000000001000) (bvsge (currentByte!9060 (_2!8735 lt!289453)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9060 (_2!8735 lt!289453)) (size!4338 (buf!4804 (_2!8735 lt!289453)))) (and (= (currentBit!9055 (_2!8735 lt!289453)) #b00000000000000000000000000000000) (= (currentByte!9060 (_2!8735 lt!289453)) (size!4338 (buf!4804 (_2!8735 lt!289453))))))))))

(assert (=> b!187105 d!64647))

(assert (=> b!187107 d!64633))

(declare-fun d!64649 () Bool)

(declare-fun res!156034 () Bool)

(declare-fun e!129550 () Bool)

(assert (=> d!64649 (=> (not res!156034) (not e!129550))))

(assert (=> d!64649 (= res!156034 (= (size!4338 (buf!4804 (_2!8735 lt!289452))) (size!4338 (buf!4804 (_2!8735 lt!289453)))))))

(assert (=> d!64649 (= (isPrefixOf!0 (_2!8735 lt!289452) (_2!8735 lt!289453)) e!129550)))

(declare-fun b!187362 () Bool)

(declare-fun res!156036 () Bool)

(assert (=> b!187362 (=> (not res!156036) (not e!129550))))

(assert (=> b!187362 (= res!156036 (bvsle (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452))) (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289453))) (currentByte!9060 (_2!8735 lt!289453)) (currentBit!9055 (_2!8735 lt!289453)))))))

(declare-fun b!187363 () Bool)

(declare-fun e!129551 () Bool)

(assert (=> b!187363 (= e!129550 e!129551)))

(declare-fun res!156035 () Bool)

(assert (=> b!187363 (=> res!156035 e!129551)))

(assert (=> b!187363 (= res!156035 (= (size!4338 (buf!4804 (_2!8735 lt!289452))) #b00000000000000000000000000000000))))

(declare-fun b!187364 () Bool)

(assert (=> b!187364 (= e!129551 (arrayBitRangesEq!0 (buf!4804 (_2!8735 lt!289452)) (buf!4804 (_2!8735 lt!289453)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4338 (buf!4804 (_2!8735 lt!289452))) (currentByte!9060 (_2!8735 lt!289452)) (currentBit!9055 (_2!8735 lt!289452)))))))

(assert (= (and d!64649 res!156034) b!187362))

(assert (= (and b!187362 res!156036) b!187363))

(assert (= (and b!187363 (not res!156035)) b!187364))

(assert (=> b!187362 m!290859))

(assert (=> b!187362 m!290921))

(assert (=> b!187364 m!290859))

(assert (=> b!187364 m!290859))

(declare-fun m!291423 () Bool)

(assert (=> b!187364 m!291423))

(assert (=> b!187096 d!64649))

(push 1)

