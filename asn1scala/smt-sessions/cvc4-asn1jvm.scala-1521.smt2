; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42546 () Bool)

(assert start!42546)

(declare-fun res!168067 () Bool)

(declare-fun e!137684 () Bool)

(assert (=> start!42546 (=> (not res!168067) (not e!137684))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42546 (= res!168067 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42546 e!137684))

(assert (=> start!42546 true))

(declare-datatypes ((array!10167 0))(
  ( (array!10168 (arr!5406 (Array (_ BitVec 32) (_ BitVec 8))) (size!4476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8060 0))(
  ( (BitStream!8061 (buf!4977 array!10167) (currentByte!9366 (_ BitVec 32)) (currentBit!9361 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8060)

(declare-fun e!137683 () Bool)

(declare-fun inv!12 (BitStream!8060) Bool)

(assert (=> start!42546 (and (inv!12 thiss!1204) e!137683)))

(declare-fun lt!313741 () (_ BitVec 64))

(declare-fun b!200739 () Bool)

(declare-fun lt!313739 () (_ BitVec 64))

(declare-fun e!137681 () Bool)

(assert (=> b!200739 (= e!137681 (not (or (= lt!313739 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!313739 (bvand lt!313741 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!313737 () (_ BitVec 64))

(assert (=> b!200739 (= lt!313739 (bvand lt!313737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isPrefixOf!0 (BitStream!8060 BitStream!8060) Bool)

(assert (=> b!200739 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14254 0))(
  ( (Unit!14255) )
))
(declare-fun lt!313738 () Unit!14254)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8060) Unit!14254)

(assert (=> b!200739 (= lt!313738 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200740 () Bool)

(declare-fun res!168066 () Bool)

(assert (=> b!200740 (=> (not res!168066) (not e!137684))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200740 (= res!168066 (invariant!0 (currentBit!9361 thiss!1204) (currentByte!9366 thiss!1204) (size!4476 (buf!4977 thiss!1204))))))

(declare-fun b!200741 () Bool)

(declare-fun array_inv!4217 (array!10167) Bool)

(assert (=> b!200741 (= e!137683 (array_inv!4217 (buf!4977 thiss!1204)))))

(declare-fun b!200742 () Bool)

(declare-fun res!168065 () Bool)

(assert (=> b!200742 (=> (not res!168065) (not e!137684))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200742 (= res!168065 (validate_offset_bits!1 ((_ sign_extend 32) (size!4476 (buf!4977 thiss!1204))) ((_ sign_extend 32) (currentByte!9366 thiss!1204)) ((_ sign_extend 32) (currentBit!9361 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200743 () Bool)

(declare-fun res!168069 () Bool)

(assert (=> b!200743 (=> (not res!168069) (not e!137684))))

(assert (=> b!200743 (= res!168069 (= i!590 nBits!348))))

(declare-fun b!200744 () Bool)

(assert (=> b!200744 (= e!137684 e!137681)))

(declare-fun res!168068 () Bool)

(assert (=> b!200744 (=> (not res!168068) (not e!137681))))

(declare-fun lt!313740 () (_ BitVec 64))

(assert (=> b!200744 (= res!168068 (= lt!313740 lt!313741))))

(assert (=> b!200744 (= lt!313741 (bvsub lt!313737 ((_ sign_extend 32) i!590)))))

(assert (=> b!200744 (= lt!313737 (bvadd lt!313740 ((_ sign_extend 32) nBits!348)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200744 (= lt!313740 (bitIndex!0 (size!4476 (buf!4977 thiss!1204)) (currentByte!9366 thiss!1204) (currentBit!9361 thiss!1204)))))

(assert (= (and start!42546 res!168067) b!200742))

(assert (= (and b!200742 res!168065) b!200740))

(assert (= (and b!200740 res!168066) b!200743))

(assert (= (and b!200743 res!168069) b!200744))

(assert (= (and b!200744 res!168068) b!200739))

(assert (= start!42546 b!200741))

(declare-fun m!311447 () Bool)

(assert (=> b!200744 m!311447))

(declare-fun m!311449 () Bool)

(assert (=> start!42546 m!311449))

(declare-fun m!311451 () Bool)

(assert (=> b!200741 m!311451))

(declare-fun m!311453 () Bool)

(assert (=> b!200739 m!311453))

(declare-fun m!311455 () Bool)

(assert (=> b!200739 m!311455))

(declare-fun m!311457 () Bool)

(assert (=> b!200740 m!311457))

(declare-fun m!311459 () Bool)

(assert (=> b!200742 m!311459))

(push 1)

(assert (not start!42546))

(assert (not b!200744))

(assert (not b!200739))

(assert (not b!200741))

(assert (not b!200740))

(assert (not b!200742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68879 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68879 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4476 (buf!4977 thiss!1204))) ((_ sign_extend 32) (currentByte!9366 thiss!1204)) ((_ sign_extend 32) (currentBit!9361 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4476 (buf!4977 thiss!1204))) ((_ sign_extend 32) (currentByte!9366 thiss!1204)) ((_ sign_extend 32) (currentBit!9361 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16971 () Bool)

(assert (= bs!16971 d!68879))

(declare-fun m!311465 () Bool)

(assert (=> bs!16971 m!311465))

(assert (=> b!200742 d!68879))

(declare-fun d!68883 () Bool)

(assert (=> d!68883 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9361 thiss!1204) (currentByte!9366 thiss!1204) (size!4476 (buf!4977 thiss!1204))))))

(declare-fun bs!16972 () Bool)

(assert (= bs!16972 d!68883))

(assert (=> bs!16972 m!311457))

(assert (=> start!42546 d!68883))

(declare-fun d!68885 () Bool)

(assert (=> d!68885 (= (array_inv!4217 (buf!4977 thiss!1204)) (bvsge (size!4476 (buf!4977 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200741 d!68885))

(declare-fun d!68889 () Bool)

(assert (=> d!68889 (= (invariant!0 (currentBit!9361 thiss!1204) (currentByte!9366 thiss!1204) (size!4476 (buf!4977 thiss!1204))) (and (bvsge (currentBit!9361 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9361 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9366 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9366 thiss!1204) (size!4476 (buf!4977 thiss!1204))) (and (= (currentBit!9361 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9366 thiss!1204) (size!4476 (buf!4977 thiss!1204)))))))))

(assert (=> b!200740 d!68889))

(declare-fun d!68891 () Bool)

(declare-fun e!137705 () Bool)

(assert (=> d!68891 e!137705))

(declare-fun res!168104 () Bool)

(assert (=> d!68891 (=> (not res!168104) (not e!137705))))

(declare-fun lt!313798 () (_ BitVec 64))

(declare-fun lt!313797 () (_ BitVec 64))

(declare-fun lt!313794 () (_ BitVec 64))

(assert (=> d!68891 (= res!168104 (= lt!313794 (bvsub lt!313797 lt!313798)))))

(assert (=> d!68891 (or (= (bvand lt!313797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313797 lt!313798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68891 (= lt!313798 (remainingBits!0 ((_ sign_extend 32) (size!4476 (buf!4977 thiss!1204))) ((_ sign_extend 32) (currentByte!9366 thiss!1204)) ((_ sign_extend 32) (currentBit!9361 thiss!1204))))))

(declare-fun lt!313796 () (_ BitVec 64))

(declare-fun lt!313795 () (_ BitVec 64))

(assert (=> d!68891 (= lt!313797 (bvmul lt!313796 lt!313795))))

(assert (=> d!68891 (or (= lt!313796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313795 (bvsdiv (bvmul lt!313796 lt!313795) lt!313796)))))

(assert (=> d!68891 (= lt!313795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68891 (= lt!313796 ((_ sign_extend 32) (size!4476 (buf!4977 thiss!1204))))))

(assert (=> d!68891 (= lt!313794 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9366 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9361 thiss!1204))))))

(assert (=> d!68891 (invariant!0 (currentBit!9361 thiss!1204) (currentByte!9366 thiss!1204) (size!4476 (buf!4977 thiss!1204)))))

(assert (=> d!68891 (= (bitIndex!0 (size!4476 (buf!4977 thiss!1204)) (currentByte!9366 thiss!1204) (currentBit!9361 thiss!1204)) lt!313794)))

(declare-fun b!200779 () Bool)

(declare-fun res!168105 () Bool)

(assert (=> b!200779 (=> (not res!168105) (not e!137705))))

(assert (=> b!200779 (= res!168105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313794))))

(declare-fun b!200780 () Bool)

(declare-fun lt!313793 () (_ BitVec 64))

(assert (=> b!200780 (= e!137705 (bvsle lt!313794 (bvmul lt!313793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200780 (or (= lt!313793 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313793 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313793)))))

(assert (=> b!200780 (= lt!313793 ((_ sign_extend 32) (size!4476 (buf!4977 thiss!1204))))))

(assert (= (and d!68891 res!168104) b!200779))

(assert (= (and b!200779 res!168105) b!200780))

(assert (=> d!68891 m!311465))

(assert (=> d!68891 m!311457))

(assert (=> b!200744 d!68891))

(declare-fun d!68905 () Bool)

(declare-fun res!168114 () Bool)

(declare-fun e!137710 () Bool)

(assert (=> d!68905 (=> (not res!168114) (not e!137710))))

(assert (=> d!68905 (= res!168114 (= (size!4476 (buf!4977 thiss!1204)) (size!4476 (buf!4977 thiss!1204))))))

(assert (=> d!68905 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137710)))

(declare-fun b!200787 () Bool)

(declare-fun res!168112 () Bool)

(assert (=> b!200787 (=> (not res!168112) (not e!137710))))

(assert (=> b!200787 (= res!168112 (bvsle (bitIndex!0 (size!4476 (buf!4977 thiss!1204)) (currentByte!9366 thiss!1204) (currentBit!9361 thiss!1204)) (bitIndex!0 (size!4476 (buf!4977 thiss!1204)) (currentByte!9366 thiss!1204) (currentBit!9361 thiss!1204))))))

(declare-fun b!200788 () Bool)

(declare-fun e!137711 () Bool)

(assert (=> b!200788 (= e!137710 e!137711)))

(declare-fun res!168113 () Bool)

(assert (=> b!200788 (=> res!168113 e!137711)))

(assert (=> b!200788 (= res!168113 (= (size!4476 (buf!4977 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200789 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10167 array!10167 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200789 (= e!137711 (arrayBitRangesEq!0 (buf!4977 thiss!1204) (buf!4977 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4476 (buf!4977 thiss!1204)) (currentByte!9366 thiss!1204) (currentBit!9361 thiss!1204))))))

(assert (= (and d!68905 res!168114) b!200787))

(assert (= (and b!200787 res!168112) b!200788))

(assert (= (and b!200788 (not res!168113)) b!200789))

(assert (=> b!200787 m!311447))

(assert (=> b!200787 m!311447))

(assert (=> b!200789 m!311447))

(assert (=> b!200789 m!311447))

(declare-fun m!311475 () Bool)

(assert (=> b!200789 m!311475))

(assert (=> b!200739 d!68905))

(declare-fun d!68909 () Bool)

(assert (=> d!68909 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!313804 () Unit!14254)

(declare-fun choose!11 (BitStream!8060) Unit!14254)

(assert (=> d!68909 (= lt!313804 (choose!11 thiss!1204))))

(assert (=> d!68909 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!313804)))

(declare-fun bs!16979 () Bool)

(assert (= bs!16979 d!68909))

(assert (=> bs!16979 m!311453))

(declare-fun m!311477 () Bool)

(assert (=> bs!16979 m!311477))

(assert (=> b!200739 d!68909))

(push 1)

(assert (not b!200789))

(assert (not d!68883))

(assert (not d!68909))

(assert (not d!68879))

(assert (not d!68891))

(assert (not b!200787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

