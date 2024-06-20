; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52130 () Bool)

(assert start!52130)

(declare-fun b!240066 () Bool)

(declare-fun res!200405 () Bool)

(declare-fun e!166428 () Bool)

(assert (=> b!240066 (=> (not res!200405) (not e!166428))))

(declare-datatypes ((array!13118 0))(
  ( (array!13119 (arr!6732 (Array (_ BitVec 32) (_ BitVec 8))) (size!5745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10412 0))(
  ( (BitStream!10413 (buf!6202 array!13118) (currentByte!11550 (_ BitVec 32)) (currentBit!11545 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10412)

(declare-datatypes ((Unit!17588 0))(
  ( (Unit!17589) )
))
(declare-datatypes ((tuple2!20316 0))(
  ( (tuple2!20317 (_1!11080 Unit!17588) (_2!11080 BitStream!10412)) )
))
(declare-fun lt!374873 () tuple2!20316)

(declare-fun isPrefixOf!0 (BitStream!10412 BitStream!10412) Bool)

(assert (=> b!240066 (= res!200405 (isPrefixOf!0 thiss!982 (_2!11080 lt!374873)))))

(declare-fun b!240067 () Bool)

(declare-fun e!166427 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240067 (= e!166427 (not (invariant!0 (currentBit!11545 thiss!982) (currentByte!11550 thiss!982) (size!5745 (buf!6202 thiss!982)))))))

(assert (=> b!240067 e!166428))

(declare-fun res!200408 () Bool)

(assert (=> b!240067 (=> (not res!200408) (not e!166428))))

(assert (=> b!240067 (= res!200408 (= (size!5745 (buf!6202 thiss!982)) (size!5745 (buf!6202 (_2!11080 lt!374873)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10412 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20316)

(assert (=> b!240067 (= lt!374873 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!200409 () Bool)

(assert (=> start!52130 (=> (not res!200409) (not e!166427))))

(assert (=> start!52130 (= res!200409 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52130 e!166427))

(assert (=> start!52130 true))

(declare-fun e!166429 () Bool)

(declare-fun inv!12 (BitStream!10412) Bool)

(assert (=> start!52130 (and (inv!12 thiss!982) e!166429)))

(declare-fun b!240068 () Bool)

(declare-fun res!200406 () Bool)

(assert (=> b!240068 (=> (not res!200406) (not e!166427))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240068 (= res!200406 (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) nBits!288))))

(declare-fun b!240069 () Bool)

(declare-fun res!200407 () Bool)

(assert (=> b!240069 (=> (not res!200407) (not e!166428))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240069 (= res!200407 (= (bitIndex!0 (size!5745 (buf!6202 (_2!11080 lt!374873))) (currentByte!11550 (_2!11080 lt!374873)) (currentBit!11545 (_2!11080 lt!374873))) (bvadd (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)) nBits!288)))))

(declare-fun b!240070 () Bool)

(declare-datatypes ((tuple2!20318 0))(
  ( (tuple2!20319 (_1!11081 BitStream!10412) (_2!11081 Bool)) )
))
(declare-fun lt!374874 () tuple2!20318)

(declare-datatypes ((tuple2!20320 0))(
  ( (tuple2!20321 (_1!11082 BitStream!10412) (_2!11082 BitStream!10412)) )
))
(declare-fun lt!374872 () tuple2!20320)

(assert (=> b!240070 (= e!166428 (not (or (not (_2!11081 lt!374874)) (not (= (_1!11081 lt!374874) (_2!11082 lt!374872))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10412 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20318)

(assert (=> b!240070 (= lt!374874 (checkBitsLoopPure!0 (_1!11082 lt!374872) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240070 (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) nBits!288)))

(declare-fun lt!374871 () Unit!17588)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10412 array!13118 (_ BitVec 64)) Unit!17588)

(assert (=> b!240070 (= lt!374871 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6202 (_2!11080 lt!374873)) nBits!288))))

(declare-fun reader!0 (BitStream!10412 BitStream!10412) tuple2!20320)

(assert (=> b!240070 (= lt!374872 (reader!0 thiss!982 (_2!11080 lt!374873)))))

(declare-fun b!240071 () Bool)

(declare-fun array_inv!5486 (array!13118) Bool)

(assert (=> b!240071 (= e!166429 (array_inv!5486 (buf!6202 thiss!982)))))

(assert (= (and start!52130 res!200409) b!240068))

(assert (= (and b!240068 res!200406) b!240067))

(assert (= (and b!240067 res!200408) b!240069))

(assert (= (and b!240069 res!200407) b!240066))

(assert (= (and b!240066 res!200405) b!240070))

(assert (= start!52130 b!240071))

(declare-fun m!362457 () Bool)

(assert (=> b!240069 m!362457))

(declare-fun m!362459 () Bool)

(assert (=> b!240069 m!362459))

(declare-fun m!362461 () Bool)

(assert (=> b!240066 m!362461))

(declare-fun m!362463 () Bool)

(assert (=> b!240068 m!362463))

(declare-fun m!362465 () Bool)

(assert (=> b!240070 m!362465))

(declare-fun m!362467 () Bool)

(assert (=> b!240070 m!362467))

(declare-fun m!362469 () Bool)

(assert (=> b!240070 m!362469))

(declare-fun m!362471 () Bool)

(assert (=> b!240070 m!362471))

(declare-fun m!362473 () Bool)

(assert (=> b!240071 m!362473))

(declare-fun m!362475 () Bool)

(assert (=> start!52130 m!362475))

(declare-fun m!362477 () Bool)

(assert (=> b!240067 m!362477))

(declare-fun m!362479 () Bool)

(assert (=> b!240067 m!362479))

(push 1)

(assert (not b!240066))

(assert (not b!240069))

(assert (not start!52130))

(assert (not b!240071))

(assert (not b!240070))

(assert (not b!240067))

(assert (not b!240068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81240 () Bool)

(declare-fun e!166439 () Bool)

(assert (=> d!81240 e!166439))

(declare-fun res!200423 () Bool)

(assert (=> d!81240 (=> (not res!200423) (not e!166439))))

(declare-fun lt!374901 () (_ BitVec 64))

(declare-fun lt!374898 () (_ BitVec 64))

(declare-fun lt!374899 () (_ BitVec 64))

(assert (=> d!81240 (= res!200423 (= lt!374899 (bvsub lt!374901 lt!374898)))))

(assert (=> d!81240 (or (= (bvand lt!374901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374901 lt!374898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81240 (= lt!374898 (remainingBits!0 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))) ((_ sign_extend 32) (currentByte!11550 (_2!11080 lt!374873))) ((_ sign_extend 32) (currentBit!11545 (_2!11080 lt!374873)))))))

(declare-fun lt!374900 () (_ BitVec 64))

(declare-fun lt!374897 () (_ BitVec 64))

(assert (=> d!81240 (= lt!374901 (bvmul lt!374900 lt!374897))))

(assert (=> d!81240 (or (= lt!374900 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374897 (bvsdiv (bvmul lt!374900 lt!374897) lt!374900)))))

(assert (=> d!81240 (= lt!374897 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81240 (= lt!374900 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))))))

(assert (=> d!81240 (= lt!374899 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11550 (_2!11080 lt!374873))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11545 (_2!11080 lt!374873)))))))

(assert (=> d!81240 (invariant!0 (currentBit!11545 (_2!11080 lt!374873)) (currentByte!11550 (_2!11080 lt!374873)) (size!5745 (buf!6202 (_2!11080 lt!374873))))))

(assert (=> d!81240 (= (bitIndex!0 (size!5745 (buf!6202 (_2!11080 lt!374873))) (currentByte!11550 (_2!11080 lt!374873)) (currentBit!11545 (_2!11080 lt!374873))) lt!374899)))

(declare-fun b!240085 () Bool)

(declare-fun res!200424 () Bool)

(assert (=> b!240085 (=> (not res!200424) (not e!166439))))

(assert (=> b!240085 (= res!200424 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374899))))

(declare-fun b!240086 () Bool)

(declare-fun lt!374896 () (_ BitVec 64))

(assert (=> b!240086 (= e!166439 (bvsle lt!374899 (bvmul lt!374896 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240086 (or (= lt!374896 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374896 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374896)))))

(assert (=> b!240086 (= lt!374896 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))))))

(assert (= (and d!81240 res!200423) b!240085))

(assert (= (and b!240085 res!200424) b!240086))

(declare-fun m!362495 () Bool)

(assert (=> d!81240 m!362495))

(declare-fun m!362497 () Bool)

(assert (=> d!81240 m!362497))

(assert (=> b!240069 d!81240))

(declare-fun d!81250 () Bool)

(declare-fun e!166440 () Bool)

(assert (=> d!81250 e!166440))

(declare-fun res!200425 () Bool)

(assert (=> d!81250 (=> (not res!200425) (not e!166440))))

(declare-fun lt!374905 () (_ BitVec 64))

(declare-fun lt!374904 () (_ BitVec 64))

(declare-fun lt!374907 () (_ BitVec 64))

(assert (=> d!81250 (= res!200425 (= lt!374905 (bvsub lt!374907 lt!374904)))))

(assert (=> d!81250 (or (= (bvand lt!374907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374907 lt!374904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81250 (= lt!374904 (remainingBits!0 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982))))))

(declare-fun lt!374906 () (_ BitVec 64))

(declare-fun lt!374903 () (_ BitVec 64))

(assert (=> d!81250 (= lt!374907 (bvmul lt!374906 lt!374903))))

(assert (=> d!81250 (or (= lt!374906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374903 (bvsdiv (bvmul lt!374906 lt!374903) lt!374906)))))

(assert (=> d!81250 (= lt!374903 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81250 (= lt!374906 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))))))

(assert (=> d!81250 (= lt!374905 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11550 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11545 thiss!982))))))

(assert (=> d!81250 (invariant!0 (currentBit!11545 thiss!982) (currentByte!11550 thiss!982) (size!5745 (buf!6202 thiss!982)))))

(assert (=> d!81250 (= (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)) lt!374905)))

(declare-fun b!240087 () Bool)

(declare-fun res!200426 () Bool)

(assert (=> b!240087 (=> (not res!200426) (not e!166440))))

(assert (=> b!240087 (= res!200426 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374905))))

