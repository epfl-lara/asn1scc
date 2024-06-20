; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56264 () Bool)

(assert start!56264)

(declare-fun res!218101 () Bool)

(declare-fun e!181036 () Bool)

(assert (=> start!56264 (=> (not res!218101) (not e!181036))))

(declare-datatypes ((array!14329 0))(
  ( (array!14330 (arr!7254 (Array (_ BitVec 32) (_ BitVec 8))) (size!6267 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11456 0))(
  ( (BitStream!11457 (buf!6789 array!14329) (currentByte!12486 (_ BitVec 32)) (currentBit!12481 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11456)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56264 (= res!218101 (validate_offset_bit!0 ((_ sign_extend 32) (size!6267 (buf!6789 thiss!914))) ((_ sign_extend 32) (currentByte!12486 thiss!914)) ((_ sign_extend 32) (currentBit!12481 thiss!914))))))

(assert (=> start!56264 e!181036))

(declare-fun e!181035 () Bool)

(declare-fun inv!12 (BitStream!11456) Bool)

(assert (=> start!56264 (and (inv!12 thiss!914) e!181035)))

(assert (=> start!56264 true))

(declare-fun b!260547 () Bool)

(declare-datatypes ((Unit!18515 0))(
  ( (Unit!18516) )
))
(declare-datatypes ((tuple2!22332 0))(
  ( (tuple2!22333 (_1!12102 Unit!18515) (_2!12102 BitStream!11456)) )
))
(declare-fun lt!402679 () tuple2!22332)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!260547 (= e!181036 (not (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6267 (buf!6789 (_2!12102 lt!402679)))) ((_ sign_extend 32) (currentByte!12486 (_2!12102 lt!402679))) ((_ sign_extend 32) (currentBit!12481 (_2!12102 lt!402679)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayRangesEq!934 (array!14329 array!14329 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260547 (arrayRangesEq!934 (buf!6789 thiss!914) (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))) (size!6267 (buf!6789 thiss!914))) #b00000000000000000000000000000000 (currentByte!12486 (_2!12102 lt!402679)))))

(declare-fun lt!402680 () Unit!18515)

(declare-fun arrayUpdatedAtPrefixLemma!450 (array!14329 (_ BitVec 32) (_ BitVec 8)) Unit!18515)

(assert (=> b!260547 (= lt!402680 (arrayUpdatedAtPrefixLemma!450 (buf!6789 thiss!914) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18517 () Unit!18515)

(declare-fun Unit!18518 () Unit!18515)

(assert (=> b!260547 (= lt!402679 (ite b!187 (tuple2!22333 Unit!18517 (BitStream!11457 (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12481 thiss!914)))))) (size!6267 (buf!6789 thiss!914))) (currentByte!12486 thiss!914) (currentBit!12481 thiss!914))) (tuple2!22333 Unit!18518 (BitStream!11457 (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12481 thiss!914))))))) (size!6267 (buf!6789 thiss!914))) (currentByte!12486 thiss!914) (currentBit!12481 thiss!914)))))))

(declare-fun b!260548 () Bool)

(declare-fun array_inv!6008 (array!14329) Bool)

(assert (=> b!260548 (= e!181035 (array_inv!6008 (buf!6789 thiss!914)))))

(assert (= (and start!56264 res!218101) b!260547))

(assert (= start!56264 b!260548))

(declare-fun m!389901 () Bool)

(assert (=> start!56264 m!389901))

(declare-fun m!389903 () Bool)

(assert (=> start!56264 m!389903))

(declare-fun m!389905 () Bool)

(assert (=> b!260547 m!389905))

(declare-fun m!389907 () Bool)

(assert (=> b!260547 m!389907))

(declare-fun m!389909 () Bool)

(assert (=> b!260547 m!389909))

(declare-fun m!389911 () Bool)

(assert (=> b!260547 m!389911))

(declare-fun m!389913 () Bool)

(assert (=> b!260547 m!389913))

(assert (=> b!260547 m!389913))

(declare-fun m!389915 () Bool)

(assert (=> b!260547 m!389915))

(declare-fun m!389917 () Bool)

(assert (=> b!260547 m!389917))

(declare-fun m!389919 () Bool)

(assert (=> b!260547 m!389919))

(declare-fun m!389921 () Bool)

(assert (=> b!260547 m!389921))

(declare-fun m!389923 () Bool)

(assert (=> b!260548 m!389923))

(push 1)

(assert (not b!260547))

(assert (not start!56264))

