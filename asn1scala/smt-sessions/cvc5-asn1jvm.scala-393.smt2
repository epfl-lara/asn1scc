; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10304 () Bool)

(assert start!10304)

(declare-fun b!52012 () Bool)

(declare-fun res!43469 () Bool)

(declare-fun e!34312 () Bool)

(assert (=> b!52012 (=> (not res!43469) (not e!34312))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2368 0))(
  ( (array!2369 (arr!1616 (Array (_ BitVec 32) (_ BitVec 8))) (size!1080 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1864 0))(
  ( (BitStream!1865 (buf!1436 array!2368) (currentByte!2971 (_ BitVec 32)) (currentBit!2966 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1864)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52012 (= res!43469 (validate_offset_bits!1 ((_ sign_extend 32) (size!1080 (buf!1436 thiss!1379))) ((_ sign_extend 32) (currentByte!2971 thiss!1379)) ((_ sign_extend 32) (currentBit!2966 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52013 () Bool)

(declare-fun e!34310 () Bool)

(assert (=> b!52013 (= e!34312 (not e!34310))))

(declare-fun res!43470 () Bool)

(assert (=> b!52013 (=> res!43470 e!34310)))

(declare-fun lt!81136 () (_ BitVec 64))

(assert (=> b!52013 (= res!43470 (not (= lt!81136 (bvsub (bvadd lt!81136 to!314) i!635))))))

(declare-fun isPrefixOf!0 (BitStream!1864 BitStream!1864) Bool)

(assert (=> b!52013 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3582 0))(
  ( (Unit!3583) )
))
(declare-fun lt!81135 () Unit!3582)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1864) Unit!3582)

(assert (=> b!52013 (= lt!81135 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52013 (= lt!81136 (bitIndex!0 (size!1080 (buf!1436 thiss!1379)) (currentByte!2971 thiss!1379) (currentBit!2966 thiss!1379)))))

(declare-fun b!52015 () Bool)

(declare-fun e!34311 () Bool)

(declare-fun array_inv!985 (array!2368) Bool)

(assert (=> b!52015 (= e!34311 (array_inv!985 (buf!1436 thiss!1379)))))

(declare-fun b!52014 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!52014 (= e!34310 (invariant!0 (currentBit!2966 thiss!1379) (currentByte!2971 thiss!1379) (size!1080 (buf!1436 thiss!1379))))))

(declare-fun res!43468 () Bool)

(assert (=> start!10304 (=> (not res!43468) (not e!34312))))

(declare-fun srcBuffer!2 () array!2368)

(assert (=> start!10304 (= res!43468 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1080 srcBuffer!2))))))))

(assert (=> start!10304 e!34312))

(assert (=> start!10304 true))