(declare-fun b!240088 () Bool)

(declare-fun lt!374902 () (_ BitVec 64))

(assert (=> b!240088 (= e!166440 (bvsle lt!374905 (bvmul lt!374902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240088 (or (= lt!374902 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374902 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374902)))))

(assert (=> b!240088 (= lt!374902 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))))))

(assert (= (and d!81250 res!200425) b!240087))

(assert (= (and b!240087 res!200426) b!240088))

(declare-fun m!362499 () Bool)

(assert (=> d!81250 m!362499))

(assert (=> d!81250 m!362477))

(assert (=> b!240069 d!81250))

(declare-fun d!81252 () Bool)

(declare-datatypes ((tuple2!20324 0))(
  ( (tuple2!20325 (_1!11084 Bool) (_2!11084 BitStream!10412)) )
))
(declare-fun lt!374913 () tuple2!20324)

(declare-fun checkBitsLoop!0 (BitStream!10412 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20324)

(assert (=> d!81252 (= lt!374913 (checkBitsLoop!0 (_1!11082 lt!374872) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81252 (= (checkBitsLoopPure!0 (_1!11082 lt!374872) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20319 (_2!11084 lt!374913) (_1!11084 lt!374913)))))

(declare-fun bs!20484 () Bool)

(assert (= bs!20484 d!81252))

(declare-fun m!362503 () Bool)

(assert (=> bs!20484 m!362503))

(assert (=> b!240070 d!81252))

(declare-fun d!81256 () Bool)

(assert (=> d!81256 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982))) nBits!288))))

