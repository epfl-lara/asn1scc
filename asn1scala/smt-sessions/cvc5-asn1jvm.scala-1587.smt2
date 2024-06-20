; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45276 () Bool)

(assert start!45276)

(declare-fun b!218667 () Bool)

(declare-fun res!184093 () Bool)

(declare-fun e!148556 () Bool)

(assert (=> b!218667 (=> (not res!184093) (not e!148556))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!218667 (= res!184093 (not (= i!590 nBits!348)))))

(declare-fun b!218668 () Bool)

(declare-fun res!184099 () Bool)

(declare-fun e!148563 () Bool)

(assert (=> b!218668 (=> res!184099 e!148563)))

(declare-datatypes ((array!10640 0))(
  ( (array!10641 (arr!5602 (Array (_ BitVec 32) (_ BitVec 8))) (size!4672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8452 0))(
  ( (BitStream!8453 (buf!5219 array!10640) (currentByte!9818 (_ BitVec 32)) (currentBit!9813 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18638 0))(
  ( (tuple2!18639 (_1!9977 BitStream!8452) (_2!9977 (_ BitVec 64))) )
))
(declare-fun lt!346381 () tuple2!18638)

(declare-datatypes ((tuple2!18640 0))(
  ( (tuple2!18641 (_1!9978 BitStream!8452) (_2!9978 BitStream!8452)) )
))
(declare-fun lt!346398 () tuple2!18640)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218668 (= res!184099 (not (= (bitIndex!0 (size!4672 (buf!5219 (_1!9977 lt!346381))) (currentByte!9818 (_1!9977 lt!346381)) (currentBit!9813 (_1!9977 lt!346381))) (bitIndex!0 (size!4672 (buf!5219 (_2!9978 lt!346398))) (currentByte!9818 (_2!9978 lt!346398)) (currentBit!9813 (_2!9978 lt!346398))))))))

(declare-fun b!218669 () Bool)

(declare-fun e!148560 () Bool)

(declare-fun e!148562 () Bool)

(assert (=> b!218669 (= e!148560 e!148562)))

(declare-fun res!184096 () Bool)

(assert (=> b!218669 (=> res!184096 e!148562)))

(declare-fun lt!346390 () (_ BitVec 64))

(declare-fun lt!346404 () (_ BitVec 64))

(assert (=> b!218669 (= res!184096 (not (= lt!346390 (bvsub (bvsub (bvadd lt!346404 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!15541 0))(
  ( (Unit!15542) )
))
(declare-datatypes ((tuple2!18642 0))(
  ( (tuple2!18643 (_1!9979 Unit!15541) (_2!9979 BitStream!8452)) )
))
(declare-fun lt!346401 () tuple2!18642)

(assert (=> b!218669 (= lt!346390 (bitIndex!0 (size!4672 (buf!5219 (_2!9979 lt!346401))) (currentByte!9818 (_2!9979 lt!346401)) (currentBit!9813 (_2!9979 lt!346401))))))

(declare-fun thiss!1204 () BitStream!8452)

(declare-fun isPrefixOf!0 (BitStream!8452 BitStream!8452) Bool)

(assert (=> b!218669 (isPrefixOf!0 thiss!1204 (_2!9979 lt!346401))))

(declare-fun lt!346382 () tuple2!18642)

(declare-fun lt!346392 () Unit!15541)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8452 BitStream!8452 BitStream!8452) Unit!15541)

(assert (=> b!218669 (= lt!346392 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9979 lt!346382) (_2!9979 lt!346401)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18642)

(assert (=> b!218669 (= lt!346401 (appendBitsLSBFirstLoopTR!0 (_2!9979 lt!346382) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!218670 () Bool)

(declare-fun res!184107 () Bool)

(assert (=> b!218670 (=> (not res!184107) (not e!148556))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218670 (= res!184107 (invariant!0 (currentBit!9813 thiss!1204) (currentByte!9818 thiss!1204) (size!4672 (buf!5219 thiss!1204))))))

(declare-fun b!218671 () Bool)

(assert (=> b!218671 (= e!148556 (not e!148560))))

(declare-fun res!184100 () Bool)

(assert (=> b!218671 (=> res!184100 e!148560)))

(declare-fun lt!346396 () (_ BitVec 64))

(assert (=> b!218671 (= res!184100 (not (= lt!346404 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346396))))))

(assert (=> b!218671 (= lt!346404 (bitIndex!0 (size!4672 (buf!5219 (_2!9979 lt!346382))) (currentByte!9818 (_2!9979 lt!346382)) (currentBit!9813 (_2!9979 lt!346382))))))

(assert (=> b!218671 (= lt!346396 (bitIndex!0 (size!4672 (buf!5219 thiss!1204)) (currentByte!9818 thiss!1204) (currentBit!9813 thiss!1204)))))

(declare-fun e!148557 () Bool)

(assert (=> b!218671 e!148557))

(declare-fun res!184097 () Bool)

(assert (=> b!218671 (=> (not res!184097) (not e!148557))))

(assert (=> b!218671 (= res!184097 (= (size!4672 (buf!5219 thiss!1204)) (size!4672 (buf!5219 (_2!9979 lt!346382)))))))

(declare-fun lt!346395 () Bool)

(declare-fun appendBit!0 (BitStream!8452 Bool) tuple2!18642)

(assert (=> b!218671 (= lt!346382 (appendBit!0 thiss!1204 lt!346395))))

(declare-fun lt!346405 () (_ BitVec 64))

(assert (=> b!218671 (= lt!346395 (not (= (bvand v!189 lt!346405) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218671 (= lt!346405 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!218672 () Bool)

(declare-fun e!148569 () Bool)

(declare-datatypes ((tuple2!18644 0))(
  ( (tuple2!18645 (_1!9980 BitStream!8452) (_2!9980 Bool)) )
))
(declare-fun lt!346397 () tuple2!18644)

(declare-fun lt!346393 () (_ BitVec 64))

(assert (=> b!218672 (= e!148569 (= (bitIndex!0 (size!4672 (buf!5219 (_1!9980 lt!346397))) (currentByte!9818 (_1!9980 lt!346397)) (currentBit!9813 (_1!9980 lt!346397))) lt!346393))))

(declare-fun b!218673 () Bool)

(declare-fun e!148568 () Bool)

(assert (=> b!218673 (= e!148568 (invariant!0 (currentBit!9813 thiss!1204) (currentByte!9818 thiss!1204) (size!4672 (buf!5219 (_2!9979 lt!346401)))))))

(declare-fun b!218674 () Bool)

(assert (=> b!218674 (= e!148563 true)))

(declare-fun e!148566 () Bool)

(assert (=> b!218674 e!148566))

(declare-fun res!184098 () Bool)

(assert (=> b!218674 (=> (not res!184098) (not e!148566))))

(assert (=> b!218674 (= res!184098 (= (size!4672 (buf!5219 thiss!1204)) (size!4672 (buf!5219 (_2!9979 lt!346401)))))))

(declare-fun b!218675 () Bool)

(declare-fun e!148558 () Bool)

(assert (=> b!218675 (= e!148558 e!148556)))

(declare-fun res!184108 () Bool)

(assert (=> b!218675 (=> (not res!184108) (not e!148556))))

(declare-fun lt!346407 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!218675 (= res!184108 (validate_offset_bits!1 ((_ sign_extend 32) (size!4672 (buf!5219 thiss!1204))) ((_ sign_extend 32) (currentByte!9818 thiss!1204)) ((_ sign_extend 32) (currentBit!9813 thiss!1204)) lt!346407))))

(assert (=> b!218675 (= lt!346407 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!218676 () Bool)

(declare-fun e!148567 () Bool)

(declare-fun lt!346386 () tuple2!18644)

(declare-fun lt!346389 () tuple2!18644)

(assert (=> b!218676 (= e!148567 (= (_2!9980 lt!346386) (_2!9980 lt!346389)))))

(declare-fun lt!346388 () tuple2!18640)

(declare-fun lt!346408 () BitStream!8452)

(declare-fun b!218677 () Bool)

(declare-fun e!148555 () Bool)

(declare-fun lt!346387 () tuple2!18638)

(assert (=> b!218677 (= e!148555 (and (= lt!346396 (bvsub lt!346404 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9978 lt!346388) lt!346408)) (= (_2!9977 lt!346381) (_2!9977 lt!346387)))))))

(declare-fun res!184112 () Bool)

(assert (=> start!45276 (=> (not res!184112) (not e!148558))))

(assert (=> start!45276 (= res!184112 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45276 e!148558))

(assert (=> start!45276 true))

(declare-fun e!148559 () Bool)

(declare-fun inv!12 (BitStream!8452) Bool)

(assert (=> start!45276 (and (inv!12 thiss!1204) e!148559)))

(declare-fun b!218678 () Bool)

(declare-fun res!184106 () Bool)

(assert (=> b!218678 (=> (not res!184106) (not e!148555))))

(declare-fun withMovedBitIndex!0 (BitStream!8452 (_ BitVec 64)) BitStream!8452)

(assert (=> b!218678 (= res!184106 (= (_1!9978 lt!346388) (withMovedBitIndex!0 (_2!9978 lt!346388) (bvsub lt!346404 lt!346390))))))

(declare-fun b!218679 () Bool)

(declare-fun res!184111 () Bool)

(assert (=> b!218679 (=> res!184111 e!148562)))

(assert (=> b!218679 (= res!184111 (or (not (= (size!4672 (buf!5219 (_2!9979 lt!346401))) (size!4672 (buf!5219 thiss!1204)))) (not (= lt!346390 (bvsub (bvadd lt!346396 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!218680 () Bool)

(declare-fun e!148564 () Bool)

(assert (=> b!218680 (= e!148564 e!148563)))

(declare-fun res!184095 () Bool)

(assert (=> b!218680 (=> res!184095 e!148563)))

(assert (=> b!218680 (= res!184095 (not (= (_1!9978 lt!346388) lt!346408)))))

(assert (=> b!218680 e!148555))

(declare-fun res!184102 () Bool)

(assert (=> b!218680 (=> (not res!184102) (not e!148555))))

(declare-fun lt!346403 () tuple2!18638)

(assert (=> b!218680 (= res!184102 (and (= (_2!9977 lt!346381) (_2!9977 lt!346403)) (= (_1!9977 lt!346381) (_1!9977 lt!346403))))))

(declare-fun lt!346385 () (_ BitVec 64))

(declare-fun lt!346406 () Unit!15541)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15541)

(assert (=> b!218680 (= lt!346406 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9978 lt!346398) nBits!348 i!590 lt!346385))))

(declare-fun lt!346394 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18638)

(assert (=> b!218680 (= lt!346403 (readNBitsLSBFirstsLoopPure!0 lt!346408 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346394))))

(assert (=> b!218680 (= lt!346408 (withMovedBitIndex!0 (_1!9978 lt!346398) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!218681 () Bool)

(declare-fun res!184101 () Bool)

(assert (=> b!218681 (=> (not res!184101) (not e!148566))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218681 (= res!184101 (= (_2!9977 lt!346381) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!218682 () Bool)

(declare-fun res!184094 () Bool)

(declare-fun e!148561 () Bool)

(assert (=> b!218682 (=> (not res!184094) (not e!148561))))

(assert (=> b!218682 (= res!184094 (isPrefixOf!0 thiss!1204 (_2!9979 lt!346382)))))

(declare-fun b!218683 () Bool)

(declare-fun res!184103 () Bool)

(assert (=> b!218683 (=> res!184103 e!148562)))

(assert (=> b!218683 (= res!184103 (not (isPrefixOf!0 thiss!1204 (_2!9979 lt!346382))))))

(declare-fun b!218684 () Bool)

(assert (=> b!218684 (= e!148561 e!148569)))

(declare-fun res!184114 () Bool)

(assert (=> b!218684 (=> (not res!184114) (not e!148569))))

(assert (=> b!218684 (= res!184114 (and (= (_2!9980 lt!346397) lt!346395) (= (_1!9980 lt!346397) (_2!9979 lt!346382))))))

(declare-fun readBitPure!0 (BitStream!8452) tuple2!18644)

(declare-fun readerFrom!0 (BitStream!8452 (_ BitVec 32) (_ BitVec 32)) BitStream!8452)

(assert (=> b!218684 (= lt!346397 (readBitPure!0 (readerFrom!0 (_2!9979 lt!346382) (currentBit!9813 thiss!1204) (currentByte!9818 thiss!1204))))))

(declare-fun b!218685 () Bool)

(declare-fun res!184104 () Bool)

(assert (=> b!218685 (=> res!184104 e!148562)))

(assert (=> b!218685 (= res!184104 (not (isPrefixOf!0 (_2!9979 lt!346382) (_2!9979 lt!346401))))))

(declare-fun b!218686 () Bool)

(declare-fun res!184105 () Bool)

(assert (=> b!218686 (=> res!184105 e!148562)))

(assert (=> b!218686 (= res!184105 (not (invariant!0 (currentBit!9813 (_2!9979 lt!346401)) (currentByte!9818 (_2!9979 lt!346401)) (size!4672 (buf!5219 (_2!9979 lt!346401))))))))

(declare-fun b!218687 () Bool)

(assert (=> b!218687 (= e!148562 e!148564)))

(declare-fun res!184113 () Bool)

(assert (=> b!218687 (=> res!184113 e!148564)))

(assert (=> b!218687 (= res!184113 (not (= (_1!9977 lt!346387) (_2!9978 lt!346388))))))

(assert (=> b!218687 (= lt!346387 (readNBitsLSBFirstsLoopPure!0 (_1!9978 lt!346388) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346394))))

(declare-fun lt!346399 () (_ BitVec 64))

(assert (=> b!218687 (validate_offset_bits!1 ((_ sign_extend 32) (size!4672 (buf!5219 (_2!9979 lt!346401)))) ((_ sign_extend 32) (currentByte!9818 (_2!9979 lt!346382))) ((_ sign_extend 32) (currentBit!9813 (_2!9979 lt!346382))) lt!346399)))

(declare-fun lt!346383 () Unit!15541)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8452 array!10640 (_ BitVec 64)) Unit!15541)

(assert (=> b!218687 (= lt!346383 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9979 lt!346382) (buf!5219 (_2!9979 lt!346401)) lt!346399))))

(assert (=> b!218687 (= lt!346399 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!346391 () tuple2!18644)

(assert (=> b!218687 (= lt!346394 (bvor lt!346385 (ite (_2!9980 lt!346391) lt!346405 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218687 (= lt!346381 (readNBitsLSBFirstsLoopPure!0 (_1!9978 lt!346398) nBits!348 i!590 lt!346385))))

(assert (=> b!218687 (validate_offset_bits!1 ((_ sign_extend 32) (size!4672 (buf!5219 (_2!9979 lt!346401)))) ((_ sign_extend 32) (currentByte!9818 thiss!1204)) ((_ sign_extend 32) (currentBit!9813 thiss!1204)) lt!346407)))

(declare-fun lt!346402 () Unit!15541)

(assert (=> b!218687 (= lt!346402 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5219 (_2!9979 lt!346401)) lt!346407))))

(assert (=> b!218687 (= lt!346385 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!218687 (= (_2!9980 lt!346391) lt!346395)))

(assert (=> b!218687 (= lt!346391 (readBitPure!0 (_1!9978 lt!346398)))))

(declare-fun reader!0 (BitStream!8452 BitStream!8452) tuple2!18640)

(assert (=> b!218687 (= lt!346388 (reader!0 (_2!9979 lt!346382) (_2!9979 lt!346401)))))

(assert (=> b!218687 (= lt!346398 (reader!0 thiss!1204 (_2!9979 lt!346401)))))

(assert (=> b!218687 e!148567))

(declare-fun res!184092 () Bool)

(assert (=> b!218687 (=> (not res!184092) (not e!148567))))

(assert (=> b!218687 (= res!184092 (= (bitIndex!0 (size!4672 (buf!5219 (_1!9980 lt!346386))) (currentByte!9818 (_1!9980 lt!346386)) (currentBit!9813 (_1!9980 lt!346386))) (bitIndex!0 (size!4672 (buf!5219 (_1!9980 lt!346389))) (currentByte!9818 (_1!9980 lt!346389)) (currentBit!9813 (_1!9980 lt!346389)))))))

(declare-fun lt!346400 () Unit!15541)

(declare-fun lt!346384 () BitStream!8452)

(declare-fun readBitPrefixLemma!0 (BitStream!8452 BitStream!8452) Unit!15541)

(assert (=> b!218687 (= lt!346400 (readBitPrefixLemma!0 lt!346384 (_2!9979 lt!346401)))))

(assert (=> b!218687 (= lt!346389 (readBitPure!0 (BitStream!8453 (buf!5219 (_2!9979 lt!346401)) (currentByte!9818 thiss!1204) (currentBit!9813 thiss!1204))))))

(assert (=> b!218687 (= lt!346386 (readBitPure!0 lt!346384))))

(assert (=> b!218687 e!148568))

(declare-fun res!184109 () Bool)

(assert (=> b!218687 (=> (not res!184109) (not e!148568))))

(assert (=> b!218687 (= res!184109 (invariant!0 (currentBit!9813 thiss!1204) (currentByte!9818 thiss!1204) (size!4672 (buf!5219 (_2!9979 lt!346382)))))))

(assert (=> b!218687 (= lt!346384 (BitStream!8453 (buf!5219 (_2!9979 lt!346382)) (currentByte!9818 thiss!1204) (currentBit!9813 thiss!1204)))))

(declare-fun b!218688 () Bool)

(declare-fun array_inv!4413 (array!10640) Bool)

(assert (=> b!218688 (= e!148559 (array_inv!4413 (buf!5219 thiss!1204)))))

(declare-fun b!218689 () Bool)

(declare-fun res!184110 () Bool)

(assert (=> b!218689 (=> (not res!184110) (not e!148555))))

(assert (=> b!218689 (= res!184110 (= (_1!9978 lt!346398) (withMovedBitIndex!0 (_2!9978 lt!346398) (bvsub lt!346396 lt!346390))))))

(declare-fun b!218690 () Bool)

(assert (=> b!218690 (= e!148557 e!148561)))

(declare-fun res!184115 () Bool)

(assert (=> b!218690 (=> (not res!184115) (not e!148561))))

(declare-fun lt!346409 () (_ BitVec 64))

(assert (=> b!218690 (= res!184115 (= lt!346393 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346409)))))

(assert (=> b!218690 (= lt!346393 (bitIndex!0 (size!4672 (buf!5219 (_2!9979 lt!346382))) (currentByte!9818 (_2!9979 lt!346382)) (currentBit!9813 (_2!9979 lt!346382))))))

(assert (=> b!218690 (= lt!346409 (bitIndex!0 (size!4672 (buf!5219 thiss!1204)) (currentByte!9818 thiss!1204) (currentBit!9813 thiss!1204)))))

(declare-fun b!218691 () Bool)

(assert (=> b!218691 (= e!148566 (= (_1!9977 lt!346381) (_2!9978 lt!346398)))))

(assert (= (and start!45276 res!184112) b!218675))

(assert (= (and b!218675 res!184108) b!218670))

(assert (= (and b!218670 res!184107) b!218667))

(assert (= (and b!218667 res!184093) b!218671))

(assert (= (and b!218671 res!184097) b!218690))

(assert (= (and b!218690 res!184115) b!218682))

(assert (= (and b!218682 res!184094) b!218684))

(assert (= (and b!218684 res!184114) b!218672))

(assert (= (and b!218671 (not res!184100)) b!218669))

(assert (= (and b!218669 (not res!184096)) b!218686))

(assert (= (and b!218686 (not res!184105)) b!218679))

(assert (= (and b!218679 (not res!184111)) b!218685))

(assert (= (and b!218685 (not res!184104)) b!218683))

(assert (= (and b!218683 (not res!184103)) b!218687))

(assert (= (and b!218687 res!184109) b!218673))

(assert (= (and b!218687 res!184092) b!218676))

(assert (= (and b!218687 (not res!184113)) b!218680))

(assert (= (and b!218680 res!184102) b!218689))

(assert (= (and b!218689 res!184110) b!218678))

(assert (= (and b!218678 res!184106) b!218677))

(assert (= (and b!218680 (not res!184095)) b!218668))

(assert (= (and b!218668 (not res!184099)) b!218674))

(assert (= (and b!218674 res!184098) b!218681))

(assert (= (and b!218681 res!184101) b!218691))

(assert (= start!45276 b!218688))

(declare-fun m!337191 () Bool)

(assert (=> b!218684 m!337191))

(assert (=> b!218684 m!337191))

(declare-fun m!337193 () Bool)

(assert (=> b!218684 m!337193))

(declare-fun m!337195 () Bool)

(assert (=> b!218685 m!337195))

(declare-fun m!337197 () Bool)

(assert (=> b!218681 m!337197))

(declare-fun m!337199 () Bool)

(assert (=> b!218689 m!337199))

(declare-fun m!337201 () Bool)

(assert (=> b!218690 m!337201))

(declare-fun m!337203 () Bool)

(assert (=> b!218690 m!337203))

(declare-fun m!337205 () Bool)

(assert (=> start!45276 m!337205))

(declare-fun m!337207 () Bool)

(assert (=> b!218673 m!337207))

(declare-fun m!337209 () Bool)

(assert (=> b!218680 m!337209))

(declare-fun m!337211 () Bool)

(assert (=> b!218680 m!337211))

(declare-fun m!337213 () Bool)

(assert (=> b!218680 m!337213))

(declare-fun m!337215 () Bool)

(assert (=> b!218686 m!337215))

(declare-fun m!337217 () Bool)

(assert (=> b!218675 m!337217))

(declare-fun m!337219 () Bool)

(assert (=> b!218669 m!337219))

(declare-fun m!337221 () Bool)

(assert (=> b!218669 m!337221))

(declare-fun m!337223 () Bool)

(assert (=> b!218669 m!337223))

(declare-fun m!337225 () Bool)

(assert (=> b!218669 m!337225))

(declare-fun m!337227 () Bool)

(assert (=> b!218687 m!337227))

(declare-fun m!337229 () Bool)

(assert (=> b!218687 m!337229))

(declare-fun m!337231 () Bool)

(assert (=> b!218687 m!337231))

(declare-fun m!337233 () Bool)

(assert (=> b!218687 m!337233))

(declare-fun m!337235 () Bool)

(assert (=> b!218687 m!337235))

(declare-fun m!337237 () Bool)

(assert (=> b!218687 m!337237))

(declare-fun m!337239 () Bool)

(assert (=> b!218687 m!337239))

(declare-fun m!337241 () Bool)

(assert (=> b!218687 m!337241))

(declare-fun m!337243 () Bool)

(assert (=> b!218687 m!337243))

(declare-fun m!337245 () Bool)

(assert (=> b!218687 m!337245))

(declare-fun m!337247 () Bool)

(assert (=> b!218687 m!337247))

(declare-fun m!337249 () Bool)

(assert (=> b!218687 m!337249))

(declare-fun m!337251 () Bool)

(assert (=> b!218687 m!337251))

(declare-fun m!337253 () Bool)

(assert (=> b!218687 m!337253))

(declare-fun m!337255 () Bool)

(assert (=> b!218687 m!337255))

(declare-fun m!337257 () Bool)

(assert (=> b!218687 m!337257))

(declare-fun m!337259 () Bool)

(assert (=> b!218672 m!337259))

(declare-fun m!337261 () Bool)

(assert (=> b!218678 m!337261))

(declare-fun m!337263 () Bool)

(assert (=> b!218682 m!337263))

(declare-fun m!337265 () Bool)

(assert (=> b!218668 m!337265))

(declare-fun m!337267 () Bool)

(assert (=> b!218668 m!337267))

(declare-fun m!337269 () Bool)

(assert (=> b!218670 m!337269))

(assert (=> b!218683 m!337263))

(declare-fun m!337271 () Bool)

(assert (=> b!218688 m!337271))

(assert (=> b!218671 m!337201))

(assert (=> b!218671 m!337203))

(declare-fun m!337273 () Bool)

(assert (=> b!218671 m!337273))

(push 1)

(assert (not b!218690))

(assert (not b!218675))

(assert (not b!218682))

(assert (not b!218678))

(assert (not b!218671))

(assert (not b!218686))

(assert (not b!218685))

(assert (not b!218683))

(assert (not b!218672))

(assert (not b!218687))

(assert (not b!218673))

(assert (not b!218688))

(assert (not b!218689))

(assert (not b!218669))

(assert (not start!45276))

(assert (not b!218684))

(assert (not b!218681))

(assert (not b!218670))

(assert (not b!218668))

(assert (not b!218680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

