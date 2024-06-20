; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15288 () Bool)

(assert start!15288)

(declare-fun b!77933 () Bool)

(declare-fun res!64359 () Bool)

(declare-fun e!51144 () Bool)

(assert (=> b!77933 (=> (not res!64359) (not e!51144))))

(declare-datatypes ((array!3316 0))(
  ( (array!3317 (arr!2139 (Array (_ BitVec 32) (_ BitVec 8))) (size!1538 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2638 0))(
  ( (BitStream!2639 (buf!1928 array!3316) (currentByte!3748 (_ BitVec 32)) (currentBit!3743 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2638)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77933 (= res!64359 (validate_offset_bit!0 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))) ((_ sign_extend 32) (currentByte!3748 thiss!1107)) ((_ sign_extend 32) (currentBit!3743 thiss!1107))))))

(declare-fun res!64358 () Bool)

(assert (=> start!15288 (=> (not res!64358) (not e!51144))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15288 (= res!64358 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15288 e!51144))

(assert (=> start!15288 true))

(declare-fun e!51139 () Bool)

(declare-fun inv!12 (BitStream!2638) Bool)

(assert (=> start!15288 (and (inv!12 thiss!1107) e!51139)))

(declare-fun b!77934 () Bool)

(declare-fun array_inv!1384 (array!3316) Bool)

(assert (=> b!77934 (= e!51139 (array_inv!1384 (buf!1928 thiss!1107)))))

(declare-fun b!77935 () Bool)

(declare-fun e!51143 () Bool)

(declare-fun e!51141 () Bool)

(assert (=> b!77935 (= e!51143 e!51141)))

(declare-fun res!64357 () Bool)

(assert (=> b!77935 (=> (not res!64357) (not e!51141))))

(declare-fun lt!124887 () (_ BitVec 64))

(declare-fun lt!124886 () (_ BitVec 64))

(assert (=> b!77935 (= res!64357 (= lt!124887 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!124886)))))

(declare-datatypes ((Unit!5161 0))(
  ( (Unit!5162) )
))
(declare-datatypes ((tuple2!6938 0))(
  ( (tuple2!6939 (_1!3606 Unit!5161) (_2!3606 BitStream!2638)) )
))
(declare-fun lt!124889 () tuple2!6938)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77935 (= lt!124887 (bitIndex!0 (size!1538 (buf!1928 (_2!3606 lt!124889))) (currentByte!3748 (_2!3606 lt!124889)) (currentBit!3743 (_2!3606 lt!124889))))))

(assert (=> b!77935 (= lt!124886 (bitIndex!0 (size!1538 (buf!1928 thiss!1107)) (currentByte!3748 thiss!1107) (currentBit!3743 thiss!1107)))))

(declare-fun b!77936 () Bool)

(declare-fun e!51142 () Bool)

(assert (=> b!77936 (= e!51141 e!51142)))

(declare-fun res!64360 () Bool)

(assert (=> b!77936 (=> (not res!64360) (not e!51142))))

(declare-fun lt!124888 () Bool)

(declare-datatypes ((tuple2!6940 0))(
  ( (tuple2!6941 (_1!3607 BitStream!2638) (_2!3607 Bool)) )
))
(declare-fun lt!124890 () tuple2!6940)

(assert (=> b!77936 (= res!64360 (and (= (_2!3607 lt!124890) lt!124888) (= (_1!3607 lt!124890) (_2!3606 lt!124889))))))

(declare-fun readBitPure!0 (BitStream!2638) tuple2!6940)

(declare-fun readerFrom!0 (BitStream!2638 (_ BitVec 32) (_ BitVec 32)) BitStream!2638)

(assert (=> b!77936 (= lt!124890 (readBitPure!0 (readerFrom!0 (_2!3606 lt!124889) (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107))))))

(declare-fun b!77937 () Bool)

(declare-fun e!51138 () Bool)

(assert (=> b!77937 (= e!51144 (not e!51138))))

(declare-fun res!64363 () Bool)

(assert (=> b!77937 (=> res!64363 e!51138)))

(assert (=> b!77937 (= res!64363 (not (= (size!1538 (buf!1928 (_2!3606 lt!124889))) (size!1538 (buf!1928 thiss!1107)))))))

(assert (=> b!77937 e!51143))

(declare-fun res!64362 () Bool)

(assert (=> b!77937 (=> (not res!64362) (not e!51143))))