(declare-fun bs!20485 () Bool)

(assert (= bs!20485 d!81256))

(declare-fun m!362505 () Bool)

(assert (=> bs!20485 m!362505))

(assert (=> b!240070 d!81256))

(declare-fun d!81258 () Bool)

(assert (=> d!81258 (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!374873)))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) nBits!288)))

(declare-fun lt!374952 () Unit!17588)

(declare-fun choose!9 (BitStream!10412 array!13118 (_ BitVec 64) BitStream!10412) Unit!17588)

(assert (=> d!81258 (= lt!374952 (choose!9 thiss!982 (buf!6202 (_2!11080 lt!374873)) nBits!288 (BitStream!10413 (buf!6202 (_2!11080 lt!374873)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982))))))

(assert (=> d!81258 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6202 (_2!11080 lt!374873)) nBits!288) lt!374952)))

(declare-fun bs!20486 () Bool)

(assert (= bs!20486 d!81258))

(assert (=> bs!20486 m!362467))

(declare-fun m!362507 () Bool)

(assert (=> bs!20486 m!362507))

(assert (=> b!240070 d!81258))

(declare-fun b!240126 () Bool)

(declare-fun res!200452 () Bool)

(declare-fun e!166458 () Bool)

(assert (=> b!240126 (=> (not res!200452) (not e!166458))))

