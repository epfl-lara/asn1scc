; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42498 () Bool)

(assert start!42498)

(declare-fun b!200640 () Bool)

(declare-fun res!167975 () Bool)

(declare-fun e!137618 () Bool)

(assert (=> b!200640 (=> (not res!167975) (not e!137618))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!200640 (= res!167975 (= i!590 nBits!348))))

(declare-fun b!200641 () Bool)

(declare-fun e!137619 () Bool)

(declare-datatypes ((array!10158 0))(
  ( (array!10159 (arr!5403 (Array (_ BitVec 32) (_ BitVec 8))) (size!4473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8054 0))(
  ( (BitStream!8055 (buf!4974 array!10158) (currentByte!9354 (_ BitVec 32)) (currentBit!9349 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8054)

(declare-fun array_inv!4214 (array!10158) Bool)

(assert (=> b!200641 (= e!137619 (array_inv!4214 (buf!4974 thiss!1204)))))

(declare-fun b!200642 () Bool)

(declare-fun res!167977 () Bool)

(assert (=> b!200642 (=> (not res!167977) (not e!137618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200642 (= res!167977 (invariant!0 (currentBit!9349 thiss!1204) (currentByte!9354 thiss!1204) (size!4473 (buf!4974 thiss!1204))))))

(declare-fun e!137620 () Bool)

(declare-fun b!200643 () Bool)

(declare-fun lt!313633 () (_ BitVec 64))

(declare-fun lt!313631 () (_ BitVec 64))

(assert (=> b!200643 (= e!137620 (not (or (not (= lt!313633 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!313633 (bvand lt!313631 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!313632 () (_ BitVec 64))

(assert (=> b!200643 (= lt!313633 (bvand lt!313632 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isPrefixOf!0 (BitStream!8054 BitStream!8054) Bool)

(assert (=> b!200643 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14248 0))(
  ( (Unit!14249) )
))
(declare-fun lt!313630 () Unit!14248)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8054) Unit!14248)

(assert (=> b!200643 (= lt!313630 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!167976 () Bool)

(assert (=> start!42498 (=> (not res!167976) (not e!137618))))

(assert (=> start!42498 (= res!167976 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42498 e!137618))

(assert (=> start!42498 true))

(declare-fun inv!12 (BitStream!8054) Bool)

(assert (=> start!42498 (and (inv!12 thiss!1204) e!137619)))

(declare-fun b!200644 () Bool)

(assert (=> b!200644 (= e!137618 e!137620)))

(declare-fun res!167978 () Bool)

(assert (=> b!200644 (=> (not res!167978) (not e!137620))))

(assert (=> b!200644 (= res!167978 (= lt!313632 (bvsub lt!313631 ((_ sign_extend 32) i!590))))))

(assert (=> b!200644 (= lt!313631 (bvadd lt!313632 ((_ sign_extend 32) nBits!348)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200644 (= lt!313632 (bitIndex!0 (size!4473 (buf!4974 thiss!1204)) (currentByte!9354 thiss!1204) (currentBit!9349 thiss!1204)))))

(declare-fun b!200645 () Bool)

(declare-fun res!167979 () Bool)

(assert (=> b!200645 (=> (not res!167979) (not e!137618))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200645 (= res!167979 (validate_offset_bits!1 ((_ sign_extend 32) (size!4473 (buf!4974 thiss!1204))) ((_ sign_extend 32) (currentByte!9354 thiss!1204)) ((_ sign_extend 32) (currentBit!9349 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42498 res!167976) b!200645))

(assert (= (and b!200645 res!167979) b!200642))

(assert (= (and b!200642 res!167977) b!200640))

(assert (= (and b!200640 res!167975) b!200644))

(assert (= (and b!200644 res!167978) b!200643))

(assert (= start!42498 b!200641))

(declare-fun m!311387 () Bool)

(assert (=> b!200643 m!311387))

(declare-fun m!311389 () Bool)

(assert (=> b!200643 m!311389))

(declare-fun m!311391 () Bool)

(assert (=> b!200641 m!311391))

(declare-fun m!311393 () Bool)

(assert (=> b!200642 m!311393))

(declare-fun m!311395 () Bool)

(assert (=> b!200644 m!311395))

(declare-fun m!311397 () Bool)

(assert (=> b!200645 m!311397))

(declare-fun m!311399 () Bool)

(assert (=> start!42498 m!311399))

(push 1)

(assert (not b!200644))

(assert (not b!200643))

(assert (not start!42498))

(assert (not b!200645))

(assert (not b!200641))

(assert (not b!200642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68831 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68831 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4473 (buf!4974 thiss!1204))) ((_ sign_extend 32) (currentByte!9354 thiss!1204)) ((_ sign_extend 32) (currentBit!9349 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4473 (buf!4974 thiss!1204))) ((_ sign_extend 32) (currentByte!9354 thiss!1204)) ((_ sign_extend 32) (currentBit!9349 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16953 () Bool)

(assert (= bs!16953 d!68831))

(declare-fun m!311403 () Bool)

(assert (=> bs!16953 m!311403))

(assert (=> b!200645 d!68831))

(declare-fun d!68835 () Bool)

(declare-fun e!137633 () Bool)

(assert (=> d!68835 e!137633))

(declare-fun res!168000 () Bool)

(assert (=> d!68835 (=> (not res!168000) (not e!137633))))

(declare-fun lt!313668 () (_ BitVec 64))

(declare-fun lt!313667 () (_ BitVec 64))

(declare-fun lt!313669 () (_ BitVec 64))

(assert (=> d!68835 (= res!168000 (= lt!313668 (bvsub lt!313669 lt!313667)))))

(assert (=> d!68835 (or (= (bvand lt!313669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313669 lt!313667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68835 (= lt!313667 (remainingBits!0 ((_ sign_extend 32) (size!4473 (buf!4974 thiss!1204))) ((_ sign_extend 32) (currentByte!9354 thiss!1204)) ((_ sign_extend 32) (currentBit!9349 thiss!1204))))))

(declare-fun lt!313670 () (_ BitVec 64))

(declare-fun lt!313672 () (_ BitVec 64))

(assert (=> d!68835 (= lt!313669 (bvmul lt!313670 lt!313672))))

(assert (=> d!68835 (or (= lt!313670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313672 (bvsdiv (bvmul lt!313670 lt!313672) lt!313670)))))

(assert (=> d!68835 (= lt!313672 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68835 (= lt!313670 ((_ sign_extend 32) (size!4473 (buf!4974 thiss!1204))))))

(assert (=> d!68835 (= lt!313668 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9354 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9349 thiss!1204))))))

(assert (=> d!68835 (invariant!0 (currentBit!9349 thiss!1204) (currentByte!9354 thiss!1204) (size!4473 (buf!4974 thiss!1204)))))

(assert (=> d!68835 (= (bitIndex!0 (size!4473 (buf!4974 thiss!1204)) (currentByte!9354 thiss!1204) (currentBit!9349 thiss!1204)) lt!313668)))

(declare-fun b!200665 () Bool)

(declare-fun res!167999 () Bool)

(assert (=> b!200665 (=> (not res!167999) (not e!137633))))

(assert (=> b!200665 (= res!167999 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313668))))

(declare-fun b!200666 () Bool)

(declare-fun lt!313671 () (_ BitVec 64))

(assert (=> b!200666 (= e!137633 (bvsle lt!313668 (bvmul lt!313671 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200666 (or (= lt!313671 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313671 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313671)))))

(assert (=> b!200666 (= lt!313671 ((_ sign_extend 32) (size!4473 (buf!4974 thiss!1204))))))

(assert (= (and d!68835 res!168000) b!200665))

(assert (= (and b!200665 res!167999) b!200666))

(assert (=> d!68835 m!311403))

(assert (=> d!68835 m!311393))

(assert (=> b!200644 d!68835))

(declare-fun d!68849 () Bool)

(assert (=> d!68849 (= (invariant!0 (currentBit!9349 thiss!1204) (currentByte!9354 thiss!1204) (size!4473 (buf!4974 thiss!1204))) (and (bvsge (currentBit!9349 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9349 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9354 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9354 thiss!1204) (size!4473 (buf!4974 thiss!1204))) (and (= (currentBit!9349 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9354 thiss!1204) (size!4473 (buf!4974 thiss!1204)))))))))

(assert (=> b!200642 d!68849))

(declare-fun d!68851 () Bool)

(declare-fun res!168022 () Bool)

(declare-fun e!137648 () Bool)

(assert (=> d!68851 (=> (not res!168022) (not e!137648))))

(assert (=> d!68851 (= res!168022 (= (size!4473 (buf!4974 thiss!1204)) (size!4473 (buf!4974 thiss!1204))))))

(assert (=> d!68851 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137648)))

(declare-fun b!200688 () Bool)

(declare-fun res!168023 () Bool)

(assert (=> b!200688 (=> (not res!168023) (not e!137648))))

(assert (=> b!200688 (= res!168023 (bvsle (bitIndex!0 (size!4473 (buf!4974 thiss!1204)) (currentByte!9354 thiss!1204) (currentBit!9349 thiss!1204)) (bitIndex!0 (size!4473 (buf!4974 thiss!1204)) (currentByte!9354 thiss!1204) (currentBit!9349 thiss!1204))))))

(declare-fun b!200689 () Bool)

(declare-fun e!137647 () Bool)

(assert (=> b!200689 (= e!137648 e!137647)))

(declare-fun res!168024 () Bool)

(assert (=> b!200689 (=> res!168024 e!137647)))

(assert (=> b!200689 (= res!168024 (= (size!4473 (buf!4974 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200690 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10158 array!10158 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200690 (= e!137647 (arrayBitRangesEq!0 (buf!4974 thiss!1204) (buf!4974 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4473 (buf!4974 thiss!1204)) (currentByte!9354 thiss!1204) (currentBit!9349 thiss!1204))))))

(assert (= (and d!68851 res!168022) b!200688))

(assert (= (and b!200688 res!168023) b!200689))

(assert (= (and b!200689 (not res!168024)) b!200690))

(assert (=> b!200688 m!311395))

(assert (=> b!200688 m!311395))

(assert (=> b!200690 m!311395))

(assert (=> b!200690 m!311395))

(declare-fun m!311413 () Bool)

(assert (=> b!200690 m!311413))

(assert (=> b!200643 d!68851))

(declare-fun d!68861 () Bool)

(assert (=> d!68861 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!313696 () Unit!14248)

(declare-fun choose!11 (BitStream!8054) Unit!14248)

(assert (=> d!68861 (= lt!313696 (choose!11 thiss!1204))))

(assert (=> d!68861 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!313696)))

(declare-fun bs!16963 () Bool)

(assert (= bs!16963 d!68861))

(assert (=> bs!16963 m!311387))

(declare-fun m!311417 () Bool)

(assert (=> bs!16963 m!311417))

(assert (=> b!200643 d!68861))

(declare-fun d!68863 () Bool)

(assert (=> d!68863 (= (array_inv!4214 (buf!4974 thiss!1204)) (bvsge (size!4473 (buf!4974 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200641 d!68863))

(declare-fun d!68865 () Bool)

(assert (=> d!68865 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9349 thiss!1204) (currentByte!9354 thiss!1204) (size!4473 (buf!4974 thiss!1204))))))

(declare-fun bs!16964 () Bool)

(assert (= bs!16964 d!68865))

(assert (=> bs!16964 m!311393))

(assert (=> start!42498 d!68865))

(push 1)

(assert (not b!200690))

(assert (not b!200688))

(assert (not d!68831))

(assert (not d!68865))

(assert (not d!68861))

(assert (not d!68835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

