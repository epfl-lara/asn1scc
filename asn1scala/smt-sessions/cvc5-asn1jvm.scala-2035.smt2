; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51954 () Bool)

(assert start!51954)

(declare-fun res!200121 () Bool)

(declare-fun e!166098 () Bool)

(assert (=> start!51954 (=> (not res!200121) (not e!166098))))

(declare-datatypes ((array!13056 0))(
  ( (array!13057 (arr!6706 (Array (_ BitVec 32) (_ BitVec 8))) (size!5719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10360 0))(
  ( (BitStream!10361 (buf!6173 array!13056) (currentByte!11500 (_ BitVec 32)) (currentBit!11495 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10360)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51954 (= res!200121 (validate_offset_bits!1 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11500 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11495 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51954 e!166098))

(declare-fun e!166099 () Bool)

(declare-fun inv!12 (BitStream!10360) Bool)

(assert (=> start!51954 (and (inv!12 thiss!1948) e!166099)))

(declare-fun b!239686 () Bool)

(declare-datatypes ((Unit!17539 0))(
  ( (Unit!17540) )
))
(declare-datatypes ((tuple2!20256 0))(
  ( (tuple2!20257 (_1!11050 Unit!17539) (_2!11050 BitStream!10360)) )
))
(declare-fun lt!374328 () tuple2!20256)

(assert (=> b!239686 (= e!166098 (and (= (bvand (currentByte!11500 (_2!11050 lt!374328)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!11500 (_2!11050 lt!374328)) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000011 (currentByte!11500 (_2!11050 lt!374328))) #b10000000000000000000000000000000)))))))

(declare-fun alignToByte!0 (BitStream!10360) tuple2!20256)

(assert (=> b!239686 (= lt!374328 (alignToByte!0 thiss!1948))))

(declare-fun b!239687 () Bool)

(declare-fun array_inv!5460 (array!13056) Bool)

(assert (=> b!239687 (= e!166099 (array_inv!5460 (buf!6173 thiss!1948)))))

(assert (= (and start!51954 res!200121) b!239686))

(assert (= start!51954 b!239687))

(declare-fun m!361969 () Bool)

(assert (=> start!51954 m!361969))

(declare-fun m!361971 () Bool)

(assert (=> start!51954 m!361971))

(declare-fun m!361973 () Bool)

(assert (=> b!239686 m!361973))

(declare-fun m!361975 () Bool)

(assert (=> b!239687 m!361975))

(push 1)

(assert (not start!51954))

(assert (not b!239686))

(assert (not b!239687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81064 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81064 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11500 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11495 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11500 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11495 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20425 () Bool)

(assert (= bs!20425 d!81064))

(declare-fun m!361993 () Bool)

(assert (=> bs!20425 m!361993))

(assert (=> start!51954 d!81064))

(declare-fun d!81066 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81066 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11495 thiss!1948) (currentByte!11500 thiss!1948) (size!5719 (buf!6173 thiss!1948))))))

(declare-fun bs!20426 () Bool)

(assert (= bs!20426 d!81066))

(declare-fun m!361995 () Bool)

(assert (=> bs!20426 m!361995))

(assert (=> start!51954 d!81066))

(declare-fun d!81068 () Bool)

(declare-fun e!166124 () Bool)

(assert (=> d!81068 e!166124))

(declare-fun res!200133 () Bool)

(assert (=> d!81068 (=> (not res!200133) (not e!166124))))

(assert (=> d!81068 (= res!200133 (validate_offset_bits!1 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11495 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun Unit!17545 () Unit!17539)

(declare-fun Unit!17546 () Unit!17539)

(assert (=> d!81068 (= (alignToByte!0 thiss!1948) (ite (not (= (currentBit!11495 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20257 Unit!17545 (BitStream!10361 (buf!6173 thiss!1948) (bvadd (currentByte!11500 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20257 Unit!17546 thiss!1948)))))

(declare-fun b!239704 () Bool)

(declare-fun e!166123 () Bool)

(assert (=> b!239704 (= e!166124 e!166123)))

(declare-fun res!200132 () Bool)

(assert (=> b!239704 (=> (not res!200132) (not e!166123))))

(declare-fun lt!374343 () tuple2!20256)

(assert (=> b!239704 (= res!200132 (= (buf!6173 (_2!11050 lt!374343)) (buf!6173 thiss!1948)))))

(declare-fun Unit!17547 () Unit!17539)

(declare-fun Unit!17548 () Unit!17539)

(assert (=> b!239704 (= lt!374343 (ite (not (= (currentBit!11495 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20257 Unit!17547 (BitStream!10361 (buf!6173 thiss!1948) (bvadd (currentByte!11500 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20257 Unit!17548 thiss!1948)))))

(declare-fun lt!374341 () (_ BitVec 64))

(declare-fun b!239705 () Bool)

(declare-fun lt!374342 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239705 (= e!166123 (bvsle (bitIndex!0 (size!5719 (buf!6173 (_2!11050 lt!374343))) (currentByte!11500 (_2!11050 lt!374343)) (currentBit!11495 (_2!11050 lt!374343))) (bvadd lt!374342 lt!374341)))))

(assert (=> b!239705 (or (not (= (bvand lt!374342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374341 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374342 lt!374341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239705 (= lt!374341 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!239705 (= lt!374342 (bitIndex!0 (size!5719 (buf!6173 thiss!1948)) (currentByte!11500 thiss!1948) (currentBit!11495 thiss!1948)))))

(assert (= (and d!81068 res!200133) b!239704))

(assert (= (and b!239704 res!200132) b!239705))

(declare-fun m!362001 () Bool)

(assert (=> d!81068 m!362001))

(declare-fun m!362003 () Bool)

(assert (=> b!239705 m!362003))

(declare-fun m!362005 () Bool)

(assert (=> b!239705 m!362005))

(assert (=> b!239686 d!81068))

(declare-fun d!81080 () Bool)

(assert (=> d!81080 (= (array_inv!5460 (buf!6173 thiss!1948)) (bvsge (size!5719 (buf!6173 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239687 d!81080))

(push 1)

(assert (not d!81066))

(assert (not b!239705))

(assert (not d!81064))

(assert (not d!81068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81088 () Bool)

(assert (=> d!81088 (= (invariant!0 (currentBit!11495 thiss!1948) (currentByte!11500 thiss!1948) (size!5719 (buf!6173 thiss!1948))) (and (bvsge (currentBit!11495 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11495 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11500 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11500 thiss!1948) (size!5719 (buf!6173 thiss!1948))) (and (= (currentBit!11495 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11500 thiss!1948) (size!5719 (buf!6173 thiss!1948)))))))))

(assert (=> d!81066 d!81088))

(declare-fun d!81090 () Bool)

(declare-fun e!166143 () Bool)

(assert (=> d!81090 e!166143))

(declare-fun res!200158 () Bool)

(assert (=> d!81090 (=> (not res!200158) (not e!166143))))

(declare-fun lt!374401 () (_ BitVec 64))

(declare-fun lt!374402 () (_ BitVec 64))

(declare-fun lt!374403 () (_ BitVec 64))

(assert (=> d!81090 (= res!200158 (= lt!374402 (bvsub lt!374403 lt!374401)))))

(assert (=> d!81090 (or (= (bvand lt!374403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374403 lt!374401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81090 (= lt!374401 (remainingBits!0 ((_ sign_extend 32) (size!5719 (buf!6173 (_2!11050 lt!374343)))) ((_ sign_extend 32) (currentByte!11500 (_2!11050 lt!374343))) ((_ sign_extend 32) (currentBit!11495 (_2!11050 lt!374343)))))))

(declare-fun lt!374398 () (_ BitVec 64))

(declare-fun lt!374400 () (_ BitVec 64))

(assert (=> d!81090 (= lt!374403 (bvmul lt!374398 lt!374400))))

(assert (=> d!81090 (or (= lt!374398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374400 (bvsdiv (bvmul lt!374398 lt!374400) lt!374398)))))

(assert (=> d!81090 (= lt!374400 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81090 (= lt!374398 ((_ sign_extend 32) (size!5719 (buf!6173 (_2!11050 lt!374343)))))))

(assert (=> d!81090 (= lt!374402 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11500 (_2!11050 lt!374343))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11495 (_2!11050 lt!374343)))))))

(assert (=> d!81090 (invariant!0 (currentBit!11495 (_2!11050 lt!374343)) (currentByte!11500 (_2!11050 lt!374343)) (size!5719 (buf!6173 (_2!11050 lt!374343))))))

(assert (=> d!81090 (= (bitIndex!0 (size!5719 (buf!6173 (_2!11050 lt!374343))) (currentByte!11500 (_2!11050 lt!374343)) (currentBit!11495 (_2!11050 lt!374343))) lt!374402)))

(declare-fun b!239730 () Bool)

(declare-fun res!200159 () Bool)

(assert (=> b!239730 (=> (not res!200159) (not e!166143))))

(assert (=> b!239730 (= res!200159 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374402))))

(declare-fun b!239731 () Bool)

(declare-fun lt!374399 () (_ BitVec 64))

(assert (=> b!239731 (= e!166143 (bvsle lt!374402 (bvmul lt!374399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239731 (or (= lt!374399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374399)))))

(assert (=> b!239731 (= lt!374399 ((_ sign_extend 32) (size!5719 (buf!6173 (_2!11050 lt!374343)))))))

(assert (= (and d!81090 res!200158) b!239730))

(assert (= (and b!239730 res!200159) b!239731))

(declare-fun m!362027 () Bool)

(assert (=> d!81090 m!362027))

(declare-fun m!362029 () Bool)

(assert (=> d!81090 m!362029))

(assert (=> b!239705 d!81090))

(declare-fun d!81106 () Bool)

(declare-fun e!166144 () Bool)

(assert (=> d!81106 e!166144))

(declare-fun res!200160 () Bool)

(assert (=> d!81106 (=> (not res!200160) (not e!166144))))

(declare-fun lt!374407 () (_ BitVec 64))

(declare-fun lt!374408 () (_ BitVec 64))

(declare-fun lt!374409 () (_ BitVec 64))

(assert (=> d!81106 (= res!200160 (= lt!374408 (bvsub lt!374409 lt!374407)))))

(assert (=> d!81106 (or (= (bvand lt!374409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374409 lt!374407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81106 (= lt!374407 (remainingBits!0 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948))))))

(declare-fun lt!374404 () (_ BitVec 64))

(declare-fun lt!374406 () (_ BitVec 64))

(assert (=> d!81106 (= lt!374409 (bvmul lt!374404 lt!374406))))

(assert (=> d!81106 (or (= lt!374404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374406 (bvsdiv (bvmul lt!374404 lt!374406) lt!374404)))))

(assert (=> d!81106 (= lt!374406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81106 (= lt!374404 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))))))

(assert (=> d!81106 (= lt!374408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11500 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11495 thiss!1948))))))

(assert (=> d!81106 (invariant!0 (currentBit!11495 thiss!1948) (currentByte!11500 thiss!1948) (size!5719 (buf!6173 thiss!1948)))))

(assert (=> d!81106 (= (bitIndex!0 (size!5719 (buf!6173 thiss!1948)) (currentByte!11500 thiss!1948) (currentBit!11495 thiss!1948)) lt!374408)))

(declare-fun b!239732 () Bool)

(declare-fun res!200161 () Bool)

(assert (=> b!239732 (=> (not res!200161) (not e!166144))))

(assert (=> b!239732 (= res!200161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374408))))

(declare-fun b!239733 () Bool)

(declare-fun lt!374405 () (_ BitVec 64))

(assert (=> b!239733 (= e!166144 (bvsle lt!374408 (bvmul lt!374405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239733 (or (= lt!374405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374405)))))

(assert (=> b!239733 (= lt!374405 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))))))

(assert (= (and d!81106 res!200160) b!239732))

(assert (= (and b!239732 res!200161) b!239733))

(assert (=> d!81106 m!361993))

(assert (=> d!81106 m!361995))

(assert (=> b!239705 d!81106))

(declare-fun d!81108 () Bool)

(assert (=> d!81108 (= (remainingBits!0 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948))) (bvsub (bvmul ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11500 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11495 thiss!1948)))))))

(assert (=> d!81064 d!81108))

(declare-fun d!81112 () Bool)

(assert (=> d!81112 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11495 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5719 (buf!6173 thiss!1948))) ((_ sign_extend 32) (currentByte!11500 thiss!1948)) ((_ sign_extend 32) (currentBit!11495 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11495 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20432 () Bool)

(assert (= bs!20432 d!81112))

(assert (=> bs!20432 m!361993))

(assert (=> d!81068 d!81112))

(push 1)

(assert (not d!81090))

(assert (not d!81106))

(assert (not d!81112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

