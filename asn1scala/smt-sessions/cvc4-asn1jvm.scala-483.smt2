; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14254 () Bool)

(assert start!14254)

(declare-fun res!61326 () Bool)

(declare-fun e!48466 () Bool)

(assert (=> start!14254 (=> (not res!61326) (not e!48466))))

(declare-datatypes ((array!3008 0))(
  ( (array!3009 (arr!2002 (Array (_ BitVec 32) (_ BitVec 8))) (size!1408 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3008)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14254 (= res!61326 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1408 srcBuffer!2))))))))

(assert (=> start!14254 e!48466))

(assert (=> start!14254 true))

(declare-fun array_inv!1254 (array!3008) Bool)

(assert (=> start!14254 (array_inv!1254 srcBuffer!2)))

(declare-datatypes ((BitStream!2390 0))(
  ( (BitStream!2391 (buf!1789 array!3008) (currentByte!3521 (_ BitVec 32)) (currentBit!3516 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2390)

(declare-fun e!48465 () Bool)

(declare-fun inv!12 (BitStream!2390) Bool)

(assert (=> start!14254 (and (inv!12 thiss!1379) e!48465)))

(declare-fun b!74195 () Bool)

(declare-fun res!61325 () Bool)

(assert (=> b!74195 (=> (not res!61325) (not e!48466))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74195 (= res!61325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1408 (buf!1789 thiss!1379))) ((_ sign_extend 32) (currentByte!3521 thiss!1379)) ((_ sign_extend 32) (currentBit!3516 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!119508 () (_ BitVec 64))

(declare-fun b!74196 () Bool)

(assert (=> b!74196 (= e!48466 (not (or (bvslt i!635 to!314) (let ((bdg!3621 (bvand lt!119508 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!3621 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!3621 (bvand (bvadd lt!119508 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun isPrefixOf!0 (BitStream!2390 BitStream!2390) Bool)

(assert (=> b!74196 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4893 0))(
  ( (Unit!4894) )
))
(declare-fun lt!119509 () Unit!4893)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2390) Unit!4893)

(assert (=> b!74196 (= lt!119509 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74196 (= lt!119508 (bitIndex!0 (size!1408 (buf!1789 thiss!1379)) (currentByte!3521 thiss!1379) (currentBit!3516 thiss!1379)))))

(declare-fun b!74197 () Bool)

(assert (=> b!74197 (= e!48465 (array_inv!1254 (buf!1789 thiss!1379)))))

(assert (= (and start!14254 res!61326) b!74195))

(assert (= (and b!74195 res!61325) b!74196))

(assert (= start!14254 b!74197))

(declare-fun m!119159 () Bool)

(assert (=> start!14254 m!119159))

(declare-fun m!119161 () Bool)

(assert (=> start!14254 m!119161))

(declare-fun m!119163 () Bool)

(assert (=> b!74195 m!119163))

(declare-fun m!119165 () Bool)

(assert (=> b!74196 m!119165))

(declare-fun m!119167 () Bool)

(assert (=> b!74196 m!119167))

(declare-fun m!119169 () Bool)

(assert (=> b!74196 m!119169))

(declare-fun m!119171 () Bool)

(assert (=> b!74197 m!119171))

(push 1)

(assert (not b!74195))

(assert (not b!74196))

(assert (not start!14254))

(assert (not b!74197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23578 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1408 (buf!1789 thiss!1379))) ((_ sign_extend 32) (currentByte!3521 thiss!1379)) ((_ sign_extend 32) (currentBit!3516 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1408 (buf!1789 thiss!1379))) ((_ sign_extend 32) (currentByte!3521 thiss!1379)) ((_ sign_extend 32) (currentBit!3516 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5662 () Bool)

(assert (= bs!5662 d!23578))

(declare-fun m!119187 () Bool)

(assert (=> bs!5662 m!119187))

(assert (=> b!74195 d!23578))

(declare-fun d!23580 () Bool)

(declare-fun res!61359 () Bool)

(declare-fun e!48487 () Bool)

(assert (=> d!23580 (=> (not res!61359) (not e!48487))))

(assert (=> d!23580 (= res!61359 (= (size!1408 (buf!1789 thiss!1379)) (size!1408 (buf!1789 thiss!1379))))))

(assert (=> d!23580 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48487)))

(declare-fun b!74228 () Bool)

(declare-fun res!61358 () Bool)

(assert (=> b!74228 (=> (not res!61358) (not e!48487))))

(assert (=> b!74228 (= res!61358 (bvsle (bitIndex!0 (size!1408 (buf!1789 thiss!1379)) (currentByte!3521 thiss!1379) (currentBit!3516 thiss!1379)) (bitIndex!0 (size!1408 (buf!1789 thiss!1379)) (currentByte!3521 thiss!1379) (currentBit!3516 thiss!1379))))))

(declare-fun b!74229 () Bool)

(declare-fun e!48488 () Bool)

(assert (=> b!74229 (= e!48487 e!48488)))

(declare-fun res!61357 () Bool)

(assert (=> b!74229 (=> res!61357 e!48488)))

(assert (=> b!74229 (= res!61357 (= (size!1408 (buf!1789 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74230 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3008 array!3008 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74230 (= e!48488 (arrayBitRangesEq!0 (buf!1789 thiss!1379) (buf!1789 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1408 (buf!1789 thiss!1379)) (currentByte!3521 thiss!1379) (currentBit!3516 thiss!1379))))))

(assert (= (and d!23580 res!61359) b!74228))

(assert (= (and b!74228 res!61358) b!74229))

(assert (= (and b!74229 (not res!61357)) b!74230))

(assert (=> b!74228 m!119169))

(assert (=> b!74228 m!119169))

(assert (=> b!74230 m!119169))

(assert (=> b!74230 m!119169))

(declare-fun m!119189 () Bool)

(assert (=> b!74230 m!119189))

(assert (=> b!74196 d!23580))

(declare-fun d!23582 () Bool)

(assert (=> d!23582 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119554 () Unit!4893)

(declare-fun choose!11 (BitStream!2390) Unit!4893)

(assert (=> d!23582 (= lt!119554 (choose!11 thiss!1379))))

(assert (=> d!23582 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119554)))

(declare-fun bs!5664 () Bool)

(assert (= bs!5664 d!23582))

(assert (=> bs!5664 m!119165))

(declare-fun m!119193 () Bool)

(assert (=> bs!5664 m!119193))

(assert (=> b!74196 d!23582))

(declare-fun d!23588 () Bool)

(declare-fun e!48494 () Bool)

(assert (=> d!23588 e!48494))

(declare-fun res!61371 () Bool)

(assert (=> d!23588 (=> (not res!61371) (not e!48494))))

(declare-fun lt!119570 () (_ BitVec 64))

(declare-fun lt!119569 () (_ BitVec 64))

(declare-fun lt!119572 () (_ BitVec 64))

(assert (=> d!23588 (= res!61371 (= lt!119569 (bvsub lt!119572 lt!119570)))))

(assert (=> d!23588 (or (= (bvand lt!119572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119572 lt!119570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23588 (= lt!119570 (remainingBits!0 ((_ sign_extend 32) (size!1408 (buf!1789 thiss!1379))) ((_ sign_extend 32) (currentByte!3521 thiss!1379)) ((_ sign_extend 32) (currentBit!3516 thiss!1379))))))

(declare-fun lt!119571 () (_ BitVec 64))

(declare-fun lt!119567 () (_ BitVec 64))

(assert (=> d!23588 (= lt!119572 (bvmul lt!119571 lt!119567))))

(assert (=> d!23588 (or (= lt!119571 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119567 (bvsdiv (bvmul lt!119571 lt!119567) lt!119571)))))

(assert (=> d!23588 (= lt!119567 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23588 (= lt!119571 ((_ sign_extend 32) (size!1408 (buf!1789 thiss!1379))))))

(assert (=> d!23588 (= lt!119569 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3521 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3516 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!23588 (invariant!0 (currentBit!3516 thiss!1379) (currentByte!3521 thiss!1379) (size!1408 (buf!1789 thiss!1379)))))

(assert (=> d!23588 (= (bitIndex!0 (size!1408 (buf!1789 thiss!1379)) (currentByte!3521 thiss!1379) (currentBit!3516 thiss!1379)) lt!119569)))

(declare-fun b!74241 () Bool)

(declare-fun res!61370 () Bool)

(assert (=> b!74241 (=> (not res!61370) (not e!48494))))

(assert (=> b!74241 (= res!61370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119569))))

(declare-fun b!74242 () Bool)

(declare-fun lt!119568 () (_ BitVec 64))

(assert (=> b!74242 (= e!48494 (bvsle lt!119569 (bvmul lt!119568 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74242 (or (= lt!119568 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119568 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119568)))))

(assert (=> b!74242 (= lt!119568 ((_ sign_extend 32) (size!1408 (buf!1789 thiss!1379))))))

(assert (= (and d!23588 res!61371) b!74241))

(assert (= (and b!74241 res!61370) b!74242))

(assert (=> d!23588 m!119187))

(declare-fun m!119195 () Bool)

(assert (=> d!23588 m!119195))

(assert (=> b!74196 d!23588))

(declare-fun d!23592 () Bool)

(assert (=> d!23592 (= (array_inv!1254 srcBuffer!2) (bvsge (size!1408 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14254 d!23592))

(declare-fun d!23594 () Bool)

(assert (=> d!23594 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3516 thiss!1379) (currentByte!3521 thiss!1379) (size!1408 (buf!1789 thiss!1379))))))

(declare-fun bs!5666 () Bool)

(assert (= bs!5666 d!23594))

(assert (=> bs!5666 m!119195))

(assert (=> start!14254 d!23594))

(declare-fun d!23596 () Bool)

(assert (=> d!23596 (= (array_inv!1254 (buf!1789 thiss!1379)) (bvsge (size!1408 (buf!1789 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74197 d!23596))

(push 1)

(assert (not b!74230))

(assert (not b!74228))

(assert (not d!23578))

(assert (not d!23588))

(assert (not d!23594))

(assert (not d!23582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

