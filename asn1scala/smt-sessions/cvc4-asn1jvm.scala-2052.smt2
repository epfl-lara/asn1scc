; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52298 () Bool)

(assert start!52298)

(declare-fun b!240789 () Bool)

(declare-fun res!201013 () Bool)

(declare-fun e!166874 () Bool)

(assert (=> b!240789 (=> (not res!201013) (not e!166874))))

(declare-datatypes ((array!13178 0))(
  ( (array!13179 (arr!6759 (Array (_ BitVec 32) (_ BitVec 8))) (size!5772 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10466 0))(
  ( (BitStream!10467 (buf!6235 array!13178) (currentByte!11592 (_ BitVec 32)) (currentBit!11587 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10466)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240789 (= res!201013 (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) nBits!288))))

(declare-fun b!240790 () Bool)

(declare-fun res!201015 () Bool)

(declare-fun e!166875 () Bool)

(assert (=> b!240790 (=> (not res!201015) (not e!166875))))

(declare-datatypes ((Unit!17642 0))(
  ( (Unit!17643) )
))
(declare-datatypes ((tuple2!20472 0))(
  ( (tuple2!20473 (_1!11158 Unit!17642) (_2!11158 BitStream!10466)) )
))
(declare-fun lt!376129 () tuple2!20472)

(declare-fun isPrefixOf!0 (BitStream!10466 BitStream!10466) Bool)

(assert (=> b!240790 (= res!201015 (isPrefixOf!0 thiss!982 (_2!11158 lt!376129)))))

(declare-fun b!240791 () Bool)

(declare-fun e!166877 () Bool)

(declare-fun array_inv!5513 (array!13178) Bool)

(assert (=> b!240791 (= e!166877 (array_inv!5513 (buf!6235 thiss!982)))))

(declare-fun lt!376134 () (_ BitVec 64))

(declare-fun lt!376130 () (_ BitVec 64))

(declare-fun b!240792 () Bool)

(assert (=> b!240792 (= e!166874 (not (or (not (= lt!376134 (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!376134 (bvand (bvadd lt!376130 nBits!288) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!240792 (= lt!376134 (bvand lt!376130 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240792 (= lt!376130 (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)))))

(assert (=> b!240792 e!166875))

(declare-fun res!201011 () Bool)

(assert (=> b!240792 (=> (not res!201011) (not e!166875))))

(assert (=> b!240792 (= res!201011 (= (size!5772 (buf!6235 thiss!982)) (size!5772 (buf!6235 (_2!11158 lt!376129)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10466 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20472)

(assert (=> b!240792 (= lt!376129 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240793 () Bool)

(declare-datatypes ((tuple2!20474 0))(
  ( (tuple2!20475 (_1!11159 BitStream!10466) (_2!11159 Bool)) )
))
(declare-fun lt!376132 () tuple2!20474)

(declare-datatypes ((tuple2!20476 0))(
  ( (tuple2!20477 (_1!11160 BitStream!10466) (_2!11160 BitStream!10466)) )
))
(declare-fun lt!376131 () tuple2!20476)

(assert (=> b!240793 (= e!166875 (not (or (not (_2!11159 lt!376132)) (not (= (_1!11159 lt!376132) (_2!11160 lt!376131))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10466 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20474)

(assert (=> b!240793 (= lt!376132 (checkBitsLoopPure!0 (_1!11160 lt!376131) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240793 (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) nBits!288)))

(declare-fun lt!376133 () Unit!17642)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10466 array!13178 (_ BitVec 64)) Unit!17642)

(assert (=> b!240793 (= lt!376133 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6235 (_2!11158 lt!376129)) nBits!288))))

(declare-fun reader!0 (BitStream!10466 BitStream!10466) tuple2!20476)

(assert (=> b!240793 (= lt!376131 (reader!0 thiss!982 (_2!11158 lt!376129)))))

(declare-fun res!201012 () Bool)

(assert (=> start!52298 (=> (not res!201012) (not e!166874))))

(assert (=> start!52298 (= res!201012 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52298 e!166874))

(assert (=> start!52298 true))

(declare-fun inv!12 (BitStream!10466) Bool)

(assert (=> start!52298 (and (inv!12 thiss!982) e!166877)))

(declare-fun b!240794 () Bool)

(declare-fun res!201014 () Bool)

(assert (=> b!240794 (=> (not res!201014) (not e!166875))))

(assert (=> b!240794 (= res!201014 (= (bitIndex!0 (size!5772 (buf!6235 (_2!11158 lt!376129))) (currentByte!11592 (_2!11158 lt!376129)) (currentBit!11587 (_2!11158 lt!376129))) (bvadd (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)) nBits!288)))))

(assert (= (and start!52298 res!201012) b!240789))

(assert (= (and b!240789 res!201013) b!240792))

(assert (= (and b!240792 res!201011) b!240794))

(assert (= (and b!240794 res!201014) b!240790))

(assert (= (and b!240790 res!201015) b!240793))

(assert (= start!52298 b!240791))

(declare-fun m!363383 () Bool)

(assert (=> b!240789 m!363383))

(declare-fun m!363385 () Bool)

(assert (=> start!52298 m!363385))

(declare-fun m!363387 () Bool)

(assert (=> b!240790 m!363387))

(declare-fun m!363389 () Bool)

(assert (=> b!240791 m!363389))

(declare-fun m!363391 () Bool)

(assert (=> b!240793 m!363391))

(declare-fun m!363393 () Bool)

(assert (=> b!240793 m!363393))

(declare-fun m!363395 () Bool)

(assert (=> b!240793 m!363395))

(declare-fun m!363397 () Bool)

(assert (=> b!240793 m!363397))

(declare-fun m!363399 () Bool)

(assert (=> b!240794 m!363399))

(declare-fun m!363401 () Bool)

(assert (=> b!240794 m!363401))

(assert (=> b!240792 m!363401))

(declare-fun m!363403 () Bool)

(assert (=> b!240792 m!363403))

(push 1)

(assert (not b!240790))

(assert (not b!240791))

(assert (not b!240793))

(assert (not start!52298))

(assert (not b!240789))

(assert (not b!240792))

(assert (not b!240794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81392 () Bool)

(assert (=> d!81392 (= (array_inv!5513 (buf!6235 thiss!982)) (bvsge (size!5772 (buf!6235 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240791 d!81392))

(declare-fun d!81394 () Bool)

(declare-fun e!166883 () Bool)

(assert (=> d!81394 e!166883))

(declare-fun res!201026 () Bool)

(assert (=> d!81394 (=> (not res!201026) (not e!166883))))

(declare-fun lt!376170 () (_ BitVec 64))

(declare-fun lt!376169 () (_ BitVec 64))

(declare-fun lt!376166 () (_ BitVec 64))

(assert (=> d!81394 (= res!201026 (= lt!376166 (bvsub lt!376170 lt!376169)))))

(assert (=> d!81394 (or (= (bvand lt!376170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376169 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376170 lt!376169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81394 (= lt!376169 (remainingBits!0 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982))))))

(declare-fun lt!376165 () (_ BitVec 64))

(declare-fun lt!376167 () (_ BitVec 64))

(assert (=> d!81394 (= lt!376170 (bvmul lt!376165 lt!376167))))

(assert (=> d!81394 (or (= lt!376165 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376167 (bvsdiv (bvmul lt!376165 lt!376167) lt!376165)))))

(assert (=> d!81394 (= lt!376167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81394 (= lt!376165 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))))))

(assert (=> d!81394 (= lt!376166 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11592 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11587 thiss!982))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81394 (invariant!0 (currentBit!11587 thiss!982) (currentByte!11592 thiss!982) (size!5772 (buf!6235 thiss!982)))))

(assert (=> d!81394 (= (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)) lt!376166)))

(declare-fun b!240805 () Bool)

(declare-fun res!201027 () Bool)

(assert (=> b!240805 (=> (not res!201027) (not e!166883))))

(assert (=> b!240805 (= res!201027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376166))))

(declare-fun b!240806 () Bool)

(declare-fun lt!376168 () (_ BitVec 64))

(assert (=> b!240806 (= e!166883 (bvsle lt!376166 (bvmul lt!376168 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240806 (or (= lt!376168 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376168 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376168)))))

(assert (=> b!240806 (= lt!376168 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))))))

(assert (= (and d!81394 res!201026) b!240805))

(assert (= (and b!240805 res!201027) b!240806))

(declare-fun m!363409 () Bool)

(assert (=> d!81394 m!363409))

(declare-fun m!363411 () Bool)

(assert (=> d!81394 m!363411))

(assert (=> b!240792 d!81394))

(declare-fun b!240846 () Bool)

(declare-fun e!166901 () Bool)

(declare-fun lt!376290 () tuple2!20474)

(declare-fun lt!376289 () tuple2!20476)

(assert (=> b!240846 (= e!166901 (and (_2!11159 lt!376290) (= (_1!11159 lt!376290) (_2!11160 lt!376289))))))

(assert (=> b!240846 (= lt!376290 (checkBitsLoopPure!0 (_1!11160 lt!376289) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376294 () Unit!17642)

(declare-fun lt!376292 () Unit!17642)

(assert (=> b!240846 (= lt!376294 lt!376292)))

(declare-fun lt!376295 () tuple2!20472)

(declare-fun lt!376288 () (_ BitVec 64))

(assert (=> b!240846 (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376295)))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) lt!376288)))

(assert (=> b!240846 (= lt!376292 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6235 (_2!11158 lt!376295)) lt!376288))))

(declare-fun e!166902 () Bool)

(assert (=> b!240846 e!166902))

(declare-fun res!201061 () Bool)

(assert (=> b!240846 (=> (not res!201061) (not e!166902))))

(assert (=> b!240846 (= res!201061 (and (= (size!5772 (buf!6235 thiss!982)) (size!5772 (buf!6235 (_2!11158 lt!376295)))) (bvsge lt!376288 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240846 (= lt!376288 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240846 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240846 (= lt!376289 (reader!0 thiss!982 (_2!11158 lt!376295)))))

(declare-fun b!240844 () Bool)

(declare-fun res!201060 () Bool)

(assert (=> b!240844 (=> (not res!201060) (not e!166901))))

(declare-fun lt!376291 () (_ BitVec 64))

(declare-fun lt!376293 () (_ BitVec 64))

(assert (=> b!240844 (= res!201060 (= (bitIndex!0 (size!5772 (buf!6235 (_2!11158 lt!376295))) (currentByte!11592 (_2!11158 lt!376295)) (currentBit!11587 (_2!11158 lt!376295))) (bvadd lt!376291 lt!376293)))))

(assert (=> b!240844 (or (not (= (bvand lt!376291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376293 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!376291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!376291 lt!376293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240844 (= lt!376293 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240844 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240844 (= lt!376291 (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)))))

(declare-fun b!240845 () Bool)

(declare-fun res!201062 () Bool)

(assert (=> b!240845 (=> (not res!201062) (not e!166901))))

(assert (=> b!240845 (= res!201062 (isPrefixOf!0 thiss!982 (_2!11158 lt!376295)))))

(declare-fun b!240847 () Bool)

(assert (=> b!240847 (= e!166902 (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) lt!376288))))

(declare-fun d!81400 () Bool)

(assert (=> d!81400 e!166901))

(declare-fun res!201059 () Bool)

(assert (=> d!81400 (=> (not res!201059) (not e!166901))))

(assert (=> d!81400 (= res!201059 (= (size!5772 (buf!6235 thiss!982)) (size!5772 (buf!6235 (_2!11158 lt!376295)))))))

(declare-fun choose!51 (BitStream!10466 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20472)

(assert (=> d!81400 (= lt!376295 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81400 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81400 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376295)))

(assert (= (and d!81400 res!201059) b!240844))

(assert (= (and b!240844 res!201060) b!240845))

(assert (= (and b!240845 res!201062) b!240846))

(assert (= (and b!240846 res!201061) b!240847))

(declare-fun m!363477 () Bool)

(assert (=> b!240844 m!363477))

(assert (=> b!240844 m!363401))

(declare-fun m!363479 () Bool)

(assert (=> d!81400 m!363479))

(declare-fun m!363481 () Bool)

(assert (=> b!240847 m!363481))

(declare-fun m!363483 () Bool)

(assert (=> b!240845 m!363483))

(declare-fun m!363485 () Bool)

(assert (=> b!240846 m!363485))

(declare-fun m!363487 () Bool)

(assert (=> b!240846 m!363487))

(declare-fun m!363489 () Bool)

(assert (=> b!240846 m!363489))

(declare-fun m!363491 () Bool)

(assert (=> b!240846 m!363491))

(assert (=> b!240792 d!81400))

(declare-fun d!81422 () Bool)

(declare-fun e!166905 () Bool)

(assert (=> d!81422 e!166905))

(declare-fun res!201067 () Bool)

(assert (=> d!81422 (=> (not res!201067) (not e!166905))))

(declare-fun lt!376310 () (_ BitVec 64))

(declare-fun lt!376314 () (_ BitVec 64))

(declare-fun lt!376313 () (_ BitVec 64))

(assert (=> d!81422 (= res!201067 (= lt!376310 (bvsub lt!376314 lt!376313)))))

(assert (=> d!81422 (or (= (bvand lt!376314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376314 lt!376313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81422 (= lt!376313 (remainingBits!0 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))) ((_ sign_extend 32) (currentByte!11592 (_2!11158 lt!376129))) ((_ sign_extend 32) (currentBit!11587 (_2!11158 lt!376129)))))))

(declare-fun lt!376309 () (_ BitVec 64))

(declare-fun lt!376311 () (_ BitVec 64))

(assert (=> d!81422 (= lt!376314 (bvmul lt!376309 lt!376311))))

(assert (=> d!81422 (or (= lt!376309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376311 (bvsdiv (bvmul lt!376309 lt!376311) lt!376309)))))

(assert (=> d!81422 (= lt!376311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81422 (= lt!376309 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))))))

(assert (=> d!81422 (= lt!376310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11592 (_2!11158 lt!376129))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11587 (_2!11158 lt!376129)))))))

(assert (=> d!81422 (invariant!0 (currentBit!11587 (_2!11158 lt!376129)) (currentByte!11592 (_2!11158 lt!376129)) (size!5772 (buf!6235 (_2!11158 lt!376129))))))

(assert (=> d!81422 (= (bitIndex!0 (size!5772 (buf!6235 (_2!11158 lt!376129))) (currentByte!11592 (_2!11158 lt!376129)) (currentBit!11587 (_2!11158 lt!376129))) lt!376310)))

(declare-fun b!240852 () Bool)

(declare-fun res!201068 () Bool)

(assert (=> b!240852 (=> (not res!201068) (not e!166905))))

(assert (=> b!240852 (= res!201068 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376310))))

(declare-fun b!240853 () Bool)

(declare-fun lt!376312 () (_ BitVec 64))

(assert (=> b!240853 (= e!166905 (bvsle lt!376310 (bvmul lt!376312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240853 (or (= lt!376312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376312)))))

(assert (=> b!240853 (= lt!376312 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))))))

(assert (= (and d!81422 res!201067) b!240852))

(assert (= (and b!240852 res!201068) b!240853))

(declare-fun m!363493 () Bool)

(assert (=> d!81422 m!363493))

(declare-fun m!363495 () Bool)

(assert (=> d!81422 m!363495))

(assert (=> b!240794 d!81422))

(assert (=> b!240794 d!81394))

(declare-fun d!81424 () Bool)

(declare-datatypes ((tuple2!20482 0))(
  ( (tuple2!20483 (_1!11163 Bool) (_2!11163 BitStream!10466)) )
))
(declare-fun lt!376329 () tuple2!20482)

(declare-fun checkBitsLoop!0 (BitStream!10466 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20482)

(assert (=> d!81424 (= lt!376329 (checkBitsLoop!0 (_1!11160 lt!376131) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81424 (= (checkBitsLoopPure!0 (_1!11160 lt!376131) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20475 (_2!11163 lt!376329) (_1!11163 lt!376329)))))

(declare-fun bs!20544 () Bool)

(assert (= bs!20544 d!81424))

(declare-fun m!363503 () Bool)

(assert (=> bs!20544 m!363503))

(assert (=> b!240793 d!81424))

(declare-fun d!81430 () Bool)

(assert (=> d!81430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982))) nBits!288))))

(declare-fun bs!20545 () Bool)

(assert (= bs!20545 d!81430))

(declare-fun m!363505 () Bool)

(assert (=> bs!20545 m!363505))

(assert (=> b!240793 d!81430))

(declare-fun d!81432 () Bool)

(assert (=> d!81432 (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 (_2!11158 lt!376129)))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) nBits!288)))

(declare-fun lt!376332 () Unit!17642)

(declare-fun choose!9 (BitStream!10466 array!13178 (_ BitVec 64) BitStream!10466) Unit!17642)

(assert (=> d!81432 (= lt!376332 (choose!9 thiss!982 (buf!6235 (_2!11158 lt!376129)) nBits!288 (BitStream!10467 (buf!6235 (_2!11158 lt!376129)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982))))))

(assert (=> d!81432 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6235 (_2!11158 lt!376129)) nBits!288) lt!376332)))

(declare-fun bs!20546 () Bool)

(assert (= bs!20546 d!81432))

(assert (=> bs!20546 m!363393))

(declare-fun m!363507 () Bool)

(assert (=> bs!20546 m!363507))

(assert (=> b!240793 d!81432))

(declare-fun b!240892 () Bool)

(declare-fun e!166924 () Unit!17642)

(declare-fun lt!376434 () Unit!17642)

(assert (=> b!240892 (= e!166924 lt!376434)))

(declare-fun lt!376435 () (_ BitVec 64))

(assert (=> b!240892 (= lt!376435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376438 () (_ BitVec 64))

(assert (=> b!240892 (= lt!376438 (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13178 array!13178 (_ BitVec 64) (_ BitVec 64)) Unit!17642)

(assert (=> b!240892 (= lt!376434 (arrayBitRangesEqSymmetric!0 (buf!6235 thiss!982) (buf!6235 (_2!11158 lt!376129)) lt!376435 lt!376438))))

(declare-fun arrayBitRangesEq!0 (array!13178 array!13178 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240892 (arrayBitRangesEq!0 (buf!6235 (_2!11158 lt!376129)) (buf!6235 thiss!982) lt!376435 lt!376438)))

(declare-fun lt!376446 () tuple2!20476)

(declare-fun lt!376437 () (_ BitVec 64))

(declare-fun lt!376452 () (_ BitVec 64))

(declare-fun b!240893 () Bool)

(declare-fun e!166925 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10466 (_ BitVec 64)) BitStream!10466)

(assert (=> b!240893 (= e!166925 (= (_1!11160 lt!376446) (withMovedBitIndex!0 (_2!11160 lt!376446) (bvsub lt!376452 lt!376437))))))

(assert (=> b!240893 (or (= (bvand lt!376452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376452 lt!376437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240893 (= lt!376437 (bitIndex!0 (size!5772 (buf!6235 (_2!11158 lt!376129))) (currentByte!11592 (_2!11158 lt!376129)) (currentBit!11587 (_2!11158 lt!376129))))))

(assert (=> b!240893 (= lt!376452 (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)))))

(declare-fun b!240894 () Bool)

(declare-fun res!201099 () Bool)

(assert (=> b!240894 (=> (not res!201099) (not e!166925))))

(assert (=> b!240894 (= res!201099 (isPrefixOf!0 (_1!11160 lt!376446) thiss!982))))

(declare-fun d!81434 () Bool)

(assert (=> d!81434 e!166925))

(declare-fun res!201098 () Bool)

(assert (=> d!81434 (=> (not res!201098) (not e!166925))))

(assert (=> d!81434 (= res!201098 (isPrefixOf!0 (_1!11160 lt!376446) (_2!11160 lt!376446)))))

(declare-fun lt!376450 () BitStream!10466)

(assert (=> d!81434 (= lt!376446 (tuple2!20477 lt!376450 (_2!11158 lt!376129)))))

(declare-fun lt!376443 () Unit!17642)

(declare-fun lt!376433 () Unit!17642)

(assert (=> d!81434 (= lt!376443 lt!376433)))

(assert (=> d!81434 (isPrefixOf!0 lt!376450 (_2!11158 lt!376129))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10466 BitStream!10466 BitStream!10466) Unit!17642)

(assert (=> d!81434 (= lt!376433 (lemmaIsPrefixTransitive!0 lt!376450 (_2!11158 lt!376129) (_2!11158 lt!376129)))))

(declare-fun lt!376447 () Unit!17642)

(declare-fun lt!376448 () Unit!17642)

(assert (=> d!81434 (= lt!376447 lt!376448)))

(assert (=> d!81434 (isPrefixOf!0 lt!376450 (_2!11158 lt!376129))))

(assert (=> d!81434 (= lt!376448 (lemmaIsPrefixTransitive!0 lt!376450 thiss!982 (_2!11158 lt!376129)))))

(declare-fun lt!376439 () Unit!17642)

(assert (=> d!81434 (= lt!376439 e!166924)))

(declare-fun c!11440 () Bool)

(assert (=> d!81434 (= c!11440 (not (= (size!5772 (buf!6235 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!376436 () Unit!17642)

(declare-fun lt!376449 () Unit!17642)

(assert (=> d!81434 (= lt!376436 lt!376449)))

(assert (=> d!81434 (isPrefixOf!0 (_2!11158 lt!376129) (_2!11158 lt!376129))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10466) Unit!17642)

(assert (=> d!81434 (= lt!376449 (lemmaIsPrefixRefl!0 (_2!11158 lt!376129)))))

(declare-fun lt!376440 () Unit!17642)

(declare-fun lt!376451 () Unit!17642)

(assert (=> d!81434 (= lt!376440 lt!376451)))

(assert (=> d!81434 (= lt!376451 (lemmaIsPrefixRefl!0 (_2!11158 lt!376129)))))

(declare-fun lt!376442 () Unit!17642)

(declare-fun lt!376444 () Unit!17642)

(assert (=> d!81434 (= lt!376442 lt!376444)))

(assert (=> d!81434 (isPrefixOf!0 lt!376450 lt!376450)))

(assert (=> d!81434 (= lt!376444 (lemmaIsPrefixRefl!0 lt!376450))))

(declare-fun lt!376445 () Unit!17642)

(declare-fun lt!376441 () Unit!17642)

(assert (=> d!81434 (= lt!376445 lt!376441)))

(assert (=> d!81434 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81434 (= lt!376441 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81434 (= lt!376450 (BitStream!10467 (buf!6235 (_2!11158 lt!376129)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)))))

(assert (=> d!81434 (isPrefixOf!0 thiss!982 (_2!11158 lt!376129))))

(assert (=> d!81434 (= (reader!0 thiss!982 (_2!11158 lt!376129)) lt!376446)))

(declare-fun b!240895 () Bool)

(declare-fun res!201097 () Bool)

(assert (=> b!240895 (=> (not res!201097) (not e!166925))))

(assert (=> b!240895 (= res!201097 (isPrefixOf!0 (_2!11160 lt!376446) (_2!11158 lt!376129)))))

(declare-fun b!240896 () Bool)

(declare-fun Unit!17646 () Unit!17642)

(assert (=> b!240896 (= e!166924 Unit!17646)))

(assert (= (and d!81434 c!11440) b!240892))

(assert (= (and d!81434 (not c!11440)) b!240896))

(assert (= (and d!81434 res!201098) b!240894))

(assert (= (and b!240894 res!201099) b!240895))

(assert (= (and b!240895 res!201097) b!240893))

(assert (=> b!240892 m!363401))

(declare-fun m!363541 () Bool)

(assert (=> b!240892 m!363541))

(declare-fun m!363543 () Bool)

(assert (=> b!240892 m!363543))

(declare-fun m!363545 () Bool)

(assert (=> b!240894 m!363545))

(declare-fun m!363547 () Bool)

(assert (=> b!240895 m!363547))

(assert (=> d!81434 m!363387))

(declare-fun m!363549 () Bool)

(assert (=> d!81434 m!363549))

(declare-fun m!363551 () Bool)

(assert (=> d!81434 m!363551))

(declare-fun m!363553 () Bool)

(assert (=> d!81434 m!363553))

(declare-fun m!363555 () Bool)

(assert (=> d!81434 m!363555))

(declare-fun m!363557 () Bool)

(assert (=> d!81434 m!363557))

(declare-fun m!363559 () Bool)

(assert (=> d!81434 m!363559))

(declare-fun m!363561 () Bool)

(assert (=> d!81434 m!363561))

(declare-fun m!363563 () Bool)

(assert (=> d!81434 m!363563))

(declare-fun m!363565 () Bool)

(assert (=> d!81434 m!363565))

(declare-fun m!363567 () Bool)

(assert (=> d!81434 m!363567))

(declare-fun m!363569 () Bool)

(assert (=> b!240893 m!363569))

(assert (=> b!240893 m!363399))

(assert (=> b!240893 m!363401))

(assert (=> b!240793 d!81434))

(declare-fun d!81444 () Bool)

(assert (=> d!81444 (= (inv!12 thiss!982) (invariant!0 (currentBit!11587 thiss!982) (currentByte!11592 thiss!982) (size!5772 (buf!6235 thiss!982))))))

(declare-fun bs!20549 () Bool)

(assert (= bs!20549 d!81444))

(assert (=> bs!20549 m!363411))

(assert (=> start!52298 d!81444))

(declare-fun d!81446 () Bool)

(declare-fun res!201116 () Bool)

(declare-fun e!166934 () Bool)

(assert (=> d!81446 (=> (not res!201116) (not e!166934))))

(assert (=> d!81446 (= res!201116 (= (size!5772 (buf!6235 thiss!982)) (size!5772 (buf!6235 (_2!11158 lt!376129)))))))

(assert (=> d!81446 (= (isPrefixOf!0 thiss!982 (_2!11158 lt!376129)) e!166934)))

(declare-fun b!240911 () Bool)

(declare-fun res!201114 () Bool)

(assert (=> b!240911 (=> (not res!201114) (not e!166934))))

(assert (=> b!240911 (= res!201114 (bvsle (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982)) (bitIndex!0 (size!5772 (buf!6235 (_2!11158 lt!376129))) (currentByte!11592 (_2!11158 lt!376129)) (currentBit!11587 (_2!11158 lt!376129)))))))

(declare-fun b!240912 () Bool)

(declare-fun e!166935 () Bool)

(assert (=> b!240912 (= e!166934 e!166935)))

(declare-fun res!201115 () Bool)

(assert (=> b!240912 (=> res!201115 e!166935)))

(assert (=> b!240912 (= res!201115 (= (size!5772 (buf!6235 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240913 () Bool)

(assert (=> b!240913 (= e!166935 (arrayBitRangesEq!0 (buf!6235 thiss!982) (buf!6235 (_2!11158 lt!376129)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5772 (buf!6235 thiss!982)) (currentByte!11592 thiss!982) (currentBit!11587 thiss!982))))))

(assert (= (and d!81446 res!201116) b!240911))

(assert (= (and b!240911 res!201114) b!240912))

(assert (= (and b!240912 (not res!201115)) b!240913))

(assert (=> b!240911 m!363401))

(assert (=> b!240911 m!363399))

(assert (=> b!240913 m!363401))

(assert (=> b!240913 m!363401))

(declare-fun m!363571 () Bool)

(assert (=> b!240913 m!363571))

(assert (=> b!240790 d!81446))

(declare-fun d!81448 () Bool)

(assert (=> d!81448 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5772 (buf!6235 thiss!982))) ((_ sign_extend 32) (currentByte!11592 thiss!982)) ((_ sign_extend 32) (currentBit!11587 thiss!982))) nBits!288))))

(declare-fun bs!20550 () Bool)

(assert (= bs!20550 d!81448))

(assert (=> bs!20550 m!363409))

(assert (=> b!240789 d!81448))

(push 1)

