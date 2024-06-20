; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17016 () Bool)

(assert start!17016)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!132794 () (_ BitVec 64))

(declare-fun lt!132795 () (_ BitVec 64))

(declare-fun b!83288 () Bool)

(declare-fun e!55323 () Bool)

(assert (=> b!83288 (= e!55323 (and (= lt!132795 (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!132795 (bvand (bvadd lt!132794 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!83288 (= lt!132795 (bvand lt!132794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!3814 0))(
  ( (array!3815 (arr!2374 (Array (_ BitVec 32) (_ BitVec 8))) (size!1737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3036 0))(
  ( (BitStream!3037 (buf!2127 array!3814) (currentByte!4215 (_ BitVec 32)) (currentBit!4210 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3036)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83288 (= lt!132794 (bitIndex!0 (size!1737 (buf!2127 b1!98)) (currentByte!4215 b1!98) (currentBit!4210 b1!98)))))

(declare-fun res!68527 () Bool)

(assert (=> start!17016 (=> (not res!68527) (not e!55323))))

(declare-fun b2!98 () BitStream!3036)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!17016 (= res!68527 (and (= (size!1737 (buf!2127 b1!98)) (size!1737 (buf!2127 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17016 e!55323))

(declare-fun e!55324 () Bool)

(declare-fun inv!12 (BitStream!3036) Bool)

(assert (=> start!17016 (and (inv!12 b1!98) e!55324)))

(declare-fun e!55322 () Bool)

(assert (=> start!17016 (and (inv!12 b2!98) e!55322)))

(assert (=> start!17016 true))

(declare-fun b!83287 () Bool)

(declare-fun res!68526 () Bool)

(assert (=> b!83287 (=> (not res!68526) (not e!55323))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83287 (= res!68526 (validate_offset_bits!1 ((_ sign_extend 32) (size!1737 (buf!2127 b1!98))) ((_ sign_extend 32) (currentByte!4215 b1!98)) ((_ sign_extend 32) (currentBit!4210 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83290 () Bool)

(declare-fun array_inv!1583 (array!3814) Bool)

(assert (=> b!83290 (= e!55322 (array_inv!1583 (buf!2127 b2!98)))))

(declare-fun b!83289 () Bool)

(assert (=> b!83289 (= e!55324 (array_inv!1583 (buf!2127 b1!98)))))

(assert (= (and start!17016 res!68527) b!83287))

(assert (= (and b!83287 res!68526) b!83288))

(assert (= start!17016 b!83289))

(assert (= start!17016 b!83290))

(declare-fun m!129855 () Bool)

(assert (=> b!83290 m!129855))

(declare-fun m!129857 () Bool)

(assert (=> b!83287 m!129857))

(declare-fun m!129859 () Bool)

(assert (=> b!83288 m!129859))

(declare-fun m!129861 () Bool)

(assert (=> start!17016 m!129861))

(declare-fun m!129863 () Bool)

(assert (=> start!17016 m!129863))

(declare-fun m!129865 () Bool)

(assert (=> b!83289 m!129865))

(check-sat (not start!17016) (not b!83287) (not b!83290) (not b!83288) (not b!83289))
(check-sat)
(get-model)

(declare-fun d!26596 () Bool)

(assert (=> d!26596 (= (array_inv!1583 (buf!2127 b2!98)) (bvsge (size!1737 (buf!2127 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83290 d!26596))

(declare-fun d!26598 () Bool)

(assert (=> d!26598 (= (array_inv!1583 (buf!2127 b1!98)) (bvsge (size!1737 (buf!2127 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83289 d!26598))

(declare-fun d!26600 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26600 (= (inv!12 b1!98) (invariant!0 (currentBit!4210 b1!98) (currentByte!4215 b1!98) (size!1737 (buf!2127 b1!98))))))

(declare-fun bs!6538 () Bool)

(assert (= bs!6538 d!26600))

(declare-fun m!129879 () Bool)

(assert (=> bs!6538 m!129879))

(assert (=> start!17016 d!26600))

(declare-fun d!26602 () Bool)

(assert (=> d!26602 (= (inv!12 b2!98) (invariant!0 (currentBit!4210 b2!98) (currentByte!4215 b2!98) (size!1737 (buf!2127 b2!98))))))

(declare-fun bs!6539 () Bool)

(assert (= bs!6539 d!26602))

(declare-fun m!129881 () Bool)

(assert (=> bs!6539 m!129881))

(assert (=> start!17016 d!26602))

(declare-fun d!26604 () Bool)

(declare-fun e!55344 () Bool)

(assert (=> d!26604 e!55344))

(declare-fun res!68538 () Bool)

(assert (=> d!26604 (=> (not res!68538) (not e!55344))))

(declare-fun lt!132819 () (_ BitVec 64))

(declare-fun lt!132814 () (_ BitVec 64))

(declare-fun lt!132818 () (_ BitVec 64))

(assert (=> d!26604 (= res!68538 (= lt!132818 (bvsub lt!132819 lt!132814)))))

(assert (=> d!26604 (or (= (bvand lt!132819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132819 lt!132814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!26604 (= lt!132814 (remainingBits!0 ((_ sign_extend 32) (size!1737 (buf!2127 b1!98))) ((_ sign_extend 32) (currentByte!4215 b1!98)) ((_ sign_extend 32) (currentBit!4210 b1!98))))))

(declare-fun lt!132816 () (_ BitVec 64))

(declare-fun lt!132815 () (_ BitVec 64))

(assert (=> d!26604 (= lt!132819 (bvmul lt!132816 lt!132815))))

(assert (=> d!26604 (or (= lt!132816 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132815 (bvsdiv (bvmul lt!132816 lt!132815) lt!132816)))))

(assert (=> d!26604 (= lt!132815 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26604 (= lt!132816 ((_ sign_extend 32) (size!1737 (buf!2127 b1!98))))))

(assert (=> d!26604 (= lt!132818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4215 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4210 b1!98))))))

(assert (=> d!26604 (invariant!0 (currentBit!4210 b1!98) (currentByte!4215 b1!98) (size!1737 (buf!2127 b1!98)))))

(assert (=> d!26604 (= (bitIndex!0 (size!1737 (buf!2127 b1!98)) (currentByte!4215 b1!98) (currentBit!4210 b1!98)) lt!132818)))

(declare-fun b!83307 () Bool)

(declare-fun res!68539 () Bool)

(assert (=> b!83307 (=> (not res!68539) (not e!55344))))

(assert (=> b!83307 (= res!68539 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132818))))

(declare-fun b!83308 () Bool)

(declare-fun lt!132817 () (_ BitVec 64))

(assert (=> b!83308 (= e!55344 (bvsle lt!132818 (bvmul lt!132817 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83308 (or (= lt!132817 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132817 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132817)))))

(assert (=> b!83308 (= lt!132817 ((_ sign_extend 32) (size!1737 (buf!2127 b1!98))))))

(assert (= (and d!26604 res!68538) b!83307))

(assert (= (and b!83307 res!68539) b!83308))

(declare-fun m!129887 () Bool)

(assert (=> d!26604 m!129887))

(assert (=> d!26604 m!129879))

(assert (=> b!83288 d!26604))

(declare-fun d!26616 () Bool)

(assert (=> d!26616 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1737 (buf!2127 b1!98))) ((_ sign_extend 32) (currentByte!4215 b1!98)) ((_ sign_extend 32) (currentBit!4210 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1737 (buf!2127 b1!98))) ((_ sign_extend 32) (currentByte!4215 b1!98)) ((_ sign_extend 32) (currentBit!4210 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6542 () Bool)

(assert (= bs!6542 d!26616))

(assert (=> bs!6542 m!129887))

(assert (=> b!83287 d!26616))

(check-sat (not d!26602) (not d!26604) (not d!26616) (not d!26600))
