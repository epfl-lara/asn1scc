; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15468 () Bool)

(assert start!15468)

(declare-fun res!64888 () Bool)

(declare-fun e!51509 () Bool)

(assert (=> start!15468 (=> (not res!64888) (not e!51509))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15468 (= res!64888 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15468 e!51509))

(assert (=> start!15468 true))

(declare-datatypes ((array!3343 0))(
  ( (array!3344 (arr!2148 (Array (_ BitVec 32) (_ BitVec 8))) (size!1547 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2656 0))(
  ( (BitStream!2657 (buf!1937 array!3343) (currentByte!3784 (_ BitVec 32)) (currentBit!3779 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2656)

(declare-fun e!51513 () Bool)

(declare-fun inv!12 (BitStream!2656) Bool)

(assert (=> start!15468 (and (inv!12 thiss!1107) e!51513)))

(declare-fun b!78488 () Bool)

(declare-fun e!51507 () Bool)

(declare-fun e!51508 () Bool)

(assert (=> b!78488 (= e!51507 e!51508)))

(declare-fun res!64890 () Bool)

(assert (=> b!78488 (=> (not res!64890) (not e!51508))))

(declare-datatypes ((Unit!5179 0))(
  ( (Unit!5180) )
))
(declare-datatypes ((tuple2!6992 0))(
  ( (tuple2!6993 (_1!3633 Unit!5179) (_2!3633 BitStream!2656)) )
))
(declare-fun lt!125430 () tuple2!6992)

(declare-datatypes ((tuple2!6994 0))(
  ( (tuple2!6995 (_1!3634 BitStream!2656) (_2!3634 Bool)) )
))
(declare-fun lt!125426 () tuple2!6994)

(declare-fun lt!125428 () Bool)

(assert (=> b!78488 (= res!64890 (and (= (_2!3634 lt!125426) lt!125428) (= (_1!3634 lt!125426) (_2!3633 lt!125430))))))

(declare-fun readBitPure!0 (BitStream!2656) tuple2!6994)

(declare-fun readerFrom!0 (BitStream!2656 (_ BitVec 32) (_ BitVec 32)) BitStream!2656)

(assert (=> b!78488 (= lt!125426 (readBitPure!0 (readerFrom!0 (_2!3633 lt!125430) (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107))))))

(declare-fun b!78489 () Bool)

(declare-fun res!64887 () Bool)

(assert (=> b!78489 (=> (not res!64887) (not e!51509))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78489 (= res!64887 (validate_offset_bit!0 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))) ((_ sign_extend 32) (currentByte!3784 thiss!1107)) ((_ sign_extend 32) (currentBit!3779 thiss!1107))))))

(declare-fun b!78490 () Bool)

(declare-fun res!64886 () Bool)

(assert (=> b!78490 (=> (not res!64886) (not e!51507))))

(declare-fun isPrefixOf!0 (BitStream!2656 BitStream!2656) Bool)

(assert (=> b!78490 (= res!64886 (isPrefixOf!0 thiss!1107 (_2!3633 lt!125430)))))

(declare-fun b!78491 () Bool)

(declare-fun res!64892 () Bool)

(declare-fun e!51510 () Bool)

(assert (=> b!78491 (=> res!64892 e!51510)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78491 (= res!64892 (not (= (bitIndex!0 (size!1547 (buf!1937 (_2!3633 lt!125430))) (currentByte!3784 (_2!3633 lt!125430)) (currentBit!3779 (_2!3633 lt!125430))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1547 (buf!1937 thiss!1107)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107))))))))

(declare-fun b!78492 () Bool)

(declare-fun res!64891 () Bool)

(assert (=> b!78492 (=> res!64891 e!51510)))

(assert (=> b!78492 (= res!64891 (not (isPrefixOf!0 thiss!1107 (_2!3633 lt!125430))))))

(declare-fun b!78493 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78493 (= e!51510 (invariant!0 (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(declare-fun b!78494 () Bool)

(declare-fun e!51512 () Bool)

(assert (=> b!78494 (= e!51512 e!51507)))

(declare-fun res!64889 () Bool)

(assert (=> b!78494 (=> (not res!64889) (not e!51507))))

(declare-fun lt!125429 () (_ BitVec 64))

(declare-fun lt!125427 () (_ BitVec 64))

(assert (=> b!78494 (= res!64889 (= lt!125429 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125427)))))

(assert (=> b!78494 (= lt!125429 (bitIndex!0 (size!1547 (buf!1937 (_2!3633 lt!125430))) (currentByte!3784 (_2!3633 lt!125430)) (currentBit!3779 (_2!3633 lt!125430))))))

(assert (=> b!78494 (= lt!125427 (bitIndex!0 (size!1547 (buf!1937 thiss!1107)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107)))))

(declare-fun b!78495 () Bool)

(assert (=> b!78495 (= e!51508 (= (bitIndex!0 (size!1547 (buf!1937 (_1!3634 lt!125426))) (currentByte!3784 (_1!3634 lt!125426)) (currentBit!3779 (_1!3634 lt!125426))) lt!125429))))

(declare-fun b!78496 () Bool)

(assert (=> b!78496 (= e!51509 (not e!51510))))

(declare-fun res!64893 () Bool)

(assert (=> b!78496 (=> res!64893 e!51510)))

(assert (=> b!78496 (= res!64893 (not (= (size!1547 (buf!1937 (_2!3633 lt!125430))) (size!1547 (buf!1937 thiss!1107)))))))

(assert (=> b!78496 e!51512))

(declare-fun res!64894 () Bool)

(assert (=> b!78496 (=> (not res!64894) (not e!51512))))

(assert (=> b!78496 (= res!64894 (= (size!1547 (buf!1937 thiss!1107)) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(declare-fun appendBit!0 (BitStream!2656 Bool) tuple2!6992)

(assert (=> b!78496 (= lt!125430 (appendBit!0 thiss!1107 lt!125428))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78496 (= lt!125428 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78497 () Bool)

(declare-fun res!64885 () Bool)

(assert (=> b!78497 (=> res!64885 e!51510)))

(assert (=> b!78497 (= res!64885 (not (invariant!0 (currentBit!3779 (_2!3633 lt!125430)) (currentByte!3784 (_2!3633 lt!125430)) (size!1547 (buf!1937 (_2!3633 lt!125430))))))))

(declare-fun b!78498 () Bool)

(declare-fun array_inv!1393 (array!3343) Bool)

(assert (=> b!78498 (= e!51513 (array_inv!1393 (buf!1937 thiss!1107)))))

(assert (= (and start!15468 res!64888) b!78489))

(assert (= (and b!78489 res!64887) b!78496))

(assert (= (and b!78496 res!64894) b!78494))

(assert (= (and b!78494 res!64889) b!78490))

(assert (= (and b!78490 res!64886) b!78488))

(assert (= (and b!78488 res!64890) b!78495))

(assert (= (and b!78496 (not res!64893)) b!78491))

(assert (= (and b!78491 (not res!64892)) b!78492))

(assert (= (and b!78492 (not res!64891)) b!78497))

(assert (= (and b!78497 (not res!64885)) b!78493))

(assert (= start!15468 b!78498))

(declare-fun m!124023 () Bool)

(assert (=> b!78491 m!124023))

(declare-fun m!124025 () Bool)

(assert (=> b!78491 m!124025))

(declare-fun m!124027 () Bool)

(assert (=> b!78498 m!124027))

(declare-fun m!124029 () Bool)

(assert (=> b!78496 m!124029))

(declare-fun m!124031 () Bool)

(assert (=> b!78496 m!124031))

(declare-fun m!124033 () Bool)

(assert (=> b!78493 m!124033))

(declare-fun m!124035 () Bool)

(assert (=> start!15468 m!124035))

(declare-fun m!124037 () Bool)

(assert (=> b!78492 m!124037))

(declare-fun m!124039 () Bool)

(assert (=> b!78489 m!124039))

(assert (=> b!78494 m!124023))

(assert (=> b!78494 m!124025))

(declare-fun m!124041 () Bool)

(assert (=> b!78488 m!124041))

(assert (=> b!78488 m!124041))

(declare-fun m!124043 () Bool)

(assert (=> b!78488 m!124043))

(assert (=> b!78490 m!124037))

(declare-fun m!124045 () Bool)

(assert (=> b!78497 m!124045))

(declare-fun m!124047 () Bool)

(assert (=> b!78495 m!124047))

(push 1)

(assert (not b!78497))

(assert (not b!78490))

(assert (not b!78492))

(assert (not b!78491))

(assert (not b!78489))

(assert (not b!78498))

(assert (not b!78488))

(assert (not start!15468))

(assert (not b!78495))

(assert (not b!78493))

(assert (not b!78494))

(assert (not b!78496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24800 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24800 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))) ((_ sign_extend 32) (currentByte!3784 thiss!1107)) ((_ sign_extend 32) (currentBit!3779 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))) ((_ sign_extend 32) (currentByte!3784 thiss!1107)) ((_ sign_extend 32) (currentBit!3779 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6014 () Bool)

(assert (= bs!6014 d!24800))

(declare-fun m!124113 () Bool)

(assert (=> bs!6014 m!124113))

(assert (=> b!78489 d!24800))

(declare-fun d!24806 () Bool)

(declare-datatypes ((tuple2!7006 0))(
  ( (tuple2!7007 (_1!3640 Bool) (_2!3640 BitStream!2656)) )
))
(declare-fun lt!125496 () tuple2!7006)

(declare-fun readBit!0 (BitStream!2656) tuple2!7006)

(assert (=> d!24806 (= lt!125496 (readBit!0 (readerFrom!0 (_2!3633 lt!125430) (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107))))))

(assert (=> d!24806 (= (readBitPure!0 (readerFrom!0 (_2!3633 lt!125430) (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107))) (tuple2!6995 (_2!3640 lt!125496) (_1!3640 lt!125496)))))

(declare-fun bs!6015 () Bool)

(assert (= bs!6015 d!24806))

(assert (=> bs!6015 m!124041))

(declare-fun m!124115 () Bool)

(assert (=> bs!6015 m!124115))

(assert (=> b!78488 d!24806))

(declare-fun d!24808 () Bool)

(declare-fun e!51566 () Bool)

(assert (=> d!24808 e!51566))

(declare-fun res!64972 () Bool)

(assert (=> d!24808 (=> (not res!64972) (not e!51566))))

(assert (=> d!24808 (= res!64972 (invariant!0 (currentBit!3779 (_2!3633 lt!125430)) (currentByte!3784 (_2!3633 lt!125430)) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(assert (=> d!24808 (= (readerFrom!0 (_2!3633 lt!125430) (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107)) (BitStream!2657 (buf!1937 (_2!3633 lt!125430)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107)))))

(declare-fun b!78580 () Bool)

(assert (=> b!78580 (= e!51566 (invariant!0 (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(assert (= (and d!24808 res!64972) b!78580))

(assert (=> d!24808 m!124045))

(assert (=> b!78580 m!124033))

(assert (=> b!78488 d!24808))

(declare-fun d!24810 () Bool)

(assert (=> d!24810 (= (array_inv!1393 (buf!1937 thiss!1107)) (bvsge (size!1547 (buf!1937 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78498 d!24810))

(declare-fun d!24812 () Bool)

(declare-fun res!64979 () Bool)

(declare-fun e!51572 () Bool)

(assert (=> d!24812 (=> (not res!64979) (not e!51572))))

(assert (=> d!24812 (= res!64979 (= (size!1547 (buf!1937 thiss!1107)) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(assert (=> d!24812 (= (isPrefixOf!0 thiss!1107 (_2!3633 lt!125430)) e!51572)))

(declare-fun b!78587 () Bool)

(declare-fun res!64980 () Bool)

(assert (=> b!78587 (=> (not res!64980) (not e!51572))))

(assert (=> b!78587 (= res!64980 (bvsle (bitIndex!0 (size!1547 (buf!1937 thiss!1107)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107)) (bitIndex!0 (size!1547 (buf!1937 (_2!3633 lt!125430))) (currentByte!3784 (_2!3633 lt!125430)) (currentBit!3779 (_2!3633 lt!125430)))))))

(declare-fun b!78588 () Bool)

(declare-fun e!51571 () Bool)

(assert (=> b!78588 (= e!51572 e!51571)))

(declare-fun res!64981 () Bool)

(assert (=> b!78588 (=> res!64981 e!51571)))

(assert (=> b!78588 (= res!64981 (= (size!1547 (buf!1937 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78589 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3343 array!3343 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78589 (= e!51571 (arrayBitRangesEq!0 (buf!1937 thiss!1107) (buf!1937 (_2!3633 lt!125430)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1547 (buf!1937 thiss!1107)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107))))))

(assert (= (and d!24812 res!64979) b!78587))

(assert (= (and b!78587 res!64980) b!78588))

(assert (= (and b!78588 (not res!64981)) b!78589))

(assert (=> b!78587 m!124025))

(assert (=> b!78587 m!124023))

(assert (=> b!78589 m!124025))

(assert (=> b!78589 m!124025))

(declare-fun m!124117 () Bool)

(assert (=> b!78589 m!124117))

(assert (=> b!78492 d!24812))

(declare-fun d!24816 () Bool)

(declare-fun e!51585 () Bool)

(assert (=> d!24816 e!51585))

(declare-fun res!65006 () Bool)

(assert (=> d!24816 (=> (not res!65006) (not e!51585))))

(declare-fun lt!125549 () (_ BitVec 64))

(declare-fun lt!125550 () (_ BitVec 64))

(declare-fun lt!125546 () (_ BitVec 64))

(assert (=> d!24816 (= res!65006 (= lt!125550 (bvsub lt!125546 lt!125549)))))

(assert (=> d!24816 (or (= (bvand lt!125546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125549 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125546 lt!125549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24816 (= lt!125549 (remainingBits!0 ((_ sign_extend 32) (size!1547 (buf!1937 (_2!3633 lt!125430)))) ((_ sign_extend 32) (currentByte!3784 (_2!3633 lt!125430))) ((_ sign_extend 32) (currentBit!3779 (_2!3633 lt!125430)))))))

(declare-fun lt!125547 () (_ BitVec 64))

(declare-fun lt!125545 () (_ BitVec 64))

(assert (=> d!24816 (= lt!125546 (bvmul lt!125547 lt!125545))))

(assert (=> d!24816 (or (= lt!125547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125545 (bvsdiv (bvmul lt!125547 lt!125545) lt!125547)))))

(assert (=> d!24816 (= lt!125545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24816 (= lt!125547 ((_ sign_extend 32) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(assert (=> d!24816 (= lt!125550 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3784 (_2!3633 lt!125430))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3779 (_2!3633 lt!125430)))))))

(assert (=> d!24816 (invariant!0 (currentBit!3779 (_2!3633 lt!125430)) (currentByte!3784 (_2!3633 lt!125430)) (size!1547 (buf!1937 (_2!3633 lt!125430))))))

(assert (=> d!24816 (= (bitIndex!0 (size!1547 (buf!1937 (_2!3633 lt!125430))) (currentByte!3784 (_2!3633 lt!125430)) (currentBit!3779 (_2!3633 lt!125430))) lt!125550)))

(declare-fun b!78615 () Bool)

(declare-fun res!65007 () Bool)

(assert (=> b!78615 (=> (not res!65007) (not e!51585))))

(assert (=> b!78615 (= res!65007 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125550))))

(declare-fun b!78616 () Bool)

(declare-fun lt!125548 () (_ BitVec 64))

(assert (=> b!78616 (= e!51585 (bvsle lt!125550 (bvmul lt!125548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78616 (or (= lt!125548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125548)))))

(assert (=> b!78616 (= lt!125548 ((_ sign_extend 32) (size!1547 (buf!1937 (_2!3633 lt!125430)))))))

(assert (= (and d!24816 res!65006) b!78615))

(assert (= (and b!78615 res!65007) b!78616))

(declare-fun m!124137 () Bool)

(assert (=> d!24816 m!124137))

(assert (=> d!24816 m!124045))

(assert (=> b!78491 d!24816))

(declare-fun d!24830 () Bool)

(declare-fun e!51587 () Bool)

(assert (=> d!24830 e!51587))

(declare-fun res!65010 () Bool)

(assert (=> d!24830 (=> (not res!65010) (not e!51587))))

(declare-fun lt!125558 () (_ BitVec 64))

(declare-fun lt!125562 () (_ BitVec 64))

(declare-fun lt!125561 () (_ BitVec 64))

(assert (=> d!24830 (= res!65010 (= lt!125562 (bvsub lt!125558 lt!125561)))))

(assert (=> d!24830 (or (= (bvand lt!125558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125558 lt!125561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24830 (= lt!125561 (remainingBits!0 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))) ((_ sign_extend 32) (currentByte!3784 thiss!1107)) ((_ sign_extend 32) (currentBit!3779 thiss!1107))))))

(declare-fun lt!125559 () (_ BitVec 64))

(declare-fun lt!125557 () (_ BitVec 64))

(assert (=> d!24830 (= lt!125558 (bvmul lt!125559 lt!125557))))

(assert (=> d!24830 (or (= lt!125559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125557 (bvsdiv (bvmul lt!125559 lt!125557) lt!125559)))))

(assert (=> d!24830 (= lt!125557 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24830 (= lt!125559 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))))))

(assert (=> d!24830 (= lt!125562 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3784 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3779 thiss!1107))))))

(assert (=> d!24830 (invariant!0 (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107) (size!1547 (buf!1937 thiss!1107)))))

(assert (=> d!24830 (= (bitIndex!0 (size!1547 (buf!1937 thiss!1107)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107)) lt!125562)))

(declare-fun b!78619 () Bool)

(declare-fun res!65011 () Bool)

(assert (=> b!78619 (=> (not res!65011) (not e!51587))))

(assert (=> b!78619 (= res!65011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125562))))

(declare-fun b!78620 () Bool)

(declare-fun lt!125560 () (_ BitVec 64))

(assert (=> b!78620 (= e!51587 (bvsle lt!125562 (bvmul lt!125560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78620 (or (= lt!125560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125560)))))

(assert (=> b!78620 (= lt!125560 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))))))

(assert (= (and d!24830 res!65010) b!78619))

(assert (= (and b!78619 res!65011) b!78620))

(assert (=> d!24830 m!124113))

(declare-fun m!124143 () Bool)

(assert (=> d!24830 m!124143))

(assert (=> b!78491 d!24830))

(assert (=> b!78490 d!24812))

(declare-fun d!24834 () Bool)

(assert (=> d!24834 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107) (size!1547 (buf!1937 thiss!1107))))))

(declare-fun bs!6017 () Bool)

(assert (= bs!6017 d!24834))

(assert (=> bs!6017 m!124143))

(assert (=> start!15468 d!24834))

(declare-fun d!24836 () Bool)

(declare-fun e!51592 () Bool)

(assert (=> d!24836 e!51592))

(declare-fun res!65018 () Bool)

(assert (=> d!24836 (=> (not res!65018) (not e!51592))))

(declare-fun lt!125567 () (_ BitVec 64))

(declare-fun lt!125568 () (_ BitVec 64))

(declare-fun lt!125564 () (_ BitVec 64))

(assert (=> d!24836 (= res!65018 (= lt!125568 (bvsub lt!125564 lt!125567)))))

(assert (=> d!24836 (or (= (bvand lt!125564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125564 lt!125567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24836 (= lt!125567 (remainingBits!0 ((_ sign_extend 32) (size!1547 (buf!1937 (_1!3634 lt!125426)))) ((_ sign_extend 32) (currentByte!3784 (_1!3634 lt!125426))) ((_ sign_extend 32) (currentBit!3779 (_1!3634 lt!125426)))))))

(declare-fun lt!125565 () (_ BitVec 64))

(declare-fun lt!125563 () (_ BitVec 64))

(assert (=> d!24836 (= lt!125564 (bvmul lt!125565 lt!125563))))

(assert (=> d!24836 (or (= lt!125565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125563 (bvsdiv (bvmul lt!125565 lt!125563) lt!125565)))))

(assert (=> d!24836 (= lt!125563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24836 (= lt!125565 ((_ sign_extend 32) (size!1547 (buf!1937 (_1!3634 lt!125426)))))))

(assert (=> d!24836 (= lt!125568 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3784 (_1!3634 lt!125426))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3779 (_1!3634 lt!125426)))))))

(assert (=> d!24836 (invariant!0 (currentBit!3779 (_1!3634 lt!125426)) (currentByte!3784 (_1!3634 lt!125426)) (size!1547 (buf!1937 (_1!3634 lt!125426))))))

(assert (=> d!24836 (= (bitIndex!0 (size!1547 (buf!1937 (_1!3634 lt!125426))) (currentByte!3784 (_1!3634 lt!125426)) (currentBit!3779 (_1!3634 lt!125426))) lt!125568)))

(declare-fun b!78627 () Bool)

(declare-fun res!65019 () Bool)

(assert (=> b!78627 (=> (not res!65019) (not e!51592))))

(assert (=> b!78627 (= res!65019 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125568))))

(declare-fun b!78628 () Bool)

(declare-fun lt!125566 () (_ BitVec 64))

(assert (=> b!78628 (= e!51592 (bvsle lt!125568 (bvmul lt!125566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78628 (or (= lt!125566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125566)))))

(assert (=> b!78628 (= lt!125566 ((_ sign_extend 32) (size!1547 (buf!1937 (_1!3634 lt!125426)))))))

(assert (= (and d!24836 res!65018) b!78627))

(assert (= (and b!78627 res!65019) b!78628))

(declare-fun m!124145 () Bool)

(assert (=> d!24836 m!124145))

(declare-fun m!124147 () Bool)

(assert (=> d!24836 m!124147))

(assert (=> b!78495 d!24836))

(assert (=> b!78494 d!24816))

(assert (=> b!78494 d!24830))

(declare-fun d!24838 () Bool)

(assert (=> d!24838 (= (invariant!0 (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107) (size!1547 (buf!1937 (_2!3633 lt!125430)))) (and (bvsge (currentBit!3779 thiss!1107) #b00000000000000000000000000000000) (bvslt (currentBit!3779 thiss!1107) #b00000000000000000000000000001000) (bvsge (currentByte!3784 thiss!1107) #b00000000000000000000000000000000) (or (bvslt (currentByte!3784 thiss!1107) (size!1547 (buf!1937 (_2!3633 lt!125430)))) (and (= (currentBit!3779 thiss!1107) #b00000000000000000000000000000000) (= (currentByte!3784 thiss!1107) (size!1547 (buf!1937 (_2!3633 lt!125430))))))))))

(assert (=> b!78493 d!24838))

(declare-fun d!24840 () Bool)

(assert (=> d!24840 (= (invariant!0 (currentBit!3779 (_2!3633 lt!125430)) (currentByte!3784 (_2!3633 lt!125430)) (size!1547 (buf!1937 (_2!3633 lt!125430)))) (and (bvsge (currentBit!3779 (_2!3633 lt!125430)) #b00000000000000000000000000000000) (bvslt (currentBit!3779 (_2!3633 lt!125430)) #b00000000000000000000000000001000) (bvsge (currentByte!3784 (_2!3633 lt!125430)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3784 (_2!3633 lt!125430)) (size!1547 (buf!1937 (_2!3633 lt!125430)))) (and (= (currentBit!3779 (_2!3633 lt!125430)) #b00000000000000000000000000000000) (= (currentByte!3784 (_2!3633 lt!125430)) (size!1547 (buf!1937 (_2!3633 lt!125430))))))))))

(assert (=> b!78497 d!24840))

(declare-fun d!24842 () Bool)

(declare-fun e!51610 () Bool)

(assert (=> d!24842 e!51610))

(declare-fun res!65050 () Bool)

(assert (=> d!24842 (=> (not res!65050) (not e!51610))))

(declare-fun lt!125586 () tuple2!6992)

(assert (=> d!24842 (= res!65050 (= (size!1547 (buf!1937 thiss!1107)) (size!1547 (buf!1937 (_2!3633 lt!125586)))))))

(declare-fun choose!16 (BitStream!2656 Bool) tuple2!6992)

(assert (=> d!24842 (= lt!125586 (choose!16 thiss!1107 lt!125428))))

(assert (=> d!24842 (validate_offset_bit!0 ((_ sign_extend 32) (size!1547 (buf!1937 thiss!1107))) ((_ sign_extend 32) (currentByte!3784 thiss!1107)) ((_ sign_extend 32) (currentBit!3779 thiss!1107)))))

(assert (=> d!24842 (= (appendBit!0 thiss!1107 lt!125428) lt!125586)))

(declare-fun b!78660 () Bool)

(declare-fun res!65048 () Bool)

(assert (=> b!78660 (=> (not res!65048) (not e!51610))))

(assert (=> b!78660 (= res!65048 (isPrefixOf!0 thiss!1107 (_2!3633 lt!125586)))))

(declare-fun b!78661 () Bool)

(declare-fun e!51609 () Bool)

(assert (=> b!78661 (= e!51610 e!51609)))

(declare-fun res!65051 () Bool)

(assert (=> b!78661 (=> (not res!65051) (not e!51609))))

(declare-fun lt!125588 () tuple2!6994)

(assert (=> b!78661 (= res!65051 (and (= (_2!3634 lt!125588) lt!125428) (= (_1!3634 lt!125588) (_2!3633 lt!125586))))))

(assert (=> b!78661 (= lt!125588 (readBitPure!0 (readerFrom!0 (_2!3633 lt!125586) (currentBit!3779 thiss!1107) (currentByte!3784 thiss!1107))))))

(declare-fun b!78662 () Bool)

(assert (=> b!78662 (= e!51609 (= (bitIndex!0 (size!1547 (buf!1937 (_1!3634 lt!125588))) (currentByte!3784 (_1!3634 lt!125588)) (currentBit!3779 (_1!3634 lt!125588))) (bitIndex!0 (size!1547 (buf!1937 (_2!3633 lt!125586))) (currentByte!3784 (_2!3633 lt!125586)) (currentBit!3779 (_2!3633 lt!125586)))))))

(declare-fun b!78659 () Bool)

(declare-fun res!65049 () Bool)

(assert (=> b!78659 (=> (not res!65049) (not e!51610))))

(declare-fun lt!125587 () (_ BitVec 64))

(declare-fun lt!125585 () (_ BitVec 64))

(assert (=> b!78659 (= res!65049 (= (bitIndex!0 (size!1547 (buf!1937 (_2!3633 lt!125586))) (currentByte!3784 (_2!3633 lt!125586)) (currentBit!3779 (_2!3633 lt!125586))) (bvadd lt!125587 lt!125585)))))

(assert (=> b!78659 (or (not (= (bvand lt!125587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125585 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125587 lt!125585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78659 (= lt!125585 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78659 (= lt!125587 (bitIndex!0 (size!1547 (buf!1937 thiss!1107)) (currentByte!3784 thiss!1107) (currentBit!3779 thiss!1107)))))

(assert (= (and d!24842 res!65050) b!78659))

(assert (= (and b!78659 res!65049) b!78660))

(assert (= (and b!78660 res!65048) b!78661))

(assert (= (and b!78661 res!65051) b!78662))

(declare-fun m!124153 () Bool)

(assert (=> b!78659 m!124153))

(assert (=> b!78659 m!124025))

(declare-fun m!124155 () Bool)

(assert (=> d!24842 m!124155))

(assert (=> d!24842 m!124039))

(declare-fun m!124157 () Bool)

(assert (=> b!78662 m!124157))

(assert (=> b!78662 m!124153))

(declare-fun m!124159 () Bool)

(assert (=> b!78661 m!124159))

(assert (=> b!78661 m!124159))

(declare-fun m!124161 () Bool)

(assert (=> b!78661 m!124161))

(declare-fun m!124163 () Bool)

(assert (=> b!78660 m!124163))

(assert (=> b!78496 d!24842))

(push 1)

(assert (not d!24842))

(assert (not d!24836))

(assert (not d!24834))

(assert (not d!24830))

(assert (not d!24816))

(assert (not d!24808))

(assert (not b!78580))

(assert (not d!24800))

(assert (not b!78662))

(assert (not b!78589))

(assert (not d!24806))

(assert (not b!78661))

(assert (not b!78587))

(assert (not b!78660))

(assert (not b!78659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

