; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17018 () Bool)

(assert start!17018)

(declare-fun b!83299 () Bool)

(declare-fun res!68532 () Bool)

(declare-fun e!55339 () Bool)

(assert (=> b!83299 (=> (not res!68532) (not e!55339))))

(declare-datatypes ((array!3816 0))(
  ( (array!3817 (arr!2375 (Array (_ BitVec 32) (_ BitVec 8))) (size!1738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3038 0))(
  ( (BitStream!3039 (buf!2128 array!3816) (currentByte!4216 (_ BitVec 32)) (currentBit!4211 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3038)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83299 (= res!68532 (validate_offset_bits!1 ((_ sign_extend 32) (size!1738 (buf!2128 b1!98))) ((_ sign_extend 32) (currentByte!4216 b1!98)) ((_ sign_extend 32) (currentBit!4211 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83302 () Bool)

(declare-fun e!55341 () Bool)

(declare-fun b2!98 () BitStream!3038)

(declare-fun array_inv!1584 (array!3816) Bool)

(assert (=> b!83302 (= e!55341 (array_inv!1584 (buf!2128 b2!98)))))

(declare-fun b!83301 () Bool)

(declare-fun e!55337 () Bool)

(assert (=> b!83301 (= e!55337 (array_inv!1584 (buf!2128 b1!98)))))

(declare-fun res!68533 () Bool)

(assert (=> start!17018 (=> (not res!68533) (not e!55339))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!17018 (= res!68533 (and (= (size!1738 (buf!2128 b1!98)) (size!1738 (buf!2128 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17018 e!55339))

(declare-fun inv!12 (BitStream!3038) Bool)

(assert (=> start!17018 (and (inv!12 b1!98) e!55337)))

(assert (=> start!17018 (and (inv!12 b2!98) e!55341)))

(assert (=> start!17018 true))

(declare-fun lt!132800 () (_ BitVec 64))

(declare-fun lt!132801 () (_ BitVec 64))

(declare-fun b!83300 () Bool)

(assert (=> b!83300 (= e!55339 (and (= lt!132801 (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!132801 (bvand (bvadd lt!132800 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!83300 (= lt!132801 (bvand lt!132800 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83300 (= lt!132800 (bitIndex!0 (size!1738 (buf!2128 b1!98)) (currentByte!4216 b1!98) (currentBit!4211 b1!98)))))

(assert (= (and start!17018 res!68533) b!83299))

(assert (= (and b!83299 res!68532) b!83300))

(assert (= start!17018 b!83301))

(assert (= start!17018 b!83302))

(declare-fun m!129867 () Bool)

(assert (=> start!17018 m!129867))

(declare-fun m!129869 () Bool)

(assert (=> start!17018 m!129869))

(declare-fun m!129871 () Bool)

(assert (=> b!83300 m!129871))

(declare-fun m!129873 () Bool)

(assert (=> b!83302 m!129873))

(declare-fun m!129875 () Bool)

(assert (=> b!83301 m!129875))

(declare-fun m!129877 () Bool)

(assert (=> b!83299 m!129877))

(push 1)

(assert (not b!83299))

(assert (not start!17018))

(assert (not b!83301))

(assert (not b!83300))

(assert (not b!83302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26618 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!26618 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1738 (buf!2128 b1!98))) ((_ sign_extend 32) (currentByte!4216 b1!98)) ((_ sign_extend 32) (currentBit!4211 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1738 (buf!2128 b1!98))) ((_ sign_extend 32) (currentByte!4216 b1!98)) ((_ sign_extend 32) (currentBit!4211 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6543 () Bool)

(assert (= bs!6543 d!26618))

(declare-fun m!129891 () Bool)

(assert (=> bs!6543 m!129891))

(assert (=> b!83299 d!26618))

(declare-fun d!26622 () Bool)

(assert (=> d!26622 (= (array_inv!1584 (buf!2128 b2!98)) (bvsge (size!1738 (buf!2128 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83302 d!26622))

(declare-fun d!26624 () Bool)

(assert (=> d!26624 (= (array_inv!1584 (buf!2128 b1!98)) (bvsge (size!1738 (buf!2128 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83301 d!26624))

(declare-fun d!26626 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26626 (= (inv!12 b1!98) (invariant!0 (currentBit!4211 b1!98) (currentByte!4216 b1!98) (size!1738 (buf!2128 b1!98))))))

(declare-fun bs!6545 () Bool)

(assert (= bs!6545 d!26626))

(declare-fun m!129893 () Bool)

(assert (=> bs!6545 m!129893))

(assert (=> start!17018 d!26626))

(declare-fun d!26628 () Bool)

(assert (=> d!26628 (= (inv!12 b2!98) (invariant!0 (currentBit!4211 b2!98) (currentByte!4216 b2!98) (size!1738 (buf!2128 b2!98))))))

(declare-fun bs!6546 () Bool)

(assert (= bs!6546 d!26628))

(declare-fun m!129895 () Bool)

(assert (=> bs!6546 m!129895))

(assert (=> start!17018 d!26628))

(declare-fun d!26630 () Bool)

(declare-fun e!55350 () Bool)

(assert (=> d!26630 e!55350))

(declare-fun res!68551 () Bool)

(assert (=> d!26630 (=> (not res!68551) (not e!55350))))

(declare-fun lt!132850 () (_ BitVec 64))

(declare-fun lt!132854 () (_ BitVec 64))

(declare-fun lt!132851 () (_ BitVec 64))

(assert (=> d!26630 (= res!68551 (= lt!132850 (bvsub lt!132851 lt!132854)))))

(assert (=> d!26630 (or (= (bvand lt!132851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132851 lt!132854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26630 (= lt!132854 (remainingBits!0 ((_ sign_extend 32) (size!1738 (buf!2128 b1!98))) ((_ sign_extend 32) (currentByte!4216 b1!98)) ((_ sign_extend 32) (currentBit!4211 b1!98))))))

(declare-fun lt!132852 () (_ BitVec 64))

(declare-fun lt!132853 () (_ BitVec 64))

(assert (=> d!26630 (= lt!132851 (bvmul lt!132852 lt!132853))))

(assert (=> d!26630 (or (= lt!132852 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132853 (bvsdiv (bvmul lt!132852 lt!132853) lt!132852)))))

(assert (=> d!26630 (= lt!132853 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26630 (= lt!132852 ((_ sign_extend 32) (size!1738 (buf!2128 b1!98))))))

(assert (=> d!26630 (= lt!132850 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4216 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4211 b1!98))))))

(assert (=> d!26630 (invariant!0 (currentBit!4211 b1!98) (currentByte!4216 b1!98) (size!1738 (buf!2128 b1!98)))))

(assert (=> d!26630 (= (bitIndex!0 (size!1738 (buf!2128 b1!98)) (currentByte!4216 b1!98) (currentBit!4211 b1!98)) lt!132850)))

(declare-fun b!83319 () Bool)

(declare-fun res!68550 () Bool)

(assert (=> b!83319 (=> (not res!68550) (not e!55350))))

(assert (=> b!83319 (= res!68550 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132850))))

(declare-fun b!83320 () Bool)

(declare-fun lt!132855 () (_ BitVec 64))

(assert (=> b!83320 (= e!55350 (bvsle lt!132850 (bvmul lt!132855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83320 (or (= lt!132855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132855)))))

(assert (=> b!83320 (= lt!132855 ((_ sign_extend 32) (size!1738 (buf!2128 b1!98))))))

(assert (= (and d!26630 res!68551) b!83319))

(assert (= (and b!83319 res!68550) b!83320))

(assert (=> d!26630 m!129891))

(assert (=> d!26630 m!129893))

(assert (=> b!83300 d!26630))

(push 1)

(assert (not d!26628))

(assert (not d!26618))

(assert (not d!26630))

(assert (not d!26626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