(assert (not b!260548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87492 () Bool)

(assert (=> d!87492 (= (remainingBits!0 ((_ sign_extend 32) (size!6267 (buf!6789 (_2!12102 lt!402679)))) ((_ sign_extend 32) (currentByte!12486 (_2!12102 lt!402679))) ((_ sign_extend 32) (currentBit!12481 (_2!12102 lt!402679)))) (bvsub (bvmul ((_ sign_extend 32) (size!6267 (buf!6789 (_2!12102 lt!402679)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12486 (_2!12102 lt!402679))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12481 (_2!12102 lt!402679))))))))

(assert (=> b!260547 d!87492))

(declare-fun d!87496 () Bool)

(declare-fun res!218121 () Bool)

(declare-fun e!181056 () Bool)

(assert (=> d!87496 (=> res!218121 e!181056)))

(assert (=> d!87496 (= res!218121 (= #b00000000000000000000000000000000 (currentByte!12486 (_2!12102 lt!402679))))))

(assert (=> d!87496 (= (arrayRangesEq!934 (buf!6789 thiss!914) (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))) (size!6267 (buf!6789 thiss!914))) #b00000000000000000000000000000000 (currentByte!12486 (_2!12102 lt!402679))) e!181056)))

(declare-fun b!260568 () Bool)

(declare-fun e!181057 () Bool)

(assert (=> b!260568 (= e!181056 e!181057)))

(declare-fun res!218122 () Bool)

(assert (=> b!260568 (=> (not res!218122) (not e!181057))))

(assert (=> b!260568 (= res!218122 (= (select (arr!7254 (buf!6789 thiss!914)) #b00000000000000000000000000000000) (select (arr!7254 (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))) (size!6267 (buf!6789 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260569 () Bool)

(assert (=> b!260569 (= e!181057 (arrayRangesEq!934 (buf!6789 thiss!914) (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))) (size!6267 (buf!6789 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12486 (_2!12102 lt!402679))))))

(assert (= (and d!87496 (not res!218121)) b!260568))

(assert (= (and b!260568 res!218122) b!260569))

(declare-fun m!389943 () Bool)

(assert (=> b!260568 m!389943))

(declare-fun m!389945 () Bool)

(assert (=> b!260568 m!389945))

(declare-fun m!389947 () Bool)

(assert (=> b!260569 m!389947))

(assert (=> b!260547 d!87496))

(declare-fun d!87504 () Bool)

(declare-fun e!181063 () Bool)

(assert (=> d!87504 e!181063))

(declare-fun res!218128 () Bool)

(assert (=> d!87504 (=> (not res!218128) (not e!181063))))

(assert (=> d!87504 (= res!218128 (and (bvsge (currentByte!12486 (_2!12102 lt!402679)) #b00000000000000000000000000000000) (bvslt (currentByte!12486 (_2!12102 lt!402679)) (size!6267 (buf!6789 thiss!914)))))))

(declare-fun lt!402689 () Unit!18515)

(declare-fun choose!344 (array!14329 (_ BitVec 32) (_ BitVec 8)) Unit!18515)

(assert (=> d!87504 (= lt!402689 (choose!344 (buf!6789 thiss!914) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))))))

(assert (=> d!87504 (and (bvsle #b00000000000000000000000000000000 (currentByte!12486 (_2!12102 lt!402679))) (bvslt (currentByte!12486 (_2!12102 lt!402679)) (size!6267 (buf!6789 thiss!914))))))

(assert (=> d!87504 (= (arrayUpdatedAtPrefixLemma!450 (buf!6789 thiss!914) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))) lt!402689)))

(declare-fun b!260575 () Bool)

(assert (=> b!260575 (= e!181063 (arrayRangesEq!934 (buf!6789 thiss!914) (array!14330 (store (arr!7254 (buf!6789 thiss!914)) (currentByte!12486 (_2!12102 lt!402679)) (select (arr!7254 (buf!6789 (_2!12102 lt!402679))) (currentByte!12486 (_2!12102 lt!402679)))) (size!6267 (buf!6789 thiss!914))) #b00000000000000000000000000000000 (currentByte!12486 (_2!12102 lt!402679))))))

(assert (= (and d!87504 res!218128) b!260575))

(assert (=> d!87504 m!389913))

(declare-fun m!389955 () Bool)

(assert (=> d!87504 m!389955))

(assert (=> b!260575 m!389911))

(assert (=> b!260575 m!389907))

(assert (=> b!260547 d!87504))

(declare-fun d!87512 () Bool)

(assert (=> d!87512 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6267 (buf!6789 thiss!914))) ((_ sign_extend 32) (currentByte!12486 thiss!914)) ((_ sign_extend 32) (currentBit!12481 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6267 (buf!6789 thiss!914))) ((_ sign_extend 32) (currentByte!12486 thiss!914)) ((_ sign_extend 32) (currentBit!12481 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22182 () Bool)

(assert (= bs!22182 d!87512))

(declare-fun m!389957 () Bool)

(assert (=> bs!22182 m!389957))

(assert (=> start!56264 d!87512))

(declare-fun d!87514 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87514 (= (inv!12 thiss!914) (invariant!0 (currentBit!12481 thiss!914) (currentByte!12486 thiss!914) (size!6267 (buf!6789 thiss!914))))))

(declare-fun bs!22183 () Bool)

(assert (= bs!22183 d!87514))

(declare-fun m!389959 () Bool)

(assert (=> bs!22183 m!389959))

(assert (=> start!56264 d!87514))

(declare-fun d!87516 () Bool)

(assert (=> d!87516 (= (array_inv!6008 (buf!6789 thiss!914)) (bvsge (size!6267 (buf!6789 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260548 d!87516))

(push 1)

(assert (not b!260569))

(assert (not d!87514))

(assert (not b!260575))

(assert (not d!87512))

(assert (not d!87504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