(assert (=> start!10304 (array_inv!985 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1864) Bool)

(assert (=> start!10304 (and (inv!12 thiss!1379) e!34311)))

(assert (= (and start!10304 res!43468) b!52012))

(assert (= (and b!52012 res!43469) b!52013))

(assert (= (and b!52013 (not res!43470)) b!52014))

(assert (= start!10304 b!52015))

(declare-fun m!82197 () Bool)

(assert (=> b!52012 m!82197))

(declare-fun m!82199 () Bool)

(assert (=> b!52015 m!82199))

(declare-fun m!82201 () Bool)

(assert (=> b!52013 m!82201))

(declare-fun m!82203 () Bool)

(assert (=> b!52013 m!82203))

(declare-fun m!82205 () Bool)

(assert (=> b!52013 m!82205))

(declare-fun m!82207 () Bool)

(assert (=> b!52014 m!82207))

(declare-fun m!82209 () Bool)

(assert (=> start!10304 m!82209))

(declare-fun m!82211 () Bool)

(assert (=> start!10304 m!82211))

(push 1)

(assert (not b!52015))

(assert (not b!52012))

(assert (not start!10304))

(assert (not b!52014))

(assert (not b!52013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16564 () Bool)

(assert (=> d!16564 (= (array_inv!985 srcBuffer!2) (bvsge (size!1080 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10304 d!16564))

(declare-fun d!16566 () Bool)

(assert (=> d!16566 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2966 thiss!1379) (currentByte!2971 thiss!1379) (size!1080 (buf!1436 thiss!1379))))))

(declare-fun bs!4146 () Bool)

(assert (= bs!4146 d!16566))

(assert (=> bs!4146 m!82207))

(assert (=> start!10304 d!16566))

(declare-fun d!16568 () Bool)

(assert (=> d!16568 (= (array_inv!985 (buf!1436 thiss!1379)) (bvsge (size!1080 (buf!1436 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52015 d!16568))

(declare-fun d!16570 () Bool)

(assert (=> d!16570 (= (invariant!0 (currentBit!2966 thiss!1379) (currentByte!2971 thiss!1379) (size!1080 (buf!1436 thiss!1379))) (and (bvsge (currentBit!2966 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2966 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2971 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2971 thiss!1379) (size!1080 (buf!1436 thiss!1379))) (and (= (currentBit!2966 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2971 thiss!1379) (size!1080 (buf!1436 thiss!1379)))))))))

(assert (=> b!52014 d!16570))

(declare-fun d!16572 () Bool)

(declare-fun res!43511 () Bool)

(declare-fun e!34358 () Bool)

(assert (=> d!16572 (=> (not res!43511) (not e!34358))))

(assert (=> d!16572 (= res!43511 (= (size!1080 (buf!1436 thiss!1379)) (size!1080 (buf!1436 thiss!1379))))))

(assert (=> d!16572 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!34358)))

(declare-fun b!52061 () Bool)

(declare-fun res!43510 () Bool)

(assert (=> b!52061 (=> (not res!43510) (not e!34358))))

(assert (=> b!52061 (= res!43510 (bvsle (bitIndex!0 (size!1080 (buf!1436 thiss!1379)) (currentByte!2971 thiss!1379) (currentBit!2966 thiss!1379)) (bitIndex!0 (size!1080 (buf!1436 thiss!1379)) (currentByte!2971 thiss!1379) (currentBit!2966 thiss!1379))))))

(declare-fun b!52062 () Bool)

(declare-fun e!34357 () Bool)

(assert (=> b!52062 (= e!34358 e!34357)))

(declare-fun res!43512 () Bool)

(assert (=> b!52062 (=> res!43512 e!34357)))

(assert (=> b!52062 (= res!43512 (= (size!1080 (buf!1436 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52063 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2368 array!2368 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52063 (= e!34357 (arrayBitRangesEq!0 (buf!1436 thiss!1379) (buf!1436 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1080 (buf!1436 thiss!1379)) (currentByte!2971 thiss!1379) (currentBit!2966 thiss!1379))))))

(assert (= (and d!16572 res!43511) b!52061))

(assert (= (and b!52061 res!43510) b!52062))

(assert (= (and b!52062 (not res!43512)) b!52063))

(assert (=> b!52061 m!82205))

(assert (=> b!52061 m!82205))

(assert (=> b!52063 m!82205))

(assert (=> b!52063 m!82205))

(declare-fun m!82251 () Bool)

(assert (=> b!52063 m!82251))

(assert (=> b!52013 d!16572))

(declare-fun d!16582 () Bool)

(assert (=> d!16582 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81172 () Unit!3582)

(declare-fun choose!11 (BitStream!1864) Unit!3582)

(assert (=> d!16582 (= lt!81172 (choose!11 thiss!1379))))

(assert (=> d!16582 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81172)))

(declare-fun bs!4150 () Bool)

(assert (= bs!4150 d!16582))

(assert (=> bs!4150 m!82201))

(declare-fun m!82253 () Bool)

(assert (=> bs!4150 m!82253))

(assert (=> b!52013 d!16582))

(declare-fun d!16584 () Bool)

(declare-fun e!34361 () Bool)

(assert (=> d!16584 e!34361))

(declare-fun res!43517 () Bool)

(assert (=> d!16584 (=> (not res!43517) (not e!34361))))

(declare-fun lt!81188 () (_ BitVec 64))

(declare-fun lt!81187 () (_ BitVec 64))

(declare-fun lt!81186 () (_ BitVec 64))

(assert (=> d!16584 (= res!43517 (= lt!81187 (bvsub lt!81188 lt!81186)))))

(assert (=> d!16584 (or (= (bvand lt!81188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81188 lt!81186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16584 (= lt!81186 (remainingBits!0 ((_ sign_extend 32) (size!1080 (buf!1436 thiss!1379))) ((_ sign_extend 32) (currentByte!2971 thiss!1379)) ((_ sign_extend 32) (currentBit!2966 thiss!1379))))))

(declare-fun lt!81185 () (_ BitVec 64))

(declare-fun lt!81190 () (_ BitVec 64))

(assert (=> d!16584 (= lt!81188 (bvmul lt!81185 lt!81190))))

(assert (=> d!16584 (or (= lt!81185 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81190 (bvsdiv (bvmul lt!81185 lt!81190) lt!81185)))))

(assert (=> d!16584 (= lt!81190 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16584 (= lt!81185 ((_ sign_extend 32) (size!1080 (buf!1436 thiss!1379))))))

(assert (=> d!16584 (= lt!81187 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2971 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2966 thiss!1379))))))

(assert (=> d!16584 (invariant!0 (currentBit!2966 thiss!1379) (currentByte!2971 thiss!1379) (size!1080 (buf!1436 thiss!1379)))))

(assert (=> d!16584 (= (bitIndex!0 (size!1080 (buf!1436 thiss!1379)) (currentByte!2971 thiss!1379) (currentBit!2966 thiss!1379)) lt!81187)))

(declare-fun b!52068 () Bool)

(declare-fun res!43518 () Bool)

(assert (=> b!52068 (=> (not res!43518) (not e!34361))))

(assert (=> b!52068 (= res!43518 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81187))))

(declare-fun b!52069 () Bool)

(declare-fun lt!81189 () (_ BitVec 64))

(assert (=> b!52069 (= e!34361 (bvsle lt!81187 (bvmul lt!81189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52069 (or (= lt!81189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81189)))))

(assert (=> b!52069 (= lt!81189 ((_ sign_extend 32) (size!1080 (buf!1436 thiss!1379))))))

(assert (= (and d!16584 res!43517) b!52068))

(assert (= (and b!52068 res!43518) b!52069))

(declare-fun m!82255 () Bool)

(assert (=> d!16584 m!82255))

(assert (=> d!16584 m!82207))

(assert (=> b!52013 d!16584))

(declare-fun d!16594 () Bool)

(assert (=> d!16594 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1080 (buf!1436 thiss!1379))) ((_ sign_extend 32) (currentByte!2971 thiss!1379)) ((_ sign_extend 32) (currentBit!2966 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1080 (buf!1436 thiss!1379))) ((_ sign_extend 32) (currentByte!2971 thiss!1379)) ((_ sign_extend 32) (currentBit!2966 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4152 () Bool)

(assert (= bs!4152 d!16594))

(assert (=> bs!4152 m!82255))

(assert (=> b!52012 d!16594))

(push 1)

(assert (not d!16566))

(assert (not b!52063))

(assert (not d!16582))

(assert (not b!52061))

(assert (not d!16584))

(assert (not d!16594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

