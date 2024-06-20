; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51956 () Bool)

(assert start!51956)

(declare-fun res!200124 () Bool)

(declare-fun e!166108 () Bool)

(assert (=> start!51956 (=> (not res!200124) (not e!166108))))

(declare-datatypes ((array!13058 0))(
  ( (array!13059 (arr!6707 (Array (_ BitVec 32) (_ BitVec 8))) (size!5720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10362 0))(
  ( (BitStream!10363 (buf!6174 array!13058) (currentByte!11501 (_ BitVec 32)) (currentBit!11496 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10362)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51956 (= res!200124 (validate_offset_bits!1 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11501 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11496 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51956 e!166108))

(declare-fun e!166109 () Bool)

(declare-fun inv!12 (BitStream!10362) Bool)

(assert (=> start!51956 (and (inv!12 thiss!1948) e!166109)))

(declare-fun b!239692 () Bool)

(declare-datatypes ((Unit!17541 0))(
  ( (Unit!17542) )
))
(declare-datatypes ((tuple2!20258 0))(
  ( (tuple2!20259 (_1!11051 Unit!17541) (_2!11051 BitStream!10362)) )
))
(declare-fun lt!374331 () tuple2!20258)

(assert (=> b!239692 (= e!166108 (and (= (bvand (currentByte!11501 (_2!11051 lt!374331)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!11501 (_2!11051 lt!374331)) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000011 (currentByte!11501 (_2!11051 lt!374331))) #b10000000000000000000000000000000)))))))

(declare-fun alignToByte!0 (BitStream!10362) tuple2!20258)

(assert (=> b!239692 (= lt!374331 (alignToByte!0 thiss!1948))))

(declare-fun b!239693 () Bool)

(declare-fun array_inv!5461 (array!13058) Bool)

(assert (=> b!239693 (= e!166109 (array_inv!5461 (buf!6174 thiss!1948)))))

(assert (= (and start!51956 res!200124) b!239692))

(assert (= start!51956 b!239693))

(declare-fun m!361977 () Bool)

(assert (=> start!51956 m!361977))

(declare-fun m!361979 () Bool)

(assert (=> start!51956 m!361979))

(declare-fun m!361981 () Bool)

(assert (=> b!239692 m!361981))

(declare-fun m!361983 () Bool)

(assert (=> b!239693 m!361983))

(check-sat (not b!239692) (not b!239693) (not start!51956))
(check-sat)
(get-model)

(declare-fun d!81072 () Bool)

(declare-fun e!166132 () Bool)

(assert (=> d!81072 e!166132))

(declare-fun res!200140 () Bool)

(assert (=> d!81072 (=> (not res!200140) (not e!166132))))

(assert (=> d!81072 (= res!200140 (validate_offset_bits!1 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11496 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun Unit!17549 () Unit!17541)

(declare-fun Unit!17550 () Unit!17541)

(assert (=> d!81072 (= (alignToByte!0 thiss!1948) (ite (not (= (currentBit!11496 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20259 Unit!17549 (BitStream!10363 (buf!6174 thiss!1948) (bvadd (currentByte!11501 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20259 Unit!17550 thiss!1948)))))

(declare-fun b!239712 () Bool)

(declare-fun e!166131 () Bool)

(assert (=> b!239712 (= e!166132 e!166131)))

(declare-fun res!200141 () Bool)

(assert (=> b!239712 (=> (not res!200141) (not e!166131))))

(declare-fun lt!374352 () tuple2!20258)

(assert (=> b!239712 (= res!200141 (= (buf!6174 (_2!11051 lt!374352)) (buf!6174 thiss!1948)))))

(declare-fun Unit!17551 () Unit!17541)

(declare-fun Unit!17552 () Unit!17541)

(assert (=> b!239712 (= lt!374352 (ite (not (= (currentBit!11496 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20259 Unit!17551 (BitStream!10363 (buf!6174 thiss!1948) (bvadd (currentByte!11501 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20259 Unit!17552 thiss!1948)))))

(declare-fun lt!374354 () (_ BitVec 64))

(declare-fun lt!374353 () (_ BitVec 64))

(declare-fun b!239713 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239713 (= e!166131 (bvsle (bitIndex!0 (size!5720 (buf!6174 (_2!11051 lt!374352))) (currentByte!11501 (_2!11051 lt!374352)) (currentBit!11496 (_2!11051 lt!374352))) (bvadd lt!374353 lt!374354)))))

(assert (=> b!239713 (or (not (= (bvand lt!374353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374354 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374353 lt!374354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239713 (= lt!374354 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!239713 (= lt!374353 (bitIndex!0 (size!5720 (buf!6174 thiss!1948)) (currentByte!11501 thiss!1948) (currentBit!11496 thiss!1948)))))

(assert (= (and d!81072 res!200140) b!239712))

(assert (= (and b!239712 res!200141) b!239713))

(declare-fun m!362007 () Bool)

(assert (=> d!81072 m!362007))

(declare-fun m!362009 () Bool)

(assert (=> b!239713 m!362009))

(declare-fun m!362011 () Bool)

(assert (=> b!239713 m!362011))

(assert (=> b!239692 d!81072))

(declare-fun d!81082 () Bool)

(assert (=> d!81082 (= (array_inv!5461 (buf!6174 thiss!1948)) (bvsge (size!5720 (buf!6174 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239693 d!81082))

(declare-fun d!81084 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81084 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11501 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11496 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11501 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11496 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20429 () Bool)

(assert (= bs!20429 d!81084))

(declare-fun m!362013 () Bool)

(assert (=> bs!20429 m!362013))

(assert (=> start!51956 d!81084))

(declare-fun d!81086 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81086 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11496 thiss!1948) (currentByte!11501 thiss!1948) (size!5720 (buf!6174 thiss!1948))))))

(declare-fun bs!20430 () Bool)

(assert (= bs!20430 d!81086))

(declare-fun m!362019 () Bool)

(assert (=> bs!20430 m!362019))

(assert (=> start!51956 d!81086))

(check-sat (not d!81072) (not d!81084) (not d!81086) (not b!239713))
(check-sat)
(get-model)

(declare-fun d!81092 () Bool)

(assert (=> d!81092 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11496 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11496 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20431 () Bool)

(assert (= bs!20431 d!81092))

(assert (=> bs!20431 m!362013))

(assert (=> d!81072 d!81092))

(declare-fun d!81094 () Bool)

(assert (=> d!81094 (= (remainingBits!0 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948))) (bvsub (bvmul ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11501 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11496 thiss!1948)))))))

(assert (=> d!81084 d!81094))

(declare-fun d!81096 () Bool)

(assert (=> d!81096 (= (invariant!0 (currentBit!11496 thiss!1948) (currentByte!11501 thiss!1948) (size!5720 (buf!6174 thiss!1948))) (and (bvsge (currentBit!11496 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11496 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11501 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11501 thiss!1948) (size!5720 (buf!6174 thiss!1948))) (and (= (currentBit!11496 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11501 thiss!1948) (size!5720 (buf!6174 thiss!1948)))))))))

(assert (=> d!81086 d!81096))

(declare-fun d!81098 () Bool)

(declare-fun e!166141 () Bool)

(assert (=> d!81098 e!166141))

(declare-fun res!200153 () Bool)

(assert (=> d!81098 (=> (not res!200153) (not e!166141))))

(declare-fun lt!374387 () (_ BitVec 64))

(declare-fun lt!374384 () (_ BitVec 64))

(declare-fun lt!374385 () (_ BitVec 64))

(assert (=> d!81098 (= res!200153 (= lt!374387 (bvsub lt!374385 lt!374384)))))

(assert (=> d!81098 (or (= (bvand lt!374385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374385 lt!374384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81098 (= lt!374384 (remainingBits!0 ((_ sign_extend 32) (size!5720 (buf!6174 (_2!11051 lt!374352)))) ((_ sign_extend 32) (currentByte!11501 (_2!11051 lt!374352))) ((_ sign_extend 32) (currentBit!11496 (_2!11051 lt!374352)))))))

(declare-fun lt!374388 () (_ BitVec 64))

(declare-fun lt!374389 () (_ BitVec 64))

(assert (=> d!81098 (= lt!374385 (bvmul lt!374388 lt!374389))))

(assert (=> d!81098 (or (= lt!374388 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374389 (bvsdiv (bvmul lt!374388 lt!374389) lt!374388)))))

(assert (=> d!81098 (= lt!374389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81098 (= lt!374388 ((_ sign_extend 32) (size!5720 (buf!6174 (_2!11051 lt!374352)))))))

(assert (=> d!81098 (= lt!374387 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11501 (_2!11051 lt!374352))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11496 (_2!11051 lt!374352)))))))

(assert (=> d!81098 (invariant!0 (currentBit!11496 (_2!11051 lt!374352)) (currentByte!11501 (_2!11051 lt!374352)) (size!5720 (buf!6174 (_2!11051 lt!374352))))))

(assert (=> d!81098 (= (bitIndex!0 (size!5720 (buf!6174 (_2!11051 lt!374352))) (currentByte!11501 (_2!11051 lt!374352)) (currentBit!11496 (_2!11051 lt!374352))) lt!374387)))

(declare-fun b!239722 () Bool)

(declare-fun res!200152 () Bool)

(assert (=> b!239722 (=> (not res!200152) (not e!166141))))

(assert (=> b!239722 (= res!200152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374387))))

(declare-fun b!239723 () Bool)

(declare-fun lt!374386 () (_ BitVec 64))

(assert (=> b!239723 (= e!166141 (bvsle lt!374387 (bvmul lt!374386 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239723 (or (= lt!374386 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374386 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374386)))))

(assert (=> b!239723 (= lt!374386 ((_ sign_extend 32) (size!5720 (buf!6174 (_2!11051 lt!374352)))))))

(assert (= (and d!81098 res!200153) b!239722))

(assert (= (and b!239722 res!200152) b!239723))

(declare-fun m!362023 () Bool)

(assert (=> d!81098 m!362023))

(declare-fun m!362025 () Bool)

(assert (=> d!81098 m!362025))

(assert (=> b!239713 d!81098))

(declare-fun d!81102 () Bool)

(declare-fun e!166142 () Bool)

(assert (=> d!81102 e!166142))

(declare-fun res!200157 () Bool)

(assert (=> d!81102 (=> (not res!200157) (not e!166142))))

(declare-fun lt!374395 () (_ BitVec 64))

(declare-fun lt!374393 () (_ BitVec 64))

(declare-fun lt!374392 () (_ BitVec 64))

(assert (=> d!81102 (= res!200157 (= lt!374395 (bvsub lt!374393 lt!374392)))))

(assert (=> d!81102 (or (= (bvand lt!374393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374393 lt!374392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81102 (= lt!374392 (remainingBits!0 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))) ((_ sign_extend 32) (currentByte!11501 thiss!1948)) ((_ sign_extend 32) (currentBit!11496 thiss!1948))))))

(declare-fun lt!374396 () (_ BitVec 64))

(declare-fun lt!374397 () (_ BitVec 64))

(assert (=> d!81102 (= lt!374393 (bvmul lt!374396 lt!374397))))

(assert (=> d!81102 (or (= lt!374396 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374397 (bvsdiv (bvmul lt!374396 lt!374397) lt!374396)))))

(assert (=> d!81102 (= lt!374397 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81102 (= lt!374396 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))))))

(assert (=> d!81102 (= lt!374395 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11501 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11496 thiss!1948))))))

(assert (=> d!81102 (invariant!0 (currentBit!11496 thiss!1948) (currentByte!11501 thiss!1948) (size!5720 (buf!6174 thiss!1948)))))

(assert (=> d!81102 (= (bitIndex!0 (size!5720 (buf!6174 thiss!1948)) (currentByte!11501 thiss!1948) (currentBit!11496 thiss!1948)) lt!374395)))

(declare-fun b!239728 () Bool)

(declare-fun res!200156 () Bool)

(assert (=> b!239728 (=> (not res!200156) (not e!166142))))

(assert (=> b!239728 (= res!200156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374395))))

(declare-fun b!239729 () Bool)

(declare-fun lt!374394 () (_ BitVec 64))

(assert (=> b!239729 (= e!166142 (bvsle lt!374395 (bvmul lt!374394 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239729 (or (= lt!374394 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374394 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374394)))))

(assert (=> b!239729 (= lt!374394 ((_ sign_extend 32) (size!5720 (buf!6174 thiss!1948))))))

(assert (= (and d!81102 res!200157) b!239728))

(assert (= (and b!239728 res!200156) b!239729))

(assert (=> d!81102 m!362013))

(assert (=> d!81102 m!362019))

(assert (=> b!239713 d!81102))

(check-sat (not d!81102) (not d!81092) (not d!81098))
(check-sat)
