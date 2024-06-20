; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52064 () Bool)

(assert start!52064)

(declare-fun b!239880 () Bool)

(declare-fun e!166326 () Bool)

(declare-datatypes ((array!13109 0))(
  ( (array!13110 (arr!6729 (Array (_ BitVec 32) (_ BitVec 8))) (size!5742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10406 0))(
  ( (BitStream!10407 (buf!6196 array!13109) (currentByte!11538 (_ BitVec 32)) (currentBit!11533 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17579 0))(
  ( (Unit!17580) )
))
(declare-datatypes ((tuple2!20292 0))(
  ( (tuple2!20293 (_1!11068 Unit!17579) (_2!11068 BitStream!10406)) )
))
(declare-fun lt!374493 () tuple2!20292)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239880 (= e!166326 (not (invariant!0 (currentBit!11533 (_2!11068 lt!374493)) (currentByte!11538 (_2!11068 lt!374493)) (size!5742 (buf!6196 (_2!11068 lt!374493))))))))

(declare-fun e!166325 () Bool)

(assert (=> b!239880 e!166325))

(declare-fun res!200246 () Bool)

(assert (=> b!239880 (=> (not res!200246) (not e!166325))))

(declare-fun thiss!982 () BitStream!10406)

(assert (=> b!239880 (= res!200246 (= (size!5742 (buf!6196 thiss!982)) (size!5742 (buf!6196 (_2!11068 lt!374493)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10406 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20292)

(assert (=> b!239880 (= lt!374493 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239881 () Bool)

(declare-fun res!200248 () Bool)

(assert (=> b!239881 (=> (not res!200248) (not e!166325))))

(declare-fun isPrefixOf!0 (BitStream!10406 BitStream!10406) Bool)

(assert (=> b!239881 (= res!200248 (isPrefixOf!0 thiss!982 (_2!11068 lt!374493)))))

(declare-fun b!239882 () Bool)

(declare-fun res!200250 () Bool)

(assert (=> b!239882 (=> (not res!200250) (not e!166326))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239882 (= res!200250 (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) nBits!288))))

(declare-fun res!200247 () Bool)

(assert (=> start!52064 (=> (not res!200247) (not e!166326))))

(assert (=> start!52064 (= res!200247 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52064 e!166326))

(assert (=> start!52064 true))

(declare-fun e!166328 () Bool)

(declare-fun inv!12 (BitStream!10406) Bool)

(assert (=> start!52064 (and (inv!12 thiss!982) e!166328)))

(declare-fun b!239883 () Bool)

(declare-datatypes ((tuple2!20294 0))(
  ( (tuple2!20295 (_1!11069 BitStream!10406) (_2!11069 Bool)) )
))
(declare-fun lt!374496 () tuple2!20294)

(declare-datatypes ((tuple2!20296 0))(
  ( (tuple2!20297 (_1!11070 BitStream!10406) (_2!11070 BitStream!10406)) )
))
(declare-fun lt!374495 () tuple2!20296)

(assert (=> b!239883 (= e!166325 (not (or (not (_2!11069 lt!374496)) (not (= (_1!11069 lt!374496) (_2!11070 lt!374495))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10406 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20294)

(assert (=> b!239883 (= lt!374496 (checkBitsLoopPure!0 (_1!11070 lt!374495) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239883 (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) nBits!288)))

(declare-fun lt!374494 () Unit!17579)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10406 array!13109 (_ BitVec 64)) Unit!17579)

(assert (=> b!239883 (= lt!374494 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6196 (_2!11068 lt!374493)) nBits!288))))

(declare-fun reader!0 (BitStream!10406 BitStream!10406) tuple2!20296)

(assert (=> b!239883 (= lt!374495 (reader!0 thiss!982 (_2!11068 lt!374493)))))

(declare-fun b!239884 () Bool)

(declare-fun array_inv!5483 (array!13109) Bool)

(assert (=> b!239884 (= e!166328 (array_inv!5483 (buf!6196 thiss!982)))))

(declare-fun b!239885 () Bool)

(declare-fun res!200249 () Bool)

(assert (=> b!239885 (=> (not res!200249) (not e!166325))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239885 (= res!200249 (= (bitIndex!0 (size!5742 (buf!6196 (_2!11068 lt!374493))) (currentByte!11538 (_2!11068 lt!374493)) (currentBit!11533 (_2!11068 lt!374493))) (bvadd (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)) nBits!288)))))

(assert (= (and start!52064 res!200247) b!239882))

(assert (= (and b!239882 res!200250) b!239880))

(assert (= (and b!239880 res!200246) b!239885))

(assert (= (and b!239885 res!200249) b!239881))

(assert (= (and b!239881 res!200248) b!239883))

(assert (= start!52064 b!239884))

(declare-fun m!362205 () Bool)

(assert (=> b!239884 m!362205))

(declare-fun m!362207 () Bool)

(assert (=> b!239885 m!362207))

(declare-fun m!362209 () Bool)

(assert (=> b!239885 m!362209))

(declare-fun m!362211 () Bool)

(assert (=> b!239882 m!362211))

(declare-fun m!362213 () Bool)

(assert (=> start!52064 m!362213))

(declare-fun m!362215 () Bool)

(assert (=> b!239883 m!362215))

(declare-fun m!362217 () Bool)

(assert (=> b!239883 m!362217))

(declare-fun m!362219 () Bool)

(assert (=> b!239883 m!362219))

(declare-fun m!362221 () Bool)

(assert (=> b!239883 m!362221))

(declare-fun m!362223 () Bool)

(assert (=> b!239881 m!362223))

(declare-fun m!362225 () Bool)

(assert (=> b!239880 m!362225))

(declare-fun m!362227 () Bool)

(assert (=> b!239880 m!362227))

(push 1)

(assert (not b!239881))

(assert (not b!239884))

(assert (not b!239880))

(assert (not b!239882))

(assert (not b!239885))

(assert (not start!52064))

(assert (not b!239883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81168 () Bool)

(declare-fun e!166335 () Bool)

(assert (=> d!81168 e!166335))

(declare-fun res!200263 () Bool)

(assert (=> d!81168 (=> (not res!200263) (not e!166335))))

(declare-fun lt!374541 () (_ BitVec 64))

(declare-fun lt!374544 () (_ BitVec 64))

(declare-fun lt!374540 () (_ BitVec 64))

(assert (=> d!81168 (= res!200263 (= lt!374540 (bvsub lt!374541 lt!374544)))))

(assert (=> d!81168 (or (= (bvand lt!374541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374541 lt!374544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81168 (= lt!374544 (remainingBits!0 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))) ((_ sign_extend 32) (currentByte!11538 (_2!11068 lt!374493))) ((_ sign_extend 32) (currentBit!11533 (_2!11068 lt!374493)))))))

(declare-fun lt!374543 () (_ BitVec 64))

(declare-fun lt!374539 () (_ BitVec 64))

(assert (=> d!81168 (= lt!374541 (bvmul lt!374543 lt!374539))))

(assert (=> d!81168 (or (= lt!374543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374539 (bvsdiv (bvmul lt!374543 lt!374539) lt!374543)))))

(assert (=> d!81168 (= lt!374539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81168 (= lt!374543 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))))))

(assert (=> d!81168 (= lt!374540 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11538 (_2!11068 lt!374493))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11533 (_2!11068 lt!374493)))))))

(assert (=> d!81168 (invariant!0 (currentBit!11533 (_2!11068 lt!374493)) (currentByte!11538 (_2!11068 lt!374493)) (size!5742 (buf!6196 (_2!11068 lt!374493))))))

(assert (=> d!81168 (= (bitIndex!0 (size!5742 (buf!6196 (_2!11068 lt!374493))) (currentByte!11538 (_2!11068 lt!374493)) (currentBit!11533 (_2!11068 lt!374493))) lt!374540)))

(declare-fun b!239898 () Bool)

(declare-fun res!200264 () Bool)

(assert (=> b!239898 (=> (not res!200264) (not e!166335))))

(assert (=> b!239898 (= res!200264 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374540))))

(declare-fun b!239899 () Bool)

(declare-fun lt!374542 () (_ BitVec 64))

(assert (=> b!239899 (= e!166335 (bvsle lt!374540 (bvmul lt!374542 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239899 (or (= lt!374542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374542)))))

(assert (=> b!239899 (= lt!374542 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))))))

(assert (= (and d!81168 res!200263) b!239898))

(assert (= (and b!239898 res!200264) b!239899))

(declare-fun m!362241 () Bool)

(assert (=> d!81168 m!362241))

(assert (=> d!81168 m!362225))

(assert (=> b!239885 d!81168))

(declare-fun d!81172 () Bool)

(declare-fun e!166336 () Bool)

(assert (=> d!81172 e!166336))

(declare-fun res!200265 () Bool)

(assert (=> d!81172 (=> (not res!200265) (not e!166336))))

(declare-fun lt!374550 () (_ BitVec 64))

(declare-fun lt!374546 () (_ BitVec 64))

(declare-fun lt!374547 () (_ BitVec 64))

(assert (=> d!81172 (= res!200265 (= lt!374546 (bvsub lt!374547 lt!374550)))))

(assert (=> d!81172 (or (= (bvand lt!374547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374547 lt!374550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81172 (= lt!374550 (remainingBits!0 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982))))))

(declare-fun lt!374549 () (_ BitVec 64))

(declare-fun lt!374545 () (_ BitVec 64))

(assert (=> d!81172 (= lt!374547 (bvmul lt!374549 lt!374545))))

(assert (=> d!81172 (or (= lt!374549 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374545 (bvsdiv (bvmul lt!374549 lt!374545) lt!374549)))))

(assert (=> d!81172 (= lt!374545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81172 (= lt!374549 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))))))

(assert (=> d!81172 (= lt!374546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11538 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11533 thiss!982))))))

