; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4414 () Bool)

(assert start!4414)

(declare-fun b!18068 () Bool)

(declare-fun e!11574 () Bool)

(declare-fun e!11576 () Bool)

(assert (=> b!18068 (= e!11574 (not e!11576))))

(declare-fun res!15896 () Bool)

(assert (=> b!18068 (=> res!15896 e!11576)))

(declare-datatypes ((array!1202 0))(
  ( (array!1203 (arr!943 (Array (_ BitVec 32) (_ BitVec 8))) (size!508 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!886 0))(
  ( (BitStream!887 (buf!826 array!1202) (currentByte!2059 (_ BitVec 32)) (currentBit!2054 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!886)

(declare-datatypes ((tuple2!2096 0))(
  ( (tuple2!2097 (_1!1121 array!1202) (_2!1121 BitStream!886)) )
))
(declare-fun lt!26071 () tuple2!2096)

(assert (=> b!18068 (= res!15896 (not (= (currentByte!2059 thiss!1917) (size!508 (buf!826 (_2!1121 lt!26071))))))))

(declare-fun e!11580 () Bool)

(assert (=> b!18068 e!11580))

(declare-fun res!15891 () Bool)

(assert (=> b!18068 (=> (not res!15891) (not e!11580))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18068 (= res!15891 (invariant!0 (currentBit!2054 (_2!1121 lt!26071)) (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071)))))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!886 (_ BitVec 64)) tuple2!2096)

(assert (=> b!18068 (= lt!26071 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!18069 () Bool)

(declare-fun e!11577 () Bool)

(declare-fun e!11575 () Bool)

(assert (=> b!18069 (= e!11577 e!11575)))

(declare-fun res!15894 () Bool)

(assert (=> b!18069 (=> (not res!15894) (not e!11575))))

(assert (=> b!18069 (= res!15894 (and (= (currentBit!2054 (_2!1121 lt!26071)) #b00000000000000000000000000000000) (= (currentBit!2054 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!18070 () Bool)

(assert (=> b!18070 (= e!11575 (invariant!0 (currentBit!2054 thiss!1917) (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071)))))))

(declare-fun res!15893 () Bool)

(assert (=> start!4414 (=> (not res!15893) (not e!11574))))

(assert (=> start!4414 (= res!15893 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4414 e!11574))

(assert (=> start!4414 true))

(declare-fun e!11578 () Bool)

(declare-fun inv!12 (BitStream!886) Bool)

(assert (=> start!4414 (and (inv!12 thiss!1917) e!11578)))

(declare-fun b!18071 () Bool)

(declare-fun res!15892 () Bool)

(assert (=> b!18071 (=> (not res!15892) (not e!11574))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18071 (= res!15892 (validate_offset_bits!1 ((_ sign_extend 32) (size!508 (buf!826 thiss!1917))) ((_ sign_extend 32) (currentByte!2059 thiss!1917)) ((_ sign_extend 32) (currentBit!2054 thiss!1917)) nBits!604))))

(declare-fun b!18072 () Bool)

(declare-fun array_inv!478 (array!1202) Bool)

(assert (=> b!18072 (= e!11578 (array_inv!478 (buf!826 thiss!1917)))))

(declare-fun b!18073 () Bool)

(assert (=> b!18073 (= e!11580 e!11577)))

(declare-fun res!15895 () Bool)

(assert (=> b!18073 (=> res!15895 e!11577)))

(assert (=> b!18073 (= res!15895 (not (= (currentByte!2059 thiss!1917) (size!508 (buf!826 (_2!1121 lt!26071))))))))

(declare-fun b!18074 () Bool)

(assert (=> b!18074 (= e!11576 (inv!12 (BitStream!887 (buf!826 (_2!1121 lt!26071)) (currentByte!2059 thiss!1917) (currentBit!2054 thiss!1917))))))

(assert (= (and start!4414 res!15893) b!18071))

(assert (= (and b!18071 res!15892) b!18068))

(assert (= (and b!18068 res!15891) b!18073))

(assert (= (and b!18073 (not res!15895)) b!18069))

(assert (= (and b!18069 res!15894) b!18070))

(assert (= (and b!18068 (not res!15896)) b!18074))

(assert (= start!4414 b!18072))

(declare-fun m!24415 () Bool)

(assert (=> b!18070 m!24415))

(declare-fun m!24417 () Bool)

(assert (=> b!18072 m!24417))

(declare-fun m!24419 () Bool)

(assert (=> start!4414 m!24419))

(declare-fun m!24421 () Bool)

(assert (=> b!18071 m!24421))

(declare-fun m!24423 () Bool)

(assert (=> b!18074 m!24423))

(declare-fun m!24425 () Bool)

(assert (=> b!18068 m!24425))

(declare-fun m!24427 () Bool)

(assert (=> b!18068 m!24427))

(push 1)

(assert (not b!18071))

(assert (not b!18068))

(assert (not b!18074))

(assert (not b!18072))

(assert (not start!4414))

(assert (not b!18070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5948 () Bool)

(assert (=> d!5948 (= (inv!12 (BitStream!887 (buf!826 (_2!1121 lt!26071)) (currentByte!2059 thiss!1917) (currentBit!2054 thiss!1917))) (invariant!0 (currentBit!2054 (BitStream!887 (buf!826 (_2!1121 lt!26071)) (currentByte!2059 thiss!1917) (currentBit!2054 thiss!1917))) (currentByte!2059 (BitStream!887 (buf!826 (_2!1121 lt!26071)) (currentByte!2059 thiss!1917) (currentBit!2054 thiss!1917))) (size!508 (buf!826 (BitStream!887 (buf!826 (_2!1121 lt!26071)) (currentByte!2059 thiss!1917) (currentBit!2054 thiss!1917))))))))

(declare-fun bs!1689 () Bool)

(assert (= bs!1689 d!5948))

(declare-fun m!24457 () Bool)

(assert (=> bs!1689 m!24457))

(assert (=> b!18074 d!5948))

(declare-fun d!5950 () Bool)

(assert (=> d!5950 (= (invariant!0 (currentBit!2054 (_2!1121 lt!26071)) (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071)))) (and (bvsge (currentBit!2054 (_2!1121 lt!26071)) #b00000000000000000000000000000000) (bvslt (currentBit!2054 (_2!1121 lt!26071)) #b00000000000000000000000000001000) (bvsge (currentByte!2059 (_2!1121 lt!26071)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071)))) (and (= (currentBit!2054 (_2!1121 lt!26071)) #b00000000000000000000000000000000) (= (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071))))))))))

(assert (=> b!18068 d!5950))

(declare-fun b!18127 () Bool)

(declare-fun res!15946 () Bool)

(declare-fun e!11625 () Bool)

(assert (=> b!18127 (=> (not res!15946) (not e!11625))))

(declare-fun lt!26102 () tuple2!2096)

(assert (=> b!18127 (= res!15946 (bvsle (currentByte!2059 thiss!1917) (currentByte!2059 (_2!1121 lt!26102))))))

(declare-fun b!18128 () Bool)

(declare-fun res!15943 () Bool)

(assert (=> b!18128 (=> (not res!15943) (not e!11625))))

(assert (=> b!18128 (= res!15943 (invariant!0 (currentBit!2054 (_2!1121 lt!26102)) (currentByte!2059 (_2!1121 lt!26102)) (size!508 (buf!826 (_2!1121 lt!26102)))))))

(declare-fun d!5952 () Bool)

(assert (=> d!5952 e!11625))

(declare-fun res!15945 () Bool)

(assert (=> d!5952 (=> (not res!15945) (not e!11625))))

(assert (=> d!5952 (= res!15945 (= (buf!826 (_2!1121 lt!26102)) (buf!826 thiss!1917)))))

(declare-datatypes ((Unit!1608 0))(
  ( (Unit!1609) )
))
(declare-datatypes ((tuple3!134 0))(
  ( (tuple3!135 (_1!1124 Unit!1608) (_2!1124 BitStream!886) (_3!73 array!1202)) )
))
(declare-fun lt!26101 () tuple3!134)

(assert (=> d!5952 (= lt!26102 (tuple2!2097 (_3!73 lt!26101) (_2!1124 lt!26101)))))

(declare-fun readBitsLoop!0 (BitStream!886 (_ BitVec 64) array!1202 (_ BitVec 64) (_ BitVec 64)) tuple3!134)

(assert (=> d!5952 (= lt!26101 (readBitsLoop!0 thiss!1917 nBits!604 (array!1203 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5952 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5952 (= (readBits!0 thiss!1917 nBits!604) lt!26102)))

(declare-fun b!18129 () Bool)

(declare-datatypes ((List!201 0))(
  ( (Nil!198) (Cons!197 (h!316 Bool) (t!951 List!201)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!886 array!1202 (_ BitVec 64) (_ BitVec 64)) List!201)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!886 BitStream!886 (_ BitVec 64)) List!201)

(assert (=> b!18129 (= e!11625 (= (byteArrayBitContentToList!0 (_2!1121 lt!26102) (_1!1121 lt!26102) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1121 lt!26102) thiss!1917 nBits!604)))))

(declare-fun b!18130 () Bool)

(declare-fun res!15944 () Bool)

(assert (=> b!18130 (=> (not res!15944) (not e!11625))))

(declare-fun lt!26098 () (_ BitVec 64))

(assert (=> b!18130 (= res!15944 (= (size!508 (_1!1121 lt!26102)) ((_ extract 31 0) lt!26098)))))

(assert (=> b!18130 (and (bvslt lt!26098 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26098 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26097 () (_ BitVec 64))

(declare-fun lt!26100 () (_ BitVec 64))

(assert (=> b!18130 (= lt!26098 (bvsdiv lt!26097 lt!26100))))

(assert (=> b!18130 (and (not (= lt!26100 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26097 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26100 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18130 (= lt!26100 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26099 () (_ BitVec 64))

(declare-fun lt!26096 () (_ BitVec 64))

(assert (=> b!18130 (= lt!26097 (bvsub lt!26099 lt!26096))))

(assert (=> b!18130 (or (= (bvand lt!26099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26096 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26099 lt!26096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18130 (= lt!26096 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26104 () (_ BitVec 64))

(assert (=> b!18130 (= lt!26099 (bvadd nBits!604 lt!26104))))

(assert (=> b!18130 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26104 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18130 (= lt!26104 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18131 () Bool)

(declare-fun res!15947 () Bool)

(assert (=> b!18131 (=> (not res!15947) (not e!11625))))

(declare-fun lt!26103 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18131 (= res!15947 (= (bvadd lt!26103 nBits!604) (bitIndex!0 (size!508 (buf!826 (_2!1121 lt!26102))) (currentByte!2059 (_2!1121 lt!26102)) (currentBit!2054 (_2!1121 lt!26102)))))))

(assert (=> b!18131 (or (not (= (bvand lt!26103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26103 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18131 (= lt!26103 (bitIndex!0 (size!508 (buf!826 thiss!1917)) (currentByte!2059 thiss!1917) (currentBit!2054 thiss!1917)))))

(assert (= (and d!5952 res!15945) b!18131))

(assert (= (and b!18131 res!15947) b!18128))

(assert (= (and b!18128 res!15943) b!18130))

(assert (= (and b!18130 res!15944) b!18127))

(assert (= (and b!18127 res!15946) b!18129))

(declare-fun m!24461 () Bool)

(assert (=> b!18128 m!24461))

(declare-fun m!24463 () Bool)

(assert (=> d!5952 m!24463))

(declare-fun m!24465 () Bool)

(assert (=> b!18129 m!24465))

(declare-fun m!24467 () Bool)

(assert (=> b!18129 m!24467))

(declare-fun m!24469 () Bool)

(assert (=> b!18131 m!24469))

(declare-fun m!24471 () Bool)

(assert (=> b!18131 m!24471))

(assert (=> b!18068 d!5952))

(declare-fun d!5966 () Bool)

(assert (=> d!5966 (= (array_inv!478 (buf!826 thiss!1917)) (bvsge (size!508 (buf!826 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18072 d!5966))

(declare-fun d!5968 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!508 (buf!826 thiss!1917))) ((_ sign_extend 32) (currentByte!2059 thiss!1917)) ((_ sign_extend 32) (currentBit!2054 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!508 (buf!826 thiss!1917))) ((_ sign_extend 32) (currentByte!2059 thiss!1917)) ((_ sign_extend 32) (currentBit!2054 thiss!1917))) nBits!604))))

(declare-fun bs!1691 () Bool)

(assert (= bs!1691 d!5968))

(declare-fun m!24473 () Bool)

(assert (=> bs!1691 m!24473))

(assert (=> b!18071 d!5968))

(declare-fun d!5970 () Bool)

(assert (=> d!5970 (= (invariant!0 (currentBit!2054 thiss!1917) (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071)))) (and (bvsge (currentBit!2054 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2054 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2059 (_2!1121 lt!26071)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071)))) (and (= (currentBit!2054 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2059 (_2!1121 lt!26071)) (size!508 (buf!826 (_2!1121 lt!26071))))))))))

(assert (=> b!18070 d!5970))

(declare-fun d!5972 () Bool)

(assert (=> d!5972 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2054 thiss!1917) (currentByte!2059 thiss!1917) (size!508 (buf!826 thiss!1917))))))

(declare-fun bs!1692 () Bool)

(assert (= bs!1692 d!5972))

(declare-fun m!24475 () Bool)

(assert (=> bs!1692 m!24475))

(assert (=> start!4414 d!5972))

(push 1)

(assert (not d!5968))

(assert (not d!5972))

(assert (not b!18131))

(assert (not b!18129))

(assert (not d!5948))

(assert (not b!18128))

(assert (not d!5952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

