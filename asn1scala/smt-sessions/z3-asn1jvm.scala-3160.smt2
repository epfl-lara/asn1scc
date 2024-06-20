; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72616 () Bool)

(assert start!72616)

(declare-fun res!266164 () Bool)

(declare-fun e!233721 () Bool)

(assert (=> start!72616 (=> (not res!266164) (not e!233721))))

(declare-datatypes ((array!20805 0))(
  ( (array!20806 (arr!10139 (Array (_ BitVec 32) (_ BitVec 8))) (size!9047 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14256 0))(
  ( (BitStream!14257 (buf!8189 array!20805) (currentByte!15135 (_ BitVec 32)) (currentBit!15130 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14256)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72616 (= res!266164 (validate_offset_bit!0 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))) ((_ sign_extend 32) (currentByte!15135 thiss!1702)) ((_ sign_extend 32) (currentBit!15130 thiss!1702))))))

(assert (=> start!72616 e!233721))

(declare-fun e!233724 () Bool)

(declare-fun inv!12 (BitStream!14256) Bool)

(assert (=> start!72616 (and (inv!12 thiss!1702) e!233724)))

(declare-fun b!324284 () Bool)

(declare-fun e!233723 () Bool)

(assert (=> b!324284 (= e!233721 e!233723)))

(declare-fun res!266163 () Bool)

(assert (=> b!324284 (=> res!266163 e!233723)))

(declare-datatypes ((Unit!22094 0))(
  ( (Unit!22095) )
))
(declare-datatypes ((tuple2!23764 0))(
  ( (tuple2!23765 (_1!13511 Unit!22094) (_2!13511 BitStream!14256)) )
))
(declare-fun lt!446846 () tuple2!23764)

(assert (=> b!324284 (= res!266163 (not (= (buf!8189 (_2!13511 lt!446846)) (buf!8189 thiss!1702))))))

(declare-fun increaseBitIndex!0 (BitStream!14256) tuple2!23764)

(assert (=> b!324284 (= lt!446846 (increaseBitIndex!0 thiss!1702))))

(declare-fun b!324285 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324285 (= e!233723 (not (= (bitIndex!0 (size!9047 (buf!8189 (_2!13511 lt!446846))) (currentByte!15135 (_2!13511 lt!446846)) (currentBit!15130 (_2!13511 lt!446846))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9047 (buf!8189 thiss!1702)) (currentByte!15135 thiss!1702) (currentBit!15130 thiss!1702))))))))

(declare-fun b!324286 () Bool)

(declare-fun array_inv!8599 (array!20805) Bool)

(assert (=> b!324286 (= e!233724 (array_inv!8599 (buf!8189 thiss!1702)))))

(assert (= (and start!72616 res!266164) b!324284))

(assert (= (and b!324284 (not res!266163)) b!324285))

(assert (= start!72616 b!324286))

(declare-fun m!462395 () Bool)

(assert (=> start!72616 m!462395))

(declare-fun m!462397 () Bool)

(assert (=> start!72616 m!462397))

(declare-fun m!462399 () Bool)

(assert (=> b!324284 m!462399))

(declare-fun m!462401 () Bool)

(assert (=> b!324285 m!462401))

(declare-fun m!462403 () Bool)

(assert (=> b!324285 m!462403))

(declare-fun m!462405 () Bool)

(assert (=> b!324286 m!462405))

(check-sat (not start!72616) (not b!324284) (not b!324285) (not b!324286))
(check-sat)
(get-model)

(declare-fun d!106546 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106546 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))) ((_ sign_extend 32) (currentByte!15135 thiss!1702)) ((_ sign_extend 32) (currentBit!15130 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))) ((_ sign_extend 32) (currentByte!15135 thiss!1702)) ((_ sign_extend 32) (currentBit!15130 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28066 () Bool)

(assert (= bs!28066 d!106546))

(declare-fun m!462419 () Bool)

(assert (=> bs!28066 m!462419))

(assert (=> start!72616 d!106546))

(declare-fun d!106548 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106548 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15130 thiss!1702) (currentByte!15135 thiss!1702) (size!9047 (buf!8189 thiss!1702))))))

(declare-fun bs!28067 () Bool)

(assert (= bs!28067 d!106548))

(declare-fun m!462421 () Bool)

(assert (=> bs!28067 m!462421))

(assert (=> start!72616 d!106548))

(declare-fun d!106550 () Bool)

(declare-fun e!233742 () Bool)

(assert (=> d!106550 e!233742))

(declare-fun res!266182 () Bool)

(assert (=> d!106550 (=> (not res!266182) (not e!233742))))

(declare-fun lt!446877 () (_ BitVec 64))