(assert (=> d!81172 (invariant!0 (currentBit!11533 thiss!982) (currentByte!11538 thiss!982) (size!5742 (buf!6196 thiss!982)))))

(assert (=> d!81172 (= (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)) lt!374546)))

(declare-fun b!239900 () Bool)

(declare-fun res!200266 () Bool)

(assert (=> b!239900 (=> (not res!200266) (not e!166336))))

(assert (=> b!239900 (= res!200266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374546))))

(declare-fun b!239901 () Bool)

(declare-fun lt!374548 () (_ BitVec 64))

(assert (=> b!239901 (= e!166336 (bvsle lt!374546 (bvmul lt!374548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239901 (or (= lt!374548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374548)))))

(assert (=> b!239901 (= lt!374548 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))))))

(assert (= (and d!81172 res!200265) b!239900))

(assert (= (and b!239900 res!200266) b!239901))

(declare-fun m!362243 () Bool)

(assert (=> d!81172 m!362243))

(declare-fun m!362245 () Bool)

(assert (=> d!81172 m!362245))

(assert (=> b!239885 d!81172))

(declare-fun d!81174 () Bool)

(assert (=> d!81174 (= (invariant!0 (currentBit!11533 (_2!11068 lt!374493)) (currentByte!11538 (_2!11068 lt!374493)) (size!5742 (buf!6196 (_2!11068 lt!374493)))) (and (bvsge (currentBit!11533 (_2!11068 lt!374493)) #b00000000000000000000000000000000) (bvslt (currentBit!11533 (_2!11068 lt!374493)) #b00000000000000000000000000001000) (bvsge (currentByte!11538 (_2!11068 lt!374493)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11538 (_2!11068 lt!374493)) (size!5742 (buf!6196 (_2!11068 lt!374493)))) (and (= (currentBit!11533 (_2!11068 lt!374493)) #b00000000000000000000000000000000) (= (currentByte!11538 (_2!11068 lt!374493)) (size!5742 (buf!6196 (_2!11068 lt!374493))))))))))

(assert (=> b!239880 d!81174))

(declare-fun b!239939 () Bool)

(declare-fun e!166353 () Bool)

(declare-fun lt!374659 () tuple2!20294)

(declare-fun lt!374663 () tuple2!20296)

(assert (=> b!239939 (= e!166353 (and (_2!11069 lt!374659) (= (_1!11069 lt!374659) (_2!11070 lt!374663))))))

(assert (=> b!239939 (= lt!374659 (checkBitsLoopPure!0 (_1!11070 lt!374663) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!374661 () Unit!17579)

(declare-fun lt!374660 () Unit!17579)

(assert (=> b!239939 (= lt!374661 lt!374660)))

(declare-fun lt!374664 () tuple2!20292)

(declare-fun lt!374657 () (_ BitVec 64))

(assert (=> b!239939 (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374664)))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) lt!374657)))

(assert (=> b!239939 (= lt!374660 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6196 (_2!11068 lt!374664)) lt!374657))))

(declare-fun e!166354 () Bool)

(assert (=> b!239939 e!166354))

(declare-fun res!200296 () Bool)

(assert (=> b!239939 (=> (not res!200296) (not e!166354))))

(assert (=> b!239939 (= res!200296 (and (= (size!5742 (buf!6196 thiss!982)) (size!5742 (buf!6196 (_2!11068 lt!374664)))) (bvsge lt!374657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239939 (= lt!374657 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239939 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239939 (= lt!374663 (reader!0 thiss!982 (_2!11068 lt!374664)))))

(declare-fun d!81176 () Bool)

(assert (=> d!81176 e!166353))

(declare-fun res!200297 () Bool)

(assert (=> d!81176 (=> (not res!200297) (not e!166353))))

(assert (=> d!81176 (= res!200297 (= (size!5742 (buf!6196 thiss!982)) (size!5742 (buf!6196 (_2!11068 lt!374664)))))))

(declare-fun choose!51 (BitStream!10406 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20292)

(assert (=> d!81176 (= lt!374664 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81176 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81176 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!374664)))

(declare-fun b!239937 () Bool)

(declare-fun res!200299 () Bool)

(assert (=> b!239937 (=> (not res!200299) (not e!166353))))

(declare-fun lt!374658 () (_ BitVec 64))

(declare-fun lt!374662 () (_ BitVec 64))

(assert (=> b!239937 (= res!200299 (= (bitIndex!0 (size!5742 (buf!6196 (_2!11068 lt!374664))) (currentByte!11538 (_2!11068 lt!374664)) (currentBit!11533 (_2!11068 lt!374664))) (bvadd lt!374662 lt!374658)))))

(assert (=> b!239937 (or (not (= (bvand lt!374662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374658 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374662 lt!374658) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239937 (= lt!374658 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239937 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239937 (= lt!374662 (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)))))

(declare-fun b!239940 () Bool)

(assert (=> b!239940 (= e!166354 (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) lt!374657))))

(declare-fun b!239938 () Bool)

(declare-fun res!200298 () Bool)

(assert (=> b!239938 (=> (not res!200298) (not e!166353))))

(assert (=> b!239938 (= res!200298 (isPrefixOf!0 thiss!982 (_2!11068 lt!374664)))))

(assert (= (and d!81176 res!200297) b!239937))

(assert (= (and b!239937 res!200299) b!239938))

(assert (= (and b!239938 res!200298) b!239939))

(assert (= (and b!239939 res!200296) b!239940))

(declare-fun m!362303 () Bool)

(assert (=> b!239939 m!362303))

(declare-fun m!362305 () Bool)

(assert (=> b!239939 m!362305))

(declare-fun m!362307 () Bool)

(assert (=> b!239939 m!362307))

(declare-fun m!362309 () Bool)

(assert (=> b!239939 m!362309))

(declare-fun m!362311 () Bool)

(assert (=> b!239940 m!362311))

(declare-fun m!362313 () Bool)

(assert (=> b!239937 m!362313))

(assert (=> b!239937 m!362209))

(declare-fun m!362315 () Bool)

(assert (=> d!81176 m!362315))

(declare-fun m!362317 () Bool)

(assert (=> b!239938 m!362317))

(assert (=> b!239880 d!81176))

(declare-fun d!81200 () Bool)

(assert (=> d!81200 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5742 (buf!6196 thiss!982))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982))) nBits!288))))

(declare-fun bs!20468 () Bool)

(assert (= bs!20468 d!81200))

(assert (=> bs!20468 m!362243))

(assert (=> b!239882 d!81200))

(declare-fun d!81202 () Bool)

(declare-fun res!200306 () Bool)

(declare-fun e!166360 () Bool)

(assert (=> d!81202 (=> (not res!200306) (not e!166360))))

(assert (=> d!81202 (= res!200306 (= (size!5742 (buf!6196 thiss!982)) (size!5742 (buf!6196 (_2!11068 lt!374493)))))))

(assert (=> d!81202 (= (isPrefixOf!0 thiss!982 (_2!11068 lt!374493)) e!166360)))

(declare-fun b!239947 () Bool)

(declare-fun res!200308 () Bool)

(assert (=> b!239947 (=> (not res!200308) (not e!166360))))

(assert (=> b!239947 (= res!200308 (bvsle (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)) (bitIndex!0 (size!5742 (buf!6196 (_2!11068 lt!374493))) (currentByte!11538 (_2!11068 lt!374493)) (currentBit!11533 (_2!11068 lt!374493)))))))

(declare-fun b!239948 () Bool)

(declare-fun e!166359 () Bool)

(assert (=> b!239948 (= e!166360 e!166359)))

(declare-fun res!200307 () Bool)

(assert (=> b!239948 (=> res!200307 e!166359)))

(assert (=> b!239948 (= res!200307 (= (size!5742 (buf!6196 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!239949 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13109 array!13109 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239949 (= e!166359 (arrayBitRangesEq!0 (buf!6196 thiss!982) (buf!6196 (_2!11068 lt!374493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982))))))

(assert (= (and d!81202 res!200306) b!239947))

(assert (= (and b!239947 res!200308) b!239948))

(assert (= (and b!239948 (not res!200307)) b!239949))

(assert (=> b!239947 m!362209))

(assert (=> b!239947 m!362207))

(assert (=> b!239949 m!362209))

(assert (=> b!239949 m!362209))

(declare-fun m!362319 () Bool)

(assert (=> b!239949 m!362319))

(assert (=> b!239881 d!81202))

(declare-fun d!81204 () Bool)

(assert (=> d!81204 (= (inv!12 thiss!982) (invariant!0 (currentBit!11533 thiss!982) (currentByte!11538 thiss!982) (size!5742 (buf!6196 thiss!982))))))

(declare-fun bs!20469 () Bool)

(assert (= bs!20469 d!81204))

(assert (=> bs!20469 m!362245))

(assert (=> start!52064 d!81204))

(declare-fun d!81206 () Bool)

(declare-datatypes ((tuple2!20300 0))(
  ( (tuple2!20301 (_1!11072 Bool) (_2!11072 BitStream!10406)) )
))
(declare-fun lt!374667 () tuple2!20300)

(declare-fun checkBitsLoop!0 (BitStream!10406 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20300)

(assert (=> d!81206 (= lt!374667 (checkBitsLoop!0 (_1!11070 lt!374495) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81206 (= (checkBitsLoopPure!0 (_1!11070 lt!374495) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20295 (_2!11072 lt!374667) (_1!11072 lt!374667)))))

(declare-fun bs!20470 () Bool)

(assert (= bs!20470 d!81206))

(declare-fun m!362321 () Bool)

(assert (=> bs!20470 m!362321))

(assert (=> b!239883 d!81206))

(declare-fun d!81208 () Bool)

(assert (=> d!81208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982))) nBits!288))))

(declare-fun bs!20471 () Bool)

(assert (= bs!20471 d!81208))

(declare-fun m!362323 () Bool)

(assert (=> bs!20471 m!362323))

(assert (=> b!239883 d!81208))

(declare-fun d!81210 () Bool)

(assert (=> d!81210 (validate_offset_bits!1 ((_ sign_extend 32) (size!5742 (buf!6196 (_2!11068 lt!374493)))) ((_ sign_extend 32) (currentByte!11538 thiss!982)) ((_ sign_extend 32) (currentBit!11533 thiss!982)) nBits!288)))

(declare-fun lt!374670 () Unit!17579)

(declare-fun choose!9 (BitStream!10406 array!13109 (_ BitVec 64) BitStream!10406) Unit!17579)

(assert (=> d!81210 (= lt!374670 (choose!9 thiss!982 (buf!6196 (_2!11068 lt!374493)) nBits!288 (BitStream!10407 (buf!6196 (_2!11068 lt!374493)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982))))))

(assert (=> d!81210 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6196 (_2!11068 lt!374493)) nBits!288) lt!374670)))

(declare-fun bs!20472 () Bool)

(assert (= bs!20472 d!81210))

(assert (=> bs!20472 m!362217))

(declare-fun m!362325 () Bool)

(assert (=> bs!20472 m!362325))

(assert (=> b!239883 d!81210))

(declare-fun b!239992 () Bool)

(declare-fun res!200341 () Bool)

(declare-fun e!166382 () Bool)

(assert (=> b!239992 (=> (not res!200341) (not e!166382))))

(declare-fun lt!374798 () tuple2!20296)

(assert (=> b!239992 (= res!200341 (isPrefixOf!0 (_2!11070 lt!374798) (_2!11068 lt!374493)))))

(declare-fun b!239993 () Bool)

(declare-fun res!200342 () Bool)

(assert (=> b!239993 (=> (not res!200342) (not e!166382))))

(assert (=> b!239993 (= res!200342 (isPrefixOf!0 (_1!11070 lt!374798) thiss!982))))

(declare-fun b!239994 () Bool)

(declare-fun e!166381 () Unit!17579)

(declare-fun lt!374796 () Unit!17579)

(assert (=> b!239994 (= e!166381 lt!374796)))

(declare-fun lt!374805 () (_ BitVec 64))

(assert (=> b!239994 (= lt!374805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374809 () (_ BitVec 64))

(assert (=> b!239994 (= lt!374809 (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13109 array!13109 (_ BitVec 64) (_ BitVec 64)) Unit!17579)

(assert (=> b!239994 (= lt!374796 (arrayBitRangesEqSymmetric!0 (buf!6196 thiss!982) (buf!6196 (_2!11068 lt!374493)) lt!374805 lt!374809))))

(assert (=> b!239994 (arrayBitRangesEq!0 (buf!6196 (_2!11068 lt!374493)) (buf!6196 thiss!982) lt!374805 lt!374809)))

(declare-fun b!239995 () Bool)

(declare-fun Unit!17582 () Unit!17579)

(assert (=> b!239995 (= e!166381 Unit!17582)))

(declare-fun lt!374799 () (_ BitVec 64))

(declare-fun b!239996 () Bool)

(declare-fun lt!374807 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10406 (_ BitVec 64)) BitStream!10406)

(assert (=> b!239996 (= e!166382 (= (_1!11070 lt!374798) (withMovedBitIndex!0 (_2!11070 lt!374798) (bvsub lt!374807 lt!374799))))))

(assert (=> b!239996 (or (= (bvand lt!374807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374807 lt!374799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239996 (= lt!374799 (bitIndex!0 (size!5742 (buf!6196 (_2!11068 lt!374493))) (currentByte!11538 (_2!11068 lt!374493)) (currentBit!11533 (_2!11068 lt!374493))))))

(assert (=> b!239996 (= lt!374807 (bitIndex!0 (size!5742 (buf!6196 thiss!982)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)))))

(declare-fun d!81212 () Bool)

(assert (=> d!81212 e!166382))

(declare-fun res!200343 () Bool)

(assert (=> d!81212 (=> (not res!200343) (not e!166382))))

(assert (=> d!81212 (= res!200343 (isPrefixOf!0 (_1!11070 lt!374798) (_2!11070 lt!374798)))))

(declare-fun lt!374814 () BitStream!10406)

(assert (=> d!81212 (= lt!374798 (tuple2!20297 lt!374814 (_2!11068 lt!374493)))))

(declare-fun lt!374813 () Unit!17579)

(declare-fun lt!374795 () Unit!17579)

(assert (=> d!81212 (= lt!374813 lt!374795)))

(assert (=> d!81212 (isPrefixOf!0 lt!374814 (_2!11068 lt!374493))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10406 BitStream!10406 BitStream!10406) Unit!17579)

(assert (=> d!81212 (= lt!374795 (lemmaIsPrefixTransitive!0 lt!374814 (_2!11068 lt!374493) (_2!11068 lt!374493)))))

(declare-fun lt!374802 () Unit!17579)

(declare-fun lt!374803 () Unit!17579)

(assert (=> d!81212 (= lt!374802 lt!374803)))

(assert (=> d!81212 (isPrefixOf!0 lt!374814 (_2!11068 lt!374493))))

(assert (=> d!81212 (= lt!374803 (lemmaIsPrefixTransitive!0 lt!374814 thiss!982 (_2!11068 lt!374493)))))

(declare-fun lt!374797 () Unit!17579)

(assert (=> d!81212 (= lt!374797 e!166381)))

(declare-fun c!11413 () Bool)

(assert (=> d!81212 (= c!11413 (not (= (size!5742 (buf!6196 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!374810 () Unit!17579)

(declare-fun lt!374808 () Unit!17579)

(assert (=> d!81212 (= lt!374810 lt!374808)))

(assert (=> d!81212 (isPrefixOf!0 (_2!11068 lt!374493) (_2!11068 lt!374493))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10406) Unit!17579)

(assert (=> d!81212 (= lt!374808 (lemmaIsPrefixRefl!0 (_2!11068 lt!374493)))))

(declare-fun lt!374812 () Unit!17579)

(declare-fun lt!374801 () Unit!17579)

(assert (=> d!81212 (= lt!374812 lt!374801)))

(assert (=> d!81212 (= lt!374801 (lemmaIsPrefixRefl!0 (_2!11068 lt!374493)))))

(declare-fun lt!374811 () Unit!17579)

(declare-fun lt!374806 () Unit!17579)

(assert (=> d!81212 (= lt!374811 lt!374806)))

(assert (=> d!81212 (isPrefixOf!0 lt!374814 lt!374814)))

(assert (=> d!81212 (= lt!374806 (lemmaIsPrefixRefl!0 lt!374814))))

(declare-fun lt!374800 () Unit!17579)

(declare-fun lt!374804 () Unit!17579)

(assert (=> d!81212 (= lt!374800 lt!374804)))

(assert (=> d!81212 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81212 (= lt!374804 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81212 (= lt!374814 (BitStream!10407 (buf!6196 (_2!11068 lt!374493)) (currentByte!11538 thiss!982) (currentBit!11533 thiss!982)))))

(assert (=> d!81212 (isPrefixOf!0 thiss!982 (_2!11068 lt!374493))))

(assert (=> d!81212 (= (reader!0 thiss!982 (_2!11068 lt!374493)) lt!374798)))

(assert (= (and d!81212 c!11413) b!239994))

(assert (= (and d!81212 (not c!11413)) b!239995))

(assert (= (and d!81212 res!200343) b!239993))

(assert (= (and b!239993 res!200342) b!239992))

(assert (= (and b!239992 res!200341) b!239996))

(declare-fun m!362361 () Bool)

(assert (=> b!239993 m!362361))

(declare-fun m!362363 () Bool)

(assert (=> b!239996 m!362363))

(assert (=> b!239996 m!362207))

(assert (=> b!239996 m!362209))

(declare-fun m!362365 () Bool)

(assert (=> d!81212 m!362365))

(declare-fun m!362367 () Bool)

(assert (=> d!81212 m!362367))

(declare-fun m!362369 () Bool)

(assert (=> d!81212 m!362369))

(declare-fun m!362371 () Bool)

(assert (=> d!81212 m!362371))

(assert (=> d!81212 m!362223))

(declare-fun m!362373 () Bool)

(assert (=> d!81212 m!362373))

(declare-fun m!362375 () Bool)

(assert (=> d!81212 m!362375))

(declare-fun m!362377 () Bool)

(assert (=> d!81212 m!362377))

(declare-fun m!362379 () Bool)