(assert (=> b!77937 (= res!64362 (= (size!1538 (buf!1928 thiss!1107)) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(declare-fun appendBit!0 (BitStream!2638 Bool) tuple2!6938)

(assert (=> b!77937 (= lt!124889 (appendBit!0 thiss!1107 lt!124888))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!77937 (= lt!124888 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!77938 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!77938 (= e!51138 (invariant!0 (currentBit!3743 (_2!3606 lt!124889)) (currentByte!3748 (_2!3606 lt!124889)) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(declare-fun b!77939 () Bool)

(declare-fun res!64361 () Bool)

(assert (=> b!77939 (=> (not res!64361) (not e!51141))))

(declare-fun isPrefixOf!0 (BitStream!2638 BitStream!2638) Bool)

(assert (=> b!77939 (= res!64361 (isPrefixOf!0 thiss!1107 (_2!3606 lt!124889)))))

(declare-fun b!77940 () Bool)

(assert (=> b!77940 (= e!51142 (= (bitIndex!0 (size!1538 (buf!1928 (_1!3607 lt!124890))) (currentByte!3748 (_1!3607 lt!124890)) (currentBit!3743 (_1!3607 lt!124890))) lt!124887))))

(assert (= (and start!15288 res!64358) b!77933))

(assert (= (and b!77933 res!64359) b!77937))

(assert (= (and b!77937 res!64362) b!77935))

(assert (= (and b!77935 res!64357) b!77939))

(assert (= (and b!77939 res!64361) b!77936))

(assert (= (and b!77936 res!64360) b!77940))

(assert (= (and b!77937 (not res!64363)) b!77938))

(assert (= start!15288 b!77934))

(declare-fun m!123555 () Bool)

(assert (=> b!77938 m!123555))

(declare-fun m!123557 () Bool)

(assert (=> start!15288 m!123557))

(declare-fun m!123559 () Bool)

(assert (=> b!77933 m!123559))

(declare-fun m!123561 () Bool)

(assert (=> b!77935 m!123561))

(declare-fun m!123563 () Bool)

(assert (=> b!77935 m!123563))

(declare-fun m!123565 () Bool)

(assert (=> b!77934 m!123565))

(declare-fun m!123567 () Bool)

(assert (=> b!77936 m!123567))

(assert (=> b!77936 m!123567))

(declare-fun m!123569 () Bool)

(assert (=> b!77936 m!123569))

(declare-fun m!123571 () Bool)

(assert (=> b!77939 m!123571))

(declare-fun m!123573 () Bool)

(assert (=> b!77937 m!123573))

(declare-fun m!123575 () Bool)

(assert (=> b!77937 m!123575))

(declare-fun m!123577 () Bool)

(assert (=> b!77940 m!123577))

(push 1)

(assert (not b!77933))

(assert (not b!77938))

(assert (not b!77940))

(assert (not b!77935))

(assert (not start!15288))

(assert (not b!77934))

(assert (not b!77939))

(assert (not b!77937))

(assert (not b!77936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24594 () Bool)

(declare-datatypes ((tuple2!6952 0))(
  ( (tuple2!6953 (_1!3613 Bool) (_2!3613 BitStream!2638)) )
))
(declare-fun lt!124956 () tuple2!6952)

(declare-fun readBit!0 (BitStream!2638) tuple2!6952)

(assert (=> d!24594 (= lt!124956 (readBit!0 (readerFrom!0 (_2!3606 lt!124889) (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107))))))

(assert (=> d!24594 (= (readBitPure!0 (readerFrom!0 (_2!3606 lt!124889) (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107))) (tuple2!6941 (_2!3613 lt!124956) (_1!3613 lt!124956)))))

(declare-fun bs!5978 () Bool)

(assert (= bs!5978 d!24594))

(assert (=> bs!5978 m!123567))

(declare-fun m!123643 () Bool)

(assert (=> bs!5978 m!123643))

(assert (=> b!77936 d!24594))

(declare-fun d!24598 () Bool)

(declare-fun e!51203 () Bool)

(assert (=> d!24598 e!51203))

(declare-fun res!64432 () Bool)

(assert (=> d!24598 (=> (not res!64432) (not e!51203))))

(assert (=> d!24598 (= res!64432 (invariant!0 (currentBit!3743 (_2!3606 lt!124889)) (currentByte!3748 (_2!3606 lt!124889)) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(assert (=> d!24598 (= (readerFrom!0 (_2!3606 lt!124889) (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107)) (BitStream!2639 (buf!1928 (_2!3606 lt!124889)) (currentByte!3748 thiss!1107) (currentBit!3743 thiss!1107)))))

(declare-fun b!78013 () Bool)

(assert (=> b!78013 (= e!51203 (invariant!0 (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(assert (= (and d!24598 res!64432) b!78013))

(assert (=> d!24598 m!123555))

(declare-fun m!123645 () Bool)

(assert (=> b!78013 m!123645))

(assert (=> b!77936 d!24598))

(declare-fun b!78036 () Bool)

(declare-fun res!64455 () Bool)

(declare-fun e!51215 () Bool)

(assert (=> b!78036 (=> (not res!64455) (not e!51215))))

(declare-fun lt!124979 () tuple2!6938)

(declare-fun lt!124980 () (_ BitVec 64))

(declare-fun lt!124977 () (_ BitVec 64))

(assert (=> b!78036 (= res!64455 (= (bitIndex!0 (size!1538 (buf!1928 (_2!3606 lt!124979))) (currentByte!3748 (_2!3606 lt!124979)) (currentBit!3743 (_2!3606 lt!124979))) (bvadd lt!124977 lt!124980)))))

(assert (=> b!78036 (or (not (= (bvand lt!124977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124980 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124977 lt!124980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78036 (= lt!124980 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78036 (= lt!124977 (bitIndex!0 (size!1538 (buf!1928 thiss!1107)) (currentByte!3748 thiss!1107) (currentBit!3743 thiss!1107)))))

(declare-fun d!24604 () Bool)

(assert (=> d!24604 e!51215))

(declare-fun res!64456 () Bool)

(assert (=> d!24604 (=> (not res!64456) (not e!51215))))

(assert (=> d!24604 (= res!64456 (= (size!1538 (buf!1928 thiss!1107)) (size!1538 (buf!1928 (_2!3606 lt!124979)))))))

(declare-fun choose!16 (BitStream!2638 Bool) tuple2!6938)

(assert (=> d!24604 (= lt!124979 (choose!16 thiss!1107 lt!124888))))

(assert (=> d!24604 (validate_offset_bit!0 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))) ((_ sign_extend 32) (currentByte!3748 thiss!1107)) ((_ sign_extend 32) (currentBit!3743 thiss!1107)))))

(assert (=> d!24604 (= (appendBit!0 thiss!1107 lt!124888) lt!124979)))

(declare-fun b!78038 () Bool)

(declare-fun e!51214 () Bool)

(assert (=> b!78038 (= e!51215 e!51214)))

(declare-fun res!64454 () Bool)

(assert (=> b!78038 (=> (not res!64454) (not e!51214))))

(declare-fun lt!124978 () tuple2!6940)

(assert (=> b!78038 (= res!64454 (and (= (_2!3607 lt!124978) lt!124888) (= (_1!3607 lt!124978) (_2!3606 lt!124979))))))

(assert (=> b!78038 (= lt!124978 (readBitPure!0 (readerFrom!0 (_2!3606 lt!124979) (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107))))))

(declare-fun b!78037 () Bool)

(declare-fun res!64453 () Bool)

(assert (=> b!78037 (=> (not res!64453) (not e!51215))))

(assert (=> b!78037 (= res!64453 (isPrefixOf!0 thiss!1107 (_2!3606 lt!124979)))))

(declare-fun b!78039 () Bool)

(assert (=> b!78039 (= e!51214 (= (bitIndex!0 (size!1538 (buf!1928 (_1!3607 lt!124978))) (currentByte!3748 (_1!3607 lt!124978)) (currentBit!3743 (_1!3607 lt!124978))) (bitIndex!0 (size!1538 (buf!1928 (_2!3606 lt!124979))) (currentByte!3748 (_2!3606 lt!124979)) (currentBit!3743 (_2!3606 lt!124979)))))))

(assert (= (and d!24604 res!64456) b!78036))

(assert (= (and b!78036 res!64455) b!78037))

(assert (= (and b!78037 res!64453) b!78038))

(assert (= (and b!78038 res!64454) b!78039))

(declare-fun m!123661 () Bool)

(assert (=> b!78039 m!123661))

(declare-fun m!123663 () Bool)

(assert (=> b!78039 m!123663))

(assert (=> b!78036 m!123663))

(assert (=> b!78036 m!123563))

(declare-fun m!123665 () Bool)

(assert (=> b!78038 m!123665))

(assert (=> b!78038 m!123665))

(declare-fun m!123667 () Bool)

(assert (=> b!78038 m!123667))

(declare-fun m!123669 () Bool)

(assert (=> b!78037 m!123669))

(declare-fun m!123671 () Bool)

(assert (=> d!24604 m!123671))

(assert (=> d!24604 m!123559))

(assert (=> b!77937 d!24604))

(declare-fun d!24614 () Bool)

(declare-fun res!64472 () Bool)

(declare-fun e!51225 () Bool)

(assert (=> d!24614 (=> (not res!64472) (not e!51225))))

(assert (=> d!24614 (= res!64472 (= (size!1538 (buf!1928 thiss!1107)) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(assert (=> d!24614 (= (isPrefixOf!0 thiss!1107 (_2!3606 lt!124889)) e!51225)))

(declare-fun b!78055 () Bool)

(declare-fun res!64473 () Bool)

(assert (=> b!78055 (=> (not res!64473) (not e!51225))))

(assert (=> b!78055 (= res!64473 (bvsle (bitIndex!0 (size!1538 (buf!1928 thiss!1107)) (currentByte!3748 thiss!1107) (currentBit!3743 thiss!1107)) (bitIndex!0 (size!1538 (buf!1928 (_2!3606 lt!124889))) (currentByte!3748 (_2!3606 lt!124889)) (currentBit!3743 (_2!3606 lt!124889)))))))

(declare-fun b!78056 () Bool)

(declare-fun e!51224 () Bool)

(assert (=> b!78056 (= e!51225 e!51224)))

(declare-fun res!64471 () Bool)

(assert (=> b!78056 (=> res!64471 e!51224)))

(assert (=> b!78056 (= res!64471 (= (size!1538 (buf!1928 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78057 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3316 array!3316 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78057 (= e!51224 (arrayBitRangesEq!0 (buf!1928 thiss!1107) (buf!1928 (_2!3606 lt!124889)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1538 (buf!1928 thiss!1107)) (currentByte!3748 thiss!1107) (currentBit!3743 thiss!1107))))))

(assert (= (and d!24614 res!64472) b!78055))

(assert (= (and b!78055 res!64473) b!78056))

(assert (= (and b!78056 (not res!64471)) b!78057))

(assert (=> b!78055 m!123563))

(assert (=> b!78055 m!123561))

(assert (=> b!78057 m!123563))

(assert (=> b!78057 m!123563))

(declare-fun m!123673 () Bool)

(assert (=> b!78057 m!123673))

(assert (=> b!77939 d!24614))

(declare-fun d!24616 () Bool)

(assert (=> d!24616 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107) (size!1538 (buf!1928 thiss!1107))))))

(declare-fun bs!5981 () Bool)

(assert (= bs!5981 d!24616))

(declare-fun m!123675 () Bool)

(assert (=> bs!5981 m!123675))

(assert (=> start!15288 d!24616))

(declare-fun d!24618 () Bool)

(assert (=> d!24618 (= (invariant!0 (currentBit!3743 (_2!3606 lt!124889)) (currentByte!3748 (_2!3606 lt!124889)) (size!1538 (buf!1928 (_2!3606 lt!124889)))) (and (bvsge (currentBit!3743 (_2!3606 lt!124889)) #b00000000000000000000000000000000) (bvslt (currentBit!3743 (_2!3606 lt!124889)) #b00000000000000000000000000001000) (bvsge (currentByte!3748 (_2!3606 lt!124889)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3748 (_2!3606 lt!124889)) (size!1538 (buf!1928 (_2!3606 lt!124889)))) (and (= (currentBit!3743 (_2!3606 lt!124889)) #b00000000000000000000000000000000) (= (currentByte!3748 (_2!3606 lt!124889)) (size!1538 (buf!1928 (_2!3606 lt!124889))))))))))

(assert (=> b!77938 d!24618))

(declare-fun d!24622 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24622 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))) ((_ sign_extend 32) (currentByte!3748 thiss!1107)) ((_ sign_extend 32) (currentBit!3743 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))) ((_ sign_extend 32) (currentByte!3748 thiss!1107)) ((_ sign_extend 32) (currentBit!3743 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5982 () Bool)

(assert (= bs!5982 d!24622))

(declare-fun m!123689 () Bool)

(assert (=> bs!5982 m!123689))

(assert (=> b!77933 d!24622))

(declare-fun d!24624 () Bool)

(declare-fun e!51233 () Bool)

(assert (=> d!24624 e!51233))

(declare-fun res!64489 () Bool)

(assert (=> d!24624 (=> (not res!64489) (not e!51233))))

(declare-fun lt!125024 () (_ BitVec 64))

(declare-fun lt!125025 () (_ BitVec 64))

(declare-fun lt!125027 () (_ BitVec 64))

(assert (=> d!24624 (= res!64489 (= lt!125025 (bvsub lt!125024 lt!125027)))))

(assert (=> d!24624 (or (= (bvand lt!125024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125027 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125024 lt!125027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24624 (= lt!125027 (remainingBits!0 ((_ sign_extend 32) (size!1538 (buf!1928 (_1!3607 lt!124890)))) ((_ sign_extend 32) (currentByte!3748 (_1!3607 lt!124890))) ((_ sign_extend 32) (currentBit!3743 (_1!3607 lt!124890)))))))

(declare-fun lt!125026 () (_ BitVec 64))

(declare-fun lt!125028 () (_ BitVec 64))

(assert (=> d!24624 (= lt!125024 (bvmul lt!125026 lt!125028))))

(assert (=> d!24624 (or (= lt!125026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125028 (bvsdiv (bvmul lt!125026 lt!125028) lt!125026)))))

(assert (=> d!24624 (= lt!125028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24624 (= lt!125026 ((_ sign_extend 32) (size!1538 (buf!1928 (_1!3607 lt!124890)))))))

(assert (=> d!24624 (= lt!125025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3748 (_1!3607 lt!124890))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3743 (_1!3607 lt!124890)))))))

(assert (=> d!24624 (invariant!0 (currentBit!3743 (_1!3607 lt!124890)) (currentByte!3748 (_1!3607 lt!124890)) (size!1538 (buf!1928 (_1!3607 lt!124890))))))

(assert (=> d!24624 (= (bitIndex!0 (size!1538 (buf!1928 (_1!3607 lt!124890))) (currentByte!3748 (_1!3607 lt!124890)) (currentBit!3743 (_1!3607 lt!124890))) lt!125025)))

(declare-fun b!78072 () Bool)

(declare-fun res!64488 () Bool)

(assert (=> b!78072 (=> (not res!64488) (not e!51233))))

(assert (=> b!78072 (= res!64488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125025))))

(declare-fun b!78073 () Bool)

(declare-fun lt!125023 () (_ BitVec 64))

(assert (=> b!78073 (= e!51233 (bvsle lt!125025 (bvmul lt!125023 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78073 (or (= lt!125023 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125023 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125023)))))

(assert (=> b!78073 (= lt!125023 ((_ sign_extend 32) (size!1538 (buf!1928 (_1!3607 lt!124890)))))))

(assert (= (and d!24624 res!64489) b!78072))

(assert (= (and b!78072 res!64488) b!78073))

(declare-fun m!123697 () Bool)

(assert (=> d!24624 m!123697))

(declare-fun m!123699 () Bool)

(assert (=> d!24624 m!123699))

(assert (=> b!77940 d!24624))

(declare-fun d!24630 () Bool)

(declare-fun e!51235 () Bool)

(assert (=> d!24630 e!51235))

(declare-fun res!64493 () Bool)

(assert (=> d!24630 (=> (not res!64493) (not e!51235))))

(declare-fun lt!125037 () (_ BitVec 64))

(declare-fun lt!125039 () (_ BitVec 64))

(declare-fun lt!125036 () (_ BitVec 64))

(assert (=> d!24630 (= res!64493 (= lt!125037 (bvsub lt!125036 lt!125039)))))

(assert (=> d!24630 (or (= (bvand lt!125036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125036 lt!125039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24630 (= lt!125039 (remainingBits!0 ((_ sign_extend 32) (size!1538 (buf!1928 (_2!3606 lt!124889)))) ((_ sign_extend 32) (currentByte!3748 (_2!3606 lt!124889))) ((_ sign_extend 32) (currentBit!3743 (_2!3606 lt!124889)))))))

(declare-fun lt!125038 () (_ BitVec 64))

(declare-fun lt!125040 () (_ BitVec 64))

(assert (=> d!24630 (= lt!125036 (bvmul lt!125038 lt!125040))))

(assert (=> d!24630 (or (= lt!125038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125040 (bvsdiv (bvmul lt!125038 lt!125040) lt!125038)))))

(assert (=> d!24630 (= lt!125040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24630 (= lt!125038 ((_ sign_extend 32) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(assert (=> d!24630 (= lt!125037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3748 (_2!3606 lt!124889))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3743 (_2!3606 lt!124889)))))))

(assert (=> d!24630 (invariant!0 (currentBit!3743 (_2!3606 lt!124889)) (currentByte!3748 (_2!3606 lt!124889)) (size!1538 (buf!1928 (_2!3606 lt!124889))))))

(assert (=> d!24630 (= (bitIndex!0 (size!1538 (buf!1928 (_2!3606 lt!124889))) (currentByte!3748 (_2!3606 lt!124889)) (currentBit!3743 (_2!3606 lt!124889))) lt!125037)))

(declare-fun b!78076 () Bool)

(declare-fun res!64492 () Bool)

(assert (=> b!78076 (=> (not res!64492) (not e!51235))))

(assert (=> b!78076 (= res!64492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125037))))

(declare-fun b!78077 () Bool)

(declare-fun lt!125035 () (_ BitVec 64))

(assert (=> b!78077 (= e!51235 (bvsle lt!125037 (bvmul lt!125035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78077 (or (= lt!125035 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125035 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125035)))))

(assert (=> b!78077 (= lt!125035 ((_ sign_extend 32) (size!1538 (buf!1928 (_2!3606 lt!124889)))))))

(assert (= (and d!24630 res!64493) b!78076))

(assert (= (and b!78076 res!64492) b!78077))

(declare-fun m!123703 () Bool)

(assert (=> d!24630 m!123703))

(assert (=> d!24630 m!123555))

(assert (=> b!77935 d!24630))

(declare-fun d!24634 () Bool)

(declare-fun e!51237 () Bool)

(assert (=> d!24634 e!51237))

(declare-fun res!64497 () Bool)

(assert (=> d!24634 (=> (not res!64497) (not e!51237))))

(declare-fun lt!125048 () (_ BitVec 64))

(declare-fun lt!125051 () (_ BitVec 64))

(declare-fun lt!125049 () (_ BitVec 64))

(assert (=> d!24634 (= res!64497 (= lt!125049 (bvsub lt!125048 lt!125051)))))

(assert (=> d!24634 (or (= (bvand lt!125048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125051 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125048 lt!125051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24634 (= lt!125051 (remainingBits!0 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))) ((_ sign_extend 32) (currentByte!3748 thiss!1107)) ((_ sign_extend 32) (currentBit!3743 thiss!1107))))))

(declare-fun lt!125050 () (_ BitVec 64))

(declare-fun lt!125052 () (_ BitVec 64))

(assert (=> d!24634 (= lt!125048 (bvmul lt!125050 lt!125052))))

(assert (=> d!24634 (or (= lt!125050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125052 (bvsdiv (bvmul lt!125050 lt!125052) lt!125050)))))

(assert (=> d!24634 (= lt!125052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24634 (= lt!125050 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))))))

(assert (=> d!24634 (= lt!125049 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3748 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3743 thiss!1107))))))

(assert (=> d!24634 (invariant!0 (currentBit!3743 thiss!1107) (currentByte!3748 thiss!1107) (size!1538 (buf!1928 thiss!1107)))))

(assert (=> d!24634 (= (bitIndex!0 (size!1538 (buf!1928 thiss!1107)) (currentByte!3748 thiss!1107) (currentBit!3743 thiss!1107)) lt!125049)))

(declare-fun b!78080 () Bool)

(declare-fun res!64496 () Bool)

(assert (=> b!78080 (=> (not res!64496) (not e!51237))))

(assert (=> b!78080 (= res!64496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125049))))

(declare-fun b!78081 () Bool)

(declare-fun lt!125047 () (_ BitVec 64))

(assert (=> b!78081 (= e!51237 (bvsle lt!125049 (bvmul lt!125047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78081 (or (= lt!125047 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125047 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125047)))))

(assert (=> b!78081 (= lt!125047 ((_ sign_extend 32) (size!1538 (buf!1928 thiss!1107))))))

(assert (= (and d!24634 res!64497) b!78080))

(assert (= (and b!78080 res!64496) b!78081))

(assert (=> d!24634 m!123689))

(assert (=> d!24634 m!123675))

(assert (=> b!77935 d!24634))

(declare-fun d!24638 () Bool)

(assert (=> d!24638 (= (array_inv!1384 (buf!1928 thiss!1107)) (bvsge (size!1538 (buf!1928 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!77934 d!24638))

(push 1)

(assert (not d!24616))

(assert (not d!24594))

(assert (not b!78013))

(assert (not d!24624))

(assert (not b!78038))

(assert (not b!78039))

(assert (not d!24622))

(assert (not b!78055))

(assert (not d!24604))

(assert (not d!24634))

(assert (not b!78037))

(assert (not b!78036))

(assert (not d!24598))

(assert (not b!78057))

(assert (not d!24630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