(declare-fun lt!375084 () tuple2!20320)

(assert (=> b!240126 (= res!200452 (isPrefixOf!0 (_1!11082 lt!375084) thiss!982))))

(declare-fun b!240127 () Bool)

(declare-fun res!200450 () Bool)

(assert (=> b!240127 (=> (not res!200450) (not e!166458))))

(assert (=> b!240127 (= res!200450 (isPrefixOf!0 (_2!11082 lt!375084) (_2!11080 lt!374873)))))

(declare-fun b!240128 () Bool)

(declare-fun e!166457 () Unit!17588)

(declare-fun Unit!17591 () Unit!17588)

(assert (=> b!240128 (= e!166457 Unit!17591)))

(declare-fun lt!375086 () (_ BitVec 64))

(declare-fun lt!375083 () (_ BitVec 64))

(declare-fun b!240130 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10412 (_ BitVec 64)) BitStream!10412)

(assert (=> b!240130 (= e!166458 (= (_1!11082 lt!375084) (withMovedBitIndex!0 (_2!11082 lt!375084) (bvsub lt!375086 lt!375083))))))

(assert (=> b!240130 (or (= (bvand lt!375086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375086 lt!375083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240130 (= lt!375083 (bitIndex!0 (size!5745 (buf!6202 (_2!11080 lt!374873))) (currentByte!11550 (_2!11080 lt!374873)) (currentBit!11545 (_2!11080 lt!374873))))))

(assert (=> b!240130 (= lt!375086 (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)))))

(declare-fun d!81260 () Bool)

(assert (=> d!81260 e!166458))

(declare-fun res!200451 () Bool)

(assert (=> d!81260 (=> (not res!200451) (not e!166458))))

(assert (=> d!81260 (= res!200451 (isPrefixOf!0 (_1!11082 lt!375084) (_2!11082 lt!375084)))))

(declare-fun lt!375070 () BitStream!10412)

(assert (=> d!81260 (= lt!375084 (tuple2!20321 lt!375070 (_2!11080 lt!374873)))))

(declare-fun lt!375087 () Unit!17588)

(declare-fun lt!375072 () Unit!17588)

(assert (=> d!81260 (= lt!375087 lt!375072)))

(assert (=> d!81260 (isPrefixOf!0 lt!375070 (_2!11080 lt!374873))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10412 BitStream!10412 BitStream!10412) Unit!17588)

(assert (=> d!81260 (= lt!375072 (lemmaIsPrefixTransitive!0 lt!375070 (_2!11080 lt!374873) (_2!11080 lt!374873)))))

(declare-fun lt!375076 () Unit!17588)

(declare-fun lt!375073 () Unit!17588)

(assert (=> d!81260 (= lt!375076 lt!375073)))

(assert (=> d!81260 (isPrefixOf!0 lt!375070 (_2!11080 lt!374873))))

(assert (=> d!81260 (= lt!375073 (lemmaIsPrefixTransitive!0 lt!375070 thiss!982 (_2!11080 lt!374873)))))

(declare-fun lt!375088 () Unit!17588)

(assert (=> d!81260 (= lt!375088 e!166457)))

(declare-fun c!11421 () Bool)

(assert (=> d!81260 (= c!11421 (not (= (size!5745 (buf!6202 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!375074 () Unit!17588)

(declare-fun lt!375082 () Unit!17588)

(assert (=> d!81260 (= lt!375074 lt!375082)))

(assert (=> d!81260 (isPrefixOf!0 (_2!11080 lt!374873) (_2!11080 lt!374873))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10412) Unit!17588)

(assert (=> d!81260 (= lt!375082 (lemmaIsPrefixRefl!0 (_2!11080 lt!374873)))))

(declare-fun lt!375081 () Unit!17588)

(declare-fun lt!375080 () Unit!17588)

(assert (=> d!81260 (= lt!375081 lt!375080)))

(assert (=> d!81260 (= lt!375080 (lemmaIsPrefixRefl!0 (_2!11080 lt!374873)))))

(declare-fun lt!375085 () Unit!17588)

(declare-fun lt!375078 () Unit!17588)

(assert (=> d!81260 (= lt!375085 lt!375078)))

(assert (=> d!81260 (isPrefixOf!0 lt!375070 lt!375070)))

(assert (=> d!81260 (= lt!375078 (lemmaIsPrefixRefl!0 lt!375070))))

(declare-fun lt!375075 () Unit!17588)

(declare-fun lt!375069 () Unit!17588)

(assert (=> d!81260 (= lt!375075 lt!375069)))

(assert (=> d!81260 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81260 (= lt!375069 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81260 (= lt!375070 (BitStream!10413 (buf!6202 (_2!11080 lt!374873)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)))))

(assert (=> d!81260 (isPrefixOf!0 thiss!982 (_2!11080 lt!374873))))

(assert (=> d!81260 (= (reader!0 thiss!982 (_2!11080 lt!374873)) lt!375084)))

(declare-fun b!240129 () Bool)

(declare-fun lt!375079 () Unit!17588)

(assert (=> b!240129 (= e!166457 lt!375079)))

(declare-fun lt!375071 () (_ BitVec 64))

(assert (=> b!240129 (= lt!375071 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375077 () (_ BitVec 64))

(assert (=> b!240129 (= lt!375077 (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13118 array!13118 (_ BitVec 64) (_ BitVec 64)) Unit!17588)

(assert (=> b!240129 (= lt!375079 (arrayBitRangesEqSymmetric!0 (buf!6202 thiss!982) (buf!6202 (_2!11080 lt!374873)) lt!375071 lt!375077))))

(declare-fun arrayBitRangesEq!0 (array!13118 array!13118 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240129 (arrayBitRangesEq!0 (buf!6202 (_2!11080 lt!374873)) (buf!6202 thiss!982) lt!375071 lt!375077)))

(assert (= (and d!81260 c!11421) b!240129))

(assert (= (and d!81260 (not c!11421)) b!240128))

(assert (= (and d!81260 res!200451) b!240126))

(assert (= (and b!240126 res!200452) b!240127))

(assert (= (and b!240127 res!200450) b!240130))

(declare-fun m!362545 () Bool)

(assert (=> b!240126 m!362545))

(assert (=> b!240129 m!362459))

(declare-fun m!362547 () Bool)

(assert (=> b!240129 m!362547))

(declare-fun m!362549 () Bool)

(assert (=> b!240129 m!362549))

(declare-fun m!362551 () Bool)

(assert (=> b!240130 m!362551))

(assert (=> b!240130 m!362457))

(assert (=> b!240130 m!362459))

(declare-fun m!362553 () Bool)

(assert (=> d!81260 m!362553))

(declare-fun m!362555 () Bool)

(assert (=> d!81260 m!362555))

(assert (=> d!81260 m!362461))

(declare-fun m!362557 () Bool)

(assert (=> d!81260 m!362557))

(declare-fun m!362559 () Bool)

(assert (=> d!81260 m!362559))

(declare-fun m!362561 () Bool)

(assert (=> d!81260 m!362561))

(declare-fun m!362563 () Bool)

(assert (=> d!81260 m!362563))

(declare-fun m!362565 () Bool)

(assert (=> d!81260 m!362565))

(declare-fun m!362567 () Bool)

(assert (=> d!81260 m!362567))

(declare-fun m!362569 () Bool)

(assert (=> d!81260 m!362569))

(declare-fun m!362571 () Bool)

(assert (=> d!81260 m!362571))

(declare-fun m!362573 () Bool)

(assert (=> b!240127 m!362573))

(assert (=> b!240070 d!81260))

(declare-fun d!81276 () Bool)

(assert (=> d!81276 (= (array_inv!5486 (buf!6202 thiss!982)) (bvsge (size!5745 (buf!6202 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240071 d!81276))

(declare-fun d!81278 () Bool)

(declare-fun res!200468 () Bool)

(declare-fun e!166467 () Bool)

(assert (=> d!81278 (=> (not res!200468) (not e!166467))))

(assert (=> d!81278 (= res!200468 (= (size!5745 (buf!6202 thiss!982)) (size!5745 (buf!6202 (_2!11080 lt!374873)))))))

(assert (=> d!81278 (= (isPrefixOf!0 thiss!982 (_2!11080 lt!374873)) e!166467)))

(declare-fun b!240148 () Bool)

(declare-fun res!200470 () Bool)

(assert (=> b!240148 (=> (not res!200470) (not e!166467))))

(assert (=> b!240148 (= res!200470 (bvsle (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)) (bitIndex!0 (size!5745 (buf!6202 (_2!11080 lt!374873))) (currentByte!11550 (_2!11080 lt!374873)) (currentBit!11545 (_2!11080 lt!374873)))))))

(declare-fun b!240149 () Bool)

(declare-fun e!166468 () Bool)

(assert (=> b!240149 (= e!166467 e!166468)))

(declare-fun res!200469 () Bool)

(assert (=> b!240149 (=> res!200469 e!166468)))

(assert (=> b!240149 (= res!200469 (= (size!5745 (buf!6202 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240150 () Bool)

(assert (=> b!240150 (= e!166468 (arrayBitRangesEq!0 (buf!6202 thiss!982) (buf!6202 (_2!11080 lt!374873)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982))))))

(assert (= (and d!81278 res!200468) b!240148))

(assert (= (and b!240148 res!200470) b!240149))

(assert (= (and b!240149 (not res!200469)) b!240150))

(assert (=> b!240148 m!362459))

(assert (=> b!240148 m!362457))

(assert (=> b!240150 m!362459))

(assert (=> b!240150 m!362459))

(declare-fun m!362575 () Bool)

(assert (=> b!240150 m!362575))

(assert (=> b!240066 d!81278))

(declare-fun d!81280 () Bool)

(assert (=> d!81280 (= (invariant!0 (currentBit!11545 thiss!982) (currentByte!11550 thiss!982) (size!5745 (buf!6202 thiss!982))) (and (bvsge (currentBit!11545 thiss!982) #b00000000000000000000000000000000) (bvslt (currentBit!11545 thiss!982) #b00000000000000000000000000001000) (bvsge (currentByte!11550 thiss!982) #b00000000000000000000000000000000) (or (bvslt (currentByte!11550 thiss!982) (size!5745 (buf!6202 thiss!982))) (and (= (currentBit!11545 thiss!982) #b00000000000000000000000000000000) (= (currentByte!11550 thiss!982) (size!5745 (buf!6202 thiss!982)))))))))

(assert (=> b!240067 d!81280))

(declare-fun b!240181 () Bool)

(declare-fun res!200500 () Bool)

(declare-fun e!166485 () Bool)

(assert (=> b!240181 (=> (not res!200500) (not e!166485))))

(declare-fun lt!375164 () tuple2!20316)

(assert (=> b!240181 (= res!200500 (isPrefixOf!0 thiss!982 (_2!11080 lt!375164)))))

(declare-fun b!240180 () Bool)

(declare-fun res!200503 () Bool)

(assert (=> b!240180 (=> (not res!200503) (not e!166485))))

(declare-fun lt!375167 () (_ BitVec 64))

(declare-fun lt!375166 () (_ BitVec 64))

(assert (=> b!240180 (= res!200503 (= (bitIndex!0 (size!5745 (buf!6202 (_2!11080 lt!375164))) (currentByte!11550 (_2!11080 lt!375164)) (currentBit!11545 (_2!11080 lt!375164))) (bvadd lt!375167 lt!375166)))))

(assert (=> b!240180 (or (not (= (bvand lt!375167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375166 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!375167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!375167 lt!375166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240180 (= lt!375166 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240180 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240180 (= lt!375167 (bitIndex!0 (size!5745 (buf!6202 thiss!982)) (currentByte!11550 thiss!982) (currentBit!11545 thiss!982)))))

(declare-fun b!240183 () Bool)

(declare-fun e!166486 () Bool)

(declare-fun lt!375161 () (_ BitVec 64))

(assert (=> b!240183 (= e!166486 (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) lt!375161))))

(declare-fun b!240182 () Bool)

(declare-fun lt!375163 () tuple2!20318)

(declare-fun lt!375168 () tuple2!20320)

(assert (=> b!240182 (= e!166485 (and (_2!11081 lt!375163) (= (_1!11081 lt!375163) (_2!11082 lt!375168))))))

(assert (=> b!240182 (= lt!375163 (checkBitsLoopPure!0 (_1!11082 lt!375168) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!375162 () Unit!17588)

(declare-fun lt!375165 () Unit!17588)

(assert (=> b!240182 (= lt!375162 lt!375165)))

(assert (=> b!240182 (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 (_2!11080 lt!375164)))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) lt!375161)))

(assert (=> b!240182 (= lt!375165 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6202 (_2!11080 lt!375164)) lt!375161))))

(assert (=> b!240182 e!166486))

(declare-fun res!200501 () Bool)

(assert (=> b!240182 (=> (not res!200501) (not e!166486))))

(assert (=> b!240182 (= res!200501 (and (= (size!5745 (buf!6202 thiss!982)) (size!5745 (buf!6202 (_2!11080 lt!375164)))) (bvsge lt!375161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240182 (= lt!375161 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240182 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240182 (= lt!375168 (reader!0 thiss!982 (_2!11080 lt!375164)))))

(declare-fun d!81284 () Bool)

(assert (=> d!81284 e!166485))

(declare-fun res!200502 () Bool)

(assert (=> d!81284 (=> (not res!200502) (not e!166485))))

(assert (=> d!81284 (= res!200502 (= (size!5745 (buf!6202 thiss!982)) (size!5745 (buf!6202 (_2!11080 lt!375164)))))))

(declare-fun choose!51 (BitStream!10412 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20316)

(assert (=> d!81284 (= lt!375164 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81284 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81284 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!375164)))

(assert (= (and d!81284 res!200502) b!240180))

(assert (= (and b!240180 res!200503) b!240181))

(assert (= (and b!240181 res!200500) b!240182))

(assert (= (and b!240182 res!200501) b!240183))

(declare-fun m!362625 () Bool)

(assert (=> b!240183 m!362625))

(declare-fun m!362627 () Bool)

(assert (=> b!240180 m!362627))

(assert (=> b!240180 m!362459))

(declare-fun m!362629 () Bool)

(assert (=> b!240182 m!362629))

(declare-fun m!362631 () Bool)

(assert (=> b!240182 m!362631))

(declare-fun m!362633 () Bool)

(assert (=> b!240182 m!362633))

(declare-fun m!362635 () Bool)

(assert (=> b!240182 m!362635))

(declare-fun m!362637 () Bool)

(assert (=> b!240181 m!362637))

(declare-fun m!362639 () Bool)

(assert (=> d!81284 m!362639))

(assert (=> b!240067 d!81284))

(declare-fun d!81292 () Bool)

(assert (=> d!81292 (= (inv!12 thiss!982) (invariant!0 (currentBit!11545 thiss!982) (currentByte!11550 thiss!982) (size!5745 (buf!6202 thiss!982))))))

(declare-fun bs!20490 () Bool)

(assert (= bs!20490 d!81292))

(assert (=> bs!20490 m!362477))

(assert (=> start!52130 d!81292))

(declare-fun d!81294 () Bool)

(assert (=> d!81294 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5745 (buf!6202 thiss!982))) ((_ sign_extend 32) (currentByte!11550 thiss!982)) ((_ sign_extend 32) (currentBit!11545 thiss!982))) nBits!288))))

(declare-fun bs!20491 () Bool)

(assert (= bs!20491 d!81294))

(assert (=> bs!20491 m!362499))

(assert (=> b!240068 d!81294))

(push 1)

