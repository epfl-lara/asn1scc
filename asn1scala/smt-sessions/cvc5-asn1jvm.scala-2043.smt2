; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52126 () Bool)

(assert start!52126)

(declare-fun b!240030 () Bool)

(declare-fun e!166404 () Bool)

(declare-datatypes ((array!13114 0))(
  ( (array!13115 (arr!6730 (Array (_ BitVec 32) (_ BitVec 8))) (size!5743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10408 0))(
  ( (BitStream!10409 (buf!6200 array!13114) (currentByte!11548 (_ BitVec 32)) (currentBit!11543 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10408)

(declare-fun array_inv!5484 (array!13114) Bool)

(assert (=> b!240030 (= e!166404 (array_inv!5484 (buf!6200 thiss!982)))))

(declare-fun b!240031 () Bool)

(declare-fun e!166403 () Bool)

(declare-datatypes ((tuple2!20304 0))(
  ( (tuple2!20305 (_1!11074 BitStream!10408) (_2!11074 Bool)) )
))
(declare-fun lt!374849 () tuple2!20304)

(declare-datatypes ((tuple2!20306 0))(
  ( (tuple2!20307 (_1!11075 BitStream!10408) (_2!11075 BitStream!10408)) )
))
(declare-fun lt!374850 () tuple2!20306)

(assert (=> b!240031 (= e!166403 (not (or (not (_2!11074 lt!374849)) (not (= (_1!11074 lt!374849) (_2!11075 lt!374850))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10408 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20304)

(assert (=> b!240031 (= lt!374849 (checkBitsLoopPure!0 (_1!11075 lt!374850) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17584 0))(
  ( (Unit!17585) )
))
(declare-datatypes ((tuple2!20308 0))(
  ( (tuple2!20309 (_1!11076 Unit!17584) (_2!11076 BitStream!10408)) )
))
(declare-fun lt!374847 () tuple2!20308)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240031 (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) nBits!288)))

(declare-fun lt!374848 () Unit!17584)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10408 array!13114 (_ BitVec 64)) Unit!17584)

(assert (=> b!240031 (= lt!374848 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6200 (_2!11076 lt!374847)) nBits!288))))

(declare-fun reader!0 (BitStream!10408 BitStream!10408) tuple2!20306)

(assert (=> b!240031 (= lt!374850 (reader!0 thiss!982 (_2!11076 lt!374847)))))

(declare-fun b!240033 () Bool)

(declare-fun res!200379 () Bool)

(assert (=> b!240033 (=> (not res!200379) (not e!166403))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240033 (= res!200379 (= (bitIndex!0 (size!5743 (buf!6200 (_2!11076 lt!374847))) (currentByte!11548 (_2!11076 lt!374847)) (currentBit!11543 (_2!11076 lt!374847))) (bvadd (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)) nBits!288)))))

(declare-fun b!240034 () Bool)

(declare-fun res!200376 () Bool)

(declare-fun e!166406 () Bool)

(assert (=> b!240034 (=> (not res!200376) (not e!166406))))

(assert (=> b!240034 (= res!200376 (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) nBits!288))))

(declare-fun b!240035 () Bool)

(declare-fun res!200378 () Bool)

(assert (=> b!240035 (=> (not res!200378) (not e!166403))))

(declare-fun isPrefixOf!0 (BitStream!10408 BitStream!10408) Bool)

(assert (=> b!240035 (= res!200378 (isPrefixOf!0 thiss!982 (_2!11076 lt!374847)))))

(declare-fun b!240032 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240032 (= e!166406 (not (invariant!0 (currentBit!11543 thiss!982) (currentByte!11548 thiss!982) (size!5743 (buf!6200 thiss!982)))))))

(assert (=> b!240032 e!166403))

(declare-fun res!200375 () Bool)

(assert (=> b!240032 (=> (not res!200375) (not e!166403))))

(assert (=> b!240032 (= res!200375 (= (size!5743 (buf!6200 thiss!982)) (size!5743 (buf!6200 (_2!11076 lt!374847)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10408 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20308)

(assert (=> b!240032 (= lt!374847 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!200377 () Bool)

(assert (=> start!52126 (=> (not res!200377) (not e!166406))))

(assert (=> start!52126 (= res!200377 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52126 e!166406))

(assert (=> start!52126 true))

(declare-fun inv!12 (BitStream!10408) Bool)

(assert (=> start!52126 (and (inv!12 thiss!982) e!166404)))

(assert (= (and start!52126 res!200377) b!240034))

(assert (= (and b!240034 res!200376) b!240032))

(assert (= (and b!240032 res!200375) b!240033))

(assert (= (and b!240033 res!200379) b!240035))

(assert (= (and b!240035 res!200378) b!240031))

(assert (= start!52126 b!240030))

(declare-fun m!362409 () Bool)

(assert (=> b!240031 m!362409))

(declare-fun m!362411 () Bool)

(assert (=> b!240031 m!362411))

(declare-fun m!362413 () Bool)

(assert (=> b!240031 m!362413))

(declare-fun m!362415 () Bool)

(assert (=> b!240031 m!362415))

(declare-fun m!362417 () Bool)

(assert (=> b!240034 m!362417))

(declare-fun m!362419 () Bool)

(assert (=> b!240032 m!362419))

(declare-fun m!362421 () Bool)

(assert (=> b!240032 m!362421))

(declare-fun m!362423 () Bool)

(assert (=> start!52126 m!362423))

(declare-fun m!362425 () Bool)

(assert (=> b!240035 m!362425))

(declare-fun m!362427 () Bool)

(assert (=> b!240033 m!362427))

(declare-fun m!362429 () Bool)

(assert (=> b!240033 m!362429))

(declare-fun m!362431 () Bool)

(assert (=> b!240030 m!362431))

(push 1)

(assert (not start!52126))

(assert (not b!240030))

(assert (not b!240033))

(assert (not b!240031))

(assert (not b!240035))

(assert (not b!240032))

(assert (not b!240034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81236 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81236 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982))) nBits!288))))

(declare-fun bs!20480 () Bool)

(assert (= bs!20480 d!81236))

(declare-fun m!362487 () Bool)

(assert (=> bs!20480 m!362487))

(assert (=> b!240034 d!81236))

(declare-fun d!81238 () Bool)

(declare-fun res!200416 () Bool)

(declare-fun e!166436 () Bool)

(assert (=> d!81238 (=> (not res!200416) (not e!166436))))

(assert (=> d!81238 (= res!200416 (= (size!5743 (buf!6200 thiss!982)) (size!5743 (buf!6200 (_2!11076 lt!374847)))))))

(assert (=> d!81238 (= (isPrefixOf!0 thiss!982 (_2!11076 lt!374847)) e!166436)))

(declare-fun b!240078 () Bool)

(declare-fun res!200418 () Bool)

(assert (=> b!240078 (=> (not res!200418) (not e!166436))))

(assert (=> b!240078 (= res!200418 (bvsle (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)) (bitIndex!0 (size!5743 (buf!6200 (_2!11076 lt!374847))) (currentByte!11548 (_2!11076 lt!374847)) (currentBit!11543 (_2!11076 lt!374847)))))))

(declare-fun b!240079 () Bool)

(declare-fun e!166435 () Bool)

(assert (=> b!240079 (= e!166436 e!166435)))

(declare-fun res!200417 () Bool)

(assert (=> b!240079 (=> res!200417 e!166435)))

(assert (=> b!240079 (= res!200417 (= (size!5743 (buf!6200 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240080 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13114 array!13114 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240080 (= e!166435 (arrayBitRangesEq!0 (buf!6200 thiss!982) (buf!6200 (_2!11076 lt!374847)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982))))))

(assert (= (and d!81238 res!200416) b!240078))

(assert (= (and b!240078 res!200418) b!240079))

(assert (= (and b!240079 (not res!200417)) b!240080))

(assert (=> b!240078 m!362429))

(assert (=> b!240078 m!362427))

(assert (=> b!240080 m!362429))

(assert (=> b!240080 m!362429))

(declare-fun m!362489 () Bool)

(assert (=> b!240080 m!362489))

(assert (=> b!240035 d!81238))

(declare-fun d!81242 () Bool)

(assert (=> d!81242 (= (array_inv!5484 (buf!6200 thiss!982)) (bvsge (size!5743 (buf!6200 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240030 d!81242))

(declare-fun d!81244 () Bool)

(declare-datatypes ((tuple2!20326 0))(
  ( (tuple2!20327 (_1!11085 Bool) (_2!11085 BitStream!10408)) )
))
(declare-fun lt!374895 () tuple2!20326)

(declare-fun checkBitsLoop!0 (BitStream!10408 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20326)

(assert (=> d!81244 (= lt!374895 (checkBitsLoop!0 (_1!11075 lt!374850) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81244 (= (checkBitsLoopPure!0 (_1!11075 lt!374850) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20305 (_2!11085 lt!374895) (_1!11085 lt!374895)))))

(declare-fun bs!20481 () Bool)

(assert (= bs!20481 d!81244))

(declare-fun m!362491 () Bool)

(assert (=> bs!20481 m!362491))

(assert (=> b!240031 d!81244))

(declare-fun d!81246 () Bool)

(assert (=> d!81246 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982))) nBits!288))))

(declare-fun bs!20482 () Bool)

(assert (= bs!20482 d!81246))

(declare-fun m!362493 () Bool)

(assert (=> bs!20482 m!362493))

(assert (=> b!240031 d!81246))

(declare-fun d!81248 () Bool)

(assert (=> d!81248 (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) nBits!288)))

(declare-fun lt!374910 () Unit!17584)

(declare-fun choose!9 (BitStream!10408 array!13114 (_ BitVec 64) BitStream!10408) Unit!17584)

(assert (=> d!81248 (= lt!374910 (choose!9 thiss!982 (buf!6200 (_2!11076 lt!374847)) nBits!288 (BitStream!10409 (buf!6200 (_2!11076 lt!374847)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982))))))

(assert (=> d!81248 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6200 (_2!11076 lt!374847)) nBits!288) lt!374910)))

(declare-fun bs!20483 () Bool)

(assert (= bs!20483 d!81248))

(assert (=> bs!20483 m!362411))

(declare-fun m!362501 () Bool)

(assert (=> bs!20483 m!362501))

(assert (=> b!240031 d!81248))

(declare-fun b!240143 () Bool)

(declare-fun e!166466 () Unit!17584)

(declare-fun Unit!17592 () Unit!17584)

(assert (=> b!240143 (= e!166466 Unit!17592)))

(declare-fun b!240144 () Bool)

(declare-fun lt!375111 () Unit!17584)

(assert (=> b!240144 (= e!166466 lt!375111)))

(declare-fun lt!375102 () (_ BitVec 64))

(assert (=> b!240144 (= lt!375102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375120 () (_ BitVec 64))

(assert (=> b!240144 (= lt!375120 (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13114 array!13114 (_ BitVec 64) (_ BitVec 64)) Unit!17584)

(assert (=> b!240144 (= lt!375111 (arrayBitRangesEqSymmetric!0 (buf!6200 thiss!982) (buf!6200 (_2!11076 lt!374847)) lt!375102 lt!375120))))

(assert (=> b!240144 (arrayBitRangesEq!0 (buf!6200 (_2!11076 lt!374847)) (buf!6200 thiss!982) lt!375102 lt!375120)))

(declare-fun b!240145 () Bool)

(declare-fun res!200467 () Bool)

(declare-fun e!166465 () Bool)

(assert (=> b!240145 (=> (not res!200467) (not e!166465))))

(declare-fun lt!375104 () tuple2!20306)

(assert (=> b!240145 (= res!200467 (isPrefixOf!0 (_2!11075 lt!375104) (_2!11076 lt!374847)))))

(declare-fun lt!375119 () (_ BitVec 64))

(declare-fun lt!375117 () (_ BitVec 64))

(declare-fun b!240146 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10408 (_ BitVec 64)) BitStream!10408)

(assert (=> b!240146 (= e!166465 (= (_1!11075 lt!375104) (withMovedBitIndex!0 (_2!11075 lt!375104) (bvsub lt!375119 lt!375117))))))

(assert (=> b!240146 (or (= (bvand lt!375119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375119 lt!375117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240146 (= lt!375117 (bitIndex!0 (size!5743 (buf!6200 (_2!11076 lt!374847))) (currentByte!11548 (_2!11076 lt!374847)) (currentBit!11543 (_2!11076 lt!374847))))))

(assert (=> b!240146 (= lt!375119 (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)))))

(declare-fun d!81254 () Bool)

(assert (=> d!81254 e!166465))

(declare-fun res!200465 () Bool)

(assert (=> d!81254 (=> (not res!200465) (not e!166465))))

(assert (=> d!81254 (= res!200465 (isPrefixOf!0 (_1!11075 lt!375104) (_2!11075 lt!375104)))))

(declare-fun lt!375116 () BitStream!10408)

(assert (=> d!81254 (= lt!375104 (tuple2!20307 lt!375116 (_2!11076 lt!374847)))))

(declare-fun lt!375112 () Unit!17584)

(declare-fun lt!375107 () Unit!17584)

(assert (=> d!81254 (= lt!375112 lt!375107)))

(assert (=> d!81254 (isPrefixOf!0 lt!375116 (_2!11076 lt!374847))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10408 BitStream!10408 BitStream!10408) Unit!17584)

(assert (=> d!81254 (= lt!375107 (lemmaIsPrefixTransitive!0 lt!375116 (_2!11076 lt!374847) (_2!11076 lt!374847)))))

(declare-fun lt!375106 () Unit!17584)

(declare-fun lt!375110 () Unit!17584)

(assert (=> d!81254 (= lt!375106 lt!375110)))

(assert (=> d!81254 (isPrefixOf!0 lt!375116 (_2!11076 lt!374847))))

(assert (=> d!81254 (= lt!375110 (lemmaIsPrefixTransitive!0 lt!375116 thiss!982 (_2!11076 lt!374847)))))

(declare-fun lt!375113 () Unit!17584)

(assert (=> d!81254 (= lt!375113 e!166466)))

(declare-fun c!11422 () Bool)

(assert (=> d!81254 (= c!11422 (not (= (size!5743 (buf!6200 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!375118 () Unit!17584)

(declare-fun lt!375101 () Unit!17584)

(assert (=> d!81254 (= lt!375118 lt!375101)))

(assert (=> d!81254 (isPrefixOf!0 (_2!11076 lt!374847) (_2!11076 lt!374847))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10408) Unit!17584)

(assert (=> d!81254 (= lt!375101 (lemmaIsPrefixRefl!0 (_2!11076 lt!374847)))))

(declare-fun lt!375103 () Unit!17584)

(declare-fun lt!375105 () Unit!17584)

(assert (=> d!81254 (= lt!375103 lt!375105)))

(assert (=> d!81254 (= lt!375105 (lemmaIsPrefixRefl!0 (_2!11076 lt!374847)))))

(declare-fun lt!375114 () Unit!17584)

(declare-fun lt!375109 () Unit!17584)

(assert (=> d!81254 (= lt!375114 lt!375109)))

(assert (=> d!81254 (isPrefixOf!0 lt!375116 lt!375116)))

(assert (=> d!81254 (= lt!375109 (lemmaIsPrefixRefl!0 lt!375116))))

(declare-fun lt!375108 () Unit!17584)

(declare-fun lt!375115 () Unit!17584)

(assert (=> d!81254 (= lt!375108 lt!375115)))

(assert (=> d!81254 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81254 (= lt!375115 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81254 (= lt!375116 (BitStream!10409 (buf!6200 (_2!11076 lt!374847)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)))))

(assert (=> d!81254 (isPrefixOf!0 thiss!982 (_2!11076 lt!374847))))

(assert (=> d!81254 (= (reader!0 thiss!982 (_2!11076 lt!374847)) lt!375104)))

(declare-fun b!240147 () Bool)

(declare-fun res!200466 () Bool)

(assert (=> b!240147 (=> (not res!200466) (not e!166465))))

(assert (=> b!240147 (= res!200466 (isPrefixOf!0 (_1!11075 lt!375104) thiss!982))))

(assert (= (and d!81254 c!11422) b!240144))

(assert (= (and d!81254 (not c!11422)) b!240143))

(assert (= (and d!81254 res!200465) b!240147))

(assert (= (and b!240147 res!200466) b!240145))

(assert (= (and b!240145 res!200467) b!240146))

(declare-fun m!362577 () Bool)

(assert (=> b!240147 m!362577))

(declare-fun m!362579 () Bool)

(assert (=> d!81254 m!362579))

(declare-fun m!362581 () Bool)

(assert (=> d!81254 m!362581))

(declare-fun m!362583 () Bool)

(assert (=> d!81254 m!362583))

(declare-fun m!362585 () Bool)

(assert (=> d!81254 m!362585))

(assert (=> d!81254 m!362425))

(declare-fun m!362587 () Bool)

(assert (=> d!81254 m!362587))

(declare-fun m!362589 () Bool)

(assert (=> d!81254 m!362589))

(declare-fun m!362591 () Bool)

(assert (=> d!81254 m!362591))

(declare-fun m!362593 () Bool)

(assert (=> d!81254 m!362593))

(declare-fun m!362595 () Bool)

(assert (=> d!81254 m!362595))

(declare-fun m!362597 () Bool)

(assert (=> d!81254 m!362597))

(declare-fun m!362599 () Bool)

(assert (=> b!240145 m!362599))

(assert (=> b!240144 m!362429))

(declare-fun m!362601 () Bool)

(assert (=> b!240144 m!362601))

(declare-fun m!362603 () Bool)

(assert (=> b!240144 m!362603))

(declare-fun m!362605 () Bool)

(assert (=> b!240146 m!362605))

(assert (=> b!240146 m!362427))

(assert (=> b!240146 m!362429))

(assert (=> b!240031 d!81254))

(declare-fun d!81282 () Bool)

(assert (=> d!81282 (= (inv!12 thiss!982) (invariant!0 (currentBit!11543 thiss!982) (currentByte!11548 thiss!982) (size!5743 (buf!6200 thiss!982))))))

(declare-fun bs!20489 () Bool)

(assert (= bs!20489 d!81282))

(assert (=> bs!20489 m!362419))

(assert (=> start!52126 d!81282))

(declare-fun d!81286 () Bool)

(assert (=> d!81286 (= (invariant!0 (currentBit!11543 thiss!982) (currentByte!11548 thiss!982) (size!5743 (buf!6200 thiss!982))) (and (bvsge (currentBit!11543 thiss!982) #b00000000000000000000000000000000) (bvslt (currentBit!11543 thiss!982) #b00000000000000000000000000001000) (bvsge (currentByte!11548 thiss!982) #b00000000000000000000000000000000) (or (bvslt (currentByte!11548 thiss!982) (size!5743 (buf!6200 thiss!982))) (and (= (currentBit!11543 thiss!982) #b00000000000000000000000000000000) (= (currentByte!11548 thiss!982) (size!5743 (buf!6200 thiss!982)))))))))

(assert (=> b!240032 d!81286))

(declare-fun d!81288 () Bool)

(declare-fun e!166491 () Bool)

(assert (=> d!81288 e!166491))

(declare-fun res!200513 () Bool)

(assert (=> d!81288 (=> (not res!200513) (not e!166491))))

(declare-fun lt!375188 () tuple2!20308)

(assert (=> d!81288 (= res!200513 (= (size!5743 (buf!6200 thiss!982)) (size!5743 (buf!6200 (_2!11076 lt!375188)))))))

(declare-fun choose!51 (BitStream!10408 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20308)

(assert (=> d!81288 (= lt!375188 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81288 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81288 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!375188)))

(declare-fun b!240194 () Bool)

(declare-fun lt!375192 () tuple2!20304)

(declare-fun lt!375187 () tuple2!20306)

(assert (=> b!240194 (= e!166491 (and (_2!11074 lt!375192) (= (_1!11074 lt!375192) (_2!11075 lt!375187))))))

(assert (=> b!240194 (= lt!375192 (checkBitsLoopPure!0 (_1!11075 lt!375187) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!375185 () Unit!17584)

(declare-fun lt!375189 () Unit!17584)

(assert (=> b!240194 (= lt!375185 lt!375189)))

(declare-fun lt!375186 () (_ BitVec 64))

(assert (=> b!240194 (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!375188)))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) lt!375186)))

(assert (=> b!240194 (= lt!375189 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6200 (_2!11076 lt!375188)) lt!375186))))

(declare-fun e!166492 () Bool)

(assert (=> b!240194 e!166492))

(declare-fun res!200515 () Bool)

(assert (=> b!240194 (=> (not res!200515) (not e!166492))))

(assert (=> b!240194 (= res!200515 (and (= (size!5743 (buf!6200 thiss!982)) (size!5743 (buf!6200 (_2!11076 lt!375188)))) (bvsge lt!375186 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240194 (= lt!375186 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240194 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240194 (= lt!375187 (reader!0 thiss!982 (_2!11076 lt!375188)))))

(declare-fun b!240195 () Bool)

(assert (=> b!240195 (= e!166492 (validate_offset_bits!1 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982)) lt!375186))))

(declare-fun b!240192 () Bool)

(declare-fun res!200512 () Bool)

(assert (=> b!240192 (=> (not res!200512) (not e!166491))))

(declare-fun lt!375191 () (_ BitVec 64))

(declare-fun lt!375190 () (_ BitVec 64))

(assert (=> b!240192 (= res!200512 (= (bitIndex!0 (size!5743 (buf!6200 (_2!11076 lt!375188))) (currentByte!11548 (_2!11076 lt!375188)) (currentBit!11543 (_2!11076 lt!375188))) (bvadd lt!375190 lt!375191)))))

(assert (=> b!240192 (or (not (= (bvand lt!375190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375191 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!375190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!375190 lt!375191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240192 (= lt!375191 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240192 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240192 (= lt!375190 (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)))))

(declare-fun b!240193 () Bool)

(declare-fun res!200514 () Bool)

(assert (=> b!240193 (=> (not res!200514) (not e!166491))))

(assert (=> b!240193 (= res!200514 (isPrefixOf!0 thiss!982 (_2!11076 lt!375188)))))

(assert (= (and d!81288 res!200513) b!240192))

(assert (= (and b!240192 res!200512) b!240193))

(assert (= (and b!240193 res!200514) b!240194))

(assert (= (and b!240194 res!200515) b!240195))

(declare-fun m!362641 () Bool)

(assert (=> b!240195 m!362641))

(declare-fun m!362643 () Bool)

(assert (=> b!240193 m!362643))

(declare-fun m!362645 () Bool)

(assert (=> d!81288 m!362645))

(declare-fun m!362647 () Bool)

(assert (=> b!240194 m!362647))

(declare-fun m!362649 () Bool)

(assert (=> b!240194 m!362649))

(declare-fun m!362651 () Bool)

(assert (=> b!240194 m!362651))

(declare-fun m!362653 () Bool)

(assert (=> b!240194 m!362653))

(declare-fun m!362655 () Bool)

(assert (=> b!240192 m!362655))

(assert (=> b!240192 m!362429))

(assert (=> b!240032 d!81288))

(declare-fun d!81296 () Bool)

(declare-fun e!166495 () Bool)

(assert (=> d!81296 e!166495))

(declare-fun res!200520 () Bool)

(assert (=> d!81296 (=> (not res!200520) (not e!166495))))

(declare-fun lt!375209 () (_ BitVec 64))

(declare-fun lt!375210 () (_ BitVec 64))

(declare-fun lt!375206 () (_ BitVec 64))

(assert (=> d!81296 (= res!200520 (= lt!375209 (bvsub lt!375210 lt!375206)))))

(assert (=> d!81296 (or (= (bvand lt!375210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375210 lt!375206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81296 (= lt!375206 (remainingBits!0 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))) ((_ sign_extend 32) (currentByte!11548 (_2!11076 lt!374847))) ((_ sign_extend 32) (currentBit!11543 (_2!11076 lt!374847)))))))

(declare-fun lt!375208 () (_ BitVec 64))

(declare-fun lt!375205 () (_ BitVec 64))

(assert (=> d!81296 (= lt!375210 (bvmul lt!375208 lt!375205))))

(assert (=> d!81296 (or (= lt!375208 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375205 (bvsdiv (bvmul lt!375208 lt!375205) lt!375208)))))

(assert (=> d!81296 (= lt!375205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81296 (= lt!375208 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))))))

(assert (=> d!81296 (= lt!375209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11548 (_2!11076 lt!374847))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11543 (_2!11076 lt!374847)))))))

(assert (=> d!81296 (invariant!0 (currentBit!11543 (_2!11076 lt!374847)) (currentByte!11548 (_2!11076 lt!374847)) (size!5743 (buf!6200 (_2!11076 lt!374847))))))

(assert (=> d!81296 (= (bitIndex!0 (size!5743 (buf!6200 (_2!11076 lt!374847))) (currentByte!11548 (_2!11076 lt!374847)) (currentBit!11543 (_2!11076 lt!374847))) lt!375209)))

(declare-fun b!240200 () Bool)

(declare-fun res!200521 () Bool)

(assert (=> b!240200 (=> (not res!200521) (not e!166495))))

(assert (=> b!240200 (= res!200521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375209))))

(declare-fun b!240201 () Bool)

(declare-fun lt!375207 () (_ BitVec 64))

(assert (=> b!240201 (= e!166495 (bvsle lt!375209 (bvmul lt!375207 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240201 (or (= lt!375207 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375207 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375207)))))

(assert (=> b!240201 (= lt!375207 ((_ sign_extend 32) (size!5743 (buf!6200 (_2!11076 lt!374847)))))))

(assert (= (and d!81296 res!200520) b!240200))

(assert (= (and b!240200 res!200521) b!240201))

(declare-fun m!362657 () Bool)

(assert (=> d!81296 m!362657))

(declare-fun m!362659 () Bool)

(assert (=> d!81296 m!362659))

(assert (=> b!240033 d!81296))

(declare-fun d!81298 () Bool)

(declare-fun e!166496 () Bool)

(assert (=> d!81298 e!166496))

(declare-fun res!200522 () Bool)

(assert (=> d!81298 (=> (not res!200522) (not e!166496))))

(declare-fun lt!375212 () (_ BitVec 64))

(declare-fun lt!375216 () (_ BitVec 64))

(declare-fun lt!375215 () (_ BitVec 64))

(assert (=> d!81298 (= res!200522 (= lt!375215 (bvsub lt!375216 lt!375212)))))

(assert (=> d!81298 (or (= (bvand lt!375216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375216 lt!375212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81298 (= lt!375212 (remainingBits!0 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))) ((_ sign_extend 32) (currentByte!11548 thiss!982)) ((_ sign_extend 32) (currentBit!11543 thiss!982))))))

(declare-fun lt!375214 () (_ BitVec 64))

(declare-fun lt!375211 () (_ BitVec 64))

(assert (=> d!81298 (= lt!375216 (bvmul lt!375214 lt!375211))))

(assert (=> d!81298 (or (= lt!375214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375211 (bvsdiv (bvmul lt!375214 lt!375211) lt!375214)))))

(assert (=> d!81298 (= lt!375211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81298 (= lt!375214 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))))))

(assert (=> d!81298 (= lt!375215 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11548 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11543 thiss!982))))))

(assert (=> d!81298 (invariant!0 (currentBit!11543 thiss!982) (currentByte!11548 thiss!982) (size!5743 (buf!6200 thiss!982)))))

(assert (=> d!81298 (= (bitIndex!0 (size!5743 (buf!6200 thiss!982)) (currentByte!11548 thiss!982) (currentBit!11543 thiss!982)) lt!375215)))

(declare-fun b!240202 () Bool)

(declare-fun res!200523 () Bool)

(assert (=> b!240202 (=> (not res!200523) (not e!166496))))

(assert (=> b!240202 (= res!200523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375215))))

(declare-fun b!240203 () Bool)

(declare-fun lt!375213 () (_ BitVec 64))

(assert (=> b!240203 (= e!166496 (bvsle lt!375215 (bvmul lt!375213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240203 (or (= lt!375213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375213)))))

(assert (=> b!240203 (= lt!375213 ((_ sign_extend 32) (size!5743 (buf!6200 thiss!982))))))

(assert (= (and d!81298 res!200522) b!240202))

(assert (= (and b!240202 res!200523) b!240203))

(assert (=> d!81298 m!362487))

(assert (=> d!81298 m!362419))

(assert (=> b!240033 d!81298))

(push 1)

(assert (not d!81282))

(assert (not b!240145))

(assert (not d!81236))

(assert (not b!240146))

(assert (not d!81298))

(assert (not d!81248))

(assert (not d!81288))

(assert (not b!240194))

(assert (not d!81244))

(assert (not b!240193))

(assert (not d!81296))

(assert (not b!240078))

(assert (not b!240080))

(assert (not b!240192))

(assert (not d!81254))

(assert (not b!240147))

(assert (not b!240144))

(assert (not b!240195))

(assert (not d!81246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

