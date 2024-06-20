; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51902 () Bool)

(assert start!51902)

(declare-fun res!200064 () Bool)

(declare-fun e!166025 () Bool)

(assert (=> start!51902 (=> (not res!200064) (not e!166025))))

(declare-datatypes ((array!13043 0))(
  ( (array!13044 (arr!6701 (Array (_ BitVec 32) (_ BitVec 8))) (size!5714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10350 0))(
  ( (BitStream!10351 (buf!6168 array!13043) (currentByte!11483 (_ BitVec 32)) (currentBit!11478 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10350)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51902 (= res!200064 (validate_offset_bits!1 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11483 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11478 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51902 e!166025))

(declare-fun e!166024 () Bool)

(declare-fun inv!12 (BitStream!10350) Bool)

(assert (=> start!51902 (and (inv!12 thiss!1948) e!166024)))

(declare-fun b!239614 () Bool)

(declare-datatypes ((Unit!17517 0))(
  ( (Unit!17518) )
))
(declare-datatypes ((tuple2!20246 0))(
  ( (tuple2!20247 (_1!11045 Unit!17517) (_2!11045 BitStream!10350)) )
))
(declare-fun lt!374214 () tuple2!20246)

(assert (=> b!239614 (= e!166025 (not (inv!12 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214))))))))

(declare-fun alignToByte!0 (BitStream!10350) tuple2!20246)

(assert (=> b!239614 (= lt!374214 (alignToByte!0 thiss!1948))))

(declare-fun b!239615 () Bool)

(declare-fun array_inv!5455 (array!13043) Bool)

(assert (=> b!239615 (= e!166024 (array_inv!5455 (buf!6168 thiss!1948)))))

(assert (= (and start!51902 res!200064) b!239614))

(assert (= start!51902 b!239615))

(declare-fun m!361877 () Bool)

(assert (=> start!51902 m!361877))

(declare-fun m!361879 () Bool)

(assert (=> start!51902 m!361879))

(declare-fun m!361881 () Bool)

(assert (=> b!239614 m!361881))

(declare-fun m!361883 () Bool)

(assert (=> b!239614 m!361883))

(declare-fun m!361885 () Bool)

(assert (=> b!239615 m!361885))

(check-sat (not b!239614) (not start!51902) (not b!239615))
(check-sat)
(get-model)

(declare-fun d!80994 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80994 (= (inv!12 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (invariant!0 (currentBit!11478 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (currentByte!11483 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (size!5714 (buf!6168 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))))))))

(declare-fun bs!20407 () Bool)

(assert (= bs!20407 d!80994))

(declare-fun m!361897 () Bool)

(assert (=> bs!20407 m!361897))

(assert (=> b!239614 d!80994))

(declare-fun d!80996 () Bool)

(declare-fun e!166039 () Bool)

(assert (=> d!80996 e!166039))

(declare-fun res!200073 () Bool)

(assert (=> d!80996 (=> (not res!200073) (not e!166039))))

(assert (=> d!80996 (= res!200073 (validate_offset_bits!1 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11478 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun Unit!17521 () Unit!17517)

(declare-fun Unit!17522 () Unit!17517)

(assert (=> d!80996 (= (alignToByte!0 thiss!1948) (ite (not (= (currentBit!11478 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20247 Unit!17521 (BitStream!10351 (buf!6168 thiss!1948) (bvadd (currentByte!11483 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20247 Unit!17522 thiss!1948)))))

(declare-fun b!239626 () Bool)

(declare-fun e!166040 () Bool)

(assert (=> b!239626 (= e!166039 e!166040)))

(declare-fun res!200072 () Bool)

(assert (=> b!239626 (=> (not res!200072) (not e!166040))))

(declare-fun lt!374224 () tuple2!20246)

(assert (=> b!239626 (= res!200072 (= (buf!6168 (_2!11045 lt!374224)) (buf!6168 thiss!1948)))))

(declare-fun Unit!17523 () Unit!17517)

(declare-fun Unit!17524 () Unit!17517)

(assert (=> b!239626 (= lt!374224 (ite (not (= (currentBit!11478 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20247 Unit!17523 (BitStream!10351 (buf!6168 thiss!1948) (bvadd (currentByte!11483 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20247 Unit!17524 thiss!1948)))))

(declare-fun b!239627 () Bool)

(declare-fun lt!374225 () (_ BitVec 64))

(declare-fun lt!374226 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239627 (= e!166040 (bvsle (bitIndex!0 (size!5714 (buf!6168 (_2!11045 lt!374224))) (currentByte!11483 (_2!11045 lt!374224)) (currentBit!11478 (_2!11045 lt!374224))) (bvadd lt!374226 lt!374225)))))

(assert (=> b!239627 (or (not (= (bvand lt!374226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374225 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374226 lt!374225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239627 (= lt!374225 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!239627 (= lt!374226 (bitIndex!0 (size!5714 (buf!6168 thiss!1948)) (currentByte!11483 thiss!1948) (currentBit!11478 thiss!1948)))))

(assert (= (and d!80996 res!200073) b!239626))

(assert (= (and b!239626 res!200072) b!239627))

(declare-fun m!361901 () Bool)

(assert (=> d!80996 m!361901))

(declare-fun m!361903 () Bool)

(assert (=> b!239627 m!361903))

(declare-fun m!361905 () Bool)

(assert (=> b!239627 m!361905))

(assert (=> b!239614 d!80996))

(declare-fun d!81004 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81004 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11483 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11478 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11483 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11478 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20409 () Bool)

(assert (= bs!20409 d!81004))

(declare-fun m!361907 () Bool)

(assert (=> bs!20409 m!361907))

(assert (=> start!51902 d!81004))

(declare-fun d!81008 () Bool)

(assert (=> d!81008 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11478 thiss!1948) (currentByte!11483 thiss!1948) (size!5714 (buf!6168 thiss!1948))))))

(declare-fun bs!20410 () Bool)

(assert (= bs!20410 d!81008))

(declare-fun m!361909 () Bool)

(assert (=> bs!20410 m!361909))

(assert (=> start!51902 d!81008))

(declare-fun d!81010 () Bool)

(assert (=> d!81010 (= (array_inv!5455 (buf!6168 thiss!1948)) (bvsge (size!5714 (buf!6168 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239615 d!81010))

(check-sat (not d!81008) (not d!81004) (not b!239627) (not d!80996) (not d!80994))
(check-sat)
(get-model)

(declare-fun d!81024 () Bool)

(assert (=> d!81024 (= (invariant!0 (currentBit!11478 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (currentByte!11483 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (size!5714 (buf!6168 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))))) (and (bvsge (currentBit!11478 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) #b00000000000000000000000000000000) (bvslt (currentBit!11478 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) #b00000000000000000000000000001000) (bvsge (currentByte!11483 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!11483 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (size!5714 (buf!6168 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))))) (and (= (currentBit!11478 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) #b00000000000000000000000000000000) (= (currentByte!11483 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214)))) (size!5714 (buf!6168 (BitStream!10351 (buf!6168 (_2!11045 lt!374214)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11483 (_2!11045 lt!374214))) #b00000000000000000000000000000100)) (currentBit!11478 (_2!11045 lt!374214))))))))))))

(assert (=> d!80994 d!81024))

(declare-fun d!81026 () Bool)

(declare-fun e!166055 () Bool)

(assert (=> d!81026 e!166055))

(declare-fun res!200090 () Bool)

(assert (=> d!81026 (=> (not res!200090) (not e!166055))))

(declare-fun lt!374262 () (_ BitVec 64))

(declare-fun lt!374257 () (_ BitVec 64))

(declare-fun lt!374259 () (_ BitVec 64))

(assert (=> d!81026 (= res!200090 (= lt!374262 (bvsub lt!374257 lt!374259)))))

(assert (=> d!81026 (or (= (bvand lt!374257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374257 lt!374259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81026 (= lt!374259 (remainingBits!0 ((_ sign_extend 32) (size!5714 (buf!6168 (_2!11045 lt!374224)))) ((_ sign_extend 32) (currentByte!11483 (_2!11045 lt!374224))) ((_ sign_extend 32) (currentBit!11478 (_2!11045 lt!374224)))))))

(declare-fun lt!374261 () (_ BitVec 64))

(declare-fun lt!374260 () (_ BitVec 64))

(assert (=> d!81026 (= lt!374257 (bvmul lt!374261 lt!374260))))

(assert (=> d!81026 (or (= lt!374261 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374260 (bvsdiv (bvmul lt!374261 lt!374260) lt!374261)))))

(assert (=> d!81026 (= lt!374260 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81026 (= lt!374261 ((_ sign_extend 32) (size!5714 (buf!6168 (_2!11045 lt!374224)))))))

(assert (=> d!81026 (= lt!374262 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11483 (_2!11045 lt!374224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11478 (_2!11045 lt!374224)))))))

(assert (=> d!81026 (invariant!0 (currentBit!11478 (_2!11045 lt!374224)) (currentByte!11483 (_2!11045 lt!374224)) (size!5714 (buf!6168 (_2!11045 lt!374224))))))

(assert (=> d!81026 (= (bitIndex!0 (size!5714 (buf!6168 (_2!11045 lt!374224))) (currentByte!11483 (_2!11045 lt!374224)) (currentBit!11478 (_2!11045 lt!374224))) lt!374262)))

(declare-fun b!239644 () Bool)

(declare-fun res!200091 () Bool)

(assert (=> b!239644 (=> (not res!200091) (not e!166055))))

(assert (=> b!239644 (= res!200091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374262))))

(declare-fun b!239645 () Bool)

(declare-fun lt!374258 () (_ BitVec 64))

(assert (=> b!239645 (= e!166055 (bvsle lt!374262 (bvmul lt!374258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239645 (or (= lt!374258 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374258 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374258)))))

(assert (=> b!239645 (= lt!374258 ((_ sign_extend 32) (size!5714 (buf!6168 (_2!11045 lt!374224)))))))

(assert (= (and d!81026 res!200090) b!239644))

(assert (= (and b!239644 res!200091) b!239645))

(declare-fun m!361933 () Bool)

(assert (=> d!81026 m!361933))

(declare-fun m!361935 () Bool)

(assert (=> d!81026 m!361935))

(assert (=> b!239627 d!81026))

(declare-fun d!81028 () Bool)

(declare-fun e!166056 () Bool)

(assert (=> d!81028 e!166056))

(declare-fun res!200092 () Bool)

(assert (=> d!81028 (=> (not res!200092) (not e!166056))))

(declare-fun lt!374263 () (_ BitVec 64))

(declare-fun lt!374265 () (_ BitVec 64))

(declare-fun lt!374268 () (_ BitVec 64))

(assert (=> d!81028 (= res!200092 (= lt!374268 (bvsub lt!374263 lt!374265)))))

(assert (=> d!81028 (or (= (bvand lt!374263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374263 lt!374265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81028 (= lt!374265 (remainingBits!0 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948))))))

(declare-fun lt!374267 () (_ BitVec 64))

(declare-fun lt!374266 () (_ BitVec 64))

(assert (=> d!81028 (= lt!374263 (bvmul lt!374267 lt!374266))))

(assert (=> d!81028 (or (= lt!374267 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374266 (bvsdiv (bvmul lt!374267 lt!374266) lt!374267)))))

(assert (=> d!81028 (= lt!374266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81028 (= lt!374267 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))))))

(assert (=> d!81028 (= lt!374268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11483 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11478 thiss!1948))))))

(assert (=> d!81028 (invariant!0 (currentBit!11478 thiss!1948) (currentByte!11483 thiss!1948) (size!5714 (buf!6168 thiss!1948)))))

(assert (=> d!81028 (= (bitIndex!0 (size!5714 (buf!6168 thiss!1948)) (currentByte!11483 thiss!1948) (currentBit!11478 thiss!1948)) lt!374268)))

(declare-fun b!239646 () Bool)

(declare-fun res!200093 () Bool)

(assert (=> b!239646 (=> (not res!200093) (not e!166056))))

(assert (=> b!239646 (= res!200093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374268))))

(declare-fun b!239647 () Bool)

(declare-fun lt!374264 () (_ BitVec 64))

(assert (=> b!239647 (= e!166056 (bvsle lt!374268 (bvmul lt!374264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239647 (or (= lt!374264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374264)))))

(assert (=> b!239647 (= lt!374264 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))))))

(assert (= (and d!81028 res!200092) b!239646))

(assert (= (and b!239646 res!200093) b!239647))

(assert (=> d!81028 m!361907))

(assert (=> d!81028 m!361909))

(assert (=> b!239627 d!81028))

(declare-fun d!81030 () Bool)

(assert (=> d!81030 (= (remainingBits!0 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948))) (bvsub (bvmul ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11483 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11478 thiss!1948)))))))

(assert (=> d!81004 d!81030))

(declare-fun d!81032 () Bool)

(assert (=> d!81032 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11478 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5714 (buf!6168 thiss!1948))) ((_ sign_extend 32) (currentByte!11483 thiss!1948)) ((_ sign_extend 32) (currentBit!11478 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11478 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20416 () Bool)

(assert (= bs!20416 d!81032))

(assert (=> bs!20416 m!361907))

(assert (=> d!80996 d!81032))

(declare-fun d!81034 () Bool)

(assert (=> d!81034 (= (invariant!0 (currentBit!11478 thiss!1948) (currentByte!11483 thiss!1948) (size!5714 (buf!6168 thiss!1948))) (and (bvsge (currentBit!11478 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11478 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11483 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11483 thiss!1948) (size!5714 (buf!6168 thiss!1948))) (and (= (currentBit!11478 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11483 thiss!1948) (size!5714 (buf!6168 thiss!1948)))))))))

(assert (=> d!81008 d!81034))

(check-sat (not d!81028) (not d!81026) (not d!81032))
(check-sat)