(declare-fun lt!446879 () tuple2!23764)

(declare-fun lt!446878 () (_ BitVec 64))

(assert (=> d!106550 (= res!266182 (= (bvadd lt!446877 lt!446878) (bitIndex!0 (size!9047 (buf!8189 (_2!13511 lt!446879))) (currentByte!15135 (_2!13511 lt!446879)) (currentBit!15130 (_2!13511 lt!446879)))))))

(assert (=> d!106550 (or (not (= (bvand lt!446877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446878 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446877 lt!446878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106550 (= lt!446878 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106550 (= lt!446877 (bitIndex!0 (size!9047 (buf!8189 thiss!1702)) (currentByte!15135 thiss!1702) (currentBit!15130 thiss!1702)))))

(declare-fun Unit!22100 () Unit!22094)

(declare-fun Unit!22101 () Unit!22094)

(assert (=> d!106550 (= lt!446879 (ite (bvslt (currentBit!15130 thiss!1702) #b00000000000000000000000000000111) (tuple2!23765 Unit!22100 (BitStream!14257 (buf!8189 thiss!1702) (currentByte!15135 thiss!1702) (bvadd (currentBit!15130 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23765 Unit!22101 (BitStream!14257 (buf!8189 thiss!1702) (bvadd (currentByte!15135 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106550 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))) ((_ sign_extend 32) (currentByte!15135 thiss!1702)) ((_ sign_extend 32) (currentBit!15130 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106550 (= (increaseBitIndex!0 thiss!1702) lt!446879)))

(declare-fun b!324306 () Bool)

(declare-fun res!266181 () Bool)

(assert (=> b!324306 (=> (not res!266181) (not e!233742))))

(declare-fun lt!446875 () (_ BitVec 64))

(declare-fun lt!446876 () (_ BitVec 64))

(assert (=> b!324306 (= res!266181 (= (bvsub lt!446875 lt!446876) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324306 (or (= (bvand lt!446875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446876 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446875 lt!446876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324306 (= lt!446876 (remainingBits!0 ((_ sign_extend 32) (size!9047 (buf!8189 (_2!13511 lt!446879)))) ((_ sign_extend 32) (currentByte!15135 (_2!13511 lt!446879))) ((_ sign_extend 32) (currentBit!15130 (_2!13511 lt!446879)))))))

(assert (=> b!324306 (= lt!446875 (remainingBits!0 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))) ((_ sign_extend 32) (currentByte!15135 thiss!1702)) ((_ sign_extend 32) (currentBit!15130 thiss!1702))))))

(declare-fun b!324307 () Bool)

(assert (=> b!324307 (= e!233742 (= (size!9047 (buf!8189 thiss!1702)) (size!9047 (buf!8189 (_2!13511 lt!446879)))))))

(assert (= (and d!106550 res!266182) b!324306))

(assert (= (and b!324306 res!266181) b!324307))

(declare-fun m!462433 () Bool)

(assert (=> d!106550 m!462433))

(assert (=> d!106550 m!462403))

(assert (=> d!106550 m!462419))

(declare-fun m!462435 () Bool)

(assert (=> b!324306 m!462435))

(assert (=> b!324306 m!462419))

(assert (=> b!324284 d!106550))

(declare-fun d!106564 () Bool)

(declare-fun e!233749 () Bool)

(assert (=> d!106564 e!233749))

(declare-fun res!266195 () Bool)

(assert (=> d!106564 (=> (not res!266195) (not e!233749))))

(declare-fun lt!446917 () (_ BitVec 64))

(declare-fun lt!446919 () (_ BitVec 64))

(declare-fun lt!446920 () (_ BitVec 64))

(assert (=> d!106564 (= res!266195 (= lt!446917 (bvsub lt!446919 lt!446920)))))

(assert (=> d!106564 (or (= (bvand lt!446919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446920 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446919 lt!446920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106564 (= lt!446920 (remainingBits!0 ((_ sign_extend 32) (size!9047 (buf!8189 (_2!13511 lt!446846)))) ((_ sign_extend 32) (currentByte!15135 (_2!13511 lt!446846))) ((_ sign_extend 32) (currentBit!15130 (_2!13511 lt!446846)))))))

(declare-fun lt!446921 () (_ BitVec 64))

(declare-fun lt!446918 () (_ BitVec 64))

(assert (=> d!106564 (= lt!446919 (bvmul lt!446921 lt!446918))))

(assert (=> d!106564 (or (= lt!446921 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446918 (bvsdiv (bvmul lt!446921 lt!446918) lt!446921)))))

(assert (=> d!106564 (= lt!446918 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106564 (= lt!446921 ((_ sign_extend 32) (size!9047 (buf!8189 (_2!13511 lt!446846)))))))

(assert (=> d!106564 (= lt!446917 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15135 (_2!13511 lt!446846))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15130 (_2!13511 lt!446846)))))))

(assert (=> d!106564 (invariant!0 (currentBit!15130 (_2!13511 lt!446846)) (currentByte!15135 (_2!13511 lt!446846)) (size!9047 (buf!8189 (_2!13511 lt!446846))))))

(assert (=> d!106564 (= (bitIndex!0 (size!9047 (buf!8189 (_2!13511 lt!446846))) (currentByte!15135 (_2!13511 lt!446846)) (currentBit!15130 (_2!13511 lt!446846))) lt!446917)))

(declare-fun b!324320 () Bool)

(declare-fun res!266196 () Bool)

(assert (=> b!324320 (=> (not res!266196) (not e!233749))))

(assert (=> b!324320 (= res!266196 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446917))))

(declare-fun b!324321 () Bool)

(declare-fun lt!446916 () (_ BitVec 64))

(assert (=> b!324321 (= e!233749 (bvsle lt!446917 (bvmul lt!446916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324321 (or (= lt!446916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446916)))))

(assert (=> b!324321 (= lt!446916 ((_ sign_extend 32) (size!9047 (buf!8189 (_2!13511 lt!446846)))))))

(assert (= (and d!106564 res!266195) b!324320))

(assert (= (and b!324320 res!266196) b!324321))

(declare-fun m!462443 () Bool)

(assert (=> d!106564 m!462443))

(declare-fun m!462445 () Bool)

(assert (=> d!106564 m!462445))

(assert (=> b!324285 d!106564))

(declare-fun d!106574 () Bool)

(declare-fun e!233750 () Bool)

(assert (=> d!106574 e!233750))

(declare-fun res!266197 () Bool)

(assert (=> d!106574 (=> (not res!266197) (not e!233750))))

(declare-fun lt!446925 () (_ BitVec 64))

(declare-fun lt!446923 () (_ BitVec 64))

(declare-fun lt!446926 () (_ BitVec 64))

(assert (=> d!106574 (= res!266197 (= lt!446923 (bvsub lt!446925 lt!446926)))))

(assert (=> d!106574 (or (= (bvand lt!446925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446925 lt!446926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106574 (= lt!446926 (remainingBits!0 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))) ((_ sign_extend 32) (currentByte!15135 thiss!1702)) ((_ sign_extend 32) (currentBit!15130 thiss!1702))))))

(declare-fun lt!446927 () (_ BitVec 64))

(declare-fun lt!446924 () (_ BitVec 64))

(assert (=> d!106574 (= lt!446925 (bvmul lt!446927 lt!446924))))

(assert (=> d!106574 (or (= lt!446927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446924 (bvsdiv (bvmul lt!446927 lt!446924) lt!446927)))))

(assert (=> d!106574 (= lt!446924 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106574 (= lt!446927 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))))))

(assert (=> d!106574 (= lt!446923 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15135 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15130 thiss!1702))))))

(assert (=> d!106574 (invariant!0 (currentBit!15130 thiss!1702) (currentByte!15135 thiss!1702) (size!9047 (buf!8189 thiss!1702)))))

(assert (=> d!106574 (= (bitIndex!0 (size!9047 (buf!8189 thiss!1702)) (currentByte!15135 thiss!1702) (currentBit!15130 thiss!1702)) lt!446923)))

(declare-fun b!324322 () Bool)

(declare-fun res!266198 () Bool)

(assert (=> b!324322 (=> (not res!266198) (not e!233750))))

(assert (=> b!324322 (= res!266198 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446923))))

(declare-fun b!324323 () Bool)

(declare-fun lt!446922 () (_ BitVec 64))

(assert (=> b!324323 (= e!233750 (bvsle lt!446923 (bvmul lt!446922 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324323 (or (= lt!446922 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446922 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446922)))))

(assert (=> b!324323 (= lt!446922 ((_ sign_extend 32) (size!9047 (buf!8189 thiss!1702))))))

(assert (= (and d!106574 res!266197) b!324322))

(assert (= (and b!324322 res!266198) b!324323))

(assert (=> d!106574 m!462419))

(assert (=> d!106574 m!462421))

(assert (=> b!324285 d!106574))

(declare-fun d!106576 () Bool)

(assert (=> d!106576 (= (array_inv!8599 (buf!8189 thiss!1702)) (bvsge (size!9047 (buf!8189 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324286 d!106576))

(check-sat (not d!106546) (not d!106550) (not d!106574) (not d!106564) (not d!106548) (not b!324306))
(check-sat)
