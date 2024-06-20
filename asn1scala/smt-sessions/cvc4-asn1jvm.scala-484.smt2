; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14296 () Bool)

(assert start!14296)

(declare-fun res!61389 () Bool)

(declare-fun e!48530 () Bool)

(assert (=> start!14296 (=> (not res!61389) (not e!48530))))

(declare-datatypes ((array!3017 0))(
  ( (array!3018 (arr!2005 (Array (_ BitVec 32) (_ BitVec 8))) (size!1411 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3017)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14296 (= res!61389 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1411 srcBuffer!2))))))))

(assert (=> start!14296 e!48530))

(assert (=> start!14296 true))

(declare-fun array_inv!1257 (array!3017) Bool)

(assert (=> start!14296 (array_inv!1257 srcBuffer!2)))

(declare-datatypes ((BitStream!2396 0))(
  ( (BitStream!2397 (buf!1792 array!3017) (currentByte!3530 (_ BitVec 32)) (currentBit!3525 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2396)

(declare-fun e!48527 () Bool)

(declare-fun inv!12 (BitStream!2396) Bool)

(assert (=> start!14296 (and (inv!12 thiss!1379) e!48527)))

(declare-fun b!74267 () Bool)

(declare-fun res!61388 () Bool)

(assert (=> b!74267 (=> (not res!61388) (not e!48530))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74267 (= res!61388 (validate_offset_bits!1 ((_ sign_extend 32) (size!1411 (buf!1792 thiss!1379))) ((_ sign_extend 32) (currentByte!3530 thiss!1379)) ((_ sign_extend 32) (currentBit!3525 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74268 () Bool)

(declare-fun lt!119590 () (_ BitVec 64))

(assert (=> b!74268 (= e!48530 (not (or (bvslt i!635 to!314) (let ((bdg!3624 (bvadd lt!119590 to!314))) (let ((bdg!3625 (bvand bdg!3624 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!3625 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!3625 (bvand (bvsub bdg!3624 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun isPrefixOf!0 (BitStream!2396 BitStream!2396) Bool)

(assert (=> b!74268 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4899 0))(
  ( (Unit!4900) )
))
(declare-fun lt!119589 () Unit!4899)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2396) Unit!4899)

(assert (=> b!74268 (= lt!119589 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74268 (= lt!119590 (bitIndex!0 (size!1411 (buf!1792 thiss!1379)) (currentByte!3530 thiss!1379) (currentBit!3525 thiss!1379)))))

(declare-fun b!74269 () Bool)

(assert (=> b!74269 (= e!48527 (array_inv!1257 (buf!1792 thiss!1379)))))

(assert (= (and start!14296 res!61389) b!74267))

(assert (= (and b!74267 res!61388) b!74268))

(assert (= start!14296 b!74269))

(declare-fun m!119225 () Bool)

(assert (=> start!14296 m!119225))

(declare-fun m!119227 () Bool)

(assert (=> start!14296 m!119227))

(declare-fun m!119229 () Bool)

(assert (=> b!74267 m!119229))

(declare-fun m!119231 () Bool)

(assert (=> b!74268 m!119231))

(declare-fun m!119233 () Bool)

(assert (=> b!74268 m!119233))

(declare-fun m!119235 () Bool)

(assert (=> b!74268 m!119235))

(declare-fun m!119237 () Bool)

(assert (=> b!74269 m!119237))

(push 1)

(assert (not b!74269))

(assert (not start!14296))

(assert (not b!74268))

(assert (not b!74267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23628 () Bool)

(assert (=> d!23628 (= (array_inv!1257 (buf!1792 thiss!1379)) (bvsge (size!1411 (buf!1792 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74269 d!23628))

(declare-fun d!23630 () Bool)

(assert (=> d!23630 (= (array_inv!1257 srcBuffer!2) (bvsge (size!1411 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14296 d!23630))

(declare-fun d!23632 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!23632 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3525 thiss!1379) (currentByte!3530 thiss!1379) (size!1411 (buf!1792 thiss!1379))))))

(declare-fun bs!5678 () Bool)

(assert (= bs!5678 d!23632))

(declare-fun m!119255 () Bool)

(assert (=> bs!5678 m!119255))

(assert (=> start!14296 d!23632))

(declare-fun d!23634 () Bool)

(declare-fun res!61427 () Bool)

(declare-fun e!48553 () Bool)

(assert (=> d!23634 (=> (not res!61427) (not e!48553))))

(assert (=> d!23634 (= res!61427 (= (size!1411 (buf!1792 thiss!1379)) (size!1411 (buf!1792 thiss!1379))))))

(assert (=> d!23634 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48553)))

(declare-fun b!74306 () Bool)

(declare-fun res!61426 () Bool)

(assert (=> b!74306 (=> (not res!61426) (not e!48553))))

(assert (=> b!74306 (= res!61426 (bvsle (bitIndex!0 (size!1411 (buf!1792 thiss!1379)) (currentByte!3530 thiss!1379) (currentBit!3525 thiss!1379)) (bitIndex!0 (size!1411 (buf!1792 thiss!1379)) (currentByte!3530 thiss!1379) (currentBit!3525 thiss!1379))))))

(declare-fun b!74307 () Bool)

(declare-fun e!48554 () Bool)

(assert (=> b!74307 (= e!48553 e!48554)))

(declare-fun res!61428 () Bool)

(assert (=> b!74307 (=> res!61428 e!48554)))

(assert (=> b!74307 (= res!61428 (= (size!1411 (buf!1792 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74308 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3017 array!3017 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74308 (= e!48554 (arrayBitRangesEq!0 (buf!1792 thiss!1379) (buf!1792 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1411 (buf!1792 thiss!1379)) (currentByte!3530 thiss!1379) (currentBit!3525 thiss!1379))))))

(assert (= (and d!23634 res!61427) b!74306))

(assert (= (and b!74306 res!61426) b!74307))

(assert (= (and b!74307 (not res!61428)) b!74308))

(assert (=> b!74306 m!119235))

(assert (=> b!74306 m!119235))

(assert (=> b!74308 m!119235))

(assert (=> b!74308 m!119235))

(declare-fun m!119257 () Bool)

(assert (=> b!74308 m!119257))

(assert (=> b!74268 d!23634))

(declare-fun d!23636 () Bool)

(assert (=> d!23636 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119635 () Unit!4899)

(declare-fun choose!11 (BitStream!2396) Unit!4899)

(assert (=> d!23636 (= lt!119635 (choose!11 thiss!1379))))

(assert (=> d!23636 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119635)))

(declare-fun bs!5680 () Bool)

(assert (= bs!5680 d!23636))

(assert (=> bs!5680 m!119231))

(declare-fun m!119259 () Bool)

(assert (=> bs!5680 m!119259))

(assert (=> b!74268 d!23636))

(declare-fun d!23638 () Bool)

(declare-fun e!48557 () Bool)

(assert (=> d!23638 e!48557))

(declare-fun res!61433 () Bool)

(assert (=> d!23638 (=> (not res!61433) (not e!48557))))

(declare-fun lt!119650 () (_ BitVec 64))

(declare-fun lt!119652 () (_ BitVec 64))

(declare-fun lt!119651 () (_ BitVec 64))

(assert (=> d!23638 (= res!61433 (= lt!119650 (bvsub lt!119651 lt!119652)))))

(assert (=> d!23638 (or (= (bvand lt!119651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119651 lt!119652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23638 (= lt!119652 (remainingBits!0 ((_ sign_extend 32) (size!1411 (buf!1792 thiss!1379))) ((_ sign_extend 32) (currentByte!3530 thiss!1379)) ((_ sign_extend 32) (currentBit!3525 thiss!1379))))))

(declare-fun lt!119653 () (_ BitVec 64))

(declare-fun lt!119649 () (_ BitVec 64))

(assert (=> d!23638 (= lt!119651 (bvmul lt!119653 lt!119649))))

(assert (=> d!23638 (or (= lt!119653 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119649 (bvsdiv (bvmul lt!119653 lt!119649) lt!119653)))))

(assert (=> d!23638 (= lt!119649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23638 (= lt!119653 ((_ sign_extend 32) (size!1411 (buf!1792 thiss!1379))))))

(assert (=> d!23638 (= lt!119650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3530 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3525 thiss!1379))))))

(assert (=> d!23638 (invariant!0 (currentBit!3525 thiss!1379) (currentByte!3530 thiss!1379) (size!1411 (buf!1792 thiss!1379)))))

(assert (=> d!23638 (= (bitIndex!0 (size!1411 (buf!1792 thiss!1379)) (currentByte!3530 thiss!1379) (currentBit!3525 thiss!1379)) lt!119650)))

(declare-fun b!74313 () Bool)

(declare-fun res!61434 () Bool)

(assert (=> b!74313 (=> (not res!61434) (not e!48557))))

(assert (=> b!74313 (= res!61434 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119650))))

(declare-fun b!74314 () Bool)

(declare-fun lt!119648 () (_ BitVec 64))

(assert (=> b!74314 (= e!48557 (bvsle lt!119650 (bvmul lt!119648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74314 (or (= lt!119648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119648)))))

(assert (=> b!74314 (= lt!119648 ((_ sign_extend 32) (size!1411 (buf!1792 thiss!1379))))))

(assert (= (and d!23638 res!61433) b!74313))

(assert (= (and b!74313 res!61434) b!74314))

(declare-fun m!119261 () Bool)

(assert (=> d!23638 m!119261))

(assert (=> d!23638 m!119255))

(assert (=> b!74268 d!23638))

(declare-fun d!23640 () Bool)

(assert (=> d!23640 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1411 (buf!1792 thiss!1379))) ((_ sign_extend 32) (currentByte!3530 thiss!1379)) ((_ sign_extend 32) (currentBit!3525 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1411 (buf!1792 thiss!1379))) ((_ sign_extend 32) (currentByte!3530 thiss!1379)) ((_ sign_extend 32) (currentBit!3525 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5681 () Bool)

(assert (= bs!5681 d!23640))

(assert (=> bs!5681 m!119261))

(assert (=> b!74267 d!23640))

(push 1)

(assert (not d!23638))

(assert (not b!74306))

(assert (not d!23636))

(assert (not d!23632))

(assert (not d!23640))

(assert (not b!74308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

